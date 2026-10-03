Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE98CA5FE6
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Oct 2026 18:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:MIME-Version:Subject:References:
	In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QJVrIB7qkSU0nHkAG5G7mRwWRLxDg1bGwqOVq12cvos=; b=ZyOucjnY6kcS+4mHpEMfStPMB+
	g/uclzFqmYZBAN9ClqZ8r+ENR9ayiM91FjlKsNe3u14aa5kxbTa1aC4UXbuN0B3tX9ep0cKW85Cyb
	IbuZx2wJZZDIZV+vLbjJELMVcVwIu+z8jxo3aPgxzWXcVxah7wduUXnRX4AAnKEVwxF55YeOkBPsx
	AqXW76K9HZEMIMhPfn8vSINxhhDcxl+uylqWNAJ/FM1V4aFHkwrplEL9s9nz+c9c5U8v1NtpuLmfz
	F4TUKlEQoRyvagqnDDs8RASNWqM37eakFjrHXL9EeTfIa3Uq3QJP+I99m9VJk2P/hGZRy8uq6C58D
	wmKZjrJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD4XR-0000000DuQd-3thd;
	Sat, 03 Oct 2026 18:32:49 +0000
Received: from forward502d.mail.yandex.net ([2a02:6b8:c41:1300:1:45:d181:d502])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD4XN-0000000DuQH-0M7c
	for linux-mediatek@lists.infradead.org;
	Sat, 03 Oct 2026 18:32:48 +0000
Received: from mail-nwsmtp-mxback-production-main-57.klg.yp-c.yandex.net (mail-nwsmtp-mxback-production-main-57.klg.yp-c.yandex.net [IPv6:2a02:6b8:c43:4d0f:0:640:45ce:0])
	by forward502d.mail.yandex.net (postfix) with ESMTPS id C3285CE5A8;
	Sat, 03 Oct 2026 21:32:36 +0300 (MSK)
Received: from mail.yandex.ru (2a02:6b8:c42:de41:0:640:5afa:0 [2a02:6b8:c42:de41:0:640:5afa:0])
	by mail-nwsmtp-mxback-production-main-57.klg.yp-c.yandex.net (mxback) with HTTPS id IWrqV77AbSw0-ABx8XyaZ;
	Sat, 03 Oct 2026 21:32:36 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0upti.me; s=mail;
	t=1791052356; bh=QJVrIB7qkSU0nHkAG5G7mRwWRLxDg1bGwqOVq12cvos=;
	h=Message-Id:References:Date:Cc:Subject:In-Reply-To:To:From;
	b=J/v5eIrF7NViugMMQhMTIDg39zldRxtdqinS9p8wXp5xLxKzSJakvbeeY7RuECUi+
	 2+wWOPxpt6oBqxYUKRS23FaEM5GrQXbJg3s41vtuoX+vpfhH1searzqyVVksDiV9mb
	 Yq82fteD1AK4F1KER1lqqDdESEMECdHZ45/RdeVo=
Authentication-Results: mail-nwsmtp-mxback-production-main-57.klg.yp-c.yandex.net; dkim=pass header.i=@0upti.me
Received: by mail-sendbernar-production-main-55.klg.yp-c.yandex.net (sendbernar) with HTTPS id c21a6e1b34ae069be1de7566bbbe38f6;
	Sat, 03 Oct 2026 21:32:35 +0300
From: Ilya K <me@0upti.me>
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org
In-Reply-To: <c4286904-2a9a-41fd-93ce-be57964909f6@candelatech.com>
References: <1767631788532094@64c4e675-cd08-4a74-816f-886742f9bfcd> <529a79bc-dab7-aa41-00bd-c47ecbefaa00@candelatech.com> <471221788538289@323ca970-5bd2-4c6b-b52d-2b863a718615> <3acf531c-bcc7-412b-b3bb-665069260e46@candelatech.com> <2028561788553569@f088f4ec-f441-47a1-b7e4-75a1052aa4df> <2418461788691106@84aa39c5-f501-4e64-8418-6a8b6eb88e21> <eb405366-6574-4e4c-a89d-363751ed848b@candelatech.com> <4175721788798939@f00554c7-d809-471c-9bcf-78e5d8eceab4> <1556871789207706@7dc9deb3-4292-4932-8568-de9b411208d8> <1443771789748846@4a8ec5ae-80ed-44bc-b7d3-6bc660c90136> <211851789913261@df1900ea-d467-4ed7-a7f1-de68a4c3e6dd> <143991791036721@40be7595-980b-4665-ba66-1601e10a0899> <c4286904-2a9a-41fd-93ce-be57964909f6@candelatech.com>
Subject: Re:[bug] Triple whammy of mt7996e bugs on 7.2+
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Sat, 03 Oct 2026 21:32:35 +0300
Message-Id: <221941791052355@558b3e58-c2b1-4e14-91fe-beb5649d18f6>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_113245_315989_3B1F8642 
X-CRM114-Status: UNSURE (   5.76  )
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

>  Our kernel should warn pretty loudly in this case, so if you are still hitting it you should see signs.

Any specific log lines to look out for? I have all the logs from this machine piped into Loki so I can check quickly.

> And, if you can reproduce the deadlock with lockdep enabled, that may
help.

I'll try building a kernel with minimal patches + lockdep and crashing it some time next week probably, would do it tomorrow but have a dental appointment that will take up most of the day :(

