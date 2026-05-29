Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055BCCD6E4F
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2026 10:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HtVdZNScTofI8P3tHPj6mAWShd/HrYu5mi6gsoESwBk=; b=xm5CocGX81xi4IGR63O989HIAN
	V9REAltkGmKZpdikys7a1QGNNE24IztkOaEIoRk1Iv5awYXOQfFvi1gE/bTDWSw14zATWn1pKelMx
	jNNMyT60S2YCdQgw/sM9u4pD25xOlunZQQyFCfdvDcpS3oX66l81uTWy2X1phs/tFGJiSfUHVl1dF
	plbQm6XpX1wnTv0IWhxP2+ameQX4jQFgnvL2WohELNO+hXFIwxJguYRs57Cngeh9GyxvvdktBILCM
	D2ZQS8yfJWlUr+b6htmbzmzLWS7OeYJdynOO+pROZMCZwclm6z1Et1Lk8ldstw8swGtaYdoCRwl2b
	1kSr3Gbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuIl-00000007APf-48tF;
	Fri, 29 May 2026 10:18:51 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuIh-00000007AJG-1LbX
	for linux-mediatek@lists.infradead.org;
	Fri, 29 May 2026 10:18:48 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-45eea3448f2so910441f8f.2
        for <linux-mediatek@lists.infradead.org>; Fri, 29 May 2026 03:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780049926; x=1780654726; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HtVdZNScTofI8P3tHPj6mAWShd/HrYu5mi6gsoESwBk=;
        b=oePTIlVE0OY02temQWgQ3JiTennzQma/6kLcDZgdtFoupK4E9fTlJX9GQOitven6L+
         UIvBpnPFo7vJABgfPtpWULdi0v0za1jbd2CXVYwXWocYTbCPKb5KB9HKK0+sxduQFXRB
         0/AKaGBDKeupbiNUkQI8vDPjSlhVT7+ySAl8rXGYpyMje89n35OPARbtP/8S+8KQzisO
         +zwvM/M9usA8BanN67b53le2KQTG+kL78S3rwdRd3fAhe7RmPlf8dX61zQJqLdjQ+ETf
         vhIcqs9DdAgur9n/Q3Qoe8G/q/VEo0WpUUvyZ6T8iEQ5AE5Fl9Y5j6UdE01KleRcDG3e
         +Rfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049926; x=1780654726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HtVdZNScTofI8P3tHPj6mAWShd/HrYu5mi6gsoESwBk=;
        b=iUCdqvCyWRwkCgsCRZIIgxlvDMlJGTmtH3psJ8F99PeyAbMDvSQQeDz846s7HVgFpX
         /MFatYN9+rv4SwsDJcMtmT7cDnN/lfGtjt08B91byKpxDbo3TT5r8YuGfUbfbuQ2oOF7
         2ib49IKeOna+JjPZcD7g3mWEcNocziG5hdIFyf5Tg+fHgTcGNDWBerxs1aGEqdTV4E7O
         g7cdyMfEUKDMTWMs0J9xn8z6hgLNlLbBLFrhYdkKBBg4zD2IxGV2uBNJizJfkWT8Wmom
         iqcS3HlprgL/21I1okO/cikJxNn+/9S5gaYnUjlgpadAG9zQDsuzGrfDnHGA3+HNSzif
         0V6g==
X-Forwarded-Encrypted: i=1; AFNElJ/bXoscUi3VIQcuWdod3fb1ldQN8XFL+yManglBoNwdI5q+6D16t4woFZ0o6bMVpsZ4TgReYH8hp84zkQzTgA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4T/w8E3WlzgkuPRpMMsGXqiYii4VU3ZVyvEw8kscEPxhgzdYt
	O92FWV8YnpPFHTXdto1nJR8MV1GYQp0NFECk8775poLEyVro1z49JztStBqsgcDutT8=
