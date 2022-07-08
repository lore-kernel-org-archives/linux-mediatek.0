Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00ECAC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 21:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YODHnO1LmCBGqiPd708FrHJXkxopJIk81fB6obZ4ipk=; b=YBQSVRyQ9glbO8x+M8djNxVAR9
	5F/5ytHZCQVg3DUUBw1yHSoYfdTWLaUMNJ8ZX9tqZoVaAs/JKoyQ5wl2hzSN4wCJA3Tm6PEf4OPgk
	Qsr/vgoZz+QH4We7hVPO8fPXC0jXXBlaAhBfAfEu/UarsTZozorzTnxRhPp7betZDqiEosIZrqRmV
	NE1UNGU03ZmRKkEfocuC1IfuoE4M85u8ycnJyF4WbKa7+Ecf2dvmVwPDsust//YFCoGLTp/pZqB/t
	KtJq4cZR4xht1lcNPdThFUlwD5QAdXDQ15MT6aiXZrkUveXRTcg1d8j2oD+VTROzn97hTIYLh3XdV
	rBi/naMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9vzW-0067to-Kv; Fri, 08 Jul 2022 21:58:26 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9vzU-0067sd-Ng; Fri, 08 Jul 2022 21:58:26 +0000
Received: by mail-pl1-x630.google.com with SMTP id 5so11497007plk.9;
        Fri, 08 Jul 2022 14:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YODHnO1LmCBGqiPd708FrHJXkxopJIk81fB6obZ4ipk=;
        b=dKiG0skLfUXrwBkuhfhGS/K/FVDLj0T0Z5NYcO2Amexs9lSbkpTQAli5ZQQh0gYDEt
         pXTPMEALSBLPfXEjF9DTbSEVsuu8lpummbmX4yEUkcZLSomFWAps4cQFoUHh2PK+UKso
         K68/ntKYXEmWFQldoCzlbL6gQbxPk1uEweF1OmBYUCk1YjxkYl/vFjWpA++f9vDW5avX
         9BI6fwc4zTLAI8WrAQdCJ+itPZdhvZYRNALGW3yXyANil6buqbDmB/JTPL56c3PKBbjv
         Df6kTBpV0odjbA9iQftamRN+U+Q+N11CEeyw2wVhE9e2C0YAOum1P/QhFrcahyKNkhea
         jcKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YODHnO1LmCBGqiPd708FrHJXkxopJIk81fB6obZ4ipk=;
        b=gczLwSF0MaQinD95JmXwieYzr+Scluin/dv+Eo+0NnUmZ09hDsIYcA6Y8n0oKZP/JG
         vwqVeRx3Y8yVpoB4z7ShAO+7K6oz80mwDzSr6EMq64YO4Pc6goe9CGTAcph0R+/3fOoP
         3kqnRmCbOg1F99Kweqvi0SY29MDz6q+HrzdkMJj2Mcg5Z+nD+itCRbVQiFk1KWWtnw/w
         7HsItlxVFyjaByg+XtuUcezco9Rs20IL3O7MaHyBStEQT/FcVDNWc8f8xXk0MWa+20uD
         7QUsJPsuHI7+4qxPl8RfO87NREcWB4jl/79GTgSL4lBb0/jYD/TnizXVKOWl3vh8ZaVj
         iNeA==
X-Gm-Message-State: AJIora9Zc4oQmJxjUniWi23QVeKudBUyWUxxdnYk2WFi8JjgBGi9MWHy
	QrsVYNe4CinqJDD22ddp8Vk=
X-Google-Smtp-Source: AGRyM1tV0ms11Blf9Ccca6UETulhUQLXnofCrR3mMxa5QaQjJzpLhRlM4R+p2uTFI9JajQ3TBWv+Pw==
X-Received: by 2002:a17:902:f543:b0:16a:54cf:3da9 with SMTP id h3-20020a170902f54300b0016a54cf3da9mr5558669plf.1.1657317503525;
        Fri, 08 Jul 2022 14:58:23 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:9707:b37:49b0:77c2])
        by smtp.gmail.com with ESMTPSA id n4-20020a6546c4000000b0040c9df2b060sm28291903pgr.30.2022.07.08.14.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 14:58:22 -0700 (PDT)
Date: Fri, 8 Jul 2022 14:58:20 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Fabien Parent <parent.f@gmail.com>, linux-input@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v3 0/2] Input: mt6779-keypad - fix hw code logic
 and row/col selection
Message-ID: <YsiofJQBZvLgQKSh@google.com>
References: <20220707075236.126631-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707075236.126631-1-mkorpershoek@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_145824_790466_D6ED00A4 
X-CRM114-Status: GOOD (  16.55  )
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

On Thu, Jul 07, 2022 at 09:52:34AM +0200, Mattijs Korpershoek wrote:
> Input: mt6779-keypad - fix hw code logic and row/col selection
> 
> This serie is the first follow-up on the mt6779-keypad in
> order to enable it on the MediaTek mt8183-pumpkin board.
> 
> To fully enable it on mt8183-pumpkin, we still need:
> * double key support
> * dts changes
> 
> To ease up reviewing, I preferred sending this first.
> 
> The first patch fixes a logic bug based on the (non-public) datasheet
> I have.
> The second patch configures the keypad correctly in order to not
> report bogus values.
> 
> Thank you,
> Mattijs
> 
> Changes in v3:
> * reworked row/column logic as discussed in [1]
> * Dropped Angelo's review since patch 1 changed
> 
> Changes in v2:
> * Simplified SEL_COL/ROW_MASK macros as suggested by Dmitry
> * Added Angelo's Reviewed-by on patch 1
> 
> Mattijs Korpershoek (2):
>   Input: mt6779-keypad - match hardware matrix organization
>   Input: mt6779-keypad - implement row/column selection
> 
>  drivers/input/keyboard/mt6779-keypad.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> [1] https://lore.kernel.org/r/YpMDZORAlHmg/x/0@google.com
> 
> base-commit: c4bcc1b99b8b8acdfe673e4701a9c2acb6b8b2fb
> -- 
> 2.34.1
> 

Applied the series, thank you.

-- 
Dmitry

