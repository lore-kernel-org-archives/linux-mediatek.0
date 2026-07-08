Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E57C44501
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 12:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FeTFZKGeXcKtdGzHWtUv5E1DeHN3B2mS7xb47BxMxw0=; b=jEdt1Nb9WVhB/ZF3DTHdltYssA
	UUAizh+kWAHI8LwRdn4yG6ErBx2g7iba59OH/uP6/FlO2RHwv1Qjd1vZdHfADMTyHxNIwwmlvWkl3
	fMJln4gYMyq67J1eu04pjRYIpxOUYjAf1smM0Cn75vDUUzP2pnHVaAqAo100S9fQM/yZj/MLJXvog
	ASZSnnLuxPp/ZIB8ooXFBQIA0eLfag0dwpjg6RJ3uXU0KplPWddyr8fitBro9mP1BwIdeBRsIny5C
	SzihDGDsRFN8s9rO3DHjIKJ8Ulid6lqD6O5JnZk80XTrSQn0hW2XND2P/EXcQiEUTA2Es5Sv++aPo
	qLppUxtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whRc3-0000000H8U8-3CJN;
	Wed, 08 Jul 2026 12:42:51 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whRc1-0000000H8TH-2yqP
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 12:42:50 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-847aa193d98so505037b3a.3
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 05:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783514569; x=1784119369; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FeTFZKGeXcKtdGzHWtUv5E1DeHN3B2mS7xb47BxMxw0=;
        b=NH+AQhEvffnzctiDU/ENoewgB0O9n7tqq3BTdt5G7HLzMJcr4Yk1tZIJbpJVOH4yeB
         y+h0E1O+L9NS4qEBHBmLgq2WWxbWbnXTnDANqgKTm5YVWmJTgv+l83JT/Wrrn+FuBBNO
         jBlWLcDBKO240be3iuvqFcdDwn+bPlY0QqONJMYlbNk7wLfhaRzCaOOjwd7CfLr5YAGB
         XhNYV4eINbfPuz+AW7USZsOgaMJcPtVAhhPrEWfEpA4PgDnnrc97TPqwnYUQyG+FVjoM
         HDH83e0GdhSLddo9fD/61/JCrHnVxthmZY3u7v3L0OLRgs8L9TbLYhPz1gQF1XtdF+SR
         DWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783514569; x=1784119369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FeTFZKGeXcKtdGzHWtUv5E1DeHN3B2mS7xb47BxMxw0=;
        b=fv6G/4hy51R61TWyv6vAG5csn8QOsW4M1qLR6zBHQ6wEGZ4daHPxb82oRjaxiLqvqr
         aBjoWqtX+zMJJ4DDdiOIuxNz2N4hyy0PwhbTBi4YiA7f3O6nwsvSRA4SoglyYnrqRfOZ
         eEIgHUSSArpUkE22768yUFr5Iu+3CwOEP+eXjGYHR1rvleq5Vvg62NPJT3+5Hzg0eICV
         4M1Szj62WGvE2uTpEK0+naK0uUxwHwM/CIpsseZld6HcAmQ0W0zwZ5OR64ZXW6rf33Y4
         obN1XXnb/d6/MVEFqFV5WOkBnEDBoYr/WVJ0t49yVwCkhwqSTdHUDGZuwrWRF5hyzdTw
         uuiw==
X-Forwarded-Encrypted: i=1; AHgh+RqCo8xom8SO1SfqPuwRoTMSitgp7aOJ+vDdbrJJFurmyRYi8ZLv8vF0osuaQ8EvD5Y8HiIcOPW7QTvjJxFqQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwkzbZdyVmcw6fj8bRIwDryTajwvT2/+yvrKS0522wluGKWmL9u
	OCX4YMXPAX4SMBcNu8Olqb7kjjMOd8HEhHMBQKTyOFqD/QT0K82gSkMG
