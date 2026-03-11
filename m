Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9702FD064D
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2026 07:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NLaqL6RDjLUDRC9IFh+xvK4vJysRmVxopr+1H3G1aWA=; b=0yFraQZK0XjguETtUg1tV4NdZ8
	nOSd1rs0c969BjaUicy2ZAXbVcy2qRD4DTztkdjOxpo4gDqex0HU6v6zoOpy1eBYhlW9j1gny1c5o
	uZUOV2lk8D/71jOslXp9ERODOdCj4JbFT0pZc45NI89cc/9LfFSTKibhRhn4WXSRAkcGhcDDaqMHh
	6CTbcVoF2DJHmJoGumtI9NEdautte/uKaAW2J6kgxb6vBx2g/wZdSBjmKCACSGyhEjC6fvDxOU3oz
	VfJs5mhtdvubimsvqy8evTYSD9nTz02BvnxoSbsrngMCI9vMdacCJUIoaGXuEGj6EP9vRb0DVTv5H
	0drvVKzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ENF-0000000B5Pk-3PWp;
	Wed, 11 Mar 2026 07:52:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ENE-0000000B5P5-134W
	for linux-mediatek@bombadil.infradead.org;
	Wed, 11 Mar 2026 07:52:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=NLaqL6RDjLUDRC9IFh+xvK4vJysRmVxopr+1H3G1aWA=; b=PKlc4h6Xsxvmi0KuIARgJBGcEC
	86KcLFT2NHUAjA9z5nSuAehPYDUykeI/onEay+jiceW3pW5gXENv8TqZRIGdiJS/l4KOZ9/svQwov
	WPu8b0GGe4121dkYgCuarpUC4geGQ5jP5a/pKWHoermhUaXSrnZ7JMaNKlo5R25KXKAuuV0vEIk03
	Ll0SKExDX+PNoWPoHYrnFzlCi75g1Y2gKIz+0WUIPmN1hKq0UKKwg+58eArwUheGm4ct/FUDy/5D4
	/Zf5iqv1gx6HwlBd968bel8sqV3VQLIDzh7NQHOwYocA+zTps1sg36o1i76oBLfAWrvAYAoHAoDCq
	s4psixiQ==;
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ENB-0000000GJ1H-1ixK
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Mar 2026 07:52:55 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-354bc7c2c46so8447785a91.0
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Mar 2026 00:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773215571; x=1773820371; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLaqL6RDjLUDRC9IFh+xvK4vJysRmVxopr+1H3G1aWA=;
        b=i8nSYQbGukOauMu9L6pxdb8Fz/QhwQ6WfyJciT5qpL9hvYjbfPa3RmEsjfw5IxF8a2
         bjC+ttkFrLmNVI1EswNj5U5/wUERtkxcto8FzHNWzBJxAmdAel6V1a5cp6Z5SmbSPNaY
         UhfudtBnHrClRMWYrp4MxnsDpeb6BN4BmeSS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773215571; x=1773820371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NLaqL6RDjLUDRC9IFh+xvK4vJysRmVxopr+1H3G1aWA=;
        b=VqBpswWlyFDCx7WgzgY0XY/sdul3BcKf7DuylXXc3eylc5gMgjqaiRaiBEKsf/UGS7
         Ak7aaT3tl6SvljTe92lrAwl0+2KuIVl1qOgnZ3qIffIJIhQVCskVyTFl7zt6dM5QVTjk
         8VkSBl2dB0+bakqJGqohypveLAJoNnG4oAhB/pH79FWUNLGZyf75F5nlhjAMMq9KXkJL
         M2LQOkjAZfUii0c+GDrQ198QkXmFfoYBHQv2HMwBzsYPAxlDTIQco7AxO1nhlMXlh1y/
         Zh+96GQZRV9uxGJD7p3bSxIGuPRZ2SgmkDI2VQDAybHnfv8FehPdPgqHPpi/HIgm+sKm
         LVlA==
X-Forwarded-Encrypted: i=1; AJvYcCUYBXnbj4HnzwLsnyHu6H1HZdZpr8BEzSqxDX5YjOgqWmEb87d/XVJvzkuXgtfjtTJ5ZO0YJCNmrqOarEgvmg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzI8pqSlQah1mpTTXuaVqliaY7MdAuFWC9SC5R+buZkj/2RKJUn
	qFDkO0E/X4DpDmgmo+42a0tK7Uf3a7VgOcICy+raCugrJV1z56JsUxOpr8NAoowogg==
X-Gm-Gg: ATEYQzyidqYIIpcjvZ4/NSEjeWAaoB4YTGQT0I08nZKxmgW3YVLAHecUyHiQze1IDoS
	KvqyYmw4iL+hB8DJnSQ2qNQlufrQI2qm3P9bQhiWv2JdfMQKpfzuiNaKjOZcRcKIN2GzHoE63oa
	YAg1t7SC6VgH+MZSAvizlXjLtSs71EJChtMjgdz/WQIEmfu00Xk7PjE4K8JJGHcbDyUfj7UZ4Yu
	R+kX9iXgdvt06visK63Prgg0Ue8yd0v6oaXBGdexxVJ1DZ90edcNr7HZvPWf4dF4f4xUbp738xf
	Je+aSperdXBua3wnj2fP81KDGgc713QQHoBlwkX/e8kfJHlsp3Krikyg2XfII1ZCn3MN2U0boAb
	KKMf6GyE57P/0WlbJ2d5HS5XoaA/0MDwoqMm1oBuHbv6+J23pVIIgYk88bDtG8ErCyICT8QDb8e
	Y5xPvxhe477cTtG2XWBEN9nEDLx7rkkk/ZCbP+zT+/EOkjEqPlVleqm2qJ8FR04NQBRx1Y7LRYN
	yP5XB3c
X-Received: by 2002:a17:90b:2fcf:b0:359:91a0:98fc with SMTP id 98e67ed59e1d1-35a012eabfcmr1678387a91.21.1773215571523;
        Wed, 11 Mar 2026 00:52:51 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:805b:14e9:f783:bcae])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a0236f79asm727816a91.6.2026.03.11.00.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 00:52:50 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v5 4/7] PCI: mediatek-gen3: Add error path for resume driver callbacks
Date: Wed, 11 Mar 2026 15:52:19 +0800
Message-ID: <20260311075223.3303497-5-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
In-Reply-To: <20260311075223.3303497-1-wenst@chromium.org>
References: <20260311075223.3303497-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_075253_561503_B7537903 
X-CRM114-Status: GOOD (  13.38  )
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

The resume callback currently does teardown in the conditional block
directly. This is going to get ugly when the pwrctrl calls are added.

Move the teardown to a proper error cleanup path.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v3:
- Dropped probe function error path; covered in previous patch
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 1b6290f2c360..22a16e4ebc76 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -1304,14 +1304,16 @@ static int mtk_pcie_resume_noirq(struct device *dev)
 		return err;
 
 	err = mtk_pcie_startup_port(pcie);
-	if (err) {
-		mtk_pcie_power_down(pcie);
-		return err;
-	}
+	if (err)
+		goto err_power_down;
 
 	mtk_pcie_irq_restore(pcie);
 
 	return 0;
+
+err_power_down:
+	mtk_pcie_power_down(pcie);
+	return err;
 }
 
 static const struct dev_pm_ops mtk_pcie_pm_ops = {
-- 
2.53.0.473.g4a7958ca14-goog


