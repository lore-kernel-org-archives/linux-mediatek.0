Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB86C5321D
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Aug 2024 14:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=84N+5XgwWf1nwoq814fYSNnKDtDJw7Qd1tBkSaBztTo=; b=JEAeZyEbcsNrgRteV8feY23dvt
	eDL5LCTeDkw/NIHNDT5XO3TgFckZlOQ5EFYDoV17gHrJfA+EUPIOMq5uPZ269gsuS1uTAD9GBDnbh
	SC8ubzCJGLe6UCi1XZ88NUXLaM96g4APqE8NkwQglvfR9m19aFxmR6uqTIFoJAkgfTxEBrxsxeyvv
	70sOfEC3TqyEC/020IPxNYGlkKWwuzqehfym6jLIiwbele4sg8vGASivijZDmKtAgLeTCQNAraguo
	7ZSmWofLZbrakNQmc6sd4V3wTzsFvRlSZvIauGq2GsETW2d4BgyzbgCHV8LhL/FKXiWQ1VjlWXyvp
	JcSjx6lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfgp2-0000000Ggpv-31Mf;
	Sun, 18 Aug 2024 14:23:56 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfgp0-0000000Ggp5-0Vq0
	for linux-mediatek@lists.infradead.org;
	Sun, 18 Aug 2024 14:23:55 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a7d2a9a23d9so396255466b.3
        for <linux-mediatek@lists.infradead.org>; Sun, 18 Aug 2024 07:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1723991032; x=1724595832; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=84N+5XgwWf1nwoq814fYSNnKDtDJw7Qd1tBkSaBztTo=;
        b=TZIkX7te292Zt+RxFvqXgsa4L1HouyjNn+ypfx6/mmQX597PB4u4xmDsBTKzF5e4vx
         I/MA0tKUeGsCWQ+cnVtVZq79N2AJJF2t4PA6nuDhY6eIwY1jpEA+zmf0aB9qDx4IycoN
         4rMV03/rLCNOHeb5gpRIwdjW38k5hGXEZXazkHgXpDv7j73MkwppzqxEvxA/gDDKqH4r
         MSYwxzza0Jmgyz314UFGr94HXlEDGNRoKrV/Gunqg8nSHP6cexATSId90Wj4ytWaleBk
         y87Kqx4nZs2o/Ze4kXdDF0/bc9UIWOX6rPqR65ffp5H7OCvu49Gw9EPmrFCJhOSCJ3mQ
         KTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723991032; x=1724595832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=84N+5XgwWf1nwoq814fYSNnKDtDJw7Qd1tBkSaBztTo=;
        b=iC2QKYFtTAUmtN6askeSawOD2mLzGCGGDvAhpewm/2CNNdtgLJwVh8r+VBIkhKMbv0
         xA0WyGKHHCoS+mgHUN1YrShf1QVinJx1ax6NYA9HghBqIpV+9c82r1Vslfp8d4yUbM3w
         mF+4Guo57WchKWPOrr3Re0Znmdxqb6yXguo2WtAuHsPI5t//rveHs91V38BK6K1YaNEG
         uOnsWKeCrunkgAij8rQiryVJkhAmhYSc3g7N752xDnwktmwdR5AEzNSpPfuY6u/FByI7
         iDGogIyqiQg7oQNv9gUxI54ebutiAUklXHFBmoJjVQmtC7K2EQKxFjo8/GQUjdGvrowP
         J17Q==
X-Forwarded-Encrypted: i=1; AJvYcCXJFzsgRglv2eJWLOC/LCsLYxBl9HN2sM3IhaYu/iqfWmXgjpF+x9C6ZgWi/vfWAwq5dCQvlKHv0uNMDMs7LpZGvzVs1p3EWlcxZNmhdGFICGdS
X-Gm-Message-State: AOJu0YwBU70pXSbb8I0ly3PC/r/vSL189utaKLrn5i+v4zMDGLFeexZN
	nnHvH3KcQWtO0KUbWyaIKg3eX1MUDZNeJoHr/wjsIhspv06Hdzw6j+fICTvHE68=
X-Google-Smtp-Source: AGHT+IGf2pCDxIA75jH/7/L+NTnSfTLwTcnLAynOVUmTnc/INCAsrC+TWCaYgIwOf2GFYNoBXz2Lfw==
X-Received: by 2002:a17:907:f1dc:b0:a7a:a89e:e230 with SMTP id a640c23a62f3a-a839295469fmr583647666b.30.1723991032263;
        Sun, 18 Aug 2024 07:23:52 -0700 (PDT)
Received: from fedora.fritz.box (aftr-62-216-208-163.dynamic.mnet-online.de. [62.216.208.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838d023dsm519702566b.64.2024.08.18.07.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 07:23:51 -0700 (PDT)
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
Subject: [PATCH v3] mmc: mtk-sd: Improve data type in msdc_timeout_cal()
Date: Sun, 18 Aug 2024 16:23:01 +0200
Message-ID: <20240818142300.64156-2-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240818_072354_187230_91221319 
X-CRM114-Status: GOOD (  13.10  )
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

Use min_t(u32,,) to simplify the code and improve its readability.

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
Changes in v2:
- Address kernel test robot feedback and replace do_div() with a
 standard division
- Link to v1: https://lore.kernel.org/linux-kernel/20240815234602.59684-1-thorsten.blum@toblux.com/

Changes in v3:
- Use min_t() instead of max_t()
- Link to v2: https://lore.kernel.org/linux-kernel/20240817170726.350339-2-thorsten.blum@toblux.com/
---
 drivers/mmc/host/mtk-sd.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index a94835b8ab93..edeab9a4a83b 100644
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
+		      min_t(u32, timeout, 255));
 }
 
 static void msdc_set_busy_timeout(struct msdc_host *host, u64 ns, u64 clks)
@@ -840,7 +839,7 @@ static void msdc_set_busy_timeout(struct msdc_host *host, u64 ns, u64 clks)
 
 	timeout = msdc_timeout_cal(host, ns, clks);
 	sdr_set_field(host->base + SDC_CFG, SDC_CFG_WRDTOC,
-		      (u32)(timeout > 8191 ? 8191 : timeout));
+		      min_t(u32, timeout, 8191));
 }
 
 static void msdc_gate_clock(struct msdc_host *host)
-- 
2.46.0


