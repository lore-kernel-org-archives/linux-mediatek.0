Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF42C606A324
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2026 07:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jy4I4eF+;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DMUcbWZM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=JB/vt8Yqalu6xBIjfgP9QfXpUFDcSpikq6HleBSGoog=; b=jy4I4eF+6sqanygvx5MmW7OYOd
	+uvFJ2HvA3dBeQ/urhPiPrR6Z0zLZVw6vOmg8L/E714HXc2iYK8Ko4548RevHQzCJVgpmvYz6F5qJ
	YCJM7cSNit853gjhryOUpJBmg/DjzMnDbue4c1n/RJBMZiVTw1dwiksiu2Pt2mT6tc6EWd7hMLjf+
	bKggDYIUSyNWj6Ui6ugppls19pNzIfPm2/F/55qr6ZM4/wYKDilNntmCnRTvxe9Bw54AEbbckivgh
	fHeNXJMgU57PvcGhMvRwTDsGUGP+RMbtna31TNVrpLpQDt7qrY2GtSFJcKg8Sy0mRaW4+J1DBnDh/
	ANeufIFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmNF-0000000FjmW-0CLu;
	Mon, 02 Nov 2026 07:22:33 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmNA-0000000Fjkx-3mSu
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Nov 2026 07:22:31 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-36a18fc7a38so4476061eec.1
        for <linux-mediatek@lists.infradead.org>; Sun, 01 Nov 2026 23:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793604148; x=1794208948; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JB/vt8Yqalu6xBIjfgP9QfXpUFDcSpikq6HleBSGoog=;
        b=DMUcbWZMlD3VgtMCo3/7f51t0epNSN9fPzYUiIjx4LvDLR6inF2wr3Z9WoNhZt8faE
         Pa9/W75rtEGKHudL4agVCEU40RXCBW3EUSDsCHpTIueT8B8ln02lDLGvaR31rsvKn9pe
         8G21MHFy71kVPdIU+g1KvP+6sbbNMKTLaQDh6TDFM7I6mVZTt1ngv0sXpc4spysLC2eB
         qVNtNMn1K7SYnFbZs9b68BvLSYiwlLayfqoAjRKSvA/c2XPyeoLHB+JO5Oz8a1K8lyJc
         9/ATUwq1yhbXsnylhNxTjPIK4Q1uRBaFXbjJsPN6az25hY3DKsqjnZuoYM2WZfKL17Ih
         4rFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793604148; x=1794208948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JB/vt8Yqalu6xBIjfgP9QfXpUFDcSpikq6HleBSGoog=;
        b=dMBGg0nccSBxNJ264jy47oxQtdnBX8EoxdXnOuEgZMKos1S0Gj2Cz8uGddCShlr3A8
         wyGy3hN4jVlUV0MYvLji1Oeqwg0F0VBon1XmVa5KUfFt0R9f7/lrcxrSDzhxLlVxVss4
         5KxoWii8qNQntnYi7kl8JEimOUIyRZ1CD52XzJ3Jf/fSXacc6ZlBUQO7tF2OcxFLEjOk
         2dNJMpSNJubVWSBaXq+bGOEe4/aetLCoGDTcPZJrlQQQlc+uddnxAaJ1voHT8ram74yJ
         AigX3d00nzrCF6YBEDeBvQywiGwjAkbjKS+iSE7kniBUbuiFi9EQqpbCSI1Pu9agn8vi
         3vPA==
X-Forwarded-Encrypted: i=1; AKwUvBwswgnWO1RMUttCjNUeQZ8d7c135v/hYx0HmKAfE24UhX0nKSExbR+pw27Os+Fm3UwnWpfzcNsHXL5DvYlO7w==@lists.infradead.org
X-Gm-Message-State: APuU4Z8HPOn/i+8YHD0VuH6DTvy7hpGUcKAw4qV2HhqyeoGMJINMWJYT
	8tI6cte5cLyjdfqkaD0iUwG4jqIZCem5KBrAoOJLf41blopOxTxTYRwe
