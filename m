Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D049C5AC67
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Aug 2026 15:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W2ll9eOek77lqJYz2Lwuo/2xHZKLi6mWDDbbpXtd1VU=; b=ZJ7+AyPsbsJUJP0GQXsJ4Eof1z
	pVzWmvS5lGV5pt/n5F0Si8qhIBdmdXKa752VH0Ckb7/OswTx23GMmNFVUbuA5yrlW8RX3rkLCuc9H
	cAw4F8M46Mva6IWy9Sgi5VOjrfZToLygQW+cJFrqkz7wI1SOelPaTUA8N303xSGNzbJbRAuEGUukU
	GUDNnXVNpkba5tPo4G/Ap27iIQZ9imz3IWsnmARjw7XRKaSUC1Qo12gkPPbd4ofYGld2tlz265QOF
	EmAOEy8lG4I2HKmpWvVNY5Xble42ydQlbvWVFmC3iym5Oo09BXGIcNqtcZrwpcTdMI8Hiu7WCs9Rv
	9E/ZjRzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsid6-00000009TsU-212o;
	Sat, 08 Aug 2026 15:06:32 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsid3-00000009Trn-2Tq8
	for linux-mediatek@lists.infradead.org;
	Sat, 08 Aug 2026 15:06:30 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so5489425e9.2
        for <linux-mediatek@lists.infradead.org>; Sat, 08 Aug 2026 08:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786201587; x=1786806387; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W2ll9eOek77lqJYz2Lwuo/2xHZKLi6mWDDbbpXtd1VU=;
        b=R/eO6ZNbbZ6B4LeQUNzUJ9vd7A5Vcshp2FCJvNBArriemT9qX8+Rw0xiwLCwsxV5uV
         JOTvPsJ+E5t/9LnswrpOcMof6BrAFjbWtGA+V/SSI46ncID9LsCBqGp6h17DOr90/4fG
         CQqaAOGuezxbsU45Le8pXAr8yTQ0LyGI5U0lgRj7G5uyNB0+eFFc0jvxHySsCyU8SYcw
         aUkwuQm2piM3Z7V2WFC5N7Is2v3Se0SgL7BpbH1u5xoMyyNBgRXXwBTGjeGP2E3LGkuD
         EncP3FA2dBlOEHOsOPHxZbUB+w0Z7bNF2SA7SdSAa9D1ftHpWxv51rbl/Bo/tWFU+F+L
         yOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786201587; x=1786806387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W2ll9eOek77lqJYz2Lwuo/2xHZKLi6mWDDbbpXtd1VU=;
        b=ojA107O0mcwuTzA0JIBlktGh/GCnSkkQZscLrP8zNZe8eNxaxAKVwNCFb9L005eH9g
         IkEfc57tcywXh2o5twJ4/C7ukX/oPV/Eql89HBELRAOy2lY0W0BWQI9mK59qekIO2THM
         V8La/QBaLaDzmD2VQUPpcQY/xV8/IVYM2AMVQVb++MM9CgSX500xjWmKh4GgmpXju9J9
         LAQJT+1Gs93TLSsA+8MzaS7r9eaSFbX6M16EpcHWEqss91cg9CDTdXQIW0PDuv98LMCT
         QMdGM0MRRZ54nOa9SOz8v41h1I90Rvgf97ryVUPHaMYXTlQzi3bK6a1toh7u/ZHKs98D
         c9/g==
X-Forwarded-Encrypted: i=1; AHgh+Rr4LmYaAyF6r99A4bpBX8MlGOEBapLsFx9CwXCsgg0LKRM70pjw1gHmexcciN7R5bcuPPxcVIBefyGtcyUigw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxfyVBHo+zq5ttlWVM+FysEqHU63+6RWck5xaGIEJSPA8TFGW5W
	Tnlbx5juqhveu+vNrWoqLBWWOh9KrJxn/npAuX6xNyxDvuvQdHCecHVV
X-Gm-Gg: AR+sD10sLPu1QwP868iv4kwTTvcT2eamw9WKFG58dSKQUj9deVXVD1TJ9efVJkxavHQ
	vzQLGG45xBckF/hFMq5OzJxWkWW4FQmrDixmijP2vvmmrNhagDlqGOIwptJsimt81n7k5SM6YCc
	1U4s9qN219yMkpt9IRMFECdbexZn1iYPCT/e1ASzB1tU/GLzAuuOod26nBNxbW/9HuqMR8JPN5X
	7UfYYwyOX3NpI7BqN4/5QiTIH4CG5gs1yoECxomah4oLYakhwyFceAdGVubojWH3LKfV0/58H+u
	OX4GtDZzEQNvZMLU5PZKqUA83+e/fKmGuilKXL4aL7es4sPn2Q7726IfH4rvGAES3xiLnT/F7tn
	QnsmDRSGrSy5/iczi5P14bJeIYqCiySiAaJQui3XO86Xi0NTV7u2dk2Y0nADq55eRiguL1WPUvW
	+xzWAz9zd/mEcu57SPZKkt63JXJlbtxT+WJuzwqZPrj98JotTwu+szlqeL/m3Pj1UtxveGjMhJv
	DmyB2D+hs6icwSHPGW+MvryipCE0XAMNYeKDVaRNX5LiMyRkWloJtICxCQPLvOZQdbOw41zsnet
	OM9TcV5AOPjBBn8pVA8EzJEQvqtejlOhuy/3X7gaIwOglg==
X-Received: by 2002:a05:600c:4594:b0:499:5f7a:7ea2 with SMTP id 5b1f17b1804b1-4995f7a7ec4mr138657645e9.12.1786201587163;
        Sat, 08 Aug 2026 08:06:27 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-077-007-004-134.77.7.pool.telefonica.de. [77.7.4.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e7b3fsm17000478f8f.20.2026.08.08.08.06.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 08 Aug 2026 08:06:26 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pmdomain: mediatek: mfg: initialize prev_o in mtk_mfg_attach_dev()
Date: Sat,  8 Aug 2026 17:05:06 +0200
Message-Id: <20260808150506.78534-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_080629_667784_50677D05 
X-CRM114-Status: GOOD (  12.01  )
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

mtk_mfg_attach_dev() reads prev_o on the first iteration of its loop,
in "if (prev_o && prev_o->freq == o->freq)", before prev_o is assigned
at the end of the loop body. On that first iteration, evaluating prev_o
reads an indeterminate value. If it is non-NULL, the condition
dereferences a stale or invalid pointer, potentially faulting or
incorrectly skipping the first OPP.

Initialize prev_o to NULL. This matches the intent as well: there is no
previous OPP to compare against on the first iteration.

Found with Clang's -Wconditional-uninitialized.

Fixes: f08e7a4e8d6ac ("pmdomain: mediatek: Add support for MFlexGraphics")
Assisted-by: Claude:claude-fable-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c b/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
index 53bdab66cf157..9a8a38d98cce7 100644
--- a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
+++ b/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
@@ -657,7 +657,7 @@ static int mtk_mfg_attach_dev(struct generic_pm_domain *pd, struct device *dev)
 	struct mtk_mfg *mfg = mtk_mfg_from_genpd(pd);
 	struct dev_pm_opp_data *so = mfg->stack_opps;
 	struct dev_pm_opp_data *go = mfg->gpu_opps;
-	struct dev_pm_opp_data *prev_o;
+	struct dev_pm_opp_data *prev_o = NULL;
 	struct dev_pm_opp_data *o;
 	int i, ret;
 
-- 
2.53.0

