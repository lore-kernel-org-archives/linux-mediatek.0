Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE13C282EC
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Mar 2025 23:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NT3ET2M4CvJfrjc7UtUz6A9ZzH+M6UROsJOl9KIGkA8=; b=3+wwqaZtu26ZUcwwDUlgStCoFC
	BtOtR3rxNwBPytZ1dK9AcfqcUO52e9omgeYhLlyFEaazh2TZ2vCoFg0Z8egLr9LhWPf9eXbO5eDRR
	7lBO/lVwm9MO24ktU/vUOvYbZdihaQJuHILnqkeivNpxA07PmryltHhAvHg5S76dNUhrHaZaNZfR6
	hGUTKawHXxcncpx5g8AOzN8wK114SXcLJn/AxCss73oZs3Vc/D7fdiwOqEqxdQtlOFS+++oqr/MGO
	17iopXwSaksdarnl7SWKgaBL1JrthOpI0HEYJTf2RnwoL2Fdf7iqKeG0ax9wvSE0iCVh1OsTKUsFM
	zMNb0KXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts8r1-00000007AXd-40IU;
	Tue, 11 Mar 2025 23:17:43 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts8px-00000007AQl-30wL
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Mar 2025 23:16:38 +0000
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3eb6b16f1a0so1755093b6e.3
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Mar 2025 16:16:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741734995; x=1742339795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NT3ET2M4CvJfrjc7UtUz6A9ZzH+M6UROsJOl9KIGkA8=;
        b=M0ef0+TD3h5L2d/TnHnhrH3aY+dCVS4vsCOEUhDqXCAf16Bw0QWAQSL2rraeZvKh3f
         kn0y33UvdaijROjqBSc+MyqlgcEPgtV7xR7bfI82KKUzQQcfTgHLfYBsScqHFQV7QogZ
         8d8rZxBj/mkqUxOsJj8VPvQD7hZx/0JEe60YYansUHgGlAvfSvCk2K0IUzU4j/zjfSQS
         nO5KpIKS9UUG8r4obMVWnIjGbWjDtXYfr5Kuo4BXz9M7e7JhuhUEj221OLod1uu+0B42
         C+CNl7t4G4nl98qZOQKqQHh5AutboAT54vLm9f+cr05URRm6PM4C0Uj0oBKt4ctrGhuZ
         TwGQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4uB4YtHM8tuZCUF1SF4jFsJc/QdyNU9ddJh1/Zd7V1y8RW/YSetdvIMwmElJc6dKjX9DEDgTQUolcrfoyKQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzhPtoYZZxn6+k07smH+h6kVjcWsEBn1rsBoj4K3fBi9T53i/Mf
	PBZjmyYXUict0NuBjVxmUH/ApkzkJ4Lmf0UHeMem10ZcBkz+4D6A
X-Gm-Gg: ASbGnctF+1t1Dk9bNS2NZi3xDIuryzD8WuRUsG+EV97V8S98i4cX+YnU2H08RrDXf20
	pQcvA+KnQUNyX/YsfZWGFrtggNvMpyVWqjfm3R/bmaySfdFe5670w0tlCtb1r3c9eXZ4MjQDQC0
	WSKUg34N1WECq49IpkXE3ueWfuSclgr9Y1IjdmU4I9wAvF42i7edruWEBPleTQOLRPcuJp8qGi1
	R2VJhK4OuW/bLxKosNEsqtHCbwe0lo+5k6UGG7Dkpp4gsYRzwZYxQSNmfiNU9SmY5oqIaId/GWw
	TZE2iJcWHDVd3G/hfpfh83dJxwi2FvsJGdz5VG1TTWCF6chmqNERsxRWXtqb9KpHKJ6jH2d+
X-Google-Smtp-Source: AGHT+IHvIh7HOKUF2kSTrwl4yZYSR9cniot7aBmMKPsu/SKTAalazf30n182yH5QwSl2BrLtR1sAWQ==
X-Received: by 2002:a05:6808:3996:b0:3f8:effc:938 with SMTP id 5614622812f47-3f8effc0cecmr5870095b6e.34.1741734995283;
        Tue, 11 Mar 2025 16:16:35 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f92706ce68sm868016b6e.26.2025.03.11.16.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 16:16:33 -0700 (PDT)
From: sean.wang@kernel.org
To: marcel@holtmann.org,
	johan.hedberg@gmail.com,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>,
	Yake Yang <yake.yang@mediatek.com>
Subject: [PATCH] Bluetooth: btmtk: delay usb_autopm_put_interface until WMT event received
Date: Tue, 11 Mar 2025 16:16:30 -0700
Message-Id: <20250311231630.35255-1-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_161637_757529_2AA8586F 
X-CRM114-Status: GOOD (  11.47  )
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

Delay calling usb_autopm_put_interface until the WMT event response is
received to ensure proper synchronization and prevent premature power
management actions.

Co-developed-by: Yake Yang <yake.yang@mediatek.com>
Signed-off-by: Yake Yang <yake.yang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/bluetooth/btmtk.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 68846c5bd4f7..01832bc6a259 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -620,17 +620,14 @@ static int btmtk_usb_hci_wmt_sync(struct hci_dev *hdev,
 
 	if (err < 0) {
 		clear_bit(BTMTK_TX_WAIT_VND_EVT, &data->flags);
-		usb_autopm_put_interface(data->intf);
-		goto err_free_wc;
+		goto err_pm_put;
 	}
 
 	/* Submit control IN URB on demand to process the WMT event */
 	err = btmtk_usb_submit_wmt_recv_urb(hdev);
 
-	usb_autopm_put_interface(data->intf);
-
 	if (err < 0)
-		goto err_free_wc;
+		goto err_pm_put;
 
 	/* The vendor specific WMT commands are all answered by a vendor
 	 * specific event and will have the Command Status or Command
@@ -646,18 +643,18 @@ static int btmtk_usb_hci_wmt_sync(struct hci_dev *hdev,
 	if (err == -EINTR) {
 		bt_dev_err(hdev, "Execution of wmt command interrupted");
 		clear_bit(BTMTK_TX_WAIT_VND_EVT, &data->flags);
-		goto err_free_wc;
+		goto err_pm_put;
 	}
 
 	if (err) {
 		bt_dev_err(hdev, "Execution of wmt command timed out");
 		clear_bit(BTMTK_TX_WAIT_VND_EVT, &data->flags);
 		err = -ETIMEDOUT;
-		goto err_free_wc;
+		goto err_pm_put;
 	}
 
 	if (data->evt_skb == NULL)
-		goto err_free_wc;
+		goto err_pm_put;
 
 	/* Parse and handle the return WMT event */
 	wmt_evt = (struct btmtk_hci_wmt_evt *)data->evt_skb->data;
@@ -700,6 +697,8 @@ static int btmtk_usb_hci_wmt_sync(struct hci_dev *hdev,
 err_free_skb:
 	kfree_skb(data->evt_skb);
 	data->evt_skb = NULL;
+err_pm_put:
+	usb_autopm_put_interface(data->intf);
 err_free_wc:
 	kfree(wc);
 	return err;
-- 
2.25.1


