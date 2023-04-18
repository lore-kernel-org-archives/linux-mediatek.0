Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E31C77B72
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Apr 2023 00:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jXYI9t+uhIrIqHGofk7KodCSd0KD+a+f9muMXWOvwoI=; b=ORqlK1HZ+4de/4KP3P3yDw04Br
	6ZV0+Q+zg3yqinjc9j6vBhJTKws/rGwuoS7vbTAKdsWRe2zyjJt/LTilOiem9PMCkp8lJj/d8gm7Y
	8bsqY12Xy3WcM96jKjORF8oa6ENrDV0Ug27xIQsoSk9UqFyEnXX3DJGyjoGaxMijqjadXoveZpTDM
	S3Hr0VDtQHJuK0EiYQczmbar2/SlpMDfT8sY8TmF3LG9DT+qUZ5MMqsU6K9J5ZZY0DzSZljuIDU+g
	2dSHoIQ/eAAOviA5g8pySm6mS8R5jpHJojPu9P+k1zmrPCE6d5T1QspaR/KY8uWwiQmxcO4yvGfA6
	Pf6Foojw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poZg5-000XEs-2W;
	Tue, 18 Apr 2023 00:58:37 +0000
Received: from mail-oo1-f50.google.com ([209.85.161.50])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poZg1-000XDU-2t;
	Tue, 18 Apr 2023 00:58:35 +0000
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-544f2c5730aso67584eaf.2;
        Mon, 17 Apr 2023 17:58:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681779512; x=1684371512;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jXYI9t+uhIrIqHGofk7KodCSd0KD+a+f9muMXWOvwoI=;
        b=M9AHmitoGklqxTsAl+8QtopY6UJyjQRWmxbejg0rwXkwQBEd2ykCeuE2x+F3bLutvt
         74wJ29NNTQDblNyaEz6o0qounVGmqY2fyihoEg0MZ4+0t0FgZAblubU4K5+bTl12700O
         SNZCBYvmQhf//RfxQ2yZB/nF4GCbrikf8ml1EI7kmXTisMYk5sHHGBpZNyLJsT9nnTYA
         ll7JwsSzz7AczN2lASVFbqmk4iQb/23vxX0rv0JykuhLddjDhojp1H2tyIjKlO2/4twM
         gGIGZhMcFEX53Q3kmC3HmWVHYTe/uzhH+zkj47LI7MIPFrc385lagDLuxrITCnt7Yiua
         LVQw==
X-Gm-Message-State: AAQBX9fPXXC5tfvQsFZKgozNCGB8PIWchjLYSrhdydUVHUqxhhGIASa6
	EQ0zdrPCuj9JDppNNDNuHw==
X-Google-Smtp-Source: AKy350bPqPxucQ0TtF2gVHTpq49ndfYCjdXmxQpqh32tloC6VCltN0j5EIggvm/aGOCZJnEkxuXLNQ==
X-Received: by 2002:a05:6870:65a0:b0:183:fab4:efb9 with SMTP id fp32-20020a05687065a000b00183fab4efb9mr254235oab.43.1681779512502;
        Mon, 17 Apr 2023 17:58:32 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 125-20020a4a0d83000000b005251e3f92ecsm5306962oob.47.2023.04.17.17.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 17:58:32 -0700 (PDT)
Received: (nullmailer pid 3814440 invoked by uid 1000);
	Tue, 18 Apr 2023 00:58:30 -0000
Date: Mon, 17 Apr 2023 19:58:30 -0500
From: Rob Herring <robh@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, p.zabel@pengutronix.de, linux-pwm@vger.kernel.org, kernel@collabora.com, chunkuang.hu@kernel.org, linux-phy@lists.infradead.org, ck.hu@mediatek.com, jitao.shi@mediatek.com, houlong.wei@mediatek.com, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, vkoul@kernel.org, chunfeng.yun@mediatek.com, daniel@ffwll.ch, linux-mediatek@lists.infradead.org, xinlei.lee@mediatek.com, airlied@gmail.com, u.kleine-koenig@pengutronix.de, linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org, kishon@kernel.org, ~postmarketos/upstreaming@lists.sr.ht, thierry.reding@gmail.com, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, jassisinghbrar@gmail.com
Subject: Re: [PATCH 01/27] dt-bindings: pwm: Add compatible for MediaTek
 MT6795
Message-ID: <20230418005830.GA3802030-robh@kernel.org>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-2-angelogioacchino.delregno@collabora.com>
 <168133318912.3190428.16120880490622098945.robh@kernel.org>
 <5c0bc1f2-5917-ab84-8b0b-f2adc48f8be7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c0bc1f2-5917-ab84-8b0b-f2adc48f8be7@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_175833_957145_E5BF514F 
X-CRM114-Status: GOOD (  23.25  )
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

On Thu, Apr 13, 2023 at 10:52:28AM +0200, Matthias Brugger wrote:
> 
> 
> On 12/04/2023 23:03, Rob Herring wrote:
> > 
> > On Wed, 12 Apr 2023 13:27:13 +0200, AngeloGioacchino Del Regno wrote:
> > > Add a compatible string for MediaTek Helio X10 MT6795's display PWM
> > > block: this is the same as MT8173.
> > > 
> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > ---
> > >   Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 4 +++-
> > >   1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > 
> > Running 'make dtbs_check' with the schema in this patch gives the
> > following warnings. Consider if they are expected or the schema is
> > incorrect. These may not be new warnings.
> > 
> 
> These are not new warnings. I think we should address them in a different
> patch. In my opinion it shouldn't block this patch. In the end it only add
> as compatible here.

I disagree if it's the schema that needs fixing. From the looks of 
it, I'd say it's probably at least some schema fixes needed.

> 
> Regards,
> Matthias
> 
> > Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> > This will change in the future.
> > 
> > Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230412112739.160376-2-angelogioacchino.delregno@collabora.com
> > 
> > 
> > pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'

Are you saying the MT6795 has no power-domains?

> > 	arch/arm64/boot/dts/mediatek/mt8183-evb.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb
> > 
> > pwm@1400a000: compatible: 'oneOf' conditional failed, one must be fixed:
> > 	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dtb
> > 	arch/arm/boot/dts/mt7623n-rfb-emmc.dtb
> > 
> > pwm@1401e000: compatible: 'oneOf' conditional failed, one must be fixed:
> > 	arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8173-evb.dtb
> > 
> > pwm@1401f000: compatible: 'oneOf' conditional failed, one must be fixed:
> > 	arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8173-evb.dtb

The commit message says the MT6795 is the same as the MT8173. Which is 
wrong here, the dtb or the schema? 

Rob

