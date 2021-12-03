Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D43C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Dec 2021 21:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yZLaLOvw6csjZAQ2b2f2iYT/Uu1RwYvO4O/N8Xkj5iA=; b=I+MAkiTo9kSOhF
	XeRK9KSbb9nUAvpFjYxQdrXmxoZnHIDuG3jXg0dUpvM37XQK/Yk3McwiDmU/QU3vc33YUi/ns8XnN
	7dwA4gVXWYEXw5hwLuJ9i0Sh/NvGr0w9EyeVKSrNO6ayGIRUaboWdMdOAlI6Cu3nFUg3U2tPMa80X
	gxJd5wNKHEYuOKB+yH30Z++nwsY3x2uc6IoFaRLZ1UDiD6Ax/QUzZTuGL2G6zx58QopgwbOnQcy+c
	ltrGgaAVtOmXH2yyuImYNAasML/wZrxwwDCzRWIXb8rb7lqMdg5VI+px3A9rdUesm806SbBWBW2Dy
	HaY1driI/uz49Zq8KSpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtG09-00H2TB-TA; Fri, 03 Dec 2021 21:21:53 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtG07-00H2SJ-9T
 for linux-mediatek@lists.infradead.org; Fri, 03 Dec 2021 21:21:52 +0000
Received: from smtpclient.apple (p5b3d2e91.dip0.t-ipconnect.de [91.61.46.145])
 by mail.holtmann.org (Postfix) with ESMTPSA id 59764CED20;
 Fri,  3 Dec 2021 22:21:47 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: [PATCH v2] Bluetooth: btmtksdio: enable AOSP extension for MT7921
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <662a29b7e66c7018b00fd84564831a2d78cef7d8.1638501745.git.objelf@gmail.com>
Date: Fri, 3 Dec 2021 22:21:47 +0100
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 =?utf-8?B?Ik1hcmstWVcgQ2hlbiAo6Zmz5o+a5paHKSI=?= <Mark-YW.Chen@mediatek.com>, 
 Soul.Huang@mediatek.com, YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
 Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com, km.lin@mediatek.com,
 robin.chiu@mediatek.com, Eddie.Chen@mediatek.com, ch.yeh@mediatek.com,
 posh.sun@mediatek.com, ted.huang@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, Tom.Chou@mediatek.com, steve.lee@mediatek.com,
 jsiuda@google.com, frankgor@google.com, jemele@google.com,
 abhishekpandit@google.com, michaelfsun@google.com, mcchou@chromium.org,
 shawnku@google.com, linux-bluetooth@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <6281040F-AEA9-4C2B-8B4B-D4094068B3EC@holtmann.org>
References: <662a29b7e66c7018b00fd84564831a2d78cef7d8.1638501745.git.objelf@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_132151_517134_5D99008B 
X-CRM114-Status: UNSURE (   8.30  )
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

> Similar to MT7921 btusb, we enable AOSP extension for MT7921 btmtksdio
> as well.
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
> v2: rebase onto the top of "[v2] Bluetooth: btmtksdio: enable msft
> opcode"
> ---
> drivers/bluetooth/btmtksdio.c | 1 +
> 1 file changed, 1 insertion(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
