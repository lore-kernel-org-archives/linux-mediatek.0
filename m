Return-Path: <SRS0=fB7w=DM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF487C4363A
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2020 12:42:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 669132078D
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2020 12:42:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qWQth3Gl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w4lwZr5a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 669132078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LzqEoxZeAnJmEBI6ImjixrydrLbjUw+HGJv9Teyevso=; b=qWQth3GloCrA2CQwSiTN9jyPr
	gsYR69kAPhrUH/KwdGxyyyzhIK8eNqT+p3fC32skkdEp36VDoQxTZAcLH/Zj4SP/db2MVfkAlUe+8
	ECBYoEQGaU/YFJDgQzNJmNYghMBgMTEa/sH99/WtIDj0rv2EQcfTFp2pn66ATyEN220qah95d7ag7
	nBCadgYYSuHD4oo8kxV8wO8RKxd6k4mCctFffPqKJT6XlE3JM4IdNJOqny8Dyu30sFJ+M6RB3XPB9
	Qm/2e0zsWqMz3x/N4yEu25qz26uYYsQXpZWPsxTn+qIdBPiNkgsB99Empc8JzptLl5E9+pH6dFcgA
	foVAyY6jg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPPoO-0003At-7g; Mon, 05 Oct 2020 12:41:52 +0000
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPPoI-00039P-TK
 for linux-mediatek@lists.infradead.org; Mon, 05 Oct 2020 12:41:49 +0000
Received: by mail-vs1-xe43.google.com with SMTP id 7so4128030vsp.6
 for <linux-mediatek@lists.infradead.org>; Mon, 05 Oct 2020 05:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QE8OHLLcshoqgjao9rxTR2B1cn1gmKyp5nFcvuAzyYM=;
 b=w4lwZr5ahf5vTfr/Sla6b9a6dJJrqMnNnrGCPpE0A2wgptS0+tqhygVB/9v5pdY9tq
 EPJSfiiRWtTDaHXg5QxfgPtgsr6eVXsd5vY8SOM3X5IOjGHhZrbuIQXyyPKjaUX8dLa6
 UIoQYFdsNUiMnVM5DsdprGSSd3qR6RJ7OMFeNT+N43JBkBWzthRqYPGIRMA6MfnhUjDG
 0c+wWti7GTA7T4jaI9by9FdHpfMknlUb+dG2dUAfXt7RPnbPhVm6V1vOTEwrce449Fsz
 03LBUC4NbemiPguroR9bJNjOWUXBqcX7Nrb/AGC+7ptNcprwfJQqzkoBibsti/lCJmrA
 tZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QE8OHLLcshoqgjao9rxTR2B1cn1gmKyp5nFcvuAzyYM=;
 b=FfckTRjOdPtZICoiQbuZwEFfL/Me/hqtjqG/cklOQkK5pKyYsuTPdPeHQBa4L3AmXp
 Z+nViAIUHpIOL9nSfxt5KRx12bxB47TtcFOlA768eZkJiw+mVG3Jucx08MvN7zB2ecow
 6tR/EcrE6ruCG0jIu8y+h8JPM33/lUu+Z8+GqtYMz0xWH/k2waohZLJ5K6JRogOOkLAI
 R6a4GR1rqOHR0cBwGZbxSEh245CqvVd4QxiGo4q5MdqlbxMBD/JLKXmWqm4vNuw9wKVD
 NbVhUhnx0yJSM4WDgB9VZ7BNyTBokaWA6yL4sDfyXf6FDIORseqbtUCZfJ+T+5uDgVhR
 0doQ==
X-Gm-Message-State: AOAM533b5K/K0YHrLa0mrsiVtH199Alc7bWs9ceQ6dxbxI3WgXzc+R0q
 +cCGq5hfGlVXrNYZI5Dwk25AWN1OUZi7w9gh1xVaPg==
X-Google-Smtp-Source: ABdhPJxW3PRcgihH+QhiZOdYzkdNBQPK1MQvkyo/5kU829snF+RDUnnYIRaeoeosnQLf5x/uy3/9W6WqD+wG+F7Wjt8=
X-Received: by 2002:a67:ec9a:: with SMTP id h26mr7259024vsp.34.1601901704719; 
 Mon, 05 Oct 2020 05:41:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200930083120.11971-1-wenbin.mei@mediatek.com>
 <20200930083120.11971-2-wenbin.mei@mediatek.com>
