Return-Path: <SRS0=uRRy=DF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F23E9C2D0A8
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2020 03:31:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68C8F239A1
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2020 03:31:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zNL9St4A";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TPnACvqk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68C8F239A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oq+RC9t6aKhLglAvsUx6EBc4Fv5mkinvTqVbfw6UKRE=; b=zNL9St4A118lg9rnRkXffniwyc
	mzRFsTT8im0CqdyQ5lQe2EXgNaifZoDr/hmXHcbgQjyGBVAhoUropl+NERmSZuPe5kWCW94tKWjOP
	GLNN7IWUcstyCwLz2/ezg0CNlE1CsOdae80KI/Rr9Bg55Z+3XWWYCS+15UeeoAkOyfnwjrTY7XNj3
	udrrrRAwU87qW718i4WQLHGSkHjGmJDaH1oRMyTwIxSh5xswM3lObACWdOHKhsmLECz/H1/hmLb/b
	57LNldK0w9qrBn2pq7o+g8J3Gtz+WkT61PRlSoW8K6hRh+TzoXYuZtxXhiNqRsp8J30bLi8MmAgkc
	4hT2R9HA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMjtC-0005x3-WF; Mon, 28 Sep 2020 03:31:47 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMjtB-0005wN-B8
 for linux-mediatek@lists.infradead.org; Mon, 28 Sep 2020 03:31:46 +0000
Received: by mail-pg1-x541.google.com with SMTP id d13so7083084pgl.6
 for <linux-mediatek@lists.infradead.org>; Sun, 27 Sep 2020 20:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N/EpoZQfstu+PtLpJpKosc5sDI8cNsjHAqKjuh09dpU=;
 b=TPnACvqkAuZKzWjdeh9nwNFuQlDeml7iNwfm7yiuUMD+fLPKDKiPV0d3OUxkF/4nwv
 YOJkoUckvY6C5DCSyiXEGg3vqREv67TrjRFIQE1BZBezidWKQ63ALmygtJhiX5bbMOeX
 IUrlHOhAv38J+fNOK5OpVSZth44dtAChBiCSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N/EpoZQfstu+PtLpJpKosc5sDI8cNsjHAqKjuh09dpU=;
 b=U0cHk0IpXdMyN/omZACD4okR3ltIsytpy/TyxY3CS0QFreTegl2OVkBiFnom07Cdnu
 2JFtSpFQGP1VDlfhBT7ae5D9uu/HGvD5W4dlHeZplREpIQ2CP4UhNlXepCdKibQWZ2sZ
 L8KnjODhLNQGL1UKnnc1B4W3cwrjyOk7ktinI6Bz4GrbqPiUa7mby5SHGfgCJM2DcjCu
 ZCo8RMNwpnPlqtmCliC3f4t8u/ht4pBCMmSoAXTngI9xOs01zo+ej8BG4wFU8bLVl/HJ
 9FE895FwuPT7yOkbCq0Cpgya2UrUztCumK63tGIDv0tCkcs/AhkeLSDEtTFzTSnfVaZn
 XonA==
X-Gm-Message-State: AOAM5320A6Lds5W8LRbJVjhFfBPk/v4S29+TCLoMcbTVzQR3bpnER+yq
 wwAyxmW+gMwI1jnz4OkIYxP7Mg==
X-Google-Smtp-Source: ABdhPJzTJGzCeQ9lvnJeSH23CAuBjJ+xu7mtkCHRt4CPpwRzS5FlrwfY9s2qHfFca9qJY+TDrd/WXA==
X-Received: by 2002:aa7:8249:0:b029:142:2501:34db with SMTP id
 e9-20020aa782490000b0290142250134dbmr9395510pfn.52.1601263900127; 
 Sun, 27 Sep 2020 20:31:40 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:7220:84ff:fe09:41dc])
 by smtp.gmail.com with ESMTPSA id z8sm8201440pgr.70.2020.09.27.20.31.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2020 20:31:39 -0700 (PDT)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2] soc: mediatek: Check if power domains can be powered on at
 boot time
Date: Mon, 28 Sep 2020 11:31:35 +0800
Message-Id: <20200928113107.v2.1.I5e6f8c262031d0451fe7241b744f4f3111c1ce71@changeid>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200927_233145_466292_DA8609D3 
X-CRM114-Status: GOOD (  14.59  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In the error case, where a power domain cannot be powered on
successfully at boot time (in mtk_register_power_domains),
pm_genpd_init would still be called with is_off=false, and the
system would later try to disable the power domain again, triggering
warnings as disabled clocks are disabled again (and other potential
issues).

Also print a warning splat in that case, as this should never
happen.

Fixes: c84e358718a66f7 ("soc: Mediatek: Add SCPSYS power domain driver")
Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
---

Changes in v2:
 - Add WARN_ON if the domain can't be powered on, to make it more
   obvious that this should not happen (there is already an error
   message).

 drivers/soc/mediatek/mtk-scpsys.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index f669d3754627..ca75b14931ec 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -524,6 +524,7 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 	for (i = 0; i < num; i++) {
 		struct scp_domain *scpd = &scp->domains[i];
 		struct generic_pm_domain *genpd = &scpd->genpd;
+		bool on;
 
 		/*
 		 * Initially turn on all domains to make the domains usable
@@ -531,9 +532,9 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 		 * software.  The unused domains will be switched off during
 		 * late_init time.
 		 */
-		genpd->power_on(genpd);
+		on = !WARN_ON(genpd->power_on(genpd) < 0);
 
-		pm_genpd_init(genpd, NULL, false);
+		pm_genpd_init(genpd, NULL, !on);
 	}
 
 	/*
-- 
2.28.0.681.g6f77f65b4e-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
