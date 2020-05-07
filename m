Return-Path: <SRS0=F/ID=6V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26E2AC38A24
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 10:25:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2EB9208E4
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 10:25:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jCRfwF/D";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Uw9tkn4t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2EB9208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iy4eq1Xg3ESLPuhB0X4iEAwyQaOgfPXs2XKOBDE2Mzo=; b=jCRfwF/D/FTKEf
	aM962Lx8Sc8ZbDevsPmOc2NtXwkY+9j4RDx/ZP1P0yWfEUPYLFD0fBPzQKRqeO0zxxIXD8+tEY7kc
	WIFkSAKOsh1CRkGzbFUFqYviA1qKAV7+rsJ0OrWD4KKMO5HsUBkyEuzBrN7wh+PUhSyRVuAhJfNay
	Xeq4u0hKH2cT0PeH9DyqzUUF1WOWgpKn1g7CtgLDg1dthAlec3osZdpy8R+At68XNnYoZOP3eKM3t
	AnwRQ+fbnBJPywRP4pQJLSuS8UW25GGi9ZM4DDh+AfzArZ8nim+kuT8ydtP5Aussx5WaINkH5XWPZ
	T1U8KcEYb7nNjNY2Y3jA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWdiV-0002RH-1h; Thu, 07 May 2020 10:25:23 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWdhw-00084V-Mf
 for linux-mediatek@lists.infradead.org; Thu, 07 May 2020 10:24:51 +0000
Received: by mail-pl1-x642.google.com with SMTP id f8so1902139plt.2
 for <linux-mediatek@lists.infradead.org>; Thu, 07 May 2020 03:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B/Mk9PnpQZ4xKWEBXlLMDvhktcZ9bgwGO85pTWBmd1Q=;
 b=Uw9tkn4tmqYAbTMf70CLe39oO9q1CC6aVjLT1Rme6khxLYX4hxUID3ZnvBSZGakv5P
 cGKuKJqk2HPHbQ4P1iQd69NwgL2xHQejKzAHF3MGaRFbXyURliEk1oHrAxQepDxSyXed
 VFbE4tH2UIH74TV9w+cRWY5I37BG/H1vO1EhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B/Mk9PnpQZ4xKWEBXlLMDvhktcZ9bgwGO85pTWBmd1Q=;
 b=IqsDLtDNjHVwKKJirs2pe4hWC8V++CAqnEn3wUdcx40XjQuxbFEluGHewT8mszhweF
 LSyCWdtmdzEyQLbGXjV67PQsMUqUvqoxsBbIttsO09Xr2796PTI4RnF8+gBwreNijS62
 iUttWF6Bjt8IygxZAo32ETt8ioK+FnJ7PVQ1SYTJAQWMoT2nl6aY1LiV2HvtmCtzHDR6
 DKUyKYlQwS7WA6BbU9ozAcRAbYcsZKlL160DuXPm0AZYl0SoahWQixy6Nwd4ZLtc6Pai
 NQy4t7oj1ikR4cqw/NR1XGYEqwQzvzZYY0dVSsZEUp2K4zzo39y6ANutQyDwSJWTC2L0
 xSig==
X-Gm-Message-State: AGi0Pub8BlTO+wHI0Yhi4HSMU0Sy9yNVUKw+QFr222UtFttGYnHoQLmS
 st9AbDG81UMBSNheBhCECYMfaQ==
X-Google-Smtp-Source: APiQypIfdyYf1DVe2NADcLWJNyPuVcmkF60Nyz26uFMfQ6Htik4/hMklktg3MMP3+ePUbdo+ebw1vA==
X-Received: by 2002:a17:90a:b78e:: with SMTP id
 m14mr2742862pjr.114.1588847088130; 
 Thu, 07 May 2020 03:24:48 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:a92f:c47d:76a8:b09e])
 by smtp.gmail.com with ESMTPSA id a138sm4514903pfd.32.2020.05.07.03.24.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2020 03:24:47 -0700 (PDT)
From: Eizan Miyamoto <eizan@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 3/5] [media] mtk-mdp: handle vpu_wdt_reg_handler() errors
 during probe
Date: Thu,  7 May 2020 20:23:46 +1000
Message-Id: <20200507202337.v3.3.Ia8efd7905e2fcfc81f547e27a51f06373624b3da@changeid>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
In-Reply-To: <20200507102345.81849-1-eizan@chromium.org>
References: <20200507102345.81849-1-eizan@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_032448_749167_0B9D0154 
X-CRM114-Status: GOOD (  10.65  )
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
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-mediatek@lists.infradead.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This is a cleanup to better handle errors during MDP probe.

Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

Changes in v3: None
Changes in v2:
- remove unnecessary error handling labels in favor of err_m2m_register

 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
index 9b24b8d46eb7..17d155219ba2 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
@@ -188,8 +188,12 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 	}
 
 	mdp->vpu_dev = vpu_get_plat_device(pdev);
-	vpu_wdt_reg_handler(mdp->vpu_dev, mtk_mdp_reset_handler, mdp,
-			    VPU_RST_MDP);
+	ret = vpu_wdt_reg_handler(mdp->vpu_dev, mtk_mdp_reset_handler, mdp,
+				  VPU_RST_MDP);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register reset handler\n");
+		goto err_m2m_register;
+	}
 
 	platform_set_drvdata(pdev, mdp);
 
-- 
2.26.2.526.g744177e7f7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
