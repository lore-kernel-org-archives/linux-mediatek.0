Return-Path: <SRS0=it3p=NO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7800DC432BE
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 06:54:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35FDB611C8
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 06:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 35FDB611C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PlNjoNZnG904490EWvBOK+viCx9H61gCjWkacLkqpLs=; b=QUzwVKxo9C7t8i
	3aLte+7XRiyROgw/2ydRG7N6dq/vBUa6yF/BT3UOrly6gmE6JMS3x3QRjTyapXExW44bBAeOL2CbP
	m8DyocoKrUvG1t4SjXlWFJrXrVGGqrOaKGCBlTdn112pcgNY7gX2YTEQQ8KewcqDWnxThleLXtaR/
	XaKFwDa1k4hjOTDzikmRgl6N6Bit1i9fzwk/1iqHZ6U1Tn7FNDtSVouZoU4HFft6urbnW9MxD7+bT
	ldS0yWMAbx6HFbQHG/jqZF3FUvz5flIDlzhdFI/NZmqyNTM3QiczTq/n4+asyEnBoMCkL867MsPAz
	k2mU/wC/jNw337fINqnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI3qW-00FZ8a-2S; Mon, 23 Aug 2021 06:54:12 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI3q7-00FYwa-Ir
 for linux-mediatek@lists.infradead.org; Mon, 23 Aug 2021 06:53:51 +0000
Received: by mail-lf1-x133.google.com with SMTP id u22so35774159lfq.13
 for <linux-mediatek@lists.infradead.org>; Sun, 22 Aug 2021 23:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ykVwd28+PpS9RdFtwLjN4T/dzr4Pp61Ec9sxPTtcctc=;
 b=J1ffpX3IK1WLgUymbrNtz4fC5SSzlNQoHe9i5k3n9fPJ3OyXL1cEhKhqg7JTfQXsqb
 gxIp9u/kV11VpBiYxcQ7TKGNkG5fheHOcrJHHRE/xv2ZKa13vPtCsMEnMhaT1ZyqP/gq
 PVBK1Gbsn2A6HFPU7XC7ioqAN3pMiNhqFPrPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ykVwd28+PpS9RdFtwLjN4T/dzr4Pp61Ec9sxPTtcctc=;
 b=WfLc2rYKBwAb7WRyXTZg2bSk7OKOc9pcl3+m/pyKvLhwvHvV1fWYILAwMpAT/g3vq7
 wGeJ24gqicMD+bSZVwSOX5eoVnXoqZdlv6G8u2VLl8XCm2uH2CNgVmAYZ2nkQbycDpfb
 KFDK8tUO3DVSeyn90khbeWMZtUdgzUfH3SgOt0EaFfUbg9wWMEKHKokG47M3qqw3B4/8
 Ujsp+SfjhfFqHFyu8O2OVpRKtedkzMnSp0fimKcq7bRFNU0STD8X56uCAbPMebMi/ra2
 xpa9FTlIbYCKlZ68KrCnjdwS0uKD1F6Rbmw51+5aytiZ4E1OPpQ2UxE8EpehzMbdRPqJ
 7UZg==
X-Gm-Message-State: AOAM531ehsoMpbTAn2oTci3Ilenz0G57zUim0QU7llPaE4tZPXY/wPv7
 oCbApNQFOK0OLSbtGAxszpTbDT7E2BIEOvFVbvXltw==
X-Google-Smtp-Source: ABdhPJxh0ZhiKQDi+P2hyKg41D5UpaAEP74ceBsTgaXwXWkhWXIx8uAAhgWwAorVWvx9v84bqXxUIka1tGuDnu6MVd8=
X-Received: by 2002:a19:ca09:: with SMTP id a9mr8363402lfg.342.1629701625387; 
 Sun, 22 Aug 2021 23:53:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210820111504.350-1-chun-jie.chen@mediatek.com>
 <20210820111504.350-2-chun-jie.chen@mediatek.com>
