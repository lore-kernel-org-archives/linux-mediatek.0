Return-Path: <SRS0=S3hZ=PN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92870C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Oct 2021 13:38:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B7CE60EDF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Oct 2021 13:38:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2B7CE60EDF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ZU64USB6lOxvNWtxrqB6KRNt8/ILOASov86Vacb32s=; b=t8xmybc7y8mYnh
	EUuMBQuwu1+Z2J5oxaCtRC61oWTuopb+oET+fKMHNSXHHVqhN96U39oXf1NdAsrgWDZll2tpkMjEv
	8JC9OTlUO2iz8EwX8TCWYz/Uf+aQTBGKzB5AN6foaW70Gy+ZD2qUkY8rAxlDI4BkSE2L4FNOcl83g
	YVDexhsTSPvO/3itZXpjgkN5qJb/+UJVvTi38j5NYlnznGRA0vo577Yd5YMUPDGjQPNXsukIv94Iw
	PCA86d4B//+0mxTN/Exse2fiQNRSc212e63fHlNk5ZuxjQqTbzwxE1Jlk5JthHIX9IfDa8r2m7AEt
	EAWKvUFakuqji3N81Y/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf0AY-00GYVK-85; Mon, 25 Oct 2021 13:37:42 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf0AU-00GYTq-G9
 for linux-mediatek@lists.infradead.org; Mon, 25 Oct 2021 13:37:40 +0000
Received: from smtpclient.apple (p4ff9f2d2.dip0.t-ipconnect.de
 [79.249.242.210])
 by mail.holtmann.org (Postfix) with ESMTPSA id 38B1ACED18;
 Mon, 25 Oct 2021 15:37:26 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v2 00/10] Add MT7921 SDIO Bluetooth support
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <cover.1634592181.git.objelf@gmail.com>
Date: Mon, 25 Oct 2021 15:37:25 +0200
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
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Sean Wang <objelf@gmail.com>
Message-Id: <63D47354-AEEA-4019-8C12-FEECD860BB85@holtmann.org>
References: <cover.1634592181.git.objelf@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_063738_740090_DC23D678 
X-CRM114-Status: GOOD (  19.27  )
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

> The patchset adds the MT7921 SDIO (MT7921S) Blutooth support to btmtksdio
> driver, which basically are made up of 3 parts.
> 
> PART 1: patch 1-3 to create btmtk module to rely on
> 
> These are preliminary patches for MT7921s driver to move the common
> firmware download procedure and the common functions from MT7921u to btmtk
> module to make MT7921u, MT7921s and other devices can share with to reduce
> the unnecessary duplicated code being created.
> 
> PART 2: patch 4-8 to refactor btmtksdio prior to adding mt7921s
> 
> These are preliminary patches for MT7921s driver to refactor the current
> btmtksdio to make MT7921S is able to coexist with the devices the current
> driver can support with the generic code and improve the performance on
> packet transmitting and receving process.
> 
> PART 3: patch 9-10 to add specific mt7921s logic
> 
> Add the specific logic regarding to mt7921s bluetooth.
> 
> The changelog from v1 to v2:
> - fix the test failure reported from bluez test bot
> - fix the test warning reported from kernel test robot
> - rebase onto the up-to-date bluetooth-next/master 
> - fix the typo from mt7961_data to mt7921_data
> - improve the function btsdio_mtk_reg_read with dropping the hard coding
> 
> Mark-yw Chen (1):
>  Bluetooth: btmtksdio: transmit packet according to status TX_EMPTY
> 
> Sean Wang (9):
>  Bluetooth: mediatek: add BT_MTK module
>  Bluetooth: btmtksido: rely on BT_MTK module
>  Bluetooth: btmtksdio: add .set_bdaddr support
>  Bluetooth: btmtksdio: explicitly set WHISR as write-1-clear
>  Bluetooth: btmtksdio: move interrupt service to work
>  Bluetooth: btmtksdio: update register CSDIOCSR operation
>  Bluetooth: btmtksdio: use register CRPLR to read packet length
>  mmc: add MT7921 SDIO identifiers for MediaTek Bluetooth devices
>  Bluetooth: btmtksdio: add MT7921s Bluetooth support
> 
> drivers/bluetooth/Kconfig     |   6 +
> drivers/bluetooth/Makefile    |   1 +
> drivers/bluetooth/btmtk.c     | 289 ++++++++++++++++++++
> drivers/bluetooth/btmtk.h     | 111 ++++++++
> drivers/bluetooth/btmtksdio.c | 496 +++++++++++++++++-----------------
> drivers/bluetooth/btusb.c     | 331 +----------------------
> include/linux/mmc/sdio_ids.h  |   1 +
> 7 files changed, 658 insertions(+), 577 deletions(-)
> create mode 100644 drivers/bluetooth/btmtk.c
> create mode 100644 drivers/bluetooth/btmtk.h

all 10 patches have been applied to bluetooth-next tree.

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
