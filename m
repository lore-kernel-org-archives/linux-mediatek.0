Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0FDCD4840
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2026 18:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3KPa8QyM9bQ6Pp4HnS5gcPVJlkMa0m2NZAhl2yAgpxw=; b=XHlGL3WqiMuFmL83Dv6ng4bjZx
	nBvMYDrNeBa+8Q2K/0XqboejI52F+nhZ9+iuBg+BzE/yGmityADjFY6C2hM7BCJjExY8q9utXxj1b
	bpcCqlQ0hRCXqyAWEn7BOLtV2RaTF71RZkYnHONwfc0LxAEY8UC/gv4IimUcVooVYhdPqqsl0uiZR
	bv5oSoaPKa2Fb0MTe4s84mEp16L1fAcOsaO0TNGoiFTFAKhO4Oi2ejSC5W7uQ0RU2FVrvLCw5SLlx
	gSUDDmTC67hHUZVfZW5ZU7yFXpX5EdplY4bxw3NvVGC9DNbw1wK3a2Rv527f76/3ELq4EZLICnd1Z
	6apN8Vpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMVOi-0000000EVy1-0Jc3;
	Mon, 11 May 2026 18:30:32 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMVOf-0000000EVwu-3I7g
	for linux-mediatek@lists.infradead.org;
	Mon, 11 May 2026 18:30:31 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8353c9f24d2so2433779b3a.3
        for <linux-mediatek@lists.infradead.org>; Mon, 11 May 2026 11:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778524229; x=1779129029; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3KPa8QyM9bQ6Pp4HnS5gcPVJlkMa0m2NZAhl2yAgpxw=;
        b=NWguQQomQwIs7Z97ehnPA7gp12tVQCyaY+0hhwrd0Lb84UNpITzvuwk/b8vKy+7Ldd
         NistUwdgGcq56mGMeO75kpBJ2Ks4reRdmxcThszNMzQ1M/a+P5IaRzA223eZwZQyQ4d/
         ZCn01cOxjUNCh/K2QCVlew0rIaBalY00+I6ZbmIIzz+BvnUQBj56t4P7mE3Hiz/POWBH
         LEOpiJWGI6eBuBTwjywTmYAS57+4E6rXpfSPpTkMfiDguzyh1nW4GE51VdlDERMkKPiX
         /DSwpzkylMznSv6PiQ93N67oK+jzsRSEJqxA88jbPobUA1p/3VeFjWlwIEzFUXQbV8ei
         RkAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778524229; x=1779129029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KPa8QyM9bQ6Pp4HnS5gcPVJlkMa0m2NZAhl2yAgpxw=;
        b=a7lhprSZIoJvcZzbC9lWetQtkhvORup7OC5RFL3WT+GqNK+Jc8VaylFVzlMPCkiUhQ
         5tM3gDjv9xH2CJ0VTeOgQOJewjJDY9LalI2at4n4xkawDEzsPau0RCsrI14eKzPDt3a0
         1n/rbvUlXCl0CMzRSTZE6DATXcPevHRHXve7uxehyM7WGrGvd5djgPEa/DVNVbNe+hA1
         JwpQ8NN8asgy0nroIsxDWbjo6A5eBevVQDcgXIgJgqggnDHyd6Aj9XvVJt1SlYqH+wV0
         bA2bh+S+xPG0SCKDiuZdM3wVNC2A8sDTZ/WkW5ECx4AwvLjBe6bvLUDHsrlwgVfAH+aK
         TrDg==
X-Gm-Message-State: AOJu0Yy8PG2uvEYdDqjwtlNDNMgyVOTzAeFarqzRD82+69pP4c5poQOv
	ibVQ2QPh3mDrIY2WorWHOoZofgR9xT3FoVPt5PFUV1rveBELHSopx6ca
X-Gm-Gg: Acq92OEcj9tENd/xjVxvfX2wL1dmltmdZT6R8zyUaawMBmElkZGl2i9u1YEcFyQbZqi
	pTqinYSeOKbnIk64mBQpdXti+ON6wUIrZSK4DgFEY0wS/nM1pUrD0aSKEx0jUr/SZdjmZoqyf3g
	W7mooLom6UUoHEX+C10m8sSd8FhUxYZpedUlpZ90V7rXhWAyJuArfw3mv26+vcdCVQD0kcWJTS1
	A9ppGFKs0OxdkO3CWpexKLLBvvlzTskxjLaQDCzvwiKdXEDR4zQNEInTmnNh9rS5uU72szQ1bny
	V5Gl0qNSAsf6kuIBSMVTIlHC31vPyxLXrAnAJn7+WA2AYmoyN9MR3/Rnp9hx24UIZXFj1GiBRz1
	AWzLheL1DNFVk+BK1BNWenNotDFLzH6+lxr3VRaAlABZZBaF4Nti1MrCC8WHU5P2CKrO+iI19jH
	wK3W9SYg0QAOdm4uCaPcJKZQfQaQ/7UNInCTo+
X-Received: by 2002:a05:6a00:310:b0:83d:446c:2a8c with SMTP id d2e1a72fcca58-83d446c2bb6mr10520686b3a.25.1778524228880;
        Mon, 11 May 2026 11:30:28 -0700 (PDT)
Received: from Strong10mede.domain.name ([122.161.50.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965d35b3bsm19515723b3a.24.2026.05.11.11.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 11:30:28 -0700 (PDT)
From: Mayur Kumar <kmayur809@gmail.com>
To: sean.wang@kernel.org,
	linusw@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Mayur Kumar <kmayur809@gmail.com>
Subject: [PATCH 3/3] pinctrl: mediatek: fix SPDX comment style in header
Date: Tue, 12 May 2026 00:00:17 +0530
Message-Id: <20260511183017.228595-1-kmayur809@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_113029_824538_87FE8C21 
X-CRM114-Status: GOOD (  10.16  )
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

Header files should use the C-style '/*' block comment for SPDX
license identifiers. Correct the style in pinctrl-mtk-mt8365.h
to satisfy checkpatch requirements.

Signed-off-by: Mayur Kumar <kmayur809@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8365.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt8365.h b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8365.h
index 39e17532c46..fc22f412bd7 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-mt8365.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8365.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (C) 2018 MediaTek Inc.
  * Author: Zhiyong Tao <zhiyong.tao@mediatek.com>
-- 
2.34.1


