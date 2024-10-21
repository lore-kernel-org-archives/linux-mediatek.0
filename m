Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18ECED15DA0
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 14:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fkaTmiyWUTvag4SMcJC0bEMzINljnOfy+tQcywiph9o=; b=ik/xJ7pj2bUcJYKLGObuyL+Y7z
	wpxNMXPfK4oBFGmeYqpmkCCFONBDTFoQfI1sP5TONhLUgzfPMW1nu/sUK/GYqcUQcDCrv6fe0BCO1
	5aFHSMgyoqkUCFpRx8XLGa4UiukymNlstHKIV/4bcQpKbEILjmJdNw6xtbf0ArtdoRAZSyKo78Sme
	AQWlHkY3nz3XsQy5XJhuor8d0ZhR/JOilOVGFBSocVhwSpLE8SoxAkshTdVgr/2kzepz5urJdRogn
	m/SfblQhvJ3cHlL8yfhJg0LRAOK463UGw/CgUd0gSVYjnZQi0o++ny4g73l5Ea8NGX/wfFAl7SZY7
	kQurJeuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2tYx-00000007dwv-0H6R;
	Mon, 21 Oct 2024 14:39:15 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2tHZ-00000007bGU-2Dle
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Oct 2024 14:21:20 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4315e62afe0so43379245e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Oct 2024 07:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729520476; x=1730125276; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fkaTmiyWUTvag4SMcJC0bEMzINljnOfy+tQcywiph9o=;
        b=lKQ4EXziJE40tjT+nDt5UIGxwDPHIeumW2uJiMvDrJ/B3CPRRr96WiUqvFXtKcZIll
         Fy4g6tHVXNhjpYTghGvZXMiIWLBkTbLUZxahxJLL0Cx0bTZkmJE5eDN00afZvzclBHIy
         Ko6NiGhZ+DNah2hUDLeIQBTQwpzs/NozQXvoRh/XorTwQrSKg89dkBVKs/MNOf5F8m4i
         eXQ3105WWOkbS49BB/9b0dgx3hyknbVuW4iiN3xW8h9dk1W03NN7Ji/yfvzEypixxRD8
         32qrq3y/vHYZujcyztxMFBa0A9QV3Vw3MLe/QXD7BOjoarU09KUWytebSclHSu11keT6
         mcCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729520476; x=1730125276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkaTmiyWUTvag4SMcJC0bEMzINljnOfy+tQcywiph9o=;
        b=fapGV/n1mnN1kNgytlRVc5pewEPWFVIxF5VIDj2ZSBw+c8+SJma1lXDl+1jGV43iUF
         cdvu5nrHsp9huc6vr8Z4yCcUaNjpr6nrGAfJY6BCBUVQdet/fNmajQM+azq+38WxtU/K
         Vg+crvKcbiDtOCk53nVFlx+LBu6pAONNZ+LcGLMRvt/sjiUXFjaxDsoK8EoJMLnicPpf
         mTHsHSsXq561Z7UWfOxAq4XFEq9jgmPo3wMZ5W+KwGQ7TCkc76ALxIViO/DYPbkA2J09
         bf5u/zY32R5F9ozP9kWnykKkKASwPleowCpuXRR5dzHRUnrP+MN4cRhZDKWqUJ7nVzYo
         ILGw==
X-Forwarded-Encrypted: i=1; AJvYcCUG9yqNgbfijEQ1E7cWiCrcz33pg3bWjaB0VDnFMxj2lpOP/ULXF7wuXcsjAncDvjOgl+VwENhtfkrqvEGSww==@lists.infradead.org
X-Gm-Message-State: AOJu0YzX2pywHa3OOoYtHnSqtPQJsZKbAxZGljtReeLZkz0QIfJHxTCX
	Hk4i8NnuphNOTD1JZ1KZHzHiyYwSbLTN4PlFl/QnMxwCZ07Aqxg4gk9dLmCPoxQ=
X-Google-Smtp-Source: AGHT+IHLWSsrOMX/0aibUNkp/wI47N0y5vFtzl7noASKKkK9+W7PQoaQs8bf2P0RENiwFNs+Ip8tIQ==
X-Received: by 2002:a5d:4452:0:b0:37d:393a:97c5 with SMTP id ffacd0b85a97d-37eb488cb8emr8199985f8f.28.1729520475745;
        Mon, 21 Oct 2024 07:21:15 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b40b:61e8:fa25:f97b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a5b384sm4430211f8f.57.2024.10.21.07.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 07:21:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] spi: mtk-snfi: fix kerneldoc for mtk_snand_is_page_ops()
Date: Mon, 21 Oct 2024 16:21:13 +0200
Message-ID: <20241021142113.71081-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_072117_853251_0CE4F93E 
X-CRM114-Status: GOOD (  12.56  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The op argument is missing the colon and is not picked up by the
kerneldoc generator. Fix it to address the following build warning:

drivers/spi/spi-mtk-snfi.c:1201: warning: Function parameter or struct member 'op' not described in 'mtk_snand_is_page_ops'

Fixes: 764f1b748164 ("spi: add driver for MTK SPI NAND Flash Interface")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/spi/spi-mtk-snfi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mtk-snfi.c b/drivers/spi/spi-mtk-snfi.c
index debe0e3c1c8b..2166a56aeb02 100644
--- a/drivers/spi/spi-mtk-snfi.c
+++ b/drivers/spi/spi-mtk-snfi.c
@@ -1187,7 +1187,7 @@ static int mtk_snand_write_page_cache(struct mtk_snand *snf,
 
 /**
  * mtk_snand_is_page_ops() - check if the op is a controller supported page op.
- * @op spi-mem op to check
+ * @op: spi-mem op to check
  *
  * Check whether op can be executed with read_from_cache or program_load
  * mode in the controller.
-- 
2.43.0


