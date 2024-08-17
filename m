Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE110C52D7D
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Aug 2024 17:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d+1eDU6pL8mMJapdvQIZCpIdrVaFZMCR1Rwjbr7DrUQ=; b=0Y6KlxMp+Z7k2sl43rZmUI8Qa+
	A851sSL1kqJUGXHrg7mdGdxANqijAL/Lh1fYVvIo+roTvwBp/xaTCPSGqZ5Y58fiR9hfY73N0RA7Z
	CiHx/0+QAZUmRS2XeeY0OUn2QuHQUIS57bEkbOt417cgR9lm/sq9xmkMjgOgjeKUts7umYldnoxcJ
	IEE8+k7x4UhZGX16EIfYEQyD/ZcCWrUfb3PFE0ZOv4IfVBuRr9dXLuP9OBydIWvZFICSVT8fe1C0R
	FSGh2QmUKQLqPnWdIbVPFniZRf6dlpnlIKeRd2wpc4niZr1REFmHGs1XXgnT6aEiG2C4Oh5hrMlIu
	TUuHMbxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfMum-0000000FWCV-3Eh8;
	Sat, 17 Aug 2024 17:08:32 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfMui-0000000FWBh-41ca
	for linux-mediatek@lists.infradead.org;
	Sat, 17 Aug 2024 17:08:30 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-36d2a601c31so1644594f8f.0
        for <linux-mediatek@lists.infradead.org>; Sat, 17 Aug 2024 10:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1723914506; x=1724519306; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d+1eDU6pL8mMJapdvQIZCpIdrVaFZMCR1Rwjbr7DrUQ=;
        b=eap03+kpf1LgqVcK4o1SOr1Z+18YebLjgIa1f4HxbWtb3mrLmzODs6EdqJBDQPbj29
         XvACW0p1IrxwW4sKgEvVzOcP/pQqJYHUqtYH0zB5Tjryh0zT65A/ipV3IBMcZntuP6KS
         v63QIdhu9YxLPi5W1J4ZYChoN0k+Jr95KT/4LkoQ1p0ey8LtGpPG/EwY4TbP3F8+Ctga
         dHgkYGOTQsAuR0hFpgy69LAefZn9fFO/NCXwFlAvKIRcrLfW/mrDxELzM+m1Vw3d2NHM
         JO5ervpBCihbcGRYu2OP6HDCzlOs00HNumhaf7M0NjbPjrRitr6HNoO1IcvnRf80dFs/
         WVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723914506; x=1724519306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d+1eDU6pL8mMJapdvQIZCpIdrVaFZMCR1Rwjbr7DrUQ=;
        b=BtwaxqlOb6sraFhec8O0/mpNW4Sc+EJzxasRrURY2PCRS3jnJTxYsSRbhAMUL1nQXV
         Zg9YmjE6Av5p2Fb03oX5Xh4nbQgHTNxhV/pnkurulpCsolNsNzGM8Pn0qU3BcECH68M8
         XJUjuMV3SBISltxu4uMSn/EnidYIb0n2PKQ8JuGfNMcDh0mlZOYegqmX+5b2hk70FDiY
         2XzBviSXUnlwPUxa3cvpmow98uPD0jwV2rzM5HNi3pNjXv4o4gGVw1aT4FsIIOYStHGc
         G8PLIz3PuRjiYzTtSH6HlcsXpDe1bCgrCuvV7QgZA8DEwyovPD3P2yoK2LCZU6ETx4jK
         SbCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLKAgNAJpOOa+xZSj9dqvwdv0nzr+4kXLuB6hC4XWNHNFRIw35pPZMhfnIyaD8O+1rfJ5tk8iphzradLLHRw==@lists.infradead.org
X-Gm-Message-State: AOJu0YweP72Y+o/KG+9zOekBK9wL9BSMI6KCob0wnJSaG5zgw/R+ZlSa
	Zz3/K1Z0KhhBOo3vij0f6arFzOoW9fPiL4xcGqZ/MJcPQqtjgRKqmcbnP63RSZY=
X-Google-Smtp-Source: AGHT+IE6b+7jzq7Estkt2Ds0gB54QWf9sQi+i/YVKv8R3zFoXTCBoiPafqZq06a1W6N57RJaY3yq9w==
X-Received: by 2002:a5d:4486:0:b0:371:8484:57d7 with SMTP id ffacd0b85a97d-3719444b7e0mr3926720f8f.15.1723914505446;
        Sat, 17 Aug 2024 10:08:25 -0700 (PDT)
Received: from fedora.fritz.box (aftr-62-216-208-163.dynamic.mnet-online.de. [62.216.208.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898aa229sm6256167f8f.88.2024.08.17.10.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Aug 2024 10:08:24 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: chaotian.jing@mediatek.com,
	ulf.hansson@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Thorsten Blum <thorsten.blum@toblux.com>
Subject: [PATCH v2] mmc: mtk-sd: Improve data type in msdc_timeout_cal()
Date: Sat, 17 Aug 2024 19:07:26 +0200
Message-ID: <20240817170726.350339-2-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240817_100829_145306_B380EC31 
X-CRM114-Status: GOOD (  12.46  )
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

The local variable clk_ns uses at most 32 bits and can be a u32.

Replace the 64-by-32 do_div() division with a standard divison.

Since do_div() casts the divisor to u32 anyway, changing the data type
of clk_ns to u32 also removes the following Coccinelle/coccicheck
warning reported by do_div.cocci:

  WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead

Use max_t(u32,,) to simplify the code and improve its readability.

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
Changes in v2:
- Address kernel test robot feedback and replace do_div() with a
  standard division
- Link to v1: https://lore.kernel.org/linux-kernel/20240815234602.59684-1-thorsten.blum@toblux.com/
---
 drivers/mmc/host/mtk-sd.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index a94835b8ab93..950c60102bdf 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -795,14 +795,13 @@ static void msdc_unprepare_data(struct msdc_host *host, struct mmc_data *data)
 static u64 msdc_timeout_cal(struct msdc_host *host, u64 ns, u64 clks)
 {
 	struct mmc_host *mmc = mmc_from_priv(host);
-	u64 timeout, clk_ns;
-	u32 mode = 0;
+	u64 timeout;
+	u32 clk_ns, mode = 0;
 
 	if (mmc->actual_clock == 0) {
 		timeout = 0;
 	} else {
-		clk_ns  = 1000000000ULL;
-		do_div(clk_ns, mmc->actual_clock);
+		clk_ns = 1000000000U / mmc->actual_clock;
 		timeout = ns + clk_ns - 1;
 		do_div(timeout, clk_ns);
 		timeout += clks;
@@ -831,7 +830,7 @@ static void msdc_set_timeout(struct msdc_host *host, u64 ns, u64 clks)
 
 	timeout = msdc_timeout_cal(host, ns, clks);
 	sdr_set_field(host->base + SDC_CFG, SDC_CFG_DTOC,
-		      (u32)(timeout > 255 ? 255 : timeout));
+		      max_t(u32, timeout, 255));
 }
 
 static void msdc_set_busy_timeout(struct msdc_host *host, u64 ns, u64 clks)
@@ -840,7 +839,7 @@ static void msdc_set_busy_timeout(struct msdc_host *host, u64 ns, u64 clks)
 
 	timeout = msdc_timeout_cal(host, ns, clks);
 	sdr_set_field(host->base + SDC_CFG, SDC_CFG_WRDTOC,
-		      (u32)(timeout > 8191 ? 8191 : timeout));
+		      max_t(u32, timeout, 8191));
 }
 
 static void msdc_gate_clock(struct msdc_host *host)
-- 
2.46.0


