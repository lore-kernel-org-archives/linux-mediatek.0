Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4667C606A61D
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 17:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vTL1hyDo;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FD/h+kr4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ZcdeY/+hHuFAVss5RJRa1CDo+Jz02VmFH4BdGyYa5KQ=; b=vTL1hyDolWRkwWELpV8hV+zPVs
	lq0dFIiH35q/It4wYwc4CzAD9qcfueg7zdj4bv+WgmIcFI3r+JyeaL1Qd3Qjh0gHOAI5Ct6iOUZ8/
	RlJlju5xssS5/mqcsx10oh8Th1uSytmyu0fSH32gtP27iqAjsLnHLVApD90gpGDC0LAJSo7ujZgnb
	5ZhjhsuJop37fHyC284bRH3XxgCIbFlj0lzoRm0evittV6+rsgOQeUj3PbUb4/vObvgnohG0vvhk/
	jfBu2iq69LOw0RXHdM7AdMYqYZ9m6lVp6OJp7UVDILgJr+WsEgMxWdbhKevBz35BLwht/a9e2m9tR
	Ox50geLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5f2-0000000CnpF-49C1;
	Thu, 19 Nov 2026 17:11:00 +0000
Received: from mail-dl1-x1246.google.com ([2607:f8b0:4864:20::1246])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5f0-0000000CnoA-2IcM
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Nov 2026 17:10:59 +0000
Received: by mail-dl1-x1246.google.com with SMTP id a92af1059eb24-1b29df78132so2593672c88.1
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Nov 2026 09:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108257; x=1795713057; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZcdeY/+hHuFAVss5RJRa1CDo+Jz02VmFH4BdGyYa5KQ=;
        b=FD/h+kr4B5hqPvqZuMc3+U1h8Vq/SYxqe4Cj4l1nMQtjB9f7ysxfkSUnyKhe3UP3Ia
         i9/kCZFfcxy+lLXu9zk9Z2MXAz9bsdBL7wbe6bi7JkUYV00upVjbNe6t5wKvExjE4dJT
         vrPxKaZwPJjmXH6uBZrp98ufG/y83/wOGRNwJVyppwmL2oHWBziZfFhcYol+Sf+bafk8
         H8Uz63/k3oV/G+A5G9ux9pTQAR0RgkeueiDKe0ZfH7607NEVMSTjsIIPQ/nTCSyyc9F7
         PCUOhAduK19VwkA5GwnUTUBZJJsfQMhcJd6DZ2BRSuMkr0m0NLT1H8W+3QGN47cLfyQg
         0lrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108257; x=1795713057;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZcdeY/+hHuFAVss5RJRa1CDo+Jz02VmFH4BdGyYa5KQ=;
        b=F/TCNHQbp8RJzfMg5CjmeG/pyO8eYWszLRMPPHKc0mikLYWgZcS6tOGdxMfad7UgdW
         jng2XGQSiDWblgiEQI5XhlT+zXQHJtiwhZvDeB9V5hPBjLTkbMTvXd5KzRu7l9hUpH+l
         CzAr7tNdZ8s6zifT79DJsj9jQ/6ry5C7LXyvM0nGzIVx9ZJ8BRb2eRN8SgfdZbWXclFi
         9ey3h+MdObtwLLo3d8d5JkQgN0XPa2TTTx6CJt3+0f/3NJrlL4jXCAskdCbasVmWs77Y
         pK2JStFt0gKhnHUF4XO7a1pbblmRWJdzGKqMgwoFUZQM6qbkxX/wQQalakZ7VZQjbi3t
         j3Fw==
X-Forwarded-Encrypted: i=1; AL+hErGkJWnmiOiYbsc5w8mZiu4wJiQ6gjkZn/6naopzaRk0IgeNVsmb3M8B+qu/aYyrmy3i9y4SnQvEiTfgZM0Cog==@lists.infradead.org
X-Gm-Message-State: APuU4Z9pHgp+h4uWLrvjdr/n7mrLn9o2oGA0dcaeRptDfbw7HUNsMUiJ
	8sw9wjCFziuVn++5tSVLQCnYZ1eXTQWrBfUYPUsOcfNSE7CanztJyUqa/XY4hKd4Bkp7OJF/rXv
	QcRUU8yxNvA==
X-Received: from dlev8.prod.google.com ([2002:a05:701b:4648:b0:1a7:450c:8b47])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:ea8d:b0:163:c5eb:d42f
 with SMTP id a92af1059eb24-1b5567c02b5mr259999c88.5.1795108256626; Thu, 19
 Nov 2026 09:10:56 -0800 (PST)
Date: Thu, 19 Nov 2026 09:10:53 -0800
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119171053.1537233-1-irogers@google.com>
Subject: [PATCH] drm/mediatek: Initialize ret in mtk_drm_of_ddp_path_build()
From: Ian Rogers <irogers@google.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_091058_583142_31F3F7C8 
X-CRM114-Status: GOOD (  11.47  )
X-Spam-Score: -9.5 (---------)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

of_graph_is_present() returns true when a port or ports node exists in
Device Tree even if it has zero enabled endpoint children. In that
case, for_each_endpoint_of_node() in mtk_drm_of_ddp_path_build()
executes zero iterations and 'if (ret)' evaluates an uninitialized
stack variable, aborting probe with stack garbage.

Initialize ret to 0.

Found via Clang -Wconditional-uninitialized on an x86_64 allyesconfig
build. Verified by building drivers/gpu/drm/mediatek/mtk_drm_drv.o
with LLVM=1 W=1 (-Werror) and -Wconditional-uninitialized; not
runtime-tested on MediaTek SoC hardware.

Fixes: 4c932840db1d ("drm/mediatek: Implement OF graphs support for display paths")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index a8bf0690756a..4b15b90b11d7 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -1006,7 +1006,7 @@ static int mtk_drm_of_ddp_path_build(struct device *dev, struct device_node *nod
 	struct device_node *ep_node;
 	struct of_endpoint of_ep;
 	bool output_present[MAX_CRTC] = { false };
-	int ret;
+	int ret = 0;
 
 	for_each_endpoint_of_node(node, ep_node) {
 		ret = of_graph_parse_endpoint(ep_node, &of_ep);
-- 
2.56.1.708.g77570a6a1d-goog


