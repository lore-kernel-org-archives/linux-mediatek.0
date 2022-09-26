Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39BBC6FA86
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 03:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQsxXFVnnycu0Ai4HAskpMNXUco0LHrZ9qALshiE0Kk=; b=dLdSajoQiwH1DAat4aba/eUoJ7
	dMEYILHVUGK8rhKfFFNpdVXeYbB56r2RpwbuG4zV3wpTNkNtbbQ8BjiU3gQ3t5APAOWQCQKnA8Jnk
	pLaYXPQecwTclTZODa09HItQoVy7AwenpcA2K+jUL2bOFVM7ruwa272qMObZpspp/mXHvs+Uusumn
	dwVJAvOua+6NlVGYNik2SC6DLZ6iFvZ4DW2KPBh0EylCuQiYbiJaVFmbd82g3JLj3RDFIlpSMZD0I
	qfWff9SatjboZeqQhwnd8l3/FBJfbF4WDEbRY1vVnuY97GwHmTaCjWSd/n7pqMYS1vQe/gTY9qCi3
	Y2PdRsaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oceh8-001L5T-Gb; Mon, 26 Sep 2022 03:22:10 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oceh6-001L2C-0U
	for linux-mediatek@lists.infradead.org; Mon, 26 Sep 2022 03:22:09 +0000
Received: by mail-ed1-x530.google.com with SMTP id z13so7180241edb.13
        for <linux-mediatek@lists.infradead.org>; Sun, 25 Sep 2022 20:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=yQsxXFVnnycu0Ai4HAskpMNXUco0LHrZ9qALshiE0Kk=;
        b=TVddU5EuFj2t8KIz7T3zCcDHTC4WeulJBoHq9EOsixQxw9p+2NBuF8VMquNFeDbozy
         G0mxNI+BTMiiYOluXsqZBzifT5mNk4PwqWXe9qc/RUX++dzObFco3u6ohP87bJ2o7kt3
         tA7AC7/8JQ0rMS6oFMZfwH6xivu21fXZrzUxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=yQsxXFVnnycu0Ai4HAskpMNXUco0LHrZ9qALshiE0Kk=;
        b=KaarBf13C1cyTnqbtA4uhvZAG++42kOIvbKXzwONy5JnOCO2OoCJ8wca2TocTfrv7b
         wvBJ7I8iGOcAPz6OWXKhFpZQl+jtmRY2lH2HFs+rfHoQUXNjc6QV98jcQpSdhtnVM+vd
         2DzsGFcalqIcRdFntHC8bzXzh1Cf6w2scG+d6QTbdOPe585sNk6/QBIZYnK/sSRReDhp
         hWUHQ++NxsdvadwjAw2nF6nhe8CCSjIgqglp1M1Xp3/ZKemm+Jgg/lHWF2BPkAr8a6RY
         mHhFWjrhbVTqlPbPdH0b1f8s+gkuH5MRIqCE3L2f6SEjm3OVHIUofEhqaMvKVJIKp/C2
         P3bw==
X-Gm-Message-State: ACrzQf3bT5sF9iE8Wc9+jERvkQhJRKMjE5VUPZOIcfoBAjKK1TOcQJF2
	x2m6TxKJa7P4u1yHJXbzh+/oU7jdA41QxHWD5CO2hg==
X-Google-Smtp-Source: AMsMyM4D/ZSyLsYSyu8xNz2kCJSqJ/H1GIkKLJy/AFRCNUaeLI2dpgccDtbydmm91X48YfUGORxcS3U01CQX45V/rng=
X-Received: by 2002:aa7:cc02:0:b0:453:b0f3:9927 with SMTP id
 q2-20020aa7cc02000000b00453b0f39927mr20858524edt.66.1664162524995; Sun, 25
 Sep 2022 20:22:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220915072458.18232-1-angelogioacchino.delregno@collabora.com> <20220915072458.18232-10-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220915072458.18232-10-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 26 Sep 2022 11:21:53 +0800
Message-ID: <CAGXv+5GwYEv2O70_3rjDmY=RHZ900x3RKSaFYqzb_nTumT+YoA@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] clk: mediatek: clk-mt8192-mfg: Propagate rate
 changes to parent
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	miles.chen@mediatek.com, rex-bc.chen@mediatek.com, nfraprado@collabora.com, 
	chun-jie.chen@mediatek.com, jose.exposito89@gmail.com, drinkcat@chromium.org, 
	weiyi.lu@mediatek.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220925_202208_069474_32472E1C 
X-CRM114-Status: UNSURE (   7.00  )
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

On Thu, Sep 15, 2022 at 3:25 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Following what was done on MT8183 and MT8195, also propagate the rate
> changes to MFG_BG3D's parent on MT8192 to allow for proper GPU DVFS.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

