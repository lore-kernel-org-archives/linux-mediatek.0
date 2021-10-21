Return-Path: <SRS0=9f7n=PJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB970C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Oct 2021 13:30:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB91C61205
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Oct 2021 13:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB91C61205
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RloRbhSXhrQGaJDo1kVXijV4thE0zzcZ4Ips7YSEANI=; b=1nWeLHFGbuuA6Q
	9SCnPqhLgat+G7l4ISK5oT+hkw1FfEpF90ynUKwo3pQMOHzMfrf2/sFTlQ++BZ7vir7kDrB4Gh9FE
	c8sdD1RL1N5COKasFvkStIKyTv6UFsEGkzZ7OQulo5o5xFmUl8iobN6akLvxEqV3P5o7MBdo2K9f4
	brwW3Msx5P6LGe+2sLFCD0G8QWsYTId6c6Xiu6r0D1+0WSItYm+XeWF/3ZRAWvWIDExL9S/2Q4rqO
	9wZqf5U8A9QPOLWLfDlJhEKMp20xx9eZAdhcGsdEW7K+3XMmWrnVAPQ0Qn1ha/LVhM5vIh6mMAudb
	VZS4q/CtRdJ188hdkOHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdY9R-007e8X-UT; Thu, 21 Oct 2021 13:30:33 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdY97-007e2o-3s; Thu, 21 Oct 2021 13:30:14 +0000
Received: by mail-ot1-f50.google.com with SMTP id
 d21-20020a9d4f15000000b0054e677e0ac5so373687otl.11; 
 Thu, 21 Oct 2021 06:30:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=0zF0CVmeaIG2Lt62vaRjUU2fLmKXJyBGdl9zYadt9rk=;
 b=RcQwc7BmMTINHsVpxOEif1VgpdCM5ZVrs4j+4aP0QTwjLvlJ1IIo0Ipw9r9fbgbLR5
 jUmW2JyqPkfRKsKpf0wZrUKbDPt/iIeogy7HfHGOT5a71sMDqfo+Q0c9hQKalMV+dgoI
 rGgVqvl4on+/uemqe6HLUG1fkYdgo+p9BPRMEJd93RiYGnPuoquZXeyYYMJPMi5tUx+7
 ReG4OIxFYZQQxM5g9Jmwi5UzZNurw+PwGFrhGaCan59T0ePapykt3GlyFnoGKzAuHD4z
 +X9POTS002P6AUGOjkosCuP3O68XLXQkgp9y3CbEuOlSeBbbi8UiGeTmKr63Xgjzqwnw
 s9pw==
X-Gm-Message-State: AOAM532d0LBgwEZKULcyts7GXuxJ33fJ2ELB3e8Qnr5IcGQ0IMHnQ9fd
 yR52SuBZuEA69AUJFn9fuYaVsH7atg==
X-Google-Smtp-Source: ABdhPJzRAjLuHwIJ9mvQFOPzhmIpXAT6cNcKlAhYHOhqHGtrndKW6FroqvYm4rd8UFGr80VHBXiICA==
X-Received: by 2002:a9d:764c:: with SMTP id o12mr4966078otl.129.1634823011712; 
 Thu, 21 Oct 2021 06:30:11 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id t8sm1070167otc.74.2021.10.21.06.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 06:30:10 -0700 (PDT)
Received: (nullmailer pid 353184 invoked by uid 1000);
 Thu, 21 Oct 2021 13:30:05 -0000
From: Rob Herring <robh@kernel.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Vinod Koul <vkoul@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-phy@lists.infradead.org
In-Reply-To: <20211021092707.3562523-2-msp@baylibre.com>
References: <20211021092707.3562523-1-msp@baylibre.com>
 <20211021092707.3562523-2-msp@baylibre.com>
Subject: Re: [PATCH v5 1/7] dt-bindings: mediatek,dpi: Add DP_INTF compatible
Date: Thu, 21 Oct 2021 08:30:05 -0500
Message-Id: <1634823005.130125.353182.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_063013_187981_A6CEBCF9 
X-CRM114-Status: GOOD (  14.11  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 21 Oct 2021 11:27:01 +0200, Markus Schneider-Pargmann wrote:
> DP_INTF is similar to DPI but does not have the exact same feature set
> or register layouts.
> 
> DP_INTF is the sink of the display pipeline that is connected to the
> DisplayPort controller and encoder unit. It takes the same clocks as
> DPI.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
> 
> Notes:
>     Changes v4 -> v5:
>     - Newly created patch after realizing that the specific clocks for dpintf were
>       the same as engine and pixel clocks.
> 
>  .../bindings/display/mediatek/mediatek,dpi.yaml       | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1544237


dpi@14014000: Additional properties are not allowed ('ports' was unexpected)
	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dt.yaml
	arch/arm/boot/dts/mt7623n-rfb-emmc.dt.yaml

dpi@14014000: compatible: Additional items are not allowed ('mediatek,mt2701-dpi' was unexpected)
	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dt.yaml
	arch/arm/boot/dts/mt7623n-rfb-emmc.dt.yaml

dpi@14014000: compatible: ['mediatek,mt7623-dpi', 'mediatek,mt2701-dpi'] is too long
	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dt.yaml
	arch/arm/boot/dts/mt7623n-rfb-emmc.dt.yaml

dpi@14014000: 'port' is a required property
	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dt.yaml
	arch/arm/boot/dts/mt7623n-rfb-emmc.dt.yaml

dpi@1401d000: Additional properties are not allowed ('power-domains' was unexpected)
	arch/arm64/boot/dts/mediatek/mt8173-elm.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dt.yaml
	arch/arm64/boot/dts/mediatek/mt8173-evb.dt.yaml


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
