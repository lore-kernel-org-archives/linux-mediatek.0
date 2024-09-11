Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F5EEE4994
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 11:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rQ+frqDXoNXs+Oeh9kDBpS7St8Ho1h8ItxPVBeYZKW8=; b=BJx07aeMHnCRaSi7+EkBx9DQfq
	af9ak/Wwci6RTMcbd8TIKlTh4eUYiw9Ed34HBXIE2aYMJIRouSnIfmE+6yJmFXzpuhnWaVnjZ847w
	QFWiDm/YyWbCGPpZWghINLKWVPzA53AKn18lkJgkmLOMmiPmDVZotGEu9I//pyrB//haMb7UojFF2
	E9DlHdXh4As9oVF9A2efbHJuG51/raoj1iBJ2EE4nlXJP8ZQXTs3qcMD8UfgNVNok+hOAqyAJFWJC
	jqrVhKnxPdV4LHWpiTuKIP4/Jjee9+YtA/s+XxpYNdb9rZlydfVvptji1eEPO1ATtZw6zCtH+u6Tq
	UUvwcKyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soLLj-00000009GRV-3CFU;
	Wed, 11 Sep 2024 11:17:27 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soLI6-00000009FZ8-1E8v;
	Wed, 11 Sep 2024 11:13:43 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1726053217; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RXB9/3oANY5nTUeolphJDyuqUgt03mS7Uq4DUnsoxe7U5olk6o4ZWLThGxe5T3XOSNkHMW/kHwThhpDWaiGte4uO8MNfvHujb243vVxytArDPmC+PvY8Gd5pjzy1+p0mm9V1bbGH8F+NR477QUZGtQVo2Jq6e+3J5TVmEfEYD5Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1726053217; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rQ+frqDXoNXs+Oeh9kDBpS7St8Ho1h8ItxPVBeYZKW8=; 
	b=Up4g3P5wLsNcwIDOFxLh3UQH+mRQsJHxVWhco2ldwDWIEcPeHKGf8HZTBXGX+B+AdxM4iNko1Nw8lrzr2e02/eMTNJLNaXk+fbtqi5Q7NZ4Xc0G7pOw6z+nWUjpWUn5bYmUuZB+C26R4dtIVKLieJMMfia1EgQyjyN83phc/Icc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=usama.anjum@collabora.com;
	dmarc=pass header.from=<usama.anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1726053217;
	s=zohomail; d=collabora.com; i=usama.anjum@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=rQ+frqDXoNXs+Oeh9kDBpS7St8Ho1h8ItxPVBeYZKW8=;
	b=TWjt3PZ5wi/7j+PeO3vtvlayILucwkNp8pfzaw0X1+GATC6JLFBg/NBaok/SUhBT
	Kj7tKL9ijdsrFm+NDG5EaBhEQ3DMIUEhJ2tNQSTTyGR6DXzuGNVrB17Vf3SrDViYu/Q
	MVyKADz5TqgfIr1izxpAkKlEGk4SLZKsPdqjkBDs=
Received: by mx.zohomail.com with SMTPS id 1726053216304757.7800165796341;
	Wed, 11 Sep 2024 04:13:36 -0700 (PDT)
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: kernel@collabora.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC: mediatek: mt8365: check validity before usage of i2s_data
Date: Wed, 11 Sep 2024 16:13:07 +0500
Message-Id: <20240911111317.4072349-1-usama.anjum@collabora.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_041342_405733_12A3F267 
X-CRM114-Status: GOOD (  13.63  )
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

There may be a case where i2s_data may not get initialized by the for
loop which will cause the kernel crash. Initialize the i2s_data to NULL
and abort execute if it isn't found.

Fixes: 402bbb13a195 ("ASoC: mediatek: mt8365: Add I2S DAI support")
Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
---
 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
index 5003fe5e5ccfe..89ba891c2669b 100644
--- a/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
+++ b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
@@ -465,13 +465,16 @@ void mt8365_afe_set_i2s_out_enable(struct mtk_base_afe *afe, bool enable)
 	int i;
 	unsigned long flags;
 	struct mt8365_afe_private *afe_priv = afe->platform_priv;
-	struct mtk_afe_i2s_priv *i2s_data;
+	struct mtk_afe_i2s_priv *i2s_data = NULL;
 
 	for (i = 0; i < DAI_I2S_NUM; i++) {
 		if (mt8365_i2s_priv[i].adda_link)
 			i2s_data = afe_priv->dai_priv[mt8365_i2s_priv[i].id];
 	}
 
+	if (!i2s_data)
+		return;
+
 	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
 
 	if (enable) {
-- 
2.39.2


