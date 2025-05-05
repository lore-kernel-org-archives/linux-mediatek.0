Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C977C3ABB9
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 May 2025 22:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q696hS+vsZRkW0Vep7Qzgc3VE0/8wcIkbDDUiw2ga4M=; b=KWgrAdkpLw8Dw/5okW4Lc9GA7w
	j4F4eMPvdhmAqOJh3txGD1pkw8VxUpZ8n5sklkel4ZU9tRGleQVdN8GVgxGOUw50gagVnsgSG1N8e
	Nc2c7OG0fKHjGYQsiT+A5PS4Riutc+jge3l4W9cOBDqm7yA0aESFD2IgaRP2n/IjN5CNdDL+HNeL+
	/usoCEuvBeKF0wthEXy14BIZTCaj2RTsh+PgFsY3ylPXHFfTE8QxoTNg1IuYI884xVZU7ZMgQUB2P
	b9SV+VWEo+8mpwTbkZ1p4aAG/IyT/gigL7gWpZMS0lZEfUUBpLOCnqyL+n1MBL0nxLAaQLhEDJAGK
	7oc1hE8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4hF-00000008tna-2hyg;
	Mon, 05 May 2025 22:54:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4AP-00000008izA-09Fs;
	Mon, 05 May 2025 22:20:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A37A0629C3;
	Mon,  5 May 2025 22:19:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE819C4CEE4;
	Mon,  5 May 2025 22:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483604;
	bh=QZJg/qnDtIKPDm96Agh/Xj3Gqhe9xZPuYljzuQiAzTY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Juez1OAWh8vaP/C8NpUkIaYbrebxnfs172zifaQlEV9+yfgG9qcPsltnQhDdCQQCh
	 SyjJoXVozuvR5IlB/lZ5FT8Vbx4HV3c28RC54gu8WVwRb8dkynuGyGaM8MQMznWWxk
	 VJXuWl6iSTTM7I4AIK7VqNx4uyCJXc9BPJINjt5AbPgXC7QWRvgI1KW0XHFyelIjpD
	 lz3Usf1ZtULbemnyp6ceLi/s37BJM8VW0mqqpuuC40ZgxGhtKmAaVOMACnsVtnYmU0
	 zK6ajrpwS3tewSnvb6NrnNgod3Bn6pFWLxWrWQDuRF53u/iNEZhKZF1sgs9DBpMS35
	 LE6hnzShXbcwg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 138/642] ASoC: mediatek: mt6359: Add stub for mt6359_accdet_enable_jack_detect
Date: Mon,  5 May 2025 18:05:54 -0400
Message-Id: <20250505221419.2672473-138-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
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

From: Nícolas F. R. A. Prado <nfraprado@collabora.com>

[ Upstream commit 0116a7d84b32537a10d9bea1fd1bfc06577ef527 ]

Add a stub for mt6359_accdet_enable_jack_detect() to prevent linker
failures in the machine sound drivers calling it when
CONFIG_SND_SOC_MT6359_ACCDET is not enabled.

Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Link: https://patch.msgid.link/20250306-mt8188-accdet-v3-3-7828e835ff4b@collabora.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/mt6359-accdet.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/codecs/mt6359-accdet.h b/sound/soc/codecs/mt6359-accdet.h
index c234f2f4276a1..78ada3a5bfae5 100644
--- a/sound/soc/codecs/mt6359-accdet.h
+++ b/sound/soc/codecs/mt6359-accdet.h
@@ -123,6 +123,15 @@ struct mt6359_accdet {
 	struct workqueue_struct *jd_workqueue;
 };
 
+#if IS_ENABLED(CONFIG_SND_SOC_MT6359_ACCDET)
 int mt6359_accdet_enable_jack_detect(struct snd_soc_component *component,
 				     struct snd_soc_jack *jack);
+#else
+static inline int
+mt6359_accdet_enable_jack_detect(struct snd_soc_component *component,
+				 struct snd_soc_jack *jack)
+{
+	return -EOPNOTSUPP;
+}
+#endif
 #endif
-- 
2.39.5