In-Reply-To: <20210820111504.350-2-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 23 Aug 2021 14:53:34 +0800
Message-ID: <CAGXv+5FAEFD+dQsZzyZOzmwDDnwLZO3Z8wv8Z-=wVYdjjc3FYg@mail.gmail.com>
Subject: Re: [v2 01/24] dt-bindings: ARM: Mediatek: Add new document bindings
 of MT8195 clock
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-clk@vger.kernel.org, Devicetree List <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210822_235347_719671_CFF5D816 
X-CRM114-Status: GOOD (  16.65  )
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

Hi,

On Fri, Aug 20, 2021 at 7:17 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> This patch adds the new binding documentation for system clock
> and functional clock on Mediatek MT8195.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  .../arm/mediatek/mediatek,mt8195-clock.yaml   | 254 ++++++++++++++++++
>  .../mediatek/mediatek,mt8195-sys-clock.yaml   |  73 +++++
>  2 files changed, 327 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-sys-clock.yaml
>
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
> new file mode 100644
> index 000000000000..17fcbb45d121
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
> @@ -0,0 +1,254 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt8195-clock.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: MediaTek Functional Clock Controller for MT8195
> +
> +maintainers:
> +  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
> +
> +description:
> +  The clock architecture in Mediatek like below
> +  PLLs -->
> +          dividers -->
> +                      muxes
> +                           -->
> +                              clock gate
> +
> +  The devices except apusys_pll provide clock gate control in different IP blocks.
> +  The apusys_pll provides Plls which generated from SoC 26m for AI Processing Unit.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt8195-scp_adsp
> +          - mediatek,mt8195-imp_iic_wrap_s
> +          - mediatek,mt8195-imp_iic_wrap_w
> +          - mediatek,mt8195-mfgcfg
> +          - mediatek,mt8195-vppsys0
> +          - mediatek,mt8195-wpesys
> +          - mediatek,mt8195-wpesys_vpp0
> +          - mediatek,mt8195-wpesys_vpp1
> +          - mediatek,mt8195-vppsys1
> +          - mediatek,mt8195-imgsys
> +          - mediatek,mt8195-imgsys1_dip_top
> +          - mediatek,mt8195-imgsys1_dip_nr
> +          - mediatek,mt8195-imgsys1_wpe
> +          - mediatek,mt8195-ipesys
> +          - mediatek,mt8195-camsys
> +          - mediatek,mt8195-camsys_rawa
> +          - mediatek,mt8195-camsys_yuva
> +          - mediatek,mt8195-camsys_rawb
> +          - mediatek,mt8195-camsys_yuvb
> +          - mediatek,mt8195-camsys_mraw
> +          - mediatek,mt8195-ccusys
> +          - mediatek,mt8195-vdecsys_soc
> +          - mediatek,mt8195-vdecsys
> +          - mediatek,mt8195-vdecsys_core1
> +          - mediatek,mt8195-vencsys
> +          - mediatek,mt8195-vencsys_core1
> +          - mediatek,mt8195-apusys_pll

The indentation is slightly off by 2 extra spaces.

[...]

> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-sys-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-sys-clock.yaml
> new file mode 100644
> index 000000000000..dbf33ea6cb9f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-sys-clock.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt8195-sys-clock.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: MediaTek System Clock Controller for MT8195
> +
> +maintainers:
> +  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
> +
> +description:
> +  The clock architecture in Mediaek like below

Typo.

> +  PLLs -->
> +          dividers -->
> +                      muxes
> +                           -->
> +                              clock gate
> +
> +  The apmixedsys provides most of PLLs which generated from SoC 26m.
> +  The topckgen provides dividers and muxes which provide the clock source to other IP blocks.
> +  The infracfg_ao and pericfg_ao provides clock gate in peripheral and infrastructure IP blocks.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt8195-topckgen
> +          - mediatek,mt8195-infracfg_ao
> +          - mediatek,mt8195-apmixedsys
> +          - mediatek,mt8195-pericfg_ao

Indentation off here as well.

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
