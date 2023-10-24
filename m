Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABF2C25B47
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 09:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/6KTT677Fj+6j9NiGm8ZaAxogvUkXATayoSrNlGSNS0=; b=NTT1pNsWsSxUu9yR2WdpdYjk51
	o4K/b6m4GBHQ3NWrzvhxD25O7E8rxo9u7vtZ6CaAJ6xsD8zuxYwma8ebcrhc8oCcqWcjyZXCdnjLO
	0ZKBiqh8ZcPLlf0FP9c++x2pd6tcHsIIULDTxu8iSM0DBycWPmrMQcd6c9Up6wPcjYHIqBf4kp0bw
	tQsz4jyMqPEzM3GKdqsYTK+iQpuSk98esIckt5jwZLBHeHuMw+DIcthFCV+maNDcIAnhbiwC4wZ9l
	XByZUYay7Z6RzZGnix09MJVpw2xq+cZJUojqUtOsWkWiwyU6cnjQYVWnw0FJnHvOt7lGBn/K8VRxP
	XYbcIH7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvDeb-009Iae-1g;
	Tue, 24 Oct 2023 09:24:49 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvDeY-009IZU-2I;
	Tue, 24 Oct 2023 09:24:48 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B69C26603102;
	Tue, 24 Oct 2023 10:24:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698139485;
	bh=CAUfYWv2YFj91XMjH++uo8N0caauvtIZueuVlwW7mbo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q2vRtHctkDuGlt4k0zp+0BXBxiyfukhatXmuBJqcYzfgGaCIYCbbJmXkbbknOmKan
	 9BwzJrRl9ZdtfsypGKlWCl+lkA+IYn+WLtgF2Y+KTOJ2TYf1sf8k/RUmX/kgUo+GEc
	 0jmp8FprvOCcqT/AmxpOewj9+XrPBTxsOSUtuoD8oSgB1fiNYK0T20vvscfvGTpJ1C
	 vlcaZtEcemS4kp/QZdRDvp7AQOcTKaalkwQPB5jb60c50j1MAK2Jb1thmzlZZ+eUcW
	 4PpkgPGsi31/xlxoqf/p7DTrOafWnnfd0N8c7iYkUraQQCilVhl4Vq00kccbDHjDTL
	 7o/IPw5gQ68Lg==
Message-ID: <01a4467c-6a6e-472d-94bb-930ab12b5358@collabora.com>
Date: Tue, 24 Oct 2023 11:24:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: mediatek: fix double free in
 mtk_clk_register_pllfh()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Johnson Wang <johnson.wang@mediatek.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Edward-JW Yang <edward-jw.yang@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel-janitors@vger.kernel.org
References: <cd7fa365-28cc-4c34-ac64-6da57c98baa6@moroto.mountain>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <cd7fa365-28cc-4c34-ac64-6da57c98baa6@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_022446_879538_C67FCE87 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
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

Il 24/10/23 07:00, Dan Carpenter ha scritto:
> The mtk_clk_register_pll_ops() currently frees the "pll" parameter.
> The function has two callers, mtk_clk_register_pll() and
> mtk_clk_register_pllfh().  The first one, the _pll() function relies on
> the free, but for the second _pllfh() function it causes a double free
> bug.
> 
> Really the frees should be done in the caller because that's where
> the allocation is.
> 
> Fixes: d7964de8a8ea ("clk: mediatek: Add new clock driver to handle FHCTL hardware")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



