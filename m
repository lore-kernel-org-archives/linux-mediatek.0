Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C8A4103E2E7
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2026 20:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZFSrsAzKQ3Nc+Aho7d7gG2Ra3wQyS/1tLF/F02PD+Zo=; b=pjsrgoM0Ed762hOXKc5qhV9c8N
	dibIPbBd0pTZ7tafoVSChdKvRPC9QaJt61WeN0JiAT23B96HhoMURjwC8iDzSd0ndsetukxeAbGTu
	iXGG2PPzAYBKiJuxX7G+oAKQ1f+82Rcy1suIWW/i/YxOoDOiKNsHgFp0Zv/2+PmR3JFnfvFVtYBQh
	lmy/TqA6RlBT65Q+LBqtJvpQvG1WCAoMW7oz4p1yPO9kSZf3Fh6wx3ElUIDjZ26BsQa/gnfOQkfUF
	3esW9eSmXnHXKENY0ojak4P1hI/QueuiBugJUQg9peARvYAg8HyyUbbk8tEcSiYv6Muzo91qla+o7
	HK1BDiZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Qde-0000000CWpw-12cT;
	Wed, 11 Mar 2026 20:58:42 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Qda-0000000CWpb-4BQY
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Mar 2026 20:58:41 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b8f9568e074so37738066b.0
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Mar 2026 13:58:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773262717; cv=none;
        d=google.com; s=arc-20240605;
        b=OV6fVoOm1mRRj9QbtR+IvVESEiV+PbJGh3DXt4zaUNBASb9o5z270Rb+lEIaWK2Aum
         FIGqug4ph721ClAkwUBDbkljvUKyQIDxtsxpgy3//7m+tUR5keWn/vbOUYh94zfquqG/
         CQAkHXw5KdIVLYJz7rcAS3RdQi09jAWnUNipBfXhIm3ESNzMM/0BvK+1FlmiCVltUniv
         N1y0uU5P1CrtPxF+OxrZUsATjuhzUmpuKNwYjZLjZpyGKEHiA/c83AOZTDmkLgUWsuY4
         abX89Tv34P5Q8MiIplhwU1kP6f7nep4exksb4MaSaspq8Xj3AcdrGg97C2irOcAvf8ZC
         GbvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZFSrsAzKQ3Nc+Aho7d7gG2Ra3wQyS/1tLF/F02PD+Zo=;
        fh=xb1Nvtcy2mNkm4jTMaxV6QVXXlpe45XGDyTIH19Ibts=;
        b=WZ6y6+OsSuM7PqeeMMVeD0BQEGAJ+lv0QyNcwNd2wnkOi0EdaA3f61lOE1Xl25FoXo
         tS6N9ILmGSV+hZdb7Xer6OL7OvLa/CSbSSCJ/FHvXIqdU3l6kYtmVQmbPPemdROfNzxD
         28LyO+gg6t9p0yTKtF3UpXe0Xu4r5/roCZIQC2Y7fBMWhXRiWyyeleOLDd/RFTbAt10u
         cvh/qPblVOxv8izX/6ZOSZwVoHvjx8GW0bsxLPZ3RBrtoOwAx/dudYL6WQUj4kM5l3rz
         lW8yyPXR9LdEt998OUHRrEaEDD6W7/clWMWxcwSQ/CC7tpy6q7yC21j8MtyIip0mnx5V
         qOfA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773262717; x=1773867517; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZFSrsAzKQ3Nc+Aho7d7gG2Ra3wQyS/1tLF/F02PD+Zo=;
        b=P9SKDqzoSkrti7i3yTkVxO1YcrxXhBHdDP+q54GPbuyp1cvB54sDaXXz+RD02Vh4n7
         YyvT4iyYEVpR+zo1kpOwOXRQ2AQYQwEifQSlCZJqUrLiYHCq2myn52/LyRV16BBle6LZ
         +gHTznjkrXW9ZFJpykgYv9pBofoL1e6dfHihJIeaXL8jXZCnJbuVcKUCUYesxWjJBW4u
         mniMS04oHz2E1hn80Yqg1AyjV7KYoPX8SiMQt1w8Dkm0WM/8eUfzjPEQyTB0EpuzrEJG
         0j8A9GRNDjuXD9NilUKXTt2w1TUX69BIH7pdwnRG9/lTr/ObJgd0ppf/DYV13n149aTz
         U09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773262717; x=1773867517;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFSrsAzKQ3Nc+Aho7d7gG2Ra3wQyS/1tLF/F02PD+Zo=;
        b=cDtV4r0OjGWNM7rBn0rNpBMlAG+xGtQjgEROPyxiuxEYn6ufdocN+1f1CMKJQY5XvC
         fCvDnJt2CGWFYrvkua/Q60RQFrnIESYXknBw5s0Y9VoIbBWtP0gDvzxY5cN+uuztZ7lq
         sHdU0e+CwLEQ48cdMOHuJ93XMzo78KRJaUej9rlfQKAgaV3Gi0nfImyp8IGt4XN5xB7o
         E5ooJTZE643Mf0QoJtHcHBzBw8IYE4HVJmgfQub9hbTRRDYGqpcqb1JRqAl6GyfQ9ER3
         ndME6J4L6kmmV/CmrpGAb2+/vMWPkqgIPRsu6SBP8803jlGKRQtq04/WaxDCKmi7x7Zr
         cn2A==
