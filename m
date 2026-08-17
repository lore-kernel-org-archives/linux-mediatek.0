Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81457C5DF7A
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2026 09:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+apygaq/YUCV3RE1Ys0Qckcc5sV7s5aZ8LqZEreUi9Y=; b=jCo0eXqYrXy7YFi5TqEf97kwJu
	eo0J/BmfF8re7oUSWk/08MuLmmZ8kGBR6mH7A0ieKFdjfQr8smWfTvXRwbByIjr9sN7nKGg48ytov
	fL2NywWHjOPMjkpgTKpiNOmnuUAeBPqkDF/Vd0ZmAzthcMBhcS+cK56AQNftcDnx26CFOyDZZECMm
	HEDe4hJ1JqEgHx1d4zLV/tstgPT2yPa/QPUmz3FCKQ6ZNN5snKspn9jSNGn+eNO4VTwB/fClrCxCi
	Hg8x2wd6vrrfXGh54K9+sdKcTphXcgd8ZnIYjDAXkSjglr/hocq+xrLWoDm+F5gd1sDP4rtXEyU/3
	xc6RFb9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvu2N-00000005rAs-1A0L;
	Mon, 17 Aug 2026 09:53:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvu2K-00000005r9B-1xv6
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Aug 2026 09:53:45 +0000
X-UUID: 84883c3a9a2111f1afed4741b24580c9-20260817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=+apygaq/YUCV3RE1Ys0Qckcc5sV7s5aZ8LqZEreUi9Y=;
	b=Xyuvl0gAAFAc+idcSEkjl4C4BnWLp+OhjwncljHeq+tyA+lr316SPmqLkiN9ttxMYe+6KwziWYlVDP8XA9kEK3TdyqXAM9p3OlXgeTSp7c/gfsKsMyNBfVoh48XSth1W+CBqF1KlqbJqr5ZgACM98IW0ZtfOgpPhH8RRQDAXYS4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:0dd21376-c188-473e-81ea-599e7854e631,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:768cf4f1-0685-46a3-9cac-19d8f3a05ae7,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 84883c3a9a2111f1afed4741b24580c9-20260817
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 178732760; Mon, 17 Aug 2026 02:53:37 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 17 Aug 2026 17:53:34 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 17 Aug 2026 17:53:34 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>,
	SS Wu <ss.wu@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH 0/2] Bluetooth: btmtksdio: Fix SKB handling in the TX path
Date: Mon, 17 Aug 2026 17:53:30 +0800
Message-ID: <20260817095332.182994-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_025344_510787_95D61D0C 
X-CRM114-Status: UNSURE (   9.83  )
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

btmtksdio_tx_packet() rounds the SDIO transfer size up to the 256 byte
block size, but never grows the SKB accordingly, so the host controller
reads up to 255 bytes of uninitialised memory and sends it to the device,
and can read past the end of the buffer as well.

Patch 2 fixes that by padding the SKB with zeros. The padding is written
behind skb->tail, which is only safe once the driver owns the data
buffer, so patch 1 replaces the open-coded headroom check with
skb_cow_head() first. Patch 1 on its own changes no observable
behaviour, but it is a hard prerequisite, so both patches carry the same
Fixes: tag.

Both patches were previously part of a larger MT7928 series [1]. They
are unrelated to MT7928 and to the USB driver, so they are sent
separately here. The remaining parts of that series will follow as
separate topic branches.

Tested on a Chromebook with MT7921S: Bluetooth power on, then A2DP
connect and stream continuously for one hour without failure. The padding
added by patch 2 covers every packet whose length is not a multiple of
the block size, and the reallocation added by patch 1 covers every HCI
command, which hci_send_cmd_sync() always clones into hdev->sent_cmd.

[1] https://lore.kernel.org/linux-bluetooth/20260717072133.2858136-1-chris.lu@mediatek.com/

Chris Lu (2):
  Bluetooth: btmtksdio: Take exclusive ownership of the SKB before TX
  Bluetooth: btmtksdio: Fix out-of-bounds DMA read in the TX path

 drivers/bluetooth/btmtksdio.c | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

-- 
2.45.2


