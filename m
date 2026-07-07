Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3355C43458
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2026 07:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+brjFLVFjY/4CAFVXT8akEWDnOfxHjuH7xO2k8ZWc/w=; b=sLVISLt+2PnbXX6qBwgo1JIPw0
	Nb9rpbPWknNMw+Gho1+FXh/0RuIbrSFiu/cbmLlK11C9Q+x1M28ur0Rl8gDQHhLCZKuwkSv9jONIF
	6bLkaxEBQkOA9lgwJsCz3t0r+hOA2PWwePnrPk2TPngJPtGCdFTN7GsTX8d32c5E8w89Gd1bqQp3a
	hrAmAiJoEtvJ8ss+BkV6GQoQCOZdVZTmfAPCxoPB4ne2p7GxieZ9z08ukJ/4PLUdNoXdl5uCa0/pL
	i21TO8uYTrLScjgWU0Yu9Ez/s0wasFnlmc/epO/MokUueomzoC7rp0fYvLRBIpcEk+xJvhNKMNZNm
	lO06bKrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0Yd-0000000EMRH-37r7;
	Tue, 07 Jul 2026 07:49:31 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0YY-0000000EMMx-0vEH
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Jul 2026 07:49:28 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-37fc02e660bso3148902a91.0
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jul 2026 00:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783410565; x=1784015365; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+brjFLVFjY/4CAFVXT8akEWDnOfxHjuH7xO2k8ZWc/w=;
        b=Q2QXsDxMSyRD0fYILyK617pBlWf1Wj24RhdY29Kxtio1nwpIavfMM2d9m1e+mkT/Z8
         cH8DOcB0Wh83Uc82bwBxRP8qMsgL62JS8xrvgG5OHnkaMxyE5euce+tHr9XL7CVoB7mz
         s78jFd4bx3mz2x7sFhS1jOneNTCptGFBSAw3GfWvzqegVOVtn2ENPYDZqx6rxrGoLBI8
         BJVHi2UvW1SkWmeDMVFlCDI8/bkJ8BX4oECAStTd2IkXZl0MOtlSIR4BVqIPK8pnsv/t
         rPIKLKMjkEuVekIy07MOB3pvPBwFBTBrLiGBVXNm62QCs9jg0DCKJAgJ0lnXa58CbhxT
         sIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783410565; x=1784015365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+brjFLVFjY/4CAFVXT8akEWDnOfxHjuH7xO2k8ZWc/w=;
        b=VbXpspMTLYkG7k/MoKq0p4gmDT7C1Ll6YOClzEzUMTElJIx5VCoSQWVVTAvkxAvKBn
         TOAReByqJgLqxDQEIaJaO4LzW1NTpRFzm7nwzGtevk5Kz+x4l02WKw90WFMe7AvXQcW+
         mZOJgcbzT2ir/mL6TeKwnN4NwRpnfLLdNSpzHERyj6NgFgNMndCDPZ5jnUGlm7aP5C+J
         5XlZSwwEB8jaQ3+iEHHkjcSNt+nbLCXHuEGyjatsZsu513CXf3AYCKSeFGDO5BCO4ZVU
         HRQKMJXS8OhuJa7FguX1MXhjsiPggNRS8K9mYe0mTZCjcqZR6Kg+W1o7GivEUWA3N4pk
         HY5w==
X-Forwarded-Encrypted: i=1; AHgh+Roaou71jkYmjKtY9OFRKIlk92iKtmU35jLaiz+eCgBJ9qTpihfOWN4YABzIfif0vutkKn+kHnUL52GlwmRaLg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDti91Em/r0aNMFrUSfYJfLAr24jMyUvJIgZvDRp5YiQt4IKyW
	J/09+cqlmiZ0gTDUbdJ/bbNjRTLlYLN5l3ezJOwQUVcAiQt3ocoH3sUn
X-Gm-Gg: AfdE7cnHdRHJbOXj5zvhDUxvxbUZpVtULRLBYevxb1HeEQL6Z+yMR9hFqQ/NyqJyzqR
	clf65UXHAIZt5U38muliS+yYO5etD34b6GIEL/n4Uca8VNttqLKVP//tzOdGJ1XPj818FpXpGdU
	X39MbPR6HKDpmhHQPkzZWIVtdKCRVGH8qWETIqOP2QUqO1BO2BXyQgJePHyOChevYwp6a9FoiMr
	itaAj9Kbrvc+pcnvmyTRr7nxyAS4EaR+g9MFy94bZNU3TWOXuc+p+PniHP2V8bIWgFQ8kKv2oYc
	TlpwaRUseLAE3/1o3jcN5bMtnKzJY87lPlqoLoIfed+xqDKLzXHUSJi65dJq8XKEFzflvX1ggnb
	Vp47fnMxjGdvTVysdtHqNt2E3TEwliKKsKaZ5n/C4s13LlqtAwAViGi656XwYEc1KPH+Iy0mBA6
	8idkMaD6RxbJslmfODlC6XShMR6M27/+ox3MFsHGqP03QO
X-Received: by 2002:a17:90b:2709:b0:380:9d0d:7af8 with SMTP id 98e67ed59e1d1-38758260ad3mr4159340a91.20.1783410565340;
        Tue, 07 Jul 2026 00:49:25 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a361asm626710a91.15.2026.07.07.00.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:49:25 -0700 (PDT)
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
Subject: [PATCH v2 3/6] clk: mediatek: mt7622: fix memory leak on module removal
Date: Tue,  7 Jul 2026 16:48:32 +0900
Message-ID: <20260707074839.240676-4-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707074839.240676-1-akkun11.open@gmail.com>
References: <20260707074839.240676-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_004926_267382_6EB9ADC9 
X-CRM114-Status: GOOD (  11.29  )
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

clk-mt7622-apmixedsys.c and clk-mt7622-infracfg.c do not call
platform_set_drvdata() during their driver probe callback,
but their remove callback calls platform_get_drvdata().
This results in platform_get_drvdata() returning NULL,
which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
This leaves clk_data unreleased, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Fixes: c50e2ea6507b ("clk: mediatek: mt7622-apmixedsys: Add .remove() callback for module build")
Fixes: 838b86331c5e ("clk: mediatek: mt7622: Move infracfg to clk-mt7622-infracfg.c")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt7622-apmixedsys.c | 2 ++
 drivers/clk/mediatek/clk-mt7622-infracfg.c   | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt7622-apmixedsys.c b/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
index 8a29eaab0cfc..fae8abda14b3 100644
--- a/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
@@ -109,6 +109,8 @@ static int clk_mt7622_apmixed_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_gates;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_gates:
diff --git a/drivers/clk/mediatek/clk-mt7622-infracfg.c b/drivers/clk/mediatek/clk-mt7622-infracfg.c
index cfdf3b07c3e0..cec19447d637 100644
--- a/drivers/clk/mediatek/clk-mt7622-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7622-infracfg.c
@@ -90,6 +90,8 @@ static int clk_mt7622_infracfg_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_cpumuxes;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_cpumuxes:
-- 
2.54.0


