Return-Path: <SRS0=DVVK=FE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 136ABC64E8A
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 01:28:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AFCD20757
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 01:28:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KIw0YL9y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hI0q5Tyf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AFCD20757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5r6YyDnZfmcO8WiBNAYsbIqiI66iKWrlZEouRAo6QD0=; b=KIw0YL9ymlRvDV5MWy7FB0K5z
	nd4EMLDRPGBJtbo/Z+nXWe96CeSSF51PnAGzxW+SSjzjEC4YQJsK/Jp37zfY1yBh+75C42vtPZccN
	N/ghVkENls41HNzJhNv5+xFwt96owGMlbqCAejWyDZH/+G9bndduw714mbN2Qf2M4nAHiHCTecCeZ
	yLtS0pOIB1VfMAQB9Kz3dfTzLx+4fsTxXqv8T1c5BPhHsVGNap0uQIw+rrdOiJnke9ZmpJ/xGIDqB
	aTSSzXTnklNFu4j60gZGlb9G94bY0oi9QMC3efuyGOltui6mwcnc6Jrp/MiDe/LxMBqnzKuA5+POo
	GTjG4RQ1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjXzV-0001RQ-7P; Mon, 30 Nov 2020 01:28:33 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjXzR-0001QP-4h; Mon, 30 Nov 2020 01:28:30 +0000
Received: by mail-pj1-x1044.google.com with SMTP id e20so318952pjt.1;
 Sun, 29 Nov 2020 17:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=adCoA0FX32LVJH0CmgSfN0z9RiJT+SmZNYMtTn4BLVs=;
 b=hI0q5TyfQpDDb7ywq5cTMebgEanaCmzQpCHbbntM40pxvr0ZObjqBZ7x8cIOi8EsSD
 JsLvW0zLjlxBFdiOZ4VAakfTJ+dcsHczZLxXv2pUGjifVnIoyA4Dyj7eUGOMTzl+atY9
 ndj3tfwh4EyZ3mlySE5nnPYHcw72PAnLmxM1kSooypYLa/2myh0DhlstBwzHdDVV1ha/
 /PpH7StVUAEcWLDG8ppV/jmedk9SbjjxPzR04RrGnnPCH6E39vyJ6R7e7JAi53DcxWRe
 jUXRk3/GqhzHlD2jCF+R3EkBFDTEKt3bzZ8bc1ov/LYSJbuL9MLPxHrXM1kvrupbVxAR
 djsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=adCoA0FX32LVJH0CmgSfN0z9RiJT+SmZNYMtTn4BLVs=;
 b=oN7FxnoPdcjTx9Ycvp2SwLNSKLwPqXcCVvqJHjis60BOTO7/H5v2WOQSzyfQtXdQxo
 cG6ZQi1fR5XMAH3bXLzFA4vZRRO++YiI2MuD44wt/rda4xGCxXlu8s1rfn3j1LQgs7Bi
 ho0H554LwewKgykjYO2srXcm2K7A81rqWtS9LH41TBma+qJT5Vmsq9lbtd3O5Gtxnu2W
 kG3cKdR0kurXh1AO3ZEeIOXoSk4t7sjUlv4ir6dLf9fPeo24Z1IjyxkqvjqSDyMOHHNn
 gm2I+yI5VDrPZCKVqsHp8zroDoD+msNe9FvIJ+lhCTAHgw5BHX8n/vLVRmmxOhkJWbKa
 YMPQ==
X-Gm-Message-State: AOAM532+MshRRXx506AaiESY7oQf+eBUyplwVuECaFalAGYOIGVjkfML
 d/xxhZJbCryETED+ccf8LD4=
X-Google-Smtp-Source: ABdhPJyIvXXYzDDaT6Me1FDNqZuoQ2wuvK5w8bjSKQkkrHFXKoFsbgzgMqj48mBN1vHci9xnuwEaGA==
X-Received: by 2002:a17:902:7d8e:b029:da:274:c75b with SMTP id
 a14-20020a1709027d8eb02900da0274c75bmr16149204plm.61.1606699706939; 
 Sun, 29 Nov 2020 17:28:26 -0800 (PST)
