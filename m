Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B3AEC433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 14:43:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD0B6610FC
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 14:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD0B6610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EWslYSivRlZCJSH4DoZ3faC1SOYBuREYQGXg5GkcSXA=; b=khb9ZuF1zssi6QUBG6kimugl9
	/ggJegb85dd2gSz6YOftiNKtwQWNUiBw7TvGSZZFTwQcz/sK7R84rzTSeA6dHQANXOjsibI5UQADP
	F2+s/m5FJeqo+dsolRCyB8Avg1RYQkoUcK8iRjShCpGVwx1Wh/19wuX5c8P6QX63bAecU+u1DNFib
	VksZAAGd2UlWV6GRbtfK6mxzvCPlqDA2DPo8Ya6Ksb7bPWc9ZL+NEBR+Z18nPtdBof3bNZvp3B4++
	Ni7Lk+b2EwvBqlvhyPYnVNoKkWqS9vnsxF8PjJbWghAgzYkPmBSOzuD9/YIKh9oFj0dGTqmKAvney
	X3A8NXYow==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXPgU-002SXU-Ic; Fri, 16 Apr 2021 14:43:02 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXPg7-002SO5-UV; Fri, 16 Apr 2021 14:42:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=Lx7hg/JBTOUY6NQVwUXFQgNKj1wjLMxdVCIC1wg2uVk=; b=aXXBW/5aHM5BReUFqoJqn4JMio
 fk+6a3L9qEr2CUXmH2hXctGta6KyaE1cZg1MeP5YiY7DpHKB+GkTOtydcAJ4LLfubW7PhM87CvEt3
 rwtrqdiim5xD0ae37C7TR0ZPJXogUP6X2C94ZJgUuEtVMi/9mdnl8sttCOF7SSrNxj1LPaoDTtnMp
 UaZVUtcuTlStXNjG5ODmFp3R5LqOYjVK3PAfCuLHikQga80GpejVLeWQL2w9uFlSAnZtZUKv11tOR
 UWT/TZ15m+D563LyAKFhfJ/DaOWnA3lqNcpUj14pdyfGG+PNIodbhh6vlqmfAOHDQiHBg3peu5qX/
 Snf3or2Q==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXPg2-009StC-9T; Fri, 16 Apr 2021 14:42:38 +0000
Received: by mail-wm1-x334.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so16679847wmy.5; 
 Fri, 16 Apr 2021 07:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Lx7hg/JBTOUY6NQVwUXFQgNKj1wjLMxdVCIC1wg2uVk=;
 b=EvXWQU/Qlfk18FjDjxRmA+QW+Bx3wnGUsvoMuCUiagV+PDkkt6eBRdGlZUj6xe7kko
 4y5hWL0G0e2gqNFPKuHtAeBbc/gc6sAAd9+PujrFaVM8fcrpgl4YXulq6S0x2Erw2qWX
 ltgqE30B8msjW4ImVDMG2p5zWg2pelzOht4Kl6d1dkdWBKiJJzgl1oK3ftyNXr+nMhot
 8FMSFdSQyxBwIVkMmKFpafA6IWhrsyIUsvOpdSaRNIlxvuLRDXNvgjEhxQfLKNIq0CvP
 kjmSscSTKlUrYIO1a9VCvQs/rx++O0p9LeihRTvVPZQETpaQVqUaHcRSpoK8q/7kfmW5
 NXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Lx7hg/JBTOUY6NQVwUXFQgNKj1wjLMxdVCIC1wg2uVk=;
 b=OhSzRZwaY9aSMx8k1gTOqTwUfkaUOfgVyay103KNy++6+vyGw6DJotj/vvXoknIt65
 VBEH/4jysvih2ezHITrnnLg6mMpvKM82zGorxe+Tnf0eHo51RfnIT4Kay48MNLjjVgk3
 wM5mVhuucf3ukSG3+6aVADo/pX8SYJFX7ENirf52knxE+yNkI+hfEhE+X6WX1Ilrd/rY
 4o+oxx10j2gAL+DogtxehtR4HXmQdmuDL6UIw9gBvV28ml5RDWw7cz1z9o9jKEx+4gAQ
 J8dhMYsnLMznlMxGYxcBk0TBbZ17ud3ZHQ9ub/JqODRKnYKTLsBIEviDlwtzkZLfFm/W
 996g==
X-Gm-Message-State: AOAM5306trQQk/K7kH7jUz8xILqGIh6CV15W5M9C4/iN9+A17HRFKRF5
 ScUFkOB7YuZdpAlGoXRTYWM=
X-Google-Smtp-Source: ABdhPJwPqelGlwrzQ0/PPn5lnVFbfg3aSHUs1UfWSE9VW8vBKpb0fKRIiCPDCxB9PvGjPQgOBfgw6Q==
X-Received: by 2002:a05:600c:4145:: with SMTP id
 h5mr8611177wmm.53.1618584151776; 
 Fri, 16 Apr 2021 07:42:31 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id v189sm9667455wmg.9.2021.04.16.07.42.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Apr 2021 07:42:31 -0700 (PDT)
Subject: Re: [PATCH 4/8] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-kenzo
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Ben Ho <Ben.Ho@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
References: <20210415093519.1920877-1-hsinyi@chromium.org>
 <20210415093519.1920877-4-hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <face0af7-8630-31fa-4975-a80311257d13@gmail.com>
Date: Fri, 16 Apr 2021 16:42:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210415093519.1920877-4-hsinyi@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_074234_361949_F16C8DD4 
X-CRM114-Status: GOOD (  14.63  )
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



On 15/04/2021 11:35, Hsin-Yi Wang wrote:
> Kenzo is known as Acer Chromebook 311.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index 0870490aa350..39e4a99ebb37 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -137,9 +137,11 @@ properties:
>          items:
>            - const: google,damu
>            - const: mediatek,mt8183
> -      - description: Google Juniper (Acer Chromebook Spin 311)
> +      - description: Google Juniper (Acer Chromebook Spin 311) / Kenzo (Acer Crhomebook 311)

Crhomebook -> Chromebook :)

>          items:
> -          - const: google,juniper-sku16
> +          - enum:
> +              - google,juniper-sku16
> +              - google,juniper-sku17
>            - const: google,juniper
>            - const: mediatek,mt8183
>        - description: Google Kakadu (ASUS Chromebook Detachable CM3)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
