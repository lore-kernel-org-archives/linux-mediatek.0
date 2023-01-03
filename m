Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6C1C4708E
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 09:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AaEgQoi2wV88iETdzvSp20U7Cda3EBi9Iq1BYplBC3U=; b=qdy622g3CQw+wUzTV89jPxeJbD
	ILHa9bnJTt1IeHpQ6tb9LpTNVxPdJ5kH9Vop1ydyZsOViPb3OVt4CGh7xuKUXRc3U+Qhw0OFy912V
	qoDkeD0/DjjJenJfRubw0oshwKK2Ong85EruGTMK9ixWvQOmLXxk6BTVu1TK8xt/o31r6i9iZNbEg
	DVA8EgWPa3IP2fReHyos5GevTKGpF6QNuw0gBX4afgMl6eF4EW/oMsWG1FPkRAUotA1EsEDn8XBKH
	eipOo38CY4XhnTjOlsk4Ug9Zv8aFoNoY9IVqY26Mv2eOB4UKwV9jUXdfN2306Q+2jA+wJnoGcTKhF
	le+02GTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCdq1-000Vcx-8m; Tue, 03 Jan 2023 09:44:05 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCdWI-000Rl2-5h
	for linux-mediatek@lists.infradead.org; Tue, 03 Jan 2023 09:23:47 +0000
Received: by mail-pl1-x62b.google.com with SMTP id m4so32015800pls.4
        for <linux-mediatek@lists.infradead.org>; Tue, 03 Jan 2023 01:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AaEgQoi2wV88iETdzvSp20U7Cda3EBi9Iq1BYplBC3U=;
        b=fRKiuLLPQXtm+PoLAnEO0C/uRszb5OZg3YHcvW2RCgSXdgYSqmUNIVOR6Yw5IkkkHr
         +QjxZ3RVzCBOcOirYxxHt0r1WoqCp6tPnX+mb/UoZ6kAIx7Lm+E/ou+rSr9EZ2qoQeD6
         bIpAN5WyNbnUdEwIzQE/O3pT9ZYGzuzsfHPQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AaEgQoi2wV88iETdzvSp20U7Cda3EBi9Iq1BYplBC3U=;
        b=EPbyWASiyEEE70q5wxX6RmsfLiTkpDpZutt/tsIOF32Fp7+MTcn4PI6AVLlNmCSYfu
         FD9YfpG3O/uX7HPm1dWa4uWYbWY/Qel67JKuCtQa9qaFLBpBKVoGnA/aVCZ6zqyBmXwi
         GVNM1kEmBve5ZeGoXTZTD/aIayPyu6twp92J8E8iYi2XiHjZ0C6eUiX+ymwdQ8KF0KcH
         Dmi+zJ66WWSCXx44Cx8Xeqptl42MkdVQXSk7b8Bb18kooqKM14RZ0dj18RjKSgLXPZry
         T2jLezO3EUfHgtTPONflLDEFxoXrmIr8M5TW9E9vphISNhvwUvHn3fuDO/6dls9/uNMt
         zdOg==
X-Gm-Message-State: AFqh2kq6hsdkhkt4SPZAGUDPCo++08bOwm4nVqq+wp/6Iaj1ah6qw+li
	j5K+TO6g4Cp854uS508a0dl5ww==
X-Google-Smtp-Source: AMrXdXscvLpHbGWlFWU5ZkobIrKEQnk7OF5Eruk64rC/Zl69xEwyZqBgAT2SpMsWhcqVpsg57yVxIg==
X-Received: by 2002:a17:902:f112:b0:189:9ee0:cc8e with SMTP id e18-20020a170902f11200b001899ee0cc8emr40941085plb.57.1672737815982;
        Tue, 03 Jan 2023 01:23:35 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:96d9:31a:590:4d72])
        by smtp.gmail.com with ESMTPSA id y126-20020a636484000000b0049f5da82b12sm6868632pgb.93.2023.01.03.01.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 01:23:35 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] clk: core: Honor CLK_OPS_PARENT_ENABLE in clk_core_is_enabled
Date: Tue,  3 Jan 2023 17:23:30 +0800
Message-Id: <20230103092330.494102-1-wenst@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_012342_258986_225B1767 
X-CRM114-Status: GOOD (  19.28  )
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

In the previous commits that added CLK_OPS_PARENT_ENABLE, support for
this flag was only added to rate change operations (rate setting and
reparent) and disabling unused subtree. It was not added to the
clock gate related operations. Any hardware driver that needs it for
these operations will either see bogus results, or worse, hang.

This has been seen on MT8192 and MT8195, where the imp_ii2_* clk
drivers set this, but dumping debugfs clk_summary would cause it
to hang.

Prepare parent on prepare and enable parent on enable dependencies are
already handled automatically by the core as part of its sequencing.
Whether the case for "enable parent on prepare" should be supported by
this flag or not is not clear, and thus ignored for now.

This change solely fixes the handling of clk_core_is_enabled, i.e.
enabling the parent clock when reading the hardware state. Unfortunately
clk_core_is_enabled is called in a variety of places, sometimes with
the enable clock already held. To avoid deadlocking, the core will
ignore readouts and just return false if CLK_OPS_PARENT_ENABLE is set
but the parent isn't currently enabled.

Fixes: fc8726a2c021 ("clk: core: support clocks which requires parents enable (part 2)")
Fixes: a4b3518d146f ("clk: core: support clocks which requires parents enable (part 1)")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
This is a less invasive version of "clk: core: Honor CLK_OPS_PARENT_ENABLE
for clk gate ops" [1] which caused regressions on i.MX platforms.

My guess is that the i.MX clock driver uses clk_hw_is_enabled() in it's
set_rate callback, in which the new code causes a deadlock.

v3 drops the enable parent on prepare/unprepare bits, as it's unclear
who benefits from it, and the locking is hard to get right. The part in
clk_core_is_enabled() is changed into a bypass path, as described in the
commit message. This fixes the issue I'm seeing, and hopefully doesn't
change the behavior on other platforms.

[1] https://lore.kernel.org/linux-clk/20220822081424.1310926-2-wenst@chromium.org/

 drivers/clk/clk.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index e62552a75f08..496b86e2753c 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -244,6 +244,17 @@ static bool clk_core_is_enabled(struct clk_core *core)
 		}
 	}
 
+	/*
+	 * This could be called with the enable lock held, or from atomic
+	 * context. If the parent isn't enabled already, we can't do
+	 * anything here. We can also assume this clock isn't enabled.
+	 */
+	if ((core->flags & CLK_OPS_PARENT_ENABLE) && core->parent)
+		if (!clk_core_is_enabled(core->parent)) {
+			ret = false;
+			goto done;
+		}
+
 	ret = core->ops->is_enabled(core->hw);
 done:
 	if (core->rpm_enabled)
-- 
2.39.0.314.g84b9a713c41-goog


