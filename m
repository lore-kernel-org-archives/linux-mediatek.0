Return-Path: <SRS0=+Wu7=6T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F71C4725A
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2020 04:01:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA475206B8
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2020 04:01:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aSOcTNgU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ii8+KtIL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA475206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x2PxJYWemv2UzZQtfhnLmUkVVoQD2kiNhzSkqOjbarY=; b=aSOcTNgUVMkVnN
	OFVWYZPLYA/bRUyqBBKSi5bE67ZPawd6yYZxZoWMXG+rI7PfHVpH+x1RCR6JpKoPC7JGbb27oci9D
	nR8umS6hH9SiQP0tNOnggPNOQVBLDTytWSNz664l4R6m9ZdkDTeJSanl9RVHuiO4WlOL+qs8fW5qZ
	02HWtBxum4ek3BoKrDKD4zQVWqi+GPbE5w5ZSSEIeUpeXVpesifWYKdFhcy3hgA5fke5EMvt6toxY
	Ji6x0Bodcob4sDBZoKLdKESx+DNlivMj8Xa5cFmNYsrrnl2XBI2nL8tvziwIumT4Ssv5BGFnzyd+B
	Usoy0rf+bz3bnxsORBbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVolv-0003UC-N6; Tue, 05 May 2020 04:01:31 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVolo-0003Mg-Q6
 for linux-mediatek@lists.infradead.org; Tue, 05 May 2020 04:01:26 +0000
Received: by mail-pj1-x1042.google.com with SMTP id h12so669756pjz.1
 for <linux-mediatek@lists.infradead.org>; Mon, 04 May 2020 21:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ctoh4fSKKdbnfncF1YOVBJD74K9A/+MRfOMQ6EjpdWU=;
 b=Ii8+KtILgS8kUQw30kWi/g6X8rQQSL7btnKUADBZbiGPsB7xgLrjW/n8WdNDKbgQWN
 tD0CyhvsndPuo5olMQnHe7XkJqOToYWcqesKzfNx4Cr9zVrfqs44PzQD1F0/aSptMOBL
 eUsczSXbwqFmnb3O1kmfFjGdB5/HS/Xh7TVSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ctoh4fSKKdbnfncF1YOVBJD74K9A/+MRfOMQ6EjpdWU=;
 b=WmkQkyQXnZWR6rqQTQ4jm58zSk/zoVakfuiORVLah5HvokypSMXQP/9Oag5yFQ+LjH
 Cx4Zt9ps17EgThP9yWfKffHwgvSuvZJOA1aK92PJvae+phof634rD2Ir9f+txuT/g8IL
 /Rr6tzsOUIgOq6hgqLhrQh7JJjX3iq3fDRwSXohyV5jRYZX8stegJ1qz1bgvNuaihqxz
 EVyi4Nc7tHU41qP/dCaxZfsJDDgA0Z85Y+ui7T9UAnNQpZYNPV8NlilYaz2x6aIE8sD3
 ACmPhP67vpOq5HHsmJZZfq8h4auFs/fxloLmaVdeLhhkv2IohYmSkWkMdTs9D84wVvjr
 +uog==
X-Gm-Message-State: AGi0PuYz1HQCYfN0d5WHylkPORwx/adfB/JYpwzQXIXNV3Q2moEZvDFW
 vA9qrhqlkEKE1tv4iiMM4CydGg==
X-Google-Smtp-Source: APiQypIIEru/mWi8soSg13FgeYsWH8bdQu/U7isUmQMJNW8Y7jDjPHye4EUxOyOGu5+scYfufol+BQ==
X-Received: by 2002:a17:90a:7f83:: with SMTP id
 m3mr525112pjl.147.1588651283555; 
 Mon, 04 May 2020 21:01:23 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:a92f:c47d:76a8:b09e])
 by smtp.gmail.com with ESMTPSA id w2sm565152pfc.194.2020.05.04.21.01.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2020 21:01:23 -0700 (PDT)
From: Eizan Miyamoto <eizan@chromium.org>
X-Google-Original-From: Eizan Miyamoto <eizan@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 2/5] [media] mtk-mdp: handle
 vb2_dma_contig_set_max_seg_size errors during probe
Date: Tue,  5 May 2020 14:00:45 +1000
Message-Id: <20200505125042.v1.2.Ie596e59e0a18935f0b7321ff45e5c5f2ce8082b1@changeid>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
In-Reply-To: <20200505040048.132493-1-eizan@google.com>
References: <20200505040048.132493-1-eizan@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_210124_859481_805D1CD8 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>, Eizan Miyamoto <eizan@google.com>,
 eizan@chromium.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This is a cleanup to better handle errors during MDP probe.

Signed-off-by: eizan@chromium.org
Signed-off-by: Eizan Miyamoto <eizan@google.com>
---

 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
index aeaed2cf4458..c20ac7681c6f 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
@@ -193,13 +193,19 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, mdp);
 
-	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
+	ret = vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to set vb2 dma mag seg size\n");
+		goto err_set_max_seg_size;
+	}
 
 	pm_runtime_enable(dev);
 	dev_dbg(dev, "mdp-%d registered successfully\n", mdp->id);
 
 	return 0;
 
+err_set_max_seg_size:
+
 err_m2m_register:
 	v4l2_device_unregister(&mdp->v4l2_dev);
 
-- 
2.26.2.526.g744177e7f7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
