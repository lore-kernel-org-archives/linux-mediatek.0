Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB197C5DF6D
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Aug 2026 11:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2EvcCjXX/E/EH5B0VOq94NnG4HOn80gOVENNBtRlSfE=; b=WK7Q40C+0Q8np270YiHCeSfPZn
	STHyixdVK18NP7EKposLDIK4U8eVrZ2p/LJ2pXpFH+if7EVorbUPLtV2WPkvZaLmvrHIqc6VP3Hse
	59YsgynuPHmEBql5wqOMJ2mhu0eK8E+yTv/Bloq1LrKNWGXraT+eurdjTHcijrtooz3v6UFoLIdiA
	diQqt75XzaQH1TimOnxQJsNXtA4zGJ68TXgtNBWz6Z7kpjOU/m5yuyJwdd0vX5hT0FmaFaaaJAVnZ
	m5uxrQ8+lUu2jGJQcW81ChgmgRRIIlyT7jTu446tSGuFYsNT1DAS0aP/XvxQPkujFs6nbG3bAbk+O
	4qGecgtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvD0H-00000003nVI-0Wbe;
	Sat, 15 Aug 2026 11:56:45 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvD0E-00000003nUB-428x
	for linux-mediatek@lists.infradead.org;
	Sat, 15 Aug 2026 11:56:44 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so17950115e9.1
        for <linux-mediatek@lists.infradead.org>; Sat, 15 Aug 2026 04:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786795001; x=1787399801; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2EvcCjXX/E/EH5B0VOq94NnG4HOn80gOVENNBtRlSfE=;
        b=clYbFr1Qcx3NCRnjsolMI27iIqGQ3cTZ9tZd2Y71D1vNU0LEokuHSq1lTsz0uxlvpY
         +kVKXgTIPBhlKAypDdiNQ6mNSyrbbD8R0RUqfyWNglg0/BqVoOQJ5uhPjEIcquTxKB1R
         e89y3RHv7JcyHnSZpkwTXORFleD4XZQT8SI9vA2ynBpUgmcK5CGTcczO/9EwnVL0qvHn
         Rv5BWfkp36a/TaHTOWS7li8IqtLvTmyEtMnG7E6R70TMfkddfpKmPhF34mlpjnxB0d2l
         QPuY37B6Mo5stRL0FsW20pUL0wICVhpwZnrsCJyZVlQEtWea1TjGPHDVcYUiTSQe6CHe
         AxgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786795001; x=1787399801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2EvcCjXX/E/EH5B0VOq94NnG4HOn80gOVENNBtRlSfE=;
        b=DH4jRjGbGiKLXp+TFxH0ozwJrTuqImx+imuMmZ0Q0ZSZtsqrkNBkcYB2muZE4QnUWT
         tArfRH4BiYfmkxjdKUGxfzm13V7T8mGFMdZMvt0a5WOwLK4JXMHABK0/3+HZMseHqd2P
         R4w0RL4JbuBipiakgLWB10VrfjZL23feaCPenBNlk7aKD1Kpa/zGClE/IOLXwq9Bt3Ge
         X00IbOCKfZUDHUEl609NWDQyWTtf6uFZtfCqA8Fd/gLcVFLXvJy8E2BTNLLTYFqfI1fG
         F4zS7mQchvg71OKgTHJidJPaBbZQdBAjR95RxVO7SqiplGM1AfkF3Zjyh780YKnIuRj2
         SnyA==
X-Forwarded-Encrypted: i=1; AHgh+RpbZqGj8dnGixYUT7FexfUK3Bp3+ZqvnYb/b3VheDlW2bK5EYe5UJLenigNHDr+2/JdOwMCXhf7iXXoF/QlmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc6F8o8FkaidwVvk1nobrVBlwDfSbPkuAFyTyvBxN1Gdm4Yw5a
	mDmNDDS0n4nnYDk+k86oYKGZb5Q0spufRDLlEpXcW5ZDXIeNBR9JOvyG
