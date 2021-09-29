Return-Path: <SRS0=h0C2=OT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CEE5C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Sep 2021 13:47:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC2CA613A7
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Sep 2021 13:47:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC2CA613A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LAKzby/18YsBmNN7b0Ru9II7qAm7ysdqLyMfjLyKICE=; b=pPUHqRR78GYWfe
	LsyBHi7GYlQc2LoaJN2rK6q47TtpAKKObhI/zijUvIHgT4M/kYBtyaVERPJ2w7lSrP1Y+GJrqRXlK
	l8/hSWIDHVEKmvidRtjHl0WLYNnTTq/UHHh3BCpnDAfOEjWBRLvs0bWheR70f94wQmvZ/lpMHBfpV
	GItu+tyVr8s218ZlTHKEPxkt4Bl2NIWnZpda2nJCoI+oN/Y26O9DhWvRAm6q1pqMuWe27vEXpzS/g
	8iAIjiiPJfhQO13K5v9BnF0xalghZfiVMqXFXZlGu3rk4/8FoztrQgkSl419sJWEeeQQFuvzDWq6m
	sdpwvR2yxOTNyccedbQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVZvS-00BCBO-U0; Wed, 29 Sep 2021 13:47:10 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVZuq-00BByb-1w; Wed, 29 Sep 2021 13:46:33 +0000
Received: by mail-ot1-f50.google.com with SMTP id
 x33-20020a9d37a4000000b0054733a85462so2881481otb.10; 
 Wed, 29 Sep 2021 06:46:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=nMzKG9wRHnCRIa2M2qYDKtvL+zIQ3mmyPkGjzNoJMEY=;
 b=K4SlR4VWUootg1bXib7sQifAVAJMEkBog3+3M1tFL2nYre1pHmDSdeq9sjpoNHvczA
 +5kxqY9BYQTO09YUFFqfUumS6+girbRI5j0yCKsxxoWT1hALBYZ5zPWZHMvfehmcfpCs
 SmvZWXXJMLR0aU82Zo7HWnj9fV+y7KKDz0c6/bHM+DzJhygyYHkVMJS9xhzjY3dOwoEx
 8/CMAclFwOgs7JwIOCY86IP9MzXI4qCj3MF/wFvOMqh4b/j5wjbnq1ixxGiznKDAUhRC
 yWunIRJJ4vmOoq8vRHcuZW2/DuPNy/VoUmMSTfGXK3VctS04cg0m+XrYAmyf6oeP+G+5
 KtUg==
X-Gm-Message-State: AOAM530yHD1V4bxQX25VFOGuDwC/4i2XJ4R34/qJNDoYKephN0O2a3+T
 wwbIU3V3mYZr/Ur/d+82KQjyhN2iIg==
X-Google-Smtp-Source: ABdhPJwVxiefCTq42d5W8ok1vkxISQY/+VWRBykU2H3mzEKdwIgUf/W8FyAaSeigWhE5bEgZhRWXXA==
X-Received: by 2002:a9d:4e08:: with SMTP id p8mr94193otf.152.1632923190864;
 Wed, 29 Sep 2021 06:46:30 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id y12sm452768otu.11.2021.09.29.06.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 06:46:30 -0700 (PDT)
Received: (nullmailer pid 3674447 invoked by uid 1000);
 Wed, 29 Sep 2021 13:46:25 -0000
From: Rob Herring <robh@kernel.org>
To: Guillaume Ranquet <granquet@baylibre.com>
Cc: chunkuang.hu@kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
 p.zabel@pengutronix.de, linux-mediatek@lists.infradead.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, devicetree@vger.kernel.org
In-Reply-To: <20210929094425.745-2-granquet@baylibre.com>
References: <20210929094425.745-1-granquet@baylibre.com>
 <20210929094425.745-2-granquet@baylibre.com>
Subject: Re: [PATCH v1 1/4] dt-bindings: phy: Add binding for Mediatek MT8195
 HDMI PHY
Date: Wed, 29 Sep 2021 08:46:25 -0500
Message-Id: <1632923185.732480.3674446.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_064632_118524_558A56A5 
X-CRM114-Status: GOOD (  11.20  )
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

On Wed, 29 Sep 2021 11:44:22 +0200, Guillaume Ranquet wrote:
> Add bindings to describe Mediatek MT8195 HDMI PHY
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>  .../phy/mediatek,mtk8195-hdmi-phy.yaml        | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mtk8195-hdmi-phy.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/mediatek,mtk8195-hdmi-phy.yaml: properties:compatible: [{'const': 'mediatek,mt8195-hdmi-phy'}] is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
./Documentation/devicetree/bindings/phy/mediatek,mtk8195-hdmi-phy.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/phy/mediatek,mtk8195-hdmi-phy.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/mediatek,mtk8195-hdmi-phy.yaml: ignoring, error in schema: properties: compatible
warning: no schema found in file: ./Documentation/devicetree/bindings/phy/mediatek,mtk8195-hdmi-phy.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/mediatek,mtk8195-hdmi-phy.example.dt.yaml: example-0: hdmi-phy@11d5f000:reg:0: [0, 299233280, 0, 256] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
Documentation/devicetree/bindings/phy/mediatek,mtk8195-hdmi-phy.example.dt.yaml:0:0: /example-0/hdmi-phy@11d5f000: failed to match any schema with compatible: ['mediatek,mt8195-hdmi-phy']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1534286

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
