Return-Path: <SRS0=osr7=J7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B2CC433B4
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 May 2021 14:03:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D4A3610FA
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 May 2021 14:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D4A3610FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aEigFEDSRLegwp/s+7hKVRRaAvjgVmXvGrrxO12E/64=; b=lN7/Ij3OdhPlw2gavEgoTTUCO
	U2aobYxJUNd0q0B/NeiRJK2Y2Q+3X3shlLc/e44lJh0RFbztI9aSoBDarWregDAsqEGaYqzcRc5N5
	ysOCmrs43BAuMn/uD29WlAyPOM4JFFL2JNcIlJTi+qPPieAI0eR0VMW2Y4IheAubMre9b/C706+ZC
	76m6/S8tg0vQ4fRvsVQVz4QNT9qgC6IpnQPrXSJW+QezKodlZZavXkFeroGh3mVrpaW3uVHLrB7vw
	ZuE2MKh5vaLnmTMJk1riR5WGSGRxYH4oq4RlrWommwgQgpi4mtoCr3QkNTRBMm8iGZHjm3vtuUXdO
	foSqdEMxA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldvdV-00GKWa-IX; Tue, 04 May 2021 14:02:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldvdU-00GKWV-32
 for linux-mediatek@desiato.infradead.org; Tue, 04 May 2021 14:02:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=dNDWyjCrI63gNu7CAOFoq1OwHM7ZaGvjz+swFF+XPc0=; b=rXXQxfHoLd0fOmmXrh0SC8JTec
 dSITFmTpOL2/oWVygu6hCKYBCUOpr2u/WyA4BIZWm6xQR91GqhnshhCVXC94d/8RnzYOQ5FC9fMwO
 cSb9Xfnt+o+XGxw2AGnPVHdU/v06yAi54DJrz2C5fltMcisNHvotsJ8iBwYz95Vx+lvjdnMdqKI3Y
 sfcyVanDrDDpfbjz0NxyDsTSOLQ3ndFTKtHCU5l7I249dc/sNcHhogxtS5vz1CkUUYKo2KHA8B3e2
 dr2182fPEqzujy/QpdoYGAljvUZAr8aGiqRnS8rN2dWz14Kpd8P+ytLPgNLIuB1Kr0RiqwRDs1pND
 fsudX/CA==;
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldvdQ-0041SN-VZ
 for linux-mediatek@lists.infradead.org; Tue, 04 May 2021 14:02:50 +0000
Received: from mail-qk1-f197.google.com ([209.85.222.197])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1ldvdK-0002YA-G5
 for linux-mediatek@lists.infradead.org; Tue, 04 May 2021 14:02:42 +0000
Received: by mail-qk1-f197.google.com with SMTP id
 p17-20020a05620a1131b02902e45c6e4d33so7588541qkk.0
 for <linux-mediatek@lists.infradead.org>; Tue, 04 May 2021 07:02:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dNDWyjCrI63gNu7CAOFoq1OwHM7ZaGvjz+swFF+XPc0=;
 b=kvLC4z16lklb1WTjfSHo3luJRA/Hb55VH2jjkhtOS/8pm50QONvSfKRD/ddZcN22T5
 eBlXlPaFhLiM+G0XBD0rMzJdv0cZGwSXvEpKOLeiTbeKa5EPB5JVfBGSvTaDK8B8LcaI
 n+m2Lvlwc9kWhkOCGmzdtXTdNVlJ40Ds4wqx+NGAxhRtwLYS678a5jrRQDYvYfCHkQV7
 0FrgzWnHGUjMEkYRLTRt5XY5NGkIb/u80JADSQbnN4wKHybeIkX733uGAGuVROriWXKT
 eCRlJftjkrobSQdnK5sqDFYleXfMajft/E48xbW+fNwWOWDQOk3Dwy9pABiXTtk4toPe
 xuBw==
X-Gm-Message-State: AOAM531SMLpErHtDUCY7kF3pI/yM4ONRIQkqcEZSkPlOzZe3ZWIkccnR
 sEicaqZsUKGAO7+UmBPxWZeNaNaDltwgCAItnDp64L0dOG1ObdKQaQ9miLoEESkS+ZfR2OidB7X
 ZRQu4y2Ch5cKYuaClWUB9f696Ut2L4XxxIzUApK3o4RZHXbWDDg==
X-Received: by 2002:a37:71c3:: with SMTP id
 m186mr24351394qkc.453.1620136961677; 
 Tue, 04 May 2021 07:02:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9BzIFfPiOwW7tb/ixZQudtejnztxJhuZARX74hAwV9Soc7Zdnc/GftsPh97w+WCF20UWFSw==
X-Received: by 2002:a37:71c3:: with SMTP id
 m186mr24351373qkc.453.1620136961454; 
 Tue, 04 May 2021 07:02:41 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.49.3])
 by smtp.gmail.com with ESMTPSA id n16sm2471133qtl.48.2021.05.04.07.02.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 May 2021 07:02:40 -0700 (PDT)
Subject: Re: [PATCH v2 1/4] dt-bindings: memory: Add binding for MediaTek DRAM
 Controller
To: Po-Kai Chi <pk.chi@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 CC Hwang <cc.hwang@mediatek.com>
References: <1618565538-6972-1-git-send-email-pk.chi@mediatek.com>
 <1618565538-6972-2-git-send-email-pk.chi@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <8a4c97e4-0281-9aca-76e0-522c72cae7a4@canonical.com>
Date: Tue, 4 May 2021 10:00:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1618565538-6972-2-git-send-email-pk.chi@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_070249_182447_F2860D78 
X-CRM114-Status: GOOD (  18.15  )
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

On 16/04/2021 05:32, Po-Kai Chi wrote:
> This patch adds the documentation of the device-tree binding for
> MediaTek DRAM Controller.
> 
> Signed-off-by: Po-Kai Chi <pk.chi@mediatek.com>
> ---
>  .../memory-controllers/mediatek,dramc.yaml         |  162 ++++++++++++++++++++
>  1 file changed, 162 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml
> new file mode 100644
> index 0000000..18f77c2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml
> @@ -0,0 +1,162 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2021 MediaTek Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/memory-controllers/mediatek,dramc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek DRAM Controller
> +
> +maintainers:
> +  - Po-Kai Chi <pk.chi@mediatek.com>
> +
> +description: |
> +  MediaTek DRAM controller (DRAMC) provides an interface to query information
> +  about DRAM which collected from bootloader and device tree.
> +  This is mainly used by MediaTek Extended Memory Interface (EMI) and DVFS Resource
> +  Control (DVFSRC).
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:

Not an enum.

> +          - mediatek,mt6779-dramc

NAK.

You missed to Cc people who should review this (e.g. Rob). Please start
using get_maintainers script.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
