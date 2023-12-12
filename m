Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9844C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 05:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+B65863yLKUtFx1H3cySA9eHt0gdSQ0o5gL85fM5qsM=; b=zALlv9KxePcM5IbWeXQc/fX2yd
	4ilP3013xXFcHbaolV69WnVKvY+hhUEgFQcRRoAMbm3E27nWttia/8We/xmeC6uhQ6Sy3qvOKicNL
	W4D+0Yn3yCidCUWbmf3y2FBjs9M4UQgIQXfBuafj4IW9ze+CcKTldEQr1bpgkVOtTfXSaP+j0qXTp
	tpLWUBt7dE8GRMFVvt8x08bdy9lco1LfLbaf5M9uSNF6gfT/7oX0HGbA0ZG+uGXT5ClHu/ofVN14F
	dkYddybZ9eN2IPNZ6oDqHaJVTHpFsOJxMU5A8xo1lQZ22BKDYLIqr3/we6rL+K/mjA27Kuwrr6Jyj
	4W2xGudg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCvYW-00AobN-1L;
	Tue, 12 Dec 2023 05:43:44 +0000
Received: from mail-oo1-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCvYT-00AoZU-2R;
	Tue, 12 Dec 2023 05:43:43 +0000
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-58d1b767b2bso3273441eaf.2;
        Mon, 11 Dec 2023 21:43:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702359820; x=1702964620;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+B65863yLKUtFx1H3cySA9eHt0gdSQ0o5gL85fM5qsM=;
        b=duPqVozJBBwFBD20bx1ptphaO0osFe8KXypOKt380mGz0xAuN0XL1yS3LwVClDtM2J
         qjPqBE7+Eq3EpDalSCfWSCytKiPwUD4/UfELAP7CDrrXjRlTl8sKmp21RlZ9AGBfituX
         3W1zw37gKvRJ4zmhZ4RA4A8Fy5kkOSy0Xv5vhDoYebv1gVf1UoAneuICLwhZNsB08yvO
         Is9lkIPaISeu5Rl2KB40vhyguwqLPNgu1TRBnrk1RWYBFA1ySoZkZ2VJoXvsnErZT+Ij
         g2j+p3xOxY3KKLucrEOgzsLB4mFeL8g/CYAsTU8umXTXdY3p+b0W7Ed+HRroE4Jyv1eq
         /4yQ==
X-Gm-Message-State: AOJu0YwdBLgW868y1GYxIEktW/fy1M2yLtHFfr2/JR6rpq2SrRotwE/L
	CD4CV2EvB/Ipg3uZkP1NJA==
X-Google-Smtp-Source: AGHT+IEfp8oyZwps8u2dDzwjetO/7PzN9Vr0x/u2+ppbmGKeBu0THct+99WZVE4EB+zu4AMg31Wgjg==
X-Received: by 2002:a4a:7612:0:b0:590:16fd:e056 with SMTP id t18-20020a4a7612000000b0059016fde056mr2876236ooc.14.1702359819930;
        Mon, 11 Dec 2023 21:43:39 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j27-20020a4a92db000000b0058d4805748fsm2282822ooh.44.2023.12.11.21.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 21:43:39 -0800 (PST)
Received: (nullmailer pid 39736 invoked by uid 1000);
	Tue, 12 Dec 2023 05:43:35 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	John Crispin <john@phrozen.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "David S. Miller" <davem@davemloft.net>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paolo Abeni <pabeni@redhat.com>, 
	Vinod Koul <vkoul@kernel.org>, Felix Fietkau <nbd@nbd.name>, Eric Dumazet <edumazet@google.com>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Qingfang Deng <dqfext@gmail.com>, linux-kernel@vger.kernel.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, Andrew Lunn <andrew@lunn.ch>, linux-phy@lists.infradead.org, 
	Sean Wang <sean.wang@mediatek.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	linux-mediatek@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, 
	Alexander Couzens <lynxis@fe80.eu>, SkyLake Huang <SkyLake.Huang@mediatek.com>, 
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Mark Lee <Mark-MC.Lee@mediatek.com>
In-Reply-To: <ac6a7277fc534f610386bc51b2ff87beade03be8.1702352117.git.daniel@makrotopia.org>
References: <cover.1702352117.git.daniel@makrotopia.org>
 <ac6a7277fc534f610386bc51b2ff87beade03be8.1702352117.git.daniel@makrotopia.org>
Message-Id: <170235981567.39712.1104850530934071903.robh@kernel.org>
Subject: Re: [RFC PATCH net-next v3 7/8] dt-bindings: net: mediatek,net:
 fix and complete mt7988-eth binding
Date: Mon, 11 Dec 2023 23:43:35 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_214341_792876_2EDED27F 
X-CRM114-Status: GOOD (  14.35  )
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


On Tue, 12 Dec 2023 03:51:01 +0000, Daniel Golle wrote:
> Complete support for MT7988 which comes with 3 MACs, SRAM for DMA
> descriptors and uses a dedicated PCS for the SerDes units.
> 
> Fixes: c94a9aabec36 ("dt-bindings: net: mediatek,net: add mt7988-eth binding")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../devicetree/bindings/net/mediatek,net.yaml | 148 +++++++++++++++++-
>  1 file changed, 146 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/net/mediatek,net.example.dts:231:18: fatal error: dt-bindings/clock/mediatek,mt7988-clk.h: No such file or directory
  231 |         #include <dt-bindings/clock/mediatek,mt7988-clk.h>
make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/net/mediatek,net.example.dtb] Error 1

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/ac6a7277fc534f610386bc51b2ff87beade03be8.1702352117.git.daniel@makrotopia.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


