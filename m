Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6320DE8FDD0
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Dec 2025 11:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n2DCKn6B7Bg+9KQ/LRQRtOwwU8XjtNRI/VbbXHcbXNg=; b=EQ03bFxRjneG3n0XpQu9PjLFFj
	ZNnJ42DrgCULhBsqBw/V7HlQrHuOB2+vN7JQYjnGDByxoFd95F4RlVgi3N9ePbQnbmHOx0+PKpGsH
	AGni1jMebsw04I16wfWzKKdMv6zqxkY91OyDn8LD7Yyd/AbU2T2AlVgLs4LMcGd1bWvUDdcf3vkDl
	fGXq090Tg4zn9WUxn4V4Q/xfrXUU+9k8MwHEHXr7tmt5bx9jVTy5s5Y+UH/IR2DoTZ1Wnpe4eEHR7
	TK0OU7rAJjdF/hA/bs24YBd4n7yZJ+fDSPbtmIpQGeouWLicd+iEFZJr6tuhahdvd9rjwetPyBryL
	snX/qjOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZSNR-00000001t9V-0Y3e;
	Sat, 27 Dec 2025 11:22:29 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZSNN-00000001t8d-47aA
	for linux-mediatek@lists.infradead.org;
	Sat, 27 Dec 2025 11:22:27 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-47bdbc90dcaso49324705e9.1
        for <linux-mediatek@lists.infradead.org>; Sat, 27 Dec 2025 03:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766834544; x=1767439344; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n2DCKn6B7Bg+9KQ/LRQRtOwwU8XjtNRI/VbbXHcbXNg=;
        b=HN4HVvSxNXZqvOvGS06d/k4kbDLW0z0Kf3ZFQjnC8kY3NNOYPXHZkQf0pjdmGh3ZEK
         +iK7VV0PCIirUX2Up09rSu3xvdzuiVV61zG26Cp0wkNFOIlDB3/MLSM/bUQIQOTwt7xz
         oaygEYiZRJ+mI8OqFfDe0MBa2H8+NrZMszkgvGMB+yMvkZso7ToivV+DJ2iNHo/pEYTf
         +A9mcW2LZGUiUHkHnBYxlhrKXo5mgRBr3/EikypKM4Yb3d0Y42GQAzaM/ujiAI963fhP
         f8KjWjmvaY+3WAdzda3t9wJlONL+T/8IJZi8/5PJaOK3U8tXXlsG7QNrjNlXdQVEVc9y
         Axvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766834544; x=1767439344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2DCKn6B7Bg+9KQ/LRQRtOwwU8XjtNRI/VbbXHcbXNg=;
        b=bGE/bvqFpdrtaC9qJvwpbHAp2VlIb+Q5Pp5jc36gHs6W8DQCCg69r9OUu2kfwJHPv4
         IYzNLmFKrhYog+MxhTscCBwHVpiXCvreLnIrPCAQeaXKrwLJJnSCwr9NHJZitGTmSg/d
         irXOTOmdZyZak0bQFjf96Ek4rkf864w5wn9gFJJI9lyhZYyRvFBZmOhwIYRou6dbHZGW
         0gd0UvHXE41/4pRuNGfij6H7FNMYIKtlWq0gm1f4eELYU0iwj6LyeytCvArlznDAVd5/
         3S+sXzFawCsD9JPze62LHifpfnPVzNXowPpApxq6HUmwhYHa0pm7c5IqVDAK0+VCEOPe
         kuMw==
X-Forwarded-Encrypted: i=1; AJvYcCUUA2104SIYuVkVr1ANDDmxKcoiW+c+u0nkXAHM55D1ESnRHc/sYHbdwiey4yuY1U20FClH8RC8ZdLhK6u5aQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8v9eZdzAuyTf+L6NYfBa6JWIXPFO9B71rwcB1AuUeV+SegxIB
	furT4CaTxnCrHgb3oiEUoihh6vfHNud8bkYNSVlGx42WgCKcBj/xrNnD
X-Gm-Gg: AY/fxX772nbWk5j9wyWoUpl06NOHkB63t6RwrbsHbyqEBIFrJx0ffs21fgY9TLTr3LB
	KffRdWtkauMc7tG2j+E9a/Xgi0jAMB18PiEJLOCdo8ue2YUGHyXVcPoaFurzIiJMiPKBFR9U9KI
	15NC0AgwnsKRx4+fge3Hp0DdhQbS8n4wgSLFeVfkxwh6Ir60HvcyM71qiOcKvgcf0VcQfhzE6Ka
	D8cOkJ7UYuSlSwBkNlzkqKrcSvc3cGNpcrhXCzyjHkA33ZcYozw7yrnKSUqlYGVC1AspBHz6cg9
	g+NGpdhnP8+VAHfHjPB/ePifOGcSSmuUIHClRauX0ZW+3XxzpVkzvyRGDHBnHPC103pY2K8xftc
	VIn/qgIegO10JgpcXwXRCHCPhHU7UpY6tJfkFiKJK9ZLGEgVQrzJ29RKfALNg2lFelk7Z07K+4S
	aLhOTXbARj4w0V+Es=
