Return-Path: <SRS0=F/ID=6V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F24CC4724C
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 10:25:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 152A22075E
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 10:25:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nev3DFrP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bFZX//5u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 152A22075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NeL/i2HR0/tWsIa0O/f1KuTshfaNYNWaigYZh9rbdF0=; b=Nev3DFrP1QpnA9
	cAP2baZq20FeJbPCZytNTpw8gSlXz8V42bHin/VVlR+M7Lc9BHHi+cv5TNI4xC9WNT7e++wJmRFAw
	Eb1nbSuW9eRR4oLyS3WYLNIp+z80QpRqH8gGXZPb/On0Du+wn5ZbH1gmp7IcMzIpqU12xHVrrM9nz
	y090cCcl9fE9JFMar394R6ROjEtZ2obuZWwK7Ffet+Hh49m1TWStWzpOEnbepJg/KHmS4MtYdYokp
	2457L5vYctk3Sd1C9MqpSO/X+ad2XXE1+4yPhyrX2gwcSGCpSTmTokDZK9qKdXZ9mXJyJptKMRYBM
	KNXPiQ+DkYZBO7e2PiEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWdhw-00084y-TP; Thu, 07 May 2020 10:24:48 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWdhQ-0007c5-9v
 for linux-mediatek@lists.infradead.org; Thu, 07 May 2020 10:24:17 +0000
Received: by mail-pj1-x1043.google.com with SMTP id e6so2428102pjt.4
 for <linux-mediatek@lists.infradead.org>; Thu, 07 May 2020 03:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oo1xnFJoKnJRPCb1k/kpUqpuervQpCi0IylZD35uCtU=;
 b=bFZX//5u1biNAhAdVXKnxlQhgXZg0E2/qIYtejPF3hTyPzdudv+Hhol6yhMhe+pLXR
 qi4+lJDJD7wqFhb1fbU2HQ7nJpMx8oxCrZRVXU3DeP/7FtrWOGlSHLeIoomLn/ZIuZt1
 UiMxHSLmOE2/9gbS6u8Dw1em28VAE3YDr4jx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oo1xnFJoKnJRPCb1k/kpUqpuervQpCi0IylZD35uCtU=;
 b=t+ghJ9XVZ6N9CRCcddpScJ8RWm8YrOTHIJMDFz4n2w8detxI+MsArErLcxiqkCMp6V
 lZ6bNDsErxzt46y5rgTeAVOiRb+MzRE+zbi+SIPoeoClMb/SZ1AiUrQHNUzx2XS2gbgk
 TSZa5OZdteg0GZczx9IVmDPREbKoOonwmUk9cA4uUW6/n3O3myNFNGHTO5+UlBo1w0Lb
 lffbo5jJgh2/Kl4Zf3m17nwBw2l6Q+6NRRutyAvl1GI1xk/8zvPJDf46GuB6aQ/J/6oe
 KETjWf+eIvm5/a32l8onEmhYPV3Hhyw5egEC70oOmLn1lZRZOgHiMnkXAso5iOsiYFQi
 28AA==
X-Gm-Message-State: AGi0PuYL+zFvTWKeg6J4AJTQ9W7a/707d7giTvUmZaFY890dUydNlyEe
 S5uT19BgsqW5Tp1t2waKUjS53Q==
X-Google-Smtp-Source: APiQypK0Yj463Sz55i7hlJ8Wfduxc6jBmzjwL3+Xbpt0RRZaW6Bed1aBCs2s4nzl9RneQvMrKQc2Lw==
X-Received: by 2002:a17:90a:24e6:: with SMTP id
 i93mr14512370pje.13.1588847055212; 
 Thu, 07 May 2020 03:24:15 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:a92f:c47d:76a8:b09e])
 by smtp.gmail.com with ESMTPSA id i185sm4408872pfg.14.2020.05.07.03.24.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2020 03:24:14 -0700 (PDT)
From: Eizan Miyamoto <eizan@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/5] [media] mtk-mdp: remove mtk_mdp_comp.regs from
 mtk_mdp_comp.h
Date: Thu,  7 May 2020 20:23:42 +1000
Message-Id: <20200507202337.v3.1.I0d52fd84fe481e254a10960b060f32c47ce0d202@changeid>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
In-Reply-To: <20200507102345.81849-1-eizan@chromium.org>
References: <20200507102345.81849-1-eizan@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_032416_369682_C8CECEFE 
X-CRM114-Status: UNSURE (   8.63  )
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
 Houlong Wei <houlong.wei@mediatek.com>, Eizan Miyamoto <eizan@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo I Serra <enric.balletbo@collabora.com>,
 linux-mediatek@lists.infradead.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

These fields are not used and can be removed.

Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
Reviewed-by: Enric Balletbo I Serra <enric.balletbo@collabora.com>
---

Changes in v3: None
Changes in v2: None

 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 1 -
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
index 58abfbdfb82d..c76cd61fb178 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -106,7 +106,6 @@ int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
 	comp->dev_node = of_node_get(node);
 	comp->id = comp_id;
 	comp->type = mtk_mdp_matches[comp_id].type;
-	comp->regs = of_iomap(node, 0);
 
 	for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
 		comp->clk[i] = of_clk_get(node, i);
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
index 998a4b953025..3b83bd6e0d8b 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
@@ -38,7 +38,6 @@ enum mtk_mdp_comp_id {
  * struct mtk_mdp_comp - the MDP's function component data
  * @dev_node:	component device node
  * @clk:	clocks required for component
- * @regs:	Mapped address of component registers.
  * @larb_dev:	SMI device required for component
  * @type:	component type
  * @id:		component ID
@@ -46,7 +45,6 @@ enum mtk_mdp_comp_id {
 struct mtk_mdp_comp {
 	struct device_node	*dev_node;
 	struct clk		*clk[2];
-	void __iomem		*regs;
 	struct device		*larb_dev;
 	enum mtk_mdp_comp_type	type;
 	enum mtk_mdp_comp_id	id;
-- 
2.26.2.526.g744177e7f7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
