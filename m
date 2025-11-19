Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9370CF3979
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Nov 2025 17:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TMBoUXycCoalUx2IdYMe60O4++ie5VkCIVBelZSQqfI=; b=bZ8GV6L8gG2tNrvwVo/k/Ut6bA
	b3S+IcEiQsNeGqvfx6ounp5Aqk302JTvrm+8dU1tNFPav7/ck7ETDAl8v6X0Zn9RPaMHe37zb4reR
	KGo5dfpo2jTTM7PJEAYv80x4Ba3DQ5tF1XJfiS7fxtw8fDA7TM234AuZZoO3Z6i8/7kvNtF8t+osr
	h/TwD83FwRuLJD3/Xr9iSRNqvo2QXT2zFH8qfqj8bwtlyshYaHrs+j/gnH/H0ykgqmENOY6cy80jU
	yy7ikz31r+ASzkd4JX03xaCjfidF5M1RHoXeVzTdT6bGxnaT0i1eeyDb2enxhu/R5/cXM1ohOrw54
	zH7XwFqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLm0m-000000046zY-06oT;
	Wed, 19 Nov 2025 17:30:32 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLm0i-000000046uZ-3czG
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Nov 2025 17:30:30 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so7942573b3a.2
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Nov 2025 09:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763573428; x=1764178228; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TMBoUXycCoalUx2IdYMe60O4++ie5VkCIVBelZSQqfI=;
        b=ULMo62wd6ey9TLBEMIMlFwpk0Dwa04bh3lNSamC6rFuRfycysdHJJ8E7v9ENwC6mMX
         coMhZgwOWViBt2xgzbtsbOHcO16VPzEFOFQORXuTKKDCBAikIrTpwhLxeVcxwK8Z8rhI
         RSLoCF8fp+VDGGTZYp0BjNMNgxEcGf4swMQgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763573428; x=1764178228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TMBoUXycCoalUx2IdYMe60O4++ie5VkCIVBelZSQqfI=;
        b=gFZKPEZlb4qXO+dJRW/i3zV5jga1BSs6AqEJSxLjxAW/Q71wwazj4JWSDfJwEUMKtd
         /JSPiIFhnzAuYCB39PNm2x7QLsyy3WaUtEHxT0LxdhELbX0Nea4kcyH9Z606mOqAHUEJ
         +Q7Scve7XiCoV8um2t/ONxbF45KXqWrtv9wosk4lZ80B9VuJ/ROcZadK+E9JXNt2nWve
         vXAXz4j+CVWgxB5Dp+w9xJ4W1eYvWA8JWDAtvx/nzn7ZibYl5KUjoUlZdBJdrxtaLfbQ
         pmCk2MdKe7O+fXZzxA12VD1EOzFqo6F3ccqyu2uUJ3v43DIfvyY4VljTooYHZIE3gxdd
         7szg==
X-Forwarded-Encrypted: i=1; AJvYcCVGMZ2jsIz8EoNfHnxbp/ZTwJ3imrcLs/TCDEczrRkKrstF5L7WUpnI1HL4zVju9pJxVl0ZtFlhWneO7bwcqA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOwBplB/u5qumt4VWB6KeFt2m2wkPIIb3Tx5zSS6sxuLbblGFp
	AD8O+u4FLStmZsHggiNDS19lvpN79dqhXmvZF9ICUgQ50qWbwCJFJ1oCwpY+FOdxrg==
