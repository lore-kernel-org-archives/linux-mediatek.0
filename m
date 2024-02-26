Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD8FC5478C
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Feb 2024 17:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NPhOUUbGfyPt95d+thIFpKzftMVi7roAfhqv80cpO4Q=; b=jl1OMTa4iZFK2g
	Ey2qRPf7flf6XOLm339Hcd14Y2wF1skTlhvl4GW7YyK0hsucn1V7mk5PLSL5dAPyxQOA2G4cEENNk
	Kxa6wKL3cBldCHQQVuWOymAdfRJe7h7N8mDFkBL6tiFn3qgqCpLd4OnuH+GDI/QOhfRkg7Jxy2aME
	Ix17Kuhny5sXEea0VTiVi+vC4XaKD1YXDDt75uyNz9jCAYKesAOh1t4m2DW8hA1S9LwQp+LWI5WTi
	d4BNK1zhAs0q4ikT6Pduj+zhR6kJZy4DVi4H9LYzn3sKvesWr127NnG6PWXcrpI6znoFwyacpjcLB
	jZqj2lFja44306PVspKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reeqW-00000001zem-1MGD;
	Mon, 26 Feb 2024 17:32:56 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reeqQ-00000001zYa-3a32
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Feb 2024 17:32:54 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-787bb013422so230159285a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Feb 2024 09:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708968769; x=1709573569; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NPhOUUbGfyPt95d+thIFpKzftMVi7roAfhqv80cpO4Q=;
        b=OGKFiBGYRYRIXkuukrGwC44mJOxp5LZqCjrd0dG6R+H5q60K+lbWqiFBxWzgshmEkJ
         ae5VTlrkwDWMuP32sx48U7vvIMAq18aG62PSpLX8Io5R/ZfFXFDu+zBNfmk3MK6CljFr
         INTkcf3RYLb/dtVY4O5q2TZztebbtR1Uc+dOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708968769; x=1709573569;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NPhOUUbGfyPt95d+thIFpKzftMVi7roAfhqv80cpO4Q=;
        b=EnjwzcepcHz1d8O0Isbuwz0ZhFkZo8CDuhQr9w8xKe5vWfmeyg+pNhw5TWYKfxM9mT
         5qK9kJOY672wB733NYPS5opHX0RkqoHKaM8bXAcyIdJURhpekYlBvV99fTsV2k6o0SKC
         Gl+4eYq2FjHmJeg4L5rBSB8pTknmKDOiXgJOa0xTrAoMwPnUqJqfdLtfuDii6gzQB7rL
         IrBJ4PEunR6GU/CWz7HHUg63jKSGCcB+j+AevZdP0hmxBUIne4smaR1vXAeIUpk/KELE
         7SJAjspZalwLP0Q12EJZJUn1WwNnXv7bBqJoEY0r7nmBjC24ADp0oggaIX+E5+tdAJtI
         QPuw==
X-Forwarded-Encrypted: i=1; AJvYcCWBKCZqbLOjjPlyFMhzvJwyUo6eBKiXTmKMIZ03EBMJg2YuTurfwtfRRN72rvuPCPN+WwxV8cWlHh3qs5bCfMoOTmy2GUW1j24YUCJLgpkq6hLD
X-Gm-Message-State: AOJu0YzbMe2dlTRN85zBmzh8znxbKIBo7utajcmhEBjNjGZMHOhJMTjA
	Gsv8dnKowHJZnn/z7bGDNGrdjikip1Vq1XU4wxjio4p4OsgPTvZJf6M6RqzId59+Ln2aXREhEgo
	=
X-Google-Smtp-Source: AGHT+IHvLZz0JMsMLxrxZ5LeCz16I0q4crWk7ffwcs10kKwH096y5KdYOmJIsU/8SW+PQA+90LYoog==
X-Received: by 2002:a37:e113:0:b0:785:c9d1:8636 with SMTP id c19-20020a37e113000000b00785c9d18636mr6773215qkm.59.1708968768956;
        Mon, 26 Feb 2024 09:32:48 -0800 (PST)
Received: from denia.c.googlers.com (115.25.199.35.bc.googleusercontent.com. [35.199.25.115])
        by smtp.gmail.com with ESMTPSA id b11-20020a05620a04eb00b0078725d0345dsm2672669qkh.2.2024.02.26.09.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 09:32:48 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/3] media: Fix warnings building with LLVM=1
Date: Mon, 26 Feb 2024 17:32:43 +0000
Message-Id: <20240226-fix-clang-warnings-v2-0-fa1bc931d17e@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADvL3GUC/32NSw6CMBCGr0Jm7ZjO2KC48h6GRS0VJpHWTBU1h
 LtbOYDL73/OkINKyHCsZtAwSZYUC/CmAj+42AeUrjCwYWuID3iVN/pbcfDlNErsM9aeuGFj672
 /QCneNZTUOnpuCw+SH0k/68dEP/Xv3ERokLrG1oZ2zjKd/KBplOe4TdpDuyzLF1e5fQq3AAAA
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Mike Isely <isely@pobox.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-remoteproc@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_093250_942747_0E7CBA22 
X-CRM114-Status: UNSURE (   9.35  )
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
Changes in v2:
- Refactor media: mediatek patchset
- sta2x11: Fix Christmas tree order
- Link to v1: https://lore.kernel.org/r/20240128-fix-clang-warnings-v1-0-1d946013a421@chromium.org

---
Ricardo Ribalda (3):
      media: pci: sta2x11: Fix Wcast-function-type-strict warnings
      media: usb: pvrusb2: Fix Wcast-function-type-strict warnings
      media: mediatek: vcodedc: Fix Wcast-function-type-strict warnings

 drivers/media/pci/sta2x11/sta2x11_vip.c                      |  5 +++--
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c          | 12 ++++++------
 .../media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h    |  2 +-
 .../platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c      | 10 +---------
 drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c |  2 +-
 drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c |  2 +-
 drivers/media/usb/pvrusb2/pvrusb2-context.c                  |  5 +++--
 drivers/media/usb/pvrusb2/pvrusb2-dvb.c                      |  7 ++++---
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c                     |  7 ++++---
 drivers/remoteproc/mtk_scp.c                                 |  4 ++--
 include/linux/remoteproc/mtk_scp.h                           |  2 +-
 include/linux/rpmsg/mtk_rpmsg.h                              |  2 +-
 12 files changed, 28 insertions(+), 32 deletions(-)
---
base-commit: d206a76d7d2726f3b096037f2079ce0bd3ba329b
change-id: 20240128-fix-clang-warnings-6c12920467cb

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


