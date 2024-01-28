Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1694C46CD2
	for <linux-mediatek@archiver.kernel.org>; Sun, 28 Jan 2024 02:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JJ/tXyO7amkyPth0LbHgT/YZ0y8KfOoM1IDJtLvky2Q=; b=08PB1UHIRZNoZgiS4IdyY1zcrv
	VNt/MyrUd5/ZdyZ0cPh2MLnkRSnAStG2EmDgP3B+GwBsOyw8S0F1TMvjjv7WedQeieba91SrhlP7P
	XRUhsScxlbz3Pk5hXfbW0m30YDxaJWuTUCY7ZiUntOMikX6NTaM1/8If82oKb3UcRZOTZv1pZTZk/
	kE0fZIpF0HTjXvyVW+AELJlCN3I0T7/MhO6GhhiMCtij0tkxyUt6sf4PCV38jcZzGNgRIpJZL2NMc
	VxkrFrFel7+EtrRfz0HNaajea/XnshybuWGlG8abpd9xOi8wGwr/a3Y4Go7wCbqxS5RsXN2U5GDkj
	tZTTCEOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTuez-00000008ZSl-2QJX;
	Sun, 28 Jan 2024 02:12:37 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTuen-00000008ZNK-1BMH
	for linux-mediatek@lists.infradead.org;
	Sun, 28 Jan 2024 02:12:27 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-42a99f34cc8so2795271cf.2
        for <linux-mediatek@lists.infradead.org>; Sat, 27 Jan 2024 18:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706407942; x=1707012742; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JJ/tXyO7amkyPth0LbHgT/YZ0y8KfOoM1IDJtLvky2Q=;
        b=nMx8w1pMV9H3PhHIncCNqpQhQhY5TNp1Ms1IaawSVXWh54FvTpOcaJQH2IxxdLD/Zi
         M3kZfeeA/S5vGfMrXxIPjOSev6xLW3w90ES/qyLcvwArxODPF9J5N9MwovApAEyn9yrO
         bzZlKBVcpV5dyUrJOrKGYpDtIm/+XT2sNX0Ns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706407942; x=1707012742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JJ/tXyO7amkyPth0LbHgT/YZ0y8KfOoM1IDJtLvky2Q=;
        b=m/tyKi4NkAN+d/cvFlqTv1z1iYyJXkiLwFFPj+yv6Nt2IbgTM9SKepAzQvnDX3St3u
         HOf0FIOQqsdfQ1webaIxEuRbLC6OWBVqSOE0lXWHh4Z9w7Pe2yhCK1Kxk6Uq/MTB3rfO
         Py8t+oAqpQy7mE9uMtilQZfYkuhPEXyjLeNdeWJ3lCFy472eKIpYTM2pJYHo65Xagjcy
         7SPlNoCEyja3AhQhOKhJLNOhb83QnBPjx6G7vCeUUB/M81LJkeMJWiR2rmEhPqEt0rn8
         xXAW00QYpAOUt6sdeSf4A/pRvcWoBmq5K9DDioc79UDLjuJzgBwMjoOOtpupJJPLS8tq
         u1sg==
X-Gm-Message-State: AOJu0YwRYgeBJw59egTcxKh4n+DINHWSpil/ht7A1DQiMHyXFqu7ydJT
	3ky2XAQwS/0zpWE5HYMcxe7v5z7kSusXhk7kuODpRur/SFc4isRnL5lr2BLUmg==
X-Google-Smtp-Source: AGHT+IEEZr/G/RgBFCi06b4c43fIXB0Odt7evUICu34JTHlyZ3GvGTVQDDbpNKHMg99SUGIH+6qSbA==
X-Received: by 2002:a05:622a:49:b0:42a:8630:3dfd with SMTP id y9-20020a05622a004900b0042a86303dfdmr2871708qtw.87.1706407942502;
        Sat, 27 Jan 2024 18:12:22 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id ka23-20020a05622a441700b0042a98bf0117sm568061qtb.78.2024.01.27.18.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 18:12:21 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sun, 28 Jan 2024 02:12:20 +0000
Subject: [PATCH 1/3] media: pci: sta2x11: Fix Wcast-function-type-strict
 warnings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240128-fix-clang-warnings-v1-1-1d946013a421@chromium.org>
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
X-CRM114-CacheID: sfid-20240127_181225_387075_2385B9D1 
X-CRM114-Status: GOOD (  11.30  )
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
drivers/media/pci/sta2x11/sta2x11_vip.c:1057:6: warning: cast from 'irqreturn_t (*)(int, struct sta2x11_vip *)' (aka 'enum irqreturn (*)(int, struct sta2x11_vip *)') to 'irq_handler_t' (aka 'enum irqreturn (*)(int, void *)') converts to incompatible function type [-Wcast-function-type-strict]

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/sta2x11/sta2x11_vip.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/sta2x11/sta2x11_vip.c b/drivers/media/pci/sta2x11/sta2x11_vip.c
index e4cf9d63e926..0a3827575753 100644
--- a/drivers/media/pci/sta2x11/sta2x11_vip.c
+++ b/drivers/media/pci/sta2x11/sta2x11_vip.c
@@ -757,7 +757,7 @@ static const struct video_device video_dev_template = {
 /**
  * vip_irq - interrupt routine
  * @irq: Number of interrupt ( not used, correct number is assumed )
- * @vip: local data structure containing all information
+ * @data: local data structure containing all information
  *
  * check for both frame interrupts set ( top and bottom ).
  * check FIFO overflow, but limit number of log messages after open.
@@ -767,9 +767,10 @@ static const struct video_device video_dev_template = {
  *
  * IRQ_HANDLED, interrupt done.
  */
-static irqreturn_t vip_irq(int irq, struct sta2x11_vip *vip)
+static irqreturn_t vip_irq(int irq, void *data)
 {
 	unsigned int status;
+	struct sta2x11_vip *vip = data;
 
 	status = reg_read(vip, DVP_ITS);
 

-- 
2.43.0.429.g432eaa2c6b-goog


