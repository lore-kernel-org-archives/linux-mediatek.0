Return-Path: <SRS0=bg5C=NW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 242E9C432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 22:13:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D974A60F56
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 22:13:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D974A60F56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ApZeBs7VKKG3crDU91i8UFvIJNqfXJJPAKt5qbppns=; b=isNy9SSkrAsP4x
	bpMNdj/rvUgKpV3LPK5f0F7pIe37LBLFy0VOufzRMdyi1TtZ9aEwBhHIqiGjPJd3QF2HlvdMwjkFO
	DHApESuUQovewbnlDv/OOku7VWS7O83ZP7yKjgusoJn65uapZilmWp6LSXx3g1vUmxPRhbGUBLK76
	kRS3zC7Xe1ZZe5JT1QSw/zbPfs8wbDLYJw4w0BsYghNjefCaQa0xemD6KEPS2hc/GO2XPsB5kaTah
	sAErqePhCFIayFlDDcMAz8yyTW9+dlcP5Sw0Swd8oBa9Or2zW/P2JhP+Xg3XfkEFItteGOvFv9pb1
	WMIgdcwAZfMyx8j7INEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLC0J-003IdF-Ep; Tue, 31 Aug 2021 22:13:15 +0000
Received: from mail-ot1-f47.google.com ([209.85.210.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLC06-003IbQ-GN; Tue, 31 Aug 2021 22:13:03 +0000
Received: by mail-ot1-f47.google.com with SMTP id
 c19-20020a9d6153000000b0051829acbfc7so1056153otk.9; 
 Tue, 31 Aug 2021 15:13:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZX+HYfB8T7lqB7oM6NTvI7e2KeIFR4Q4WaO7nRRDb5k=;
 b=dgOoBmaT4t+DTTChzRCe56jC06BskeDeTa2SUTLp5vAPc0IkuhDZE43xLRwVqpX7cJ
 z3ZvGQ78SveuUpO7A5znpEERuCGvcySKHI0sq1MxcziItOo8B3mk6d86nnxGYxhtiejR
 Kcr7Yked0/FCegmD1Mlvgiq1xXPMqacTUYQEaKxQ5Xr/FJMGkXfMSkfBkQTqvq6aKjEQ
 7B6Rq8nGz9d7EHvJx1630KD6hWftk088uVXx+NqdcIeSPjbjxwD4EG0ntJk0q3aRscrU
 ZuwO5tmeDeYzmwDP3Ue22+0ktT6lT/3rvwdEsMBob6VSH8Ly6+GKFYhp07E3KSV5F+Sd
 038A==
X-Gm-Message-State: AOAM532c8DVMrPttwtQoWbMCs+t4bEudGuQljDko0C3xyNsjrQJhS2dd
 eJj3iza3pzKbVo017t07cQ==
X-Google-Smtp-Source: ABdhPJxjm1/Aq+KESj1LLY5oPb7CeYJ3OoUGohOGiGVBqGpgGf4+usowBjaHVrFMsg2fj3gJPvibvA==
X-Received: by 2002:a9d:2053:: with SMTP id n77mr27506291ota.9.1630447981665; 
 Tue, 31 Aug 2021 15:13:01 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id v24sm4221903ote.66.2021.08.31.15.13.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 15:13:01 -0700 (PDT)
Received: (nullmailer pid 735476 invoked by uid 1000);
 Tue, 31 Aug 2021 22:13:00 -0000
Date: Tue, 31 Aug 2021 17:13:00 -0500
From: Rob Herring <robh@kernel.org>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: linus.walleij@linaro.org, mark.rutland@arm.com, matthias.bgg@gmail.com,
 sean.wang@kernel.org, srv_heupstream@mediatek.com, hui.liu@mediatek.com,
 eddie.huang@mediatek.com, light.hsieh@mediatek.com, biao.huang@mediatek.com,
 hongzhou.yang@mediatek.com, sean.wang@mediatek.com, seiya.wang@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH v11 2/4] dt-bindings: pinctrl: mt8195: change pull
 up/down description
Message-ID: <YS6pbO4hmNyX//tP@robh.at.kernel.org>
References: <20210830003603.31864-1-zhiyong.tao@mediatek.com>
 <20210830003603.31864-3-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210830003603.31864-3-zhiyong.tao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_151302_592025_B7E9E593 
X-CRM114-Status: GOOD (  16.38  )
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

On Mon, Aug 30, 2021 at 08:36:01AM +0800, Zhiyong Tao wrote:
> Change pull up/down description

Every commit is a 'change'. Your commit msg should explain 'why', not 
what the diff is.

> 
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> ---
>  .../bindings/pinctrl/pinctrl-mt8195.yaml      | 32 +++++++++++++++++--
>  1 file changed, 29 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> index 2f12ec59eee5..a341ed9f0095 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> @@ -85,9 +85,35 @@ patternProperties:
>            2/4/6/8/10/12/14/16mA in mt8195.
>          enum: [0, 1, 2, 3, 4, 5, 6, 7]
>  
> -      bias-pull-down: true
> -
> -      bias-pull-up: true
> +      bias-pull-down:
> +        description: |
> +          For pull down type is normal, it don't need add RSEL & R1R0 define
> +          and resistance value.
> +          For pull down type is PUPD/R0/R1 type, it can add R1R0 define to
> +          set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
> +          "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" & "MTK_PUPD_SET_R1R0_11"
> +          define in mt8195.
> +          For pull down type is RSEL, it can add RSEL define & resistance value(ohm)
> +          to set different resistance. It can support "MTK_PULL_SET_RSEL_000" &
> +          "MTK_PULL_SET_RSEL_001" & "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011" &
> +          "MTK_PULL_SET_RSEL_100" & "MTK_PULL_SET_RSEL_101" & "MTK_PULL_SET_RSEL_110" &
> +          "MTK_PULL_SET_RSEL_111" define in mt8195. It can also support resistance value(ohm)
> +          "75000" & "5000" in mt8195.

Sounds like constraints on the values. Please write a schema.

> +
> +      bias-pull-up:
> +        description: |
> +          For pull up type is normal, it don't need add RSEL & R1R0 define
> +          and resistance value.
> +          For pull up type is PUPD/R0/R1 type, it can add R1R0 define to
> +          set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
> +          "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" & "MTK_PUPD_SET_R1R0_11"
> +          define in mt8195.
> +          For pull up type is RSEL, it can add RSEL define & resistance value(ohm)
> +          to set different resistance. It can support "MTK_PULL_SET_RSEL_000" &
> +          "MTK_PULL_SET_RSEL_001" & "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011" &
> +          "MTK_PULL_SET_RSEL_100" & "MTK_PULL_SET_RSEL_101" & "MTK_PULL_SET_RSEL_110" &
> +          "MTK_PULL_SET_RSEL_111" define in mt8195. It can also support resistance value(ohm)
> +          "1000" & "1500" & "2000" & "3000" & "4000" & "5000" & "10000" & "75000" in mt8195.
>  
>        bias-disable: true
>  
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
