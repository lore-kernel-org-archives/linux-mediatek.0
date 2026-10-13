Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFD5CC6B10
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2026 08:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rDqvCfFDMa3gC0A3oF+Ew8YWszwVZlkqSrTz8bpprnM=; b=1qhSc6IYUHXsx679eJ9VS0cDnF
	tzFF48sV+/bK3c+DJzcP7AG6HuHLDt27nG+SvFAJYq1YDjv/wLTAJndNRC/eDaA1HKgrINhORwPp2
	OiSo9QwoaWTRvxVlxA+qjXWWuPL1qWDKKdDmxuLWMKy6/K2MSrgPn0gM0jigymP9hCSYPqBVvPglQ
	s6rbmTCg/kKx8bu6fd9w1PG32tpJj1SSpvSUB9j6QWS2rAqwdh3FAgowFo8CWRoLJEVXvv6hLStIh
	03zdVpij90xl1nNdtlpL+bpp8jE6wcL0m1VM6ZtfIu9Kb+2BXTdfIbmYA1pya26jUkfhIGeoidmsw
	k2UrgDQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGXiY-0000000CJAD-1xHl;
	Tue, 13 Oct 2026 08:18:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGXiV-0000000CJ70-1H9k
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Oct 2026 08:18:37 +0000
X-UUID: aaf26654c6de11f1acbe4559397dec65-20261013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=rDqvCfFDMa3gC0A3oF+Ew8YWszwVZlkqSrTz8bpprnM=;
	b=nGANVuxpoUWgs0ENFSTw6nGIwBX/8JWuxlzY9STA3o39hO7zD3uT7209cz+aLMsGGq5Hv4CXHDM4p2+e3zlsvvMMpMbdOu0L8EmxOLuhvSC9bssvLadhBh7TbM4HwQoq8S5CemWPoQ+lc/525QrxuJauSU8m5M3dTfXIfgZCCIc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:3c987eca-831e-4d7e-8ee3-e88e9de99a79,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:291e20b,CLOUDID:7c34ce7a-8749-48da-85d5-4b1e63ee70b9,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: aaf26654c6de11f1acbe4559397dec65-20261013
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 988508870; Tue, 13 Oct 2026 01:18:27 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Oct 2026 16:18:25 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 13 Oct 2026 16:18:25 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Hao Qin <hao.qin@mediatek.com>, Wenlong Tian
	<ot_wenlong.tian@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Will Lee
	<will-cy.Lee@mediatek.com>, SS Wu <ss.wu@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH 0/2] Bluetooth: btmtk: fix ISO data reception
Date: Tue, 13 Oct 2026 16:18:21 +0800
Message-ID: <20261013081823.817996-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_011835_409983_3507EC71 
X-CRM114-Status: UNSURE (   8.72  )
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

Two problems in btmtk_recv_isopkt(), both found while debugging LE Audio
on MT7925. The function is shared by every MediaTek USB controller that
supports ISO data, so neither is specific to that part.

Patch 1 stops the zero padding emitted by the ISO interrupt IN endpoint
from being parsed as ISO packets. The endpoint delivers one packet per
264-byte transfer and zero-fills the rest; the driver turns every four
zero bytes into a handle 0 packet with Data_Total_Length 0 and reports it
to the stack. A single transfer can inject up to 64 of them, which is
what fills the HCI log with malformed ISO frames, and a valid SDU is lost
whenever handle 0 belongs to a live CIS/BIS.

Patch 2 corrects the receive skb being allocated 4 bytes too small, so
that a 248..251 byte payload would be rejected with -EILSEQ.
HCI_MAX_ISO_SIZE is a payload limit rather than a frame limit, and the
allocation should reflect that.

The two hunks are independent, so patch 1 applies on its own if you would
rather not take patch 2.

Based on bluetooth-next.

Chris Lu (2):
  Bluetooth: btmtk: drop zero-length ISO packets from endpoint padding
  Bluetooth: btmtk: size the ISO receive skb to hold header plus payload

 drivers/bluetooth/btmtk.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

-- 
2.45.2


