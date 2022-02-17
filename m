Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0521DC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 13:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2vOyGrOiTm14BhJWjVAV+rpyrkuDQNLznK51qNboUVw=; b=Lw7fMLdNjUZAl1
	COniYXJcYBdKS1f7ajV2YnDimI1nDXnwmc4h1mde5GVHHWteLT/6hhMEyacN4JX2gU42TlT8OUyoD
	xhhihUNe4hQctYVi7dJ7XIq+5fX8Ox/cB4KBpEt4VUfkUAnpcpgumQPkF4KJ45KmJtns5gcPUxBDo
	E6OFOWGq/NvK1HKU7gh8gTtkERj+8zh2lQBloAKTNwiuWPOIlhTmr1Bei3Bn0gKe/tUd7/ldn1Y/S
	wibpNVX5eTNm6lii8pq2rB+i3IAOoEv5feu3Pq+ylidkEuk/k22CMMMZTNiiGuSNrZttTJkSF0BWW
	RpviYgCnlB8DSXMNAvVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKgVP-00AWyE-IC; Thu, 17 Feb 2022 13:07:31 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKgVM-00AWvg-FT
 for linux-mediatek@lists.infradead.org; Thu, 17 Feb 2022 13:07:30 +0000
Received: from smtpclient.apple (p4fefcd07.dip0.t-ipconnect.de [79.239.205.7])
 by mail.holtmann.org (Postfix) with ESMTPSA id C8101CECDE;
 Thu, 17 Feb 2022 14:07:22 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [PATCH v2 2/2] Bluetooth: mediatek: fix the conflict between mtk
 and msft vendor event
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <5f5f1e801432af9318bc604c54a6c15dcd8ab036.1644342794.git.objelf@gmail.com>
Date: Thu, 17 Feb 2022 14:07:22 +0100
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
Message-Id: <075A0FD1-8145-43E0-A4C2-13AF0436C08C@holtmann.org>
References: <d328920a9abaaaedafc8c4922cdeb5935f6d64c3.1644342794.git.objelf@gmail.com>
 <5f5f1e801432af9318bc604c54a6c15dcd8ab036.1644342794.git.objelf@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_050728_761249_C73B304C 
X-CRM114-Status: GOOD (  15.46  )
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

> There is a conflict between MediaTek wmt event and msft vendor extension
> logic in the core layer since 145373cb1b1f ("Bluetooth: Add framework for
> Microsoft vendor extension") was introduced because we changed the type of
> mediatek wmt event to the type of msft vendor event in the driver.
> 
> But the purpose we reported mediatek event to the core layer is for the
> diagnostic purpose with that we are able to see the full packet trace via
> monitoring socket with btmon. Thus, it is harmless we keep the original
> type of mediatek vendor event here to avoid breaking the msft extension
> function especially they can be supported by Mediatek chipset like MT7921
> , MT7922 devices and future devices.
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
> v2: fix the warning: variable 'hdr' set but not used
> ---
> drivers/bluetooth/btmtk.h     | 1 +
> drivers/bluetooth/btmtksdio.c | 9 +--------
> drivers/bluetooth/btusb.c     | 8 --------
> 3 files changed, 2 insertions(+), 16 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
