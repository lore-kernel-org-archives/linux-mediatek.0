Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B823C43458
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2026 07:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZgeIwqrRwEWwVAYs7V5QSF1WwroM+m3Iz8O4TkBApNo=; b=YFVOyaZkutufrIr2BeCUCTaOWM
	ccne9zk4syc1IhEsoCTI1jqich0KTMibrgqSDHi17xm46E0iNotW6lhp5sQyWh5ygI7aVcW77ePpq
	G2QCp9WzO0o5v6QTnR4w+SyhvxEmySRGjX70N5LYEXkdXub9E1euC92Qvq4vpsG06cjc6A4qFsKNB
	+KuGlEj7DU48kRpBfuDOyEIAIN1Zq5yqrKZuUKR42JwaHcEOpxL16n6zjN96+FN7b7yhhaXnfS+6B
	xaii9Ut59c6aZxQy8muMISKHfWbMsd597Y/7pgl2NeT/kiUqnwerSbwrC1tMjKBk2JcitKp9QqruJ
	j8K4qr5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0YW-0000000EMLU-12j6;
	Tue, 07 Jul 2026 07:49:24 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0YR-0000000EMHw-24nj
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Jul 2026 07:49:23 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-37e0a189b0bso2788669a91.1
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jul 2026 00:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783410559; x=1784015359; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZgeIwqrRwEWwVAYs7V5QSF1WwroM+m3Iz8O4TkBApNo=;
        b=SCcv5Sx2g7kCriomE8GqAq4MYbgHQj2zPnM54tjbzUgJSgXkipBzZisfKHPJqoA6Se
         lQqfDLbXbs746QIvzx7OrFbx85X15zxVcK9iW1LO+NNTnDIQtPcMpdfAGM8Z4SzG7Tdn
         YAdwohFZl8faSh2ZXQylXOIwpIuM50EoQqFNMexhAzeuUMJGsfXngVwv0xUAmA3sc/N/
         7FOup8SRfkYcTQdGZ+H6rmv39h0TYfhb57abmEWaDiuAlf7X7NyDUGXHKW9ges+9v5Rj
         ZclYI3NsLAkhjC46rSx2zvokqjxi0wDKg7JZ118AFvlSohVSzBkv5gkBgDJWwZHpct99
         RmVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783410559; x=1784015359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZgeIwqrRwEWwVAYs7V5QSF1WwroM+m3Iz8O4TkBApNo=;
        b=a9sKrqtW91gSjWdAPvPdPmlV68lhyeikZjKlaue6KPx8bOdstY3/k6Nqbfqb+rY+FG
         eMD0sEIxjHTQj8tjOiFb25mPNvanNozZ/4I51vcigFgV6fHz8y4LOokqck9j7SOGNKnc
         PEr0a5xI94sVWA6fMQefQm5FWHS+WPp3LcsUemmoNAl0ghY4hnW2CH6KElNXMUEPpACh
         ukRLnGnUq66yAYxItkCzCGNZhSca2zJA1s/YaHK7K15kckS2d+rhexOklC5fo7ihUvPk
         Zxd2FXIBM+JEt+enwrStiF1UuE+JH6jKigh9IlqVQNGk7LIDAneJ5Yv64YvABYSvZAWz
         450g==
X-Forwarded-Encrypted: i=1; AHgh+RojXEb4I3Q7J9Kq9uvrLyEB/uaCxEn5k8blybLnCucPCaJAnJfHl0FpZn4oJz9izqR0N/PusZGwH6n5hEUmZA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzXA94bPUlYrGE3N8t/4mEvA4eG7Rv4y2Nht+qZwwWXZbxVR/LP
	dPLUEyXyfW9e5FCcYxkFS8VrA/5SPln572Wi9F56cP+fi3QvC4ye2lr9
X-Gm-Gg: AfdE7cnNxqs5wcpmXkY8/WIlayvZC0yqy2edVEBuxZ4jbNqtBEQBldQgCKvbGgYehrL
	VfeVoMsty30bzVFlhAz/je4NRSCaPrJY9s3c4UxxqwKNnzVePviWBhw+ut48by6D/KOAlt69mJx
	6ZkqHaIJh0EPIOtkOc1TYRkN4vMdhD+hSZ8O3YX48G+R3y3dgZtK3g643Y8XiaPukPAKOIRqG3m
	p+TuvDX6xkkkB1OLvNRBo9qJ2x6QSp3OYdC3cHN51K7Xsxp5FuY0tU2bTLNA99dv/mcLjMwyv1o
	mznxZJRchXE2W/zKzBUp55L5+oFwmXGAxyfVn3BCNK3rnux147Okyl38oqYvYN2twZfPyEj7+gK
	cnDxjMquiWN9Lgyr4gJMBq3XlBwig1I7YA3pX5yk7xqC8ot2K7SzyPi0WLV6JPhr5y7J1oLMdH2
	rmaMCu32yAlHH2acBgivy8/p6xKuw3FvkUr16zb37Jqpvk
X-Received: by 2002:a17:90b:55cd:b0:381:e93b:f740 with SMTP id 98e67ed59e1d1-3875595f2c7mr4256887a91.15.1783410558557;
        Tue, 07 Jul 2026 00:49:18 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a361asm626710a91.15.2026.07.07.00.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:49:18 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	stable@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Miles Chen <miles.chen@mediatek.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2 1/6] clk: mediatek: mt2712: fix memory leak on module removal
Date: Tue,  7 Jul 2026 16:48:30 +0900
Message-ID: <20260707074839.240676-2-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707074839.240676-1-akkun11.open@gmail.com>
References: <20260707074839.240676-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_004920_049311_134C00F0 
X-CRM114-Status: GOOD (  11.09  )
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

clk_mt2712_apmixed_probe() in clk-mt2712-apmixedsys.c does not call
platform_set_drvdata(), but clk_mt2712_apmixed_remove() callback calls
platform_get_drvdata().
This results in platform_get_drvdata() returning NULL, which leads to
calling kfree(NULL) in mtk_free_clk_data(NULL).
This leaves clk_data unreleased, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Fixes: c6368ce86435 ("clk: mediatek: mt2712-apmixedsys: Add .remove() callback for module build")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt2712-apmixedsys.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
index 54b18e9f83f8..087cf574bcdc 100644
--- a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
@@ -129,6 +129,8 @@ static int clk_mt2712_apmixed_probe(struct platform_device *pdev)
 		goto unregister_plls;
 	}
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_plls:
-- 
2.54.0


