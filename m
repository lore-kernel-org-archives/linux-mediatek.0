Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BBC4CC6B1A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2026 08:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:MIME-Version:Subject:References:
	In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QFT/+BhkdYdoXf5v5CBA3OcjOICHpHy7/Ndrrgblf7Q=; b=NCi0gv21bPHdSV9mQXJHL4/n/Y
	5nPgQo849QlFbbzKccXXDJqgc8mxZhDulZEq1UdYl9UTXGSCR+HZ407Ph0QLQh2oWDTJ3POulXz0G
	+YhKpxqV3dXV17a47pSjgaiYqiZXlq9lyvbgvK0M07xcap7tTHVD1rowOJnu2HW4CDzVBy8c5Ef6u
	dwhFSkfzn8zNGOJX2TErsU+G3fijPBT4dtU5/VM4ypoeCSWfW67JbaN14Ncl40J1XRIONnbvIpVJ7
	QadhOsHWVwuQflfGatopg8tuG3T5ArT+7uGLuETkPjLRCXlUZcyu6l5VxXWJY4/LE2ORmIpQQinTm
	v0GwcyIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuSL-0000000EuXl-38l6;
	Wed, 14 Oct 2026 08:35:25 +0000
Received: from forward501d.mail.yandex.net ([31.44.14.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuSH-0000000EuW1-0SWo
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Oct 2026 08:35:24 +0000
Received: from mail-nwsmtp-mxback-production-main-60.iva.yp-c.yandex.net (mail-nwsmtp-mxback-production-main-60.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:6718:0:640:45f5:0])
	by forward501d.mail.yandex.net (postfix) with ESMTPS id 4E3998B9B7;
	Wed, 14 Oct 2026 11:35:11 +0300 (MSK)
Received: from mail.yandex.ru (2a02:6b8:c0c:7888:0:640:d17b:0 [2a02:6b8:c0c:7888:0:640:d17b:0])
	by mail-nwsmtp-mxback-production-main-60.iva.yp-c.yandex.net (mxback) with HTTPS id 8ZPi9s02JiE0-4a05ILdO;
	Wed, 14 Oct 2026 11:35:10 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0upti.me; s=mail;
	t=1791966910; bh=QFT/+BhkdYdoXf5v5CBA3OcjOICHpHy7/Ndrrgblf7Q=;
	h=Message-Id:References:Date:Cc:Subject:In-Reply-To:To:From;
	b=WI3km828KsDttE99nyfjt/pXjPlHNsBw1kFmwaZ0T5FUKY18CDaCwvdQmhFrPqHBC
	 HPsbQn9i8cAuk46I8BtN1qu6oUYdepIRLnYnBAIA/W4r1iE+e1X3JChqECb46QD0PE
	 QA5NOcl0+qnHzVFmyurUCMMctg7zgtHBU2g2CNs4=
Authentication-Results: mail-nwsmtp-mxback-production-main-60.iva.yp-c.yandex.net; dkim=pass header.i=@0upti.me
Received: by ybzyx5bgt3byggqr.iva.yp-c.yandex.net (sendbernar) with HTTPS id 9583a2851fa81df7e03c6027b58d62c3;
	Wed, 14 Oct 2026 11:35:10 +0300
From: Ilya K <me@0upti.me>
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org
In-Reply-To: <221941791052355@558b3e58-c2b1-4e14-91fe-beb5649d18f6>
References: <1767631788532094@64c4e675-cd08-4a74-816f-886742f9bfcd> <529a79bc-dab7-aa41-00bd-c47ecbefaa00@candelatech.com> <471221788538289@323ca970-5bd2-4c6b-b52d-2b863a718615> <3acf531c-bcc7-412b-b3bb-665069260e46@candelatech.com> <2028561788553569@f088f4ec-f441-47a1-b7e4-75a1052aa4df> <2418461788691106@84aa39c5-f501-4e64-8418-6a8b6eb88e21> <eb405366-6574-4e4c-a89d-363751ed848b@candelatech.com> <4175721788798939@f00554c7-d809-471c-9bcf-78e5d8eceab4> <1556871789207706@7dc9deb3-4292-4932-8568-de9b411208d8> <1443771789748846@4a8ec5ae-80ed-44bc-b7d3-6bc660c90136> <211851789913261@df1900ea-d467-4ed7-a7f1-de68a4c3e6dd> <143991791036721@40be7595-980b-4665-ba66-1601e10a0899> <c4286904-2a9a-41fd-93ce-be57964909f6@candelatech.com> <221941791052355@558b3e58-c2b1-4e14-91fe-beb5649d18f6>
Subject: Re:[bug] Triple whammy of mt7996e bugs on 7.2+
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Wed, 14 Oct 2026 11:35:10 +0300
Message-Id: <5955851791966910@d362902e-9931-4ad0-8e86-72401cc67703>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_013521_339820_CAAAEB39 
X-CRM114-Status: UNSURE (   5.56  )
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

OK, so I took some time off of this because of real life, but during that time, my 7.2-stable-with-Ben's-patches frankentree actually crashed! I am not sure if this is the same issue or a different one, but I thought it's at least interesting. 

Here's the logs from the ~hour when it crashed (exported from Loki, so sorry for the weird format): https://gist.github.com/K900/e2e5b21d6a49f450fe353c7cc3057916

If there's any more info you need, please tell me.

