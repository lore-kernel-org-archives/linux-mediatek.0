Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2EE3C433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 15:53:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8014E61246
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 15:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8014E61246
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oR0A6Co6ikHmYaL4gURnvVkfbmlIGWZ6KdnGNVMQO94=; b=RTUUXGPgAh4X8TsbTg2MqnJS4
	GNM1AES8jfCNlFyvPsTejmyMkwOHAAYWjpHhAbTwDmJrVwHT2vGliZ04pn8jnnG2/W9GrHofojPcV
	pPO44BUJFvqVdA/cj7jDaP8w4UuvGRfbUk26bVtnFelk/kvAV3Qoj0vE25OlGRfAscveYpacqaMN4
	/WYtTUcILtDKGPmHTdn/DpPzR9DiK1Qy7ZI66iGhxPOCKxWX94FSICtcGE+bVHYVUxTu24EUK5tsn
	PEWo5bXoiYckE2gVAn6fC18unFkU/kmjt1qYm/7RZgYuXS8aFGx9DPFjXj4G3rqqUafgThofU35G6
	Wg03oqfPw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVysB-007AFf-Qk; Mon, 12 Apr 2021 15:53:11 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVys0-007AEZ-PJ
 for linux-mediatek@desiato.infradead.org; Mon, 12 Apr 2021 15:53:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=uV02flmSrRt81WJ4T3wiSuGURL6Hk/SHKuFa7qavV00=; b=mWZfqqrsZzMdyEqweJkoc0U1cs
 0IcI9CLtAora3ZzKtBRXpLkFycjIrsHkQX6/03n+6FtpEzNIVL0trZYjMW6ltfHVVcVzluLURQl0N
 LnECCfetLqLPABao39NTl26G24M/1EGQprdKi3wadNhg6VIufW/ZXVyU4Cy9tCBAieLy54EAk1CoR
 qf5zpAGA7Ftccpe0M0+Qc154LBXYU+MFh/OW+plbaXGMvpQi4OqhRdpXmXV424gTGUIX1crjWzUAy
 2RrYr611ymBfh7b8s+Gee4EQYsRDPpwcXwP6w94ZAC8xa2f7mTibDVy+gMrgJyZw154ZktVlsuZiz
 1S3g0swQ==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVyrx-006MbW-Da
 for linux-mediatek@lists.infradead.org; Mon, 12 Apr 2021 15:52:59 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 g18-20020a7bc4d20000b0290116042cfdd8so9012869wmk.4
 for <linux-mediatek@lists.infradead.org>; Mon, 12 Apr 2021 08:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uV02flmSrRt81WJ4T3wiSuGURL6Hk/SHKuFa7qavV00=;
 b=RjCj+XhW0mahSBR+DCjq261dtioFS3pQNq26EqT2Eme+Qgs1kQY7q87bJJp6ROMlz3
 5TJYBHplQvmY0YB9sIglMsOH5V6KN8wL8vLTUZ+aqt4weVGFL7awcTi24PtR3Gb6H5wD
 a5CsXAlFfYCAtrqLykuU0dVkaBOrQV2/tlGJX2Uu5CL7VEaIAXlUYSRbE7woTcHatmL4
 rGlNPvxo33IMFNfke109vH5LbDqfjBWdYMjWvJMuzN5DpvqtIh3ycy7ch7GmANIvm1zK
 icz6085aChrb+HiSMhFMqdr/qkpO3IZbevQJVTJpM3Rw4ENv25e9DpDZSrOod1km+z8S
 sOkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=uV02flmSrRt81WJ4T3wiSuGURL6Hk/SHKuFa7qavV00=;
 b=Y5avUPOyvOWAOPs+qL9tOVJ6hJLTTSM0/86aKlrsjVaCE5iDgdxd9uCAo2JgFP+QhO
 uOGTMJ+WuYVMNTAGPSKYkkhoITjbUio9BqGZiS0cts5uhNGAIP7FlGxIbKER/C66fGF9
 0vGsmtijbGNenA6CtOTNhaN3JlVbYjhf5xjgCaevJN+gs9B0ojZa4M0rmxX/IVO3qzRZ
 b7fb/JSotucs8az8J5eTucNNDOPHuD1woOrJZPlwJOnWeg0cErPL4ENiR8NtGESAauFf
 tblZ9izkwPTlcJQz2oRM5IHdgdUp2/HleM8Yb/Wd6Q1Hh7Dw4gOkR9YLXrMa+UwkKqpx
 ioJQ==
X-Gm-Message-State: AOAM532wsC34NzhzSOLXAh+S8tkd2mzdbFfnE/jhlEFdSOBv/1uPHszf
 j+ay+4tk2M70HEPQeC3VA/mOjg==
X-Google-Smtp-Source: ABdhPJwfbFcviVSfTAbSMAnrXzK7dC+k5xmXgB/S2xxGvTPdrnsrbWO6uw4gslsvMhncxNmUXUSSSg==
X-Received: by 2002:a1c:4d0e:: with SMTP id o14mr4859927wmh.141.1618242775624; 
 Mon, 12 Apr 2021 08:52:55 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:4c21:b00e:ff79:bf20?
 ([2a01:e0a:90c:e290:4c21:b00e:ff79:bf20])
 by smtp.gmail.com with ESMTPSA id g84sm15277215wmf.30.2021.04.12.08.52.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Apr 2021 08:52:55 -0700 (PDT)
Subject: Re: [PATCH v2 1/5] dt-bindings: display: mediatek,hdmi: Convert to
 use graph schema
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210412093928.3321194-1-narmstrong@baylibre.com>
 <20210412093928.3321194-2-narmstrong@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <415e0331-fc7c-6362-e81d-108f7ff8a654@baylibre.com>
Date: Mon, 12 Apr 2021 17:52:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210412093928.3321194-2-narmstrong@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_085257_501010_FBFCC7CA 
X-CRM114-Status: GOOD (  16.40  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 12/04/2021 11:39, Neil Armstrong wrote:
> Update the mediatek,dpi binding to use the graph schema.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../display/mediatek/mediatek,cec.yaml        |  51 +++++++
>  .../display/mediatek/mediatek,hdmi-ddc.yaml   |  57 ++++++++
>  .../display/mediatek/mediatek,hdmi.txt        | 136 ------------------
>  .../display/mediatek/mediatek,hdmi.yaml       | 131 +++++++++++++++++
>  4 files changed, 239 insertions(+), 136 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
> new file mode 100644
> index 000000000000..408e7dfce409
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,cec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek HDMI CEC Controller Device Tree Bindings
> +
> +maintainers:
> +  - CK Hu <ck.hu@mediatek.com>
> +  - Jitao shi <jitao.shi@mediatek.com>
> +
> +description: |
> +  The HDMI CEC controller handles hotplug detection and CEC communication.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt7623-hdmi

=> mediatek,mt7623-cec

> +      - mediatek,mt8173-hdmi

=> mediatek,mt8173-cec

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1

[..]

> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
> new file mode 100644
> index 000000000000..c15b3470d652
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,hdmi-ddc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek HDMI DDC Device Tree Bindings
> +
> +maintainers:
> +  - CK Hu <ck.hu@mediatek.com>
> +  - Jitao shi <jitao.shi@mediatek.com>
> +
> +description: |
> +  The HDMI DDC i2c controller is used to interface with the HDMI DDC pins.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt7623-hdmi

=> mediatek,mt7623-hdmi-ddc

> +      - mediatek,mt8173-hdmi

=> mediatek,mt8173-hdmi-ddc

> +
> +  reg:
> +    maxItems: 1


[..]
will repost with these fixes in  a few days,

Neil

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
