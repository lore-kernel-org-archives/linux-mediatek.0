Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F28606A32E
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 20:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wO4RR9R4;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tC3+E0yo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Zc5nkcsaAarYiO9DOZAswFCbsJkOvanCy4xOijJ/c5U=; b=wO4RR9R4dms55MN45Trvwq5hgV
	MzbzRjJJg3NuoWT2ubJvJAG+ZsdPM18GdrPJiIccAeIQ+xyFtvN/vIojps6w/xs6Jgt+B9suKyH5Q
	O9tF7hwLQm5+HFtkk2yZkC2aaYwP1NXyljOm6Ielo4fH+OJ4lqMWXNt1h1o5vHs55AUms2BUvkBFO
	hgWuFtBrbf+6/5EcMYt7s1uo8/X3oHsMU5c0tcyG2d5Wd8z3Zczf8XP+ImfQyq7aOItwFESNwTtmG
	PE9LbGcy33ivQ1jC1nZYT7fTMmssLgehHFq5kkd9+sI6oN/O8CnefBlp+iXj1mVWdq4tfklBCg5UH
	gctXUiSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRy22-0000000ERlt-31zl;
	Fri, 13 Nov 2026 20:37:58 +0000
Received: from mail-oo2-x09.google.com ([2607:f8b0:4864:31::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRy1w-0000000ERjt-24aS
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Nov 2026 20:37:56 +0000
Received: by mail-oo2-x09.google.com with SMTP id 006d021491bc7-717028b412bso521800eaf.1
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Nov 2026 12:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794602271; x=1795207071; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Zc5nkcsaAarYiO9DOZAswFCbsJkOvanCy4xOijJ/c5U=;
        b=tC3+E0yocjsIbAYzV1os6gFAWb+yTJeqH3vfBhfs9CfBbiccAQnfJbCA5SxwUQhURk
         t8z5oIvuNk1kv29IAcEqFVTky2cB+HhpPWROsDLa34GIrSTKcoYtyBQA8vDL5KPe0bNj
         knIZU3Y+8rXDkWl5ChZfN2gBXQ3vX8iNfSBo/Qk/M7vZinPhu3hBq1R3PMMLTE3V8CEF
         gfD0AkdU5btmomA1zDrJAj76Tvij/i2mRGe0/4X3/+yKEL/XKCOQjfFwd578DGgHdfAB
         DkwpGthjKrLJZ/Z50QqiZmWrzwkY6DGzivDDV7YCcq3aWoHSZ5ppQcFBYPvXgBM4ADRB
         5Q5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794602271; x=1795207071;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Zc5nkcsaAarYiO9DOZAswFCbsJkOvanCy4xOijJ/c5U=;
        b=xRePGlwCQ30mTCvkdnsFbH9HpbrV1X7b1JdgcoakHkTEwI5syk4sLrTJnT8ybzaPe4
         ayaRscwoltNjwroZCeNPHu8vvDNG/KLTO0GSRaMQfN8rkIG8r04bSZMlIQzi5dnZtrf5
         UyXwW5G5nLSNkDaow16dyVspzuRsBNrPsd6KYUwKqeJ+I9aDfrfzwVyDt5Xi1EcO/O/3
         SmzmEH24YS9iy5Aotnoz98f4WtfoePjKlyH4TBX/4TY7ETzmpiuacoYRRkErOa32ZAfE
         yteZHx35B9+LVLip2H7Q/A9H8URPAhmODJNgG6qnUZb8wX5Q1wrYv/jEuAvGc9nvyOox
         70/w==
X-Forwarded-Encrypted: i=1; AL+hErHBXA616bAdooJHUPV7++uu61nXhlRdKh6Hjo0GRm8VkduzByqgVQ9fCyPjvSrqeWFCNYVR2j/Q4W1c7VtigQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9B9woQ1LCbXyuLCLMFURS76gEXwRXeD+pppMsp/WyGMHbRCQS3
	D3vM/GHEoepmel2Njw8+p5YBFS7WhT3DLAHhRvfQI4klBS62rqM04wnE
X-Gm-Gg: AYBFou3i4i/BcgXlGEtBCe9ruXa4UdTnuBUlKXbLCaxsOmMc1utjz8QJjpCvVnfu8IT
	yuWJptt8lLvzRnkkSaoR9M7YhbtC0upZjwmiLrQX0FNvZGkW/rbo0W+AJwBX9g6Y7vj3ZB0hBo7
	0LRW/VflE0pes80Lgoryrd+aYaH5/RhGcvANYJLvFl+OyXrb3p8ks4Xgw8gZLE7mS7uaIqadjEA
	y7w6kpX0s/okgyrpimuJeQ2L8fIov8TlhLM1I8X0MZLdQqVlyEelGgXukaBdo4ZBVLA662425HF
	fsarV+AdxEbq/vsIG78D+wIsGQw9kWL3MZVDB4i2wHiWrK1iycQpNvtYQhFbI8h2fI0kMR6RaS+
	RYHUxGASKUmqOLV6msj+0RZpuLOhwuBmu55IaKtx8DLwdyrb1uOR/c4ocgyxHum8jep3p6uF3Jx
	65XTMnAcnGJS7iVAZ8u0KYhwPnY898FemrNWqlVAaftcsQCI7BnE6cRfuM5nCMMBvBh+uVJvKj5
	/CKKMNgDxBFMWlxqW3tuQnWtA8v89BfNa0/ZGbNIF2DOQAUCojc8akMOl6ANjDnxmdf1uqwSCzk
	nT29Vyjok1IgKowRtl0jMDdIMeiKcM+x8PNbl2q4KewmaB9VRbfWgrh1y2uRbMjLs8J8ZR3+lFo
	Xt1g7jz3hz1oKGKwlb4eXqmBa/10vTqErtu8EdkwA
X-Received: by 2002:a05:6820:571b:20b0:711:1e14:d9b4 with SMTP id 006d021491bc7-71ab50733b0mr1707192eaf.39.1794602271380;
        Fri, 13 Nov 2026 12:37:51 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628813346esm3202582a34.17.2026.11.13.12.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:37:50 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 13 Nov 2026 14:37:48 -0600
Subject: [PATCH RESEND v2] clk: mediatek: mt8173-mfgtop: do not use the clk
 API from power_on
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-mfgtop-no-clk-api-power-on-v2-1-7170b91716c0@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/43OMQ+CMBQE4L/SvNlnaAtWmRx0ddDROBT6gKpQ0
 iJqCP/diIuTcb1cvrsBAnlLAVI2gKfeBusaSJmYMcgr3ZSE1kDKQERiEa24wLooO9di4zC/XlC
 3Flt3J4+uQZ1QpKWOZSYlzBi0ngr7mPAj7LeH7W4Dp08ebtmZ8u4tv5uVDZ3zz+lFz6f+P4M9R
 46GCp4obbhQal3W2l7nuaunoV58U/InJZBjtoyV4lqaJDPf1DiOL49qBzYpAQAA
X-Change-ID: 20260912-mfgtop-no-clk-api-power-on-a5e0a3a43b33
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794602269; l=6755;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=v3U93jt8orAgu7mG/6da04OsfMNjJZpfnJCbViyIMBA=;
 b=cU0Bo1FdR39xrhVHWXnJGjZfzo1uEaSkQm/WaAkCDpxeltTvsMLmcWVv/n1HBi7WqDJs5RIQz
 8qvKd8tIAIJCdwZBjXI03S/ak41novQye9/VhzttpqD+qQA1rGvfpZ2
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_123752_553925_6957F640 
X-CRM114-Status: GOOD (  20.22  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

clk_mt8173_mfgtop_power_on() calls clk_prepare_enable() on the mfg_26m gate
that this same driver provides. That is a layering inversion which cannot
work: clk_core_prepare() calls clk_pm_runtime_get() on the clock provider
-- this driver's own device -- and genpd power transitions run at _noirq
time, where runtime PM is disabled and pm_runtime_resume_and_get() returns
-EACCES.

Measured on mt8173 (amazon-suez) during resume from suspend-to-RAM,
immediately after the secondary CPUs come back up:

  clk-mt8173-mfgtop 13fff000.clock-controller: 26 MHz clock enable failed: -13

The failure is not survivable, because genpd_sync_power_on() ignores what
power_on() returns and marks the domain on regardless. The clock is then
left ungated-but-unprepared, and the next power_off() underflows its
refcount:

  mfg_26m already disabled
  mfg_26m already unprepared
  WARNING: drivers/clk/clk.c:1048 at clk_core_unprepare
  Workqueue: pm genpd_power_off_work_fn
    clk_unprepare / clk_mt8173_mfgtop_power_off / _genpd_power_off

Gate the bit with a direct regmap write instead. The vendor driver
(mtk_mfgsys.c) also drives the four MFG CG bits with raw register writes
from its power sequencing. The runtime-PM path was never affected, only the
_noirq transitions of system suspend and resume. mfg_26m stays registered
as a clock for any consumer that wants it; nothing currently does.

Because the gate is now driven from the domain callbacks, its enable count
in the clock framework stays 0 while the domain is on. Mark it
CLK_IGNORE_UNUSED so that clk_disable_unused() does not gate the 26 MHz
clock under an already-powered domain when a consumer probes before late
init; the domain callbacks are the only writers.

Fixes: ebd0b73d2137 ("clk: mediatek: Add mt8173-mfgtop driver")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
RESEND: no changes since v2 [1], rebased onto v7.4-rc2, with Angelo's
Reviewed-by collected. Jerome noted this goes through Angelo's MediaTek clk
pull request for 7.5. The Assisted-by: LLM trailer, which the kernel no
longer uses, is dropped. Regardless, the patch was still developed with the
help of an LLM.

[1] https://lore.kernel.org/all/20260913-mfgtop-no-clk-api-power-on-v2-1-b84771a3d5bd@gmail.com/

Changes in v2:
- Mark mfg_26m CLK_IGNORE_UNUSED: with the gate driven from the domain
  callbacks its CCF enable count stays 0, so clk_disable_unused() would gate
  the 26 MHz clock under an already-powered domain if a consumer probed
  before late init (reported by the Sashiko review of v1). Verified on the
  Fire HD 10: the gate follows the domain (hardware Y with the GPU active, N
  after unbind) while the enable count stays 0, and the GPU keeps working.
- Link to v1: https://patch.msgid.link/20260912-mfgtop-no-clk-api-power-on-v1-1-def157ad1277@gmail.com
---
 drivers/clk/mediatek/clk-mt8173-mfgtop.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8173-mfgtop.c b/drivers/clk/mediatek/clk-mt8173-mfgtop.c
index 3f4a1320930d..614b21e7ae9d 100644
--- a/drivers/clk/mediatek/clk-mt8173-mfgtop.c
+++ b/drivers/clk/mediatek/clk-mt8173-mfgtop.c
@@ -30,6 +30,8 @@ static const struct mtk_gate_regs mfg_cg_regs = {
 	.set_ofs = 0x0004,
 };
 
+#define MFG_CG_26M	BIT(3)
+
 #define GATE_MFG(_id, _name, _parent, _shift, _flags)	\
 	GATE_MTK_FLAGS(_id, _name, _parent, &mfg_cg_regs, _shift, &mtk_clk_gate_ops_setclr, _flags)
 
@@ -38,7 +40,8 @@ static const struct mtk_gate mfg_clks[] = {
 	GATE_MFG(CLK_MFG_AXI, "mfg_axi", "axi_mfg_in_sel", 0, CLK_SET_RATE_PARENT),
 	GATE_MFG(CLK_MFG_MEM, "mfg_mem", "mem_mfg_in_sel", 1, CLK_SET_RATE_PARENT),
 	GATE_MFG(CLK_MFG_G3D, "mfg_g3d", "mfg_sel", 2, CLK_SET_RATE_PARENT),
-	GATE_MFG(CLK_MFG_26M, "mfg_26m", "clk26m", 3, 0),
+	/* Driven by the power domain callbacks, not by a clk consumer */
+	GATE_MFG(CLK_MFG_26M, "mfg_26m", "clk26m", 3, CLK_IGNORE_UNUSED),
 };
 
 struct mt8173_mfgtop_data {
@@ -46,7 +49,6 @@ struct mt8173_mfgtop_data {
 	struct regmap *regmap;
 	struct generic_pm_domain genpd;
 	struct of_phandle_args parent_pd, child_pd;
-	struct clk *clk_26m;
 };
 
 /* Delay count in clock cycles */
@@ -66,12 +68,12 @@ struct mt8173_mfgtop_data {
 static int clk_mt8173_mfgtop_power_on(struct generic_pm_domain *domain)
 {
 	struct mt8173_mfgtop_data *data = container_of(domain, struct mt8173_mfgtop_data, genpd);
-	int ret;
 
-	/* drives internal power management */
-	ret = clk_prepare_enable(data->clk_26m);
-	if (ret)
-		return ret;
+	/*
+	 * Drives internal power management. Written directly: the clk API
+	 * needs runtime PM, which is disabled during _noirq transitions.
+	 */
+	regmap_write(data->regmap, mfg_cg_regs.clr_ofs, MFG_CG_26M);
 
 	/* Power on/off delays for various signals */
 	regmap_write(data->regmap, MFG_ACTIVE_POWER_CON0,
@@ -103,7 +105,7 @@ static int clk_mt8173_mfgtop_power_off(struct generic_pm_domain *domain)
 	regmap_write(data->regmap, 0xec, 0);
 
 	/* drives internal power management */
-	clk_disable_unprepare(data->clk_26m);
+	regmap_write(data->regmap, mfg_cg_regs.set_ofs, MFG_CG_26M);
 
 	return 0;
 }
@@ -155,16 +157,10 @@ static int clk_mt8173_mfgtop_probe(struct platform_device *pdev)
 		goto put_pm_runtime;
 	}
 
-	data->clk_26m = clk_hw_get_clk(data->clk_data->hws[CLK_MFG_26M], "26m");
-	if (IS_ERR(data->clk_26m)) {
-		ret = dev_err_probe(dev, PTR_ERR(data->clk_26m), "Failed to get 26 MHz clock\n");
-		goto unregister_clks;
-	}
-
 	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, data->clk_data);
 	if (ret) {
 		dev_err_probe(dev, ret, "Failed to add clk OF provider\n");
-		goto put_26m_clk;
+		goto unregister_clks;
 	}
 
 	data->genpd.name = "mfg-top";
@@ -197,8 +193,6 @@ static int clk_mt8173_mfgtop_probe(struct platform_device *pdev)
 	pm_genpd_remove(&data->genpd);
 del_clk_provider:
 	of_clk_del_provider(node);
-put_26m_clk:
-	clk_put(data->clk_26m);
 unregister_clks:
 	mtk_clk_unregister_gates(mfg_clks, ARRAY_SIZE(mfg_clks), data->clk_data);
 put_pm_runtime:
@@ -217,7 +211,6 @@ static void clk_mt8173_mfgtop_remove(struct platform_device *pdev)
 	of_genpd_del_provider(node);
 	pm_genpd_remove(&data->genpd);
 	of_clk_del_provider(node);
-	clk_put(data->clk_26m);
 	mtk_clk_unregister_gates(mfg_clks, ARRAY_SIZE(mfg_clks), data->clk_data);
 	of_node_put(data->parent_pd.np);
 }

---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20260912-mfgtop-no-clk-api-power-on-a5e0a3a43b33

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>


