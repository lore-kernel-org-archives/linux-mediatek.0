Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 236B9C38142
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 07:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ekjjYsjyEgOsbiwnheVwup+Jhs5by80B0q9vdgmDIkA=; b=02JCt8nfxQQyqEHI3N8stwAuIY
	y4lcMrcrnfscSKE3DZtstPKWDXimovHM74Cr+M5oXM7BVNj2/P2b18kbOzWPf80v2UK15UzKZ7eWj
	2o3sgRu9YbsXx2EZjzhqPwKn+w7MuT8f4vcjjHoH1oOTWnXWQzGm/oy7uaa41ORL377IZroy9l6wX
	Vrk2NhgIQAo0iVkP+oAKcms+ZKd6GOhzqgxcan7j/mPhwrnApwifdU4Ui/d+DQ8HeTtElgRGjS0dN
	S33+p9trrup7ch7lrTyKQSUgDW2rv+vUTDiXufNfuW5MDu1AfaIcd4kk7wJdYMHujigmgMVA0ElVI
	zx5dx/BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN7pX-00AgFK-Qi; Wed, 01 Feb 2023 07:46:55 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN7pU-00AgCJ-3e
	for linux-mediatek@lists.infradead.org; Wed, 01 Feb 2023 07:46:54 +0000
Received: by mail-wr1-x431.google.com with SMTP id bk16so16383526wrb.11
        for <linux-mediatek@lists.infradead.org>; Tue, 31 Jan 2023 23:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ekjjYsjyEgOsbiwnheVwup+Jhs5by80B0q9vdgmDIkA=;
        b=dD8WHK8OLMfLqA0MIc9xkPz+pqKKOHLRddVmyMaq+XwXCyGGq8Ura/CvP+WNy0hfEq
         1z9fZMAi2lksnUM4fxVozL0bwjjJpYPHENGSyifDys+v2qAFc0P/WNS2Sh3Mk/ddObTa
         vwQI/BPv7r0IDPY6aQJ9bVzwLunH9B9S2gl5rHucdfpRM4v3ny8H2lQtC2ciDxgywFJ2
         yDGkgZEDuYHFOKikTLctVvLhhjc3enQVVghNV2WWwj8k1XrTFiZ8yZAnXPUTQkgLXzfT
         K/RdTJYxvYOMxAaGcN5/60JApGz7sXRBpcVhvHeLHHQPlCMkZtzd3Dkn4gu1GNEMsmYA
         wypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ekjjYsjyEgOsbiwnheVwup+Jhs5by80B0q9vdgmDIkA=;
        b=AmQQ7jop8w6B9WC6/AiSPdpdw+gs5kLRrgu3UKmsXOAgCMX1iO3v6zvs5vMBYtGVOC
         AKp5N0fTauur9LJBlEZBSui6gqPPcm2xpPMecdcdNOxelZhv3RlpPJoeWgIXxQDhOZ4m
         5NsCIjh8g7PSF8G2J58EJA3WidXxMs/Igcpjgwi373QIhVwBtoE/DXccHZc610KH9nn+
         tKmYLBRuzPz/YDBbya7Aep7A1GmESYHK66qrVrejwFTdelj76h25cGUXsS72NibPgTrL
         27V1zgpA9QqSqfKuSN33MzOIOSmb/7BsPpsCn0ZnMj304c9XDzqIzR/NAmfYx9IiX9hZ
         af7w==
X-Gm-Message-State: AO0yUKW4qNvqcROWDjOwPPnZzDwFhsx2hSC+ZSQKpVoTn6t+MCiEWu1x
	biZMKaman8yz5CFq6x8sbgQffA==
X-Google-Smtp-Source: AK7set+4iDkXnqb0lA6hpmduf0pX/W1ayH3Dsdumssk+MifxLMFXELe/Xbj5eq4/uqti0f1Al8SgvA==
X-Received: by 2002:a5d:4ac7:0:b0:2bf:eb2c:369 with SMTP id y7-20020a5d4ac7000000b002bfeb2c0369mr700589wrs.66.1675237608413;
        Tue, 31 Jan 2023 23:46:48 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f7-20020a5d64c7000000b002bdfe3aca17sm18050945wri.51.2023.01.31.23.46.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 23:46:48 -0800 (PST)
Message-ID: <ab3357ad-01ec-8a1a-d627-a1543874f0ef@linaro.org>
Date: Wed, 1 Feb 2023 08:46:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3] dt-bindings: thermal: mediatek: Add LVTS thermal
 controllers
Content-Language: en-US
To: bchihi@baylibre.com, daniel.lezcano@linaro.org,
 angelogioacchino.delregno@collabora.com, rafael@kernel.org,
 amitk@kernel.org, rui.zhang@intel.com, matthias.bgg@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com
