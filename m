Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03544C6FA8E
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Feb 2023 12:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YzpQlemt6eW+apOJPu+Z2+fuOylqMYbRkf6e7wyySjk=; b=nrMvlgffk8VeBw3R7WpQQInagg
	TtDQRuXPRz6s8Bk/mQ8jnKSxQdMOYR3DWn9BAG8VX2SCxDGMWUneo8PWbK6XopsdRzJwyG3OHvF3S
	y1mtcffvFmF/NriCdxsEN/lATvA1TtVovtM1O/j/qZdK/1SjhqTwOwnp4jYr73+EYfkqJqVD7MayP
	tFxjGeRcc/Rmz3PWi0EgWJcGpN6lQ1Q0xJ/kYtZEOQNIAIY/1DIwIkKkI9mD7yPE5DlPuBIEwbKLN
	YNdMs4nAPqc2AtC4b5PKVRA8jkjXfZ8Pap8ACDmNXWuIJJAob2Kcm7Zqd2YNzf/7oPtBGYKPoaEzL
	ASbWbJDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWGSG-007CjZ-WD; Sun, 26 Feb 2023 12:48:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWGRm-007CeD-Od; Sun, 26 Feb 2023 12:48:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3FA5060B5B;
	Sun, 26 Feb 2023 12:48:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFFB8C433EF;
	Sun, 26 Feb 2023 12:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677415689;
	bh=myDYJsmBOb8gHjAvQqUQgdCx6N4vYiHnypwvnwHY+4s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lXmQqneI92pqzTJvMvB92/dlWf95v1nIBdHn/LaUO094h0a8mRdisPqgqEqm98WFM
	 KLjfKh9sOc9uhjeU8Y4qDwqjY3VO5PYjcRyr5w7+cKicnOtLY6T+/iZWD6nNF8CFV5
	 GsoyfKM/TAmBltf1epICe1zB284JIJemwndJbTSzN77X/Hn2bCSSoHN/Tiqy41U2zt
	 82lnheACCp7HNXM+Qnp7lmbB7h3AOvdQrIfT1W+XTGPDCH15rFbIfr0Ie7fUDZiL4P
	 1vV5YXxPtW0KEsAyEdJC6J+njbroNlnqNIJuIlRGGrLTvbp/ytqffC4GryXLYhyQX+
	 V1LVYVBc+Lh2w==
From: Mark Brown <broonie@kernel.org>
Date: Sun, 26 Feb 2023 12:47:57 +0000
Subject: [PATCH 2/3] ASoC: mt6358: Validate Wake on Voice 2 writes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230224-asoc-mt6358-quick-fixes-v1-2-747d9186be4b@kernel.org>
References: <20230224-asoc-mt6358-quick-fixes-v1-0-747d9186be4b@kernel.org>
In-Reply-To: <20230224-asoc-mt6358-quick-fixes-v1-0-747d9186be4b@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-ada30
X-Developer-Signature: v=1; a=openpgp-sha256; l=846; i=broonie@kernel.org;
 h=from:subject:message-id; bh=myDYJsmBOb8gHjAvQqUQgdCx6N4vYiHnypwvnwHY+4s=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBj+1UBQXRJd3he2b0fKcFSDBDJVxJc19sEfIgpXRZ8
 wWf3w4GJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY/tVAQAKCRAk1otyXVSH0Oo3B/
 910h+pTiRCco9oKRj3PMiCimp3XauEGVJdrJyivL73hfrDgnNCcp4VtngLqPCxfodWykqLQbjrq6V7
 ISlOAsJzjrZiWw6pTrWqTwEtXde+o1g0dZoSM/TYOC0eTgPqev1TpFK2d9HhHfGbAryLLpiMQAYTBB
 LkSGqJsPR7rv2hXT8BSDJKkBG+PEgQDnBbN8rAul89S2+j16NX3W7AHZF7ulY0zGFRteJ+n3Cxp1LW
 lYeUXRp7WkeK8FStLNF0LV9OFy9PkD4cctzPEm+rRoz0X3DcyEee+okX4ziVA+xX3N1mTCDO1Ybtc6
 GpZnr11PmWZ9CRpaA6O/qYqLlU7TpT
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230226_044810_914184_F448BA07 
X-CRM114-Status: GOOD (  10.75  )
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

Currently the Wake on Voice 2 control accepts and stores any value written
but it reports that only 0 and 1 are valid values. Reject any out of range
values written by userspace.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/mt6358.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/mt6358.c b/sound/soc/codecs/mt6358.c
index 9004377461f7..89d0dcb2635b 100644
--- a/sound/soc/codecs/mt6358.c
+++ b/sound/soc/codecs/mt6358.c
@@ -560,6 +560,9 @@ static int mt6358_put_wov(struct snd_kcontrol *kcontrol,
 	struct mt6358_priv *priv = snd_soc_component_get_drvdata(c);
 	int enabled = ucontrol->value.integer.value[0];
 
+	if (enabled < 0 || enabled > 1)
+		return -EINVAL;
+
 	if (priv->wov_enabled != enabled) {
 		if (enabled)
 			mt6358_enable_wov_phase2(priv);

-- 
2.30.2


