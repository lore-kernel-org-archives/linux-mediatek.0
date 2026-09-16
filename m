Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60CBBC88E5C
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 05:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9y50VuB/l2kLa1542VqPbt/G57KIRr9fbdB6tbrEkBk=; b=zJfLRlAWJrt6ucBODAONltvRKM
	8ojN68YBwS4NlGWf6+aAOLz7xx4HaR6s/AjvcigI74FOBL8FdtcEnf4JYJzcj4+Nk0CciC0Sp7Yw9
	F+PL+Q6zUmyTwSog1uots1MaeJ+tN9BNacMOR88ZrPfI41JXIw6tbj+npYGTkFzD7HdTF4VCP7SJA
	fdAcRvnCRrBR8br+ewWwjjSbVyrMsFkPmj3GkD82N378mkwq4kxshpQMWXqsajS1H8vbfuZoWxlc/
	+kCX7Y51H/RPpUjZZl869s6qWJOuMHh8vjBmO6LKVTHdAsyg6D8w06EMfuMgAizKOIqL0Ev/FNXnE
	ga8Dj4mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hmv-00000008MCC-0fMF;
	Wed, 16 Sep 2026 05:02:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hmT-00000008LwV-2HFN
	for linux-mediatek@bombadil.infradead.org;
	Wed, 16 Sep 2026 05:02:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9y50VuB/l2kLa1542VqPbt/G57KIRr9fbdB6tbrEkBk=; b=ag3L33WWm4LPrMldTm5DhM88gq
	hisGAWTqjFgXO/76DrfudOrAy/5TrzGQTqqUbC7t/PjrUL0MeaNKHorqYE7exYLESsdnZDlJsy/+L
	4EZMsMeVVJ1OO178Ab5ERkvqHth4Ot0DGO4xe35XnG2YT7sjBCT8FH/OX6iW35N+8AThBczvbX6Xh
	8AKC615lbdlCak5AE/tF8w5soZ3KaK/yTai3en2a5fa5t/zYCcJEy3QxO0CRF8pIfk1gWDahq+YCR
	wVzUhRc4dDs3wo/uACArXrW4TS9f076zFnPOy8MpnqOnndOz2E6kfdZ1AKWhmpnoelyME0khKTzFS
	iyi3PvvA==;
Received: from mail-pz2-x28.google.com ([2607:f8b0:4864:3b::28])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6hmB-00000007UNa-2Kik
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 05:01:57 +0000
Received: by mail-pz2-x28.google.com with SMTP id 41be03b00d2f7-cc1cea34f01so495514a12.1
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 22:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534901; x=1790139701; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9y50VuB/l2kLa1542VqPbt/G57KIRr9fbdB6tbrEkBk=;
        b=dhHct5a05ZJlXMbotd3fzvOb82n7FarnZSQ0Q/3DKwMWs8MhOGE+HpILbKAPeEnkVG
         tGg9zPYf8T+F2mmY4hftLI0P/1kwU2PFC63NbMZS0KrLJ7YjptvoIqv1LPz38vzYKX2X
         v+mE2kgFe53ktVLj1qMpcADrQ67bCTGnSXXkWAaSwhKIfMDseva+h1/A0R7oNuUPXvL0
         AL5/zRxG5hPzDoD0u3dHIHLN0jZnCa0YA5lmbTLPqGUhrpOT2WJ5MXTJixSyOfq3zUw+
         cOE5sJiGpT4Eu0gse7+zjSQ+vMoOCHkM0UQDcvHaZD6kheumKHUVStmthHe+ZnKqTeNR
         o4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534901; x=1790139701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9y50VuB/l2kLa1542VqPbt/G57KIRr9fbdB6tbrEkBk=;
        b=V4izz/R/gUsCgOgDFydOzFaBS6kLI2PbtB25hMwirIcr6IO/RHAVG4PdXT/1J+OfDW
         LTnlpkR867FbkNYLHb1cZz+2METv9aQ8+gVVOqechqe33RQ++v3uKBHZylvm9Lrr1Ner
         pPXUHxFH0BCwQD5LPwXcEDaGLTyAPZXuhxKtVEvAiCDxCJLelUx5FfZo0FiNeSsaNSnE
         jElRwVBAknI3WliCeERf9CoIzUHOhS7BxN4KLPxC13nMQSXatfw8Qcl3YJ5rOdb/pHNd
         fc/RP6N4ngW1bIwRnW925SOflZ6GiiqoTvVGwjc6kxCNXjgACdPm51bMBVv6HkGNSVCx
         isDw==