X-Gm-Gg: AYBFou0Uh3d2EB8Bzz/rqXjmpWi+hDd7I0d7m1FYWlqkP5lZzzmorVS7Xqd9k6fd+2X
	DCnCEqPekRDAyX0bBZYfnAVEo/Q9AtB/nlLXxcpd2vn7wVPtLzcbZyA8n1rKGI+9tIKAF8SyKvL
	r3hIfatAckHs6O2qHQiRRMqQPAK1C+8586irgr/Oz/nwfarfU/iWDYoD+Fi+IvHJVA+ECK05BE9
	1zxD+qmxBiWZsUUX0e7Kj3qi5y0gNDyvcFTbvKoynTA1xgOND+dIdCJmw2S7zdSc+zjNhfeFIG3
	Eq0Pld2XnRcNC9w8on26oS7pE/7eweJYxNF0szk4BfgC4HpOWim4OaSJI0XjCtC7eh9VpR4Tqmy
	F4156hqY6DgA+NtXhVrydjlkqe56nFyFkP1Hbg6qUsFh7Bwq0JN/QZqDeDZUxK9T78BAnj3yRCX
	pPyeQpCN2OrFy8oKDmHPM35V3l+4EHvGzfmZN+t+RXOTxMcE28wh3lGjauzF3rZBLJ2y7eGGF6i
	itudDhNI7SxlTh4BegYMKGiqDgIt3wVRzbVHuSuz26UyrDOGKEvGaJxBXNcYDwPWH00l9/3Aug/
	nYhM2aASP8bChjzEUWoN24FIimduQgKCeUdJcQZ9X/9TFl92guw=
X-Received: by 2002:a05:7301:4706:b0:369:eee6:ee2c with SMTP id 5a478bee46e88-36a4221bc98mr13867197eec.5.1793604147501;
        Sun, 01 Nov 2026 23:22:27 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.93])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm36376021eec.7.2026.11.01.23.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:22:27 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	mani@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] phy: mediatek: mt8195: Check PLL driver setting return value
Date: Mon,  2 Nov 2026 07:21:39 +0000
Message-ID: <20261102072139.3588-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_232228_936225_24A02142 
X-CRM114-Status: GOOD (  11.78  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The mtk_hdmi_pll_drv_setting() function can return -EINVAL when
the requested pixel clock is outside its supported range.

Currently, mtk_hdmi_pll_prepare() ignores this return value and
continues with PLL initialization even when the driver settings
fail.

Check the return value and abort PLL preparation on failure to
avoid powering up the PLL with invalid driver settings.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
index a4bc1268946d..9658781484f1 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
@@ -360,6 +360,7 @@ static int mtk_hdmi_pll_prepare(struct clk_hw *hw)
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
 	void __iomem *regs = hdmi_phy->regs;
+	int ret;
 
 	mtk_phy_set_bits(regs + HDMI_1_CFG_6, RG_HDMITX21_TX_POSDIV_EN);
 
@@ -374,7 +375,9 @@ static int mtk_hdmi_pll_prepare(struct clk_hw *hw)
 	mtk_phy_clear_bits(regs + HDMI_1_CFG_6, RG_HDMITX21_FRL_D2_EN);
 	mtk_phy_clear_bits(regs + HDMI_1_CFG_6, RG_HDMITX21_FRL_CK_EN);
 
-	mtk_hdmi_pll_drv_setting(hw);
+	ret = mtk_hdmi_pll_drv_setting(hw);
+	if (ret)
+		return ret;
 
 	mtk_phy_clear_bits(regs + HDMI_1_CFG_10, RG_HDMITX21_BG_PWD);
 	mtk_phy_set_bits(regs + HDMI_1_CFG_6, RG_HDMITX21_BIAS_EN);
-- 
2.55.0


