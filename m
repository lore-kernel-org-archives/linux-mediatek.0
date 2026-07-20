Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CA3C44524
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2026 08:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cOfUy+CQo+u3Sm5zMP7PbJnZMmWfXxmWUpfU0u6aASk=; b=1idKB+OFyRhJ3nXiHX7f2YeVSM
	8py6mjY/t6ALGs1PpPsttDdGbGplaWclOOqjkJP3eN7JBjj727UlQE2u+M3juS5LeieafFGzA2yPj
	IMlX6oXaEIqwtKzr9yrGMkvxcFNMIMaO47BdHsbCxHaob0XVtpUKdYcJ6qg2igSWIoALUFQE7KLpR
	nnbI4a7IpELIWcT2EnRo47LKDjTqOZdODdi37cvXOE+0jinLGOW5j3h+gd9VGOedJ35bz51YshxRk
	bMxX8J1yAx0pclewkW8iKcQZvrJSSC3HYjopDPwF+TkdCM2OOXxf1GpIBVO0UR0ocffl4WCXBDRB5
	7s1sdRGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wljpU-00000006FrO-1DlT;
	Mon, 20 Jul 2026 08:58:29 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wljpR-00000006FqE-11BA
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Jul 2026 08:58:26 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-848643382fcso10945011b3a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Jul 2026 01:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784537904; x=1785142704; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cOfUy+CQo+u3Sm5zMP7PbJnZMmWfXxmWUpfU0u6aASk=;
        b=rIRRfAjmvXwTpzzvbVEC8/NyfIH0x8mlXEa15R1T331bbvBaeLHN5i/8S5v7j00J4s
         nd3ykslIwRhuidIbf+zHjTbyezrf/ftt7cXjzB/wEuSLbeC9B6BhPPaIBP+Ips/i2Lqg
         qf+DsnOA4ZTraqMBuMMp6CupEKDYoC2nYsCHOK5jowi7m7ZiTK5THcdj6PlJ0fOuaKlS
         tQPTJ2+jJJetSWjee/0Hs6L0RHiIi+t5aYZ67Uh94aXc0L03HbJfKh49Vo8jSSadJ/pY
         P8lFOyJ9IlIAbYErKkwVWFjYfgYq4foF3xBgqre2CTDpg7BxCsRUqgGryHU2zVsH1tbo
         7zNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784537904; x=1785142704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cOfUy+CQo+u3Sm5zMP7PbJnZMmWfXxmWUpfU0u6aASk=;
        b=IoBPXFYqpftQb2omj+9ONwBiZ3Z/bqlnGkRfadTCgA3B+WPNQHa3HEVrSXOvceKdsb
         IQhc1f0v1FgQG9EzkwxzDQf5YMlKcHwwjqZPLQcUcaHvS09h2IGHLL0oFOvCr7BSb9sB
         tu8kjxF7DjQUer7DejpURqtky6B+eI1LaRF5zNjJY1ZhH1692NilTXr612GF2Nz8jX44
         mUpvTa+46qLL0lcIBXFCcY6DW9S6CuCUKW9sOROT20fsxJUpyBvy1rf8Q9iUU7PsXyPl
         V5INlOiiKQz1JKu+dOPQkoVot6PBu+8daxK2JzlQGg5PALewAfbtchvCDy1rhad3QZme
         lYxw==
X-Forwarded-Encrypted: i=1; AHgh+Rqa3jOwsk3iL0CVkjIecOM9ABOIKvH3TjbcZdm5Hyh/lwniEoIwSKvmGqjD7dgi+6gQTioRyHZj4hvSomlC7w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1WQcBJ7rRZjXUDWmBwYEyyVziVKiYnxP7sxrPryTT41gXIyrv
	RVayT18NxHm6wikkCT5FffcexkNmS5XG/4fjgOW3xE1zws+QkIUFGAjD
