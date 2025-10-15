Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20432CCD184
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Oct 2025 03:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cHJINyY/HfM0Bk3CJ11w/F3lW9D9PJ3q9roxipCTsjI=; b=RbdxITjWnmfaDzLTiX+pewvT4S
	ncO3Abl3AzrKzn4XFt2Loptjbky1JFJHm8DBpwrs/gIOKAaWTjrt/spPNCGknyKnUozxmiLzuW59Z
	sXQqOxYZNdAmCmXbhmPcxc1mTDH8dPS1ZL13JCIlO0LRh9odMU9La+Rk6NRnp9xDtLjpjNZlFIvkK
	u4iNMLKpx3dvfAjEQiQSnzGwXFj5u4TLXg0Kf3jx2TTDNdxgDo9E+osHT7pxZH5OS0I4Md6wYwpJS
	tAcHF3xR8qoUBQ+s8w43mSfsWyIEZIGchBdjuV4pX2+9xEU+pKrSGhvQH7bY+Qz2vyhZYWoxq9aIK
	Yjvrwntw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8sFE-00000000Lhm-1Kvc;
	Wed, 15 Oct 2025 03:32:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8sFB-00000000Lfq-09Tf
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Oct 2025 03:32:06 +0000
X-UUID: 81efc74aa97711f09f706fa2197c6ceb-20251014
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=cHJINyY/HfM0Bk3CJ11w/F3lW9D9PJ3q9roxipCTsjI=;
	b=MR1GCliP50jDXy+kU/wJqXNHDQvvdiPeBNfELIpGDpU8CwFk22IhDhlISNB40bbIedP0czFXGhxsTeTN9toEpeCkdDDD367FG+sKP2GaivH41ZDXcVEqZpWMKp9FGekzZVmC2rPNNGFc7mSP81cXzRRwpBFbiA3TUR9Y7WwIFJg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:55c6c980-9bde-4167-9a16-95fdbb2c34da,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:d6e42db9-795c-4f99-91f3-c115e0d49051,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 81efc74aa97711f09f706fa2197c6ceb-20251014
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 292709451; Tue, 14 Oct 2025 20:31:59 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 15 Oct 2025 11:31:56 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Wed, 15 Oct 2025 11:31:56 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>,
	SS Wu <ss.wu@mediatek.com>, Steve Lee <steve.lee@mediatek.com>,
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v2 RESEND 0/2] Add two new ID for MediaTek's Bluetooth
Date: Wed, 15 Oct 2025 11:31:48 +0800
Message-ID: <20251015033150.498866-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_203205_074939_531B82D9 
X-CRM114-Status: UNSURE (   6.69  )
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

In response to the customer's request, add the following two
VID/PID to the USB driver table so that btusb driver can support
the corresponding MT7920/MT7922 modules.

1. VID/PID 0489/e135 for MT7920
2. VID/PID 0489/e170 for MT7922

---
v1->v2: Change patch title
---

Chris Lu (2):
  Bluetooth: btusb: MT7920: Add VID/PID 0489/e135
  Bluetooth: btusb: MT7922: Add VID/PID 0489/e170

 drivers/bluetooth/btusb.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.45.2


