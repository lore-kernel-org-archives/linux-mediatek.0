Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC254C79FB9
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2026 12:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MsPHanuPYhLkAJkeLkxT04CaUhRH1BSXCePDlxHKnc4=; b=WUnZOTBrgMko0GlyWqUSoJZHnA
	3Oq31kVUQI/7IGCJteaFBH9FBNxQyJ/c3AQ1R3di+ND8R+Cs5EPDZjfLlkWtMLZocYuUaVdZFt0CF
	Y/lF2zFsta+MZ4G4PChPldtKI6vokPAuykRRjBarn5afLBaFH7UQqZR8V3aAGxciL5jpQSqT8rlXN
	w0Iyq6hvbd2EX06ZT/k3C8exuETZ1RUXKfJ8moTcVKLVreKZxeR5tZjaOyBA84zS2+S4wRuLUzgyJ
	K10ceiMJmbi9+NPE0shlmBOA+LkcdUGC67gAi9hDyNF6ercPgj2J2zBWD5erzTHD2NF4CqZqEXhd7
	rKGDqljg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eMM-0000000EOfX-3qRL;
	Thu, 10 Sep 2026 12:58:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eML-0000000EOei-3pLG
	for linux-mediatek@bombadil.infradead.org;
	Thu, 10 Sep 2026 12:58:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=MsPHanuPYhLkAJkeLkxT04CaUhRH1BSXCePDlxHKnc4=; b=Y83v1U+OFxgNbb3fFypkYCBPzl
	UABKdIcncWTmpEmGfSDRwoVjzaJNkjcPmwvqjaEqe8NYQVePbMr07vGzooEsdAAuWcrdefFgpubC0
	cahIa4u6VUTkxhmw4XYx1Ky8opJ8EqGCLD6+692bfLhp5QWSxqg65KUuid4c6my41jCSxSOnnKIi7
	wJkzS5oWG3OP+kzeYd83hgLdaKB6kAq0zjgVXogGxGRilMDLtRURihZtcaKJsd5LGuxj5loBJyOfB
	scLLo4mI0KvAfDr32byvoizO0FgUi/5gSemxVeBshImcJCN144xSdUfBruDKP5FtUJyA20zUVlBrt
	dOKzFcqQ==;
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4eMI-00000002V00-0FbJ
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Sep 2026 12:58:32 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1cea4ae2cso1029325a12.0
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Sep 2026 05:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045108; x=1789649908; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MsPHanuPYhLkAJkeLkxT04CaUhRH1BSXCePDlxHKnc4=;
        b=bIRDHxuBJmmpgWYFR/oyC5WOW3jWB2NSqCZMnonfR/GDlcAzhr3lVwsl6Cuq0Dxkbu
         ldSmmSnLpyD2jtSAjTGm3Z5AVb8QF4KD0UDEM088ii21Z2GlkPAGvNmrDaxQA80cm2Ka
         3/GEoRFFWw7Ywkhd+9TilyWOWOA6TL3V5LvSQJjqhf8AgoO6gAwni2E/cT+W+AkMhyar
         LXYjHi0dslLADEAyBDIb9OXzLA3iZed2lAhMTa8BKSmnikHvT8Hj2qSwM5YK/TIqKVRo
         qHacE68AGoK+bKH46iS5MaNODjdIEFQt0PkvdztWlEVeN8DPDibcjaduVuSyRH+oFWbq
         XiJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045108; x=1789649908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MsPHanuPYhLkAJkeLkxT04CaUhRH1BSXCePDlxHKnc4=;
        b=gMzoglTbuWji8ihQeaCe+3i+FLcPKuvvKvZ4SoabIRtxTYWuaaj31JmNthPssp7iN/
         erpnhF9m6a4TY167ksvKDQkkiv1fja775TWvly68n7y7NpKolMLiIZ9PEvB40JslYQ9i
         0ZZxtpn9FEVtAdkdwVo4mH5XhYKiF1RjzNqJVTwqVU/3RMtuvhKqxBRexQgjjWuG2QK6
         pD+qFbGh3JFKv3ySn95yufy3mUktqzMl2qjuTFlkule/6c2IrKP3ShbFVitUn/nJI9DY
         U78u1hobYlUa3MTrL13xaJcMXB7/FDQ44d1aEss07cQ1X8IsgcOdH0wNZbtneXX6Bq+6
         H5dQ==
X-Forwarded-Encrypted: i=1; AKwUvByCJNEuTfwOVaOyfgUknBpyYzYQYO0Bufd4rUI+1xZtnMXsui2VF6MveZt9DS6aIHYjFhMmJq9cWmQApd6Rbg==@lists.infradead.org
X-Gm-Message-State: AFuF++l42jvw87lJpUwlpVLD+Gj3cKhQ9vMUWW/ryX/VifzLRL4NYsJP
	NWkSHVKdNRx2cXWMsd3ddr8eCsn2SkzRpG+eVNXTqipuhibTYBffvd1Z
X-Gm-Gg: AYBFou24YS8QIDciioMvTnhwsCfM4HAB6vt6GhGv1mXRuFC4VxcaomSGGbFkge+pxw9
	cAwDuvdTbhkoG6+1+GyXWg014gmSOa8/4rJqI/l2SO/7WFe5kBL0pDA8vz6eLWzG1mwM2VqRxQq
	GiTBKhKcgxZUOjelgu/EMUylK2iNfdZmbxlKfcSS1m5qZrkaB7PcvRkAd8FrVfvaAe8694h1ueK
	e5RG+L2Th3Y/+S8b6eMCYm7HQPnJ6V0LWwqr+S03vd7JDhx0+bsPOVLEMa3urSW2sDXb+ExXT7z
	x9Src1CKnaG6Z+T30XO4kZvT4p/ULXmR2XR6Ns4XJFudMDoPpHbmb2JO6zkIkm+9e7EDLToNJGa
	H68+v2yXX2O17jKPiC0+Fyrqa3P5ALWTZ63536MqrXNN5/AnP66YreM9ylsbhLyJ7WXqs8Y2cRZ
	47MV0DH/wkJpJpCujYakDgLqvL/mHd7sqdUggExf5NpERasvUDOENv2YZ5clkZC1FAaTFUPC/pl
	bFapl4EoFTBFI4PCcbj+Sre9OkQy9RKiqj0F7zuiLj1oCxdWtMQE+L5jpEhH1Ngb3r22Bo/CyD1
	b8YImBHCArmiHa0=
X-Received: by 2002:a17:90b:5292:b0:398:e969:87ef with SMTP id 98e67ed59e1d1-39d70b7d864mr10327996a91.24.1789045108156;
        Thu, 10 Sep 2026 05:58:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:27 -0700 (PDT)
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
Subject: [PATCH 06/13] ASoC: mediatek: mt8189: Use dev_err_probe() for clock errors
Date: Thu, 10 Sep 2026 19:57:35 +0700
Message-ID: <20260910125742.150902-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910125742.150902-1-phucduc.bui@gmail.com>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_135830_201052_FDFFAF7C 
X-CRM114-Status: GOOD (  10.38  )
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
index 435914aafb44..4997031cbcab 100644
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