X-Forwarded-Encrypted: i=1; AKwUvBwZB1WfKzbLoiieSQHe+7+RHl35tMEZ4BV7+pLjE1DE4MchbAFdK6/qgaUpNOqcJYdYL29fg2taJlNMV/B1sQ==@lists.infradead.org
X-Gm-Message-State: AFuF++ka50q02rjonP7Y8UzCx21pf/maxSgXaR6MzdJewl1QWYkfda9N
	SL9c+WzfvihqXUUP8idbgzW63H6ZGMO/TPofAyrIhmpoDaJlrGi5hdk7
X-Gm-Gg: AYBFou0u6JBgtjPSYZqbNQo8sz4+m1dRaizIi9WPkTpCvVTgxBJ/YxM3IYCmT4+s6an
	c+VTZuIQ7AWlnVGgAzGjtjOTR+b4vmDpDzFN6LagxEPwmQ0w2Jns7cwfcRq7zu4XUwMTkJvL8Ug
	QCfNFSPntMadzOoYwRQqab53J1wj/qpB44ttEpAYDJAzzC/y0VnYYVDMQa+cngVIxx0V4JIYRAQ
	IItbIFdBEGLZ35A8nNj6ZT3aBgovaiH99R9xGzLkqtXOZiZmBDUIvy9gzuDShKJi0KYrnhcPRUE
	IHLijbMPRVYGs7RZ8y8a+c8neEi0z8fKOpGbNUzUUea/e9caHdRYG6r5T8s7a9vmoaVH4YYRMWf
	R/xnHLDH1ZkZ1UATUpM7tO0GKvONcODQoSFkGq89GDCp3dOJ460g3g7zc46avVp7lcQ5jL5Mxqt
	+g5IZvMCyyi4q50nj/B7pd1xbZJtF9ca6rc0ZUiQmJSXqzfivZAeNyr4bNHsbxg+Ui/XC2m2OD1
	Y3pg5EQrFB8OgmDnwEh/dTWvOKgSrB+rWoMA/Q3xUT5TklK2r+RyNu0Vn0Rp8UXKq9t9OUwygnZ
	LwTVF3GPqYVgss0=
X-Received: by 2002:a05:6a21:6803:b0:3da:e1b5:2baa with SMTP id adf61e73a8af0-3dd5f4041a7mr2929083637.2.1789534900789;
        Tue, 15 Sep 2026 22:01:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:01:39 -0700 (PDT)
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
Subject: [PATCH v3 12/12] ASoC: mediatek: mt8189: Validate TDM MCLK frequency
Date: Wed, 16 Sep 2026 12:00:19 +0700
Message-ID: <20260916050020.14575-13-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916050020.14575-1-phucduc.bui@gmail.com>
References: <20260916050020.14575-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_060154_168145_0FAB6C4F 
X-CRM114-Status: UNSURE (   9.56  )
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

mtk_dai_tdm_cal_mclk() accepts zero or negative frequencies.
Reject invalid frequencies before configuring the TDM clock.

Fixes: 9f202872ba04 ("ASoC: mediatek: mt8189: support TDM in platform driver")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Add Angelo's Reviewed-by tag.

 sound/soc/mediatek/mt8189/mt8189-dai-tdm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c b/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
index 9aebd0320614..e113c52fe06a 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
@@ -383,6 +383,9 @@ static int mtk_dai_tdm_cal_mclk(struct mtk_base_afe *afe,
 	int apll;
 	int apll_rate;
 
+	if (freq <= 0)
+		return -EINVAL;
+
 	apll = mt8189_get_apll_by_rate(afe, freq);
 	apll_rate = mt8189_get_apll_rate(afe, apll);
 
-- 
2.43.0


