Return-Path: <SRS0=NOVl=GJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 381A5C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 13:58:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD72D22C9F
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 13:58:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD72D22C9F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=true.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f/jc7nKPhjDdM4MXGfu4UrLRrjf1nw+4WlorLKnoiwE=; b=uTvafdOp1f5d0HKzHyNrRJQ3K+
	nibwCrPOi/HkaUG9m3RqoSHeLBbiMNHZ+hCEGwDdDeW7QbloKKqYzwv7a/hBQ5FiTj0I4LEcqCVcq
	A5XZIv7CSORECigaegRNBG1XAp0Yzl+Lg6Rk/TCIWP3WPtF/uDyYQ/FPDI/Na8T2/XO1EOHPGD0OW
	WiZbI+Iz1PVxXgA9b83Zdf4y3J6y4fP0o2/BZwizknFXKzjNTG3gMU7wpx4aEbcbeuuefsT8foO77
	pfWPgKpPg+5eS1lMwHSzZZm2NeLDiFNm5xxIpwQ5Ta7k90CJ2V+OR1Vs4UndYzIH+mrIja0gO3AAQ
	v/99rmWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kx9KK-0003aM-R7; Wed, 06 Jan 2021 13:58:16 +0000
Received: from smtp-out.xnet.cz ([178.217.244.18])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kx9KG-0003ZK-Iz; Wed, 06 Jan 2021 13:58:13 +0000
Received: from meh.true.cz (meh.true.cz [108.61.167.218])
 (Authenticated sender: petr@true.cz)
 by smtp-out.xnet.cz (Postfix) with ESMTPSA id 0812A18C68;
 Wed,  6 Jan 2021 14:58:04 +0100 (CET)
Received: by meh.true.cz (OpenSMTPD) with ESMTP id 0dfe3687;
 Wed, 6 Jan 2021 14:57:46 +0100 (CET)
Date: Wed, 6 Jan 2021 14:58:01 +0100
From: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] mt76: mt7915: fix misplaced #ifdef
Message-ID: <20210106135801.GA27377@meh.true.cz>
References: <20210103135811.3749775-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210103135811.3749775-1-arnd@kernel.org>
X-PGP-Key: https://gist.githubusercontent.com/ynezz/477f6d7a1623a591b0806699f9fc8a27/raw/a0878b8ed17e56f36ebf9e06a6b888a2cd66281b/pgp-key.pub
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_085812_743066_C9F8AD67 
X-CRM114-Status: GOOD (  16.94  )
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
Reply-To: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Yiwei Chung <yiwei.chung@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Shayne Chen <shayne.chen@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>,
 Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Arnd Bergmann <arnd@kernel.org> [2021-01-03 14:57:55]:

Hi,

just a small nitpick,

> From: Arnd Bergmann <arnd@arndb.de>
> 
> The lone '|' at the end of a line causes a build failure:
> 
> drivers/net/wireless/mediatek/mt76/mt7915/init.c:47:2: error: expected expression before '}' token
> 
> Replace the #ifdef with an equivalent IS_ENABLED() check.
> 
> Fixes: af901eb4ab80 ("mt76: mt7915: get rid of dbdc debugfs knob")

I think, that the correct fixes tag is following:

 Fixes: 8aa2c6f4714e ("mt76: mt7915: support 32 station interfaces")

I've used the af901eb4ab80 as well first in
https://github.com/openwrt/mt76/pull/490 but then looked at it once more and
actually found the probably correct 8aa2c6f4714e.

Cheers,

Petr

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