X-Forwarded-Encrypted: i=1; AJvYcCUbgph5Vz3L1tdigQUSuIsqqKasYzbT8Qii0VWF8L5A+s+zsCIQnGhgLzE+g18QYM/Er03jZJSjqPvQyENpYw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzyZOU6MeUl1mW/JUmzrwKYODg3jHA4fWrz2kh1MH4xtwjOiZTj
	gb6NVqcphEg0lPM9GysjYPJ47Dowlgvnh5fTgaPWRZwBKGnyZPEa03JDBpSLZMCgKh6FjMcKF0d
	UURn/Y6/0lcF/5YDkJ0jXYxwOYbJmPhw=
X-Gm-Gg: ATEYQzyXcs5mNH+I5/cQ8GYnTWkayrkdtSYpPmAKAKkAhqGfHE/VV7IweJjvwGQgi5Z
	lXiWEDKkkqPmrcqReSdwyLMDYABIXOH2ha3zpewBDICypsWhNwy7DZLlpIct6Di5hSCHQ/Ph0E3
	VhsHDTSZxreaZ7qe1Fi5JCKC1tmCKWsd4sW5knB6PexlbL6qSOlSB1k3IHleu0fPusXv0J1xnd8
	l2znNYO3JjHaPGiSn7rGHtrvkndOXuL7NK4JoROJAKOayf5fD6wZIDDhSySvzKa4lYNhCh8bNN5
	E8iaYQ==
X-Received: by 2002:a17:907:72cb:b0:b8f:a323:bda7 with SMTP id
 a640c23a62f3a-b972e52dc74mr220526566b.46.1773262716821; Wed, 11 Mar 2026
 13:58:36 -0700 (PDT)
MIME-Version: 1.0
References: <CANAPQzi3BkfnRS4CEXAA560O5cO8e6MEYxeVVx1u+xUeXS-gmA@mail.gmail.com>
 <CAGp9LzoidBL1iYYC371+Fw+drbArLRTneJKxCoFiitx=dweKCg@mail.gmail.com>
 <CANAPQzjiBf8Rqphn2SypYN2O6bddj6vB=63Mp=T5YVEt2oGvyw@mail.gmail.com>
 <CANAPQzgiE1rMP3F=5NJg3hp2uBXtq44+vTRBdkHwdfHyXJ8MQQ@mail.gmail.com> <CANAPQzgD312EPSbvaQTE6U+wn85L65+xZHms7DP509ApxWvSZA@mail.gmail.com>
In-Reply-To: <CANAPQzgD312EPSbvaQTE6U+wn85L65+xZHms7DP509ApxWvSZA@mail.gmail.com>
From: bryam vargas <bryamestebanvargas@gmail.com>
Date: Wed, 11 Mar 2026 15:58:25 -0500
X-Gm-Features: AaiRm51mj2z7E16-DLghbuJqU-OBnWUBTx9_-Sl-BUmLGVcviCRtpbSjAbPv6jM
Message-ID: <CANAPQzgXN2UOjuwV1fRofN2syxG933kSaB9S7DyFAykHHMRzew@mail.gmail.com>
Subject: Re: [PATCH 1/2] mt76: connac: fix txpower_cur not updated in mt76_connac_mcu_set_rate_txpower()
To: Sean Wang <sean.wang@kernel.org>
Cc: linux-wireless@vger.kernel.org, nbd@nbd.name, lorenzo@kernel.org, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_135839_064048_344297C1 
X-CRM114-Status: GOOD (  16.33  )
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

From 9fabc33e722f321b4048ada6d4667ddacbb1495a Mon Sep 17 00:00:00 2001
From: bryam <bryamestebanvargas@gmail.com>
Date: Mon, 9 Mar 2026 12:25:37 -0500
Subject: [PATCH v2 2/2] mt76: mt7921u: trigger USB reset only on wfsys timeout

