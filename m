Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581B2CC6B1D
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2026 11:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8VUtK39HIhzGJ/7b2L2Rojv07HVw8BatiG+Ir0yk9s=; b=MVmoa/wxSjpE/dFBpH/edadchy
	yazZ1eJl9imtRiI36bxIQCISlsOJ32VydjaMHYgQms5Vprx1vo9VpCfPvf8lEW7Wuyhp0m9C0i3r8
	KDw1ouSLw/AmrwWwIW/BNPWeJhvsnRyIDOqgWjjAD2Qn0ea7qFwWZmXzWERFoUq14zAq3lJsyeZgh
	vOaOeJOGZXCfqbJKAXEZDDsNlgweX+o1w6vAq7DbpRWWHhKQfpllKSEgLSvfReDSq7uIIXVRCNehe
	NVt6ZyznPie1JTDv7NpaFfWdBjm5z8QqzeEjk6oWDb2+yhAhWJLVjy0KHkxE14KY53I6Olc6tv3Id
	1j0M18Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxAa-0000000FK8H-1sMe;
	Wed, 14 Oct 2026 11:29:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxAP-0000000FK1u-1HW8
	for linux-mediatek@bombadil.infradead.org;
	Wed, 14 Oct 2026 11:29:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=C8VUtK39HIhzGJ/7b2L2Rojv07HVw8BatiG+Ir0yk9s=; b=XWn0umZgk3W/XZA8P+YXE7rRgo
	1X6eRlvmmTeW1KeiP204Z7pmianeSqBiSgbzfOsa2zMcLIlwIidEWN8EzrlLQV5SGVoTX7lHMhsMN
	YIebbl8ms3xh4pdIx6AvxGUn8Akk/CE42PI5GwTL/azuUGYm/hdYYv5SaiAW+2yE+e1samSLi8jq4
	bHyxwjtcGtYfNl62bMAJrnUcKiv6r2H1eTuVBllCWMc/zz+aMsziZ4E73X+u9GUbDjbNnoST8Efci
	do+HQahe5iYo385pr64nWcS2vfXQbAtUM3q3XQSHXH8TX5GYJx680QupUSSrpeHp6ATFuEnkxmZX0
	/445uMrA==;
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGxAM-0000000GgfR-2fCx
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Oct 2026 11:29:04 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so648001a12.0
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Oct 2026 04:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977340; x=1792582140; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C8VUtK39HIhzGJ/7b2L2Rojv07HVw8BatiG+Ir0yk9s=;
        b=PAyUS+2KMFEoL4gtb6eANCGDbm92sv2L7zmIlfrjbKmDRheCQrushOHCyC0DBxe17E
         ejRQDjYzxB9XtlhJZu7eMEyojwYSMUTtcZElLsgtfVI4L6NbitXuv+7Bg6NENfHVbwzI
         OCaxWKFPexqztlQX0+8HWXSv6YIwFWpcXurpx6QfKq1ox+3cuRSKzENJsJCiiykX7Y25
         IBeT0rB8y0wVZ5tRaSo5Olr8kmUuIny9xbcT8hS7TsRHYBPeBuHNHVe4s+jygxrxwkbO
         6z59j4ZODEIgPdyEAzU7e7d9Kg8rdmTGriAWDQ/coRAaFlLhwb+7mwZxu3qqGdVn9UDX
         8gYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977340; x=1792582140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C8VUtK39HIhzGJ/7b2L2Rojv07HVw8BatiG+Ir0yk9s=;
        b=ySsXW0LfWIGEFcYBl0W+WLG4v5/sL9q58vJjFP5shvzDk3bgPhoXjpbOP3Ynr/m/9t
         9LdMFIxDS/ZJo1g6xIX4S8SNxU47ct68bQ+2aka9WaqTEhcPl4tvMV/pP+jIx6zMrZJT
         gXAF0w8X6TKteBI2g4CvFwTY1id8KfbvcfmvE1/gEE8nQNMD0CRHnaxQxwCiUvEGZb4h
         Yq2heKMeGKbtF3x0akhn+75WK+J1n+0yuz3OU7S68EYjbnH1LQTLBZ0oodpG3tw8JUsH
         MZoGPorRgPyV+ZiL+0ilWcOp6cA+691qndEdBXZbjqiY453EblLiq1p6RLJi1evYHuZx
         j7rQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJlqIEan2Fw8NJeE8h6qvDt2EfKMa3Tz6X2DJRhB11OTlITSUmcclkDngoWIzSRrm0Nl6xfrmz/UOokNVjoQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYLmpeyyv21sSX6gAFLY/AjVVtc1Cj6IOMV9ELTM8XhCW5ROJ2d4
	Zkt09u/cyNUgvEUOm2qIBL180RQVdZADtGBK+YaqeXE0c8H3Nq16nhN4
