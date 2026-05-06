Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00FACD3427
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2026 00:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FIkhsuFDNVg2QL0eFScvFiGzWT8ms604ryNMjv2aL68=; b=N+XtlCzw2Bjqj/a9Zb1xXUJyFJ
	A5FRKdrhIlfry+IoBvZdRGvr6PXl8vFD8D8fNcpHkl0UF87RbLjwu6TKE3X3glwrH8F/y5Lnvdt1d
	9XIt4LOABcWvG15FmTSmpc6FNclEwYk0yySNdAUIWvihn/EXOJS1hE72IdsWg7ml7S78f5i8VGHZd
	0c88IGpzE2qvsQWAq1kau+9xoFzu7TZUgcf5UbRiQNFj9HqEceD0IXLPkHHO4o0TOdfRl6FczVcH3
	UdCvhTYuunOvsbcxUCdX5+V81Myd5ex3ut6rVIprwyoRmAqNuYRGhLUM5XmNrb76LWc4oNCwVbKMV
	M86KVkJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKQTn-00000000LZb-3wK0;
	Wed, 06 May 2026 00:51:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKQTi-00000000LSr-06uV
	for linux-mediatek@lists.infradead.org;
	Wed, 06 May 2026 00:51:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778028665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FIkhsuFDNVg2QL0eFScvFiGzWT8ms604ryNMjv2aL68=;
	b=BKgWPdtzRfLK13KDD/62zLRbDJxVlvY1Q3svsuJJ/EAqTDRI8hte7KdUCGx+IOR8i37CzA
	SW1W+MIR6/FVmuGo6LFL4sjaVCY2Sc9gWBSLe01cWmwqW4bV3hSh2wlEgpCFTQ8DKWw/MO
	lPetJIE3Fw8AgqIxJp24AzIuFT3TidY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-kqyfdu8tPsiPKtv33Ge4NA-1; Tue, 05 May 2026 20:51:02 -0400
X-MC-Unique: kqyfdu8tPsiPKtv33Ge4NA-1
X-Mimecast-MFC-AGG-ID: kqyfdu8tPsiPKtv33Ge4NA_1778028662
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8f461b583acso1720602285a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2026 17:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778028662; x=1778633462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FIkhsuFDNVg2QL0eFScvFiGzWT8ms604ryNMjv2aL68=;
        b=a9/DjLvP3p6Xy5vqIPKeDsw0rX0+ixtawYnahJgots/FqnbVdLw53a9e6qi+KJFGXC
         DRqJIProm8RjrqJnCx7XvgkcJWRO+211XZCsCaPGkU2sUxNuiI6MrrcbBgmfbw96MLOQ
         SwPXLXMvtuFzgK+c2tivBr4FYh1dYeA1UY3tGeGegPCmu713nr2KOzIX6a1N9uBp2zQK
         TpN5ZE3YY5bWk3oiX9rpvrxQFdpfLckVyuFSTx3VIeWJPTYVn7XICnImc1Y8IdFSSHl4
         cH6qPkFCtqWOqwC0RKUkDKNj7SuVrJDY+wzve5BOzVaM+9pHOdQZLas3BpVAcuGHAv+B
         /OrQ==
X-Forwarded-Encrypted: i=1; AFNElJ+PHIQJx6Oe4KxRZVYwR3bTrFS26c0jBHGAlrz5fxCbu1nvGMmghHjex8TmTOE068H1igJuCYETxGAbhhl+QQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzktvnhEjalYHGwLvR4+dhze9MB0+S01SWVzubMqAgRgNLmL90L
	N0j7tkWBSnjvnnyew5xX16f2ag8vz/Bq8a4nH8K3H8dNyLZnZfFSKniXfSvhMVaZCvzzMJAxO4A
	Zhp66jioSD7jHDZvDornfAjtF6Zm4zLPUfVJ/L1q5klhm9DFxDjyyD1PPRzXEUWFruRgUDg/RFQ
	==
X-Gm-Gg: AeBDievhmsKz6nzs2MAx7feynbfrlGkR+1gGj97wetjCx4g35gza4Yrd2s5TVOl+6NX
	akvd/XWve/oeFNIiRt4mPfKo6WR0Y2qOKD1ciLgLdSMMTIrnI9qIv9VIA9NeLhGlIDcxY/k5nFk
	+O0BS1BzW6ZxfAAyHHCPY1PHRZaorZOfQITE0fK2SsDJ2EDjbQVURPeu/JsZkrZZAfpDSmMnKZ+
	rWwHTlYkNLyvkaRqm3ZBp25UHJtkA5lNakqVl3CDjwrVcIsOSrehzZYW1Jr3cxO0I3CwGUUezo5
	J/rvU49blyRK3aSwOXxgVtPEHVsL2OpzvJwMTTeUiuC9x0h+/6XGPNRdhMPwa/1CyY/Tgp4febc
	Imh3yvj4i3odFWqBJAP2GZ+EasYJnT69eSsRcrOGve7Sz08KpUpjd5PHW6PVq47JI3DBCodfG
