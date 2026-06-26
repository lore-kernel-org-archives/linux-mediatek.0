Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F57CDE008
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2026 08:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WV5yYAQhu5LuQKYBaN1uWFLZmyuh5tReudUkrHR0RRI=; b=LQxmU0RiMQGyRg
	jhJTYrwOHw1sPz7Nt/HGzaf/YK/z1f/ANKm1TbvdPEwchLvXPU0OpbkTXRq1po0hyijJtj4Ea+QQW
	fkLyzOPkowk1uPsRfbQhf5b3G6EE3Tm+hoHIIccETH0UcFbwewTCQUQXLdEaBANW+oTl/b1+/Moz6
	wEze1qW4k9HgI0BLt7VsLrzNMBcrEqT7xkTweImMTXiWi7uy8lvV0xbs77uo/subxHIDpnA591Ais
	OoEkCXIKx9gtbQ46C+YWQSnHj5TFrubvnK3tVT3ZgWGCW7+NJJkvy7DccoiOkzejXEdxZ1OuOPly/
	edelQDYV8exXVGwE87Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1qI-0000000AqDF-1XsG;
	Fri, 26 Jun 2026 08:23:18 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1q2-0000000Aq4G-36Wt
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Jun 2026 08:23:05 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2c7ebfbf2d4so4017645ad.2
        for <linux-mediatek@lists.infradead.org>; Fri, 26 Jun 2026 01:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782462182; x=1783066982; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WV5yYAQhu5LuQKYBaN1uWFLZmyuh5tReudUkrHR0RRI=;
        b=JwWOq1IoCu9LpsBAP7h7ES4bll+M5la8H32XshJr8yfIT07Sv457Jofqmuq58q+AjB
         wEwVuizYmHndmiyDbntLAmc6g1/McqSWTeKP3Dmr/VXCkeTeTcdrXnOWz5xI20CNWBAL
         NFLS54Faelscr7c2hWSKN4JlRa4BSc2Xrvbis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782462182; x=1783066982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WV5yYAQhu5LuQKYBaN1uWFLZmyuh5tReudUkrHR0RRI=;
        b=rn8scG8mUYMw3A1gOLLDk6xWab8Zhro9vwnrlhKnbXa7gblxBb6BcjpoXfGjvfVCrf
         BbUMFzOC3lwRWxIh+vMZJaNI5p+yayuTgXkyubK8u4dKLrJ1N29c/WFSUFoRWKVSpUPN
         4wXqHJP+poivHjt+ENacZKJuOech1bwmE/IOUT84sSWxLX1t3O7qlMDHFk1pPfENjs8O
         W97YW+tNLhWbgZuaTiWHs7W0vC9O/a0Tp+RlgFMD6Z+4ii3SAoYB9G9t01G64BVcbDgX
         pykVwP8RR5GD+wT6FFcB2mbDI1etL9Qk+obWiF8xvTEzIpkKL8M/dXMAZ5yr9bYXBFvt
         s6GQ==
X-Forwarded-Encrypted: i=1; AHgh+RqOFpqMidDZHYczWYA2n3bZu5eqzwThRwQdu+pstp5RfMPT50wmh1Zm5wzvAIKxPZJ5IkpUVCZzSdYK+dTkaQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyvPbIOxd0An/5QZxRTiuDPN7XNuJb3ab+ActIoWIB6XHMG/Bpj
	TKujKFcvfmvO2HwhZYS1TLouOCrvAwp43KSHR05pypUqhhC0xfvatsUkmCBlNnii7Q==
X-Gm-Gg: AfdE7claPvdqnYPAKHhwYg/aQ4EB5vseZf4zxhfkAQ4BGsf3muj8hasX7y6CSE1ZQtV
	PtzMnAKiGcCm3fqdJxHxN36aRsP4/XZ7nFh8BwA7A3EwlLV2ZTUPTcyhBMRDVkcbj0jewUR+xVV
	XdiefaYc8DP1g/FTIZm+p9Z6wGGJ7ouHjvFA2nmwAB0As+ZrBJy/HIy9uZb0OdlosE1I3S/jrRR
	A/DotnxSgo4sReuaKTbcud/jTvTpf0QyPbQolBK1k1UBWeN4vksU3ZDmC36nA8LPXZlJXW/pcMQ
	Y8N5v3HFcu127Cj0dUp/k/kdYQzD6F1gfnUtlYRx6xnoKyyaGCe1NeRqcGTpS4lbRZrAHpJIIJZ
	CVR7pIpjtkHqonZWee/Hul2r2SFq77xAsApeOoJCIcsWR8PNLSZmwyk3LhUxnBmzpvOmT4+YUQ1
	AVSeFgJi/W5pCvlJo8D+vYCeoq9YoSkEs6+TY7DWAUxuCzxiFwNXycFdjkkXzZxpSN/S9G2cJl6
	uf1+koMtw==
X-Received: by 2002:a17:903:1ce:b0:2c2:75c4:4b0f with SMTP id d9443c01a7336-2c7fc70a32dmr65200675ad.2.1782462181768;
        Fri, 26 Jun 2026 01:23:01 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2a00:79e0:201d:8:2593:3e55:e36c:f47d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f64dcc30sm34619185ad.66.2026.06.26.01.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 01:23:01 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH 1/2] usb: mtu3: allow system suspend during active gadget connection
Date: Fri, 26 Jun 2026 16:21:51 +0800
Message-ID: <20260626082218.2750459-2-fshao@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260626082218.2750459-1-fshao@chromium.org>
References: <20260626082218.2750459-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_012304_422211_A52E096D 
X-CRM114-Status: GOOD (  11.63  )
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

When operating in gadget mode connected to a USB host, system suspend
fails with -EBUSY because active peripheral connections block suspend
entry.

Fix this by restricting the -EBUSY check to runtime autosuspend
(PMSG_IS_AUTO). For system suspend (!PMSG_IS_AUTO), perform soft
disconnect to disconnect from the bus and allow MAC sleep.

Fixes: 427c66422e14 ("usb: mtu3: support suspend/resume for device mode")
Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/usb/mtu3/mtu3_core.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index 66dbfe1705d5..a40bf5bad2d5 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -1037,9 +1037,14 @@ int ssusb_gadget_suspend(struct ssusb_mtk *ssusb, pm_message_t msg)
 	if (!mtu->gadget_driver)
 		return 0;
 
-	if (mtu->connected)
+	/* Prevent runtime suspend when active connection exists */
+	if (mtu->connected && PMSG_IS_AUTO(msg))
 		return -EBUSY;
 
+	/* Perform soft disconnect for system suspend */
+	if (mtu->softconnect && !PMSG_IS_AUTO(msg))
+		mtu3_dev_on_off(mtu, 0);
+
 	mtu3_dev_suspend(mtu);
 	synchronize_irq(mtu->irq);
 
@@ -1055,5 +1060,9 @@ int ssusb_gadget_resume(struct ssusb_mtk *ssusb, pm_message_t msg)
 
 	mtu3_dev_resume(mtu);
 
+	/* Restore soft connect for system resume */
+	if (mtu->softconnect && !PMSG_IS_AUTO(msg))
+		mtu3_dev_on_off(mtu, 1);
+
 	return 0;
 }
-- 
2.55.0.rc0.799.gd6f94ed593-goog


