Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CDAC61DD6
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 14:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:MIME-Version:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r41Xe1mrwIPlvXiNA3j++3Eu8PLXhMgnYzML5OVQBWE=; b=Vqpr/HODrSVxB5zOmKwX2V2jGd
	1gtLaz9nsz9YUJEGTPnBQWB3FsDUEYaXOhTi7ktnQ3jCgUtBohB3/PX7/OJeKSDp6Dp3CoaOmi7UK
	iGE0YNIYW8zvceUN3K3Zkt6ax1OMCcC5889qTkWbDLpxoDuMxuQxhntLu1L1kxLPXXAl/kygjI9ZP
	OlytjPG+krayG5jZ5HVwgPgGmsgOh3KmV0TB2ejjbwpRLmIVW4adV+LIcIkYJEbXhCkyTOyzk/DJl
	UwzhHrWZk7LwQWQACiigS7+hoY7Ne8pEPPZn2T182tJA3G8/ONuU0gJNshi4vBsGSZV2Oalqpxt0x
	Hq/NsD6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Uu4-00000002Njj-3w1Q;
	Fri, 04 Sep 2026 14:28:28 +0000
Received: from forward101a.mail.yandex.net ([178.154.239.84])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Uu0-00000002Ni8-1xZM
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Sep 2026 14:28:27 +0000
Received: from mail-nwsmtp-mxback-production-main-691.iva.yp-c.yandex.net (mail-nwsmtp-mxback-production-main-691.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:1589:0:640:596:0])
	by forward101a.mail.yandex.net (postfix) with ESMTPS id 94DCF80D17;
	Fri, 04 Sep 2026 17:28:15 +0300 (MSK)
Received: from mail.yandex.ru (2a02:6b8:c0c:752d:0:640:91d2:0 [2a02:6b8:c0c:752d:0:640:91d2:0])
	by mail-nwsmtp-mxback-production-main-691.iva.yp-c.yandex.net (mxback) with HTTPS id vRKeX66vl0U0-DQkt58Xi;
	Fri, 04 Sep 2026 17:28:15 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0upti.me; s=mail;
	t=1788532095; bh=r41Xe1mrwIPlvXiNA3j++3Eu8PLXhMgnYzML5OVQBWE=;
	h=Message-Id:Date:Subject:To:From:Cc;
	b=VaauQKUqGzQ1uzeeGxwIZrsB18rEkZZ5dw2BBYqpNRy1skJpkrub9fnN5xgRkoh7R
	 +U1KSZyCpuD3yEajTYVd0aHkTV4OLvSw++4naxtL2jC7wTWnLd0VNxiHF8tFlSF4Jm
	 Xo45Nn+JadGrsLHThQAAgIEmoo8KyuVFfTqeN1To=
Authentication-Results: mail-nwsmtp-mxback-production-main-691.iva.yp-c.yandex.net; dkim=pass header.i=@0upti.me
Received: by mail-sendbernar-production-main-68.iva.yp-c.yandex.net (sendbernar) with HTTPS id 59ee03733a089c59512294a09661e3f4;
	Fri, 04 Sep 2026 17:28:14 +0300
From: Ilya K <me@0upti.me>
To: linux-mediatek@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [bug] Triple whammy of mt7996e bugs on 7.2+
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Fri, 04 Sep 2026 17:28:14 +0300
Message-Id: <1767631788532094@64c4e675-cd08-4a74-816f-886742f9bfcd>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_072825_333638_FD820EE1 
X-CRM114-Status: GOOD (  15.62  )
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

Hey folks,

Not really sure where to report this, but I've encountered some "interesting" issues on my bpi-r4 running kernel 7.2 and up.

The first issue is that after a while the firmware on the mt7996e sometimes seemingly just locks up. 
As it usually is with those things, there's not much debug info available, so all I get is

[58764.004954] mt7996e 0000:01:00.0: Message 00130022 (seq 12) timeout

This has happened before, but very rarely, and now it seems to happen consistently at least once a day or so, on
the exact same setup that is stable for weeks on end with 7.1. I have not attempted a bisect yet because
1) I kinda need my network to actually work reliably and 2) it happens so inconsistently that it's hard to
pin down a good commit.

The other issue is that the kernel then fully explodes trying to recover from this, in two different ways 
depending on whether WED is enabled or disabled: with WED on, it tries to double free a page somewhere on the 
teardown path, and with WED off it just wedges seemingly all of nl80211 and any process that happened to be talking to it.

I'm attaching the logs for both cases, hopefully this helps figure out what's going on, and happy to do more testing if
needed.

For posterity, my current kernel tree is basically vanilla + just enough changes to get bpi-r4 10G ports working on NixOS:
- 7.1 branch: https://github.com/K900/linux/tree/bpi-r4-71
- 7.2 branch: https://github.com/K900/linux/tree/bpi-r4-72

(there are exactly zero *80211/mt76/mt7996e changes).

Oh, I've also tried pulling the latest firmware from vendor OpenWRT feed and that did not help matters at all.

Any help in figuring this out would be greatly appreciated!

- Ilya


