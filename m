Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648B5CA1014
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Sep 2025 04:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gkBOdO/yHM0OSioJ3xLSP7FVBinfICtJku8Tde8YbO8=; b=mbOTIcQsduPUrYN+i/W+ojOK9+
	vEZSAZeb5esOO+Zga2OAc9JOdVNBS7Ue/ZNHpKOkRoVVcNngP7wwgkqvSB5ByFSC4OsIvAGDavHyY
	KShMbvdTLp8jbDo73yHCk3/ppUJDYkVEms+wuTAGjUJd2VQPRKjup27mXfLodF+uieLmvy03Y3Y4u
	EPqbD5qDUWfUZqfgnAanE8I4jjzaiPljmjNe2iPriC+2Q2zRQqCudLaCjWAe3J6sZoum2vOHUm961
	/qlRvG2A89dv+T0GHaWzcuU/ZnUKqmmYjLbZwpu0HJhpMXXp4yQFJW3xQyz+43lpO9Pf9w+cUE8yi
	j37Zv6dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu1JG-00000008scz-4APH;
	Thu, 04 Sep 2025 04:10:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0Jr-00000008ZvN-1ww2
	for linux-mediatek@bombadil.infradead.org;
	Thu, 04 Sep 2025 03:07:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=gkBOdO/yHM0OSioJ3xLSP7FVBinfICtJku8Tde8YbO8=; b=mK+ggbxHHZknQxoW2g498nEokr
	RHKgXwB2V8GF+XqKSzkBMsq3vSZ9jdBL87l36+cl2LyyfrEy+/5Dxm1pdw3aj+5I/jb6/QpXDwJnP
	4XoKoyFthbZaf82dLES5JeZ5BZHEaUNPTdxcD35voM0c+z1IeeXjfLsgF9VCAe2oNVlSG3bGzxXlG
	4BKqm2GMy/ZDcZtZiQxgSPpqT7DeCSTd8TNTS2RCQfxMWEoP/6kmFSEmFhJ/dV7JYfHrf7AXyBGO0
	eYlkvcnoqzDvy+DPjv1NyOt3up4hvc1sygl5h0qbveU1XJFwJWwYKSdc19MYjmJtS6vYQpQd0aaw6
	aGQEvQWw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0Jn-00000004Gxf-12Og
	for linux-mediatek@lists.infradead.org;
	Thu, 04 Sep 2025 03:07:25 +0000
X-UUID: 3dadb7aa893c11f09f706fa2197c6ceb-20250903
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=gkBOdO/yHM0OSioJ3xLSP7FVBinfICtJku8Tde8YbO8=;
	b=HE7JT6Hx4w+Ihr5TjzLBfcnST65Vtw0RZ2FmmNB8W82VLFeRsprd878skw8aSOaBFXgoZsBoBHbu0uDZAXdvCpM0OCSjQY3x77e8fAXoob7TKXbNcH9tiylN8ayrQ/IbMf/PJxwHgISlky3k1tUKzkal+ZQDR9Jf1PvwqV3qnv0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:5df63000-8012-4191-b041-912602e9958f,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:9e2c2e6c-8443-424b-b119-dc42e68239b0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3dadb7aa893c11f09f706fa2197c6ceb-20250903
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 840945206; Wed, 03 Sep 2025 20:07:07 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 4 Sep 2025 11:07:03 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 4 Sep 2025 11:07:03 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Michael.Lo@mediatek.com>,
	<allan.wang@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>
Subject: [PATCH 0/4] wifi: mt76: fixes for mt7925
Date: Thu, 4 Sep 2025 11:06:45 +0800
Message-ID: <20250904030649.655436-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_040724_234251_E5D318DC 
X-CRM114-Status: UNSURE (   6.31  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

Ming Yen Hsieh (4):
  wifi: mt76: mt792x: protect state->cc_* counters with cc_lock
  wifi: mt76: mt7925: prevent NULL vif dereference in
    mt7925_mac_write_txwi
  wifi: mt76: mt7925: prevent NULL pointer dereference in
    mt7925_tx_check_aggr()
  wifi: mt76: connac: synchronize token_count access in
    mt76_connac_skip_fw_pmctrl

 drivers/net/wireless/mediatek/mt76/mt76_connac.h | 7 ++++++-
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c  | 9 ++++++---
 drivers/net/wireless/mediatek/mt76/mt792x_mac.c  | 4 ++++
 3 files changed, 16 insertions(+), 4 deletions(-)

-- 
2.34.1


