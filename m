Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44345C6FA8E
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Feb 2023 12:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wI7qso8OpjEEpFMcv/ZSd0pQDiovP3aJzLefyiK8XOk=; b=S7CO+6c5ixgUbhikbDbLifzO+P
	/OJkCASTpw+cjy5lvSTPEzHnWqU+XZgrtwTbR4k09YMxbX2Ic216dSO5WHVEriqiCrtzayrsW6h5k
	mzaJQWKbmepzVswb9xbjPCpr++yFFLsAPGxnb3Iq3qInhkbHBbqGTT7Qx+YrAZ0Bm2X2lGUkZEUn7
	0dNwFFjRyUHqY/q4pKNi5iZyOi7wyHRPM9RCR8U7q9GzBU0qPkfAX/rBIqzClpE+Jko2hDjoiWvhB
	gqCHPnl+6M1X64n/A029J4TgyHsrYaxeb1gQoZGGOMosNLVIuLmYL9mipBE4kk+8ONuBUQKri1vKG
	PlAVW0Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWGS4-007CgT-0I; Sun, 26 Feb 2023 12:48:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWGRk-007Cdc-Hm; Sun, 26 Feb 2023 12:48:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E74FC60C1F;
	Sun, 26 Feb 2023 12:48:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1FC8C4339C;
	Sun, 26 Feb 2023 12:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677415687;
	bh=yAKKZS93DzBbBINmZ67z5s72Cs2zUCyYJViPEg1/Iyc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qp2pI8J//AKX4bbskvSW7LqB8nwGHcFwA4+KF2iS4ECxC9l3ZH6MUY+3NAKfv/Ae5
	 p+6HXpL3Y0qX33Z2V+gR71ns+YZB02tOVKVi5GyWwMTUuhbJxNyjVDGIfkNXP0By/b
	 +OBOaEnqNmpVMm2rZ10Iy7+y5Ikk9GaW00r4r+2yues/l3+XFTkCdhlbP7kLHoPqcK
	 0vrNFWo+R4dwP9lCBQuSyKFHaaIqJZTp0GH51d8vNJvGR5WCqaf9hbtNB8D+0Ju8kn
	 2R9GoecYsIfBiYAJi0xG8UIBQVXd59MOg8RcbIi71etKohPEyUkm23Tm5kt2PyjMed
	 grOpHdqWM9RuQ==
From: Mark Brown <broonie@kernel.org>
Date: Sun, 26 Feb 2023 12:47:56 +0000
Subject: [PATCH 1/3] ASoC: mt6358: Fix event generation for wake on voice
 stage 2 switch
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230224-asoc-mt6358-quick-fixes-v1-1-747d9186be4b@kernel.org>
References: <20230224-asoc-mt6358-quick-fixes-v1-0-747d9186be4b@kernel.org>
In-Reply-To: <20230224-asoc-mt6358-quick-fixes-v1-0-747d9186be4b@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-ada30
X-Developer-Signature: v=1; a=openpgp-sha256; l=710; i=broonie@kernel.org;
 h=from:subject:message-id; bh=yAKKZS93DzBbBINmZ67z5s72Cs2zUCyYJViPEg1/Iyc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBj+1UA+dtvLWAoGO6f76qudLS6vUAWHu8gYMrdKViY
 zbBwra2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY/tVAAAKCRAk1otyXVSH0HPfB/
 9AMgPSX7Cs9sm1+9clPmQLcJowiC/LkJjILn2UY0FykRyCcV5LygYf2P2FvKWbYxlpAGUUqYcic+zX
 NFKw+jYmb3Fo4at8hkoQJHP+0SXEpg0TFD3GbvWB4irPoyQBkiU8moJSVugdyv+9h4f6QNCHFnqV7W
 onn0TRjbm/usiX17wVkSceuej7eFjwyMpIQraiUCflU5p2VUnNPiyfXAhCShePQ85xc8Bz+Ols0W3u
 05H9hEE6clJgrHE1YWmd8ou2zkmdvaDDo4NDVcr9G/0BeTM7oKjUg33lqIlrvMXtG2Wn5BLc/qkZQf
 m8BOAYUfOKb0AoNJNWPPbuhgaMJzZz
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230226_044808_737910_97807BE8 
X-CRM114-Status: GOOD (  11.23  )
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

ALSA control put() operations should return 0 if the value changed so that
events can be generated appropriately for userspace but the custom control
for wake on voice stage 2 doesn't do this, fix it.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/mt6358.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/mt6358.c b/sound/soc/codecs/mt6358.c
index 93f35e8d26fc..9004377461f7 100644
--- a/sound/soc/codecs/mt6358.c
+++ b/sound/soc/codecs/mt6358.c
@@ -567,6 +567,8 @@ static int mt6358_put_wov(struct snd_kcontrol *kcontrol,
 			mt6358_disable_wov_phase2(priv);
 
 		priv->wov_enabled = enabled;
+
+		return 1;
 	}
 
 	return 0;

-- 
2.30.2


