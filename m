Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B606BCAC5BB
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Oct 2025 06:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ixDkZdmZjEhnbu/X1A3+4I5hcb/jbkxBCb7Z/1tYu+Y=; b=mnslVQQMiX6t9ewJcE5SXofDXV
	+xNdaqACLasxTnucxAe0mJ4n62lxAglFicsQtLqJb+ku/PMHR0qwVyGrZs5RVjt7ZMyUDwhBiUPpB
	uLbqN5wzwMtarry2xYs4YqK553PQ+Abwya9EBQ7hKlC4oTSOIz6StksXHEeikXfYF86AMqerqvU4T
	W0fwQ0axKhTFBXHm/bERSPinkVUcTfykjSmtjMHxdet5ufXuZgo7RHmRNHvQdLZeIlCqeCs18/KvH
	30RggX+Wi+tGBpJY465MnWEnE3ZoT4nPNlLlqn0esWJ5jL5FU+INektsi8mkLRzxZ8a/zU9S9Gb3n
	j0k2nv/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3pxK-00000006l7A-0QyH;
	Wed, 01 Oct 2025 06:04:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3pxH-00000006l5x-1S1F
	for linux-mediatek@lists.infradead.org;
	Wed, 01 Oct 2025 06:04:49 +0000
X-UUID: 8594fd169e8c11f0a52f393f94899d25-20250930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ixDkZdmZjEhnbu/X1A3+4I5hcb/jbkxBCb7Z/1tYu+Y=;
	b=Z2gIyHftnqPe+bVu19RYmQEkxlNfOq6MuqKyFN36wPbEkTK0lk8Duivopxt3bion7YEt2UALxxeGk8iajBwpNI48bX11JjOXTuV3IcfRsbQobxbqHsLuaqbY0JWJdO1R1Rw3UyYyOxRX+A11pJfvGzY86GjwHuhp2oWZRjXOm1I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:f7a273c8-e714-4420-a91a-cc8448bfd72f,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:5099dbe9-2ff9-4246-902c-2e3f7acb03c4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8594fd169e8c11f0a52f393f94899d25-20250930
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 135074490; Tue, 30 Sep 2025 23:04:42 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 1 Oct 2025 14:04:39 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Wed, 1 Oct 2025 14:04:39 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>,
	SS Wu <ss.wu@mediatek.com>, Steve Lee <steve.lee@mediatek.com>,
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v1 0/2] Add two new ID for MediaTek's Bluetooth
Date: Wed, 1 Oct 2025 14:04:35 +0800
Message-ID: <20251001060437.2298529-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_230447_390622_E21DDF36 
X-CRM114-Status: UNSURE (   7.92  )
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

Chris Lu (2):
  Bluetooth: btusb: Add new VID/PID 0489/e135 for MT7920
  Bluetooth: btusb: Add new VID/PID 0489/e170 for MT7922

 drivers/bluetooth/btusb.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.45.2


