Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA63D59D99
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Dec 2025 12:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DfpaJEkerBrqfTqE/r1TRmtVSWOUMTlHDDSSj6YOrlQ=; b=CaDBtV+X7hNtLY3LHy1fxbVbtD
	vdsAl+5WakrsbWt097FLihzRI4hRYDnrSB0OOlnyrYteR7x0WS6hl0zS+nMov6LewKaXlMphTtKVv
	rdLNMdZfboIPdncZmwD2eIChSleAVNX+TQTzjf/bUbIpdQLUzHWk34XM5PPPd4H8rocNdN3mlTdkI
	ySnn3T9n9oM7w2UgklfYYoJAKuO9SKsTDopgu0EOuTmv+SFeAydl9E8cBEh0adx4WU/prbvR9diyT
	aiREbnBJltQnMiot1TgRlHSECglxrRM6MQJ2aTtYExATPTvh1EHzg0MixE8aYL866hWS6P6e6SOW2
	dCr491/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV7cO-00000003bor-2tN3;
	Mon, 15 Dec 2025 12:24:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV7cM-00000003bnC-1SU5
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Dec 2025 12:23:59 +0000
X-UUID: eafce222d9b011f0a52f393f94899d25-20251215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=DfpaJEkerBrqfTqE/r1TRmtVSWOUMTlHDDSSj6YOrlQ=;
	b=codP5FRs/1smgszJAdqGd8oXBf2FWzD4SfBPt8yIk9H8SHIIQLdnOCjNgJ1N3SWA0mO7ECDogxRwLHs++vpLIB+p+fqBVnqNnpOzOJ9fkDjL7XTaLqHO9furi9y3HSdlgWRB1idPV/O8VDnGAwbQqmZ8ajC9V5M7VLtwh4DeZc4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:a3f22274-b023-4275-ac3a-fd375d8a5639,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:f6e5c902-1fa9-44eb-b231-4afc61466396,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: eafce222d9b011f0a52f393f94899d25-20251215
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <leon.yen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1835044691; Mon, 15 Dec 2025 05:23:52 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 20:23:50 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 20:23:50 +0800
From: Leon Yen <leon.yen@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<deren.wu@mediatek.com>, <sean.wang@mediatek.com>,
	<mingyen.hsieh@mediatek.com>, <michael.lo@mediatek.com>,
	<allan.wang@mediatek.com>, <quan.zhou@mediatek.com>,
	<sarick.jiang@mediatek.com>, <ryder.lee@mediatek.com>,
	<shayne.chen@mediatek.com>, <leon.yen@mediatek.com>
Subject: [PATCH v2] wifi: mt76: mt792x: Fix a potential deadlock in high-load situations
Date: Mon, 15 Dec 2025 20:22:31 +0800
Message-ID: <20251215122231.3180648-1-leon.yen@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_042358_390539_B75A9D65 
X-CRM114-Status: GOOD (  10.54  )
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

A deadlock may occur between two works, ps_work and mac_work, if their work
functions run simultaneously as they attempt to cancel each other by
calling cancel_delayed_work_sync().

mt792x_mac_work() ->   ...  -> cancel_delayed_work_sync(&pm->ps_work);
mt792x_pm_power_save_work() -> cancel_delayed_work_sync(&mphy->mac_work);

In high-load situations, they are queued but may not have chance to be
executed until the CPUs are released. Once the CPUs are available, there
is a high possibility that the ps_work function and mac_work function will
be executed simultaneously, resulting in a possible deadlock.

This patch replaces cancel_delayed_work_sync() with cancel_delayed_work()
in ps_work to eliminate the deadlock and make the code easier to maintain.

Signed-off-by: Leon Yen <leon.yen@mediatek.com>
---
v2: Modify the solution to make it simpler and easier to maintain
---
 drivers/net/wireless/mediatek/mt76/mt792x_mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_mac.c b/drivers/net/wireless/mediatek/mt76/mt792x_mac.c
index 71dec93094eb..888e5a505673 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_mac.c
@@ -375,7 +375,7 @@ void mt792x_pm_power_save_work(struct work_struct *work)
 	}
 
 	if (!mt792x_mcu_fw_pmctrl(dev)) {
-		cancel_delayed_work_sync(&mphy->mac_work);
+		cancel_delayed_work(&mphy->mac_work);
 		return;
 	}
 out:
-- 
2.45.2


