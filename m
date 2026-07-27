Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6A9C531D0
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 20:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IQUfL15au6uUXVbQCz9brQWDzEvsrZiPzLH8SIYjCQQ=; b=xGAdQ82RjXTAe1aAp+DXOOri+f
	E3+Qh1JO0NiL9jHu/mB02W4UGX/Wv+wXBl06JaXMDXZY0VEhtMiXAQrqnAJkhGDiZlLkJxDM4o2gp
	9m4BWCEMAXOznyx+5Jok+quL3iHtwINCXSS+x5vaJoplKyLeNvTuSWp82XoWiQWNH583eB/757SUN
	uN0OIGI2JycpCbJ/DRoy+l40MwzlzKKEIPWaO/jDjMtqEexBeMB5bnrOoTBSnz9XxaKdEAkCj5bjy
	Xywyi3idfU1pBlq3dHft4Z+Dj5w6EH3J3WLYCpA1AJgu0A+/b+IIr5Q6IyrsZe8VAVo2dS2SvRvfw
	d9fLzD3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woS66-00000003rSx-244n;
	Mon, 27 Jul 2026 20:38:50 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woS64-00000003rSI-3KXY
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 20:38:49 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so3029633b3a.3
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2026 13:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184728; x=1785789528; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IQUfL15au6uUXVbQCz9brQWDzEvsrZiPzLH8SIYjCQQ=;
        b=LQ757hX0G0Rmf+S7mixwKK3s+f02lI5hn/2UxUT0RRAyX3edOtBzbtHDq2NNuaOome
         zUlpu0ZeaGTvPboYay8d9N1VT9wik4YoHy/nlC+HudloVxsiydIMxuq5N0Tp4Me5+Rz0
         QGnDNeOfQIsWehKGcDqq3U3f7XUKUrptF1IevB+WccFm8SohAjiiX5lHw2bOrLkwg/hN
         NdKUeUqKphLQaBmREUmIzIMw9+Fk92+i47qyL+wiXD//oGBlCK5UBLvdWpr/k/s/u4oh
         bGhn13KjlfH33icDd2Gjeqrad2YXUjHgz1Rak64mPAfMwE6728wuVKKm1F4aHGzYIv5D
         UjbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184728; x=1785789528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IQUfL15au6uUXVbQCz9brQWDzEvsrZiPzLH8SIYjCQQ=;
        b=eWDGJmhAzS+bgr8/O6g/U1aAJSY1D/nuwHK9LUtDSNKHpGtxQ4rTU89+DbZkeuyLwb
         oVJEon72WTIyC5c56mwJ6mehOB6TfyD4uu9dtDFiYXiZpIUsU+RmhdZGnj8EHyEVKQGF
         xRHnDchahQMhmkt5UV7LCrP3y1inKJsGepYiTrweGSKUdSkrR+vKf/JUfZ5/r6HNJNtY
         PIWzv7kndSOzHRHoawY6ViPuzTm0wyQeTGZUoylAzE4DeEmY7Jz4kot8oeExAjvA0Ajc
         W67teeLxNqFm7Ani2FQgyWIhOZ029gg254CuhpWiqTyYs5sFRo0ytyIxPWS/PKniJm9K
         88cg==
X-Forwarded-Encrypted: i=1; AHgh+Rr+/3netAtpe5ERCBxYZb19A7mxOIAw37KTOqZ1vpI8AUJ+vH1GBVjBArOWglHCiw9iJHHgi/NoZlThvY33TA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyHyMlsaUxmn/zJgP53ganhQcyuyX3a2BGbJyJdMfxHJfscvbYQ
	Xj+spsKlcIo/yj9kLAGfc0Ss8mVRjadHRe7UB+83jxDxsR1Hm/uF0qNz
X-Gm-Gg: AR+sD13jc9sWCQ47OtMyPXxUhgrzOMYY7WJPRKbPMMlFwVXNI66a1lDHR85pTV+3/NH
	pPZb3B5zLdPs7m1AubzSgfddTTDQ7UXPwnn7gtXloVTVUeEC8FJU2p8J8PPj9aAOeUOYdtJudgI
	UVTd1zPnHu4eGniP7sPngTxQhOGnk7cqGnuZPYMUpevlmNVA+5wtzsvxK9qwtpqNNLV7flJHAZJ
	v4AMxM+sYEaEmnVcY82pqMIzUEGsWQRP8hmOk3o8cFAnqnF6v0e5JBMwYor31rKl0LqwqGj8NOy
	lQsBoGQoUHQAn29Gc+K6+sVqzFTyvUz+OaODxrrKffIcJjzmuRLYXQOcM7C4Qon8iQ5Jl+oP/Wg
	rSSUyi015NqmCU5b2tqyNZwBh9ZvI10Os+vMpT53nNxIt29kHgPeJEeG+QZ1Z4CeLfViEpA12Vh
	de5Knj
X-Received: by 2002:a05:6a00:178f:b0:848:2f73:8ffd with SMTP id d2e1a72fcca58-84e8d4c5f77mr750987b3a.70.1785184727948;
        Mon, 27 Jul 2026 13:38:47 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5344e583sm3472383b3a.57.2026.07.27.13.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:38:47 -0700 (PDT)
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
Subject: [PATCH v2 34/64] dmaengine: mtk-cqdma: kill vchan BH on teardown
Date: Mon, 27 Jul 2026 13:37:43 -0700
Message-ID: <b0f12f19d5ad706bb5dcb26cb0e573d78ca22e2f.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_133848_854827_4AF4D21A 
X-CRM114-Status: GOOD (  11.52  )
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

Use dma_chan_kill_bh() for virt-dma channel cleanup.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/mediatek/mtk-cqdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/mediatek/mtk-cqdma.c b/drivers/dma/mediatek/mtk-cqdma.c
index 80791e30aec2..3b0f1d8fa205 100644
--- a/drivers/dma/mediatek/mtk-cqdma.c
+++ b/drivers/dma/mediatek/mtk-cqdma.c
@@ -895,7 +895,7 @@ static void mtk_cqdma_remove(struct platform_device *pdev)
 		vc = &cqdma->vc[i];
 
 		list_del(&vc->vc.chan.device_node);
-		tasklet_kill(&vc->vc.task);
+		dma_chan_kill_bh(&vc->vc.chan);
 	}
 
 	/* disable interrupt */
-- 
2.43.0