X-Gm-Gg: ASbGncvkfEunFonQlS3i+SVtZTGL3PBBiIUg3sRFOykih5Tvr8b1S17jPdXG5y/MhJi
	EHrPB9a6wuP5dr7kuSpqhQKWPpA2MREm0EZvqCdWVI1RfRQy+TkWMCYBzdENkSmITr4Pnmmx+Ra
	lYtiO25Xp/b2Wr5J6Ut0GqeBOOBJW6AJd2gcPmCX4EUbTCjx2qxEAWoLpshML9SHU/LXSvvrZY1
	ZoCsl31wSXsv6ea/B51iwj5E9HwlALIdJdZEq15w3+usH6OKHyoPYKlTmszb3cBz8ACsQq0VK4V
	qPd6ZoU+2HG0h+8gtycNruVqtMYzo424vt0RVFubaIC7fvh8k8wMEcIFj7BLYtHy0NXWSojUXpy
	S8pkwHWfZ+1AiaK33Mi30FHbVl6MBryi0g0gimyjcKMrDs9JaJRSK8XG7WN+1h/K742srOh6XBa
	7O15w48Rg0/MzmgzC4gJ7EcfLvaXsPwjQxvrGkr12d5/TqPd/AjxCWdsPY+jvKql3QTmFjkaE=
X-Google-Smtp-Source: AGHT+IFB2YSTkbyEbeQu8O7Mtor+aeK/rpWG1+Is+9xqP/zrbkSWBMOGAREHyl95i2ctzd/T2DJJ7Q==
X-Received: by 2002:aa7:88c9:0:b0:7b8:d12f:90ae with SMTP id d2e1a72fcca58-7c29de3b6f2mr4341114b3a.21.1763573427806;
        Wed, 19 Nov 2025 09:30:27 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:cf0b:c8dd:8f4c:d649])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b92772e713sm19839792b3a.54.2025.11.19.09.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 09:30:27 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: incogcyberpunk@proton.me,
	regressions@lists.linux.dev,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	johan.hedberg@gmail.com,
	sean.wang@mediatek.com,
	Douglas Anderson <dianders@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2] Bluetooth: btusb: mediatek: Avoid btusb_mtk_claim_iso_intf() NULL deref
Date: Wed, 19 Nov 2025 09:26:42 -0800
Message-ID: <20251119092641.v2.1.I1ae7aebc967e52c7c4be7aa65fbd81736649568a@changeid>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_093028_927502_921319C3 
X-CRM114-Status: GOOD (  16.97  )
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

In btusb_mtk_setup(), we set `btmtk_data->isopkt_intf` to:
  usb_ifnum_to_if(data->udev, MTK_ISO_IFNUM)

That function can return NULL in some cases. Even when it returns
NULL, though, we still go on to call btusb_mtk_claim_iso_intf().

As of commit e9087e828827 ("Bluetooth: btusb: mediatek: Add locks for
usb_driver_claim_interface()"), calling btusb_mtk_claim_iso_intf()
when `btmtk_data->isopkt_intf` is NULL will cause a crash because
we'll end up passing a bad pointer to device_lock(). Prior to that
commit we'd pass the NULL pointer directly to
usb_driver_claim_interface() which would detect it and return an
error, which was handled.

Resolve the crash in btusb_mtk_claim_iso_intf() by adding a NULL check
at the start of the function. This makes the code handle a NULL
`btmtk_data->isopkt_intf` the same way it did before the problematic
commit (just with a slight change to the error message printed).

Reported-by: IncogCyberpunk <incogcyberpunk@proton.me>
Closes: http://lore.kernel.org/r/a380d061-479e-4713-bddd-1d6571ca7e86@leemhuis.info
Fixes: e9087e828827 ("Bluetooth: btusb: mediatek: Add locks for usb_driver_claim_interface()")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I have no way to test this commit myself other than to compile it. It
looks fairly straightforward, though, so I'm hopeful it will fix the
problem.

Changes in v2:
- Rebase atop commit 529ac8e706c3 ("Bluetooth: ... mtk iso interface")

 drivers/bluetooth/btusb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index fcc62e2fb641..683ac02e964b 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2751,6 +2751,11 @@ static void btusb_mtk_claim_iso_intf(struct btusb_data *data)
 	if (!btmtk_data)
 		return;
 
+	if (!btmtk_data->isopkt_intf) {
+		bt_dev_err(data->hdev, "Can't claim NULL iso interface");
+		return;
+	}
+
 	/*
 	 * The function usb_driver_claim_interface() is documented to need
 	 * locks held if it's not called from a probe routine. The code here
-- 
2.52.0.rc1.455.g30608eb744-goog


