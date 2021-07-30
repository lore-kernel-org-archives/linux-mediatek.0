Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 602E5C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 17:21:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E76660230
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 17:21:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1E76660230
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rnPmqt2OXZoDaFeuFRHB3sH3T1+MnxA5RInuj+2nzDs=; b=cEKiVphY3VCBye
	P5TmhReeMQPm9KyD+QPGqooRvMpUjTWHPX6lYRM5eSHq79Azx6V7TZhFVgr6WQUcM507LdW4c95Gm
	4BunPzDldV9KiR6HcjgOYZkFrBGt/6dmBDawIcoByunRAB0YNqrXHUJOZqKfNEmaB5bdYFsQiPHAF
	aLDZmfwQorc5cASa7PpVedSI5Z6oJcECiAiKDIXogRHayi57hu9Sd+JO9blt9UtAnzz5PUqrwxn9m
	qFg72WVAxs3yQEDDol4B+KCMN0nQkqqx77qYc3SgtRPHoinEQ8wUd1F7O5rdrQW+gKxTAcuN33W2Q
	euBaIfpsywiULrvjHGCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9WCZ-009fFF-BQ; Fri, 30 Jul 2021 17:21:39 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9WCK-009fDe-U7; Fri, 30 Jul 2021 17:21:26 +0000
Received: by mail-il1-x12b.google.com with SMTP id c3so10171865ilh.3;
 Fri, 30 Jul 2021 10:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-disposition:content-transfer-encoding;
 bh=eLN7+9c7Xaj+kBy2zNIikaePL1RMYLLJgx5wBfi1ffM=;
 b=tvbbI6MK46oyskEsShabdhLDtl0o5udZfC/1/4axn1HquUpJlgOTAKDTg+TaeSnEMs
 en0gYSGH9GUv+T+IH6ykxTJs+JDxj4U0EIOB49X4ESiYdznOSW/759ybfSojUYGFaxFK
 7bN0OCeU3dj7ErnkALieuEQR+KCnMyLqy8UQVy8gt03oJCD6cB6MLKP6jd/FM5U46Nx1
 6PT9yTSXWHynBmkqDsISB23D7c+B+i6VanYnzHIYOz7nWtpuHQrt02J4pxfgRvVmQ9/B
 MTxVoPJvz2YHATbhTywKpTAGnxQF/23sAtFsjWjTh4ulLXPasDUt/xFckx4XFqdZXYn5
 Vg8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding;
 bh=eLN7+9c7Xaj+kBy2zNIikaePL1RMYLLJgx5wBfi1ffM=;
 b=Uhs8jUgHRPj9nEa3qtKHctST2zFwZQxnRlEpCAgX+rg0zFDPhpu5UZX9v0V9U3IQTs
 STl2++tvAj8k0qkKtTp4NdIrPltDhL4G2XtbGxfQGamqUKMcR56UEsvWuBIZum9bKn58
 ONd4QdR+iF/9kRxYWj7fnyfJ9wNLgBfGPp4I/DFfufx3Z0/qijTAdas2O/4iA3z2ZStm
 RWL0h361fDwsN0E6jbAyIN/EDts4wNmh6b9glnG2uqxWlwflxQOAQKntG2UPXCvVfhLY
 +Wkg9OaZTaa4TvV4nAB8M+F4MY4AOQzX/u5bASvw693xv7g7mYbfh9tro91OGg6pGEYm
 UQ1A==
X-Gm-Message-State: AOAM532xrnTLpF0L2Sdijp/5UzI98j4PvjeuzYivLmoi9X9ZpfAcL48f
 fjXgR29a8RYk3GA2GBe4Wlk=
X-Google-Smtp-Source: ABdhPJxW8Kb8ESDrERihXtPqHK3BaZP1+FOig63zzh5s+7nQsmc9v+ldNxOLS+IbP9kF216Vn8KIhQ==
X-Received: by 2002:a92:d9c6:: with SMTP id n6mr2701165ilq.142.1627665684203; 
 Fri, 30 Jul 2021 10:21:24 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id l5sm1407204ion.44.2021.07.30.10.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 10:21:23 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev <netdev@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [RFC net-next 2/2] net: dsa: mt7530: trap packets from standalone
 ports to the CPU
Date: Sat, 31 Jul 2021 01:21:14 +0800
Message-Id: <20210730171935.GA517710@haswell-ubuntu20>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210730161852.4weylgdkcyacxhci@skbuf>
References: <20210728175327.1150120-1-dqfext@gmail.com>
 <20210728175327.1150120-3-dqfext@gmail.com>
 <20210729152805.o2pur7pp2kpxvvnq@skbuf>
 <CALW65jbHwRhekX=7xoFvts2m7xTRM4ti9zpTiah8ed0n0fCrRg@mail.gmail.com>
 <20210729165027.okmfa3ulpd3e6gte@skbuf>
 <CALW65jYYmpnDou0dC3=1AjL9tmo_9jqLSWmusJkeqRb4mSwCGQ@mail.gmail.com>
 <20210730161852.4weylgdkcyacxhci@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_102125_034583_20C41880 
X-CRM114-Status: GOOD (  21.47  )
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

On Fri, Jul 30, 2021 at 07:18:52PM +0300, Vladimir Oltean wrote:
> > It turns out that only PVC.VLAN_ATTR contributes to VLAN awareness.
> > Port matrix mode just skips the VLAN table lookup. The reference
> > manual is somehow misleading when describing PORT_VLAN modes (See Page
> > 17 of MT7531 Reference Manual, available at
> > http://wiki.banana-pi.org/Banana_Pi_BPI-R64#Resources). It states that
> > PORT_MEM (VLAN port member) is used for destination if the VLAN table
> > lookup hits, but actually it uses **PORT_MEM & PORT_MATRIX** (bitwise
> > AND of VLAN port member and port matrix) instead, which means we can
> > have two or more separate VLAN-aware bridges with the same PVID and
> > traffic won't leak between them.
> 
> Ah, but it's not completely misleading. It does say:
> 
> 	2'b01: Fallback mode
> 
> 	Enable 802.1Q function for all the received frames.
> 	Do not discard received frames due to ingress membership violation.
> 	**Frames whose VID is missed on the VLAN table will be filtered
> 	by the Port Matrix Member**.
> 
> (emphasis mine on the last paragraph)
> 
> > So I came up with a solution: Set PORT_VLAN to fallback mode when in
> > VLAN-unaware mode, this way, even VLAN-unaware bridges will use
> > independent VLAN filtering.
> 
> If you did indeed test that the Port Matrix is still used to enforce
> separation between ports if the VLAN table _does_ match and we're in
> fallback mode, then we should be okay.

Yes, that's what I mean. Tested as well.

> 
> > Then assign all standalone ports to a reserved VLAN.
> 
> You mean all standalone ports to the same VLAN ID, like 4095, or each
> standalone port to a separate reserved VLAN ID? As long as address
> learning is disabled on the standalone ports, I guess using a single
> VLAN ID like 4095 for all of them is just fine, the Port Matrix will
> take care of the rest.

I just found a cleaner solution: Leaving standalone ports in port matrix
mode. As all bridges use independent VLAN learning, standalone ports'
FDB lookup with FID 0 won't hit.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
