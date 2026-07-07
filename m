Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1529EC43458
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2026 07:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0usj1Azn3b9r2TvYMyi39ADdH0kaKf4fB0NJ5kTbFs=; b=OPA1HLjjv6B9dQJKuGk7RaJ9C/
	5caYZHGFwDfa8Nn1NRRZx1JLNX1H3gNPIFJGNpHty3C5mfhMsbSE2+i1ZZOtOzLJYFxDRfdAR8y++
	LNr5k3wCdT0Ux0z9/vxGABR3lZfX6LIGEsNSsDeuxrmibPtM003FDMtpeh4YQavdyFDL+dwCtRj+a
	+b3yo4FhaFhrToPGkLJ74ADNcAt4il1vCGN0H/v5nppT6V+nGdq6iuehanwxr0kOh2XrB/PvFHU1o
	15dxuXoXDq275xhLoqmm2e81WM4S8bmxW59ILeYoTX7ADVC1F1K7uJHV7rQWkYJO43Cz8fmA8yydW
	0CaFttzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0Yk-0000000EMWn-17rj;
	Tue, 07 Jul 2026 07:49:38 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0Yb-0000000EMPu-1e0C
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Jul 2026 07:49:32 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-381891a9525so3598550a91.3
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jul 2026 00:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783410568; x=1784015368; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0usj1Azn3b9r2TvYMyi39ADdH0kaKf4fB0NJ5kTbFs=;
        b=dU1l9TiJIcjvry19kPWGYIt/HdAGeFSDVuc0xlX1qeaOkhw8YYtx3dY30YEZgUY4tU
         pK6mfG28n5ab7pjIsWgREso/V03L4fCpYUVNKFPKHbTGGOGoZMxCuGw4yot6/YbZeuSo
         +kY6bnkqRTHPABF/pHzdTE6bUrgjanF9Mu5FFw0g+RGKo5DIRefFym6vaZ5w3o0Si1da
         yd7m/wK2+gpaT2wgi5hx/b7fP/whIxhLJSezHUVnVOKmDafCjy0ZdIBvDAImdr8TzRQK
         5HuIjjh3esWCZ4Od05wgadBLXZxZyv8G5jjPUXqxqKxIUFTnYaAzkuX589J9xB7oayol
         PjWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783410568; x=1784015368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t0usj1Azn3b9r2TvYMyi39ADdH0kaKf4fB0NJ5kTbFs=;
        b=VWRtNwzhHSPBN6xlltYPpwOp3MxE04QX7ul5odJedzFmW69vpmA7atBnfcnO8inayz
         b2D98ZE0NwC9LwEJLfp94gDBeBXtCVEiHfM7DEVUimOCKfAj37nvoMS2EP4/6w6qX9An
         t+ipiQxPCCdHcepMBScNgF0GrkVcj863ZfP8ZwOaHEWO8j1Pu09dj4ylIU1B5cTwDLVC
         UPfxv66jeccLPDWU23VuH7nCYTZjPxyEB3LyThOqp0d6JCvkfL/iMJSN7Jbbum3BoUne
         fAtuNJ8h3imTdTC328h9QYEqLuGfzHRDDw9MEiXoB7uN17ZL8uXgFnR2ReW9JKyfGU6b
         pVKw==
X-Forwarded-Encrypted: i=1; AHgh+Rp+noASdMMvDxhFtDDTb3eCyVteLUf9ERn1qJRwCDLFIunsHif2fUhb7rjD4N//X3mvVDAjSfNeuAX8BZPDxw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxtVpcUPEI3Kb8MGhb0mG7B6cnNpP+R0R6Sty0ZnPR10gQvzYqQ
	AfR/1X7JpG6iKPKOypzCrdKZ5Zi74b5Y/2iUHXk4g+9s0l9K9y0oa/hK
X-Gm-Gg: AfdE7cm7Al7DJVGSVGrHycEuqQlV0S8NEE9+qe6fXUj7YX/jeerJY7oD3On4UrxaO50
	/U2yU59dH1j+JNIp4EJdM6xoa1jqJYFdJgK7Uq2A3R7iAXIC2bpxVJXZhm4rU9SfSf2/sCIP8bH
	q0UezBEoWAtMkrSkoxnC1ysP2ayGIKGJLCuPI8TSenLQNlmaloja54rXtGl4w7/BE2AIXL9+NJ8
	H6LtnJuWJdEwhv2i4gm1JFAQgqomCRIgGcxozi9J9r48VZj/t2zWXFwLbB2UUv5nGU+o6QOIRO+
	546qAHirBXGi1Sb/H+PC374pMXOnpRMlEE8mG4GZgc+leNkvduzz8CZ4SItffilSPuJxgZ8Z+LY
	aemr4gpO2T12sSJn7QLo4mupz1BW9LHE/ayzu5nawUwJ4xyDHPjoLA24bMmJJfxRHq5g3LJBBnQ
	1bMz5j/8Z9Bzg9iDTxUvFgu+uHjQoQGX41rzZhMnW5Owvg
X-Received: by 2002:a17:90b:4a0c:b0:380:873:49cb with SMTP id 98e67ed59e1d1-387572b380cmr4047566a91.21.1783410568403;
        Tue, 07 Jul 2026 00:49:28 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a361asm626710a91.15.2026.07.07.00.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:49:28 -0700 (PDT)
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
Subject: [PATCH v2 4/6] clk: mediatek: mt8135: fix memory leak on module removal
Date: Tue,  7 Jul 2026 16:48:33 +0900
Message-ID: <20260707074839.240676-5-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707074839.240676-1-akkun11.open@gmail.com>
References: <20260707074839.240676-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_004931_719765_45DCBC64 
X-CRM114-Status: GOOD (  11.41  )
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

clk_mt8135_apmixed_probe() in clk-mt8135-apmixedsys.c does not call
platform_set_drvdata(), but clk_mt8135_apmixed_remove() callback calls
platform_get_drvdata().
This results in platform_get_drvdata() returning NULL,
which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
This leaves clk_data unreleased, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Fixes: 54b7026f011e ("clk: mediatek: mt8135-apmixedsys: Convert to platform_driver and module")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt8135-apmixedsys.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8135-apmixedsys.c b/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
index 19e4ee489ec3..e3b7dc13b458 100644
--- a/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
@@ -66,6 +66,8 @@ static int clk_mt8135_apmixed_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_plls;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_plls:
-- 
2.54.0