Received: from localhost.localdomain ([49.207.197.72])
 by smtp.gmail.com with ESMTPSA id m9sm20825079pjf.20.2020.11.29.17.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Nov 2020 17:28:26 -0800 (PST)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Bin Liu <b-liu@ti.com>,
 Anant Thazhemadam <anant.thazhemadam@gmail.com>,
 Minas Harutyunyan <hminas@synopsys.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH v2 04/15] usb: misc: ehset: update to use the
 usb_control_msg_{send|recv}() API
Date: Mon, 30 Nov 2020 06:58:16 +0530
Message-Id: <20201130012816.2579140-1-anant.thazhemadam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201130011819.2576481-1-anant.thazhemadam@gmail.com>
References: <20201130011819.2576481-1-anant.thazhemadam@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201129_202829_190250_EF93B60F 
X-CRM114-Status: GOOD (  16.06  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


The newer usb_control_msg_{send|recv}() API are an improvement on the
existing usb_control_msg() as it ensures that a short read/write is treated
as an error, data can be used off the stack, and raw usb pipes need not be
created in the calling functions.
For this reason, instances of usb_control_msg() have been replaced with
usb_control_msg_{recv|send}() appropriately.

Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
---
 drivers/usb/misc/ehset.c | 76 +++++++++++++++++-----------------------
 1 file changed, 32 insertions(+), 44 deletions(-)

diff --git a/drivers/usb/misc/ehset.c b/drivers/usb/misc/ehset.c
index 2752e1f4f4d0..f87890f9cd26 100644
--- a/drivers/usb/misc/ehset.c
+++ b/drivers/usb/misc/ehset.c
@@ -24,68 +24,57 @@ static int ehset_probe(struct usb_interface *intf,
 	int ret = -EINVAL;
 	struct usb_device *dev = interface_to_usbdev(intf);
 	struct usb_device *hub_udev = dev->parent;
-	struct usb_device_descriptor *buf;
+	struct usb_device_descriptor buf;
 	u8 portnum = dev->portnum;
 	u16 test_pid = le16_to_cpu(dev->descriptor.idProduct);
 
 	switch (test_pid) {
 	case TEST_SE0_NAK_PID:
-		ret = usb_control_msg(hub_udev, usb_sndctrlpipe(hub_udev, 0),
-					USB_REQ_SET_FEATURE, USB_RT_PORT,
-					USB_PORT_FEAT_TEST,
-					(USB_TEST_SE0_NAK << 8) | portnum,
-					NULL, 0, 1000);
+		ret = usb_control_msg_send(hub_udev, 0, USB_REQ_SET_FEATURE,
+					   USB_RT_PORT, USB_PORT_FEAT_TEST,
+					   (USB_TEST_SE0_NAK << 8) | portnum,
+					   NULL, 0, 1000, GFP_KERNEL);
 		break;
 	case TEST_J_PID:
-		ret = usb_control_msg(hub_udev, usb_sndctrlpipe(hub_udev, 0),
-					USB_REQ_SET_FEATURE, USB_RT_PORT,
-					USB_PORT_FEAT_TEST,
-					(USB_TEST_J << 8) | portnum,
-					NULL, 0, 1000);
+		ret = usb_control_msg_send(hub_udev, 0, USB_REQ_SET_FEATURE,
+					   USB_RT_PORT, USB_PORT_FEAT_TEST,
+					   (USB_TEST_J << 8) | portnum, NULL, 0,
+					   1000, GFP_KERNEL);
 		break;
 	case TEST_K_PID:
-		ret = usb_control_msg(hub_udev, usb_sndctrlpipe(hub_udev, 0),
-					USB_REQ_SET_FEATURE, USB_RT_PORT,
-					USB_PORT_FEAT_TEST,
-					(USB_TEST_K << 8) | portnum,
-					NULL, 0, 1000);
+		ret = usb_control_msg_send(hub_udev, 0, USB_REQ_SET_FEATURE,
+					   USB_RT_PORT, USB_PORT_FEAT_TEST,
+					   (USB_TEST_K << 8) | portnum, NULL, 0,
+					   1000, GFP_KERNEL);
 		break;
 	case TEST_PACKET_PID:
-		ret = usb_control_msg(hub_udev, usb_sndctrlpipe(hub_udev, 0),
-					USB_REQ_SET_FEATURE, USB_RT_PORT,
-					USB_PORT_FEAT_TEST,
-					(USB_TEST_PACKET << 8) | portnum,
-					NULL, 0, 1000);
+		ret = usb_control_msg_send(hub_udev, 0, USB_REQ_SET_FEATURE,
+					   USB_RT_PORT, USB_PORT_FEAT_TEST,
+					   (USB_TEST_PACKET << 8) | portnum,
+					   NULL, 0, 1000, GFP_KERNEL);
 		break;
 	case TEST_HS_HOST_PORT_SUSPEND_RESUME:
 		/* Test: wait for 15secs -> suspend -> 15secs delay -> resume */
 		msleep(15 * 1000);
-		ret = usb_control_msg(hub_udev, usb_sndctrlpipe(hub_udev, 0),
-					USB_REQ_SET_FEATURE, USB_RT_PORT,
-					USB_PORT_FEAT_SUSPEND, portnum,
-					NULL, 0, 1000);
+		ret = usb_control_msg_send(hub_udev, 0, USB_REQ_SET_FEATURE,
+					   USB_RT_PORT, USB_PORT_FEAT_SUSPEND,
+					   portnum, NULL, 0, 1000, GFP_KERNEL);
 		if (ret < 0)
 			break;
 
 		msleep(15 * 1000);
-		ret = usb_control_msg(hub_udev, usb_sndctrlpipe(hub_udev, 0),
-					USB_REQ_CLEAR_FEATURE, USB_RT_PORT,
-					USB_PORT_FEAT_SUSPEND, portnum,
-					NULL, 0, 1000);
+		ret = usb_control_msg_send(hub_udev, 0, USB_REQ_CLEAR_FEATURE,
+					   USB_RT_PORT, USB_PORT_FEAT_SUSPEND,
+					   portnum, NULL, 0, 1000, GFP_KERNEL);
 		break;
 	case TEST_SINGLE_STEP_GET_DEV_DESC:
 		/* Test: wait for 15secs -> GetDescriptor request */
 		msleep(15 * 1000);
-		buf = kmalloc(USB_DT_DEVICE_SIZE, GFP_KERNEL);
-		if (!buf)
-			return -ENOMEM;
 
-		ret = usb_control_msg(dev, usb_rcvctrlpipe(dev, 0),
-					USB_REQ_GET_DESCRIPTOR, USB_DIR_IN,
-					USB_DT_DEVICE << 8, 0,
-					buf, USB_DT_DEVICE_SIZE,
-					USB_CTRL_GET_TIMEOUT);
-		kfree(buf);
+		ret = usb_control_msg_recv(dev, 0, USB_REQ_GET_DESCRIPTOR,
+					   USB_DIR_IN, USB_DT_DEVICE << 8, 0,
+					   &buf, USB_DT_DEVICE_SIZE,
+					   USB_CTRL_GET_TIMEOUT, GFP_KERNEL);
 		break;
 	case TEST_SINGLE_STEP_SET_FEATURE:
 		/*
@@ -100,11 +89,10 @@ static int ehset_probe(struct usb_interface *intf,
 			break;
 		}
 
-		ret = usb_control_msg(hub_udev, usb_sndctrlpipe(hub_udev, 0),
-					USB_REQ_SET_FEATURE, USB_RT_PORT,
-					USB_PORT_FEAT_TEST,
-					(6 << 8) | portnum,
-					NULL, 0, 60 * 1000);
+		ret = usb_control_msg_send(hub_udev, 0, USB_REQ_SET_FEATURE,
+					   USB_RT_PORT, USB_PORT_FEAT_TEST,
+					   (6 << 8) | portnum, NULL, 0,
+					   60 * 1000, GFP_KERNEL);
 
 		break;
 	default:
@@ -112,7 +100,7 @@ static int ehset_probe(struct usb_interface *intf,
 			__func__, test_pid);
 	}
 
-	return (ret < 0) ? ret : 0;
+	return ret;
 }
 
 static void ehset_disconnect(struct usb_interface *intf)
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
