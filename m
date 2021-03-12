Return-Path: <SRS0=zPgu=IK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A49C43331
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 10:35:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6B3165039
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 10:35:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6B3165039
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xl20b4YzghUSIp8+g+heQRXVB9Ey/N/0i2Unt3GZBnM=; b=iqxU37a5vplteqOCsubB/wCCe
	eSXYjFC+BsxGzQN/CS4pTL2qf+hfjHLVu4vGLHMz6JMTz0ieyY+0slxpHX8UOlURMav60+CERsJuL
	4zvyd1I7+Eif/LFpNiNajfWHYUpIKZ3PZjqc9DZyYK7axjCwqhoeuLuU/l0jNBadXHVkuRwhSi7Ul
	NbY+hOYY2dRa4DHcmxY43nrdEqKEml/Xna010ppMn4JRCLH/zWcsM5ewg+wkjywzmDouCbne7gUrl
	otOxASq6MazoqRWUane8dq+ldhmKdo9sg3jKKd6ooU02HD3t1FYEKWDIgziA7AhU+BBPZFafxEgca
	1yBK05wig==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKf8Q-00BBk1-9n; Fri, 12 Mar 2021 10:35:10 +0000
Received: from elvis.franken.de ([193.175.24.41])
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lKf8I-00BBez-Mi
 for linux-mediatek@lists.infradead.org; Fri, 12 Mar 2021 10:35:04 +0000
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1lKf7u-0007WV-06; Fri, 12 Mar 2021 11:34:38 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 01657C1E4A; Fri, 12 Mar 2021 11:33:41 +0100 (CET)
Date: Fri, 12 Mar 2021 11:33:41 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: John Crispin <john@phrozen.org>, linux-mediatek@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: ralink: select WEAK_REORDERING_BEYOND_LLSC on MT7621
Message-ID: <20210312103341.GG7027@alpha.franken.de>
References: <20210307190806.5211-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210307190806.5211-1-ilya.lipnitskiy@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_103503_060597_D03DEB69 
X-CRM114-Status: GOOD (  11.07  )
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

On Sun, Mar 07, 2021 at 11:08:06AM -0800, Ilya Lipnitskiy wrote:
> Upstream a long-standing OpenWrt patch for RALINK MT7621 SoC. Selecting
> WEAK_REORDERING_BEYOND_LLSC fixes random kernel hangs. This bug and fix
> was reported by MediaTek WCN division [0].
> 
> [0]: https://lists.infradead.org/pipermail/lede-commits/2017-August/004537.html

I don't see the Mediatek WCN reporting there. Looking at the 1004K user
manual I couldn't find a notice about such behaviour. So this looks
more like a fix for papering over the real bug by just introducing
a few more syncs. Could you please point me to where this is
really documented ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
