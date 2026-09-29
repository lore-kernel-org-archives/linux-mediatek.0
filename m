Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31415CA5FAE
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2026 06:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yiOQQUNxogiUQyW9juq/yIUpauLJuI5yeb0AGzYfhSw=; b=rnx8RuSip1EY+CgiNuV/ChRx4e
	KEm1Dx4KHAgdhQqUAyIrJepKkWFC+hpSPnIKlVt0Iry2YgMtBfpRsA+f6lk35oZQAH88nQhWbzgWz
	dWlClfEvW+bR4HJl/ZJLdQlXD8gaUExWOInu0iZwqgksk2dX9EK+eV+BaX18HPTd3Wx9uNMWTzy9p
	uKINsyAZliuHUqcvSO1V/M3a4L+fX87cu8b0KGoutsm9VS3u1UkXh3X5khOAWT13HUIv4ZcPFsjN+
	SZSY1Y2g09qge0F6I+vD7Mzu7xvVlTtZJkwUL3GV18xlsoo1TTmrTicmqn0c5EiuaL6UCEDnw7cYP
	TN5MyqGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR5F-00000002QBm-0IAv;
	Tue, 29 Sep 2026 06:12:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR54-00000002Q5T-1fnn
	for linux-mediatek@bombadil.infradead.org;
	Tue, 29 Sep 2026 06:12:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=yiOQQUNxogiUQyW9juq/yIUpauLJuI5yeb0AGzYfhSw=; b=flPeehEVGUsRvpqATOuBEJFrH7
	2/XvVnPlBwdyAetjg/yXkP4bLfdn4amFPD/59OZnxXUw9aaINeUbNcO6/6yDAJtbowHzGFjk8A9jE
	fbZJ4+hu21dhe+ynu97Pd0+dvA5Cf2ZPK5nVQQAL/k765DHh+zsGyg8RdKzWpXLa4CITTZqXUBbGu
	DoTX+NKA4pdTUbPi/5nNQsgGzHYjgj3rTQz3bJubpDt6HpqUyNyKerxqVQ/Q9Au2YdZdrsuPzcNCF
	iDSgxSpbq7LGkAFIkRD+VAuBRwqrydBz1FJFDbdZxGeOeVOoqXpM09/SjcLyKEWmNq/MtfD1huHIV
	KIB1RqaQ==;
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBR4g-00000002EY3-1x6e
	for linux-mediatek@lists.infradead.org;
	Tue, 29 Sep 2026 06:12:43 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-3a48e359e0fso620076a91.3
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Sep 2026 23:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662340; x=1791267140; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yiOQQUNxogiUQyW9juq/yIUpauLJuI5yeb0AGzYfhSw=;
        b=IVmxgLvRcHErDL58JPJPo0SQ0ghykrl7ZOBkWrb42PDK3FFj3/l6tex2HvZYpwLgmt
         kp8lIssrrt/EIyflmVLDHY7VEsILhKBnu7tYXHk8aiGIMVKmgDi6PWxhx/ATXnyBHiRz
         6gclm95gnaqcRUgIvqNJSIfvzd+bD0XBv2AXjXv35lcXOJ6rL6jkRkCrL8HVSM6jn8TB
         NM3aFjzgU84MxWumAY1dIPLoJ2ev9MOJ3Q4Ksm1BGYJOu5IQKulIZlm5x64O0sHbtkYE
         BJwoKfbVDlt80ewe2KElgRmvV8nfM2IupESgnCwYyiPxGfJK6MV1dwIlUxRbDrMSmM6U
         A3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662340; x=1791267140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yiOQQUNxogiUQyW9juq/yIUpauLJuI5yeb0AGzYfhSw=;
        b=qHoPoylX2Kx+ZrBMYqg6WerMy2MOVNyETGe9wv/01GRoxIQluVjro8l2jqH7/yK9QX
         6NffYpPkuqVGHeH4eX9HZYWcTW7cCNJQgctxXn6leMF8diI7q2/huUtjG2B8qraDGuMN
         C/WplcM0AgHvZnA1xFg5CsRVTI11fabZzVFJPB1bNAGL74lBz3CgmfaYSOfPPubjXAmn
         VGyE9szGuCk5TMmYpAFyNSPYedT3+eITJpC+QhJI3fAYDtX9YTO4422osF1g0FV+tpnW
         35ZuKxc62Z8q+zv2+70LCrolsrBlVo4fxenynDVIODbypqL+dIwq2MbVZg0LV7zh4bX8
         zhUg==