X-Gm-Gg: AfdE7ck+SboBn6FpKFcxN7eB/WuXMS/H9u2fqGmpfi4NJ4U+hy2KC9d2qkHwoXaEmVv
	/kM39RRYLVLhw9gBzYulSPmdF2YqmGXkawziksUG7begx8DR7F7QJn00XVguZb5oeR1eayIpTDE
	h2E2TMkRSSvKB2evvywcneZC7TO5ZCKOpKvNOHV1et3ljS29jlNZ3O6Q4qzp8jfePxMqaSPCcxP
	Rh1amiKOdyjtIY0R51v5CHSIR4N5lQKNYEaZsbJUG+HkEUY/riz/5pDHCLPOD6HMFiXXZKzp/x6
	rTglZy55znm/bnkdrNIGVMRzH67Zb2mEV9q/BpmRydrKMJp41hML2K+PaNdqCCoGmuon9B43Myi
	4h0DWrKJtfM6HVRUM/j+QvldgFD1NqKsyqBe6Nt7pjM48+6/brQlWcPvM2RBLRzomBW9FTAQtVD
	I+hA==
X-Received: by 2002:a05:6a00:3021:b0:847:8b1d:22fe with SMTP id d2e1a72fcca58-8484341100bmr2523607b3a.50.1783514568759;
        Wed, 08 Jul 2026 05:42:48 -0700 (PDT)
Received: from lgs.. ([101.36.106.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d7c2casm6963729b3a.43.2026.07.08.05.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:42:48 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Tomasz Figa <tfiga@chromium.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Haoxiang Li <haoxiang_li2024@163.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] media: mediatek: vcodec: unregister VPU watchdog handler
Date: Wed,  8 Jul 2026 20:42:35 +0800
Message-ID: <20260708124235.763036-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_054249_752426_191D4EA6 
X-CRM114-Status: GOOD (  14.54  )
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

mtk_vcodec_fw_vpu_init() registers a VPU watchdog reset handler and
passes the vcodec device as the private data.

The handler is stored in the VPU device and can outlive the vcodec
device. If firmware initialization fails after the handler has been
registered, or if the vcodec device is later removed, the VPU watchdog
table can keep a pointer to a vcodec device that is about to be released.
A later VPU watchdog reset can then call the reset handler with a stale
pointer and dereference freed memory while walking the vcodec context
list.

Add a VPU watchdog unregister helper and clear the vcodec watchdog
handler from both the firmware initialization failure path and the VPU
firmware release path before dropping the VPU device reference.

Fixes: 01abf5fbb081 ("media: mediatek: vcodec: separate struct 'mtk_vcodec_ctx'")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 .../mediatek/vcodec/common/mtk_vcodec_fw_vpu.c    |  4 ++++
 drivers/media/platform/mediatek/vpu/mtk_vpu.c     | 15 +++++++++++++++
 drivers/media/platform/mediatek/vpu/mtk_vpu.h     |  2 ++
 3 files changed, 21 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
index 3632037f78f5..c79a78c371ea 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
@@ -40,6 +40,9 @@ static int mtk_vcodec_vpu_ipi_send(struct mtk_vcodec_fw *fw, int id, void *buf,
 
 static void mtk_vcodec_vpu_release(struct mtk_vcodec_fw *fw)
 {
+	vpu_wdt_unreg_handler(fw->pdev,
+			      fw->fw_use == ENCODER ? VPU_RST_ENC :
+				       VPU_RST_DEC);
 	put_device(&fw->pdev->dev);
 }
 
@@ -120,6 +123,7 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_vpu_init(void *priv, enum mtk_vcodec_fw_use
 
 	fw = devm_kzalloc(&plat_dev->dev, sizeof(*fw), GFP_KERNEL);
 	if (!fw) {
+		vpu_wdt_unreg_handler(fw_pdev, rst_id);
 		put_device(&fw_pdev->dev);
 		return ERR_PTR(-ENOMEM);
 	}
diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
index 8d8319f0cd22..f59f45fecc75 100644
--- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
+++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
@@ -437,6 +437,21 @@ int vpu_wdt_reg_handler(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(vpu_wdt_reg_handler);
 
++void vpu_wdt_unreg_handler(struct platform_device *pdev, enum rst_id id)
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


