Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C82C27C52
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jun 2024 09:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YUWkF0EjrHqCvoEKuIYDl0OYArHcuV5t20sbJAKBaX8=; b=TI/xpQ0bnnNg57jBUD8m5WBOhL
	qlp137/bTR2YVNKc+5DT/FZqKzjESJRu/y4SUprG2yX0mmSC5kHRt0gN27jhWtgOuf3fPZQXk7VxL
	g23Cr83UW4ffjp/kDo+L/vFBRAQhsH1ebCbLWg3YHLJr9FDVHgKNBYQRKxNwzGdWuK0G1nntnW9ff
	9POlj0vzVvZrm5SRrpk5oqnaAkD4zLLuj0JHD1I98qhZgjIrK/6hJC0xTZaijaBKwooGugo564v2T
	QQ7vOyEZiKTZf4f0R4n6mVUxZNLFBna2XHdiWxjiNsr1TWu/w5sYYqMLJwF8AAUfCXTLwzcRN9GKD
	U+tAgCJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9Li-000000097aI-0Owu;
	Thu, 06 Jun 2024 09:23:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9La-000000097US-30ow
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Jun 2024 09:23:56 +0000
X-UUID: 7ad0e93423e611efba8bfb22b0451c12-20240606
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=YUWkF0EjrHqCvoEKuIYDl0OYArHcuV5t20sbJAKBaX8=;
	b=E5Amf2qySzd55tJBDfoeXNcqZ3aQKQlWaMTom7BDRSMf9gctASs71sf7+nTBMzNKKdQkU2Lr1Gy2HwKcZJDQy6MqdpL+XGtqa1pokxlWp4Jm0mV64CW9MddubduAcJIv9f6zWicYVEwnscc96czgNCLpLB7TZOFYO4BOZxniwWc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:d4fed7d5-20ff-4a34-b09e-73c539010f52,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:8e324744-4544-4d06-b2b2-d7e12813c598,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 7ad0e93423e611efba8bfb22b0451c12-20240606
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 167413892; Thu, 06 Jun 2024 02:23:48 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 6 Jun 2024 17:23:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 6 Jun 2024 17:23:45 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Deren Wu <deren.Wu@mediatek.com>,
	Aaron Hou <aaron.hou@mediatek.com>, Steve Lee <steve.lee@mediatek.com>,
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v3 2/4] Bluetooth: btusb: add callback function in btusb suspend/resume
Date: Thu, 6 Jun 2024 17:23:38 +0800
Message-ID: <20240606092340.27675-3-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240606092340.27675-1-chris.lu@mediatek.com>
References: <20240606092340.27675-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.166100-8.000000
X-TMASE-MatchedRID: xKwqdG8zLkdQs1SN7/4/ILiMC5wdwKqdgRykyfrH1xl0Rk5xb2PnltXf
	akMEIQ7HfLIS8FLmihpf1xEson1kFmQkHQEHAoWZJsxvR/kPS6pMkOX0UoduuQqiCYa6w8tvb7e
	EsDP9hR2F8NrNX0LQ3A/uoMrYx9wGVOSZp87t6zCeAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8hxKp
	vEGAbTDpA4qPsOFhGU2AcfteNpKqCv4HZLkRYL2yB16cmW2l1XxeTCd0IgD9vg1qtq6TmR6fzU0
	+t51hhPdCxMVm/tSlF6biAvwhuk1HmVKZusLp922v9OjYWA2uMMswg45VMfPXY3pGDmoik6
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.166100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: AFBE66133EF398CF08C94DC5187EB8B22737B0F790BA5777F38581CEC15F941D2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_022350_917021_B0AAFB01 
X-CRM114-Status: UNSURE (   9.01  )
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

Add new function: dev_suspend/dev_resume in btusb_data which are reserved
for vendor specific usage during suspend/resume. dev_suspend will be
added before stop traffic in btusb_suspend and dev_resume will be
added after resubmit urb in btusb_resuem.

Signed-off-by: Chris Lu <chris.lu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/bluetooth/btusb.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 79aefdb3324d..83765c0c14b4 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -891,6 +891,9 @@ struct btusb_data {
 
 	int (*setup_on_usb)(struct hci_dev *hdev);
 
+	int (*dev_suspend)(struct hci_dev *hdev);
+	int (*dev_resume)(struct hci_dev *hdev);
+
 	int oob_wake_irq;   /* irq for out-of-band wake-on-bt */
 	unsigned cmd_timeout_cnt;
 
@@ -4715,6 +4718,9 @@ static int btusb_suspend(struct usb_interface *intf, pm_message_t message)
 
 	cancel_work_sync(&data->work);
 
+	if (data->dev_suspend)
+		data->dev_suspend(data->hdev);
+
 	btusb_stop_traffic(data);
 	usb_kill_anchored_urbs(&data->tx_anchor);
 
@@ -4818,6 +4824,9 @@ static int btusb_resume(struct usb_interface *intf)
 			btusb_submit_isoc_urb(hdev, GFP_NOIO);
 	}
 
+	if (data->dev_resume)
+		data->dev_resume(hdev);
+
 	spin_lock_irq(&data->txlock);
 	play_deferred(data);
 	clear_bit(BTUSB_SUSPENDING, &data->flags);
-- 
2.18.0


