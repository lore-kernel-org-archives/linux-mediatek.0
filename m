Return-Path: <SRS0=7QZl=7W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABA75C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2020 17:36:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 594372074B
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2020 17:36:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZJRP7vuK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 594372074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/PGBmYmz8r13IsyRhqYRGmiYZCeJCJgKxU3M4F1KjXA=; b=ZJRP7vuKO3mrk7
	wS0QyK68y/uIF/Zl3mFqhn9sg3Tc7+NY9iFMSKq1QxFkuSHlG+ySAT3Qqktv9PgbGCBph7RCnSq/k
	tFZkJ7sQWdzg17V8QkTQU9ASYupnaBFffPidqyPJjGw6OzRPJNMDk/mfiUmGJe+wP/LBghG6wtwVv
	XU3dSEtQ+R4U7Bh7C1LHMvdXUN1JCer0CQuX483yylYMIteiMXBtXBS6qrz5Y/yDZPVATB+vBWb/i
	hKIlUGHzkK44Bqn+91pFvYR5qXa+ZhJyO9gVVj1ZVEzk9QueU3GrMwQ6HNp7ZmiGtHEtF3aIKJZOx
	0SCrpVABvHqh/VEiLlRQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiiAR-0007WP-F5; Tue, 09 Jun 2020 17:36:07 +0000
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiiAH-0007Mc-I1; Tue, 09 Jun 2020 17:35:59 +0000
Received: by mail-io1-f66.google.com with SMTP id q8so23694854iow.7;
 Tue, 09 Jun 2020 10:35:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UemfyzL4CDaIbSMWhLIN31hIuc2Yr7jCv1si14uauIA=;
 b=UaBKcCRjWzpd+BcDyyV9ADuQyAyaGxJO7uGhaiJjCK7I3baYFTMU5G1CcOnxxkP2DM
 cki8t2yIux4AGzICzhZU3ZSEUPbfSx2Zd/E25cDrI9oB2dGHql/GSzWWYeZA83wPKcOb
 +ZBC9LNrZmQasE/8mUxexqpUkj/FOw/zZ3H77frEu3efHdcMNlVnSSQdZCIUEWZKtLnh
 jElKsZXPOOA03uVrFpdkX/TjsUGqAoxa79GeddIt6RP0Y/YVdehpr1UqXmHMl8bKsACx
 vfcT2bSk2w3qGDqCXI+9uYJ57Ux0ry6eB+Y1Gy7d3TEVWnjYQVmiYANagLQrwueTJo9l
 zGcw==
X-Gm-Message-State: AOAM5336ijOSNjv+K8OuD7Z6+4cn6I6pVUuHGvRpDfUG7RlA0vvcgXas
 44H+MIunjUQeQyTbI177Vg==
X-Google-Smtp-Source: ABdhPJyHA9bqkWZOLvk/hYOQV0AQki68RB2uY7Ob2Db2LSH4HMdre46KjSCiZoV+zVZ26b+BnZ/s9A==
X-Received: by 2002:a6b:1745:: with SMTP id 66mr12153914iox.151.1591724156628; 
 Tue, 09 Jun 2020 10:35:56 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id z4sm7599577iot.24.2020.06.09.10.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 10:35:56 -0700 (PDT)
Received: (nullmailer pid 1125416 invoked by uid 1000);
 Tue, 09 Jun 2020 17:35:54 -0000
Date: Tue, 9 Jun 2020 11:35:54 -0600
From: Rob Herring <robh@kernel.org>
To: Roger Lu <roger.lu@mediatek.com>
Subject: Re: [PATCH v9 1/4] dt-bindings: power: avs: add mtk svs dt-bindings
Message-ID: <20200609173554.GA1119852@bogus>
References: <20200609104534.29314-1-roger.lu@mediatek.com>
 <20200609104534.29314-2-roger.lu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200609104534.29314-2-roger.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200609_103557_589898_B0B9E698 
X-CRM114-Status: GOOD (  15.75  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@google.com>,
 Angus Lin <Angus.Lin@mediatek.com>, Kevin Hilman <khilman@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, HenryC Chen <HenryC.Chen@mediatek.com>,
 YT Lee <yt.lee@mediatek.com>, Fan Chen <fan.chen@mediatek.com>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Nishanth Menon <nm@ti.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jun 09, 2020 at 06:45:31PM +0800, Roger Lu wrote:
> Document the binding for enabling mtk svs on MediaTek SoC.
> 
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> ---
>  .../bindings/power/avs/mtk_svs.yaml           | 141 ++++++++++++++++++
>  1 file changed, 141 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/avs/mtk_svs.yaml
> 
> diff --git a/Documentation/devicetree/bindings/power/avs/mtk_svs.yaml b/Documentation/devicetree/bindings/power/avs/mtk_svs.yaml
> new file mode 100644
> index 000000000000..f16f4eb56ee3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/avs/mtk_svs.yaml
> @@ -0,0 +1,141 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/avs/mtk_svs.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Introduce SVS engine
> +
> +maintainers:
> +  - Kevin Hilman <khilman@kernel.org>
> +  - Nishanth Menon <nm@ti.com>
> +
> +description: |+
> +  The Smart Voltage Scaling(SVS) engine is a piece of hardware
> +  which has several controllers(banks) for calculating suitable
> +  voltage to different power domains(CPU/GPU/CCI) according to
> +  chip process corner, temperatures and other factors. Then DVFS
> +  driver could apply SVS bank voltage to PMIC/Buck.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8183-svs
> +
> +  reg:
> +    description: Address range of the MTK SVS controller.
> +    maxItems: 1
> +
> +  interrupts:
> +    description: IRQ for the MTK SVS controller.
> +    maxItems: 1
> +
> +  clocks:
> +    description: Main clock for svs controller to work.
> +
> +  clock-names:
> +    const: main
> +
> +  nvmem-cells:
> +    maxItems: 2
> +    description:
> +      Phandle to the calibration data provided by a nvmem device.
> +
> +  nvmem-cell-names:
> +    items:
> +      - const: svs-calibration-data
> +      - const: calibration-data
> +
> +patternProperties:
> +  "^svs-(cpu-little|cpu-big|cci|gpu)$":
> +    type: object
> +    description:
> +      Each subnode represents one SVS bank.
> +        - svs-cpu-little (SVS bank device node of little CPU)
> +        - svs-cpu-big (SVS bank device node of big CPU)
> +        - svs-cci (SVS bank device node of CCI)
> +        - svs-gpu (SVS bank device node of GPU)

As I've said before, I don't think these child nodes make sense. All 
this data should already be available elsewhere in the DT.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
