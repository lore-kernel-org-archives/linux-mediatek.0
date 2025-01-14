Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3DFE77188
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jan 2025 20:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wz3rX4Je09/J+8Ei/25Zrj8Kfz/o7SKbn92nTSq0sP4=; b=niHeTZznCqctGw5QBm6IEF6Alr
	zZAY47wvUk6+la7SJTnZ26XsyzGBHC2Qt1U221iMebA656YuHHxvJpANFBwqOcdXE97tW4e+kACDW
	B+HRuduTGfeRWP7p4NgMED6LNeTFyO2p3PkmdL5Ik8lP6/am4wFT8Xx9Gujv0urBOAuRUF7AzJWeb
	EUQ08gu4WgF54ONE0WUR2YsQnCOILKGqF7VrVTjUmo3sWLki0rKcJ1LuvAUq9HPAi+8VkLMocJu0c
	T/08vAoUs6y7RuVYHHamZxuCO5ur4yBY0arxhvIXjWNuwTgLFg8EshMoV2/rLUDqP3CFQQMTkX+eM
	daJjjrug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnC9-00000009d9U-0PPr;
	Tue, 14 Jan 2025 20:07:25 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnC7-00000009d8d-1ApL
	for linux-mediatek@lists.infradead.org;
	Tue, 14 Jan 2025 20:07:24 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-434f398a171so6400625e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 14 Jan 2025 12:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736885242; x=1737490042; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wz3rX4Je09/J+8Ei/25Zrj8Kfz/o7SKbn92nTSq0sP4=;
        b=dUnERelxGhzoL6Hkoi0mL2Ixpew4MfznbzPMmSDX7HWZAd9TSdFcCROJzkEOM3PLIK
         YmSkn3TFtOGoOJ0eoIkHSI/LhgAo/gRMIkdm7SmfBM3z0qdEdyNr+6Cl0/km/0dn037N
         vRP8gP2T+Fx7lzeECVB21aLSVDR/TNsD9HCazsMvueOjVT/Ty6DMJR9hYl16kxO25zAu
         NQga7HCPmIWu9g5T8sXlGeENAnp7lSZ/vW2aSNV/uH29Pp/LYZnwHPSHz4flboBMkfxe
         hRwnObPRmQWkdSoyY2lgwmLyAVJav9asptIoZ8SfbWku+r2RsZOl/kCMbU1b3tTgd7BH
         OsGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736885242; x=1737490042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wz3rX4Je09/J+8Ei/25Zrj8Kfz/o7SKbn92nTSq0sP4=;
        b=a82iwDFymCPJyYJHP9VkzZER+cmVPsGnn872MylXcsr71Hq8exKWwHCpoTTJt6pWqE
         2oQpXorxXrhC0TJ3v3wkoXGobj8rgfWAK0i3su0CzaYXtAPyEATJICQOJLR5SPL6zBb3
         ApqBzkDIvsrNG5yapa6k3ECcPcgO+ghzfp739kRG7KtzPlkPFYJweho3p9kkFumFedaC
         S5YfyvNW2qTHPEvWEu3M5EQ2TwkHyh7mZuxqfAsBQDZtZz6trhjMwQKj6a3/jpo4rBct
         Fn6IBiJQQyDroArG+TPxxbBDJxDN151w+bnVbP6oDsuzaJeRcdiCEfpArZ6Oh0dW18tx
         a9SQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5xWrMBd4R/vB5JyuLMVavHmkcpwDKaj6XegR6QPzW9dhMwhEmNv+Hd/IA3Jb/0XrREKCetdw3xv0SaUxJcg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+xf54Tu7vr2Ef8ch8ceifw3dv+WPAoPjEDiFqIdbrHXnKm7Jj
	71GV7JV7CYagdbf/k9kA27/3HJQujH1Bnzyc3PIf8UgNPdRe5iqN7ER+/Yo/mpI=
X-Gm-Gg: ASbGnctupMA3bpnsbuaqjPRz6g6QLX3/TnlIiX3IlNkMyQ0Re2kjK5gqBlqI8A+PrH0
	DwB1Ceu/B5vH55VRkVLRiCJDACB3+J0GN5cJpOZo8KlpTdSKgZj7ZsHJvG4z3akzl8T9rydVRcN
	jTLFFCfzOPCmqN3MPJtBNKepTdj9VRYqdOXEkgeKxrzWJ4dDaxWMIZUKUxgLOxucyDp/ks8NWCK
	OrnEEN5v0hv+pJggmUmaDwsigkbSHxwGO76zbltiA+8DjJq4Y09IejFdlkOuL8anSQMtRk=
