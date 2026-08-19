Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BCB2C5DF6D
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2026 10:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EVppixrYxL5y3w3BcKXCVN+y3ZJBGpAZgIw7a8RJ9tU=; b=lZ5K10LExMT1neMZvfDJutT0KE
	uh7osuo/2Ba9Kxtei1EN1gRZp2YtpHPCyEP8uYsUh11z6BZEyJycdCRlzFaUlAd2zc7VXZlPFRqB3
	Cgpv+JdRa8ef26fR/Weaoeoic2tjWHGst7zOzzhAxosBIgiuPe0KfO8KYHcJVVDE5r6nY/cvxxgMl
	BZqfrDUHL3/RQSjhrfv8o+mProje5zywf/QoqznU/OYzfI1HgH9UEeMkW1WEzqml3kWQbB2ODCj/J
	urRWC0HvgZmLOoq2/oyblsqDgVOu/SFi+XNtWitfOVmzZKE7D0G0+JpJNQqb/GZkvZf8tIRhXmE+F
	S0UmlFSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdOG-00000009Vuv-1Z3c;
	Wed, 19 Aug 2026 10:19:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdO9-00000009Vob-2eVF
	for linux-mediatek@bombadil.infradead.org;
	Wed, 19 Aug 2026 10:19:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=EVppixrYxL5y3w3BcKXCVN+y3ZJBGpAZgIw7a8RJ9tU=; b=EVrYPE65MCoVsLutgimMzi+1Tp
	MrAZI8Ww5SwiVNYPnAVb77icrzg9aG7vonAhJj/rXJijQbfz2xRvAGvVRTULN6fSPdfnBr7Bsu01A
	W/jitLaJI7aP/DbfHG1QFH630dV8wL00hC5ryZ8a3EU7clMIqjqblLg0aLroAJvw+fCNs/Z4uCgZ0
	ut2AJZQGffy+tg7yBiLy8Mp7lMudZOUMQLzRAWXLvxed0i/9dkyupRwVyTUbsd6J8bh8Rdp0Vr47k
	8rsnsZB3qoVFnDBuj5L5x8fWdAZIVUdUBqJb4E8NdKPH+bPApCk1nB/JMRsOH/X6niD47oBbwsCTr
	qZPnTdpg==;
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdO6-0000000DUaS-0yp9
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Aug 2026 10:19:16 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-38e88b60121so748500a91.3
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Aug 2026 03:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787134751; x=1787739551; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EVppixrYxL5y3w3BcKXCVN+y3ZJBGpAZgIw7a8RJ9tU=;
        b=GayPCLOgYKtcusJZuirRV1Tr/7AHqc3zWY+j8r6G41rFHX8Ex9XyFCEmqRPW3+CWjo
         YKWu7vHmkqjcRA4r7iv31EO2Ux0pbMQ8Is0buHwaNR/N/6pA6lmi4Xu2Cw3DGu3y/iSg
         ZNhk9ausi8nOzEtM8GCWLMlP3T4lt/ydovm+Mkl0GDeeveLvMmtX2LLcBpTuwrr6yNP/
         Ducq96gS0FRLB4fXIxKMdDaGRJxBVEKiyanssWZ9KmQISo+RgCYeY0g9sF9mrHBfOMPd
         P9IiTeLbignS4K2VNbmQC7mWSAVaIm5UZli+2QggICuECCjq+UBQJqmmo8Zb6u1fPzOy
         hiLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134751; x=1787739551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EVppixrYxL5y3w3BcKXCVN+y3ZJBGpAZgIw7a8RJ9tU=;
        b=PvuqskayppNAwpWGwzLB44vgh0rTrms0OnZzC2+Zg0uaZPiV4YoYjr/lUdacxWJB9Y
         XAKC8M7M0Ys1e1bhDJ72s6XTUY5pQ936oDgjR18gmVWbON3BBqhY1b9SDgog80VXxL0w
         kvwkWyKbxyoSGIRWOe1gu3xS/p+NdDhUogDj/GgQudoSuJHwHtDlVH0JTkytCal7ou3/
         A5NYe0akrDqzjOySIBi4a5QY7veLTXzHgjmN1pgzVYXQPPolu80eYIdv5w7FA/sO5B1b
         yruqsZu8KK5RmFqCc8wcSlP2cYXReFtQle/I5A6V1An4dTmxS0sqyPPAMmxWDw6VsugQ
         ldJg==
X-Forwarded-Encrypted: i=1; AHgh+RpGBb6QPApcECXViztqjfmHEPINWYpKaKMzH1C455EyoqBCDXK9quaELbivIwThZMnhRcGH2hmpVROTV2ASUw==@lists.infradead.org
X-Gm-Message-State: AFuF++nk7lTZyVuu2O2SjqbR3dHyH0ySRzMO/oJyrAstslYzQqPZiRfS
	OZzM2yK5N1xlNEIoReq7BY39DRZXQlHDtjfPs1ogk4Alrj4+cgOg5V4+
X-Gm-Gg: AR+sD117hfCwZlYqwcbkEL6c853jgQ0KBKN4RlKKcOl58W0e8l6EDawSY6TswBSOiNc
	ctC5ZfBdRvK08D2e13nbgl2qWiAcCI8Cxi5nccG/lS6nyyLQRqwKq1RYdkOC2/MaIC6SdoyiCjY
	1i5UiPn8sQ3yjCUGzGMibXan1lieMAlYpIHcoAdePv3/nCgtgrf7Lr5MOfLeT0eMXDtpDnJJomw
	Wge4O87hfIZhgwnsjdlgKiegP6hvzetPTlxAbnP3YkIDWXVSuoZ4scjTkJ059jU4tD7wl5OWAdE
	FJGZDYAwmaVlru09FuFDgbE+d9Dj9ZAyKZezsY6i4BynCvYFzixA+0vxBm2rlXkS+vssrebOZ9U
	E9O6p4cNMFbvUECskCYi0pfkWvnA38fLsZidHj7dCUqb051rRgGjxnAVfczCPGl5gXArXGJLotD
	yU0HMjg5W7tasWGbNAhsaJRfdtkdXkTwIbJmTTmrQsbucxbDjGuzEwbS82XgdQ3M06e41YksxRV
	fkLEU62J/6MoWytTbYOdIZMIri8390V8pRGwtsjidMOBwNi9SGNci9scm71QLHLF+GqHatVmvGq
	50AS
X-Received: by 2002:a17:90b:2241:b0:380:105f:8ffd with SMTP id 98e67ed59e1d1-39581228dbdmr6386601a91.16.1787134751062;
        Wed, 19 Aug 2026 03:19:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb14bbfsm2146392a91.1.2026.08.19.03.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:19:10 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/4] ASoC: mediatek: mt8183: Use dev_err_probe() for error handling
Date: Wed, 19 Aug 2026 17:18:48 +0700
Message-ID: <20260819101849.68010-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819101849.68010-1-phucduc.bui@gmail.com>
References: <20260819101849.68010-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_111914_304195_B09C5F87 
X-CRM114-Status: UNSURE (   8.66  )
X-CRM114-Notice: Please train this message.
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

Replace dev_err() with dev_err_probe() to prevent log spam when probe
returns -EPROBE_DEFER.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
index 260c27016cc0..d532aa8107b0 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
@@ -101,12 +101,9 @@ int mt8183_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_err(afe->dev, "%s(), devm_clk_get %s fail, ret %ld\n",
-				__func__, aud_clks[i],
-				PTR_ERR(afe_priv->clk[i]));
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	return 0;
-- 
2.43.0


