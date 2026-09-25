Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E019C9830D
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2026 04:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u5cOpKUrfnSjz/MBJQnHunIOTLFWIe1DjKdr4y4mBIY=; b=cQHCpjQVaYCiyaCzBwhB+sLi0n
	zZUsE+hH9E2AvwCJSiVWbkXjj+k9yypxQi5GKhwlKEhwPTLtPssogzRdvt/aMwWyZtzE2B0uVGgXA
	bKr6Z0Sga7Uc1qAfH7pg4T7JFc0IuH5ExtJVjuQNGFLzKEiGz/8wX2XcpwWpTDLI0jx6ReDEvYSIP
	G73Ipg7Yc//cg5iH636b4F4rVbx6Etd8f6PQnw9y+7aWGyTG/8XG5/rLUUerfS0+S+BNrGMyFXI0t
	53w/q/co0UCiXs/093TaBicHG8OM8fd0aPnhLKPZRugZP46AHbLtWXpM3nPuJwd0DCQYRgxXYrBGu
	ki6gO7wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xtc-0000000Cdtj-2OdS;
	Fri, 25 Sep 2026 04:50:52 +0000
Received: from mail-pj2-x0d.google.com ([2607:f8b0:4864:39::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xtL-0000000Cdfm-1GWe
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Sep 2026 04:50:36 +0000
Received: by mail-pj2-x0d.google.com with SMTP id 98e67ed59e1d1-3a0bd71827eso111433a91.0
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Sep 2026 21:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311834; x=1790916634; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u5cOpKUrfnSjz/MBJQnHunIOTLFWIe1DjKdr4y4mBIY=;
        b=eZeaPo6kt3nhKbPKZH/iYJN7laCyfnHwSr72GHaTmds1IXdr+v7joO+RcrfWvI0uW7
         2ck7iRHxJZiOi2PK27ZlL/HsVgHc8hNYAcRAYsEbHszALJhFGJGkMtCRIJ5EkoakeB26
         f+1WSkGb0zAar5+hi6ocim6wUFWnUENk6OlIaPCvyXHbta0oubkrvImQc/xvOWDAK8Ze
         lhcJdguL82Rwwur33Z1VcmeIn3sVuWq3TIyD/hQFWJKIxBIr77tm7wnTA0U558hG6Vwa
         Tdi9wXTtqz7r3ZieRWH6AtmoRIhRoAmR2nH5M3pauXrWJx95NluOz4qvsMQlwecmXIz2
         sUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311834; x=1790916634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u5cOpKUrfnSjz/MBJQnHunIOTLFWIe1DjKdr4y4mBIY=;
        b=CrUHYRvx0HVvx6RwI1CH36wd0dCu8uarl6k5o/YVdVmId1GkbpnD4Dn8nKF4iHh+Gk
         8sVu/KJFRKB3Tx3TXcQJtptjNCb85QthwxYndzUAZZnAr85kynpxcWqRXhZ2vpbpIrpa
         YJajk3MRx4CvbrdnQ3TecB2dT/UVxJyY8C84NxmxTPmGCf7OynxAE0paG0Ic75oujcsF
         lXhogDbCi7DPw2OW3OAH2o1ur1hhTmvk1rwS0AZ/EaKRKnd75RmyhTUnp7voyVjNkiZm
         xSlx+KT2RGcicpMSRszugQgR6s60ZxnAaQk+pxti8+FFs/2j+P+fQ1AqPsTEr8XuzWfY
         kJdQ==
X-Forwarded-Encrypted: i=1; AKwUvByBQ+cjNiRBF7KkkEWpdE0nGn+RLS5UYkOIaaXJmmVP3oZJYMo13jpkmkS8zzMGxidIhU38VW7NbA0GE94HgQ==@lists.infradead.org
X-Gm-Message-State: AFuF++kqOBJGbdSuan6+D9xXy+OD1NGlnaAGvLsvh6ktahtWqM/ohtHm
	77yhu63S/n/skBq3o+ngBzWc4h62x/8vb/YuLuUeZf+ILfz4beH6IOmh
X-Gm-Gg: AYBFou3nuP1ujW/SObTMPhbvxm2s53n/NTWnHun9eE6p60iGDr5ShU693FltC1qj6mC
	9qCcYL/pVTRv8ec+t8ZJfPjX4ZQ277VGOsiqkokL0lX1dRYDqjn6tFBHP2cp7tN0kk48az//DlJ
	cU340cNXkQvdL2wa4XyelyNnGWXPzUyMov/F2eV+WBx1hy5UTbw8/yEJ+F8SlXIw0D+X6htlat1
	+PavER/M4LQmVFMqpDjvtL5HO+u5+w+r7TxLkT0GJk+bzc9rlQDiNpY+7HIiXl8Y3oer4NzuPKv
	2GMtmL2OcOg/NsTyg61xssF1jBZuzQ907RnY2iy4UNnkwc4nzTNJGMn30byky3W8cmRKxBc4ZAw
	oxgHLqjERhBuUcVfWDmQqKbGBPys2E/rqnAF1Cb/MGvJAx/vboIEY/8QLsHJw9bmqgpNlYW5cvs
	+nfZtIgr/6XBlwtAMkAk4yZHPequQohMDvuZ7UHIgzLhS/nQ/v31KjDz488Z/sOcksfTXCLz8pZ
	CSABvBdIctXUU/m5Z58ywW+J1KFugEqIvwYLgNAqm0erVHHpNacY+/bFmgn96oogJXoWHHO9fHW
	q8o0GxuuCoZ2CA==
X-Received: by 2002:a17:90b:3b51:b0:3a0:b312:1fbe with SMTP id 98e67ed59e1d1-3a0b31224ebmr1565733a91.23.1790311834493;
        Thu, 24 Sep 2026 21:50:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:34 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 09/14] ASoC: mediatek: mt8195: Propagate IRQ lookup errors
Date: Fri, 25 Sep 2026 11:49:03 +0700
Message-ID: <20260925044908.450775-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925044908.450775-1-phucduc.bui@gmail.com>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_215035_362876_03F930EE 
X-CRM114-Status: GOOD (  11.77  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Propagate the error returned by platform_get_irq() instead of
replacing it with -ENXIO.

This preserves errors such as -EPROBE_DEFER for proper handling
by the caller.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index b8c3636cb64a..057f116645c6 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3125,7 +3125,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* request irq */
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
-		return -ENXIO;
+		return irq_id;
 
 	ret = devm_request_irq(dev, irq_id, mt8195_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-- 
2.43.0