X-Received: by 2002:a05:620a:29cf:b0:8ee:9f5e:e13c with SMTP id af79cd13be357-904d4d530d6mr225966085a.21.1778028661669;
        Tue, 05 May 2026 17:51:01 -0700 (PDT)
X-Received: by 2002:a05:620a:29cf:b0:8ee:9f5e:e13c with SMTP id af79cd13be357-904d4d530d6mr225963285a.21.1778028661222;
        Tue, 05 May 2026 17:51:01 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91fb3bsm1464933385a.41.2026.05.05.17.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 17:50:58 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 05 May 2026 20:49:11 -0400
Subject: [PATCH v3 15/15] pmdomain: mediatek: mtk-mfg: use
 clk_determine_rate_noop()
MIME-Version: 1.0
Message-Id: <20260505-clk-determine-rate-noop-v3-15-f3f829fbacdf@redhat.com>
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2643; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=wJwL5Ib1H4VqqPNlUn54BDvQ0NT7cZrT9AxzX6ejkYo=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ/TfB7WDX36Oq1G0SYpUQLPGs71kSvW7Hzy9IO85uvW
 1MPta8o7ShlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiGuIM/31XfVr7f7Z/evlk
 8cZa8byLHUcWLtCYcGribON/RwM7bJYwMizMbLu5tf36tHP3791WnvaCVeOBevw/pXV2Ra1bPT/
 rfOQEAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lOXTnIVOenElUllqaYX9jqAlNcW9XcXWuvW9dTp4SJY_1778028662
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_175108_481316_62FE1ECE 
X-CRM114-Status: GOOD (  14.46  )
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

Drop the driver-specific empty determine_rate() function and use the new
shared clk_determine_rate_noop() helper.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
To: Ulf Hansson <ulfh@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org
Cc: linux-pm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
---
 drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c | 23 ++---------------------
 1 file changed, 2 insertions(+), 21 deletions(-)

diff --git a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c b/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
index 3ce6fb74dd53..64fef838776e 100644
--- a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
+++ b/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
@@ -310,25 +310,6 @@ static unsigned long mtk_mfg_recalc_rate_gpu(struct clk_hw *hw,
 	return readl(mfg->shared_mem + GF_REG_FREQ_OUT_GPU) * HZ_PER_KHZ;
 }
 
-static int mtk_mfg_determine_rate(struct clk_hw *hw,
-				  struct clk_rate_request *req)
-{
-	/*
-	 * The determine_rate callback needs to be implemented to avoid returning
-	 * the current clock frequency, rather than something even remotely
-	 * close to the frequency that was asked for.
-	 *
-	 * Instead of writing considerable amounts of possibly slow code just to
-	 * somehow figure out which of the three PLLs to round for, or even to
-	 * do a search through one of two OPP tables in order to find the closest
-	 * OPP of a frequency, just return the rate as-is. This avoids devfreq
-	 * "rounding" a request for the lowest frequency to the possibly very
-	 * high current frequency, breaking the powersave governor in the process.
-	 */
-
-	return 0;
-}
-
 static unsigned long mtk_mfg_recalc_rate_stack(struct clk_hw *hw,
 					       unsigned long parent_rate)
 {
@@ -339,12 +320,12 @@ static unsigned long mtk_mfg_recalc_rate_stack(struct clk_hw *hw,
 
 static const struct clk_ops mtk_mfg_clk_gpu_ops = {
 	.recalc_rate = mtk_mfg_recalc_rate_gpu,
-	.determine_rate = mtk_mfg_determine_rate,
+	.determine_rate = clk_determine_rate_noop,
 };
 
 static const struct clk_ops mtk_mfg_clk_stack_ops = {
 	.recalc_rate = mtk_mfg_recalc_rate_stack,
-	.determine_rate = mtk_mfg_determine_rate,
+	.determine_rate = clk_determine_rate_noop,
 };
 
 static const struct clk_init_data mtk_mfg_clk_gpu_init = {

-- 
2.54.0


