Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86970C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 22:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yTmY2EAK1Nb06TRgYarSvrUB+B6hJlkX6s13kCqlsEo=; b=iuKyQ/4XLOXF4Mu/A3yaZoLmRh
	2VaARiqQShObWyZYa81uCG5y8+M1en4R2a8CQKvOWdCDbMcClQYMLbcLhiySY0uNBu5zof6wxj2tQ
	hk1F2ikOOh8anieIdUZ+8HsDM25NgQ6OiVw8O2VH6+VAAF7wiY0BZQCH0WJkwpUbbfv/RA3wvAAmD
	FVvPSL1PC81/fUFtUw/oOntPwM7lrKFL6Xj2nH8qG6AvmHOVvb7PeXO+EgO+Aa+Lf+B9TbJpsbCts
	0kdDGDedq5sC87m/3Wesc+6+HSlEdIQ2TWc8IJEpGDZQjd7NyR53KKAfgnQHrQSqnA/DCA+chg1xu
	MTd1rSUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxFQ0-000pur-Ad; Mon, 21 Nov 2022 22:37:36 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxFPp-000pr8-PY; Mon, 21 Nov 2022 22:37:27 +0000
Received: from notapiano.myfiosgateway.com (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 58A616602A54;
	Mon, 21 Nov 2022 22:37:20 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669070241;
	bh=7RSaxYNrftEuEHu+tdPORhiDIvSBvNUAw0lshzAfmW0=;
	h=From:To:Cc:Subject:Date:From;
	b=RNpYOKiZRomfKJVTk6xKJYXs9oDDsrn8DyTriqLeISTgtDL4nwq7K7zJ0T3DyUZDg
	 e1Znk/FAqixHf9VrLV4R7eLpaLCHRWjlc4oJ4HfnyPs/ePUEGk7zTZfusgmc4ny6B3
	 pvaiwuZzBHKwvL5esWfDrjN28hi1ZPwItelCh+N/8ql8wJ0XDfgKeAlNt9TZfotUu1
	 A0b3d2Tgv3YsAEWG0OcBCQopwpkgCEEgNC91DQTNaZE0P2ljBZUgxm8WoVT+JSwlNs
	 gCnPobdNtEb8JYSO4wLySkg8gCNXOm9W+zgSZRlTRl62dEnc2qs1BNu9gMeFg/7vNM
	 qYy4bUkmz6rag==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Nancy . Lin" <nancy.lin@mediatek.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] drm/mediatek: Clean dangling pointer on bind error path
Date: Mon, 21 Nov 2022 17:37:17 -0500
Message-Id: <20221121223717.3429913-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_143726_058076_6C13152B 
X-CRM114-Status: UNSURE (   9.25  )
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

mtk_drm_bind() can fail, in which case drm_dev_put() is called,
destroying the drm_device object. However a pointer to it was still
being held in the private object, and that pointer would be passed along
to DRM in mtk_drm_sys_prepare() if a suspend were triggered at that
point, resulting in a panic. Clean the pointer when destroying the
object in the error path to prevent this from happening.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 39a42dc8fb85..a21ff1b3258c 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -514,6 +514,7 @@ static int mtk_drm_bind(struct device *dev)
 err_deinit:
 	mtk_drm_kms_deinit(drm);
 err_free:
+	private->drm = NULL;
 	drm_dev_put(drm);
 	return ret;
 }
-- 
2.38.1