References: <20230126161048.94089-1-bchihi@baylibre.com>
 <20230131140439.600164-1-bchihi@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230131140439.600164-1-bchihi@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_234652_173527_DE3AE380 
X-CRM114-Status: GOOD (  20.99  )
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

On 31/01/2023 15:04, bchihi@baylibre.com wrote:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> Add LVTS thermal controllers dt-binding definition for mt8195.
> 
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> ---
> Changelog:
>   v3:
>      - Fixed subject prefix
>      - Fixed licenses GPL-2.0-only OR BSD-2-Clause
>        to GPL-2.0 OR MIT (to match DT)
>      - Fixed matching dt-binding file names

If this is v3 with only one patch, where is the driver or DTS using
these bindings? Please link it. It's unusual to see only bindings,
without the users.

>   v2:
>      - Fixed subject prefix
>      - Fixed licenses GPL-2.0+ to GPL-2.0
>      - Added dual licenses

Is there a reason to make our review more difficult and keep versions
broken, threads attached to some other threads?

------------

Grabbing thread from
lore.kernel.org/all/20230131140439.600164-1-bchihi%40baylibre.com/t.mbox.gz
Checking for newer revisions on https://lore.kernel.org/all/
Analyzing 38 messages in the thread
Will use the latest revision: v12
You can pick other revisions using the -vN flag
Checking attestation on all messages, may take a moment...
---
  ✓ [PATCH v12] thermal: drivers: mediatek: Add the Low Voltage Thermal
Sensor driver
    ✓ Signed: DKIM/baylibre-com.20210112.gappssmtp.com (From:
bchihi@baylibre.com)
    + Link:
https://lore.kernel.org/r/20230131153816.21709-1-bchihi@baylibre.com
  ✓ [PATCH v12 2/6] dt-bindings: thermal: mediatek: Add LVTS thermal
controllers dt-binding definition
    ✓ Signed: DKIM/baylibre-com.20210112.gappssmtp.com (From:
bchihi@baylibre.com)
    + Link:
https://lore.kernel.org/r/20230126161048.94089-1-bchihi@baylibre.com
  ERROR: missing [3/1]!
  ERROR: missing [4/1]!
  ERROR: missing [5/1]!
  ERROR: missing [6/1]!

--------

b4 diff '<20230131140439.600164-1-bchihi@baylibre.com>'
Checking for older revisions on https://lore.kernel.org/all/
---
Analyzing 38 messages in the thread
Assuming new revision: v4 ([PATCH v12] thermal: drivers: mediatek: Add
the Low Voltage Thermal Sensor driver)
Preparing fake-am for v3: dt-bindings: thermal: mediatek: Add LVTS
thermal controllers
  range: 291580cde5f6..de7fe5e0293a
Preparing fake-am for v12: arm64: dts: mediatek: mt8195: Add thermal
zones and thermal nodes
  ERROR: Could not find matching blob for
arch/arm64/boot/dts/mediatek/mt8195.dtsi (09df105f4606)
         If you know on which tree this patchset is based,
         add it as a remote and perform "git remote update"
         in order to fetch the missing objects.
---
Could not create fake-am range for upper series v12


> ---
> ---
>  .../thermal/mediatek,lvts-thermal.yaml        | 107 ++++++++++++++++++
>  .../thermal/mediatek,lvts-thermal.h           |  19 ++++
>  2 files changed, 126 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
>  create mode 100644 include/dt-bindings/thermal/mediatek,lvts-thermal.h
> 
> diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> new file mode 100644
> index 000000000000..5fa5c7a1a417
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR MIT)

WARNING: DT binding documents should be licensed (GPL-2.0-only OR
BSD-2-Clause)
#24: FILE:
Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml:1:
+# SPDX-License-Identifier: (GPL-2.0 OR MIT)

I asked you to use the binding license for header file. Then you changed
binding license... why? Why do you need other SPDX text? Why do you need
MIT?

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/thermal/mediatek,lvts-thermal.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek SoC Low Voltage Thermal Sensor (LVTS)
> +
> +maintainers:
> +  - Balsam CHIHI <bchihi@baylibre.com>
> +
> +description: |
> +  LVTS is a thermal management architecture composed of three subsystems,
> +  a Sensing device - Thermal Sensing Micro Circuit Unit (TSMCU),
> +  a Converter - Low Voltage Thermal Sensor converter (LVTS), and
> +  a Digital controller (LVTS_CTRL).
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8195-lvts-ap
> +      - mediatek,mt8195-lvts-mcu

What about other devices? You called the file name as generic for all
Mediatek SoCs, so why only one SoC is here? Is there going to be more?
If yes, why they cannot be added now?

Best regards,
Krzysztof


