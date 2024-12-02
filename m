Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C564D7832F
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2024 15:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QNctqgbgKX4M7vIwY0GeY040xXoP0R2au1vBq2qCPD0=; b=bvs2OeIMYnr7nY
	XfCnwaD0ZSBtv8Fsf6AJEcjLwA7arUHil3PjjzwLlhZA6a/UQ/Ydo16DL+EIGMgEta4wcjdSDHZnt
	hfH5M+gzzRKuUMFWmo+JvpC7mxYcWeVclSilOPy4pGULJH5hpAQ5p7XGuDTQtczvG201lApeuNWSz
	SjKGcJIgYUoM8zmHO8pKHDOMi2uPhDmbgP4fn7ac28/fil0H/P2uNoR3gZTcaGPQSeAeFkbcxzP3J
	df9JCLG+k4RNV/SSGrMytlIP/vsklvrz5cpxwpHaeQfPLWG0vnwMBybpFc1JLybSrgBrXz7EYl1rT
	i6TjL07+yCnbY2eseyCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8hP-00000006jBl-2oqH;
	Mon, 02 Dec 2024 15:50:59 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8ds-00000006iId-1dtq
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Dec 2024 15:47:21 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3ea5f158138so1975999b6e.0
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Dec 2024 07:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733154439; x=1733759239; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QNctqgbgKX4M7vIwY0GeY040xXoP0R2au1vBq2qCPD0=;
        b=JNOov6zfNcxIwxL7L5/rzzMJX3zhjnkUz4jqOVV0wnofcSa/7zr/ozKwa6dXrvPlZv
         hGbmIpe6Hg6AoXX1fJqG2f0EZCBuEytsbC+GR8eFIGRSUCXTwTl7M/m3hxRscwuTrktB
         LuXhFXEHUPZGlG4abCV/b7qTyY7dAva4q8cGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733154439; x=1733759239;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QNctqgbgKX4M7vIwY0GeY040xXoP0R2au1vBq2qCPD0=;
        b=f31HOtrRl/OebYzns6gfAqbtzUH8ClsKgcG1jOsm+91y6J+YtMdNNA6AC1l9ctjpJk
         OQlILoHU2XGRljI76d7ikc2YdyCurtXRGoq/32wromLkzyN6rbU0f5xMa2/Qa4M3ARWn
         T0riqf6KLirSVG2UpKwSOfYr7qc0Ld8KmfkYUo6F1BIec9y0J4+O12MEqAdjXUPk4FPg
         3xXBvfqFcrkwMOQsvR65I9Ijn/Kj9lujt3/ggdbkMAerC1vsAQEpbt331t9bAgqZatp9
         UD2h9vziv4udwVEIt2WRKs+h7s1zftDDjQC7tJTBhklmsKvIonhTrkDksoN5gC6Hw+gy
         ty9A==
X-Forwarded-Encrypted: i=1; AJvYcCWkNSaliupzmT5oRcsUPxxYEzaNMHuojKWE1BuZ4MNhAPPpFAIPOxlNbo9/1DgFLIDIjkmaFcKV6sfpXJ6LCg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRCvUfhkt9mCXTxDSKxbdjw+7D1+C+tjGqodzzfeL94U62rHtm
	bkDDj4GUwDbPRfrPnt4cUa9t8q7e7+a96xWnxv71hKBhIGnJNrgEGb9e5UWCaw==
X-Gm-Gg: ASbGncs+5JPGLBiT8DCOIfZwR6m0Gg1pxRFwbYwsVRnrgnAJF4dGSANotGd/DAyUxSL
	O5Le08TcPpizyGQytjUhODlukhzZ+gp1+LiG6H23FfW6EpmsdbOMclxkE+kEcABr3YUpGPY1xg5
	zviPDzao0zxgW48CmJXAB9x7jOFBY3YxZwX9XhSrT9ftgRcrQl1JKq9H1ZmZacEc1JT5FHTL3uM
	s7/J3S6nKEOII0HD+YgeI8ETyfG+XcWdtt+TZHUmalgYFwQJ9B4cnyZTRe++hVuYwmfkUqTDF5A
	P7O9VS34w1DqRw8StvgTVBic
X-Google-Smtp-Source: AGHT+IH/7hpTfNse9nN9Jr+DgfzObAaRxU/S7oa2RXexy0e4f94BDSUNP4uGp0FObZdTBwMHoHxTgQ==
X-Received: by 2002:a05:6808:1589:b0:3e6:2471:4d10 with SMTP id 5614622812f47-3ea6dbd43f1mr21613568b6e.11.1733154438947;
        Mon, 02 Dec 2024 07:47:18 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5156d0f8ad6sm1159729e0c.49.2024.12.02.07.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 07:47:17 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/3] media: Fix warnings with llvm9
Date: Mon, 02 Dec 2024 15:47:14 +0000
Message-Id: <20241202-fix-llvm9-v1-0-2a50f5acfd0b@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIPWTWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDIKGbllmhm5NTlmupa5JskWJuYJpsmWqcqgRUX1CUCpQEmxUdW1sLAOK
 puwFbAAAA
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-staging@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_074720_431958_EAC42E10 
X-CRM114-Status: UNSURE (   7.61  )
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

When we tried to build media with llvm we got some new warnings, lets
try to fix them before llvm is part of our CI.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (3):
      media: cx231xx: Convert enum into a define
      media: atomisp: Use the actual value of the enum instead of the enum
      media: mediatek: vcodec: Workaround a compiler warning

 .../mediatek/vcodec/encoder/venc/venc_h264_if.c        |  6 ++++--
 drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h            | 18 +++++++-----------
 .../media/atomisp/pci/hive_isp_css_common/irq_global.h |  2 +-
 3 files changed, 12 insertions(+), 14 deletions(-)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241202-fix-llvm9-4c8d705c9e3e

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


