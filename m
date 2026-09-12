Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CF8C88E56
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Sep 2026 18:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pyGOuWl1kIoFr1BB5GPKM41t/39zE+ryKhiJyT6xB7s=; b=AS1weuf5IlZjvFrGPh/EMNDL+s
	ZuA/IFYDMrvdnfs1SweHgBoJdrz0x7WtQqRe4rIkme9wMd9yEOOHKWikiprusjSiOJi5OKVmlbgjW
	1U/E4oybVPRe8jSqn5jrRhfw3lZ/ptZzUZtk33YRTSknhRk+W9OgcfuAdXgWwNM4bBc6w2MmGHOoG
	YXk9lrQDIsNigWCz9yibEnV0B0648hB9U/oErnOzw6uK+QvQZ1MCe0aeQbCqcQV2NCtiHaM0xrHok
	LQ8Duw3zPwO07gtR3oFln4ZJ90vXmtG5vJb79TKYDAzOCIpoVjuUIQ/2+WCNgfvYfUnpxmOsTk3BT
	PWTPEKGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5SX1-000000014Im-0tm4;
	Sat, 12 Sep 2026 18:32:55 +0000
Received: from mail-oi2-x0b.google.com ([2607:f8b0:4864:32::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5SWx-000000014I1-0c4r
	for linux-mediatek@lists.infradead.org;
	Sat, 12 Sep 2026 18:32:53 +0000
Received: by mail-oi2-x0b.google.com with SMTP id 5614622812f47-4bfec71901fso660066b6e.1
        for <linux-mediatek@lists.infradead.org>; Sat, 12 Sep 2026 11:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789237970; x=1789842770; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pyGOuWl1kIoFr1BB5GPKM41t/39zE+ryKhiJyT6xB7s=;
        b=IJla7Edy4vsICsG7RsUVgAdnkqVDHz+jVGm0ahMPdx8novmxAhsIKl4YwgAdbj+cVY
         GYJuWCcn9Cl+4vmAP75+JfsaAGyB64jUVWncKB+1GEBvEjdJ0ybcVEfx50ww6Y1kadwK
         Rr/S+CNEuDKVKEnNrLIntBEFNIfueDTeGXZnM+X5oESLsLpG48HlwKejx8uba/+g1EOt
         wH0f3HKPBhzSzOBshi8jM3wamcOdtjaun+BwvJoDs+fO21Oi3PUxtujCWl/n66jpmMK/
         VtieLkYslicn3EZlaLFHqZTT3qiXCEEbFsmPd/5ekMkddidFfhWyc5OAjEDijOCD/5K0
         kElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789237970; x=1789842770;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pyGOuWl1kIoFr1BB5GPKM41t/39zE+ryKhiJyT6xB7s=;
        b=qnZxc7nVWWgC2YZ98yYl97cbiHVKbuASOYx8miGj1o990qib7yOSJJIC52u7JF9g06
         kCcJBqrCd5SmQWY5bkNf3r/DH5SUiMSib8O26YXdx0HcCPe4X6N2SP851YMP9Rp9Cm0R
         WXQlpCQ1Gi7D4lwx838J8vuY4KoFjW9MdExirpAKNVrYq+WoiIAvewscBpWFxLOyZIbb
         QTgLcAYdzAfSAXgy3+o1pLsO4XuLnTXalj7w0tSTwm5KoH4cRI5UKlupLiGLsclKzeeq
         wnHzGINN3ABtMdrQ5D9fqfSuq8nMBXYjCbv/tzBmTvIQ/3xB1eE988chUdVLIrs10yYs
         P+sA==
X-Forwarded-Encrypted: i=1; AKwUvBxZP5VW6h0lKDZ/BCDZ0fUtBGZEnlTQP7xu6ONFwFYiJyl7urzumiui1KUs19l/6mV8gRwgF9kzIlJ+gud5ew==@lists.infradead.org
X-Gm-Message-State: AFuF++laXg3vrWpGcCkXVfad2JG296m0DwO4CIiDPjMMN84LyRMHkX/O
	4TlOFQ7czgVd6pD0SpftbGPnz51yJUFEPlc5oJ5+S4T44hLr2qUtV8SW
X-Gm-Gg: AYBFou3L5shTvtP+afWk/kl+gKZP3mRSzqL6o7DccQURYXjziEgWmPmxKJZmWkThmWK
	ZUcTASlDYqujD/ZGiAbl/tLyGM5YX8yrKVvZwJfQNrF1sDwqQEj1O7t/KjzIbsa8qC924wYzskf
	MiWWW34M2mbyGYJeXak3aTEt8Y210OCdNiNqGOfmZHtssZWxPUVWn5P2WZFt4Ep/4rBPFlu2GCB
	7g4RWQ1MABPnJN3AsdRtDE9PP2SBje+0J8wSFIdOEKuPR2NVtdJVIKUlbSRv8y10Ow9cTrpPbdL
	SzcAiG9Q/snubUV42DcPzQVJmbMdjICjN6pFR2aZtst9hy5JIX4Pwj9n/CFREO2sQCNSXw3gAcu
	CJwGWS0RCkMVHKa7MrzQtHH7Xo+FpgB+U8XLSWjrK/f1PCpTBxSDTfs/sMKaI84YJkzSgeUcaCw
	NYFVmkCd7Nckq8tsolt8YOBZz+UaI0JhFm40/ihkmR77M2HEA8zXLzak8TQhI12i7KUIg=
X-Received: by 2002:a05:6808:309a:b0:4b2:8dbf:771 with SMTP id 5614622812f47-4c31d65af5dmr8802662b6e.10.1789237969836;
        Sat, 12 Sep 2026 11:32:49 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4c330dac382sm5738229b6e.6.2026.09.12.11.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 11:32:48 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sat, 12 Sep 2026 13:32:40 -0500
Subject: [PATCH] clk: mediatek: mt8173-mfgtop: do not use the clk API from
 power_on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-mfgtop-no-clk-api-power-on-v1-1-def157ad1277@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSw6CMBAA0KuQWTtJacVEr2JcDHWA8dNpWhQSw
 t2tsHybt0DmJJzhUi2Q+CtZNBTUhwr8QKFnlHsxWGNP5lxbfHf9qBGDon89kaJg1IkTakBq2JC
 jo2udgxLExJ3MW3697c6f9sF+/I+wrj8G4Qv0fgAAAA==
X-Change-ID: 20260912-mfgtop-no-clk-api-power-on-a5e0a3a43b33
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789237967; l=5480;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=kjP5JtckQ81EhZbmB1tB2Jw41rIoGsoQz3j/P8a8WNk=;
 b=EoNfJiuU+dJD/9bK48PUcfIjZmE6xoozgkowDFLKya8/Wm+3V8PyJc4FDLJqz1oB/jWF+Fvz8
 IZaSWfrqN5JBsqIIcVKZ1a3Zk5bsc9O+BY6mG9nN0OjhT8aFCanUqgp
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_113251_232358_584E7E8C 
X-CRM114-Status: GOOD (  19.81  )
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

Fixes: ebd0b73d2137 ("clk: mediatek: Add mt8173-mfgtop driver")
Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/clk/mediatek/clk-mt8173-mfgtop.c | 39 +++++++++++++++++---------------
 1 file changed, 21 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8173-mfgtop.c b/drivers/clk/mediatek/clk-mt8173-mfgtop.c
index 5669ca9954dc..fed6fa6100dc 100644
--- a/drivers/clk/mediatek/clk-mt8173-mfgtop.c
+++ b/drivers/clk/mediatek/clk-mt8173-mfgtop.c
@@ -30,6 +30,12 @@ static const struct mtk_gate_regs mfg_cg_regs = {
 	.set_ofs = 0x0004,
 };
 
+/*
+ * The 26 MHz gate, addressed directly rather than through the clk framework.
+ * See the comment in clk_mt8173_mfgtop_power_on().
+ */
+#define MFG_CG_26M	BIT(3)
+
 #define GATE_MFG(_id, _name, _parent, _shift, _flags)	\
 	GATE_MTK_FLAGS(_id, _name, _parent, &mfg_cg_regs, _shift, &mtk_clk_gate_ops_setclr, _flags)
 
@@ -46,7 +52,6 @@ struct mt8173_mfgtop_data {
 	struct regmap *regmap;
 	struct generic_pm_domain genpd;
 	struct of_phandle_args parent_pd, child_pd;
-	struct clk *clk_26m;
 };
 
 /* Delay count in clock cycles */
@@ -66,12 +71,16 @@ struct mt8173_mfgtop_data {
 static int clk_mt8173_mfgtop_power_on(struct generic_pm_domain *domain)
 {
 	struct mt8173_mfgtop_data *data = container_of(domain, struct mt8173_mfgtop_data, genpd);
-	int ret;
 
-	/* drives internal power management */
-	ret = clk_prepare_enable(data->clk_26m);
-	if (ret)
-		return ret;
+	/*
+	 * Ungate the 26 MHz clock, which drives the block's internal power
+	 * management. This is a raw write to the gate's CG register, not
+	 * clk_prepare_enable() on the mfg_26m gate this driver provides: that
+	 * would call clk_pm_runtime_get() on our own device, and genpd power
+	 * transitions run at _noirq time, where runtime PM is disabled and
+	 * that returns -EACCES. mfg_26m stays registered for any consumer.
+	 */
+	regmap_write(data->regmap, mfg_cg_regs.clr_ofs, MFG_CG_26M);
 
 	/* Power on/off delays for various signals */
 	regmap_write(data->regmap, MFG_ACTIVE_POWER_CON0,
@@ -102,8 +111,11 @@ static int clk_mt8173_mfgtop_power_off(struct generic_pm_domain *domain)
 	/* Magic numbers related to core switch sequence and delays */
 	regmap_write(data->regmap, 0xec, 0);
 
-	/* drives internal power management */
-	clk_disable_unprepare(data->clk_26m);
+	/*
+	 * Gate the 26 MHz clock again; see power_on() for why this is a raw
+	 * register write and not clk_disable_unprepare().
+	 */
+	regmap_write(data->regmap, mfg_cg_regs.set_ofs, MFG_CG_26M);
 
 	return 0;
 }
@@ -155,16 +167,10 @@ static int clk_mt8173_mfgtop_probe(struct platform_device *pdev)
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
@@ -197,8 +203,6 @@ static int clk_mt8173_mfgtop_probe(struct platform_device *pdev)
 	pm_genpd_remove(&data->genpd);
 del_clk_provider:
 	of_clk_del_provider(node);
-put_26m_clk:
-	clk_put(data->clk_26m);
 unregister_clks:
 	mtk_clk_unregister_gates(mfg_clks, ARRAY_SIZE(mfg_clks), data->clk_data);
 put_pm_runtime:
@@ -217,7 +221,6 @@ static void clk_mt8173_mfgtop_remove(struct platform_device *pdev)
 	of_genpd_del_provider(node);
 	pm_genpd_remove(&data->genpd);
 	of_clk_del_provider(node);
-	clk_put(data->clk_26m);
 	mtk_clk_unregister_gates(mfg_clks, ARRAY_SIZE(mfg_clks), data->clk_data);
 	of_node_put(data->parent_pd.np);
 }

---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260912-mfgtop-no-clk-api-power-on-a5e0a3a43b33

Best regards,
--  
Ryan Brue <ryanbrue.dev@gmail.com>