X-Gm-Gg: Acq92OEUm1wwU7Oa24mL7FLzYYM5xH81dIX4BzIEePeKrSh6wA/vpkNCooovAQvQNM9
	k12TIZqiu3/V2FTxqm+hEdXq5oqWb1xcJAIcXYhEgaMKpdYcc3Dw5TtyZaODYfc/AvJdPbVf1dm
	w1Vm6mAAX2LfIeHi5WGILyMsLvwVu4mkBWZo9NK5GNAtH+InLTm+9SQUUp8FiTo+6QBsTQtMzKE
	gHN6uJxG2wJL3EJ8TGbkx6+GkRp7CkzLYXqLQtScY33/kbyNH1yBT6e+9iwY0/PmJR7Odvet/d6
	00PH8Qnek9skPPaxR3WRy7oH2wfv3CF1CTmPqfmooCaLwyi0Mz+84VE7KwcHzEF9KUIOtSFret4
	M1TXHJZrn2SWz9DGTlhN8d5Tf384/B8OBuFi24Ablva9GRVANWjNCuEU+qyHwvc1UL6Sxp/QEsB
	Sfvzk2d6UQBA9rSTcuSapMf+zLYJjhAk3bsM72qwfaMPVhQEDT8pdKvsgUYvGRPqSHHzCwRMu61
	sFIZYWnhtMy9AkeXu8vT3eEoRbyFVr5+uvO
X-Received: by 2002:a5d:4602:0:b0:43f:e272:edff with SMTP id ffacd0b85a97d-45ef13ed7e4mr2873909f8f.4.1780049925683;
        Fri, 29 May 2026 03:18:45 -0700 (PDT)
Received: from localhost (p200300f65f47db043f932d8b97293bf6.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3f93:2d8b:9729:3bf6])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45ef35874b7sm2392386f8f.35.2026.05.29.03.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:18:45 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v1 5/6] power: supply: mt6360_charger: Use of match table unconditionally
Date: Fri, 29 May 2026 12:18:20 +0200
Message-ID: <ff94de5fb3ee6aeb1c0256e1a00c1c5ac350b430.1780048925.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780048925.git.u.kleine-koenig@baylibre.com>
References: <cover.1780048925.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=900; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=j07x97s1Wf+YOc3AIBt+BDtOm6zhVtK4xiYixM5/hT0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqGWf11W6GNZFuwWjHh5SRVpp0Kru/KhvgdEKCj YGOEfu6ShmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahln9QAKCRCPgPtYfRL+ TsQVCACKqsRzsVd97fbfB0uKqFDSIesz/zHQ38cfBH62FRQ/svd1jcnpSkZl4aTnLgP7wiBUZD8 1xG7eoyDmqnsfMqVUwLSuzym3mNgbUzzX5HTrsXhEn8RTQW/8S1RVLXRlAwsgwXn/EvbWtnmDzZ 90atHov9BC9xEpCgBvITrSSuWiG2RTu4Lg24HfdgR9pnPprAz0R2pTH73ClFSOMGhGJobKyDYQR hSnllS526cbx07AycnVtUY2A62G5w8IMbGn0M2YmtZKprJ5RFT/dwhiyRdx3LN1xOqXaj6N6Ygf P8kLbsbwpWiW4P367QSKZT8LykSDYHZSHIRlpa2tvLg6y3bG
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_031847_389211_51DDC323 
X-CRM114-Status: GOOD (  13.49  )
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

mt6360_charger_of_id is defined unconditionally, so it doesn't make sense
to not use it for the driver's .of_match_table member.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/power/supply/mt6360_charger.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/supply/mt6360_charger.c b/drivers/power/supply/mt6360_charger.c
index 69955f255091..d3b0731f6562 100644
--- a/drivers/power/supply/mt6360_charger.c
+++ b/drivers/power/supply/mt6360_charger.c
@@ -849,7 +849,7 @@ MODULE_DEVICE_TABLE(platform, mt6360_charger_id);
 static struct platform_driver mt6360_charger_driver = {
 	.driver = {
 		.name = "mt6360-chg",
-		.of_match_table = of_match_ptr(mt6360_charger_of_id),
+		.of_match_table = mt6360_charger_of_id,
 	},
 	.probe = mt6360_charger_probe,
 	.id_table = mt6360_charger_id,
-- 
2.47.3


