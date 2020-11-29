Return-Path: <SRS0=HK5I=FD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEAC6C3E8C5
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Nov 2020 16:07:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DBD9206CA
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Nov 2020 16:07:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C6bP6OYE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AYNXH+yx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DBD9206CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ugDeeAAZ7z4uj1yg3hfGLPXASHib8F8Tpn6D1DjSRU0=; b=C6bP6OYEH/RciQGs2NDVQi/6B
	OhXkrSg5DK3+rYXMAiDMA7TgdNRlL/0oVOFZg+1zOuE4+I5xsXu5DLGwy79dUg7RzxxqQWwh6EAG+
	NJLmAlQwbCR96ARmGkDYcHjHCr8SIQoQalQkO2zm7VH+dnI7g8keMqpckfhGz6dK16dsZZR4dNoTG
	iTHjIylKODZ1DTHf+8OAjNV/7khyAc0f6lvxLRwlwW/LJqHZ1S/MUey+WlxXofZl6wsUQm/zkq2gk
	ZFjYRSnDWvAylr6a6Tbz5+gL4nDW/HPm/o2A1teBpIn8MZ0LCMzLHZhZVzOoxXafYPS+Ev7mNkwDo
	JFmh1Lp5Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjPE6-0008P2-8X; Sun, 29 Nov 2020 16:07:02 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjPE1-0008Nq-TU; Sun, 29 Nov 2020 16:06:58 +0000
Received: by mail-pg1-x542.google.com with SMTP id l4so2337135pgu.5;
 Sun, 29 Nov 2020 08:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GVVJZ09FG8uzoipcul14lMHmm6BPKaCyHUkCOOvuhVM=;
 b=AYNXH+yxJXdR0fZVJ5eMh/+FIR+RVMk7IOa1brdXFH44gSn/oWL9s11U0bFQQq1pc1
 MEl3VYyUH6xaRZ5IbE/aBa6TjKfWlGPAS62JgAPzQXhpJTR0wg7/JdaEuHu0xz1Vb+yD
 tJsUtshzIMdB3olWaJt+sLiu54BRkthmkRK5/H/Gw3aTIbGe5skJZFkcEK62sM0vqqwj
 /Ko1Y6uHzgKaD+buhMldlvHbkS4IJDFkadQW2zhTW5ong2rrcTSkBfJBtYyQm9HFlpEK
 QpF2ffCPsHP7+Gd3/y6SH6tT+tMrFyJdZZdboI83JkXnf8ByNSZqdxPpOia4jX9H6w8q
 qSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GVVJZ09FG8uzoipcul14lMHmm6BPKaCyHUkCOOvuhVM=;
 b=TRYTvbDXt1n2KWtOLZ9PfZRnUOx/ErdAgZO3hns7Kmuiug5mpahszBWAajfbsiZlrz
 sVU9F+q6DInh+jsvJctvgfOGxlKu/7HZJQiSvEzPwgzBmfbifZe5JJRaJIvVvRs0oynE
 fZ6t7SoglyQUaJr0dVP+AiNYwjJl2ZRuf/eW0mYzWocyWrch72yMb/d0ntUDnkdyr4Vh
 3ZkbjcO+H4wYbgqx3/Hgr0h/PJPvRu0ldE4UzDaS8da4cVX+rNdUD6xV6kWsNV8d76xn
 I3o7kV/wcyazLp4GwbZL9aG15+FzvZqOPyBrbQzAIA9+X0lBIk4iyZnkD5MZcxQ7vUrD
 kHBg==
X-Gm-Message-State: AOAM530Fm2niJSsiYv3SScYr/AH/WLUNthuc3xcbFH5aJsJpcx1J/dFT
 hb1G40GcFoS1dCnQpq5xJeY=
X-Google-Smtp-Source: ABdhPJxCLd1E3bV5hbMUDqjxGInVieLRMWltaWa7A8cjShKC8R+EiteOoJNv5F1kM2GbnvRx6LO+ZQ==
X-Received: by 2002:a17:90a:8b8b:: with SMTP id
 z11mr17824406pjn.117.1606666015554; 
 Sun, 29 Nov 2020 08:06:55 -0800 (PST)
Received: from localhost.localdomain ([49.207.196.188])
 by smtp.gmail.com with ESMTPSA id u3sm13496837pfu.47.2020.11.29.08.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Nov 2020 08:06:54 -0800 (PST)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Anant Thazhemadam <anant.thazhemadam@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Bin Liu <b-liu@ti.com>,
 Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 04/15] usb: misc: ehset: update to use the
 usb_control_msg_{send|recv}() API
Date: Sun, 29 Nov 2020 21:36:01 +0530
Message-Id: <20201129160612.1908074-5-anant.thazhemadam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201129160612.1908074-1-anant.thazhemadam@gmail.com>
References: <20201129160612.1908074-1-anant.thazhemadam@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201129_110658_014804_6AB56F49 
X-CRM114-Status: GOOD (  14.10  )
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
 drivers/usb/misc/ehset.c | 70 ++++++++++++++++++----------------------
 1 file changed, 31 insertions(+), 39 deletions(-)

diff --git a/drivers/usb/misc/ehset.c b/drivers/usb/misc/ehset.c
index 2752e1f4f4d0..068f4fae2965 100644
--- a/drivers/usb/misc/ehset.c
+++ b/drivers/usb/misc/ehset.c
@@ -30,48 +30,42 @@ static int ehset_probe(struct usb_interface *intf,
 
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
@@ -80,11 +74,10 @@ static int ehset_probe(struct usb_interface *intf,
 		if (!buf)
 			return -ENOMEM;
 
-		ret = usb_control_msg(dev, usb_rcvctrlpipe(dev, 0),
-					USB_REQ_GET_DESCRIPTOR, USB_DIR_IN,
-					USB_DT_DEVICE << 8, 0,
-					buf, USB_DT_DEVICE_SIZE,
-					USB_CTRL_GET_TIMEOUT);
+		ret = usb_control_msg_recv(dev, 0, USB_REQ_GET_DESCRIPTOR,
+					   USB_DIR_IN, USB_DT_DEVICE << 8, 0,
+					   buf, USB_DT_DEVICE_SIZE,
+					   USB_CTRL_GET_TIMEOUT, GFP_KERNEL);
 		kfree(buf);
 		break;
 	case TEST_SINGLE_STEP_SET_FEATURE:
@@ -100,11 +93,10 @@ static int ehset_probe(struct usb_interface *intf,
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
@@ -112,7 +104,7 @@ static int ehset_probe(struct usb_interface *intf,
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
