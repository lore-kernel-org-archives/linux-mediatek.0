Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C102BC4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 23:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kQzDJkz2ShC6jD7BVo0uLIszI5IpreqEnXzr4s/NGaQ=; b=b85sPXTCUY6BWC20Yl29zT+zZO
	Ch6+kTFM0L4lNmZNMcofR3jJg602C/WaT3KCu6O0xQ/ROhoVmhrWobl970j0/VUJ2cnlW8oqKQN/9
	Cyci0cAsYF13csAWzROl86usgvKIRQkUL5wyBovFjNZoemh/ACu2jOue0IFeFrmyJPmchft93WzJY
	tukGnUQjst4GyKgWhVzRG7y+gskP8V5/VSf6RFDH6ax0ws/O8c8EPSp37KNs3PlWPJjOMBVRLzHFE
	cAjWnXOot+63LNMujYNHOGr7Az3OBgehCuWP3iVl7O6ILpuV360iAIE7cq61v2VvLz9yZcmBjv9sN
	WzNQaQ3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxEgx-00000000Iii-1yIT;
	Wed, 17 Apr 2024 23:27:51 +0000
Received: from mail-io1-f47.google.com ([209.85.166.47])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxEgv-00000000IhV-1Gqa
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Apr 2024 23:27:50 +0000
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7d9a64f140dso2615539f.1
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Apr 2024 16:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713396466; x=1714001266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kQzDJkz2ShC6jD7BVo0uLIszI5IpreqEnXzr4s/NGaQ=;
        b=sB0DpWxYihhy0sTSyRT1D5vP3Iq7EWPOSvLJcVdeDNhD7/8isoCdtS4OTF5VxRdMUe
         aDwuI24uQz1QmJ1UUt53TrDIRiRnwZzJUeHJI/8+dYLvA3F8Gcr0olcp4wqFDYfsC7Y2
         /Trvb7obrIroc93GGwL0aCAi5dVNlZWOzq4CTQLMDcy6/IDAahFoeTNE4yvu0ifefrSV
         vFQZw3j+8rQJSu4pTnp1YNer6Oewg8idEDxyIancuD96naJ70kMGFfNu5FhlN62yGKZP
         ZNl2jb5h0nTnvGrSm1DK3YUwDwh3dDxG/O/7HjNAsj0U8X5jzJKKyYGXvUbX8ne0MUCD
         iTqg==
X-Forwarded-Encrypted: i=1; AJvYcCUboUaWQut9CbyMNZqkx3P5C5yOODN4L8oddLFWoyFf83q8veAoJT25o+mecHjRBDW7/F1ofpfLQHxg3YU7swpLOnPkyYjghSrQkURHFbS076MT
X-Gm-Message-State: AOJu0YyIOnItQQ+Inver2dTRJhDCfWO4o6zbI2OKnRKl/dur6fxGi6fy
	W6JXJkLSTmUZdbBs1MX+aKOp/+0wk1oaIYl4XG2ARZvnIIKxiUvP
X-Google-Smtp-Source: AGHT+IHL12Ajqijo9myETQvpt8lM0eXfIcwvisdIpqkdziFih0gh9xV5GzluCrEZV4FK+iWxNsCX/A==
X-Received: by 2002:a92:c561:0:b0:36b:2ff9:9275 with SMTP id b1-20020a92c561000000b0036b2ff99275mr1319293ilj.2.1713396466596;
        Wed, 17 Apr 2024 16:27:46 -0700 (PDT)
Received: from sean-ThinkPad-T450s.hsd1.ca.comcast.net ([2601:646:8002:f344:5981:35f1:46e:37bc])
        by smtp.gmail.com with ESMTPSA id r8-20020a63fc48000000b005dbd0facb4dsm149695pgk.61.2024.04.17.16.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 16:27:45 -0700 (PDT)
From: sean.wang@kernel.org
To: luiz.dentz@gmail.com,
	marcel@holtmann.org,
	johan.hedberg@gmail.com
Cc: sean.wang@mediatek.com,
	chris.lu@mediatek.com,
	Deren.Wu@mediatek.com,
	jsiuda@google.com,
	frankgor@google.com,
	abhishekpandit@google.com,
	michaelfsun@google.com,
	mmandlik@google.com,
	abhishekpandit@chromium.org,
	mcchou@chromium.org,
	shawnku@google.com,
	linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] Bluetooth: btusb: medaitek: fix double free of skb in coredump
Date: Wed, 17 Apr 2024 16:27:38 -0700
Message-Id: <da0859c4b24d314d9ff38179c26a58ee7e3f16d6.1713395895.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_162749_365068_5855308C 
X-CRM114-Status: GOOD (  11.74  )
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
index ac8ebccd3507..812fd2a8f853 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -380,8 +380,10 @@ int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb)
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
@@ -407,9 +409,6 @@ int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb)
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


