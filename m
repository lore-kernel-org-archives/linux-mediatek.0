Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8BAC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 07:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kk1IVkJvpTe0Zh8bTyck+7FAZyoMJS42cyiPfLEw51w=; b=tYnQkcd5EoVtN1
	4UvFw7M3bHa9vdcqHDsXq1sda1PqLoz+679DQAfxXZkHcm0G+wbRMrSzSyYa68HEbr/K6meQrsys/
	Oc0qQkspwfs8ukIlMeGLsMJhms7xaH94StwtosjtJgkh5FeXQ+02Z2kTEIiivqsaltl4naAjckvh0
	WW4vKT1VxO4K1XBmIfe8RbZVc0U4rH0QzSucPiSUycUZ1J8pxbo6WahvivqN33aE5r/s0AsTKyafR
	3M9kBncXDWBqiLQA/eiBDR+WENZhPKh0uDVTdFkxAUAKpbWQvdlPt75mQeHsCBHzCapKS3OUMNzrp
	1ZZrF+jD9/Zj/46zBipw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwf69-001zAM-GE; Thu, 02 Jun 2022 07:18:25 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwf5y-001z8m-73; Thu, 02 Jun 2022 07:18:15 +0000
Received: by mail-pj1-x1036.google.com with SMTP id l20-20020a17090a409400b001dd2a9d555bso4159726pjg.0;
        Thu, 02 Jun 2022 00:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R8Jzvn4KoI6zyaEC1swBdZnPsmFAJHlige3FcDhZ5Gc=;
        b=Pa6M1iUSEgtHJ+P+TN+zX25lnv33UQYDykQS3F4wk/IJGJiTEko4StIiyBUDfX6R9h
         0HQ59fKfvhydM/hJNnbaDRhY0ixmiF5JhHncDLI+ULMSAdzx/p8ABC1ljPS3Pg1z6ozq
         LhVo9hfZpmU7ELx+hRRzC1s7vs+mahvAJ+bQP06on8d9T94WFtW2CQLqBNA5seEasxPo
         YcT2U36KTqMtQzlZYzLh4/dYrXGMap+jYzbIfeed8TC6+MG7zpEsfxq6RE6T1UR9vhjR
         pyQHjiGHMgbfnTajE1Ae4ztnJyZUj9w3wwNk2X2fH1jfA6GV0NlnGKXluRkLluyDUo+P
         o1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R8Jzvn4KoI6zyaEC1swBdZnPsmFAJHlige3FcDhZ5Gc=;
        b=ne2mCav9EwGy/beF1qz6xzF2vI5QbFPXfMSTTsph3u8iuyIL/UEjorXQB3tyb5XgpG
         OptujmFrgHU6VZc98vbSlunij/+9olBIYiz1uipQ4LGyWhoHHZgsgPG10tgMO3Lgv33E
         brcDFwy+5aa/7CrZRIAE2pAKPVyMF5WOVuUnX1Wf8oZTgLJoJQWafLKv1TccEvuD6kPA
         4AaHAUgtRKlPdbgGLNNn1fDXyuMHqurWUK9+NSlGM0JtC7dy5FguTKGofGk9VXharcU3
         T8MqV61C6yRr2TGRHDXfcy9Zo8XzoJqtIAMvtgsbISzHC/y5cAVqTk6R6nWoMXgZ0cel
         72BA==
X-Gm-Message-State: AOAM530SnO/VBsFue0vnB/SyG/8gDQdvis5H0yUTSS7hHpnRyFI0jZ2B
	ds+3WuIWcFQQ3L+JU3RMOfs=
X-Google-Smtp-Source: ABdhPJwCF9zgTxD8Jpl1zz1KmAQnvxwxZhmFVGBpKn7FmZfjlKFdV7MDWp00dul1ao9oGPCp7+0XJQ==
X-Received: by 2002:a17:902:c952:b0:162:14b6:3179 with SMTP id i18-20020a170902c95200b0016214b63179mr3390242pla.7.1654154293331;
        Thu, 02 Jun 2022 00:18:13 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id b5-20020a1709027e0500b0016353696f46sm2741624plm.269.2022.06.02.00.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 00:18:12 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: lgirdwood@gmail.com
Cc: broonie@kernel.org,
	perex@perex.cz,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Minghao Chi <chi.minghao@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] ASoC: mediatek: remove unnecessary check of clk_disable_unprepare
Date: Thu,  2 Jun 2022 07:18:09 +0000
Message-Id: <20220602071809.278134-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_001814_293014_8FC432F1 
X-CRM114-Status: GOOD (  10.37  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Minghao Chi <chi.minghao@zte.com.cn>

Because clk_disable_unprepare already checked NULL clock
parameter, so the additional checks are unnecessary, just remove them.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index 31494930433f..dcaeeeb8aac7 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -286,10 +286,8 @@ static int mt8173_afe_dais_set_clks(struct mtk_base_afe *afe,
 static void mt8173_afe_dais_disable_clks(struct mtk_base_afe *afe,
 					 struct clk *m_ck, struct clk *b_ck)
 {
-	if (m_ck)
-		clk_disable_unprepare(m_ck);
-	if (b_ck)
-		clk_disable_unprepare(b_ck);
+	clk_disable_unprepare(m_ck);
+	clk_disable_unprepare(b_ck);
 }
 
 static int mt8173_afe_i2s_startup(struct snd_pcm_substream *substream,
-- 
2.25.1



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
