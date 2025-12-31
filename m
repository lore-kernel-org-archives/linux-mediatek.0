Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E6FEEB572
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Dec 2025 23:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6lECKX6HYn/UFgYHW3Lep9ULLvDa097/tngl+1jpf04=; b=RBHkaDv6NdVZWv27z5pzTbom63
	QEklt+MAfQKQ9f2sgb0Bn4R1yiRFND1/a0MAn7xIMD7P1W0QZu0Bi6zw2rZPChRCfHDd6382rY71u
	ScPu3amRLdj9IhGxFNKZh+PwuzXBSWGVIAZQIg2Hrv9Sjo/rNwORckq1P/q+KqQsq4D/IUdDFSgKa
	EIQbQNC+t9mBWPB359trKBlTScq/XmV54GkT2YsxlbZJodvWEiW+c1vCKaTUPkddiDm9fiev7Dqm3
	zl3kn4kh8V2gG5PnjMiYEpnsKWpKJGbin5LCq0np5L0o0LD4s1yekZFIZIw0uV/GLvpJb+zXBHiEz
	rNJf+Mxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb5tp-00000006Quu-0Xfy;
	Wed, 31 Dec 2025 23:46:41 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb5tl-00000006Qtc-0BZR
	for linux-mediatek@lists.infradead.org;
	Wed, 31 Dec 2025 23:46:39 +0000
Received: by mail-ot1-x343.google.com with SMTP id 46e09a7af769-7cdd651c884so3894326a34.1
        for <linux-mediatek@lists.infradead.org>; Wed, 31 Dec 2025 15:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1767224795; x=1767829595; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6lECKX6HYn/UFgYHW3Lep9ULLvDa097/tngl+1jpf04=;
        b=CtpRkS4TL0jP6s7QfG5dkyGSqB0tGs5Tb5VM7tLh89uACzH/CPN5dlYkigciMUvi5j
         27lGvG88D1oc/n1qQ2OHkzJd4I5Wc+UGE+5RIUjI4LtLRWeEP+ABO3R7yTkK6vk9JVjl
         6Q8BtG2F994Bj7ns6aC3UwD7bUFaRk76+Yblo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767224795; x=1767829595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lECKX6HYn/UFgYHW3Lep9ULLvDa097/tngl+1jpf04=;
        b=cvTKU+prz5myqcmKE/EgTpPFxPgpIk1qeXqAIcoGO2/Vffgqlglog2Z/DJnDjv7Gk3
         jFU0qxTiXdTWB6zHbD79/Asff6IEjJBVwUfKutYVLp1fLQEW38cuDcBhshrll1zZgbST
         aZLxfPa2h2EToQMHb0a1m9zoMDFCMM87L8VoVsAEIeBgZraY9s5UyeBRC4U+dJSkBDlG
         JdxVWopSPJh8wiwL+GdiNdbJW81QfMNLO9vF/33FdUVHIUydZ9echmi/M2tMiD2EzYDJ
         JFE/zMRXrHpgNtY/mtetaVwD9qR40EDN9/VtfSksSWJEU0uXYqxTfCrq+iNbH/9G51kC
         vavQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVJCT9+U9sDi00V8djjKgOkJAlWRrUltgE9e6Yr2DRnKhgPkXoFYlpC0RZV3p1/SjGTRV1sIDCx/I+Gxq31g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwgGj0lHduCzGV2Xx9/4reNTjlddxhpnwonRTPHBfGwtKsEycvG
	hDn5uo8lxMfyIuJA25I50Ct55F2afsInJNteWSlb+zw0OzkP7MtaJMbekYWj+XbeS6I=
X-Gm-Gg: AY/fxX5x55deJB14ghVDbC8gAMkXOwibwZ6mPzCSFJ72D2SgKNRFNqHAFBHHUa/uZ45
	aEk1ScRKFk/pwySQarewQsJqqT8C/a4AY3xulgCfO4R2e7SIHrSMUiZ4NTS/7rw6vstU/SnikSc
	JcZx1bPuPr5oAS1zWuJoXBaAiHG0cTxJ/ynVzVkJL0CUAQopwaJHOuip79hxKNM0S/qJbl7ufyT
	yqJ5SaYmJR0MKzaGK+qQA9UR72zTiiTwP4D4dkGCQXiU+W6klDqhqvaDaGEEYe2CY+1wpEnlqfl
	kWpsQbMb3FWVgX4T+pg6MTsCUP4Pdvm4kX468g3jLcvEY4U2I/Wh70j5uRNuDj28TQY9xg8cn3y
	d3WTIf8b09Gw4JLhAO7aMX61f6pg9WonswLnt8pPGLVTbJ4eF+gCHHTA1Kw0+zcHUnnfT4nhrYa
	tXbxgR3gFHKnk1Eq9Ts9TFZi7+9Aa9fFkws6mK
