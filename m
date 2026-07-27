Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C156C53209
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 20:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5dHqZOwqovbAeLR2/0Aan5+Wo99rOiSA3eO44o9fS8g=; b=pARMHO5ilThY5Red6x9vFPEmXZ
	VdHoi+EV5Gi2ZLH5GQqLf8LST9sGKVz/JLsrN3dRDV5mLaibZZTpP7zbnaasB6xteFoeOyj3eBvVl
	s8ObtUm9FGhnxWghNchtCwbCysml5S3xsn9zH0VBD9SM5sO9Txr0YLaMjzKc+QvF2mQaQ+DWBLN2k
	8DlCMSEsQf7P0+C/0gzaCQXtZNmT1oCgI/L6DnhVY8y5KpJl58ZUkpQuF0v6eQ2w/SQS6EoReSjkw
	tKfIAHd3dss+d4oud12+eQycP1wBp9hjqxUhgpMvRRKkY/t2enFHo5raBGRiVYC7YheP2a0JfOi0Q
	5DD3177w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woS7k-00000003rh5-0mNF;
	Mon, 27 Jul 2026 20:40:32 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woS7d-00000003rdo-0oLd
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 20:40:27 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-84847482584so239937b3a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2026 13:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184824; x=1785789624; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5dHqZOwqovbAeLR2/0Aan5+Wo99rOiSA3eO44o9fS8g=;
        b=c3efDIrJso6nabF6wO4gcPyKSFEjB6gsBTKD9dM/Go4H+0K2srWh7csp8gdC4prFEJ
         S7nlJ8V2msPm2gbkD/b6DOq0IRxs4ksZBIDGF5YpRyR/bEx30SicdG+oydxcvSitHjBr
         fw/EKtuiKGD/U3tYRsGNRIHTDYd5T7S4Ws4BUvaLAzqDXNvElCSpvx541W9dUupFVpTh
         5muxQS1aaCld1stfaoRZfldc8qqMlC2c1jzxMWp5bESx+PF0mgl/wfcQG5h/pS7niiME
         TigKtHxsVU4O/qDf+4YPBVtFfofTEhJLx7u1UuPM+XlrV4xD+uYTUZGLgNhk9FvsL4eB
         lmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184824; x=1785789624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5dHqZOwqovbAeLR2/0Aan5+Wo99rOiSA3eO44o9fS8g=;
        b=MgWcslOvAdRtWnTZjH+Reu4fue3P6BjWA0ID/q6V7b4zdRWSKEzrAzFc0aiuRSHPb4
         Eg6de6mOr8uxGlINcXScqXKaI0oaBHBsiMOMH7nxWdWNkGWTX5FRgwPeTIlme3gwSZ4J
         UJKU4RkmVX6hzu0xjOf3VHlqyurKFo8TcfE3FRnqqycJ1l74r95ABRZz2AJC09SRYDtK
         B67NM9lg+ZkL0i9T9tBeElEIn/TJIZgx9S9VUVfUdqeOzjRddiS80K8+44FCLQ3CVYmc
         VxKDQj7iGZm0kQIubahJdFVDKyDyzl3n3Y0S7T37fB1Ag7zMQ7ABxExr1Ra8qVI3QWr9
         F8BA==
X-Forwarded-Encrypted: i=1; AHgh+Ror66+xuYQGR62hGSwoIphom9wS25TKpK24QaEahmhy4Ta/C7oQocDEao6X4bylbNyU1lFz6eo78GF8pK34Eg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwoLDBZa5VVnhEKxJ/qWMKeyEgYf6BINGniBP3GoV67hT5yvRTq
	Qq4exfTN3QdmW5wtuCfvZWaZFWRMojQP1PlMSPidzad8+Rt0eODKXHLC
X-Gm-Gg: AR+sD119x2kSOWlTiRKCLmc3yuOR83OPRzM1RrxiYuEurrI0z9ix+NmJY3cBU+8W/6l
	cnajlvDLqjk4Rw/YKA+tbrW0lNKeQUjKmAdpJc2PJ4EcvZQ197KlHzu5FLDr/trREvI9dHLtrs/
	60dTpuppBQuwhQEjiWujOJpqhRgZbN6riyBnedVKhsqz0wde89YBbFG/BUZkSK02gVkHK0rBdQo
	y5kaF/5QqqqQ695wQwncvsNWxEwGsHoRAwOj5CW863bcqIEXxs8iPuqZ3iEscdClhVzRQS7P6C3
	aSBKTc8ViE2FXJQzsf8+itRscu+PRg3gskPq6Be+p/FewTgrX2cG29ZMYb0Ok4kZElCxMh45f2E
	pTjlcl6eDDp8fQD2nDAvShJBWIR2UlsTUZP+W4Uw1njsZYtKCW530v1jcfB4/HavibDlGi/VKC9
	pfwC8b
X-Received: by 2002:a05:6a00:440e:b0:848:2ef5:50d8 with SMTP id d2e1a72fcca58-84e8fcc10c5mr202785b3a.32.1785184824280;
        Mon, 27 Jul 2026 13:40:24 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:40:23 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 44/64] dmaengine: mtk-hsdma: kill vchan BH on teardown
Date: Mon, 27 Jul 2026 13:39:06 -0700
Message-ID: <0bfe8c4b14ebc7446d0424bbe811c310e86bef51.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_134025_268388_E1ABDFA0 
X-CRM114-Status: GOOD (  11.51  )
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

Use dma_chan_kill_bh() for virt-dma cleanup.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/mediatek/mtk-hsdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/mediatek/mtk-hsdma.c b/drivers/dma/mediatek/mtk-hsdma.c
index a43412ff5edd..1c98fcedf3ac 100644
--- a/drivers/dma/mediatek/mtk-hsdma.c
+++ b/drivers/dma/mediatek/mtk-hsdma.c
@@ -1020,7 +1020,7 @@ static void mtk_hsdma_remove(struct platform_device *pdev)
 		vc = &hsdma->vc[i];
 
 		list_del(&vc->vc.chan.device_node);
-		tasklet_kill(&vc->vc.task);
+		dma_chan_kill_bh(&vc->vc.chan);
 	}
 
 	/* Disable DMA interrupt */
-- 
2.43.0


