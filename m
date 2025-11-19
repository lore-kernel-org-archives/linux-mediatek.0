Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8327CF3963
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Nov 2025 16:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BNHinq4/2cTHhTy5HKSefqHwCj7EyOMXN8DmFkxYCE0=; b=kAyEOeVasftTQy/1sW5xbNJU9g
	hohqyh9gBH+mVM+coYAWJAXkmAt9VhAspTnsTJDJ4mZ517Gtc0CthHVWyMrBTc7z/5HRFwE97V8WX
	hDNLoRMc9rKdGMU7MHisc8Bxmj4Nc6gr5MP7BhkX4vk7lP8IAkhjYE2z6rTkeP7sfEjriijpKVfq0
	wen5ykQn79rSwuah3+m85wdq1VVWm7FUFrDwKk9IuPLOL34hkQhu+ibdIExY/vepqL7P6nD4Mbwyw
	mN9ommHjT7aA7JIslglWFN6mrdw+7AuHi33sIPh1eowB6Q7nW5d7AoCDSxIQiOTtMRfmFx44z5e8m
	HImW6GLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlRp-00000003mYg-2eIl;
	Wed, 19 Nov 2025 16:54:25 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlRn-00000003mY1-2fe2
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Nov 2025 16:54:25 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so7893841b3a.2
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Nov 2025 08:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763571263; x=1764176063; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BNHinq4/2cTHhTy5HKSefqHwCj7EyOMXN8DmFkxYCE0=;
        b=OsCKOIeTpANwEyH8tWoC127OSIerHIvfAxhJcFyuK6rJ4IfS1iMAETLpcZyXE21P5R
         hJVhMvblwOxb/xsc3jAUrgr+w3A7n+5XV5zu/cViQsJypMydDRGIHRFozgVgrOCzKQ7+
         I9Byb9mZBVOG7pDsYj4Iyulm5pFYaZRiaLuyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763571263; x=1764176063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BNHinq4/2cTHhTy5HKSefqHwCj7EyOMXN8DmFkxYCE0=;
        b=ZHC5/foFjyRLBFxuic465cnX0Ylq3kY5/9ShxT9Vb1Z8GhIoNv4HKSqSDvGZAd3i2H
         16/Ffy8vKyh+TWdc3HoIGRO+CsE8HfliPKSxEANxrKQ66Frb8kPyjtZfergDiRyJYxjE
         YFSrg9Jet1+gkHfhdKadb4SeDgO2M3VudzYSn4zQYtK4/D0XQuqnmw2f3lo4uvVanrkd
         6wLlNgqgXnT64xuxaGDGiVkTTOvRfeT9fSAYquRi9l9Zly1D5e3kLcEj4E9+qc0/9qGa
         +qIIBWEwoT2Vt2c5VVE/mZqP1F2xDVw44cQEjT27+M7dwws4mPRWeirc1ttRRZL1Wq4d
         0Z7A==
X-Forwarded-Encrypted: i=1; AJvYcCUW5DXI9T38ZnS3tyqKbdzJGgBEgdyO71UTfX1pvJZ4VZPZ6GyotQaFj/kkNULUM5U8EFlkM5Erg0QTHjvUOQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFHfrsjPyGowJ+mK5Uv82hcA3X1WA8nyHiYJegRfi7Z3pb2XDx
	7yjgAMOHTS/klSi4Rf9QKnQYj2YqqUlxH6uU/x6qHd62TJBzhnVMOfsE9FD9lg9IOw==
X-Gm-Gg: ASbGncuakHzebFCcOYShXwI3XUe9MtLUKwsCHR9FRm4rZIY/ZZ+Y56ew8kMCTVOFzw3
	Yg8bRXVexp4ZNiA5xPYA69eoHr2fJfWuRwhhjD19/PRJbN9zeeKrFcvB/FPagwO26ah+SvziS6C
	mnmrFNW1hU/Jg7PjuWg4osZ3PYX4TRj8eg3PLEDqJ536Hr2Yuj73yVaPxwo44exiLAT8p/Fhqs7
	3UPQN5lEFktvISxFislSy+4CLEDmL+/8u4NhNhNdYYQqAq8lOW9HdrhtaZurZHPpQnaKiB3GXeF
	5t8FU8bMDpmhxLN5Ou4OaTTITZOpOt6IhJaskUVbuqjA5yyKxLf8VrHmtrUSMxjnZinA3Mv8x30
	eT3peSrpp3nuSZqDAm95MVIx+FGHASceqp6lxQ01DS8rxIiv65Y3HepBHiA04qzXK113TeREZQd
	Phk+g9ErHJMxDxCa1dtSKR6MrOO+dQidciLoHVAKIgyYJ12quACqQ9b3/5/RpWZXeJgG7w89b/U
	E8tynV/Pg==
X-Google-Smtp-Source: AGHT+IG6Mf8qsXvOK1ixMYCQNU/FYpCBumYnKBfjBKtdbVbifmpntuvtxBUSy93dyel1BQ7M/vgfNA==
X-Received: by 2002:a05:7022:eac7:b0:11a:a20a:4413 with SMTP id a92af1059eb24-11c93887b01mr7150c88.31.1763571262673;
        Wed, 19 Nov 2025 08:54:22 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:cf0b:c8dd:8f4c:d649])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b0608860fsm61967659c88.5.2025.11.19.08.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:54:21 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
	incogcyberpunk@proton.me,
	johan.hedberg@gmail.com,
	regressions@lists.linux.dev,
	sean.wang@mediatek.com,
	Douglas Anderson <dianders@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] Bluetooth: btusb: mediatek: Avoid btusb_mtk_claim_iso_intf() NULL deref
Date: Wed, 19 Nov 2025 08:53:55 -0800
Message-ID: <20251119085354.1.I1ae7aebc967e52c7c4be7aa65fbd81736649568a@changeid>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_085423_709253_4D228123 
X-CRM114-Status: GOOD (  16.38  )
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

 drivers/bluetooth/btusb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index a722446ec73d..1466e0f1865d 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2714,6 +2714,11 @@ static void btusb_mtk_claim_iso_intf(struct btusb_data *data)
 	struct btmtk_data *btmtk_data = hci_get_priv(data->hdev);
 	int err;
 
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


