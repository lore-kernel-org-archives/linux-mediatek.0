Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9178DC48295
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Feb 2024 23:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zQJoHtr6kZX//paLsJxCwe6f5rGwtDs/Iq1f5k3UhHw=; b=IXDwUyORYiTkW6kxuiSjQ3YUfq
	5V8Yzbin+SCCuqeqw2c2YLrIVSAlZge6mSgt+zgb8bhbWzDHUDNs+d4fUuZ1faYuPRzcWTf8D305s
	H6EPxCQt7RaD8zdUUMIJezVm3ByjeOO1KKM/hclCHAdLuyLMbqjEDhSxttN85vfuF2B2HCudfmLT9
	nlhTm2d7aSE4yTydqoNGk2aQ8+xn8DEwyuqw+yxOvTMEglUBNm6zf5MbRXZmCdnYiwt9tjBrvMnew
	tHQvEk6c2BEH7x6KhR2f8js45R14YdfmHaoBr5TtzxyKR2g90uRbernoRiYc8ZeKHatVSrzAPMSrE
	q4j3XhHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW3Nk-0000000Dr0n-2GOi;
	Fri, 02 Feb 2024 23:55:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW3Ng-0000000DqyG-2fFu
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Feb 2024 23:55:39 +0000
X-UUID: 8ccc795ec22611eea0bf134e88e6c2dc-20240202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=zQJoHtr6kZX//paLsJxCwe6f5rGwtDs/Iq1f5k3UhHw=;
	b=UzSf0zUSTQuNg+q/NdE1YuZ1mQ9P5HOG/ZPElKZiW3+xpn/3NltErVxWzuXnhvN5x1HlwURLl+j1ieFRo3Dj5tRyD4ZU3I2/irTe/DXmNgGHja/DaofakVSaKoSgW9QlKEU5yH5SGEeAHC5Y3yLrkx775IpT1R+SBevobiU5ycw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.36,REQID:d3f0beb6-4de2-44e8-aaeb-033334a06c56,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6e16cf4,CLOUDID:a0b0f78e-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 8ccc795ec22611eea0bf134e88e6c2dc-20240202
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 25575394; Fri, 02 Feb 2024 16:55:32 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 3 Feb 2024 07:55:28 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 3 Feb 2024 07:55:28 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, <robin.chiu@mediatek.com>,
	<Eddie.Chen@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
	<kuabhs@google.com>, <druth@google.com>, <abhishekpandit@google.com>,
	<shawnku@google.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH] Bluetooth: btusb: medaitek: fix double free of skb in coredump
Date: Sat, 3 Feb 2024 07:55:27 +0800
Message-ID: <ca2b3447d110874d90e93c6ddf972f4ad2bc70f9.1706917839.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.871400-8.000000
X-TMASE-MatchedRID: h1RQRfN38kBBHBd/Q+ztB836paW7ZnFojzwigoyOACRsXGlmkQWwsGlF
	7OhYLlctx2BEc3TqpBinpDsu3n08Ua6UR+fsf9oDt1AhvyEKdj7q0SQ1Mgx5CCow3ZvJGhxdo8W
	MkQWv6iXBcIE78YqRWvcUt5lc1lLgjMejjvPkBr7CXNRjgnxEVmvGYDAk6g5raficDAY9/J+ie5
	1PgmVSaHP9GvnbPYCDNvb1q9GK2gqwNIPqSKPc3GnBYxaf8hmnVv7SclLCXxZ5lSmbrC6fdtr/T
	o2FgNrjDLMIOOVTHz2nbLeYgH6K31Zca9RSYo/b
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.871400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 8881B210406C035746BB32A16C81758E08B15855A9DE5098F836813435D2C0DC2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_155536_740930_D58D8A43 
X-CRM114-Status: GOOD (  12.14  )
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

From: Sean Wang <sean.wang@mediatek.com>

hci_devcd_append() would free the skb on error so the caller don't
have to free it again otherwise it would cause the double free of skb.

Fixes: 0b7015132878 ("Bluetooth: btusb: mediatek: add MediaTek devcoredump support")
Reported-by : Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/bluetooth/btmtk.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index aaabb732082c..e882613036a0 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -378,8 +378,10 @@ int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb)
 	switch (data->cd_info.state) {
 	case HCI_DEVCOREDUMP_IDLE:
 		err = hci_devcd_init(hdev, MTK_COREDUMP_SIZE);
-		if (err < 0)
+		if (err < 0) {
+			kfree_skb(skb);
 			break;
+		}
 		data->cd_info.cnt = 0;
 
 		/* It is supposed coredump can be done within 5 seconds */
@@ -405,9 +407,6 @@ int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb)
 		break;
 	}
 
-	if (err < 0)
-		kfree_skb(skb);
-
 	return err;
 }
 EXPORT_SYMBOL_GPL(btmtk_process_coredump);
-- 
2.25.1


