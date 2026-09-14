Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C770C88E50
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2026 07:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uwh/9qTX2B9aSYEX0nJr57XNF2YmYT2AWRYwuXSA6iw=; b=M1CehxbR3w0U1ErkR27m1TUR55
	EH9utfPBQB1fzu8Lt/qmPrzVHEsThgkn4+p8tJT0TD2DxBV1xB24ee1x/j2pL8ItFr2Mps9ljnHhA
	hxu64gTFuaBTDhVbxMPiBzQx6tnboVlsD6z8p7fvDI1w1pArKX7OlwAB8hbbT/eNofpwY4J5HwQEK
	TJnQWw1DCYvfQC48mmv3mhvLXWL0zCN3iR55nz6n6tS0Nsi/wMedDgX4KCrsn9ac4719OPk4diF26
	Sz+iXdMJIDBGpC8qrXsI0Jyotxu/q9GyURt27lyNPlougC5+qTOYTihrkqdp0r7gXz35oa8Js5fix
	wXBsMO8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6185-00000002YTi-2w4S;
	Mon, 14 Sep 2026 07:29:29 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6180-00000002YNl-2MHA
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Sep 2026 07:29:26 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1cea4bfb6so716237a12.3
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2026 00:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370964; x=1789975764; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uwh/9qTX2B9aSYEX0nJr57XNF2YmYT2AWRYwuXSA6iw=;
        b=AzadxXKe08ek30Usy7Fj7VWo43H2266ixSuwD65lXU2aHGsNzM+WpVJbXVEhJ9kqmP
         yX9oIS4ha5fAUWPWrXK9ZlZELrfgl4GYXk88XVNgvnp+G2ZMuXKob19rgNhT0dTw2dFQ
         d8/3/p1lDE1iMzWEzZgpEBFsCwNAYB1d+IOcKTq06o/yj1dvecWf9iOQoRumjARwIza7
         oP/AYypsOPFLdrhA8F+5CY1qcJ93EJVbO2brmx8s4175/6o8uXcLMPn+vn8bvN5sZo7l
         DTRDBxufmrPtH0qvHjEEzzlLrd6ASukPKUl1anlIHYH8NFNkOoxcpK9y1TPC+mNKHYzO
         u/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370964; x=1789975764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uwh/9qTX2B9aSYEX0nJr57XNF2YmYT2AWRYwuXSA6iw=;
        b=RjUXav55slC17rrBTiBZrrgnCvu1Er7iQKfY3g1pWvrH7XNtEqcDxT5IdR/if3OLbq
         jJpvSkWEFNj/UPePMSviCCZlbqAX4HPne0DfwpolXNfV5Y8uljv6tM56Ew3d2EOtmAwF
         0e+KRZfRHaTMlZSPic+XXyFT2jt+Ldi/ceOsVcbn0WUiPCG/dLVg2U43+yNd8eyWFds+
         kX6n6oQt15LRj8WIxE8ELlb+1OIpnZp/ps/dj1W1+nVMoU6kVMXvRCxQYYZkcEEWCRBs
         /maV0Pd9jlhYPJBdV4yDWlZamVICBJ9vSTXIBgQDcbwMINs2QDZmPrvGeahb/48V+WX+
         YYiw==
X-Forwarded-Encrypted: i=1; AKwUvBxj/7VBCOb+ONx2Ny+3Af37Sl7uCPElSBEF4fUU4plADAFfjPaljN718L1YtLei4+RCBuco/tAOFqtjsASh/g==@lists.infradead.org
X-Gm-Message-State: AFuF++kRJZyZtykLaYoOITRQ6VelCMIOi2sa6Mixg+XEmXU3zQOkjJaL
	Dqux17gmwLbPzTv1m43qS5/sKQYVvsHKIJ1j9BGUogewEfEcsuCg5XeN
X-Gm-Gg: AYBFou0rjRzdBtUE2982jjFHRj1n1UNEU1qE3q1xvpT0c6+opHLxviBFCFxZCkVsNbh
	GD0HEn5FnKMeTtLQMJ7CdjB7Z57nChM4csbuqONOYlQxBz18Y1qEOvIOz61sVY0VLpmRFbroeBW
	27RT0Ddnm7B7JnpyZk7JX1oiGl0pm1FIMnkAmgdn6WotB/nYyT5yF7lPwBNmC9EYfcCuSnuPlll
	ENxbYJfJctiWazcwM4DORaaK7N38OWbKMTvDWVujCdPBjhQLrpWY9U/u2orbtXeRbcMtwQ2q/NY
	IXli/QvfGpGI9xUQEGG9drrM26w8FMAkYDRMz7D+8oHwgHEQ7/EXoqOy36okLCN9fExxkiaGl27
	0VDK5/NkmceQaPH+qs9GLomd6lxnLZbt7zDZj9RQAxWN993/+FzJZwA92n1Kc0TGMwNP3HQfQBL
	QKKmh2kkiogYmwQXasYTgwgyYmPCoA0hyVsU+URexxdEi3pRVuvbZj0QcsTfhTu20WcC4Nodhfy
	m4LX+riSZcMBLq9tO+Tw+Y5ceXe8WXOYG0LmqhXkyLFKJBtjOa89yF/VSElS7HbPsV7ZzuXIHG7
	2NXTOWk2Tz7PO+I=
X-Received: by 2002:a17:90b:2789:b0:39d:f2a1:2a with SMTP id 98e67ed59e1d1-39df2a103d6mr728290a91.19.1789370963956;
        Mon, 14 Sep 2026 00:29:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:23 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 06/13] ASoC: mediatek: mt8189: Use dev_err_probe() for clock errors
Date: Mon, 14 Sep 2026 14:28:35 +0700
Message-ID: <20260914072842.24420-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914072842.24420-1-phucduc.bui@gmail.com>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_002925_466547_D5B9D26A 
X-CRM114-Status: GOOD (  10.46  )
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

Use dev_err_probe() when obtaining clocks to avoid redundant error
messages, particularly for probe deferral.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index 173ee0709b16..3e7465c5b277 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -793,10 +793,9 @@ int mt8189_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < MT8189_CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_err(afe->dev, "devm_clk_get %s fail\n", aud_clks[i]);
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	ret = mt8189_afe_disable_apll(afe);
-- 
2.43.0


