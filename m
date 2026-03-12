Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9BD106ACE7
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2026 20:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2pWby7tRTaFMLCxNO3vkJZ08S+rk6Df/iLShGmtlipk=; b=rcNuykXdVchSy2VVdqURjhHdE0
	KBOxpqLLlvvrrDgIFEWnWyo4GX57tYWQz/wKVXpksBRtk0faPsbg84iqX6HY3y32X3iXWcCZfRXnW
	uwfeEZWpqRiRZXJEY6uoYMmqfkGRxk73L98y0cddM9QdJ80M3Ep2bFviFkROFTLgoBuO+qQ+e+IKy
	hOMDy5NQEFxwXNr+Y7EfNg7/tB4SWygXznkVAzK61VvF3a14xKdbLOmFbwqtqc//gYmIIMoqNcQv6
	naivdm75jm3ItMm33qZbVul8aU0Uh1ft5jD00O++eEJQz4pr/WzTw9puUpA0FPPVdMX+IKewMnqY5
	DIMRd/zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0mJW-0000000FDbG-3gD6;
	Thu, 12 Mar 2026 20:07:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0mJR-0000000FDWc-1NGb
	for linux-mediatek@bombadil.infradead.org;
	Thu, 12 Mar 2026 20:07:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-Id:Date:References:In-Reply-To
	:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2pWby7tRTaFMLCxNO3vkJZ08S+rk6Df/iLShGmtlipk=; b=JYrkvrboYuyZOqnpJIQ10JXEsI
	rURy81qmCWESpqQwUmggMwMd6jy6mcMBA+CpeG1cdCNU4+gzyWUt+t0CHI0As9jMQkRJ9kpEBzR9U
	CefAzbf9+4Fxerq6dsDmmZ951MEZiUAZshRiQoK1KXD3VK4xEwPj42Ar++RdPJPRLOuFr7mjPtZgU
	CvR2Ft0NQ8JZrJFb51AJcG/CX83bIxswrcXZhOdkRtwQi4gUBpD9Z0NhFwQO7gg8MHvr3x48VCZLT
	MTO+3W/LgOiNqAayaNJ9+Yq25u6nxgwd0KNfmLELrdQ2EulHRSTTa594zGWr2rTdECEzRgwo1fyHg
	faqGxC2w==;
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0mJM-00000001xjg-0xgP
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Mar 2026 20:07:15 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-40ee9b945d5so948185fac.0
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Mar 2026 13:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773346030; x=1773950830; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pWby7tRTaFMLCxNO3vkJZ08S+rk6Df/iLShGmtlipk=;
        b=l6UUQJMS57KqszHkoHD+Ur5FeEcQH9bKaazyrdYr5Jj25Oe5Vvgj2TxXDhdfTqLZzE
         nAa1jhFqIVWPnlOiYG+k7PjYc0+2+Op1HESRqZeVFeGTLPE3ChwG+3ElD1+X+Hra7oLT
         eELMEKwB6mdTLUdKcZP5sqy5VPUnsy4zLjMDSAPWFvFZ/dTeyByDRmqBaoUk7LoT5TbQ
         hHIf5oAj4b4qDHhfqBX7IEJRJ88nM8kZMY+H44FCM3OXy1PWqCZ1Vu8btNFstYnTDKpr
         CyWn2qErPTiXRwXv40UstwQbdgYAGqOxE1MOBoaUTH2Tf7AZmd8z3IXz6ppnfNtCTP88
         AALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773346030; x=1773950830;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2pWby7tRTaFMLCxNO3vkJZ08S+rk6Df/iLShGmtlipk=;
        b=a4Nq+quUxR/6WpIxWnl/C+NNtL2WSh1dvdilIk4KOba+OMm0ueUWRKX0e0gnXHthvj
         ZMjRMtUE3GKtNAyT+oG5nCguZgd1XIMcV9pMnp2WQe8DvfTtZDfhY/LsFvZ0HGsOe9e3
         P2BpOpAuaBFUghqKhB0et0S7UOaRS+2fhHQzUklGPB7U/ZiwNtKYcsD3lPxgzYBXTwxQ
         imADha611q28G1kWr+tynXxS0AeKTPkIZYwLmS60xQcWZ+xYXx90s2euuU9PbgoQl6Xr
         l7uEIjL9kB3uciQY0gaIcCFDMLIizpkBYRSVyIX6XYhPC3/khtnMvhc4DSnBAo8aIbEt
         bklw==
X-Forwarded-Encrypted: i=1; AJvYcCUWuSeKgjWAi2TBd2/blmc5uI/lleyFOfXeX+a6YnfsRvkL/f8zFLaWsB3wyxvC7l13IfMGGcVPZ+gKqpaEkg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKhLmWElK6dSQsdu7+djycaV0PUnvLqGsIc7WLYPv60NjP1S6Z
	O4vaZxqbEzk9Sq0SLeI0LCh39/ikE4/kCkFc7gviXXS+HcGfpXCohLtMrpx9rIZkCnY=