X-Google-Smtp-Source: AGHT+IFV2BaGqD0BAddR/5VHavfl8Mnol7saz3Bsj0Em4upn6uAvpba1yOclRSKtiPCjPQk30vcWYg==
X-Received: by 2002:a05:6830:2e06:b0:7c7:64f3:690a with SMTP id 46e09a7af769-7cc65eb8a4emr20258833a34.18.1767224795618;
        Wed, 31 Dec 2025 15:46:35 -0800 (PST)
Received: from shuah-framework.internal ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cc667ec367sm25187288a34.23.2025.12.31.15.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 15:46:35 -0800 (PST)
From: Shuah Khan <skhan@linuxfoundation.org>
To: nbd@nbd.name,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	torvalds@linux-foundation.org,
	johannes@sipsolutions.net,
	ebiggers@kernel.org,
	matthew.schwartz@linux.dev,
	linux@weissschuh.net
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Mario Limonciello <superm1@gmail.com>
Subject: [PATCH] wifi: mt76: Remove blank line after mt792x firmware version dmesg
Date: Wed, 31 Dec 2025 16:46:26 -0700
Message-ID: <20251231234627.11867-1-skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_154637_492227_846DFD6C 
X-CRM114-Status: GOOD (  10.51  )
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

An extra blank line gets printed after printing firmware version
because the build date is null terminated. Remove the "\n" from
dev_info() calls to print firmware version and build date to fix
the problem.

Reported-by: Mario Limonciello <superm1@gmail.com>
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---

Note: adding discussion threads about revert and simpler fix
for this. Mario sent me email offline about being away for
bit. Sending the patch since I have it ready before I disappear
for New Years.

Relevant threads:
- Revert for f804a5895ebad2b2d4fb8a3688d2115926e993d5
  https://lore.kernel.org/all/20251231035645.5545-1-skhan@linuxfoundation.org/

  This patch depends on revert patch.
- Discussion abour reverting:
  https://lore.kernel.org/all/d7f3b00d-beec-41f0-b157-7cfb871f9a46@linuxfoundation.org/
- Proposed fix for reverted commit
  https://lore.kernel.org/all/CABXGCsMeAZyNJ-Axt_CUCXgyieWPV3rrcLpWsveMPT8R0YPGnQ@mail.gmail.com/

 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index fba7025ffd3f..0457712286d5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -3019,7 +3019,7 @@ int mt76_connac2_load_ram(struct mt76_dev *dev, const char *fw_wm,
 	}
 
 	hdr = (const void *)(fw->data + fw->size - sizeof(*hdr));
-	dev_info(dev->dev, "WM Firmware Version: %.10s, Build Time: %.15s\n",
+	dev_info(dev->dev, "WM Firmware Version: %.10s, Build Time: %.15s",
 		 hdr->fw_ver, hdr->build_date);
 
 	ret = mt76_connac_mcu_send_ram_firmware(dev, hdr, fw->data, false);
@@ -3048,7 +3048,7 @@ int mt76_connac2_load_ram(struct mt76_dev *dev, const char *fw_wm,
 	}
 
 	hdr = (const void *)(fw->data + fw->size - sizeof(*hdr));
-	dev_info(dev->dev, "WA Firmware Version: %.10s, Build Time: %.15s\n",
+	dev_info(dev->dev, "WA Firmware Version: %.10s, Build Time: %.15s",
 		 hdr->fw_ver, hdr->build_date);
 
 	ret = mt76_connac_mcu_send_ram_firmware(dev, hdr, fw->data, true);
@@ -3124,7 +3124,7 @@ int mt76_connac2_load_patch(struct mt76_dev *dev, const char *fw_name)
 	}
 
 	hdr = (const void *)fw->data;
-	dev_info(dev->dev, "HW/SW Version: 0x%x, Build Time: %.16s\n",
+	dev_info(dev->dev, "HW/SW Version: 0x%x, Build Time: %.16s",
 		 be32_to_cpu(hdr->hw_sw_ver), hdr->build_date);
 
 	for (i = 0; i < be32_to_cpu(hdr->desc.n_region); i++) {
-- 
2.51.0


