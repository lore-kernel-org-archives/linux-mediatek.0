Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947C7CF887B
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Nov 2025 16:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yaSUH4/iI6K4vkTA9vG1I3sRuhxHn3+OXrhAbv97RTc=; b=XVGdqA5z64MSOmfQJHL4VPmyMm
	4Zk/n+P8gixluVEIb+w9XYG6BMv9Td2VS32ZNILKgCRGfMmuJ2uyRjvPLvnjJNJafATfQT2/6mz7s
	eAVyToQViKc7uH/lkbkVJpii16JebTLhozRpkxEd4JyjVjljf83nCZq3IfoRYzoOcUxFDz/INZZF0
	F/PEwBulJb/oD4OgYW7f+TUjlNy0cTDY+KeokXdnGSWC4rA0ChLlrOLE2bYL4tB0gN53z866cVdh1
	uVswxWFVZV6cuhDvpADxOgYjM7+swdCXPMpw1AZyiRMU3IjrCsBBs+TN2v2jDlj3ejmQfY6zzve8b
	v+uHK7Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7IB-00000006z6i-3MeL;
	Thu, 20 Nov 2025 16:13:55 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7I8-00000006z5x-40sE
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Nov 2025 16:13:54 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-298456bb53aso14175895ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Nov 2025 08:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763655232; x=1764260032; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yaSUH4/iI6K4vkTA9vG1I3sRuhxHn3+OXrhAbv97RTc=;
        b=mR7y2E7z62G4i5qwUP5Noomt2yRTdE7MKpIgx6nyjhcdl2n/PCfJHGdhwYx2pmPLBT
         KnFn2mbYZg+9NR/p9zO3l1ow2Ula4CNmGf9XICmOO8TzUbySnpNbsJeJtdjCzAvF7KCB
         jx2QMAUYqmmki5bV106SgiAhO/hdXnovyD1K0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763655232; x=1764260032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yaSUH4/iI6K4vkTA9vG1I3sRuhxHn3+OXrhAbv97RTc=;
        b=kXrj1IcVh5qWqbW3AH9lBvH3x7QT3gS6MqrOQk2M1Wy/N2DxYKM+DOsvRqWmkrVm4B
         At59AzQvT9TqKessrFgtJ5hMooh6hYOuuSRY+zk89SfUdxK7E/77PyPM0l2KE71ixz3c
         PYNnfsQaCIuM9n9mg2a5UhqxF3X5KuPIYBSvI6i+w212DhAjRIv06A3QnSLTnTlyyktS
         mdBQ9jdZvMywkEN82DF4hjJrtQwnO4/e32xS3ZnTSy9zyrVoKJ3ZSyVT1obtD4KZaqcV
         4uhThQlqSG6QmSUckBWy9RtAKZLzsbIm5HKUFY1JaJ5145JJfbz2gscMlyW+RRTRvraf
         cGUw==
X-Forwarded-Encrypted: i=1; AJvYcCWneoAYYJxsmK0hex9MsQqQVGBxKg6h78zS1SHNGXyAK5MT1AaGYOGuyL0zpo1JWkc/+ocwzRCy01toRlX68g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8NeGRcm6K1I9xQefaW7cQZFBHfPBtd/TMiuoAU4m0r1ycCXI5
	kIUppLEVh+GFJUcAywan4cWam9oHWn33GuepmoKEjvfTVC4Y5L/EPFtRgFrZ5mKhuQ==
X-Gm-Gg: ASbGncsFGUVSWPH2Up9ymzaMpAXe2Nub83wxZH2sQdSPy1TAR0G8q/6yaJ+NlHK9GxV
	EUErzhJCQO/9nvw34o6D/qVvTu8toXufomK9fLkiHm3RJzLQFGNZehFtHXDzo/WJCSwt81fqe1U
	807fOnr1K7gFPCylc0OcsnCi873jCCqSB0sMuBcYcLItRFyzORt1yhaTd/pqz9Chkip6s2H2RrD
	8/Z9lbInyjxFthQ27XLbAGNwo+VBEJDR3Nva/8Fz9AZLhTJYmUs5flIkgEeb7UIMNV60msu2RJX
	36oC517o17iuqYMzt9U/V9D4uCnoREF8shRHIQuBGzKwSDTW8CgmZ42BJFkV9I3qntv+UpFenBS
	1aA21xqXl3c3tbrId4LEi6ghaBfyAqwUhUn8hBFftzRJW5cckxJIJrFyIAa7gtErN2xCoyDYrr5
	gOxhey3tRkXDtmi5B0DxAi7o/KQp2G92IIHF02c3QPSDIN9a8HVRI+DTcAur01ECDHNXCT7Ws=
X-Google-Smtp-Source: AGHT+IHXE1Lf/Npuwj0zFjBOEWKicuzA3UumJeheDegj7w9jH2aGLxpoO1AX2E47uPWOL3GSil4eRA==
X-Received: by 2002:a05:7022:b88:b0:11b:9386:826b with SMTP id a92af1059eb24-11c938a5da8mr1482106c88.48.1763655232027;
        Thu, 20 Nov 2025 08:13:52 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:b075:e64a:7168:da0e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a6fc3d0bb6sm14316777eec.2.2025.11.20.08.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 08:13:51 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
	regressions@lists.linux.dev,
	incogcyberpunk@proton.me,
	johan.hedberg@gmail.com,
	sean.wang@mediatek.com,
	Douglas Anderson <dianders@chromium.org>,
	stable@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3] Bluetooth: btusb: mediatek: Avoid btusb_mtk_claim_iso_intf() NULL deref
Date: Thu, 20 Nov 2025 08:12:28 -0800
Message-ID: <20251120081227.v3.1.I1ae7aebc967e52c7c4be7aa65fbd81736649568a@changeid>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_081353_044442_2F11285D 
X-CRM114-Status: GOOD (  14.61  )
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
Cc: stable@vger.kernel.org
Tested-by: IncogCyberpunk <incogcyberpunk@proton.me>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Added Cc to stable.
- Added IncogCyberpunk Tested-by tag.
- v2: https://patch.msgid.link/20251119092641.v2.1.I1ae7aebc967e52c7c4be7aa65fbd81736649568a@changeid

Changes in v2:
- Rebase atop commit 529ac8e706c3 ("Bluetooth: ... mtk iso interface")
- v1: https://patch.msgid.link/20251119085354.1.I1ae7aebc967e52c7c4be7aa65fbd81736649568a@changeid

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


