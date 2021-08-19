Return-Path: <SRS0=ccVP=NK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50A73C4320A
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 21:19:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E049B60ED3
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 21:19:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E049B60ED3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XyeWR3Cf1D+vywMLh7VRY4ZvWLXxS2ibIPN7ZobzQ2g=; b=1TkEZaHzRbmZE4
	WWum0zRY3Vs1d50nDFKMJ33oqUciTOnLu2efZ2PVOteFy9aSjhJPBJbfCpAZJkEMDxs1Mkwa7FYT2
	VU4EtJNBd5SSq90D3NNS1z8ghMVZa2RguD6VIDyW79t73xBB1pEhkp9YtttT7V47FsOVXrR0PSg5Q
	cRNjebPeXDqpuLuQj3uatPA4WWI06BpNCJiGpKL2hTepNKJwDqQ4diGEduOEUcnyosIpFjoEOTUeB
	fS6sKbpec5N38MPUdN+EFMKTz30oTJYGiPaSdcZVuCCOWLuQuqRjL6OSTKQEV3izYYz8Q9URAPJuK
	UYEkuZLcOealLbX9uJjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGpRc-009SYd-KV; Thu, 19 Aug 2021 21:19:24 +0000
Received: from mail-oo1-f41.google.com ([209.85.161.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGpRW-009SX1-HV; Thu, 19 Aug 2021 21:19:22 +0000
Received: by mail-oo1-f41.google.com with SMTP id
 l12-20020a4a94cc0000b02902618ad2ea55so2246734ooi.4; 
 Thu, 19 Aug 2021 14:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=CP+7+P6aVL+xpSBlijL9XVTFtbWM/RfGDr1X8s8YfYM=;
 b=EtTJvTX9T6BUYgzdNz11KBe+DYIiXujELce2n8L5z9eJL328MZxZNizhJmBhCP2ruT
 LYajeZGJ9ULFQF0Q3haXPHP+TrR+qCPxlYX3sBf+n1Dsh+l3gN1A2vAtmUchU9CltPaz
 iQQ4QLlYtVJIxwyBDYD9heGilYo7FsYo/nIuKITjSvjY6xZ/d4K+jL482WZNg5wjfh1C
 tBX+hgYzwxJ+MPVs2h5PDCj7sLZTkMsiGM6xsr9c5X+eu1mfPWJjVbwIERXbGc+Ninr/
 pQLDKUvl6cRaXC8zt5RLgBAk8PjkR9CFWNRL4eNLku/0MGnhgZ9s6jTgD6SoXZUM7hkC
 LVyQ==
X-Gm-Message-State: AOAM533AEEQ1TMq0ImdjutltmRTHdGUJJrHk81ADGIQjHq5eRqnVaLuJ
 e40Fieov6muXsqj58KOlQg==
X-Google-Smtp-Source: ABdhPJz4l0FfU2tWp7BNTiaHu8YMFH4DoUIKNiOmtxz0Cf/z/TGEJ+AaJW7O7mgbe43vgdxkzK3Trw==
X-Received: by 2002:a4a:3944:: with SMTP id x4mr1498602oog.69.1629407955572;
 Thu, 19 Aug 2021 14:19:15 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id j6sm884747ooj.11.2021.08.19.14.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 14:19:14 -0700 (PDT)
Received: (nullmailer pid 1418776 invoked by uid 1000);
 Thu, 19 Aug 2021 21:19:11 -0000
From: Rob Herring <robh@kernel.org>
To: Alexandre Bailon <abailon@baylibre.com>
Cc: mathieu.poirier@linaro.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, gpain@baylibre.com,
 linux-kernel@vger.kernel.org, stephane.leprovost@mediatek.com,
 robh+dt@kernel.org, khilman@baylibre.com, linux-remoteproc@vger.kernel.org,
 bjorn.andersson@linaro.org, linux-arm-kernel@lists.infradead.org,
 ohad@wizery.com, devicetree@vger.kernel.org
In-Reply-To: <20210819151340.741565-2-abailon@baylibre.com>
References: <20210819151340.741565-1-abailon@baylibre.com>
 <20210819151340.741565-2-abailon@baylibre.com>
Subject: Re: [PATCH v3 1/4] dt bindings: remoteproc: Add bindings for MT8183
 APU
Date: Thu, 19 Aug 2021 16:19:11 -0500
Message-Id: <1629407951.460901.1418775.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_141918_625011_99A3B01F 
X-CRM114-Status: GOOD (  12.00  )
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

On Thu, 19 Aug 2021 17:13:37 +0200, Alexandre Bailon wrote:
> This adds dt bindings for the APU present in the MT8183.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> ---
>  .../bindings/remoteproc/mtk,apu.yaml          | 118 ++++++++++++++++++
>  1 file changed, 118 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/remoteproc/mtk,apu.example.dt.yaml:0:0: /example-0/reserved-memory/vdev0vring0: failed to match any schema with compatible: ['shared-dma-pool']
Documentation/devicetree/bindings/remoteproc/mtk,apu.example.dt.yaml:0:0: /example-0/reserved-memory/vdev0vring1: failed to match any schema with compatible: ['shared-dma-pool']
Documentation/devicetree/bindings/remoteproc/mtk,apu.example.dt.yaml:0:0: /example-0/reserved-memory/vdev0buffer: failed to match any schema with compatible: ['shared-dma-pool']
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/mtk,apu.example.dt.yaml: apu@19100000: memory-region: [[1], [2], [3]] is too long
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/mtk,apu.example.dt.yaml: apu@19100000: Additional properties are not allowed ('memory-region-names' was unexpected)
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1518714

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