X-Google-Smtp-Source: AGHT+IE7Jj8lfNs/6Mawrj444oeAra8QM8Y3meAjqJpf/75OfBxvuzPW0rWmRWiybb+fzK9QvFi5qA==
X-Received: by 2002:adf:b60c:0:b0:385:df73:2f43 with SMTP id ffacd0b85a97d-38a872c8972mr6632398f8f.2.1736885241685;
        Tue, 14 Jan 2025 12:07:21 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9df958dsm185199475e9.17.2025.01.14.12.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 12:07:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Peter Wang <peter.wang@mediatek.com>,
	Stanley Jhu <chu.stanley@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ufs: Use str_enable_disable-like helpers
Date: Tue, 14 Jan 2025 21:07:16 +0100
Message-ID: <20250114200716.969457-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_120723_316370_1FA41498 
X-CRM114-Status: GOOD (  10.63  )
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

Replace ternary (condition ? "enable" : "disable") syntax with helpers
from string_choices.h because:
1. Simple function call with one argument is easier to read.  Ternary
   operator has three arguments and with wrapping might lead to quite
   long code.
2. Is slightly shorter thus also easier to read.
3. It brings uniformity in the text - same string.
4. Allows deduping by the linker, which results in a smaller binary
   file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/ufs/core/ufshcd.c       | 11 ++++++-----
 drivers/ufs/host/ufs-mediatek.c |  7 +++----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 27154a5dcb7b..5225d48a47f8 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -23,6 +23,7 @@
 #include <linux/pm_opp.h>
 #include <linux/regulator/consumer.h>
 #include <linux/sched/clock.h>
+#include <linux/string_choices.h>
 #include <linux/iopoll.h>
 #include <scsi/scsi_cmnd.h>
 #include <scsi/scsi_dbg.h>
@@ -1187,7 +1188,7 @@ static int ufshcd_scale_clks(struct ufs_hba *hba, unsigned long freq,
 
 out:
 	trace_ufshcd_profile_clk_scaling(dev_name(hba->dev),
-			(scale_up ? "up" : "down"),
+			str_up_down(scale_up),
 			ktime_to_us(ktime_sub(ktime_get(), start)), ret);
 	return ret;
 }
@@ -1549,7 +1550,7 @@ static int ufshcd_devfreq_target(struct device *dev,
 		hba->clk_scaling.target_freq = *freq;
 
 	trace_ufshcd_profile_clk_scaling(dev_name(hba->dev),
-		(scale_up ? "up" : "down"),
+		str_up_down(scale_up),
 		ktime_to_us(ktime_sub(ktime_get(), start)), ret);
 
 out:
@@ -6026,7 +6027,7 @@ int ufshcd_wb_toggle(struct ufs_hba *hba, bool enable)
 
 	hba->dev_info.wb_enabled = enable;
 	dev_dbg(hba->dev, "%s: Write Booster %s\n",
-			__func__, enable ? "enabled" : "disabled");
+			__func__, str_enabled_disabled(enable));
 
 	return ret;
 }
@@ -6044,7 +6045,7 @@ static void ufshcd_wb_toggle_buf_flush_during_h8(struct ufs_hba *hba,
 		return;
 	}
 	dev_dbg(hba->dev, "%s: WB-Buf Flush during H8 %s\n",
-			__func__, enable ? "enabled" : "disabled");
+			__func__, str_enabled_disabled(enable));
 }
 
 int ufshcd_wb_toggle_buf_flush(struct ufs_hba *hba, bool enable)
@@ -6064,7 +6065,7 @@ int ufshcd_wb_toggle_buf_flush(struct ufs_hba *hba, bool enable)
 
 	hba->dev_info.wb_buf_flush_enabled = enable;
 	dev_dbg(hba->dev, "%s: WB-Buf Flush %s\n",
-			__func__, enable ? "enabled" : "disabled");
+			__func__, str_enabled_disabled(enable));
 
 	return ret;
 }
diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 135cd78109e2..a7804fe387e9 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -19,6 +19,7 @@
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
+#include <linux/string_choices.h>
 
 #include <ufs/ufshcd.h>
 #include "ufshcd-pltfrm.h"
@@ -480,10 +481,8 @@ static int ufs_mtk_mphy_power_on(struct ufs_hba *hba, bool on)
 	}
 out:
 	if (ret) {
-		dev_info(hba->dev,
-			 "failed to %s va09: %d\n",
-			 on ? "enable" : "disable",
-			 ret);
+		dev_info(hba->dev, "failed to %s va09: %d\n",
+			 str_enable_disable(on), ret);
 	} else {
 		host->mphy_powered_on = on;
 	}
-- 
2.43.0


