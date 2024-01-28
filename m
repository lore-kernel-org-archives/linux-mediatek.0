Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13699C47DDB
	for <linux-mediatek@archiver.kernel.org>; Sun, 28 Jan 2024 02:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j3C7WQBZgNLZ3JFZZb+3FA3visUd8j+r0zGWZyg3Ybg=; b=Lnyemfoat+zXHyeTgg/A7LOW35
	SgSV7UIwyEa4HdBFAMv+shymKE9+uizwqUUIdupEygvJNxcXuHd66JIQzo/S73t8lxb1C91gdZDIo
	ytVhJK1NkXfHg/v3vDeFsoENEIeTFA9CupOuTVgM45cn7SFQGNzS0UU/8EdS7UlPzX80lG4m9PK6l
	Cn3SRrn+EXkNcUQZxZmWzvmKeX7PsU0cY7OhE+UErAvYI6r8CA/RFfLVNrFd9Yv6s+cqX6y/byN7a
	KNGjHZoPCfJ9MvAI2PUG5N3QKiIznBjTkueGXFRPzfLz4XHgUabpnIJC/BNl13rlq4fcnbyb1OIMq
	/D9f9nXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTuf0-00000008ZTV-27eW;
	Sun, 28 Jan 2024 02:12:38 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTuen-00000008ZNr-2g8j
	for linux-mediatek@lists.infradead.org;
	Sun, 28 Jan 2024 02:12:27 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-42a8be32041so11059911cf.1
        for <linux-mediatek@lists.infradead.org>; Sat, 27 Jan 2024 18:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706407945; x=1707012745; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j3C7WQBZgNLZ3JFZZb+3FA3visUd8j+r0zGWZyg3Ybg=;
        b=f//2QNbxvezrS9cvKJBN2G3vCcvW/rCMO30F2ktXn3im7NTwKnuqSOJO6t+XokBwNM
         tqyHk0r0GvE6gjNxqhN3R/095NFVLngOQu7rM6qYRm7oiEWJGUqyxE8hagFwtJyhRW1L
         Bkgef5kya0hdtqZLz/F6hOaA6tG2ZdsAUNQsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706407945; x=1707012745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3C7WQBZgNLZ3JFZZb+3FA3visUd8j+r0zGWZyg3Ybg=;
        b=Ez/18kbtvEezW0cOdwFkMwPvzxckf6iibGTu623AmEXXdg3mx2E0DBUTHJVQnmuxGA
         sBz2tPq0X2JhoEyik+DLXGj1b1GuVvYk1XwiNETy+gSmHnzglO1yT2w8OcP6Dxq3/h6T
         0opHhkPk8UDiJ97kpRQid+PVlh7aMzo23jQ7R2UMZjEyl2M/MO2DLNtHk5nB2GZB7H3U
         j2zUBAUi51TvSlsSxUQ88Qsbip77jM3VAvda5DcTrReaodFbmJ78lHG1eBPNNU2c8L/a
         dDUgYZnFEXwhkSMG12y+kUylIIyg6w9jnK0IbkIIVjJNMz39O7mrU2rEw7uOb3VeP/s4
         QFlw==
X-Gm-Message-State: AOJu0YynpJMVxGTWsRwGwH9m+CiBqBfTU0nDTvZ/tolS/9OiN13hzyJ7
	syeS6TRAxOZ5zAKT2EzWKLvhrBaGdjByHOGkvunnTm+7fRmtA6Ky7dFMxqXWpQ==
X-Google-Smtp-Source: AGHT+IFQh4FaJ+1XI2IdQ76ww3xRTWTulNHZ3WBhfnSPiasZomtas55CswgU5xylWxHtrHsOrzM/jg==
X-Received: by 2002:ac8:4e96:0:b0:42a:87ff:4b0a with SMTP id 22-20020ac84e96000000b0042a87ff4b0amr4978445qtp.99.1706407944870;
        Sat, 27 Jan 2024 18:12:24 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id ka23-20020a05622a441700b0042a98bf0117sm568061qtb.78.2024.01.27.18.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 18:12:24 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sun, 28 Jan 2024 02:12:22 +0000
Subject: [PATCH 3/3] media: mediatek: vcodedc: Fix
 Wcast-function-type-strict warnings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240128-fix-clang-warnings-v1-3-1d946013a421@chromium.org>
References: <20240128-fix-clang-warnings-v1-0-1d946013a421@chromium.org>
In-Reply-To: <20240128-fix-clang-warnings-v1-0-1d946013a421@chromium.org>
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
X-CRM114-CacheID: sfid-20240127_181225_733473_2B017040 
X-CRM114-Status: GOOD (  12.38  )
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

Building with LLVM=1 throws the following warning:
drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c:38:32: warning: cast from 'mtk_vcodec_ipi_handler' (aka 'void (*)(void *, unsigned int, void *)') to 'ipi_handler_t' (aka 'void (*)(const void *, unsigned int, void *)') converts to incompatible function type [-Wcast-function-type-strict]

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
index 9f6e4b59455d..781a0359afdc 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
@@ -33,9 +33,11 @@ static int mtk_vcodec_vpu_set_ipi_register(struct mtk_vcodec_fw *fw, int id,
 	 * The handler we receive takes a void * as its first argument. We
 	 * cannot change this because it needs to be passed down to the rproc
 	 * subsystem when SCP is used. VPU takes a const argument, which is
-	 * more constrained, so the conversion below is safe.
+	 * more constrained, so the conversion below is safe. We use the void
+	 * casting, to convince clang with -Wcast-function-type-sctrict that
+	 * this is safe.
 	 */
-	ipi_handler_t handler_const = (ipi_handler_t)handler;
+	ipi_handler_t handler_const = (ipi_handler_t)((void *)handler);
 
 	return vpu_ipi_register(fw->pdev, id, handler_const, name, priv);
 }

-- 
2.43.0.429.g432eaa2c6b-goog


