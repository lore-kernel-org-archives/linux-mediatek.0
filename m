Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31213C47422
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jan 2024 02:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HJ9/hb1oR3z6QYtFtb59VUDRsqEpUqDNna+ijRv/ZZ4=; b=P8yeZebsugyUxXxeqFtApMCS+g
	6wkfIjm24UsNXR13JGhAH1H2XkTAMqAG/rFibRNPyCHU+gXvKVwv2dJ0p2f2U52dCQnyzldt0i/43
	beacGVptKzpmQ/AojXyPexiPF4hz44loBmCjPZHykLJw7tFBZZgdxRQ9tAFOWZzGahp+wQ7LrBcoC
	itaARSwQ9ppK94YCKYxHCHWm09Vd54pvo0Y/ilhNHZec0ntYCMF09iakqVdqMEWxpXohpks6ULRr+
	RXmPcatTcf4GK//tOOENj9+3AqsBAqUrzoSVDSGTP863Wf8c9XqLCfS4nTYqmlmIMtIpiMSsWM+8M
	zM7mW1Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPZWN-00Apgg-0S;
	Tue, 16 Jan 2024 02:49:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPZWK-00Apg9-11
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Jan 2024 02:49:45 +0000
X-UUID: e4f668bcb41911eeafd70d0b34820190-20240115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=HJ9/hb1oR3z6QYtFtb59VUDRsqEpUqDNna+ijRv/ZZ4=;
	b=mARwXO0Rf0uMxKw47lYmt4Yujlzm0L52uluMY0EghVJdAL2QZk6uPa5zWjHNPILU1v8rRx/lYk5/7uItmEswIUqC34goKIvnltZPrXxc0P5jsbsyMvdgMEKejxuswK1CsVCRuuXliKtxJmw7TfbBNTl5tdqTL973ar9Uc4IDWR0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:c189e769-2c18-4f8c-807b-6d3121e980ec,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:fa014a8e-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e4f668bcb41911eeafd70d0b34820190-20240115
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 223357007; Mon, 15 Jan 2024 19:49:40 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 16 Jan 2024 10:49:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 16 Jan 2024 10:49:07 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <km.lin@mediatek.com>,
	<robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<MingYen.Hsieh@mediatek.com>
Subject: [PATCH v2 0/4] wifi: mt76: mt7921: fix potential issues for mt7921
Date: Tue, 16 Jan 2024 10:48:53 +0800
Message-ID: <20240116024857.9071-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_184944_362619_EDB13C9E 
X-CRM114-Status: UNSURE (   6.71  )
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

From: Ming Yen Hsieh <MingYen.Hsieh@mediatek.com>

Hi,

This patchset includes some bugfixes for CLC (Country Location Control),
suspend/resume and ACPI SAR.

v1:
    remove patch, "mt7921: fix potential command timeout issues when suspend",
    and add patch, "mt7921: fix the unfinished command of regd_notifier before suspend"
v2:
    In "wifi: mt76: mt7921: fix the unfinished command of regd_notifier before suspend",
    after regd update, the variable "regd_in_progress" should reset to false.

Ming Yen Hsieh (4):
  wifi: mt76: mt7921: fix incorrect type conversion for CLC command
  wifi: mt76: mt792x: fix a potential loading failure of the 6Ghz
    channel config from ACPI
  wifi: mt76: mt792x: update the country list of EU for ACPI SAR
  wifi: mt76: mt7921: fix the unfinished command of regd_notifier before
    suspend

 .../net/wireless/mediatek/mt76/mt7921/init.c  |  6 ++++
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   |  4 +--
 .../net/wireless/mediatek/mt76/mt7921/pci.c   |  3 ++
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  2 ++
 .../wireless/mediatek/mt76/mt792x_acpi_sar.c  | 28 ++++++++++---------
 5 files changed, 28 insertions(+), 15 deletions(-)

-- 
2.18.0


