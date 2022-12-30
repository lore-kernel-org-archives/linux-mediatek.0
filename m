Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41301C4167B
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 08:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KPlTEqYa3MYCMl9BvqJcl9vvn2yJXyimwlsnQsWb80g=; b=zcOacLJPxCcDpGDY8EFgolsLQc
	x7/9jvJmRtUjybc8vzEpZWNUAAndM3iKkmq9gtHQYc0Ip6OnrEo7JmIK2YAnFjxwdcedHoI4ed2kp
	KQgR8RtLlkXVOF6pNPWdfbjay49neYQdD/AMcXiZvt9z5WeT1Kecctx2r1DpG+I5WcYMFrLSHK64K
	RjS3ZS22ZrmEJ/cjHell7L+aRz8qsy3U4W0TIx88qaTj6OJ6OxtbPnFoPh8KFYnTfJBUMXvfBaWek
	un+XBrRQp8fjsK6knNPlGKzyp+y0UIQXNp+VPq+ZXh1X2f37WvtURHEzOlBfk4zxTrXucigjcvxE2
	z3Taq4KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBAjz-007HpA-L7; Fri, 30 Dec 2022 08:27:47 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBAYf-007CcQ-1d
	for linux-mediatek@lists.infradead.org; Fri, 30 Dec 2022 08:16:07 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id k4so16542439vsc.4
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Dec 2022 00:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KPlTEqYa3MYCMl9BvqJcl9vvn2yJXyimwlsnQsWb80g=;
        b=YhAxgjwByMUVtC0QltQ0WZbdI/jd05toOa5H1jc5GThVHN2I114FIGBg6IFEm61vTO
         vjueufSh3oZGhR632HQeIa257kEzkJLao4uA7qTC8d7DgDRea0pwxhRcTZcFSnZ9xmoj
         mnvt8dyoAkT7xtkdOpPxs554wJdeEe+ZrTvxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KPlTEqYa3MYCMl9BvqJcl9vvn2yJXyimwlsnQsWb80g=;
        b=RqNdLWXIcqBGn0poqR1gLavvzG2fcmZGdTmRty8pHPEKa68C+b1RqjxZYLiWv8PDRn
         KM10Z15RGN6eqLQxL/UraQuiX2vreFNmjai7cA1bsJDFKzSaPwU3PRz/w+awBkIFZ+vA
         j1FAspcSeqgCGqZOXDjoEOyey2G1Xr9CnHWG/yQrbO3rtHri2mxcFGsTiW97aTTvERJT
         hnQLc3CPThzSjZF70AiERGefhVT01scNBdgp2DoBc6JWVyYZ3/Nrz7AN5iR7c3YsFQBJ
         uiar9ch/t6FvzYYWOBDtlAZXwICRu92dZl3HvP9zvVDCSi55JvTbvkZA9mZlfUv8GXRX
         gC2Q==
X-Gm-Message-State: AFqh2krxSliqKSMpVxztzmqjlIUN0Vx3pGtYDXNomp1x6Jhg4R6cnoXD
	YKhD1UraLEZD90GniSrjCzTTJ7MLeKhH03tS8BD1dg==
X-Google-Smtp-Source: AMrXdXv0jj8OdD6WjSDbEKQJNJ1yRigoEOsjWSkDG9TTutwpBPDNw73XntP58sJQMP+TekyU6XVuIFUl5/GDLYHuanA=
X-Received: by 2002:a05:6102:3e06:b0:3b5:fd8:7948 with SMTP id
 j6-20020a0561023e0600b003b50fd87948mr4003899vsv.85.1672388163532; Fri, 30 Dec
 2022 00:16:03 -0800 (PST)
MIME-Version: 1.0
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com> <20221223094259.87373-21-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221223094259.87373-21-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 30 Dec 2022 16:15:52 +0800
Message-ID: <CAGXv+5E26i6F2BPZYDfRhM-OMei-Br276UNtRVr5=+7pT+HTqg@mail.gmail.com>
Subject: Re: [PATCH v2 20/23] clk: mediatek: clk-mt8186-topckgen: Migrate to mtk_clk_simple_probe()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, fparent@baylibre.com, 
	chun-jie.chen@mediatek.com, sam.shih@mediatek.com, y.oudjana@protonmail.com, 
	nfraprado@collabora.com, rex-bc.chen@mediatek.com, ryder.lee@kernel.org, 
	daniel@makrotopia.org, jose.exposito89@gmail.com, yangyingliang@huawei.com, 
	pablo.sun@mediatek.com, msp@baylibre.com, weiyi.lu@mediatek.com, 
	ikjn@chromium.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221230_001605_410268_CB048B6E 
X-CRM114-Status: UNSURE (   5.99  )
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

On Fri, Dec 23, 2022 at 5:43 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> As done with MT8192, migrate MT8186 topckgen away from a custom probe
> function and use mtk_clk_simple_{probe, remove}().
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