Instead of unconditionally scheduling a USB device reset at the start
of the reset sequence, trigger it only when mt792xu_wfsys_reset()
returns -ETIMEDOUT, which indicates the chip is in a latched state
(SEFI - Single Event Functional Interrupt) where register writes over
USB become silent no-ops.

This avoids the race condition where usb_queue_reset_device() was
scheduled asynchronously while the driver continued normal reset
operations on the same device.

Tested-on: Minisforum NAB9 (MT7921U USB adapter) at 2400m altitude,
           Bogota, Colombia. Cosmic radiation causes periodic SEFI
           events; USB reset restores connectivity without intervention.

Signed-off-by: Bryam Vargas <bryamestebanvargas@gmail.com>
---
 .../net/wireless/mediatek/mt76/mt7921/usb.c   | 32 +++++++++----------
 .../net/wireless/mediatek/mt76/mt792x_usb.c   | 16 ++++------
 2 files changed, 23 insertions(+), 25 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
index 8c8c78f..44c7437 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
@@ -86,33 +86,33 @@ static int mt7921u_mcu_init(struct mt792x_dev *dev)

 static int mt7921u_mac_reset(struct mt792x_dev *dev)
 {
-    struct usb_interface *intf = to_usb_interface(dev->mt76.dev);
     int err;

     mt76_txq_schedule_all(&dev->mphy);
     mt76_worker_disable(&dev->mt76.tx_worker);
-
     set_bit(MT76_RESET, &dev->mphy.state);
     set_bit(MT76_MCU_RESET, &dev->mphy.state);
-
     wake_up(&dev->mt76.mcu.wait);
     skb_queue_purge(&dev->mt76.mcu.res_q);
-
     mt76u_stop_rx(&dev->mt76);
     mt76u_stop_tx(&dev->mt76);

-    /* When the chip enters a latched state (SEFI - Single Event
-     * Functional Interrupt, e.g. from cosmic radiation at altitude),
-     * all register writes over USB become silent no-ops.
-     * usb_queue_reset_device() electrically resets the chip via the
-     * USB hub regardless of internal state -- identical to probe().
-     * Async variant required to avoid deadlock in workqueue context.
-     */
-    dev_warn(dev->mt76.dev,
-         "mt7921u: scheduling USB reset for chip recovery\n");
-    usb_queue_reset_device(intf);
-
-    mt792xu_wfsys_reset(dev);
+    err = mt792xu_wfsys_reset(dev);
+    if (err == -ETIMEDOUT) {
+        /* Chip is in a latched state (SEFI - Single Event Functional
+         * Interrupt, e.g. from cosmic radiation at altitude).
+         * Register writes over USB become silent no-ops; schedule an
+         * electrical USB reset via the hub as last resort.
+         * usb_queue_reset_device() is async to avoid deadlock in
+         * workqueue context.
+         */
+        struct usb_interface *intf = to_usb_interface(dev->mt76.dev);
+
+        dev_warn(dev->mt76.dev,
+             "mt7921u: wfsys reset timed out, scheduling USB reset\n");
+        usb_queue_reset_device(intf);
+        goto out;
+    }

     clear_bit(MT76_MCU_RESET, &dev->mphy.state);
     err = mt76u_resume_rx(&dev->mt76);
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
index cfd385e..4737384 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
@@ -269,7 +269,6 @@ EXPORT_SYMBOL_GPL(mt792xu_wfsys_reset);

 int mt792xu_init_reset(struct mt792x_dev *dev)
 {
-    struct usb_interface *intf = to_usb_interface(dev->mt76.dev);

     set_bit(MT76_RESET, &dev->mphy.state);

@@ -279,15 +278,14 @@ int mt792xu_init_reset(struct mt792x_dev *dev)
     mt76u_stop_rx(&dev->mt76);
     mt76u_stop_tx(&dev->mt76);

-    /* Same rationale as mt7921u_mac_reset(): if the chip is in a
-     * latched state (SEFI), register writes over USB are no-ops.
-     * Schedule a USB port reset before software reset sequence.
-     */
-    dev_warn(dev->mt76.dev,
-         "mt7921u: scheduling USB device reset (init_reset path)\n");
-    usb_queue_reset_device(intf);
+    if (mt792xu_wfsys_reset(dev) == -ETIMEDOUT) {
+        struct usb_interface *intf = to_usb_interface(dev->mt76.dev);
+
+        dev_warn(dev->mt76.dev,
+             "mt792xu: wfsys reset timed out, scheduling USB reset\n");
+        usb_queue_reset_device(intf);
+    }

-    mt792xu_wfsys_reset(dev);

     clear_bit(MT76_RESET, &dev->mphy.state);

--
2.43.0