X-Forwarded-Encrypted: i=1; AKwUvBzZtcN3yOl+SY2H6P9k1eOV0OpAK3wx85k3gibvTE1ycBUQru4lV85KttYTK6nh+mWQwnBe+u7MheXlbhjGOg==@lists.infradead.org
X-Gm-Message-State: AFq9FYJQ6w1iGIBtvtULhOIVANsh8xyT9Dz8WL5dTr9hi5ntaXoViADk
	Ne9M4x6Wwpt09Lx/HiPWR9y1ynmWvG5xE8x69DUoe02pd6KPk9nH7NPK
X-Gm-Gg: AYBFou2cYBe7WHZry8QCBEjj6jEWBePWgnj4UiGNH8lc0qF0RvJRVpP0nTHSIQH/kgF
	ab2g2tp3D3fxNk+D6YJ1fR8Ibpqq1OjO3z8d/9yUnBEq65QtE5O3IGrw+g1xgZP737vJrb9tRdV
	EMZdM2x/aEK7aymIXtbWeM7TZHMWNzSPVj8i+eQGLyyjL3Tuupzjd0mUzFDaoVo2HuEtow3V/7n
	q2ZgG3pbjNTepDB40sQXTYyweprM5mr+pHRr+IJmrPYULKUHQgmC2EZVghRNEsiJ9mZRa5J8WJl
	3u8PUvrU+C0Dq2k6omeTtwAJnCt8VQJywHdjmRdy2p3W3LYhPAIa2fv04TUsrUKvYkoEYbP/Yrj
	/K3r/YuJemfiK7z8iOlj9ZsnTS2Yb4Wz63IrseyNXuR0ELUUY9xD5E2OVvHZDPanFZ1qwSMrQaC
	OSjpz8J0Y60ShPruPFyNHzeM7RSTceJvx7hB5wpuJ9msMBYqS+QlqeB7Pm9hmmMxExdJ0VTC/0x
	/21B13qfDNgQ4CbwTNXDZ9+/dN5OVXk3HFjgaVqDEVDjY/U67BBJnYYxIlwf5ENJAcxkQKX0Epd
	z4G21AbvY3r4aw==
X-Received: by 2002:a17:90b:4a82:b0:3a0:cb48:df6b with SMTP id 98e67ed59e1d1-3a0cb48e2fcmr9490197a91.34.1790662340222;
        Mon, 28 Sep 2026 23:12:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498726d63sm3280965a91.17.2026.09.28.23.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:12:19 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Darren Ye <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 05/10] ASoC: mediatek: mt8196: propagate main clock errors
Date: Tue, 29 Sep 2026 13:11:16 +0700
Message-ID: <20260929061121.124001-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929061121.124001-1-phucduc.bui@gmail.com>
References: <20260929061121.124001-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_071230_356853_0A8F3C12 
X-CRM114-Status: GOOD (  10.77  )
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

Propagate errors from the main clock enable and disable operations
instead of always returning success.

Fixes: 7384ecab34eb ("ASoC: mediatek: mt8196: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-clk.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
index 6198711e01b5..dbfd02d20338 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
@@ -598,14 +598,12 @@ int mt8196_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
 
 int mt8196_afe_enable_main_clock(struct mtk_base_afe *afe)
 {
-	mt8196_afe_enable_top_cg(afe, MT8196_AUDIO_26M_EN_ON);
-	return 0;
+	return mt8196_afe_enable_top_cg(afe, MT8196_AUDIO_26M_EN_ON);
 }
 
 int mt8196_afe_disable_main_clock(struct mtk_base_afe *afe)
 {
-	mt8196_afe_disable_top_cg(afe, MT8196_AUDIO_26M_EN_ON);
-	return 0;
+	return mt8196_afe_disable_top_cg(afe, MT8196_AUDIO_26M_EN_ON);
 }
 
 int mt8196_init_clock(struct mtk_base_afe *afe)
-- 
2.43.0


