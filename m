Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E01CC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Nov 2021 15:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ckZ3ES3d9Y27pGKrK0uDy0fIiiPQgkIivcZ7uggC7eI=; b=2bJrzCaKJ8orAq
	ED7fXSG02m8Xi9ujWqLZNcfcAJIrOHepm6nPTqqOAwoVO0rKQgnOMAZa8ZC0cW5AAiJusWUOQd0Ip
	ODjrGQ0z2ZVkfrJJ/oLLBJ1QPVu2v3FBvw6bQxce0ou9qkiOOQaGWL2kCOWR0I8mgYoZJkdvt/0tE
	B6j1xii5KpA2Zxoarf4pmHZG7pxvPw+r3jSQCRUR3QVxRvUkD5XFq+qj4IyHH0bvPB7nkMwDHJ4TW
	WwG+TcNsNGeSg41rjVPSLqu11b/6KSIyay0VB2afKy+GJslCzRKf46rXA7fNVPHgvQLcYsiEquZZ0
	PbvSEAMgw5Z08zCKWJVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpu4f-00558h-EO; Wed, 24 Nov 2021 15:20:41 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpu4c-00558D-Oc
 for linux-mediatek@lists.infradead.org; Wed, 24 Nov 2021 15:20:40 +0000
Received: from smtpclient.apple (p5b3d2e91.dip0.t-ipconnect.de [91.61.46.145])
 by mail.holtmann.org (Postfix) with ESMTPSA id 8BB80CED24;
 Wed, 24 Nov 2021 16:20:37 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: [PATCH 4/4] Bluetooth: btmtksdio: add support of processing
 firmware coredump and log
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <e8480933f01de26143d466b69ab5d0fa70e84ace.1637360076.git.objelf@gmail.com>
Date: Wed, 24 Nov 2021 16:20:37 +0100
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 =?utf-8?B?Ik1hcmstWVcgQ2hlbiAo6Zmz5o+a5paHKSI=?= <Mark-YW.Chen@mediatek.com>, 
 Soul.Huang@mediatek.com, YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
 Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com, km.lin@mediatek.com,
 robin.chiu@mediatek.com, Eddie.Chen@mediatek.com, ch.yeh@mediatek.com,
 posh.sun@mediatek.com, ted.huang@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, Tom.Chou@mediatek.com, steve.lee@mediatek.com,
 jsiuda@google.com, frankgor@google.com, jemele@google.com,
 abhishekpandit@google.com, Michael Sun <michaelfsun@google.com>,
 Miao-chen Chou <mcchou@chromium.org>, shawnku@google.com,
 linux-bluetooth <linux-bluetooth@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <FF372AB7-DC3C-4C93-B473-F675DA735038@holtmann.org>
References: <4176102d8bbc36e5156e348df666a3e12c5a3d75.1637360076.git.objelf@gmail.com>
 <e8480933f01de26143d466b69ab5d0fa70e84ace.1637360076.git.objelf@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_072038_981005_5A7CFF5B 
X-CRM114-Status: UNSURE (   8.90  )
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

> Add support of processing the firmware coredump and log for the diagnostic
> purpose.
> 
> Co-developed-by: Mark-yw Chen <mark-yw.chen@mediatek.com>
> Signed-off-by: Mark-yw Chen <mark-yw.chen@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
> drivers/bluetooth/btmtksdio.c | 23 ++++++++++++++++++++++-
> 1 file changed, 22 insertions(+), 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
