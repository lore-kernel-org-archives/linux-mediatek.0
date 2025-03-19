Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD800C35FFA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Mar 2025 23:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WKlXKZtfh+uTRH8fTklVVRhTwhTpAog5CHSTPWg92Es=; b=Rfw072TaG2SXuyWV6ITvBZYM+e
	qrYHELTu3AdmG2HTKEE3+NEdKMSfaDTbKK6GDao3smlLUT2fTanuheeacrEMblvSdqHKQ+1nnkzzx
	f5qBTUfYL52OPJXCU5BvUwWOVW4tB/6h2T/UxYJEuwoxLtlwTNrzxqY4Mz2Hubmv8SFXB3RGfLPPv
	xaQWnDvDXAx5gv1caYBEHOiJfkKYQIhPITSvGp08nyuVm4fVsQ5keW7eo7IQLo64L3KgkxNwGV0GK
	s+4B+3Vmkw077fG8koUXdKIuK46ihJFnqSgFX66H9ZZ+T1/P9czoPf/Z4vRNJbQfNkzfw3uBYGEPi
	g0KwQB2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv2c3-0000000AP7t-3DP3;
	Wed, 19 Mar 2025 23:14:15 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv2aW-0000000AOiM-2Qzu
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Mar 2025 23:12:41 +0000
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-72c03d237a7so111804a34.3
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Mar 2025 16:12:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742425959; x=1743030759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WKlXKZtfh+uTRH8fTklVVRhTwhTpAog5CHSTPWg92Es=;
        b=LaOB7p02+TFSj+JgIkQ0F2rDf0cGt6tEiplJ0GJotvc4TqMx2ZiD2G/35TQFFiuB9E
         gAUdHXMk+d30S3tfyYQcdOn4yj5RWCIWRx8bqzvpUVBqQZkVFYwNsd1Tj32/cjWOkozc
         TJj1Ymw5F4iIi6zix+T+J4sSRrNbZj0iqeZqJUxQ/ozS2QmC90qt6VUlru2vibqr3YId
         rjZL862pRCwT0U4+DTsqk/igTKd6EOnyrxsg3FUDR5qru7TkTFJ25ClrJSl+ixFXcY8L
         v0Mjs9eLazsSsr/uBE7GvTyx/3NAVZ2oselAP2PkD3Bj1LTp6XDUI5twgfpISXPCovXw
         qzQw==
X-Forwarded-Encrypted: i=1; AJvYcCUsUwzmK6A2hlxpmdYfsIVGh1GNAIpgEP5cAJ9Gm0gZaIyE2U7gaq6zR7nEzPOn1e0Wu0uptmEe7l+3aLBL+g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz8sXeGQV1fh/9o3fP32OjuASXd/833W8eV2vQQC3+TAbviyYL
	UgMTDwNGrKSTsMFoPqDo5EreAl4bCosNd64vFJRjE76UNKFOqH4Z
X-Gm-Gg: ASbGncs78uR/pZ/if4OacYgqxtKO1nErcdVnExVeLaZi3hO7aLwZ6TKuGQpHrTsPz5m
	mrNVTuZLwqnzs2SNX2D5dt34r7FXRt8HYGnJvj0E56fijANjQIrlEyuBezjBY+kaeMeOdF20aRW
	Y0G4M209EYxWbwyVlXyBs3LIQWY32giDh7mcK7CfLXBVup4hCVD4hZr0SGqb7zp+L1eq1uyIbOg
	w4Dw03eCKakprOQ2lLmkbtvQkmRNRoYJaqiwzPUtgAv6e2N2GEzP1Z7jPF08gQ0gW3N1bJ5prM1
	AMFMGdg8dciz02WHc8LDcbhEIwGqT7d3SoUKRI9Wx20ovCkDQuJgNIYrtX8k7A==
X-Google-Smtp-Source: AGHT+IGMcnuShI9r2n5jMm4bysoWLa4SeT4RJoNs1Q1Zu6ZafknXGWanWoen/4zNNHoLqX3qtvk0dg==
X-Received: by 2002:a05:6830:640a:b0:72b:9bac:c044 with SMTP id 46e09a7af769-72c02d6e351mr1163983a34.0.1742425958916;
        Wed, 19 Mar 2025 16:12:38 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-601db7a2a17sm2749735eaf.25.2025.03.19.16.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 16:12:37 -0700 (PDT)
From: sean.wang@kernel.org
To: marcel@holtmann.org,
	johan.hedberg@gmail.com,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>,
	Wentao Guan <guanwentao@uniontech.com>,
	Yake Yang <yake.yang@mediatek.com>
Subject: [PATCH v2] Bluetooth: btmtk: delay usb_autopm_put_interface until WMT event received
Date: Wed, 19 Mar 2025 16:12:35 -0700
Message-Id: <20250319231235.812700-1-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_161240_622768_7FE7308D 
X-CRM114-Status: GOOD (  12.46  )
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

No public link for the reported-by tag available, the report was sent via
private email.

Reported-by: Wentao Guan <guanwentao@uniontech.com>
Co-developed-by: Yake Yang <yake.yang@mediatek.com>
Signed-off-by: Yake Yang <yake.yang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2: add a reported-by tag and mention it was reported in private email.
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


