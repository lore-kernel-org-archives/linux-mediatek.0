Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C920BCCD193
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Oct 2025 18:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gDlTS66uQs02ZrCh1NQbJm6uxfOa1C37VmD1HX7Ng0A=; b=har6sB3WyNuwYt9Qh4KD45P1pD
	b5/IwUKbf83zGqKcdTdWsLfeDWPwU/xjRehntCMzmSpnBo594jHC6mLTpSk7wCaUBbraGMynQh/37
	wcGbEGcrc0QSdqgcYITBavLmQBavvDCu5Wyc4NcoRPCGMYCsG/fV1pMuzr7p2K5o/9+K+BTueASEr
	zcFEttLf4pAdoRCidGQBc0nFCSz+usgav2/nEnklwNz1HMcnFrPLPvhgMzZfnKLxTcgur1OExF+C2
	tNVe57L8QHok0n4Qz8Nr72t8i8pOevFjxcPmweNprpW3RoPRauGzuDHYPT6nNLo26iOKJ5tiA4AQP
	yht/yE1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0Lc-00000007HEU-1aLl;
	Thu, 23 Oct 2025 18:47:40 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0LZ-00000007HDd-1ec2
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Oct 2025 18:47:39 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7a26b04bfc8so1319408b3a.2
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Oct 2025 11:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wbinvd.org; s=wbinvd; t=1761245256; x=1761850056; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gDlTS66uQs02ZrCh1NQbJm6uxfOa1C37VmD1HX7Ng0A=;
        b=XXscUsYtR6Bpo2C9eiRYsogsWRXKniTnIiLBbyyWdiB5SD/7OMg2aCHTJr0aPe7hkT
         EpS6FKV/olTg3HnK/CxOj/MRWpye+hdhZsiw0P3M6tGKZuvxaBUBBcAN+ohKCN2RtWoR
         u9lgPKY0qHYnZZywdifb1IxnagflSCBlkniwso5XBotj+JQ7vZC/KRwKl+xl/YGwLZdH
         XFIcZpyvwuobG4HiVj103VtANg24ZuaZ599BqX3+kWEzDnhPic+fDS/F0K4nnAYPtXvN
         +/04p4p862Gi277ADYegV9ovzh6DnvMgY1ktYBQK/FO1BomlRDtptXToB+fPa8EkNZvg
         DEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761245256; x=1761850056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gDlTS66uQs02ZrCh1NQbJm6uxfOa1C37VmD1HX7Ng0A=;
        b=UIMvrOWJuWVmNO9s5ZLltLZEfYuPouRKgCvqAKSivkdZ9RSYA+4TaQ0uQeJbZnGEAR
         D7IuUcAOiBNh2ZgSzcJ+1dm4hXt2cvSjKfkpF0O1YUZeUUS9aCuzfquGBN8IkgrfS8MF
         FKUinT2+u5RlghB5gKeVVg+Wa7AMqSjEFXWiGJ1kPCtFKblGkC5/2cpxVU3J2WdKQfdk
         2pZbR+RkAc4/mrXSYKXEShqiOy0JJ5HK+A+IqTxA98hLuiSCqGTBFUeerZNedElUVI9a
         AjZ9lYwozVuTQ719J2ba/RD5qAneTaD32gPq/jVgLY64oNjLSu1ij6FpiEfDzb2unnqh
         Phlw==
X-Forwarded-Encrypted: i=1; AJvYcCU1yQU5EXX+IZU4KZbbtXrKneGSU2MGFdmyAp+ivDqstk2/qYS5DyX6W7nszDMEzPX5LaIWfmalAo82806H9w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh99GUNrfZnWvXOeht2+DKK5McxoXMpUKKRFFS3oCr2gGYwJuv
	XtHyF2kNa8mtPCV/EHcWqTXWaVyyxrJgICNklwKLnTuAU/qGv5yBwfwa+UmfUkEUpRI=
