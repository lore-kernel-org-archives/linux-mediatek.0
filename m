Return-Path: <SRS0=3jAl=FB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 345DCC2D0E4
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 08:38:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99084221FD
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 08:38:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="y7Vfi+5x";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JnsUHSQe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99084221FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eoACKR12KQDZMLMsMr/LUqBch5V8KIw76fsDm/l3ATY=; b=y7Vfi+5xUu3tofyLJcTyXp/C1
	vnjGAMNP209aKRxFhU6VoXPfD2pynUGNPsyFK6n9fZi/3WBxHR4ryOECEI5pAI6a7KSw0MRWexrg/
	2sN8Nu6TGG9/KcIEYXFyJOizR7ktX9hv0dS9tRZXBI9uX2cyOivJ6g1PAnXzJlROfJ6DmaBYdrn19
	OVOGEXL517FPsBvoKHX4DUR1hV0cYfju5HHUfvecyRyZzvrrBv/xoyujpnoegtEmGPNlPwvUHog3n
	Jtzgr/cOX99V+y8NL5SHJHF+uAxgtwHI+B5ce8zZS6onr+sMKMHYuq29gBxmdSSl0uwdCzTPXbR8g
	JhlK+ALyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiZGs-0003k2-Gi; Fri, 27 Nov 2020 08:38:26 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiZGq-0003hp-GT; Fri, 27 Nov 2020 08:38:25 +0000
Received: by mail-wm1-x341.google.com with SMTP id d3so1292364wmb.4;
 Fri, 27 Nov 2020 00:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=u79lL/HP+WpOwKFUXdt5Th5mjfi+tKiFgA+cKzsBuR0=;
 b=JnsUHSQe//Aq13uWmoBPI4hMTMYUmNQU39HV5DV+aNtOqi+XFYQG6VzSxBi1eLThJI
 TsJFNU20n11+5uSkIwpqJ5+l50BOeVKf6n/l0Rkg7X1JI3umoWpuAfAoA4+B5qfdtCDH
 xUqPfEIJdUsxHot2QSfkRPRrilgU8fo+rpMW9ThzZxl1TAytM8iW+xnxLA+AW7nyO45o
 0CLDmNxEvvYWEzwP9o2A7LawwrMuxy5JeKKud8P2ip0mcB0xaQZUBIMX740fncs/KL2w
 so6QXgMfKN0qjztEWyeCOi+MbuDYKXl1WEFKvV80VJE2uRqG6YS9PSM8UFM0u4B28xG7
 xRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u79lL/HP+WpOwKFUXdt5Th5mjfi+tKiFgA+cKzsBuR0=;
 b=qcahxUKpzLLxbPwj8Dfie05X8yzlAgUINNDRYM+WyQQsvSfozHJNAS0TQXvUzJP+CE
 EkeUIWl2b8ncw4X3f8hhZO6jsyChAFHyozajW/WUOZh5TNuDUCb3pU/q3lw97YBiiBdN
 1ekndL60shOXet0cwckMbu+6zEf+V7CD4zI6prlhIwJognySrlqzTGkz3x6N2GSnmiVH
 EMrZs9cHneeJCbxtq8n5AEv7399wyxBwG6vhXo8RVi4iYKIfyjaNfEoTbDeA4JYykGSE
 rZmAsakjD+rVkOc4KiSTdjBEtRZsxM9+MrEDcywXAKvmO0wKN4IXmlfep1dKUiLS+zhM
 AWnQ==
X-Gm-Message-State: AOAM533EgoE5a0H0fb+Op7MrfJ1eHynf5Zf8Ehm7uhjJ7BGtw5V9oYpk
 SVYxmQLaUe+AGcGjyUzeYVmI17nRog82xg==
X-Google-Smtp-Source: ABdhPJzts4WMM6w1TBYYczsTANwCb75EY/urEjpkkBZDT1zOBukum2mbdM3B38OuN7KLEhmFrRlWyg==
X-Received: by 2002:a1c:7510:: with SMTP id o16mr7729449wmc.66.1606466303239; 
 Fri, 27 Nov 2020 00:38:23 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id l10sm6107889wme.42.2020.11.27.00.38.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2020 00:38:22 -0800 (PST)
Subject: Re: [PATCH 1/3] dt-bindings: arm64: dts: mediatek: Add mt8167-pumpkin
 board
To: Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>
References: <20201027194816.1227654-1-fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <75a1835b-14a1-f86d-bae6-6377e50e1864@gmail.com>
Date: Fri, 27 Nov 2020 09:38:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201027194816.1227654-1-fparent@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_033824_615433_E27F793C 
X-CRM114-Status: GOOD (  16.60  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 27/10/2020 20:48, Fabien Parent wrote:
> Add binding documentation for the MT8167 Pumpkin board.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>   Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
>   1 file changed, 4 insertions(+)
> 

All three patches applied to v5.10-next/dts64

Thanks!

> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index 30908963ae26..5c772b937efc 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -84,6 +84,10 @@ properties:
>             - enum:
>                 - mediatek,mt8135-evbp1
>             - const: mediatek,mt8135
> +      - items:
> +          - enum:
> +              - mediatek,mt8167-pumpkin
> +          - const: mediatek,mt8167
>         - description: Google Elm (Acer Chromebook R13)
>           items:
>             - const: google,elm-rev8
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
