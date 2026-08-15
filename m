Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931B9C5CFC1
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Aug 2026 11:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/9+rmVvmvs6s8dnr8ttRWG5a1oyP8FaGHhemcTL1GA=; b=ik/mI+yt1DSRDyTLvM0m+Rpxat
	lxisNJ3XM0oCf7vf7yXup47hYoOj+tn3AF6Rnx/46wHhkLmOZT48n7QdUABVfTKwxb6PI7Hgp0HjV
	5vu26mqbNc7hWuz5ts8/HEvfEqZzCgnuCcfVuqR8tiTNetXqF/is9g4583iGXG5nptRFS0RjfxxE7
	jnbFXS4loWgMpqG8ec/thZko5v+o/dfrRXXwFqG4N0pLmqypZl74795TOkHx944xLQhkGj0SBchaT
	OKJBZWpRZNUpWrHGhav5N/nS5iQsDnZQEkVoOBPb4/6VfXGyOeC7z2z0rsnxwf1L3YSXetsHd5t85
	cmsiv30g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvD0L-00000003nX4-0iB0;
	Sat, 15 Aug 2026 11:56:49 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvD0J-00000003nVj-0Yvj
	for linux-mediatek@lists.infradead.org;
	Sat, 15 Aug 2026 11:56:48 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so1594525f8f.1
        for <linux-mediatek@lists.infradead.org>; Sat, 15 Aug 2026 04:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786795005; x=1787399805; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9/9+rmVvmvs6s8dnr8ttRWG5a1oyP8FaGHhemcTL1GA=;
        b=IxUbyr7mEzniT677Xvs8TzCMlPvhyNE8ses+t9ja76mvSrmPm3mRH9c+VuQZ0wl95Y
         Rliu3W0Ff5Rt711Q9lo2yYgYelRnxKocprAO8mHuB/AOSVOruW+gp5B7GxxM2w5/hHj7
         N65XKGQbVTQ5qiYia4skFLapTK9Pafu2Aq9tO/+9uR1CRfxbV4HX698OO/hzqUkx99rq
         GkEh1N1yXlW08NTsdVhT9S6AIWBbZx5wLa3K9ZNW68c048S4R81g5doVg5bTeQlVm53C
         tbjbn7TWJAW31fwFav1s3LDPracuu0Smirjill5AThK83UtHBXP9Ntoc5cJ/8hTgI/jS
         R2sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786795005; x=1787399805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9/9+rmVvmvs6s8dnr8ttRWG5a1oyP8FaGHhemcTL1GA=;
        b=glfh/OI9KQd+SoxE4eioV/E+U+APh8Idc78Pg4nvJQEV+/cvzX+PD5fLrQyRKYaM5J
         oFhiltV8x6+9ZaUAvQaFYN1EKsP8v6pGs9iQAYmYqIFx3VmJe5pZ8JKfgdwFYCSxGvMT
         GOFZfl0ozDsp/H/xwwQ8A4VqqSGOWfq9aPuAzWDfBaP2VPYzpmCV7ciKOEthiVT41Q2o
         4Zpb0Mk7Ij5i4X+t2ELw4uC1qQKAaO0+nSOimJVXOfUO2+285apT45LoD+bxjdo9MDWH
         8jwhv6d0fDZB6hKzxfrJzhgLGlJ4gGqGSicHb0sESFz9KR3q+G3yEQjonDPOm99wZ2nf
         LpvA==
X-Forwarded-Encrypted: i=1; AHgh+RqGM/0l8pIOn34/1m7Tqfc1CjI6hFsaHTwgphyTgvMItdUV3gNXc6c5kelAp3GlCX9+2GD05P7R9hIBGi3BfA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQaTxfRCqaB4KFFqCT/W63+gzkKiMAPbj1RWEXZl1MnEBTTfD8
	/eWd90JqI487J3tnfCKX00KGBDyn8ct4SCMW/hUDy+WI2JyxUPC/ho0ti3KsEnKp