X-Gm-Gg: AfdE7cnqY4H6BT6sJSkcuU7cwAy5RPWr7SbTxML0Jh6XAk29/SvXy7knLru9Z3Jtc6o
	kOllpHihAsIA4s0f/il++9Ey9fLQg3g/O1BpZ1VMVoM7RwzzGBYSwPY5MpyJa4lpWl5BS9RK7uj
	vTNTlWDVfEK/G+4RNuA9I5Nm7IYtxZZ+YZubEubCdgDynwc0PTN4C16SkYxOfG/AAr773EHU6Jw
	5VPV+lCDLzuJrfJ3VIHG6oNVLWhQviFYf0MYVHbQZSjReB0f5vlRsfXpf8Nkm44VwR6N6ttMFMo
	ykugvwu/LXKfHNKV3RXdgbOzQ7N+KQTH7ptGeziSeFzn11Bacr1qx2ilycU9YRIeP/QIFNkluQx
	XzwSBI0g3FiNEj7l5yqMJwEWgc7djaq8zG63uCpveIlw9XQreU8kGZ0TSnRZSD0XHHeU=
X-Received: by 2002:a05:6a00:1888:b0:845:e740:8ba6 with SMTP id d2e1a72fcca58-84c294d43e9mr13050873b3a.43.1784537904420;
        Mon, 20 Jul 2026 01:58:24 -0700 (PDT)
Received: from lgs.. ([118.193.39.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adcc78asm5247901b3a.23.2026.07.20.01.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:58:23 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Fei Shao <fshao@chromium.org>,
	Tomasz Figa <tfiga@chromium.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Haoxiang Li <haoxiang_li2024@163.com>,
	Eizan Miyamoto <eizan@chromium.org>,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/3] media: mediatek: vpu: add watchdog handler unregister helper
Date: Mon, 20 Jul 2026 16:57:54 +0800
Message-ID: <20260720085756.465667-2-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720085756.465667-1-lgs201920130244@gmail.com>
References: <20260720085756.465667-1-lgs201920130244@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_015825_314558_C27AAB33 
X-CRM114-Status: GOOD (  11.44  )
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

VPU clients register watchdog reset handlers with private data owned by
the client device. The VPU driver currently provides no way to clear a
handler when client initialization fails or when the client device is
removed.

Add vpu_wdt_unreg_handler() to clear the reset callback and its private
data while holding the VPU mutex. This allows clients to remove stale
watchdog entries before releasing their device references.

Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/mediatek/vpu/mtk_vpu.c | 14 ++++++++++++++
 drivers/media/platform/mediatek/vpu/mtk_vpu.h |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
index 8d8319f0cd22..a2b937095248 100644
--- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
+++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
@@ -437,6 +437,20 @@ int vpu_wdt_reg_handler(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(vpu_wdt_reg_handler);
 
+void vpu_wdt_unreg_handler(struct platform_device *pdev, enum rst_id id)
+{
+	struct mtk_vpu *vpu = platform_get_drvdata(pdev);
+
+	if (!vpu || id >= VPU_RST_MAX)
+		return;
+
+	mutex_lock(&vpu->vpu_mutex);
+	vpu->wdt.handler[id].reset_func = NULL;
+	vpu->wdt.handler[id].priv = NULL;
+	mutex_unlock(&vpu->vpu_mutex);
+}
+EXPORT_SYMBOL_GPL(vpu_wdt_unreg_handler);
+
 unsigned int vpu_get_vdec_hw_capa(struct platform_device *pdev)
 {
 	struct mtk_vpu *vpu = platform_get_drvdata(pdev);
diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.h b/drivers/media/platform/mediatek/vpu/mtk_vpu.h
index 3951547e9ec5..2ccb481a04cf 100644
--- a/drivers/media/platform/mediatek/vpu/mtk_vpu.h
+++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.h
@@ -141,6 +141,8 @@ int vpu_wdt_reg_handler(struct platform_device *pdev,
 			void vpu_wdt_reset_func(void *priv),
 			void *priv, enum rst_id id);
 
+void vpu_wdt_unreg_handler(struct platform_device *pdev, enum rst_id id);
+
 /**
  * vpu_get_vdec_hw_capa - get video decoder hardware capability
  *
-- 
2.43.0


