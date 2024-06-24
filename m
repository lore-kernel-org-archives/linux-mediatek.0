Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1975C3064D
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jun 2024 16:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8kHPT/Sbn+YowQq/I8VGD+WkhOqD5j84bm9SVl0pb1A=; b=gWevtq0eVXg2Ix0jBKtOhiLVsW
	JceNxhPLGfJhM7gLLD9SZbfLJCEpn90+1b3ML7mFjcJgUNSDVW2Wtjc0oXXehVECyuEqvLMHAdgww
	Pcd3VUpw202V0coniapCnpdycaypPz3rBiz9sdBmCSyVFAPPOjad+xT100sB3ybxk7jK66w5CcsiT
	yG9S8gtQpKHaqQ33RuiCe4qY5IYoxwtRLgWEK+mY6Jz24g67k2B3XMyxVA6/eJbtgxpsFxhijr84l
	URGujAL7+zbxpYwjrBMkx52FB3rjAy8Nd3iW5t5+q4E0XGxCiRIExECY10HnRQluI4+DF/vykxVZD
	D1I/eYHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLmnd-0000000HZNg-0obt;
	Mon, 24 Jun 2024 16:44:13 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLmnW-0000000HZJr-0yFX;
	Mon, 24 Jun 2024 16:44:08 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4217d451f69so38840125e9.0;
        Mon, 24 Jun 2024 09:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719247445; x=1719852245; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8kHPT/Sbn+YowQq/I8VGD+WkhOqD5j84bm9SVl0pb1A=;
        b=gszrIUL9V66iX21uVcU+KLg6FuEEjO1n8N043yAEvvP0iXyYmIxWsKDbkSzuKjGSH9
         g9j9u/hCgC6rPLzLAFQfeoYFvG5ivyCODNHfbje+zOKLjiKOZZn2f3T8BMPhxp5BE2V2
         bxQyyt64j+Jyp3mCJPGX3dNIPvfXmbzX2yMQCmDP/LJq2NpenW5zUSlF6UIUrkqiy4he
         cr7hRyLx8yYUkYo3nT2c/eJepvYwF33ab5gLcXSVfGVtMtlJyhD2aPnVJIE7mDBm24KB
         bPoeS6/n+PP7Uy38htgqVDdANiQd+Uy+i3PiUU3U1b9HkiNPaqeEYgxW1dSlJpSJmvsv
         kkrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719247445; x=1719852245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8kHPT/Sbn+YowQq/I8VGD+WkhOqD5j84bm9SVl0pb1A=;
        b=L7EknULGUzBZ+urwoVkEflvg9mOMeCEQ1zuBrqNiUYeH1yYSgLA9wzY26E5rUqdhVc
         33yQRP0U8mNYa3XRXkFPTkEGc8Pqm3DLklvmTZjPY3Q1QX04TGI6MQXkUoBiJJuOCELE
         1jJWHq3HNsXGqODlRrSBYIEpZFx8StVeIhGQpu6yBOOgGTumW5FXrzNIxUb+gRG8R/p+
         IdQAgqG97RhKR9aH7UB8zt5n2N1EeB2c+Ci+v+S2714RorNpA8/vKoOMArX5lXbA3fWa
         /HQgyEHvwyYBys7TG2wMgQP+1xeg2CpxuE5ZUY66pRAZl+p4ArbaTwsGeLdXfSn+BKiy
         XPAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvlewuQDxYeX6G243o7MsPM9hPFcvgVHM978AmeeEs15ja8hpQYApSJDJlmXFsezKbOkx5sAJndII0NlvKNRJbwYHwuLQULLEBy9kZCm8jDiwZRBDJCO+83FHUr+ADvLN3vZ3A9XpkVoLpmvh6JISVftjgm2hg1VU=
X-Gm-Message-State: AOJu0YwbICwoiUMoRhhMCbcRVKDdKTTY+CuxuDgHzjiBmmaMZpOv4DC7
	GbM9I06mNxpZa2/wzVCDBbmhajJngolV1rKgvrT9dNo3mZ2AAJay
X-Google-Smtp-Source: AGHT+IH+MF/1j+d+mvD3UvJmt7w30GJxIqwd74Gd3nbm7skLi+nadm6az73r+6Ot9QMhLZdiwI26aQ==
X-Received: by 2002:a05:600c:450d:b0:421:7198:3d76 with SMTP id 5b1f17b1804b1-4248cc58b99mr34106605e9.28.1719247444697;
        Mon, 24 Jun 2024 09:44:04 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-103.cable.dynamic.surfer.at. [84.115.213.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42484fc0aecsm126090365e9.12.2024.06.24.09.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 09:44:04 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 24 Jun 2024 18:43:46 +0200
Subject: [PATCH 1/3] drm/mediatek: ovl_adaptor: drop unused mtk_crtc.h
 header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-mtk_disp_ovl_adaptor_scoped-v1-1-9fa1e074d881@gmail.com>
References: <20240624-mtk_disp_ovl_adaptor_scoped-v1-0-9fa1e074d881@gmail.com>
In-Reply-To: <20240624-mtk_disp_ovl_adaptor_scoped-v1-0-9fa1e074d881@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719247441; l=718;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=j/Zhl07/mGungCEQOMBPhb09WEiiiTeekEFTk2ivabw=;
 b=nsHPwkldRVFX0qaLEQCcbPwptfpdpZshqISZVJXbL07KghajM9UUXAa/ztlPZoq/H7lrAeLum
 wFs+M1/owgeDqHH9yoZFm/ngRVpRlYSYb9NOtW91UJ8iIKqf8x5MLG9
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_094406_899549_F210DFB5 
X-CRM114-Status: UNSURE (   9.51  )
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

None of the elements from that header is used in this file.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index 02dd7dcdfedb..1418992311c4 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -17,7 +17,6 @@
 #include <linux/soc/mediatek/mtk-mmsys.h>
 #include <linux/soc/mediatek/mtk-mutex.h>
 
-#include "mtk_crtc.h"
 #include "mtk_ddp_comp.h"
 #include "mtk_disp_drv.h"
 #include "mtk_drm_drv.h"

-- 
2.40.1


