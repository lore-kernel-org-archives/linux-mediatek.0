Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9259BC00140
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Aug 2022 15:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:References:In-Reply-To:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ikeEPiuKHYMe9xXHEeJbSPSH1rglZXTX+Lz/Wx8z9D8=; b=xMbJ9j3T6ql88nrXLwRxFTY3eu
	i/5s4eLfbJEp+raJRiY5+6F0IlW8ET9e9U1dZn6Y99eP5gR94D4gpZfQcWijfx+MwUXQfwFfb7j0W
	KM1zdg5VT0W0wTjGz10iK7E0CczsjcPuR9sHqn2Oz1dPT6ABvvkh+pGeINk2wJkqqPr5wQ4hTLCm8
	XTpdz+dT4nYddRviTsG3X6ohipwIPjTvjkTf22vrg3nwHSVpR5Ma8/jxIHxS2inacLQFMYbNlLlOy
	t7Qu0xOKBUcicetQlRUxtGl6gF5ef5RR41IvrdSvYc0pu5EaX8n158Ou1nVTjBfAydDBO04SbSota
	/o5lUwHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMWNS-009qI1-QN; Fri, 12 Aug 2022 15:15:10 +0000
Received: from mail-io1-f49.google.com ([209.85.166.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMWMU-009ktx-1Z; Fri, 12 Aug 2022 15:14:13 +0000
Received: by mail-io1-f49.google.com with SMTP id y82so1036681iof.7;
        Fri, 12 Aug 2022 08:14:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=ikeEPiuKHYMe9xXHEeJbSPSH1rglZXTX+Lz/Wx8z9D8=;
        b=KP2YETyGv+CZN7G89Y+U2780aWxMk7CKCzNagL/IxLF7p1bwxn2Kv3OzJ0+XgVsh+A
         +jon/mo/40o7EgwiL79OnQEj/ejpuKdIvK3nsF/pKpvwkshJ/sXcWfHw0xkiT0YOPaCz
         6av4cOfL8Y7kjaBZ2rl9SlqnOHenaRnivWtCqQNGOPPtyvF6nByDbKSI6acPt5+ds9kb
         DMsVzoDLj7iV7FAPaQ/O4oagVwYrZj4MmaIwuZFOCaLTmJE63WYC1AVGxmqq+j59Xd4T
         QQUqwbo+sJ69DVt+dGETbV/4pl+ETVrYlcb+1EOHZDcfOJpc9jpy/FR446ady1I8cGuF
         jfJw==
X-Gm-Message-State: ACgBeo1ovYvsLDV33i5y0i6FBrVPx/1cC5BbLaumGgr5oveVDnI/dC+7
	0xtSk3UEUud8zI9mrUzgEw==
X-Google-Smtp-Source: AA6agR7QH8e1Cxzl8c/w8Z4o6Wh9QqSi0rqDkC8FsYzAPkC89ZCQl6Gn7SL/x2lPIDRU2S2GKjrQug==
X-Received: by 2002:a02:b60d:0:b0:343:5ddd:66b3 with SMTP id h13-20020a02b60d000000b003435ddd66b3mr2137872jam.8.1660317248790;
        Fri, 12 Aug 2022 08:14:08 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id m66-20020a6b3f45000000b0067cb742ad4csm1054062ioa.23.2022.08.12.08.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 08:14:08 -0700 (PDT)
Received: (nullmailer pid 168984 invoked by uid 1000);
	Fri, 12 Aug 2022 15:13:53 -0000
From: Rob Herring <robh@kernel.org>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
In-Reply-To: <20220812092901.6429-2-zhiyong.tao@mediatek.com>
References: <20220812092901.6429-1-zhiyong.tao@mediatek.com> <20220812092901.6429-2-zhiyong.tao@mediatek.com>
Subject: Re: [PATCH v3 1/1] regulator: dt-bindings: mediatek: add mt6366
Date: Fri, 12 Aug 2022 09:13:53 -0600
Message-Id: <1660317233.452120.168983.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_081410_130661_62767AEC 
X-CRM114-Status: GOOD (  10.36  )
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
Cc: alexandre.belloni@bootlin.com, allen-kh.cheng@mediatek.com, linux-kernel@vger.kernel.org, macpaul.lin@mediatek.com, lee.jones@linaro.org, hsin-hsiung.wang@mediatek.com, linux-rtc@vger.kernel.org, wen.su@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, hui.liu@mediatek.com, sean.wang@mediatek.com, broonie@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org, a.zummo@towertech.it, sen.chu@mediatek.com, lgirdwood@gmail.com, robh+dt@kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 12 Aug 2022 17:29:01 +0800, Zhiyong Tao wrote:
> Add mt6366 regulator document
> 
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> ---
>  .../regulator/mediatek,mt6366-regulator.yaml  | 287 ++++++++++++++++++
>  1 file changed, 287 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6366-regulator.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/mediatek,mt6366-regulator.example.dtb: ldo-vrf12: 'regulator-name' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/mediatek,mt6366-regulator.example.dtb: ldo-vio18: 'regulator-name' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/mediatek,mt6366-regulator.example.dtb: ldo-vcamio: 'regulator-name' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/mediatek,mt6366-regulator.example.dtb: ldo-vcn18: 'regulator-name' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/mediatek,mt6366-regulator.example.dtb: ldo-vfe28: 'regulator-name' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/mediatek,mt6366-regulator.example.dtb: ldo-vcn28: 'regulator-name' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/mediatek,mt6366-regulator.example.dtb: ldo-vxo22: 'regulator-name' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/mediatek,mt6366-regulator.example.dtb: ldo-vaux18: 'regulator-name' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/mediatek,mt6366-regulator.example.dtb: ldo-vbif28: 'regulator-name' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/mediatek,mt6366-regulator.example.dtb: ldo-vio28: 'regulator-name' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/mediatek,mt6366-regulator.example.dtb: ldo-va12: 'regulator-name' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/mediatek,mt6366-regulator.example.dtb: ldo-vrf18: 'regulator-name' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/mediatek,mt6366-regulator.example.dtb: ldo-vaud28: 'regulator-name' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


