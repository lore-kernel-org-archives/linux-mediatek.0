Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49970EA3F09
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Feb 2026 05:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=onU77N0wQuj5Lnll1/fvZOs/qEnLfPl+2FK8REXemOY=; b=OBzz2JzPgLauoZI9tNTb7MKaQ7
	fRzMo7iqQi9c+a1PBxhRwEH07hBEldl4ILNV5+q6VAur/QIigrSxz0zNlkTuMv1vWuUMkA3Jrdojn
	NvwWqG0xL6aDgb/vjt5uZnBnYn9DQzBhf2NpsCKe3nD/Qc5pY2G7jpzAPwXt4L0t+UJ7EiPThGJ3/
	GU+/QG2J/gOUe/kh+ArohvTrG76DGntKlthIMGX7Bh6dr3LLUnsPXUHNT7twi8hwQsmSbDZYrks78
	waSkU0SWZB3N/NUWhpgbsEvheNkSYQdel6Yo52GPIkpL/C9lfm7xDGz1V7R2k5/t09NTZKAnfRS5K
	6GG1USww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpgUe-0000000GU2s-3P1O;
	Tue, 10 Feb 2026 05:41:00 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpgUX-0000000GU0B-1UC8
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Feb 2026 05:40:54 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-8c7199e7f79so529293385a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Feb 2026 21:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770702052; x=1771306852; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=onU77N0wQuj5Lnll1/fvZOs/qEnLfPl+2FK8REXemOY=;
        b=X0g0fLtSzCI+OAxzLa1ZIoHCKyaIUREt3U7SIG8jNU9Y/57kXG204h7RRU0OAvuzeu
         uiNHv3OHb37dEJX5O8b1RJs04QR9x3dVNF0pwLlxaR3I6LStnnB0m9rA09FC9nl8Dqip
         qkB4PFALT89b/00W8lxAcSBgzZ+Mq9LUbJL23ktr2EiAFFelskVuFe1lCfql3MXyWHyH
         V1zseEm6unYMhKb2mXMCFXDifID1+RthrDW4VOk2HBjXlYIGxzGxk14Zz7GpW78Xp8iD
         10DPlaaLgFxGlGBY16ssR28UeXMegac3j2fMEqyZr3nJ8BXDhWE36ComEfwRr8wXT3FF
         Pz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770702052; x=1771306852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onU77N0wQuj5Lnll1/fvZOs/qEnLfPl+2FK8REXemOY=;
        b=gb/HZy0MRj+prOU8c1m5bivEfPZKmixs6xiB7A2heLChT3QcqDrG5HJL4rac+aqwh8
         lUjvToh83pnNcybHjS15r+09VS6NnI0/kbKFsg7FHZgBzJT4WIMdLp9oml18xAo74eWP
         8hb11KD86c/3eFLZhwPe8tSI7RiN5u+87OTnsFZCY80KB/7LqTQq3hVEafRbtPjzwwid
         AhPhGz49NBDiQZLk0K3xEUCXM2hD+sSoIBhEZGwxyrSElhjkA49bJ278j8LIGA7f+/Wc
         3uRpNkIcTNO7T9dKGITOQcs2b5OdbyJ/RX32oghoS9sCLvlSoNADDBOMUN56RQbbPmS5
         b/KA==
X-Gm-Message-State: AOJu0Yzh3gdxD7DXNlPpM+Xnsa3piwyVyzg2Pv98x0sT9C4bWw6kFhZQ
	/g48YOTVdJPobdveuUXxF1WATK5IVYDaKF/AGMnWRlwiAEm5Fl1liTPQU8ci6cVe
X-Gm-Gg: AZuq6aJWSQHqxhi4rI0fgjTovYjSQ54k6Fw7/yFjzLDHAufy0vx9oy7xbWGFc3DVJIH
	uVCq0GSdtnakKDPr3Fz4o+Xb8OlRNga28DyUx/+GBvTUzMdJTBgFiA/5t52d1nfaT6E1SvRKClw
	pLxntSYbXGuLydhbkCBUJ33zglZgzPVtrpoSjgtRuzqVJEZA0nzieH0UYIqI5a4Af2Lev7LjE0E
	yZggHiDBCI2390nzG8RdhTL9xQmUipN9KoTW3oAYdiiFUurlQpgtVZhEr8gGZ38UBDz5cv4S39S
	3kseLdai+HlvW3nQIqnHnCvNq1fqKIf/bkhbfSG538OAb8xW/A1kYUDlp1nbILaGuEf+upS548E
	pEQAWDTPXfXzhV0DBKi973hpjPzHgUcAoV/2eCQMRuM22vxB4c3Yl7z+p0CZ3mc3nJ8x7CxmsQq
	dZrTUIOAsbHRKfVM011spVFW/j1QfPkYwLHIHiE/KELWqOonHFubhV/1f/QUpuSYhgl/suYHbne
	Q==
X-Received: by 2002:a05:620a:1982:b0:8c7:16fb:ed45 with SMTP id af79cd13be357-8caef7e16e5mr1861918185a.27.1770702051590;
        Mon, 09 Feb 2026 21:40:51 -0800 (PST)
Received: from aford-System-Version.lan (c-68-46-10-116.hsd1.mn.comcast.net. [68.46.10.116])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9ee9fbasm978632285a.39.2026.02.09.21.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 21:40:50 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: angelogioacchino.delregno@collabora.com,
	Adam Ford <aford173@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 1/5] pmdomain: mediatek: Fix power domain count
Date: Mon,  9 Feb 2026 23:37:01 -0600
Message-ID: <20260210053708.17239-1-aford173@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_214053_406547_CB3AA553 
X-CRM114-Status: GOOD (  12.60  )
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

The wrong value of the number of domains is wrong which leads to
failures when trying to enumerate nested power domains.

 PM: genpd_xlate_onecell: invalid domain index 0
 PM: genpd_xlate_onecell: invalid domain index 1
 PM: genpd_xlate_onecell: invalid domain index 3
 PM: genpd_xlate_onecell: invalid domain index 4
 PM: genpd_xlate_onecell: invalid domain index 5
 PM: genpd_xlate_onecell: invalid domain index 13
 PM: genpd_xlate_onecell: invalid domain index 14

Attempts to use these power domains fail, so fix this by
using the correct value of calculated power domains.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 drivers/pmdomain/mediatek/mtk-pm-domains.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index 58648f4f689b..d2b8d0332951 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
@@ -1228,7 +1228,7 @@ static int scpsys_probe(struct platform_device *pdev)
 	scpsys->soc_data = soc;
 
 	scpsys->pd_data.domains = scpsys->domains;
-	scpsys->pd_data.num_domains = soc->num_domains;
+	scpsys->pd_data.num_domains = num_domains;
 
 	parent = dev->parent;
 	if (!parent) {
-- 
2.51.0


