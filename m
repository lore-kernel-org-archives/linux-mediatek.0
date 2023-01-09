Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611F9C678D5
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 16:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jgWuyzHGOSAVwU15GuO4419LueIVeRqiTnENyk75Yws=; b=GBbOdCJspzQ8AtAlgt9ELhPeoB
	omHDALvfuD6KKuHVAsWCl66KrG4OywBB7jquZTkNCQUhF3j6OuuS/33BPIbksdMpxolulrjL85Ags
	Gr1Ql4tLQaQsv1wYfXIsbPQSRnEX0NJGCP4I9cW9qbpCZqO5Ry1lndSjqXUmtSFz/9Qieu7SLxJEA
	GnY/i7IN+/gs3CLsdgsAOc0OsEgey/ez8wTSNgB1umpJheHyx8su8fTOP+PXQhoD5R23CTsmXpgtU
	9zLZ2RVgpw6yOfac4NpWgbr9KnTy/dl5i4yJ8YPC4S1nx4zaiMpd3/UH0RbpkWY1uKBVjL+0YPxLd
	ddWa9Bsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEvTs-002jj5-SK; Mon, 09 Jan 2023 16:58:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEvTr-002jhE-1n
	for linux-mediatek@bombadil.infradead.org; Mon, 09 Jan 2023 16:58:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=jgWuyzHGOSAVwU15GuO4419LueIVeRqiTnENyk75Yws=; b=MJEcaprSFxHrePmiEIEuxwcbJH
	Yzq/DIswnY2cafxgOSC5zw2no+ofS6/BJTrutesS4TMsymGne/jG0tKBrww0j3h0vSHMeO6eBb0Th
	HYzlOFaIgQQgSYkH79teRfizHIWknDy7GaQiL/v0oxVhCy1FvFa/cFoUfVuPGzPl6bMcCaGY0y09s
	AfHepSUm6mknsyCbS3w4m7J9MSsjDoxaLa5N5/2rVh5OjuybfK+pCa5SzfIrE88fZK0mA19JkU8Q+
	bRFaow+lm2upWNCzlAumPRVevMYN5j+NzhTBvFqjykqo0VAl3LbeVktymX2TLQ45jpeh99Otao3r2
	bq99eD9A==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pEvTZ-002mkz-1Q
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Jan 2023 16:58:26 +0000
X-UUID: a9b5a0a154bc4f91a7813096a5e80acc-20230109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=jgWuyzHGOSAVwU15GuO4419LueIVeRqiTnENyk75Yws=;
	b=qAjCXFc5YtNe97oNtu/aIA/K8XoSLkNV7lp456+/AeE/IenL9vhatnNtQpl7RXVCFxzDEgelzGTSTJ1zssn1AhBGyfXMXutzfIJ/dN3PYmuDDoReY/5Zm2D74hRUJB//oD5N6m4SqV8NSWZxKXprfosHP6ibQntn5oCzHzPHZLg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:f3cf3f86-bc06-4d7a-bfbb-1956680f9f25,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.17,REQID:f3cf3f86-bc06-4d7a-bfbb-1956680f9f25,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:543e81c,CLOUDID:c4c84af5-ff42-4fb0-b929-626456a83c14,B
	ulkID:230110005808MNZQM8RZ,BulkQuantity:0,Recheck:0,SF:28|17|19|48,TC:nil,
	Content:0,EDM:-3,IP:nil,URL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0
X-CID-BVR: 0
X-UUID: a9b5a0a154bc4f91a7813096a5e80acc-20230109
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 190796180; Mon, 09 Jan 2023 09:58:06 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 10 Jan 2023 00:58:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 10 Jan 2023 00:58:04 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 00/13] Add EHT support for mt7996
Date: Tue, 10 Jan 2023 00:57:18 +0800
Message-ID: <20230109165731.682-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_165823_893046_A557D469 
X-CRM114-Status: UNSURE (   9.42  )
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

This series adds initial EHT support for mt7996 driver, which currently
covers features of EHT SU mode. More EHT features are work in progress
and will be introduced in further patches.

This series is based on the following series:
- wifi: mt76: mt7996: fix chainmask calculation in mt7996_set_antenna()
  https://patchwork.kernel.org/project/linux-wireless/patch/20221223101348.11504-1-shayne.chen@mediatek.com/

MeiChia Chiu (1):
  wifi: mt76: mt7996: add EHT beamforming support

Shayne Chen (12):
  wifi: mt76: add EHT phy type
  wifi: mt76: connac: add CMD_CBW_320MHZ
  wifi: mt76: connac: add helpers for EHT capability
  wifi: mt76: connac: add cmd id related to EHT support
  wifi: mt76: increase wcid size to 1088
  wifi: mt76: add EHT rate stats for ethtool
  wifi: mt76: mt7996: add variants support
  wifi: mt76: mt7996: add helpers for wtbl and interface limit
  wifi: mt76: mt7996: rework capability init
  wifi: mt76: mt7996: add EHT capability init
  wifi: mt76: mt7996: add support for EHT rate report
  wifi: mt76: mt7996: enable EHT support in firmware

 drivers/net/wireless/mediatek/mt76/mt76.h     |  11 +-
 .../net/wireless/mediatek/mt76/mt76_connac.h  |   2 +
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  |  46 ++
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  12 +-
 .../wireless/mediatek/mt76/mt7996/debugfs.c   |   8 +-
 .../wireless/mediatek/mt76/mt7996/eeprom.c    |  27 ++
 .../net/wireless/mediatek/mt76/mt7996/init.c  | 400 +++++++++++-------
 .../net/wireless/mediatek/mt76/mt7996/mac.c   |  36 +-
 .../net/wireless/mediatek/mt76/mt7996/main.c  |  10 +-
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 186 +++++++-
 .../net/wireless/mediatek/mt76/mt7996/mcu.h   |  16 +
 .../wireless/mediatek/mt76/mt7996/mt7996.h    |  25 +-
 12 files changed, 591 insertions(+), 188 deletions(-)

-- 
2.25.1


