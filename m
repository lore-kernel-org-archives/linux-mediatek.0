Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDCCC88E7B
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2026 11:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pzARCoC9K2+xHcKxtS92tzMDdovjtNP+xvj5FczbmUY=; b=VXdfU7rIj5cGDpnjA7fWwt0Vxe
	QgEZXk8AMik/e4CxfqhLAWtOq5G6FaO78LIwyGTs6Ry1KZVOPX8Qd2stFeSjeWOGP4JbUJ86c8MdD
	dp+l+UvtvSV+19/u/7WLNKzN8Dq7bqpqJJ8iqQvgl4YrNwvYNbAjpGDQNxOnSLwUq8VfUwbXZWjuN
	iEuEdIVn2wb36pA79K/6GQZykFA+U5Cxh9C7nTOJSmy4+mbpF8go0fTM6vKPqkDGcO6Cu0jr7n1QV
	XxTFYLcNlLfepLYvMRG+auCPRH1mgUsEee1V5uNnbNcD/BjC1ah6uhnh29gGMcL1pcCpgRvsIdhNn
	uQci+hTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RgJ-00000006Ivo-3L5L;
	Tue, 15 Sep 2026 11:50:35 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rg4-00000006IoT-16CV
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Sep 2026 11:50:28 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-39dbdfaef3cso3131245a91.1
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 04:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789473019; x=1790077819; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pzARCoC9K2+xHcKxtS92tzMDdovjtNP+xvj5FczbmUY=;
        b=NwUJGS4S7zZYpZbAmTdWZaCf8sZBZRU1Ag90AVQ8odOauGdKUri12wKwCEXHjacufQ
         eP3zXIvhRY73aS0cqwiC2DmKRptTBtRfzn8U1wREMIRDDEmrt9rcU5AS75HoDqTRjyg/
         deF8/cnLP0cV3rF/+5Xhuw7oVYbdWigSorWXRJ28O1VCj+fbAQkUP3hfP+m8cJ3x7UbF
         tHEXK+He36SJe0rjbaLAI/amPkheanUn6EWl5boZR2xHdAvPXMdh4OAc8+ugg1UbJA67
         mIBWGPCFrNwjbAUyp5QkgV0QjrFOWVCWLgwR9moaQ52exIsGBi9j1uF7oYLiQSpUGEG0
         RB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789473019; x=1790077819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pzARCoC9K2+xHcKxtS92tzMDdovjtNP+xvj5FczbmUY=;
        b=QEzV2zc7veK3tVFQVT8pkFwi8TsTNxVNjQKSTesTxwjVjmN5LoNg7nLq9bGrcVvTaI
         cztyLB2KdQa6gkrXebzG5ZSynXE//zoMV1QchcLBjljYLpMJTm1L+sRKD3s+MJu60iPv
         pZG9PdLCSpfvy/D9YRk4dg7Lvnw8vHnowoJlN2iB2zZU1j4WtFnsbHkX4TCiiAzhcMsj
         RCeYklgRLx7X8d/n6Xld2WNjfU0541j398MRo7sQZdN0E+j7+1T4MNple/F/6URjQBJl
         oOyXWSqQdHPWZpqNS5TsTpWptvZRfkT1H7LfXqmVpPznOmeWs8sG9TYQNSHdqtn1lXmY
         ouPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzysF7VI7r7UNTJPOc7ME6TBdtdqGfBJnrzN41qDrghFu86S2M6w/F0GiVCfsLJSG/Ug4Wmg0s+OOZlXfigVw==@lists.infradead.org
X-Gm-Message-State: AFuF++mJjXIuVKZgTuvT1Ijs7Xy7q1/tUAoGUP2RdgNRR1GSZd5xOe9l
	NwrC4hezcUiVbRcB8b0rz3Z/xdHXpyNhq+2feWOYDkkNvnBGPWSiSHw1
X-Gm-Gg: AYBFou1ZxB8z2z0qykUt5XPg1Fz2a0lSwpJMLPSNr+OXuD5XssdcGs0feYTQKdV1XG9
	yQ090EGh7HEZv6Cgzylxt7YsLVLIXKgIy1a3FZqCYQaN7jqGu0JkT4+4FPeiWdMjIP7XkqFiZRN
	c0yVkUzAYibAawU2ERZsBnh7SSpMfa2ca0nJMP57NxWMTgGdUIVpZsb7ab1vkZp7T9US1Y/7/bN
	eHrex7FQLXCqPtTHUR1HcxDKrqDynF0tV5gkORGXJyrJr5XTnEHKjrG2XtdQPwFCBRbNKN3GEOh
	rEbm0h7y5khWNniYZ+OTInVk281jyGw4BHoh7Oc9pG8phEOkVBNEfaR2qSd7ui+cIut+KQgosid
	uNmQZwy6cqJ24Kiiq5ix8NLq2a5UrcpUJ+fQA1jzWHnpv32IbM3r1aJQ2l/3HUsodi78fd4vEWR
	EGL7bvWPMmQraFMc7Wt86N8hW1Mx7AKDgBcuhNgWVUoS5XMaNJjudl7g==
X-Received: by 2002:a17:90b:1642:b0:39e:b7:cbef with SMTP id 98e67ed59e1d1-39e00b7d25bmr6619070a91.25.1789473019195;
        Tue, 15 Sep 2026 04:50:19 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfd9baad9sm4943498a91.4.2026.09.15.04.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 04:50:18 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Johan Hovold <johan@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
	Moudy Ho <moudy.ho@mediatek.com>,
	daoyuan huang <daoyuan.huang@mediatek.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH] media: platform: mtk-mdp3: fix resource cleanup on remove
Date: Tue, 15 Sep 2026 19:50:06 +0800
Message-ID: <20260915115006.2409591-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_045027_615146_A6306FD2 
X-CRM114-Status: GOOD (  12.94  )
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

mdp_probe() has two successful initialization paths, but mdp_remove()
does not correctly tear down either of them.

For the main MDP instance, mdp_m2m_device_register() registers an M2M
video device whose release callback performs the final resource
cleanup. The remove path only unregisters the V4L2 device and leaves
the M2M video device registered, preventing the normal video device
teardown path from releasing the resources associated with the MDP
device.

For secondary MDP instances, probe returns successfully after allocating
an mdp_dev and storing it as driver data without registering an M2M
video device. The remove path does not free this allocation, leaking it
on driver unbind.

If an M2M video device was registered, unregister the V4L2 device first
and then unregister the M2M device so that its release callback can
perform the final cleanup. Otherwise, free the mdp_dev directly.

This issue was found by manual code inspection.

Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
Fixes: 4294b9d6c8c4 ("media: platform: mtk-mdp3: avoid multiple driver registrations")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index f412aadb5996..bf5cc20af715 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -374,7 +374,12 @@ static void mdp_remove(struct platform_device *pdev)
 {
 	struct mdp_dev *mdp = platform_get_drvdata(pdev);
 
-	v4l2_device_unregister(&mdp->v4l2_dev);
+	if (mdp->m2m_vdev) {
+		v4l2_device_unregister(&mdp->v4l2_dev);
+		mdp_m2m_device_unregister(mdp);
+	} else {
+		kfree(mdp);
+	}
 
 	dev_dbg(&pdev->dev, "%s driver unloaded\n", pdev->name);
 }
-- 
2.43.0


