Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE128C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Feb 2022 17:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WbbiWoZzBQPfBQgPfozMB0mB3kCBFX/Iak9YbM+2rVE=; b=it2U/ms1pQzwbc
	4XT7xe0MZ6v9K1WYW+zfCpdDIiCOrWIpIhum+3XDRrkhr9Iuym8fnvNvD/FRNyGhAB8ETo5GGosCJ
	gUmsaS/crkOlHCqyvK8nYNOxkAH8HFHuI3AxFwiHghSAp9p5Ce1DT4suWZtvvp1BWH2ObWjDxxomZ
	jR1bpoP+kPapNDQXsNb65UcnXf1xxscq55FFqeZnCy5ydP8UZXKOpvWUbDJQaI7BMo/XgScH28Any
	3V/EPVgnxez8XxeAwRQubANS7RWrJY4zLKdacu8jWIOop2RXWI2ia3Wg/g8aOBfvrZ75rZrJyoFmn
	nAruKu9d2IkyW6DJokTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nGlUI-008TW0-TK; Sun, 06 Feb 2022 17:38:10 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nGlU5-008TUb-Du; Sun, 06 Feb 2022 17:37:58 +0000
Received: by mail-oi1-x22a.google.com with SMTP id s185so14732698oie.3;
 Sun, 06 Feb 2022 09:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vVKrnJDOHGbjSSHfQuuoJvy2XKJCbAbDk+4hsVzeVT4=;
 b=Ln+BqGQJLxlgnNo5qJrWQ484qT5n+OrgHozO1ECWRT6VesEsOCQGUxAqUAuXqRl9+f
 62peCmdXsolXfdoG3ahcsdefJHJr0E30TJhOT4ppj0ikpsPx4hg2w439xU/jHm5DyODY
 MeYiWTDPqniBoPPIc/45nQQezO+EgSKTsK2vtCABjmgdupcdAx7JI9g2Pzgp4O3MTCxw
 SQpz4imBoWlUZZXJ6u3Ckt5gBgRgZf7ESvDsdt8m72ApII2XsYqZs5Dm/TSM/AaNuQuR
 Toq2y54FPNW/Fe06+o+P4TvDlh8i8xhTNmSrMmnFsxDMx1ypzby7swYQaLLqilpO3K7q
 Xrpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=vVKrnJDOHGbjSSHfQuuoJvy2XKJCbAbDk+4hsVzeVT4=;
 b=7epNg+z9pYe6UuVRmzTNCUxhV1UufZiWhyBm2AxfFOplaBkhTj0tV+rEtWV5MMSS/e
 W5IUInosP9M6ILJAjCYApiGK6oR8HbaAguC8Rph4oal2ldomJi5MgWcHNWViy3tL5+gS
 my8VFB6/czvnKNqBgyOotm2ckl3qECL+AQd+QJ7404y91PEYz2zMcWaD7lfjFci57GTr
 wR6vKbNsNpiVWcoSIsoPrnL0Z9K9T1rHKKqMI6G/oh9JNaZYE2xda3Jf2nHUhijSUpBG
 uLna1bgmtofZm2jug1pVgvVWE4hs9ooV8mMuae7pSwjhdAc0vJ8nvhptCHa+HdHSQUQY
 U/FA==
X-Gm-Message-State: AOAM5327w7ysXJhDNehIMXsPvBdjsIp1dgZESxkscSRofz+IgsVC+CDG
 /cJ+so2u97YGaHmKli0l3M0=
X-Google-Smtp-Source: ABdhPJyyFr6qcAXR6PgZJnvpWbJqzU/tbg3jVON7HGuwyjCsJAF4UUEw/HHlVPaiIG5yBA6d+MPidw==
X-Received: by 2002:a05:6808:14c1:: with SMTP id
 f1mr3636989oiw.12.1644169075892; 
 Sun, 06 Feb 2022 09:37:55 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 o19sm3148725oae.36.2022.02.06.09.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 09:37:55 -0800 (PST)
Date: Sun, 6 Feb 2022 09:37:54 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 matthias.bgg@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: BUG: [PATCH v2] isoc: mediatek: Check for error clk pointer
Message-ID: <20220206173754.GA2014863@roeck-us.net>
References: <20211222015157.1025853-1-jiasheng@iscas.ac.cn>
 <trinity-2a727d96-0335-4d03-8f30-e22a0e10112d-1643363480085@3c-app-gmx-bap33>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <trinity-2a727d96-0335-4d03-8f30-e22a0e10112d-1643363480085@3c-app-gmx-bap33>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220206_093757_515792_3BD5DA5D 
X-CRM114-Status: GOOD (  14.27  )
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

On Fri, Jan 28, 2022 at 10:51:20AM +0100, Frank Wunderlich wrote:
> Hi,
> 
> this commit is merged in 5.17-rc1 and breaks scpsys on mt7622/bananapi R64
> 
> mtk-scpsys: probe of 10006000.power-controller failed with error -2
> 
> at least ethernet is affected (i guess usb,sata,btif,... too, but not checked), as gmacs do not get probed as depency of it
> 
> after reverting this commit it is working again.
> 
> have not yet digged deeper into it why it is failing, but maybe author has an idea
> 

I created a revert of the problematic patch with some explanation.

https://lore.kernel.org/lkml/20220205014755.699603-1-linux@roeck-us.net/

Sorry that I didn't reference this discussion; I only noticed it after
I wrote the revert. The revert and my analysis is based on the impact
of this patch on affected Chromebooks.

The revert is queued for v4.19.y and later stable releases because
the patch discussed here made it into all those releases and breaks
pretty much all Mediatek based systems using the affected driver.

Guenter

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