In-Reply-To: <20200930083120.11971-2-wenbin.mei@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 5 Oct 2020 14:41:08 +0200
Message-ID: <CAPDyKFrM9o7DjBstQXEnKcLsAt0uNh7xKTYEYrz=JTBM9TKgpQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: mmc: Convert mtk-sd to json-schema
To: Wenbin Mei <wenbin.mei@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_084147_159967_109A1EA8 
X-CRM114-Status: GOOD (  17.24  )
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
Cc: DTML <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

[...]

> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> new file mode 100644
> index 000000000000..7f89cbdc52a5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -0,0 +1,168 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MTK MSDC Storage Host Controller Binding
> +
> +maintainers:
> +  - Chaotian Jing <chaotian.jing@mediatek.com>
> +  - Wenbin Mei <wenbin.mei@mediatek.com>
> +
> +allOf:
> +  - $ref: mmc-controller.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +        - mediatek,mt2701-mmc
> +        - mediatek,mt2712-mmc
> +        - mediatek,mt6779-mmc
> +        - mediatek,mt7620-mmc
> +        - mediatek,mt7622-mmc
> +        - mediatek,mt8135-mmc
> +        - mediatek,mt8173-mmc
> +        - mediatek,mt8183-mmc
> +        - mediatek,mt8516-mmc
> +      - items:
> +        - const: mediatek,mt7623-mmc
> +        - const: mediatek,mt2701-mmc
> +
> +  clocks:
> +    description:
> +      Should contain phandle for the clock feeding the MMC controller.
> +    minItems: 2
> +    maxItems: 4
> +    items:
> +      - description: source clock (required).
> +      - description: HCLK which used for host (required).
> +      - description: independent source clock gate (required for MT2712).
> +      - description: bus clock used for internal register access (required for MT2712 MSDC0/3).
> +
> +  clock-names:
> +    minItems: 2
> +    maxItems: 4
> +    items:
> +      - const: source
> +      - const: hclk
> +      - const: source_cg
> +      - const: bus_clk
> +
> +  pinctrl-names:
> +    items:
> +      - const: default
> +      - const: state_uhs
> +
> +  pinctrl-0:
> +    description:
> +      should contain default/high speed pin ctrl.
> +    maxItems: 1
> +
> +  pinctrl-1:
> +    description:
> +      should contain uhs mode pin ctrl.
> +    maxItems: 1
> +
> +  vmmc-supply:
> +    description:
> +      power to the Core.
> +    maxItems: 1
> +
> +  vqmmc-supply:
> +    description:
> +      power to the IO.
> +    maxItems: 1

The vmmc and vqmmc are described in the mmc-controller.yaml, so
shouldn't be needed here.

> +
> +  assigned-clocks:
> +    description:
> +      PLL of the source clock.
> +    maxItems: 1
> +
> +  assigned-clock-parents:
> +    description:
> +      parent of source clock, used for HS400 mode to get 400Mhz source clock.
> +    maxItems: 1
> +
> +  hs400-ds-delay:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      HS400 DS delay setting.
> +    minimum: 0
> +    maximum: 0xffffffff
> +
> +  mediatek,hs200-cmd-int-delay:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      HS200 command internal delay setting.
> +      This field has total 32 stages.
> +      The value is an integer from 0 to 31.
> +    minimum: 0
> +    maximum: 31
> +
> +  mediatek,hs400-cmd-int-delay:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      HS400 command internal delay setting.
> +      This field has total 32 stages.
> +      The value is an integer from 0 to 31.
> +    minimum: 0
> +    maximum: 31
> +
> +  mediatek,hs400-cmd-resp-sel-rising:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      HS400 command response sample selection.
> +      If present, HS400 command responses are sampled on rising edges.
> +      If not present, HS400 command responses are sampled on falling edges.
> +
> +  mediatek,latch-ck:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Some SoCs do not support enhance_rx, need set correct latch-ck to avoid
> +      data crc error caused by stop clock(fifo full) Valid range = [0:0x7].
> +      if not present, default value is 0.
> +      applied to compatible "mediatek,mt2701-mmc".
> +    minimum: 0
> +    maximum: 7
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    const: hrst
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names

According to the current bindings, the vmmc/vqmmc supplies and the
pinctrls are required as well. I assume you should add them here too!?

[...]

Kind regards
Uffe

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
