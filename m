Return-Path: <SRS0=yMRY=6U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C96C28CBC
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 05:51:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7540206F9
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 05:51:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ofm3eVXh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ej7fOABB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7540206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sAf7/+qrY+32s2xO9t2xmLFHPPWJ8d1p5tgLiVuM27U=; b=Ofm3eVXhWZ9xHY
	7O1Mxr2MnKoYh++lIlSkJpNSM8xRNMSVbM04tHtd0mQ6AETDMaGZjf6t3rAmMWLsMYCrFwromse86
	T+32oFBHMCvPy0j98e7muzedZcy/jzGxZO6q0M9NZrZ3487PjWNnglJpQWXi8krBGWLsyFeWObEQW
	avvYdd82ovQlJST0QoLrWc2sG+JhPee5fx4nbM1G6+53kfFotkZ/MiFMt9v4b8+XWTPWnSUE3cV2p
	IgFwQTtCMWH0ChGPEvg+tUqrTcg3C/ppq0ZWF4PPOR823S8C8zqv8ngIj5qP0pa0vU8sR9PzWbei9
	I23NouRpwwk59BNhlEDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWCxQ-0007mL-HL; Wed, 06 May 2020 05:51:00 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWCwn-00078z-PH
 for linux-mediatek@lists.infradead.org; Wed, 06 May 2020 05:50:23 +0000
Received: by mail-pf1-x441.google.com with SMTP id x77so474880pfc.0
 for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2020 22:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=POceMM7hG1Wtztbcwf3G6dremJIzPAmuZKv3zO2DdE0=;
 b=Ej7fOABBLfr1SN0apV87KeMrwvbvxDU3i1UCROPXswmo0RGviza3edMx/g/ub/mlAC
 6gOfyEncqNbhatR7uPY4Kb7OwU8Zwz7gAo4mNkPj8DQ0s+PW5zKLJGuglOQOv971ivPm
 cm6gxqpNX715Mxq650ozR+wi9DzQEuEU2gZ9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=POceMM7hG1Wtztbcwf3G6dremJIzPAmuZKv3zO2DdE0=;
 b=ulLbIolDHSoN9g7Gm5PlQ6D8plYoVI0+o9Wy3zxSzZ9sHVwLeAVexeoKm2NYLP+0SE
 vmYDivKaAA+M3TzC1vAwMCO1bvToYdvDk8fSJL2fc6DhRTqhHWo9TgsHyMLKy+Y1Cob/
 nURmBtoecTblf+vII4Rj5Q2Q9YfwD1fQ6seJAS8r3okl0ZU8waNSE/OvcT44qME+9OTJ
 1qdMtZmoGNm3314GAi8X4d/P+3tLS1yDtGR/MBTiRlYDVaB2x4on4UFPydTgOcH9XgtH
 Ak/vEq41aGc9EtlQuLM/vIJQkE5Lcl7GXbgHjFHe4rESd0RJCeVi62pjLMlbOmiFuQoo
 CE4g==
X-Gm-Message-State: AGi0Pubq4qR5aNKoG2NTvpT2VOj9sSf0GhSyt1B9lkL4AOr/o6eMJJIo
 wXfQznWirvzSQ/+Ti1Y+Vc6c1Q==
X-Google-Smtp-Source: APiQypLs34OzIA/qNT4zrjxM2MJ+J7wyvZaKQQqG+9wBc94UWI+Z0oBDVEUVVCUVLxdScKVA338gbg==
X-Received: by 2002:a62:ae13:: with SMTP id q19mr6772243pff.310.1588744220983; 
 Tue, 05 May 2020 22:50:20 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:a92f:c47d:76a8:b09e])
 by smtp.gmail.com with ESMTPSA id f30sm3870470pje.29.2020.05.05.22.50.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 May 2020 22:50:20 -0700 (PDT)
From: Eizan Miyamoto <eizan@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/5] [media] mtk-mdp: handle
 vb2_dma_contig_set_max_seg_size errors during probe
Date: Wed,  6 May 2020 15:49:17 +1000
Message-Id: <20200506154832.v2.2.If340fa06d86053aaea25841b36741fe69c3126dd@changeid>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
In-Reply-To: <20200506054920.109738-1-eizan@chromium.org>
References: <20200506054920.109738-1-eizan@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_225021_849814_A5218E7C 
X-CRM114-Status: GOOD (  10.78  )
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
 Houlong Wei <houlong.wei@mediatek.com>, Eizan Miyamoto <eizan@chromium.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This is a cleanup to better handle errors during MDP probe.

Signed-off-by: eizan@chromium.org
Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
---

Changes in v1:
- remove unnecessary error handling labels in favor of err_m2m_register

 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
index aeaed2cf4458..9b24b8d46eb7 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
@@ -193,7 +193,11 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, mdp);
 
-	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
+	ret = vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to set vb2 dma mag seg size\n");
+		goto err_m2m_register;
+	}
 
 	pm_runtime_enable(dev);
 	dev_dbg(dev, "mdp-%d registered successfully\n", mdp->id);
-- 
2.26.2.526.g744177e7f7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
