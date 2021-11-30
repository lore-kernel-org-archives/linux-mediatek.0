Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85498C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Nov 2021 17:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tFJizT2zyjn3e3eUPrGyQztnOFfUb7G4SvAP60/7q90=; b=z+1Ekj+7gTvCiE
	KeSUTrMB6dwnGp7ptnHUo+2iBFhITKET47vMRizKo9qGr2S20gFwTlSJ9JbGvJaK6+LPVNJAMxzC6
	K/GUCZGeg8+Xu3CE7qJ8aavy0W7V2hDJ4vFgAOJzBHOWhsghtpkgw3Rt2gMX3HhxQt+zXY5FWqX0n
	cBC9GgdwQt82Y2SyJ/wO0/qNXl2BgVuO9mZ1FPhbtsFgk2cqIz77F7e6Yo2olj+a3rmIqp3hji4hZ
	e4CVnwYAaWZhAZaOPS9xQiEBf8sCc6olpJKMiihJAWOSMmhcSvf6vlydQvsVvPCSkXhAw/wV8aqES
	LuzpJAik6cREtWuQ1bhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms7P5-006PZC-7k; Tue, 30 Nov 2021 17:58:55 +0000
Received: from mta-p7.oit.umn.edu ([134.84.196.207])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms7Os-006PWf-C4
 for linux-mediatek@lists.infradead.org; Tue, 30 Nov 2021 17:58:43 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-p7.oit.umn.edu (Postfix) with ESMTP id 4J3VMP5GzTz9vZ8J
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 17:58:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CamAT89P0sjg for <linux-mediatek@lists.infradead.org>;
 Tue, 30 Nov 2021 11:58:41 -0600 (CST)
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 4J3VMP3D3sz9vZ8G
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 11:58:41 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p7.oit.umn.edu 4J3VMP3D3sz9vZ8G
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 4J3VMP3D3sz9vZ8G
Received: by mail-pf1-f199.google.com with SMTP id
 m16-20020a628c10000000b004a282d715b2so13280089pfd.11
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 09:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2o1Btyvcr9zNiibD2X2zdtUwgMaC6zMAeCNuQYINlXc=;
 b=exUErgMJm46Up/Woex05GuY1DcDnk4KuYPQD8B43uD+enDb6f1ESNL3mYGbZJNW4QY
 F0tb0N2dKU7F5pCdCw6+2+PHxcVGth1zhB9V7wMZdwebhBW8ln88Vw/DmV1VQiTOa59R
 kytHEADQLTGjf2x+E2T1fQyh9v3Is5WOBkVAunq/xT8VBgHq/41Lr7b7L1S1v/060oBK
 YXC2/TuHvhb7ajz/0tFhSKQO66gO1tKvWgUjwayFTSCDZ3BXYgKsqHnlOcg4oScXf9iS
 7BvdUL13I2uoSks0PfhtsaGoHnBwNVtB8ALc+kDlSM4neSe4J65WFfEK6kiHzMY6ybcJ
 aLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2o1Btyvcr9zNiibD2X2zdtUwgMaC6zMAeCNuQYINlXc=;
 b=dLuYTwHz/mu5UbxEL2JhNfNM/OSxpgu0ua9n6b7MHupYU4CWJWwLrs5lri3Vw4ob2v
 qoVjJQ2RUvLdgP4aI4lnHY9ckPl6OaE7H9MmOfdUbpCYtdJZ+fzfk/cf69rQ1AX+Z3UV
 yab6D+VpMdGAmSMAe9NRe8rV55XR5FelaSVftQ692Vc1Dv2FRJMo8sckIf0V+qQqnq74
 wgmMvQW7CKC772UVB4rPejztwvQcwdA7LfmD7w92wn98NWArJNX4784VC19r4m5zmshs
 HH30blQTpBdtrZJGX9sKxglC5AjYqgEu5oPFY/jcihpkBigeO+C98KNhx/qct0nzt1j8
 cM0w==
X-Gm-Message-State: AOAM530c+RP3MVFCbvLELrPvVWGmvvV0IfQW+Lf/kooIDGwtU9rJLP1I
 8R+1FaOS3lHkaxZM0YSrtvLTeVNgcUxTnfFnNR/b0vPFHVXo3zwEEJImPIm02Odqv4GAS/UfpVA
 qBHhs74FuAN4m8P/ClHu0YNKMHQlolBNb/mfZ
X-Received: by 2002:a63:9c02:: with SMTP id f2mr515012pge.343.1638295120733;
 Tue, 30 Nov 2021 09:58:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwgdIi4Z2ChYgEmtBuWk0KmMH/i4xL7D33ceP18LJD2zEwtDYMN3TYLP524WAMTgQe4/ok+Yw==
X-Received: by 2002:a63:9c02:: with SMTP id f2mr514986pge.343.1638295120504;
 Tue, 30 Nov 2021 09:58:40 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
 by smtp.gmail.com with ESMTPSA id v10sm22386110pfg.162.2021.11.30.09.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 09:58:40 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Cc: kjlu@umn.edu, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Chen Zhong <chen.zhong@mediatek.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: mt7622: Fix a NULL pointer dereference in
 mtk_pericfg_init()
Date: Wed,  1 Dec 2021 01:58:02 +0800
Message-Id: <20211130175803.215588-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_095842_524231_98B98D4C 
X-CRM114-Status: GOOD (  16.47  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In mtk_pericfg_init(), mtk_alloc_clk_data() is assigned to clk_data
and used in clk_prepare_enable(). There is dereference of clk_data
in clk_prepare_enable(), which could lead to a NULL pointer dereference
on failure of mtk_alloc_clk_data().

Fix this bug by adding a check of clk_data.

Another way to fix this bug is to add a check of clk_data in
clk_prepare_enable(), which may solve many similar bugs but could
cause potential problems to previously correct cases as the API is changed.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_COMMON_CLK_MT7622=y show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: 2fc0a509e4ee ("clk: mediatek: add clock support for MT7622 SoC")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/clk/mediatek/clk-mt7622.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt7622.c b/drivers/clk/mediatek/clk-mt7622.c
index 3a389fa915c1..e89acef5768f 100644
--- a/drivers/clk/mediatek/clk-mt7622.c
+++ b/drivers/clk/mediatek/clk-mt7622.c
@@ -702,6 +702,8 @@ static int mtk_pericfg_init(struct platform_device *pdev)
 		return PTR_ERR(base);
 
 	clk_data = mtk_alloc_clk_data(CLK_PERI_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
 
 	mtk_clk_register_gates(node, peri_clks, ARRAY_SIZE(peri_clks),
 			       clk_data);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
