Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E675C0219B
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Feb 2025 00:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mZNbqOyLMkR4zYGETdYI1Ds8jvtDMMy7KcjMP1dhBIk=; b=v3xQ/rQW/f/h6xq5Y8K/YT4sRR
	+Of9IxOuMx5f2lCsPJu0b8vqUQEyQCqFrDLCUJWSTzz4JssqLHUaHGNl+5QdGQueoGAI8v6HUAhLo
	M7wSMyVdN88Ba6x4eGbrmjMIwUzFrO+r6lfw3ZlghjJN2lcnQG494tqqYEHr15EbkNRFp0N6TkKWF
	7/XCGqlOyS26XSVOksXTc5ExrkIfQ2xGlnMuvEjpNuLDXynqoxOCg2QMAWnfRJf2P8HNo0kpvUw2T
	5lEoMFolOPWYQABWJK1zIQ0vTOnr6140my6njT32YSa2c/Ol++ucuLu1khJiN+gu+AZt9VYc+PRhg
	Yu6H+Qqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti0ii-00000005iIl-0jzD;
	Wed, 12 Feb 2025 00:35:16 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti0if-00000005iHw-3GT5
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Feb 2025 00:35:15 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-21f61b01630so4492665ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Feb 2025 16:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739320512; x=1739925312; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mZNbqOyLMkR4zYGETdYI1Ds8jvtDMMy7KcjMP1dhBIk=;
        b=HbGAoPUO23vRKKxTm5aJOhwXS2KAu9zqDJ2Nhorq9xcefiWLuT8XfWtnDeOR3PYcRK
         kLPAJnmHc/ZI94D8kDq+hZYX1s8FM84rcpSQxThYhlVhY9RJoknTg5jtTCbUySqDbBuU
         WcMVUktBGRw/ldU5rrA+Y8+L14F5fpqnWCyLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739320512; x=1739925312;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mZNbqOyLMkR4zYGETdYI1Ds8jvtDMMy7KcjMP1dhBIk=;
        b=HaUWUlaVAvGokSpcAP0arEumJ/VyeoL1DA+2/Kj6HXeSwigRUEQ28/gC8rUe+Q9hjF
         X0KceQB3+dG7nYTVTzjOqmi4VDINeuSHXZe/MQdAKwRBNgAy7497f1WMnYAhCh3btfIC
         QmQ9nHPVpZou13yfh9SricB86ojIC9C5FpP3TYVb1xI4734wGAb89QeQj6Ta2n6ITEyX
         0jffre9ADp57m8mO0xZmcTgS/mSFV+Ng4kCA6r1+hsUBqjrQWtCxpMbGPpJMTteD4CCQ
         rgV4PFuXlCZZhGjYOjoT2bv7Bi+roZ/VnqCaGA75ZfedfM8I+GzMlGcINuiIsGEbagkp
         KChg==
X-Gm-Message-State: AOJu0YwMViPiFfNndGJZmZaCJGv+mN3I045eZkFjrVghO+Y7VTP6hyf1
	yG5u//q1VPBE32/XeQamoRjG55Kp64YZ2jOPz4ZQSdDLVhx07lyC7n5xS97sFA==
X-Gm-Gg: ASbGncvG8/aNELAiWNehi5XXaNmzfHcyWH6oU9q4zjDUOebUqRz/ieJZmsbjEBN8NF7
	7xJBlPfwC4fCNMM3pNKepNbI6oCiDZyiM7Z4YWKU137vDc7QU5mHQFcHgQiBfQRkN2lcquHxqka
	OE4w4NRRfW0c/KJJaY/2d902X4XWdGRzoEuVc1+2Y+4h4Rl1se5eugDqUU/OuXatFhT1Xxkse4N
	sfOOURIZ/PePuQcKTe4rYXeGUWoYXg5rgP0byhx9IXKkMnT3gxB43+SZY9BQs/0ptumKzX4Ym+D
	dxdG6nrYnBNczYi4jiuRigop9p5DcVnky85YpmjhRw+YFY5Fi7ufKDZJkqVtJMCeiyuAkyO+
X-Google-Smtp-Source: AGHT+IGU2vBf6I17uMlZ6vPzIppLSPDMm3Mc2t33rkKE8ywv2pPmz0SDcC2eFj6qRDS96L9Z49Rppg==
X-Received: by 2002:a17:90b:510a:b0:2fa:2c61:3e5a with SMTP id 98e67ed59e1d1-2faa0913af0mr8652088a91.10.1739320512530;
        Tue, 11 Feb 2025 16:35:12 -0800 (PST)
Received: from nhebert9.pdx.corp.google.com ([2a00:79e0:2e13:6:34c2:323:b5a8:3074])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf999b639sm165958a91.38.2025.02.11.16.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 16:35:12 -0800 (PST)
From: Nathan Hebert <nhebert@chromium.org>
Date: Tue, 11 Feb 2025 16:34:51 -0800
Subject: [PATCH] media: mediatek: vcodec: Enable HEVC main still picture
 decode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-enable_hevc_still_picture-v1-1-0c06c0c9add2@chromium.org>
X-B4-Tracking: v=1; b=H4sIAKrsq2cC/x3MWwqDMBBG4a3IPDeQjHihWxEJJv7qQEglsVIQ9
 27o4/dwzkUZSZDpXV2UcEqWTywwr4r8NsUVSuZiYs2NZmMU4uQC7IbT23xICHYXf3wTFLeubuB
 0z52m0u8Ji/z+72G87wcNGPdLawAAAA==
To: Yunfei Dong <yunfei.dong@mediatek.com>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Nathan Hebert <nhebert@chromium.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_163513_997675_BA2475C0 
X-CRM114-Status: GOOD (  11.12  )
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

Mediatek devices that support HEVC also support the main still picture
profile, but today, the main still picture profile is excluded.

This removes the skip mask for HEVC, and enables the main still
picture profile decoding.

Signed-off-by: Nathan Hebert <nhebert@chromium.org>
---
On Mediatek devices that support HEVC decoding, HEVC Main Still Picture
profile is also supported by the SOC and firmware. However, this
capability is turned off in the vcodec driver.

This removes the code that disables HEVC Main Still Picture profile
decoding. Validation of the decoder has been done via V4L2-backed
Android CTS tests on an MT8196 device.
---
 .../media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c   | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index afa224da0f41..d873159b9b30 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -152,8 +152,6 @@ static const struct mtk_stateless_control mtk_stateless_controls[] = {
 			.id = V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
 			.def = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
 			.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
-			.menu_skip_mask =
-				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
 		},
 		.codec_type = V4L2_PIX_FMT_HEVC_SLICE,
 	},

---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20250211-enable_hevc_still_picture-26b35eb08270

Best regards,
-- 
Nathan Hebert <nhebert@chromium.org>


