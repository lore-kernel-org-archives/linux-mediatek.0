Return-Path: <SRS0=9YCi=M3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30053C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 15:01:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F19BB60F0F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 15:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F19BB60F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hwV/ELiP0qhMPJsFbtkjJYF6wPTzXzWpq3BfgJj9Ofs=; b=XU5viC9k8EK0JdMyLcm4X4P0RQ
	XTpgHEYDerX/9t4PDlXe3miERLZC17eO1nLSM8zkJ+g+yok/EdqXHFr6KQb0ZM2QS6ebMZEVfBxnu
	hG4vzjb0z53816mws0rpNdX0XK/cawhaS4d0UrTf/zxRXtwM16G6AVtjitmW8MyzfaYOM1664LPv2
	afL0s9wOMAb8oI3NnRV+QN1X5bfQbeAFeYz/k7/KGQ0zBlOMDEl4jRuLDHW1Bddlw8OEGg9qs4O83
	UvUsEKDLTJEj/vOo7fZgoHpad2OQ2KnhUgP/js0CBkb8sJbPcGo17ly72ZL63vWXApEwEqERWyOZc
	+/srNq9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBIOx-006WKD-Nk; Wed, 04 Aug 2021 15:01:47 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBIOe-006WEb-06; Wed, 04 Aug 2021 15:01:29 +0000
Received: by mail-wr1-x432.google.com with SMTP id b11so2622156wrx.6;
 Wed, 04 Aug 2021 08:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=b/CGPGKAIJdU81c9VKQNODFZgreiXcLnh2tcMHBfuZM=;
 b=HpKqdQAoj25mhjTtSvf7761Z6DAeK91j7qgoD2Xp7GxroakkEZsXbCvN6pO7F+Lqnu
 7MZk7nRZkIM/kSoEepSC9DW/KjZUlVEpC8yTJhYIBFeW8+SPH2jzSmiFfncFLT32zWrO
 APamyL5VaHn/njXG12sVKlUzDiEYe4ESGPmz3nm7UfJlz19VLu2EBKKINlbQLbokeZAF
 K48scpqfuq6Y6D+W51wVGs2dl1LSOfC49220MXexYKgxLaoXvX5yV712fWFR+C7xyTMW
 Vme6E8g/34yZld/s3Z9xM0wkzvcONsE+0xPe/igBPe3vSnmRshE2p94FXe0ohY8iDgfs
 lDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b/CGPGKAIJdU81c9VKQNODFZgreiXcLnh2tcMHBfuZM=;
 b=h5HNLiCJoCOutM3lhVUBiDDRFAXMFwqTtKAjEp51/nGRmrvq++ZWfKHNTA0RMrf7Tp
 4ch4RWkLBbZcensd+GmhtYKl196niJhVldTRv3qdsaC0h4jnXwK/cqn3xgOt0oAdA/WJ
 KiAR8hDhr1veEa0pcg7NV+u31GEZSbE63OYEKlXsYOEFCNfM67T+PT20DfTSunptD9hk
 9lqJtfb8eYIIq6tnK/OQyGNvhwcaNhEyXdjMSi5PojA5dRT6qDIqg8ILdtKUusHv33bp
 HWP+cekIGmdu7R3ooz+BzBDuK98EbpsSSvR0cpVSfCnqaNDlt66grhACuGmF+WDVOHqV
 R4XA==
X-Gm-Message-State: AOAM530ClHY3vXEaTXNldhDU1ykMqv/jI4D5c0NS1Ov1tIlmjjRi+Bv5
 4vXAuc7XZ6oHMZwddf2TC2oa72lDtMnSSg==
X-Google-Smtp-Source: ABdhPJz1VngK4KyOLmBahayZ/13L7txbqaR776m8lVaezd/WsyTRfY1khzKVSoMshxjY5e6l520jKQ==
X-Received: by 2002:a5d:4e91:: with SMTP id e17mr29179159wru.7.1628089286553; 
 Wed, 04 Aug 2021 08:01:26 -0700 (PDT)
Received: from ziggy.stardust (static-55-132-6-89.ipcom.comunitel.net.
 [89.6.132.55])
 by smtp.gmail.com with ESMTPSA id g11sm3005787wrd.97.2021.08.04.08.01.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 08:01:25 -0700 (PDT)
Subject: Re: [PATCH 1/2] dt-bindings: usb: mtk-musb: add MT7623 compatible
To: Sungbo Eo <mans0n@gorani.run>, linux-mediatek@lists.infradead.org
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>, Min Guo <min.guo@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210803151320.71531-1-mans0n@gorani.run>
 <20210803151320.71531-2-mans0n@gorani.run>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <353c79de-2dab-0367-32e8-63b0fd89900d@gmail.com>
Date: Wed, 4 Aug 2021 17:01:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210803151320.71531-2-mans0n@gorani.run>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_080128_097645_27E904ED 
X-CRM114-Status: GOOD (  14.66  )
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



On 03/08/2021 17:13, Sungbo Eo wrote:
> Document MT7623 compatible for mtk-musb.
> 
> Signed-off-by: Sungbo Eo <mans0n@gorani.run>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>  Documentation/devicetree/bindings/usb/mediatek,musb.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/mediatek,musb.yaml b/Documentation/devicetree/bindings/usb/mediatek,musb.yaml
> index 84ddacfdbe9b..03d62d60ce5f 100644
> --- a/Documentation/devicetree/bindings/usb/mediatek,musb.yaml
> +++ b/Documentation/devicetree/bindings/usb/mediatek,musb.yaml
> @@ -19,6 +19,7 @@ properties:
>        - enum:
>            - mediatek,mt8516-musb
>            - mediatek,mt2701-musb
> +          - mediatek,mt7623-musb
>        - const: mediatek,mtk-musb
>  
>    reg:
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
