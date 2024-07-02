Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70AB5C3065E
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jul 2024 11:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Evj1YWaQPw6lYLdYgH+5msLoO1mYU2S6QiKCnoWtnak=; b=NBKw/Nnne1IptpqlTRaUIuJB6J
	OCW20G8L36Rc7koj+ZcRZv7Z467dAp7Jq49yHWUquhWHSk01SkKtN4uUF9KGigwEY9cQ6I5b+EqgW
	xjuJIOxb0rJCJkwescGnNXuIqgXUaB9OmFI7EWt0Imhjpog7OWWvVTQvI8zAW8DQ0w5Dv8/y4PLeJ
	3RE4K598Yo2+kEioMI5b4wV50JyWzzF5Jlv+jfKenmOhZLYoEJmslrOSoCPDYnMFPfkE22U/wDCi6
	hD1fxZD15AsVNGALV39Q/kiYlc2PFT1e8GBXi5WE3YN7XFZbrj9UR9ugVUb7zproRwwAw+LzVBHhl
	cATMs0fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sObj6-00000006TY9-0Sbp;
	Tue, 02 Jul 2024 11:31:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sObix-00000006TU6-32Kf
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Jul 2024 11:31:08 +0000
X-UUID: 8cde503c386611efb2966dae1f787272-20240702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Evj1YWaQPw6lYLdYgH+5msLoO1mYU2S6QiKCnoWtnak=;
	b=UjtdM2WnKMrw32omIlQ+s+NKmE2+lYMRBPa6n98WVHLwQxqaxBqLIkYfdCV3/UWdfTA4y/5Hv8+CHJP5XlL61GFLyLrsYTsmGVHc6eY/Vo9dN2aFWoYczARodqnP+EU+hpjUu9bl8eYqW08oBFu/rGxIOp1Urw6JqemTN/rtlPs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:6b07a100-1795-4e21-b788-51050a44a5e4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:4b29d144-a117-4f46-a956-71ffeac67bfa,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8cde503c386611efb2966dae1f787272-20240702
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 814762185; Tue, 02 Jul 2024 04:30:57 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 2 Jul 2024 19:30:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 2 Jul 2024 19:30:53 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>,
	Steve Lee <steve.lee@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v6 0/8] Bluetooth: btmtk: MediaTek ISO data transmission support
Date: Tue, 2 Jul 2024 19:30:43 +0800
Message-ID: <20240702113051.24372-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--9.277100-8.000000
X-TMASE-MatchedRID: YawPgqJMp2/aYQdwXEMf70j2sPWKvtn0DRi0jfY6gL1oNGY/OdYkWWAI
	1go6d1sNmMN+S0FpW+8dHzBmTYIGm/Iejw19Z0aTQpxiLlDD9FUTdZ2aR9/IIMA5YKm8dwM65iW
	++W4offu6ecT5yQFR4EBUIG+nR2ZxYwXAgt8PtiDJ1E39jKDimIB84MMvKleaQQ1XgvCe7sHYn6
	D1t7z3wzS82RAJWQKfrqh8I79FEaFo3s9tP0IpFlz+axQLnAVBgRykyfrH1xl0Rk5xb2PnlpYL7
	nsDLhyNsbZZJEWTIt0rUpVFYCuHihxy/wjCDOrangIgpj8eDcAZ1CdBJOsoY8RB0bsfrpPIx1FP
	lNAAmcCrXjPAr1KAIbBk5zWijuCdq9M4zAWcKz81caPWRVi5ap6oP1a0mRIj
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.277100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: D7FCC029EC926081402D3949BD64AC2D0F04598942E4DB4F6CA4FBC4B0BED1292000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_043103_884162_D04D8A93 
X-CRM114-Status: UNSURE (   8.25  )
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

Since SIG has not yet clearly defined the specification for ISO data
transmission over USB, MediaTek has adopted a method of adding an
additional interrupt endpoint for ISO data transmission. This approach
differs from the current method used in the Bluetooth upstream driver,
which utilizes existing bulk endpoints. The interrupt endpoint provides
guaranteed bandwidth, sufficient maximum data length for ISO packets
and error checking.

Driver sets up ISO interface and endpoints in btusb_mtk_setup and clears
the setup in btusb_mtk_shutdown. These flow can't move to btmtk.c due to
btusb_driver is only defined in btusb.c when claiming/relaesing interface.
Once ISO interface is claimed, driver can use specific interrupt endpoint
to send and receive iso data. ISO packet anchor stops when driver
suspending and resubmit interrupt urb for ISO data when driver resuming.

---
Change from v5 to v6:
fix test bot report error
-move usb.h declaration position to each c file.
-fix returned value in btmtk.h when returning a pointer.
-simplify commit message to avoid word number limitation.
---


Chris Lu (8):
  Bluetooth: btusb: mediatek: remove the unnecessary goto tag
  Bluetooth: btusb: mediatek: return error for failed reg access
  Bluetooth: btmtk: rename btmediatek_data
  Bluetooth: btusb: add callback function in btusb suspend/resume
  Bluetooth: btmtk: move btusb_mtk_hci_wmt_sync to btmtk.c
  Bluetooth: btmtk: move btusb_mtk_[setup, shutdown] to btmtk.c
  Bluetooth: btmtk: move btusb_recv_acl_mtk to btmtk.c
  Bluetooth: btusb: mediatek: add ISO data transmission functions

 drivers/bluetooth/btmtk.c     | 1059 ++++++++++++++++++++++++++++++++-
 drivers/bluetooth/btmtk.h     |   91 ++-
 drivers/bluetooth/btmtksdio.c |    1 +
 drivers/bluetooth/btmtkuart.c |    1 +
 drivers/bluetooth/btusb.c     |  751 +++--------------------
 5 files changed, 1219 insertions(+), 684 deletions(-)

-- 
2.18.0


