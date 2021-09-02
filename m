Return-Path: <SRS0=hgkd=NY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C63EC432BE
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 05:37:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 067DB60238
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 05:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 067DB60238
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NoaCXxFiQYYviFTIZTsvFu8qsxEyUOjY7OPRirJvYz8=; b=2qwjUd/0xSW8Ce
	KJtxViQSc9EvNPFt222XMW9P+O4kNTxChJstCGJg+95GTJIq5mXmXt1iPu6hgFB3l8aSKorZTgVy5
	8MS26fL/gurDTKt8gMdtRBKKIyayuRbCFwqTXMEkD6R4myOQrv7b3qJLCQEe8yDTwmG6CO3wRtgSu
	ufoHySYnjxN+uZdOIuJ7Sw4ZMFg7Yd8CqDlAwKZ76trhHAaKH+yhpf8nt5CaucqBqz5YQM+a9wOS6
	9rD8f78Ncx9ogteJimuogmS6hLDGltG35lemI9uFlLnmiSlfqDr346D3V2KOXmEjLzI48WbSleFTB
	0OO3sPI+KP13hRuoXNyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLfP2-008ZUk-5z; Thu, 02 Sep 2021 05:36:44 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLfOo-008ZSW-Sg; Thu, 02 Sep 2021 05:36:32 +0000
Received: by mail-pj1-x1032.google.com with SMTP id
 d3-20020a17090ae28300b0019629c96f25so649256pjz.2; 
 Wed, 01 Sep 2021 22:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-disposition:content-transfer-encoding;
 bh=AUQQWpdPusKziL81HjIpycnRSPGEY5GISL+U0MCMSmU=;
 b=JHDFf//yUkiuI37prdgWCjD9R3BX0MF++LeB2tn3JpuX+6C1q9/T+ceQvBcnpO3zhF
 KqFddP7LZ1WIza6iZtjHkx+HOkhqIrB/Jwe5jYzaAPmoO8PCY0dSbiG7rSs76H6LsE2G
 2xWEEIiFb0l4UJCSWFol0RNVwEHkXt8RseGH8qmrzmUOot+xJnb2QL7rTfy5sBb8XB83
 ReDLFc66swXyMR4O4FI20PtOmbYvqeniHo14wvYKBGZWlw7R4FxYc/IXvHakTLtRxjQu
 u3bn2PgY2puR6lUbYisAHUOxUJg+3sSrmjqmIz8NxNpRS7P0+kgm9SkUEvBdAwYdati8
 Mb8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding;
 bh=AUQQWpdPusKziL81HjIpycnRSPGEY5GISL+U0MCMSmU=;
 b=dyMhnoNgz9330O2eHPAq+Ga9WFwOrD8TnuP3AgLj16FMCbgY6UnkC4wGOV4+lSfgVd
 /8CBOMoLyIZFCvlsMhxyKM1eSqbGWUQaHvioOs68fRKct1y9L8OwA3eEhz3X4RoEoTHi
 BrFAuwLNlIazKJcDQAWgTURqOLBthtAaAuB5l/Z0HtlDemqo6NPMhj4Ls+qtGayyXRhD
 4PwNwKyC7Jz0GMU9koY9bD+4m5UQG1iRPfKRiPJurlyauJRzfSh8oL97pmenlShPIzEu
 sQfniH7T+mIMwtsZG/N18lYKFwsH3RIPo1olzqabXQuT5nHInh/N+cV6t4B22wnz4wVC
 cQUQ==
X-Gm-Message-State: AOAM530ykEaMzlXihsyiWwhASKBMfF0zvq4/I4SURHEQ0YDek9eyWv5J
 gcU4pxjptcgYhlw2aEs+Y7PJx+4GgrWiGw==
X-Google-Smtp-Source: ABdhPJxJF8LI4M1O2L1/GWavG28s+l1uKa4//ATjWdcEy8H3VklT/CtTQenaVUqvys4DN29witZiTw==
X-Received: by 2002:a17:902:7806:b0:138:1eee:c010 with SMTP id
 p6-20020a170902780600b001381eeec010mr1413056pll.20.1630560989012; 
 Wed, 01 Sep 2021 22:36:29 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id f9sm739690pjq.36.2021.09.01.22.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 22:36:28 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Sasha Levin <sashal@kernel.org>, stable@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@savoirfairelinux.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:MEDIATEK SWITCH DRIVER" <netdev@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 4.19.y] net: dsa: mt7530: disable learning on standalone
 ports
Date: Thu,  2 Sep 2021 13:36:19 +0800
Message-Id: <20210902053619.1824464-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <YSi8Ky3GqBjnxbhC@kroah.com>
References: <20210824055509.1316124-1-dqfext@gmail.com>
 <YSUQV3jhfbhbf5Ct@sashalap>
 <CALW65ja3hYGmEqcWZzifP2-0WsJOnxcUXsey2ZH5vDbD0-nDeQ@mail.gmail.com>
 <YSi8Ky3GqBjnxbhC@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_223630_993846_9E515ED0 
X-CRM114-Status: GOOD (  18.62  )
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

On Fri, Aug 27, 2021 at 12:19:23PM +0200, Greg KH wrote:
> On Tue, Aug 24, 2021 at 11:57:53PM +0800, DENG Qingfang wrote:
> > Standalone ports should have address learning disabled, according to
> > the documentation:
> > https://www.kernel.org/doc/html/v5.14-rc7/networking/dsa/dsa.html#bridge-layer
> > dsa_switch_ops on 5.10 or earlier does not have .port_bridge_flags
> > function so it has to be done differently.
> > 
> > I've identified an issue related to this.
> 
> What issue is that?  Where was it reported?

See Florian's message here
https://lore.kernel.org/stable/20210317003549.3964522-2-f.fainelli@gmail.com/

> 
> > > 2. A partial backport of this patch?
> > 
> > The other part does not actually fix anything.
> 
> Then why is it not ok to just take the whole thing?
> 
> When backporting not-identical-patches, something almost always goes
> wrong, so we prefer to take the original commit when ever possible.

Okay. MDB and tag ops can be backported as is, and broadcast/multicast
flooding can be implemented in .port_egress_floods. 

> 
> thanks,
> 
> greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