X-Google-Smtp-Source: AGHT+IGoRHV/ozBfOoLVpES4DLCNbHxVqZI4mSyjVxLpUFm4/9hj62ouP1sKgmo+lauX8G4qDDvyKA==
X-Received: by 2002:a05:6000:609:b0:431:342:ad41 with SMTP id ffacd0b85a97d-4324e6fa1a7mr32037027f8f.61.1766834543655;
        Sat, 27 Dec 2025 03:22:23 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324e9ba877sm49898600f8f.0.2025.12.27.03.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 03:22:23 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Daniel Golle <daniel@makrotopia.org>
Subject: [PATCH v2] wifi: mt7601u: check multiple firmware paths
Date: Sat, 27 Dec 2025 11:22:19 +0000
Message-Id: <20251227112219.2768439-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_032226_063252_F98BEC73 
X-CRM114-Status: GOOD (  16.27  )
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

The linux-firmware repo moved mt7601u.bin from its root folder to
the mediatek sub-folder some time ago, but the driver still tries
to load firmware from the old location. Users might have firmware
in either location so update the driver to check both.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
The firmware was moved in [0]. Changes were requested to a previous
patch [1] to accomodate backwards compatibility but there was no
follow-up from the original author. So here's my novice attempt at
the requested improvement.

Current kernel with firmware in /usr/lib/firmware/mediatek/mt7601u.bin:

Nov 07 12:43:13.398922 LibreELEC kernel: mt7601u 1-1.3:1.0: ASIC revision: 76010001 MAC revision: 76010500
Nov 07 12:43:13.402276 LibreELEC kernel: mt7601u 1-1.3:1.0: Direct firmware load for mt7601u.bin failed with error -2
Nov 07 12:43:13.405524 LibreELEC kernel: mt7601u 1-1.3:1.0: probe with driver mt7601u failed with error -2

And with the patch:

Nov 07 12:43:13.274633 LibreELEC kernel: mt7601u 1-1.3:1.0: ASIC revision: 76010001 MAC revision: 76010500
Nov 07 12:43:13.311200 LibreELEC kernel: mt7601u 1-1.3:1.0: Firmware Version: 0.1.00 Build: 7640 Build time: 201302052146____
Nov 07 12:43:13.704693 LibreELEC kernel: mt7601u 1-1.3:1.0: EEPROM ver:0c fae:00

[0] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=8451c2b1d529dc1a49328ac9235d3cf5bb8a8fcb
[1] https://patchwork.kernel.org/project/linux-wireless/patch/fefcbf36f13873ae0d97438a0156b87e7e1ae64e.1684191377.git.daniel@makrotopia.org/

Changes since v1:
- Reword patch description and comment to make the problem clearer
- Fix checkpatch warning for static const array declaration

 drivers/net/wireless/mediatek/mt7601u/mcu.c | 15 ++++++++++++++-
 drivers/net/wireless/mediatek/mt7601u/usb.h |  1 +
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt7601u/mcu.c b/drivers/net/wireless/mediatek/mt7601u/mcu.c
index 1b5cc271a9e1..bad6ca821400 100644
--- a/drivers/net/wireless/mediatek/mt7601u/mcu.c
+++ b/drivers/net/wireless/mediatek/mt7601u/mcu.c
@@ -403,12 +403,18 @@ mt7601u_upload_firmware(struct mt7601u_dev *dev, const struct mt76_fw *fw)
 	return ret;
 }
 
+static const char * const mt7601u_fw_paths[] = {
+	"mediatek/" MT7601U_FIRMWARE,
+	MT7601U_FIRMWARE,
+};
+
 static int mt7601u_load_firmware(struct mt7601u_dev *dev)
 {
 	const struct firmware *fw;
 	const struct mt76_fw_header *hdr;
 	int len, ret;
 	u32 val;
+	int i;
 
 	mt7601u_wr(dev, MT_USB_DMA_CFG, (MT_USB_DMA_CFG_RX_BULK_EN |
 					 MT_USB_DMA_CFG_TX_BULK_EN));
@@ -416,7 +422,14 @@ static int mt7601u_load_firmware(struct mt7601u_dev *dev)
 	if (firmware_running(dev))
 		return firmware_request_cache(dev->dev, MT7601U_FIRMWARE);
 
-	ret = request_firmware(&fw, MT7601U_FIRMWARE, dev->dev);
+	/* Try loading firmware from multiple locations */
+	fw = NULL;
+	for (i = 0; i < MT7601U_FIRMWARE_PATHS; i++) {
+		ret = request_firmware(&fw, mt7601u_fw_paths[i], dev->dev);
+		if (ret == 0)
+			break;
+	}
+
 	if (ret)
 		return ret;
 
diff --git a/drivers/net/wireless/mediatek/mt7601u/usb.h b/drivers/net/wireless/mediatek/mt7601u/usb.h
index 9fdf35970339..723025f84483 100644
--- a/drivers/net/wireless/mediatek/mt7601u/usb.h
+++ b/drivers/net/wireless/mediatek/mt7601u/usb.h
@@ -9,6 +9,7 @@
 #include "mt7601u.h"
 
 #define MT7601U_FIRMWARE	"mt7601u.bin"
+#define MT7601U_FIRMWARE_PATHS	ARRAY_SIZE(mt7601u_fw_paths)
 
 #define MT_VEND_REQ_MAX_RETRY	10
 #define MT_VEND_REQ_TOUT_MS	300
-- 
2.34.1

