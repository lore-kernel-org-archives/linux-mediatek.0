Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A206C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 14:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=buwlQzUCSeaxjCepTr9tN3l0LXreeT6w01XrhXFysUg=; b=LAe9QPUjcUGQMU
	NXAKq2/aRJR/xHt5vBNxKIh0m0/KRQwmyWGDK6I7OvKOMNi+H7eeTlcCwels0O9dNt3F55y2v+jNb
	/STIszuL57s+7nMCsnGlMN9pm83Apw/IQlmHZ+b5UjZIF9cUcuuCPH7HIUBItVQwIymR0agkXYVPw
	J11GRPu3YAiRCqwHzkK/7186Fbx1dm+RHSpndfffYrLofk61lNA6TjUvsUqPw3lm2phWWek1Ls8Ld
	4q2uX36HWTR5FnhFRndCSzwYLGUdvVZtIwuHlz1gYJVcTIANDcfAdN61aFP3SesSzZarGeq15+XMl
	Sp1xMM/Nz3pHZS8hB/RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUUgz-00DH8w-MC; Wed, 16 Mar 2022 14:32:01 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUUgw-00DH69-PN
 for linux-mediatek@lists.infradead.org; Wed, 16 Mar 2022 14:32:00 +0000
Received: from smtpclient.apple (p5b3d2183.dip0.t-ipconnect.de [91.61.33.131])
 by mail.holtmann.org (Postfix) with ESMTPSA id 975BBCECF7;
 Wed, 16 Mar 2022 15:31:48 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH v4 1/5] Bluetooth: btmtksdio: Fix kernel oops in
 btmtksdio_interrupt
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1647367724-5486-1-git-send-email-sean.wang@mediatek.com>
Date: Wed, 16 Mar 2022 15:31:48 +0100
Cc: Johan Hedberg <johan.hedberg@gmail.com>, Soul.Huang@mediatek.com,
 YN.Chen@mediatek.com, Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com,
 Deren.Wu@mediatek.com, km.lin@mediatek.com, robin.chiu@mediatek.com,
 Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com,
 ted.huang@mediatek.com, Eric.Liang@mediatek.com, Stella.Chang@mediatek.com,
 Tom.Chou@mediatek.com, steve.lee@mediatek.com, jsiuda@google.com,
 frankgor@google.com, abhishekpandit@google.com, michaelfsun@google.com,
 mcchou@chromium.org, shawnku@google.com, linux-bluetooth@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <18930791-939A-4B07-AC72-42076B905CE4@holtmann.org>
References: <7b4627d5017be2c26ded9daf7fd297bed6614852.1647366404.git.objelf@gmail.com--annotate>
 <1647367724-5486-1-git-send-email-sean.wang@mediatek.com>
To: Sean Wang <sean.wang@mediatek.com>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_073159_011133_8369CA5B 
X-CRM114-Status: UNSURE (   7.78  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Sean,

> Please ignore the series because I put a wrong version as the prefix
> 
> I will send the series later.

I am confused now what the proper series is. Can you just send a v5 so I know what is the latest.

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
