Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 520A1C44500
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2026 07:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c6aDPvskXT897p+or3xpt2a/W5VjcXH3b9UnC1ZCrck=; b=YxQuLgzbUi0iHMPDWR8P/UlpnW
	1IYRAo/bZiDE4Jj/wd4RzQdhSOfhl+g53DKZxBKpRm0az4RQbf75Q42sXr28A2la/SvNJ63Cuy0DB
	9G4Xi2e2c5X2Q06KUqbwCX/pcy8pzzgo1LtYjBQNXpK9F8g/prL/0w4p9POn9PyuC/Ed720hW9IqG
	Dn6WxlKkzcOoOVBHtoIoH4XE8lpNFbl6K5L7X1I2KlSueTMPQCbRPpynhhQgSfaud58h1PoE6QZoZ
	n1zF+sgTh/t+rkTQ8sMqLWg2e81bpf/bJAs2gB8mSfZVFjtS4/gQnf7HkNjEc5kkAuCrvmGmH7YQn
	5vOgsePA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0Yo-0000000EMb3-0mZi;
	Tue, 07 Jul 2026 07:49:42 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0Ye-0000000EMS5-29Qo
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Jul 2026 07:49:35 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3825c406ffeso3061801a91.0
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jul 2026 00:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783410572; x=1784015372; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6aDPvskXT897p+or3xpt2a/W5VjcXH3b9UnC1ZCrck=;
        b=kAip2jPTrq221P+fpRe+THNFeh1nwaLzhCK6N9u/l0vQ2det3/SDyU2Xbl6UOga+O+
         +G4u6X2vor88Gz7Vre9TtY/0OutlFTGwg9YJ3SxV04p9iuJlkBSPtOBJ75wgpzHstgZr
         nKlO6kQuH5JWzftMbejMRhhszYmkSt3tsG8ko9BazjbskgboidmGex6S9i/6x6L8CpJl
         CuHlNcUxfrNZQgPF0wMvfI1JJouhXoa+TPZwpQ8oOeXdd7bQH5adsgwiKng/FjLJvacX
         0lB5Yfw0o1ndqnwY1idem5/l2qbeNFv+w6K9KUtYEIaMWU+7pa95dgZDnqPgGPuLBvh3
         3QeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783410572; x=1784015372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c6aDPvskXT897p+or3xpt2a/W5VjcXH3b9UnC1ZCrck=;
        b=cLIg6e3aG+GM/rzJp6T7US49PdDVdZIi1QNGid/iq0w8kA9YnBzvRjQzj/uosDYIOd
         YtmmQYsvxWIiwrR0DErp2l1OxK6C2FDg5gF2Gwje5Jxy4dys1sNahhMYo5/ce/lDFyEY
         LtlAzcdfXM0x/eIt9QaXFZU3Ob40wiTKnBovKyNd7ZcfpS+2iuy0xoHGIEYQg1/FUukp
         aNB6hSdHN9MGxy3fZEiiafrL/faQ/NZKEbqkludpKYSpwOM+6LCVCyUf4kPjPYAxHB1K
         hNiYz4KXxnSYyTmkIlShcX/7wzq8tAXJH5oV2zQ93IVtJtwLygaj4iJn1aU10KSMPKto
         Z2UQ==
X-Forwarded-Encrypted: i=1; AHgh+RqTw2gcYLRVJmAv1zI9yJ71CBPzEiEyy4kGaI1clI/MfJJ/FYf1ZiI1EXRC6FVtySjZWfB9X8ha3wTdSbEeBg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNJiuJlcgj6g9hWG3cyHKJq3VsvzjTKnF8rEbL/Rnzzqgt19r6
	bjJJOumszYTQD+VdrZy3ZZ7Y9lp6ri50x8CM2mdoJ6pv88Dsf79Oqva+
X-Gm-Gg: AfdE7ckUlfThPONEporp4zgEY2HhsiHGXXu//1Wz4yLz94l2n+p1bYziVHFr5CRgqWY
	wZ1T4O2ENhOdkMO9A+LFGaLlSELn0BAnLfcBtzyK9l/0w3FwThIzhirBwBqBsBtpOLsF6U4hmvW
	LcAQAn+tjQBLo4j9/gMrBtPbViyxTbPaiuj0Onybaa+2daWUW9l630KdD3cLj3phYx5AFdnhQF5
	GsLfFL4JK6vuoJ2ze8oPuKfxhzOfqyajwhMyoBzTbwcz4fKKfqZ8k9wfgOTNIdgn4n2qrNJ7gqe
	3bJrPbY8kUnZwIINMFXdHxOsBpy/0KM9ZGK0ewaVAw4PUCGuZt9eY7V+s1VrDpsqhyS3/EswTL9
	7X6tWRPc7rtYSpxsVttrbt1AerXrr+nCoHsWcq6V6FKj57lU9ULa7038kMY0LkHLiLWGwhCYqfY
	T9pGgHVxYRXSx99OIRghRsML8UmPmwnOAdVpEYvSnbtdke18kDAevIR54=
X-Received: by 2002:a17:90b:4f45:b0:381:5bd6:eb19 with SMTP id 98e67ed59e1d1-387570c4074mr3687519a91.18.1783410571866;
        Tue, 07 Jul 2026 00:49:31 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a361asm626710a91.15.2026.07.07.00.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:49:31 -0700 (PDT)
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
Subject: [PATCH v2 5/6] clk: mediatek: mt8173: fix memory leak on module removal
Date: Tue,  7 Jul 2026 16:48:34 +0900
Message-ID: <20260707074839.240676-6-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707074839.240676-1-akkun11.open@gmail.com>
References: <20260707074839.240676-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_004932_674287_CDD12CA5 
X-CRM114-Status: GOOD (  11.47  )
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

clk-mt8173-apmixedsys.c and clk-mt8173-infracfg.c do not call
platform_set_drvdata() during their driver probe callback,
but their remove callback calls platform_get_drvdata().
This results in platform_get_drvdata() returning NULL,
which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
This leaves clk_data unreleased, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Fixes: 4c02c9af3cb9 ("clk: mediatek: mt8173: Break down clock drivers and allow module build")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 2 ++
 drivers/clk/mediatek/clk-mt8173-infracfg.c   | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
index d7d416172ab3..65dc4489a09c 100644
--- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
@@ -179,6 +179,8 @@ static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_ref2usb;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_ref2usb:
diff --git a/drivers/clk/mediatek/clk-mt8173-infracfg.c b/drivers/clk/mediatek/clk-mt8173-infracfg.c
index fa2d1d557e04..8b69009e1965 100644
--- a/drivers/clk/mediatek/clk-mt8173-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt8173-infracfg.c
@@ -128,6 +128,8 @@ static int clk_mt8173_infracfg_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_clk_hw;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_clk_hw:
-- 
2.54.0


