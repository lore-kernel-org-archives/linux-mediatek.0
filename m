Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFC2C46CD2
	for <linux-mediatek@archiver.kernel.org>; Sun, 28 Jan 2024 02:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Os4wPtYXMOk5j6YcX2wbCDq2BXooZiO0dAGB9kYAD7I=; b=d8g3XPzjxN7sy1
	ne+2Db1HzIQTpnhSjQPv2CpVmlnn+hq+cy07ar/0ZrLQ8VyvzLmPH08y7ai6iNYi+drWiszjwkRqi
	fMA8qTrqojCuJVI1Q6mk0QcQ/VxwUaX3pXgkQZTC06no2MWdENOb8/Eh+OY7N9uEsEDmGF9MfjvHI
	HTC+V3aHdXdJHwC5KbJ5HYqZvAal+EPZ2XF8MDYQBwf0RSWlyxW2rGBcQMqCgx/G7gsvWfIwxEWhZ
	7+BRnHoiz6+9Seb4lHqs30H1gtQEoSkIOIN8l8V4OWDDebTFHXAiVDDMpdK8iyR0KLEtIkJfyCB8M
	9RrOHSK2sZHHMK2scojA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTuer-00000008ZQW-0ZSp;
	Sun, 28 Jan 2024 02:12:29 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTuem-00000008ZNE-3lAg
	for linux-mediatek@lists.infradead.org;
	Sun, 28 Jan 2024 02:12:26 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-42a032cf012so17548291cf.1
        for <linux-mediatek@lists.infradead.org>; Sat, 27 Jan 2024 18:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706407941; x=1707012741; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Os4wPtYXMOk5j6YcX2wbCDq2BXooZiO0dAGB9kYAD7I=;
        b=ODkPQB97R1gahErOouVB8KtgcCKhlI4OYe44fOzl/JEJNzo5Xz35IRgN+Dz80hQmmH
         KmIvS5AdP1n4YU+PljH5/PqlJWClFVDlFP2LyJ5/SpbdkLxxNGdN33eaklfXiAI9CBQ0
         R9dz8od8wz6yhY4HqGWfYZ8eYCqskNBc6p8ck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706407941; x=1707012741;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Os4wPtYXMOk5j6YcX2wbCDq2BXooZiO0dAGB9kYAD7I=;
        b=EIveUZ1LqdGC19/2jy4XL60lEbb93iIKSHF5AohFrl5igBM550pzjzhI3ndQATqFlx
         oLSOVpgM5ihdFczvRwlZmTW+/0bKSuddQ0a6LFsdWjIbjc2TH4DCmkQBg3f8XO2EI13Z
         CrTnxvJqc22oVZRBk6OAfUczavakkOA1xcI/ilQYfBjU7hJCASk3gcEVEFNoYUzsz+6D
         AsNsm3Vm2MgKuxFOQWmEZcl8fX1SfbZO9wX4nugGWMIGHKccdFPZIQpMTEYHThbhBhjY
         i4DtfXiaD7BhN1bhMGcnSngQ8ULaSBb/3rDxLC+iM4O6+lJ9aktI4N0TAu+e7AI9zlUb
         yt6w==
X-Gm-Message-State: AOJu0YzoFj5p2EHNlB/i0+nvuxT+QxOnj621F2VBewbXcf7vHfuTHPSy
	JEbqtJ7FoHQwR1nyJHo72Rx2523vnKL+BjSFBh8oo6LLBx/6cZ29/0ov8RYgLw==
X-Google-Smtp-Source: AGHT+IH6NXk/WvjaiaDj9r8/fahbRrGy45ANWovc96JmRb+SX77746RDy8yuddFdapSADOOCEgbhNQ==
X-Received: by 2002:ac8:5e0c:0:b0:42a:2ec3:e8d2 with SMTP id h12-20020ac85e0c000000b0042a2ec3e8d2mr3154130qtx.50.1706407941471;
        Sat, 27 Jan 2024 18:12:21 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id ka23-20020a05622a441700b0042a98bf0117sm568061qtb.78.2024.01.27.18.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 18:12:21 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/3] media: Fix warnings building with LLVM=1
Date: Sun, 28 Jan 2024 02:12:19 +0000
Message-Id: <20240128-fix-clang-warnings-v1-0-1d946013a421@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAO4tWUC/x2MSwqAMAwFryJZG2iD+LuKuNAaa0CqtKBC8e4Gl
 8ObNxkSR+EEfZEh8iVJjqBgywLcNgXPKIsykKHKWGpxlQfdrgveUwwSfMLaWerIVHXjZtDjGVm
 tPzqM7/sBzrWH3GQAAAA=
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Mike Isely <isely@pobox.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240127_181224_997918_C80A794E 
X-CRM114-Status: UNSURE (   6.87  )
X-CRM114-Notice: Please train this message.
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

LLVM does check -Wcast-function-type-sctrict, which is triggered in a
couple of places in the media subsystem.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (3):
      media: pci: sta2x11: Fix Wcast-function-type-strict warnings
      media: usb: pvrusb2: Fix Wcast-function-type-strict warnings
      media: mediatek: vcodedc: Fix Wcast-function-type-strict warnings

 drivers/media/pci/sta2x11/sta2x11_vip.c                           | 5 +++--
 drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c | 6 ++++--
 drivers/media/usb/pvrusb2/pvrusb2-context.c                       | 5 +++--
 drivers/media/usb/pvrusb2/pvrusb2-dvb.c                           | 7 ++++---
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c                          | 7 ++++---
 5 files changed, 18 insertions(+), 12 deletions(-)
---
base-commit: 615d300648869c774bd1fe54b4627bb0c20faed4
change-id: 20240128-fix-clang-warnings-6c12920467cb

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