X-Gm-Gg: ATEYQzxkI0Cki463PFN4HrzOIb0VxxTOYEomZ4d2U5EIOj/cQhj0BM55VcIGbYjP+SI
	06OvUdVCDqDHM2+PSRnzoQes/OXANV7Dg9Lhzw9Sf8e/p6AP29vy0bqFvyGFpvWt662h9Zc7dX1
	IWytbZ2UjgHqOC5Ibd/cYw6UTgnuZVD4+IVKSMUKu3YrcFuCm/FQwx8xu8ePAO24JreQIk1l3u1
	/RMxIA0zhjkNA7tg5gvoPqyvGCm4pmvJmGgHaPHxadgs6oezcX7IQ0Q/Xhz1OPL6JjiZwoSrTPe
	umy5qtrPW+J/izSuhAzMRPd1dPzQ6h1pceO/NmSoi6hgTZUcTJ9C9tBkdibs2iMAroT7yNsPwql
	HlOU6hOLzL9pdcdx2uszPt2CMJWBksMfDAOOuZhOQ+Esc2MhmW7iYOMFzr/M+NQKvBhx4O96tuz
	Y4QB83fgo1JuZjoo2D2ufZHmxwO/Jh
X-Received: by 2002:a05:6870:a796:b0:3e8:8b6f:9d85 with SMTP id 586e51a60fabf-417b937d46cmr332682fac.29.1773346030308;
        Thu, 12 Mar 2026 13:07:10 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:1f95:f82e:8747:8137])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e6c7885sm5600081fac.17.2026.03.12.13.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 13:07:09 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 03/18] clk: mediatek: Add MT8189 apmixedsys clock
 support
From: David Lechner <dlechner@baylibre.com>
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Qiqi Wang <qiqi.wang@mediatek.com>, sirius.wang@mediatek.com, 
 vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
In-Reply-To: <20260309120512.3624804-4-irving-ch.lin@mediatek.com>
References: <20260309120512.3624804-1-irving-ch.lin@mediatek.com>
 <20260309120512.3624804-4-irving-ch.lin@mediatek.com>
Date: Thu, 12 Mar 2026 15:06:36 -0500
Message-Id: <177334599652.4124794.495599695131479130@freyr>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1679; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=mkPn6azSc5sBdNjIBFEPFL6chM6v748TKJtFgSgI6eQ=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBpsxzdMiMJbTxqXDno8lz7uKeJqq/XgEtUTcoAy
 ZhkKwBwxnOJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCabMc3QAKCRDCzCAB/wGP
 wFqcB/48FpvKpV3InEamRZjYBZWJ6fLi/SAwUkbGJyUmItM/vnWwftYkuxXm1sC369JhkJ6LTZ6
 YfgivaaIA/87e8AwAr90CJKmSjB91XqNMT4+0k8RYkN+77VvJcZ2apyV/geYv8E1R7u7nT8gr0m
 fsxRyDy7ZrMFdpc8ENod3K9Tt/ord3fYSSeyUQBCbbZUha8Gsrh4ptu2rpCErKtQ6Vigzdjiw1z
 o+eTFnGlkzvD7rcJLxm1Qp8UAeRgvqtYIFmydhZNYocG71l1fIEkKe+XDpvnBMkYyj3dW1+mP+Z
 1SKiymojf8wZ+PdFx4HI3agvkAyfo/sl9yqVkSAZvBJAm859
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_200712_374549_D9EEBBD4 
X-CRM114-Status: GOOD (  12.15  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 09 Mar 2026 20:04:45 +0800, irving.ch.lin <irving-ch.lin@mediatek.com> wrote:
> Add support for the MT8189 apmixedsys clock controller, which provides
> PLLs generated from SoC 26m.
> 

...

> +static int clk_mt8189_apmixed_probe(struct platform_device *pdev)
> +{
> +	int r;
> +	struct clk_hw_onecell_data *clk_data;
> +	struct device_node *node = pdev->dev.of_node;
> +	const u8 *fhctl_node = "mediatek,mt8189-fhctl";
> +
> +	clk_data = mtk_alloc_clk_data(ARRAY_SIZE(apmixed_plls));
> +	if (!clk_data)
> +		return -ENOMEM;
> +
> +	fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
> +
> +	r = mtk_clk_register_pllfhs(&pdev->dev, apmixed_plls, ARRAY_SIZE(apmixed_plls),
> +				    pllfhs, ARRAY_SIZE(pllfhs), clk_data);
> +	if (r)
> +		goto free_apmixed_data;
> +
> +	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
> +	if (r)
> +		goto unregister_plls;
> +
> +	platform_set_drvdata(pdev, clk_data);
> +
> +	return 0;
> +
> +unregister_plls:
> +	mtk_clk_unregister_plls(apmixed_plls, ARRAY_SIZE(apmixed_plls),

Should this be mtk_clk_unregister_pllfhs()?

> +				clk_data);
> +free_apmixed_data:
> +	mtk_free_clk_data(clk_data);
> +	return r;
> +}
> +
> +static void clk_mt8189_apmixed_remove(struct platform_device *pdev)
> +{
> +	struct device_node *node = pdev->dev.of_node;
> +	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
> +
> +	of_clk_del_provider(node);
> +	mtk_clk_unregister_pllfhs(apmixed_plls, ARRAY_SIZE(apmixed_plls), pllfhs,
> +				  ARRAY_SIZE(pllfhs), clk_data);
> +	mtk_free_clk_data(clk_data);
> +}
> +

-- 
David Lechner <dlechner@baylibre.com>

