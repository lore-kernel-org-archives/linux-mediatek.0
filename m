Return-Path: <SRS0=auVy=K3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 741FFC47080
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Jun 2021 03:59:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E8C16127C
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Jun 2021 03:59:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E8C16127C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5rgT12uP23ZwaSJCFadUhv/Vu1jaS08G2Smm4CYnk0I=; b=hOErrnSkXX6CMH
	BE0Xdf+Y3X69dFgM+gLCC4niQRwlJbNEQafmStRO8XzGLSoSZ5vJquRBzslugxe0kL4tjCUD22Npj
	oV4ESQ+N63b5g2kSz/Px1gFbpNGFrhGO2jq9+bODmCFWB5L0Zb4ElNf7uZoyHKvlx8fDkvpDpeisY
	kS6Itzxn/QO0IVpd4HuwAgKmeIMQn8Knt5BAcjj1BNqJwZtKZjgLw+s38vKTBNslhT4cmV89GPwBh
	/QhqFAKqNcio2ryl+ihiHxDxNWaRDPyX9mPKeRWtiN1H5D89a0xoGUWys22TyJnDsB5W114+Fqgmb
	hElw97hX77qM9UMNgKUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnvYt-00ESYY-05; Tue, 01 Jun 2021 03:59:27 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnvYo-00ESX9-Nu
 for linux-mediatek@lists.infradead.org; Tue, 01 Jun 2021 03:59:24 +0000
Received: by mail-pl1-x629.google.com with SMTP id h12so6149613plf.11
 for <linux-mediatek@lists.infradead.org>; Mon, 31 May 2021 20:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UB61Gzn/MRwmod4oJCljeygOUa03KL82epqgxkhg2kk=;
 b=H4cPMG+N+viqUaTM+Qp5Ik0G0yuzXdhgb8vf+8ySTT1fiEy+L0O4tCybFkjAt1C0as
 3p2tGK3Qbmf+oanC78Ooe7YsL3nsu59z1snFEkgVy4iEzLsPbNBNg1pqvk2zZYkWT3Q/
 +bBHkWZDzeKjlgvslHU0KBs7V51Gph8ngIDZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UB61Gzn/MRwmod4oJCljeygOUa03KL82epqgxkhg2kk=;
 b=I4luWN4gAWwQxR3Z7+VgTd6jW9i0sk8jBSOUGSiSdXKHfgZcpuNMGHHy7ZKs+/bbGh
 2VSUcUGYvHFPL1O7+jIr5ZhofgE1BMkJIBkTl1FAR0+nPOf9c3mqPapnIgiEkoMSu51P
 a1+Eqcrwj5jD/LXwj4d+34KU9dPyNENZXc727LooAf/9QkVj7uCChzO7N/WooObtZvJl
 7mZaOAxgyA7YfrvQqvlYX0pPD5Qm5ISVqBL1BvQYyfYCU04ZGuAeHyWsxOyabK+ye5f2
 wBJNtJipM4MXORTcfFnLGrzntFqD93X4Kjz8P2Y8pvpIpnYg3YAzMnkJ28RWSISMZnr1
 6vhw==
X-Gm-Message-State: AOAM530Mq7WIalw/dZqjJwUy5kBDExvbWb8FSTuZqyTwFrBQ+XAupWBn
 FPu//Wc05nrlrU/sGRdis2AQMuiOcSnxXw==
X-Google-Smtp-Source: ABdhPJwOeJ2sbNS0QZkH6Mt8lSTze0NTU7Hsqwrxy08Rr31iBqCYesAg4OhMUcsdKDFei8oXIvVr/A==
X-Received: by 2002:aa7:8119:0:b029:2b5:7e51:274b with SMTP id
 b25-20020aa781190000b02902b57e51274bmr19960434pfi.32.1622519951510; 
 Mon, 31 May 2021 20:59:11 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:5f83:3563:b780:4d82])
 by smtp.gmail.com with ESMTPSA id 203sm2779735pfw.124.2021.05.31.20.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 May 2021 20:59:11 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 chun-jie.chen@mediatek.corp-partner.google.com,
 Yong Wu <yong.wu@mediatek.com>
Subject: [PATCH v2 2/3] soc: mtk-pm-domains: do not register smi node as syscon
Date: Tue,  1 Jun 2021 11:59:04 +0800
Message-Id: <20210601035905.2970384-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.rc0.204.g9fa02ecfa5-goog
In-Reply-To: <20210601035905.2970384-1-hsinyi@chromium.org>
References: <20210601035905.2970384-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_205922_803701_FFF9242C 
X-CRM114-Status: GOOD (  14.18  )
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

Mediatek requires mmsys clocks to be unprepared during suspend,
otherwise system has chances to hang.

syscon_regmap_lookup_by_phandle_optional() will attach and prepare the
first clock in smi node, leading to additional prepare to the clock
which is not balanced with the prepare/unprepare pair in resume/suspend
callbacks.

If a power domain node requests an smi node and the smi node's first
clock is an mmsys clock, it will results in an unstable suspend resume.

Fixes: f414854c8843 ("soc: mediatek: pm-domains: Add SMI block as bus protection block")
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: chun-jie.chen <chun-jie.chen@mediatek.com>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 drivers/soc/mediatek/mtk-pm-domains.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index 536d8c64b2b4..b762bc40f56b 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -297,6 +297,7 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 	const struct scpsys_domain_data *domain_data;
 	struct scpsys_domain *pd;
 	struct device_node *root_node = scpsys->dev->of_node;
+	struct device_node *smi_node;
 	struct property *prop;
 	const char *clk_name;
 	int i, ret, num_clks;
@@ -352,9 +353,13 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 	if (IS_ERR(pd->infracfg))
 		return ERR_CAST(pd->infracfg);
 
-	pd->smi = syscon_regmap_lookup_by_phandle_optional(node, "mediatek,smi");
-	if (IS_ERR(pd->smi))
-		return ERR_CAST(pd->smi);
+	smi_node = of_parse_phandle(node, "mediatek,smi", 0);
+	if (smi_node) {
+		pd->smi = device_node_to_regmap(smi_node);
+		of_node_put(smi_node);
+		if (IS_ERR(pd->smi))
+			return ERR_CAST(pd->smi);
+	}
 
 	num_clks = of_clk_get_parent_count(node);
 	if (num_clks > 0) {
-- 
2.32.0.rc0.204.g9fa02ecfa5-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