X-Gm-Gg: ASbGncvOnt66awTqZtYqFZY7b6b3og8Wm1UWUxO30d0Re79xdZ3IUVvC9BHDTMKV7Ig
	ZmAZTE2y6LndbEY4+J+tRbJ9tJaTsSl1QPIexZj814osbjC2wNeMt6r+pF/MLK1EEjKsfxK5bCh
	qGdjQiDiYwhocmsxzWI8GHF9AE6gESbaKPDd58pl4nwtx37lPCspthT1kBbrxGQpxhywR2zGifB
	nD/gW0EQOnvA3BoJmmvzQ3QB07D76Iq9SCEAAWeZM+P3aG8OQ2rSjDS/EE63/yRG7ZYCJ+eitSf
	HU8wfaaDVc6SNQ2yrmEVX1+dKqD8AdX5oX9J6/J2lPwIqDJ76TkI92flTyFf1l6zABB2jC63yN1
	XTzjutwZs6XA9mwDDXYGUoA5ikndM98qcAIle78lxdZmnb/f0I4AqjtqHY020VD/66QAzAN201B
	f5Ig==
X-Google-Smtp-Source: AGHT+IF8HQIHdGLUBu61JKxd11Dvm79npjsLYZBdWDhc4aMFaVHyj557vf//cPT1d4ZxPBolSup6cw==
X-Received: by 2002:a05:6a21:9986:b0:320:3da8:34d7 with SMTP id adf61e73a8af0-334a85661b7mr32411910637.22.1761245256047;
        Thu, 23 Oct 2025 11:47:36 -0700 (PDT)