X-Gm-Gg: AYBFou1iG/34yBdGIe3ehS3c8eYSFB31yWULVuvZhHfBqtt5l7+I0BLwpUvf1/0u6G1
	TQPTTDY0TA/SplvNqJj2eU7FKO38foKtCvAZqezkwvko1Tcy6GPIXWQzfC9+1fIHNEcVy5ZBsKl
	KHFgJdfBGehdR3pWr4AdfKodW0dN+4jW6ZtVirr6ds9ynyqlbQXYjK8wPv4/ihA0JPWIsaakrvW
	k8TrpZ1b6VX9JbYuBw/TLgDmkopmY6ssZvBcy5/fCVUGPCcipTbBBnFFnHpdGOo48CqXioFsQJt
	CsOWpdB+9psEWD8ZjIU+/o5iUamHoUXyPEl4PqlHfdg2IlLzrcGyt1iD1NVnwtMXyfVtjyq8m8S
	a8SWGyDWEL7K2KxOF6DzcTf5ujy4FWXCdQMzKtKoRHCJ78+zTnriMpTa3FvWOCygR58pwIyreG0
	34JWd7n7IYb/sBQwDyxhkUBQ7Euc2LTt66pCf1qriDh3lblZHVL1AdWr+uXjlYb/4eX3fIPGYTS
	h7g9nahh65puY54F8mRZBC10HhFx7w9XZTb8oZ6dtl3SMLwMvPxnz/Nl5nmhBPtZKOZW3xjzfyj
	QISs4QP/JRy/uw==
X-Received: by 2002:a17:90b:48c7:b0:3a4:adf9:5d38 with SMTP id 98e67ed59e1d1-3ab3a3596c5mr12440768a91.4.1791977340498;
        Wed, 14 Oct 2026 04:29:00 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:28:59 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
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
Subject: [PATCH v3 08/16] ASoC: mediatek: mt8195: Check paired MEMIF clock enable in FE trigger
Date: Wed, 14 Oct 2026 18:27:43 +0700
Message-ID: <20261014112752.683032-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_122902_799376_30D5B559 
X-CRM114-Status: GOOD (  11.98  )
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

Check the return value of mt8195_afe_paired_memif_clk_enable() on
START/RESUME. On failure, stop the MEMIF and disable the channel
merge before returning the error.

Also skip enabling the paired clock if mtk_afe_fe_trigger() fails.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 02736949ae6a..4216c47a56c9 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -466,7 +466,14 @@ static int mt8195_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
-		mt8195_afe_paired_memif_clk_enable(substream, dai, 1);
+		if (ret)
+			break;
+
+		ret = mt8195_afe_paired_memif_clk_enable(substream, dai, 1);
+		if (ret) {
+			mtk_afe_fe_trigger(substream, SNDRV_PCM_TRIGGER_STOP, dai);
+			mt8195_afe_enable_cm(afe, cm, false);
+		}
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
-- 
2.43.0


