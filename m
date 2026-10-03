Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0EB0CA5FEC
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Oct 2026 14:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:MIME-Version:Subject:References:
	In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p1iE9IJuA9vzahQdkL4uD4ZoYz14exJJjYG0KNLd2AU=; b=xAqhVvN+fEKao8aRW96IRqGXaH
	O0jQlXXTe4saeD7D8SpjpJX44vMvWVvANWHMFRUL9g8XF/QJ/0mmqL0cCGS3luUdL/hrqQ46mKiWo
	WMDRc/87rF/5E9XrxA7tGXQFUWD2Qt4fF8w6mUP2PiUr++lmOoB6j4iLBXEhDkUQZCSv+hZ7QvTDg
	wPFVQdvf1M+Hhyea0s5DpWnwZyYJGxNHwatcRMZZcffUTtZgg5fXQaGHMe6CPApErYnM4TtGrvRj4
	FCFruRnw0uT5gzW0u18QXFKw+c+5y4ENE2Ccewxe1hV9XtZl17oxX8kCphfsmp71JZxmAekP520KY
	9DjgSTIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD0TK-0000000DaEP-1SMP;
	Sat, 03 Oct 2026 14:12:18 +0000
Received: from forward500a.mail.yandex.net ([178.154.239.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD0TG-0000000DaDR-04JJ
	for linux-mediatek@lists.infradead.org;
	Sat, 03 Oct 2026 14:12:16 +0000
Received: from mail-nwsmtp-mxback-production-main-813.iva.yp-c.yandex.net (mail-nwsmtp-mxback-production-main-813.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:5a80:0:640:5f14:0])
	by forward500a.mail.yandex.net (postfix) with ESMTPS id 0EDB4C1A3E;
	Sat, 03 Oct 2026 17:12:03 +0300 (MSK)
Received: from mail.yandex.ru (2a02:6b8:c0c:5c14:0:640:a57b:0 [2a02:6b8:c0c:5c14:0:640:a57b:0])
	by mail-nwsmtp-mxback-production-main-813.iva.yp-c.yandex.net (mxback) with HTTPS id ZBnmCa5JU0U0-uaRxgpvu;
	Sat, 03 Oct 2026 17:12:02 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0upti.me; s=mail;
	t=1791036722; bh=p1iE9IJuA9vzahQdkL4uD4ZoYz14exJJjYG0KNLd2AU=;
	h=Message-Id:References:Date:Cc:Subject:In-Reply-To:To:From;
	b=GQdg3GxMKnjDtrIjZh0QrCu5kM1xhINdJesJyy4yrZFahZoGEghildQm5SzcpOyF8
	 eolunvKhE4ANInoHCfjW/QEx/wGRIQzTHNviK19rFLiKc8JU7gl4zuPOFlGP1IHX1a
	 eORP3jrRt73DwL9U8oIouuXCGiIrB0GOIvGUrIWU=
Authentication-Results: mail-nwsmtp-mxback-production-main-813.iva.yp-c.yandex.net; dkim=pass header.i=@0upti.me
Received: by mail-sendbernar-production-main-60.iva.yp-c.yandex.net (sendbernar) with HTTPS id ee00c04c1aa76ab2be9247f83e4d4341;
	Sat, 03 Oct 2026 17:12:01 +0300
From: Ilya K <me@0upti.me>
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org
In-Reply-To: <211851789913261@df1900ea-d467-4ed7-a7f1-de68a4c3e6dd>
References: <1767631788532094@64c4e675-cd08-4a74-816f-886742f9bfcd> <529a79bc-dab7-aa41-00bd-c47ecbefaa00@candelatech.com> <471221788538289@323ca970-5bd2-4c6b-b52d-2b863a718615> <3acf531c-bcc7-412b-b3bb-665069260e46@candelatech.com> <2028561788553569@f088f4ec-f441-47a1-b7e4-75a1052aa4df> <2418461788691106@84aa39c5-f501-4e64-8418-6a8b6eb88e21> <eb405366-6574-4e4c-a89d-363751ed848b@candelatech.com> <4175721788798939@f00554c7-d809-471c-9bcf-78e5d8eceab4> <1556871789207706@7dc9deb3-4292-4932-8568-de9b411208d8> <1443771789748846@4a8ec5ae-80ed-44bc-b7d3-6bc660c90136> <211851789913261@df1900ea-d467-4ed7-a7f1-de68a4c3e6dd>
Subject: Re:[bug] Triple whammy of mt7996e bugs on 7.2+
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Sat, 03 Oct 2026 17:12:01 +0300
Message-Id: <143991791036721@40be7595-980b-4665-ba66-1601e10a0899>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_071214_255360_4AB76307 
X-CRM114-Status: UNSURE (   4.10  )
X-CRM114-Notice: Please train this message.
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

OK, so another update: my current branch which is basically 7.2.8 + bpi-r4 specific stuff + any patches from Ben's tree that touch net/wireless or mt76 code (http://github.com/K900/linux/tree/bpi-r4-728-ct) survived an entire week of no crashes, which is a very good sign. Unfortunately, it's still >500 commits with a total of +20k -2k lines of diff, so I'll have to go through it again and strip it down even more before I can have any idea of what is actually helping...