Received: from mozart.vkv.me ([192.184.167.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4bb9259sm2793961a12.2.2025.10.23.11.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 11:47:35 -0700 (PDT)
From: Calvin Owens <calvin@wbinvd.org>
To: linux-kernel@vger.kernel.org
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Amitkumar Karwar <amitkumar.karwar@nxp.com>,
	Neeraj Kale <neeraj.sanjaykale@nxp.com>,
	Yang Li <yang.li@amlogic.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	Francesco Valla <francesco@valla.it>
Subject: [PATCH] Bluetooth: fix corruption in h4_recv_buf() after cleanup
Date: Thu, 23 Oct 2025 11:47:19 -0700
Message-ID: <ab6fa50055fa0c39e5501c123c36e662eb48ae61.1761245114.git.calvin@wbinvd.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_114737_448651_628A7314 
X-CRM114-Status: GOOD (  18.19  )
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

Thanks to Francesco Valla's investigation, the reason for the duplicate
code I recently cleaned up is finally clear: a different structure is
stored in drvdata for the drivers which used that duplicate function,
but h4_recv_buf() assumes drvdata is always an hci_uart structure.

Consequently, alignment and padding are now randomly corrupted for
btmtkuart, btnxpuart, and bpa10x in h4_recv_buf(), causing erratic
breakage.

Fix this by making the hci_uart structure the explicit argument to
h4_recv_buf(). Every caller already has a reference to hci_uart, and
already obtains the hci_hdev reference through it, so this actually
eliminates a redundant pointer indirection for all existing callers.

Fixes: 93f06f8f0daf ("Bluetooth: remove duplicate h4_recv_buf() in header")
Reported-by: Francesco Valla <francesco@valla.it>
Closes: https://lore.kernel.org/lkml/6837167.ZASKD2KPVS@fedora.fritz.box/
Signed-off-by: Calvin Owens <calvin@wbinvd.org>
---
 drivers/bluetooth/bpa10x.c    | 4 +++-
 drivers/bluetooth/btmtkuart.c | 4 +++-
 drivers/bluetooth/btnxpuart.c | 4 +++-
 drivers/bluetooth/hci_ag6xx.c | 2 +-
 drivers/bluetooth/hci_aml.c   | 2 +-
 drivers/bluetooth/hci_ath.c   | 2 +-
 drivers/bluetooth/hci_bcm.c   | 2 +-
 drivers/bluetooth/hci_h4.c    | 6 +++---
 drivers/bluetooth/hci_intel.c | 2 +-
 drivers/bluetooth/hci_ll.c    | 2 +-
 drivers/bluetooth/hci_mrvl.c  | 6 +++---
 drivers/bluetooth/hci_nokia.c | 4 ++--
 drivers/bluetooth/hci_qca.c   | 2 +-
 drivers/bluetooth/hci_uart.h  | 2 +-
 14 files changed, 25 insertions(+), 19 deletions(-)

diff --git a/drivers/bluetooth/bpa10x.c b/drivers/bluetooth/bpa10x.c
index b7ba667a3d09..e305d04aac9d 100644
--- a/drivers/bluetooth/bpa10x.c
+++ b/drivers/bluetooth/bpa10x.c
@@ -41,6 +41,7 @@ struct bpa10x_data {
 	struct usb_anchor rx_anchor;
 
 	struct sk_buff *rx_skb[2];
+	struct hci_uart hu;
 };
 
 static void bpa10x_tx_complete(struct urb *urb)
@@ -96,7 +97,7 @@ static void bpa10x_rx_complete(struct urb *urb)
 	if (urb->status == 0) {
 		bool idx = usb_pipebulk(urb->pipe);
 
-		data->rx_skb[idx] = h4_recv_buf(hdev, data->rx_skb[idx],
+		data->rx_skb[idx] = h4_recv_buf(&data->hu, data->rx_skb[idx],
 						urb->transfer_buffer,
 						urb->actual_length,
 						bpa10x_recv_pkts,
@@ -388,6 +389,7 @@ static int bpa10x_probe(struct usb_interface *intf,
 	hci_set_drvdata(hdev, data);
 
 	data->hdev = hdev;
+	data->hu.hdev = hdev;
 
 	SET_HCIDEV_DEV(hdev, &intf->dev);
 
diff --git a/drivers/bluetooth/btmtkuart.c b/drivers/bluetooth/btmtkuart.c
index d9b90ea2ad38..27aa48ff3ac2 100644
--- a/drivers/bluetooth/btmtkuart.c
+++ b/drivers/bluetooth/btmtkuart.c
@@ -79,6 +79,7 @@ struct btmtkuart_dev {
 	u16	stp_dlen;
 
 	const struct btmtkuart_data *data;
+	struct hci_uart hu;
 };
 
 #define btmtkuart_is_standalone(bdev)	\
@@ -368,7 +369,7 @@ static void btmtkuart_recv(struct hci_dev *hdev, const u8 *data, size_t count)
 		sz_left -= adv;
 		p_left += adv;
 
-		bdev->rx_skb = h4_recv_buf(bdev->hdev, bdev->rx_skb, p_h4,
+		bdev->rx_skb = h4_recv_buf(&bdev->hu, bdev->rx_skb, p_h4,
 					   sz_h4, mtk_recv_pkts,
 					   ARRAY_SIZE(mtk_recv_pkts));
 		if (IS_ERR(bdev->rx_skb)) {
@@ -858,6 +859,7 @@ static int btmtkuart_probe(struct serdev_device *serdev)
 	}
 
 	bdev->hdev = hdev;
+	bdev->hu.hdev = hdev;
 
 	hdev->bus = HCI_UART;
 	hci_set_drvdata(hdev, bdev);
diff --git a/drivers/bluetooth/btnxpuart.c b/drivers/bluetooth/btnxpuart.c
index d5153fed0518..3b1e9224e965 100644
--- a/drivers/bluetooth/btnxpuart.c
+++ b/drivers/bluetooth/btnxpuart.c
@@ -212,6 +212,7 @@ struct btnxpuart_dev {
 	struct ps_data psdata;
 	struct btnxpuart_data *nxp_data;
 	struct reset_control *pdn;
+	struct hci_uart hu;
 };
 
 #define NXP_V1_FW_REQ_PKT	0xa5
@@ -1756,7 +1757,7 @@ static size_t btnxpuart_receive_buf(struct serdev_device *serdev,
 
 	ps_start_timer(nxpdev);
 
-	nxpdev->rx_skb = h4_recv_buf(nxpdev->hdev, nxpdev->rx_skb, data, count,
+	nxpdev->rx_skb = h4_recv_buf(&nxpdev->hu, nxpdev->rx_skb, data, count,
 				     nxp_recv_pkts, ARRAY_SIZE(nxp_recv_pkts));
 	if (IS_ERR(nxpdev->rx_skb)) {
 		int err = PTR_ERR(nxpdev->rx_skb);
@@ -1875,6 +1876,7 @@ static int nxp_serdev_probe(struct serdev_device *serdev)
 	reset_control_deassert(nxpdev->pdn);
 
 	nxpdev->hdev = hdev;
+	nxpdev->hu.hdev = hdev;
 
 	hdev->bus = HCI_UART;
 	hci_set_drvdata(hdev, nxpdev);
diff --git a/drivers/bluetooth/hci_ag6xx.c b/drivers/bluetooth/hci_ag6xx.c
index 2d40302409ff..94588676510f 100644
--- a/drivers/bluetooth/hci_ag6xx.c
+++ b/drivers/bluetooth/hci_ag6xx.c
@@ -105,7 +105,7 @@ static int ag6xx_recv(struct hci_uart *hu, const void *data, int count)
 	if (!test_bit(HCI_UART_REGISTERED, &hu->flags))
 		return -EUNATCH;
 
-	ag6xx->rx_skb = h4_recv_buf(hu->hdev, ag6xx->rx_skb, data, count,
+	ag6xx->rx_skb = h4_recv_buf(hu, ag6xx->rx_skb, data, count,
 				    ag6xx_recv_pkts,
 				    ARRAY_SIZE(ag6xx_recv_pkts));
 	if (IS_ERR(ag6xx->rx_skb)) {
diff --git a/drivers/bluetooth/hci_aml.c b/drivers/bluetooth/hci_aml.c
index 707e90f80130..b1f32c5a8a3f 100644
--- a/drivers/bluetooth/hci_aml.c
+++ b/drivers/bluetooth/hci_aml.c
@@ -650,7 +650,7 @@ static int aml_recv(struct hci_uart *hu, const void *data, int count)
 	struct aml_data *aml_data = hu->priv;
 	int err;
 
-	aml_data->rx_skb = h4_recv_buf(hu->hdev, aml_data->rx_skb, data, count,
+	aml_data->rx_skb = h4_recv_buf(hu, aml_data->rx_skb, data, count,
 				       aml_recv_pkts,
 				       ARRAY_SIZE(aml_recv_pkts));
 	if (IS_ERR(aml_data->rx_skb)) {
diff --git a/drivers/bluetooth/hci_ath.c b/drivers/bluetooth/hci_ath.c
index dbfe34664633..8d2b5e7f0d6a 100644
--- a/drivers/bluetooth/hci_ath.c
+++ b/drivers/bluetooth/hci_ath.c
@@ -191,7 +191,7 @@ static int ath_recv(struct hci_uart *hu, const void *data, int count)
 {
 	struct ath_struct *ath = hu->priv;
 
-	ath->rx_skb = h4_recv_buf(hu->hdev, ath->rx_skb, data, count,
+	ath->rx_skb = h4_recv_buf(hu, ath->rx_skb, data, count,
 				  ath_recv_pkts, ARRAY_SIZE(ath_recv_pkts));
 	if (IS_ERR(ath->rx_skb)) {
 		int err = PTR_ERR(ath->rx_skb);
diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
index f96617b85d87..fff845ed44e3 100644
--- a/drivers/bluetooth/hci_bcm.c
+++ b/drivers/bluetooth/hci_bcm.c
@@ -698,7 +698,7 @@ static int bcm_recv(struct hci_uart *hu, const void *data, int count)
 	if (!test_bit(HCI_UART_REGISTERED, &hu->flags))
 		return -EUNATCH;
 
-	bcm->rx_skb = h4_recv_buf(hu->hdev, bcm->rx_skb, data, count,
+	bcm->rx_skb = h4_recv_buf(hu, bcm->rx_skb, data, count,
 				  bcm_recv_pkts, ARRAY_SIZE(bcm_recv_pkts));
 	if (IS_ERR(bcm->rx_skb)) {
 		int err = PTR_ERR(bcm->rx_skb);
diff --git a/drivers/bluetooth/hci_h4.c b/drivers/bluetooth/hci_h4.c
index 9070e31a68bf..ec017df8572c 100644
--- a/drivers/bluetooth/hci_h4.c
+++ b/drivers/bluetooth/hci_h4.c
@@ -112,7 +112,7 @@ static int h4_recv(struct hci_uart *hu, const void *data, int count)
 	if (!test_bit(HCI_UART_REGISTERED, &hu->flags))
 		return -EUNATCH;
 
-	h4->rx_skb = h4_recv_buf(hu->hdev, h4->rx_skb, data, count,
+	h4->rx_skb = h4_recv_buf(hu, h4->rx_skb, data, count,
 				 h4_recv_pkts, ARRAY_SIZE(h4_recv_pkts));
 	if (IS_ERR(h4->rx_skb)) {
 		int err = PTR_ERR(h4->rx_skb);
@@ -151,12 +151,12 @@ int __exit h4_deinit(void)
 	return hci_uart_unregister_proto(&h4p);
 }
 
-struct sk_buff *h4_recv_buf(struct hci_dev *hdev, struct sk_buff *skb,
+struct sk_buff *h4_recv_buf(struct hci_uart *hu, struct sk_buff *skb,
 			    const unsigned char *buffer, int count,
 			    const struct h4_recv_pkt *pkts, int pkts_count)
 {
-	struct hci_uart *hu = hci_get_drvdata(hdev);
 	u8 alignment = hu->alignment ? hu->alignment : 1;
+	struct hci_dev *hdev = hu->hdev;
 
 	/* Check for error from previous call */
 	if (IS_ERR(skb))
diff --git a/drivers/bluetooth/hci_intel.c b/drivers/bluetooth/hci_intel.c
index 9b353c3d6442..1d6e09508f1f 100644
--- a/drivers/bluetooth/hci_intel.c
+++ b/drivers/bluetooth/hci_intel.c
@@ -972,7 +972,7 @@ static int intel_recv(struct hci_uart *hu, const void *data, int count)
 	if (!test_bit(HCI_UART_REGISTERED, &hu->flags))
 		return -EUNATCH;
 
-	intel->rx_skb = h4_recv_buf(hu->hdev, intel->rx_skb, data, count,
+	intel->rx_skb = h4_recv_buf(hu, intel->rx_skb, data, count,
 				    intel_recv_pkts,
 				    ARRAY_SIZE(intel_recv_pkts));
 	if (IS_ERR(intel->rx_skb)) {
diff --git a/drivers/bluetooth/hci_ll.c b/drivers/bluetooth/hci_ll.c
index 7044c86325ce..6f4e25917b86 100644
--- a/drivers/bluetooth/hci_ll.c
+++ b/drivers/bluetooth/hci_ll.c
@@ -429,7 +429,7 @@ static int ll_recv(struct hci_uart *hu, const void *data, int count)
 	if (!test_bit(HCI_UART_REGISTERED, &hu->flags))
 		return -EUNATCH;
 
-	ll->rx_skb = h4_recv_buf(hu->hdev, ll->rx_skb, data, count,
+	ll->rx_skb = h4_recv_buf(hu, ll->rx_skb, data, count,
 				 ll_recv_pkts, ARRAY_SIZE(ll_recv_pkts));
 	if (IS_ERR(ll->rx_skb)) {
 		int err = PTR_ERR(ll->rx_skb);
diff --git a/drivers/bluetooth/hci_mrvl.c b/drivers/bluetooth/hci_mrvl.c
index e08222395772..8767522ec4c6 100644
--- a/drivers/bluetooth/hci_mrvl.c
+++ b/drivers/bluetooth/hci_mrvl.c
@@ -264,9 +264,9 @@ static int mrvl_recv(struct hci_uart *hu, const void *data, int count)
 				!test_bit(STATE_FW_LOADED, &mrvl->flags))
 		return count;
 
-	mrvl->rx_skb = h4_recv_buf(hu->hdev, mrvl->rx_skb, data, count,
-				    mrvl_recv_pkts,
-				    ARRAY_SIZE(mrvl_recv_pkts));
+	mrvl->rx_skb = h4_recv_buf(hu, mrvl->rx_skb, data, count,
+				   mrvl_recv_pkts,
+				   ARRAY_SIZE(mrvl_recv_pkts));
 	if (IS_ERR(mrvl->rx_skb)) {
 		int err = PTR_ERR(mrvl->rx_skb);
 		bt_dev_err(hu->hdev, "Frame reassembly failed (%d)", err);
diff --git a/drivers/bluetooth/hci_nokia.c b/drivers/bluetooth/hci_nokia.c
index cd7575c20f65..1e65b541f8ad 100644
--- a/drivers/bluetooth/hci_nokia.c
+++ b/drivers/bluetooth/hci_nokia.c
@@ -624,8 +624,8 @@ static int nokia_recv(struct hci_uart *hu, const void *data, int count)
 	if (!test_bit(HCI_UART_REGISTERED, &hu->flags))
 		return -EUNATCH;
 
-	btdev->rx_skb = h4_recv_buf(hu->hdev, btdev->rx_skb, data, count,
-				  nokia_recv_pkts, ARRAY_SIZE(nokia_recv_pkts));
+	btdev->rx_skb = h4_recv_buf(hu, btdev->rx_skb, data, count,
+				    nokia_recv_pkts, ARRAY_SIZE(nokia_recv_pkts));
 	if (IS_ERR(btdev->rx_skb)) {
 		err = PTR_ERR(btdev->rx_skb);
 		dev_err(dev, "Frame reassembly failed (%d)", err);
diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 4cff4d9be313..888176b0faa9 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1277,7 +1277,7 @@ static int qca_recv(struct hci_uart *hu, const void *data, int count)
 	if (!test_bit(HCI_UART_REGISTERED, &hu->flags))
 		return -EUNATCH;
 
-	qca->rx_skb = h4_recv_buf(hu->hdev, qca->rx_skb, data, count,
+	qca->rx_skb = h4_recv_buf(hu, qca->rx_skb, data, count,
 				  qca_recv_pkts, ARRAY_SIZE(qca_recv_pkts));
 	if (IS_ERR(qca->rx_skb)) {
 		int err = PTR_ERR(qca->rx_skb);
diff --git a/drivers/bluetooth/hci_uart.h b/drivers/bluetooth/hci_uart.h
index cbbe79b241ce..48ac7ca9334e 100644
--- a/drivers/bluetooth/hci_uart.h
+++ b/drivers/bluetooth/hci_uart.h
@@ -162,7 +162,7 @@ struct h4_recv_pkt {
 int h4_init(void);
 int h4_deinit(void);
 
-struct sk_buff *h4_recv_buf(struct hci_dev *hdev, struct sk_buff *skb,
+struct sk_buff *h4_recv_buf(struct hci_uart *hu, struct sk_buff *skb,
 			    const unsigned char *buffer, int count,
 			    const struct h4_recv_pkt *pkts, int pkts_count);
 #endif
-- 
2.47.3