X-Gm-Gg: AR+sD11fDZea9ShgsQnsp4u23uav45S66P5VNtiJx0YQh6ss+tq8Wl06tHw55DAhtK6
	HeABBYoefdWrx9NiXBfPKiC+rt3BGdUi61hS3FKBFg7pjGuQ9Y6cnRXJJVYT+1tm92he1ojhY2D
	3TnTXAWrYO3dDpFSJ/00dcTgUP9XS4L4iJuPsGMkIGw7rLVh98rXuhTtAqbcmFWtoG8xYu9zmg0
	+KBfdhoUPHmey3qPBKUOxrZwUi0BCzEruyPuitxzZZYuKOkipoRf4/OoGJ4b3WB/g2aOF6zTecy
	y7uL1c9dN+FQpQRqm1CQ9U/WDQQVTsRHirJbx4CANRTl5BMznFNmpP2CPBx1Bo2CpXF2xSHG0bg
	/h88LwsicFhQ1y39HnS2iLSbECS3AH6KBLF1uDlQflWKeRGkCo11M/unjMaFnJvdcPIVmuwePnK
	wiD4Ivj156lwWlSiKDJ78gL2OozTa9ArGfnJRmsAwjJlzc7CRro8mdimykgi0wgl/fS8yeXBRd4
	SMIxv/dfWjzVNlDZQ==
X-Received: by 2002:a05:600c:4309:b0:499:8afd:4a9f with SMTP id 5b1f17b1804b1-4998afd4d6cmr78007035e9.0.1786795000955;
        Sat, 15 Aug 2026 04:56:40 -0700 (PDT)
Received: from archlinux.tailbe3ea7.ts.net ([185.19.153.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f2c129dsm16085455f8f.26.2026.08.15.04.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 04:56:40 -0700 (PDT)
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
Subject: [PATCH v2 1/2] Bluetooth: btmtk: Do not report success when subsys reset fails
Date: Sat, 15 Aug 2026 14:56:23 +0300
Message-ID: <20260815115624.8309-2-ismailtarim7@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260815115624.8309-1-ismailtarim7@gmail.com>
References: <20260815115624.8309-1-ismailtarim7@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_045643_015597_9F84D548 
X-CRM114-Status: GOOD (  13.49  )
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

btmtk_usb_subsys_reset() validates the subsystem reset by reading the
chip id back. When that read succeeds at the bus level but yields an id
of zero, the reset has demonstrably not taken effect: the function logs
"Can't get device id, subsys reset fail." and then returns the return
value of btmtk_usb_id_get(), which in that case is zero, i.e. success.

btusb_mtk_reset() returns that value unchanged, so its caller cannot
tell a completed reset from a failed one.

Return -ENODEV when the chip id reads back as zero, leaving the existing
MT6639 exemption intact.

Observed on an MT7902 [13d3:3579]. The path can be reached on demand by
asking the controller for a coredump, since btmtk requests a reset once
the dump completes:

  # echo 1 > /sys/class/bluetooth/hci0/device/coredump

  Bluetooth: hci0: Mediatek coredump end
  Bluetooth: hci0: Can't get device id, subsys reset fail.
  usb 3-10: reset high-speed USB device number 5 using xhci_hcd
  usb 3-10: device descriptor read/64, error -110
  usb usb3-port10: attempt power cycle
  usb usb3-port10: unable to enumerate USB device

The same sequence occurs unprompted when the controller firmware asserts
on its own.

Note that this corrects the error reporting only; it does not by itself
make the controller recoverable in the case above.

Fixes: 25b6d7593a3a ("Bluetooth: btmtk: introduce btmtk reset work")
Signed-off-by: Ismail Tarim <ismailtarim7@gmail.com>
---
 drivers/bluetooth/btmtk.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 66b346761043..dc702c0a6034 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -968,8 +968,10 @@ int btmtk_usb_subsys_reset(struct hci_dev *hdev, u32 dev_id)
 	}
 
 	err = btmtk_usb_id_get(hdev, 0x70010200, &val);
-	if (err || (!val && dev_id != 0x6639))
+	if (err || (!val && dev_id != 0x6639)) {
 		bt_dev_err(hdev, "Can't get device id, subsys reset fail.");
+		return err ? err : -ENODEV;
+	}
 
 	return err;
 }
-- 
2.55.0