X-Gm-Gg: AR+sD10ZTwOY32rT+AQDwyeaX33eoO7EjA9zYLyPPRbJdUQrb9A1LiPzN4lzYpHfdPs
	FhyvYKBDlQeDI4MAUR42UnVPBpNieJiSXIQFby3mV+v+dprj+Zc1n7ZbaK/K5SQFKgim/2zhlzT
	YxYw8tz/DdsmwmpsVLnFI90LgrKqQ9gCaEI4RIY7K4T3U/LdWKvddgSIU1W1pAqgjrZTwFMOGCl
	sZxTsEpfGhwG8z8l64UJj+BfVkAP8ieM1HWp1eee6tv4JeWUcwPucbi1Wj1ilGEihML0MWRv5sV
	H4MIg63EUlmkx4h69XKr9CVVc6jrH9IvFyWcbVM0f90XG3nj/0FUI+GYuHCmWlv2UhbgE6pY3/R
	cKjhcc5uXSVtJhJTFEBAOWCfPQjOSURiIpSdP24cmRvMVzI36PmZ+7VHcq0PtxRmRIDRh6PryAw
	sY+5vwDZyealNvZUBFYANeCbzs24XtoBeZ1ye0sRLk/9gwqhcq7aHzMz/dJvNrP+UIeYJ82wGYV
	3NLzowGEkwj
X-Received: by 2002:a05:6000:25f5:b0:482:984d:fdd2 with SMTP id ffacd0b85a97d-482984dff83mr6257452f8f.20.1786795005196;
        Sat, 15 Aug 2026 04:56:45 -0700 (PDT)
Received: from archlinux.tailbe3ea7.ts.net ([185.19.153.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f2c129dsm16085455f8f.26.2026.08.15.04.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 04:56:44 -0700 (PDT)
From: Ismail Tarim <ismailtarim7@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-bluetooth@vger.kernel.org
Cc: Jing Cai <jing.cai@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Chris Lu <chris.lu@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ismail Tarim <ismailtarim7@gmail.com>
Subject: [PATCH v2 2/2] Bluetooth: btmtk: Do not discard the subsystem reset timeout
Date: Sat, 15 Aug 2026 14:56:24 +0300
Message-ID: <20260815115624.8309-3-ismailtarim7@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260815115624.8309-1-ismailtarim7@gmail.com>
References: <20260815115624.8309-1-ismailtarim7@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_045647_184844_92835489 
X-CRM114-Status: GOOD (  13.14  )
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

When the MTK_BT_RST_DONE poll times out, btmtk_usb_subsys_reset() logs
"Reset timeout" and keeps the error in err, but err is then overwritten
by the return value of the following btmtk_usb_id_get() call, so the
timeout is never reported to the caller.

Commit 25b6d7593a3a ("Bluetooth: btmtk: introduce btmtk reset work")
discarded the return value of the chip id read, so the function returned
the timeout error as intended. Commit 3dcb122b3064 ("Bluetooth: btusb:
mediatek: return error for failed reg access") started assigning err at
that call and silently dropped it.

Keep the timeout in a separate variable and return it, restoring the
original behaviour without changing the control flow.

Fixes: 3dcb122b3064 ("Bluetooth: btusb: mediatek: return error for failed reg access")
Signed-off-by: Ismail Tarim <ismailtarim7@gmail.com>
---
 drivers/bluetooth/btmtk.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index dc702c0a6034..c0ed51567ed4 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -860,6 +860,7 @@ static u32 btmtk_usb_reset_done(struct hci_dev *hdev)
 
 int btmtk_usb_subsys_reset(struct hci_dev *hdev, u32 dev_id)
 {
+	int reset_err = 0;
 	u32 val;
 	int err;
 
@@ -958,8 +959,10 @@ int btmtk_usb_subsys_reset(struct hci_dev *hdev, u32 dev_id)
 
 	err = readx_poll_timeout(btmtk_usb_reset_done, hdev, val,
 				 val & MTK_BT_RST_DONE, 20000, 1000000);
-	if (err < 0)
+	if (err < 0) {
 		bt_dev_err(hdev, "Reset timeout");
+		reset_err = err;
+	}
 
 	if (dev_id == 0x7922) {
 		err = btmtk_usb_uhw_reg_write(hdev, MTK_UDMA_INT_STA_BT, 0x000000FF);
@@ -973,7 +976,7 @@ int btmtk_usb_subsys_reset(struct hci_dev *hdev, u32 dev_id)
 		return err ? err : -ENODEV;
 	}
 
-	return err;
+	return reset_err;
 }
 EXPORT_SYMBOL_GPL(btmtk_usb_subsys_reset);
 
-- 
2.55.0


