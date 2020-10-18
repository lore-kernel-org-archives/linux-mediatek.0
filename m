Return-Path: <SRS0=ckIt=DZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D265C433DF
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2020 19:30:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5787B20791
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2020 19:30:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pzPvO4EE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="NO4BBseF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5787B20791
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RJk4+pamov3lZC6j7fDbs/OpjnTYyHEOaDCxNxOTBqg=; b=pzPvO4EErqxTBolD2fY6BGR7ZD
	tMJIrL4OFlQgt6KRj3ImqIwOMBnHn+W6qd0opKw7xM/vt/eDge7yFFHUn8ZiLG/5GfKsLGOnh8/Cf
	NNF5sNnvlGTHMVH0HVp4aXiBSba0Fz2hq8oCoVOhq4/dX0cL33Y3CL8NhC4KWYmEH7sZH5zvJ1Tis
	fBXLr4dM/SfA5Br9XqWIIb4bZJBoUxzAppScN4nLK3MZLIY02t8rq2Y8//UL+CQAbjhAF1+PKAYBw
	lpm3I4kfNgn0uvp83VtqMC1+tajM6jnmhWU+OMP7vKlboTCr40pt5F81lnjpRVZ5TdJZCZQ2acuoc
	MPFXuVIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUEO7-00044n-9K; Sun, 18 Oct 2020 19:30:39 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUENq-0003vq-3I
 for linux-mediatek@lists.infradead.org; Sun, 18 Oct 2020 19:30:26 +0000
Received: by mail-wr1-x443.google.com with SMTP id t9so9000852wrq.11
 for <linux-mediatek@lists.infradead.org>; Sun, 18 Oct 2020 12:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OiO/CbYiErh+VMCoZF8e42eNV4rVIWemGcIMMY1+JXo=;
 b=NO4BBseFZMaLr8Ping9guGMNWZ1CDpYUAPxPRADAuwkhBTiCKXXny83bHqMUO4pWHp
 Cb7yex3BZ8LvGX/cOXX101giFa0IVT/1ZaVCjJelWjS/u1jDcxX96OZwmUfGTuj4feQ+
 eIRwxPqkGXyVHPScYlmqJYOGX8lkUD9NKIqKqnykzjy7guTsquwJgQqOE5GLVAXwjhnd
 aJazSik69uPmb5OZk2jvnmiJTVCB7PYCvUsUeXtaRSuG+H0ZHW7pEZKnKkLvIu4/fiWr
 QZc18ABP001JKDv1CDH5APJsH4sCP2NIkr38QBNYXXwQRpRgzocDlC3nwAgTliYvDrjy
 911A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OiO/CbYiErh+VMCoZF8e42eNV4rVIWemGcIMMY1+JXo=;
 b=mlDc3O6Wxu9Lc0ZuuWhN2LnjeYeMhSHujwKLf+m4Sc+OAdmUhTiw50oc17eqDmlEwg
 7pW2Dfc0dF/yIyBNYyXMgcuVyfHJ2H+02cXLKAfi6Pn8vtcU2uE8r8fA3gGUIWZD/HJL
 K4oRb7CSVRTXU05lJ9SqmEhJ516aOJgW/OG2g3JJ9n2IreffM5qOcIpFisrCC2mkY1S+
 ZIEmwnXkMtv1GZmhw4T8jurXYmdwfxGTlV8aRVnqBHefLSyphjtq2bfVtTbMnB8hXauM
 gxmId1itxViEfxclt70+okslzqqz+tWgmUa1WRTOX8PmweB40KbQ4BIDPgOSruvbvgkv
 eCuw==
X-Gm-Message-State: AOAM532+0ommIhA/nW3ViOcUOx1ZzWDJZtbC9UvBs6p2TAQDsZkxT8Rs
 U1Mq5k4s5Gaas5UTBcO212DuDQ==
X-Google-Smtp-Source: ABdhPJxjk2lJO5ut9RfrL95tkil3NUyCvwqdq6rPg6tJq6126c2Etcp0yxa8XlIz5XjHq8J8lTbXqQ==
X-Received: by 2002:adf:e589:: with SMTP id l9mr15846465wrm.110.1603049419718; 
 Sun, 18 Oct 2020 12:30:19 -0700 (PDT)
Received: from localhost.localdomain (124.171.185.81.rev.sfr.net.
 [81.185.171.124])
 by smtp.gmail.com with ESMTPSA id v8sm13571628wmb.20.2020.10.18.12.30.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2020 12:30:19 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: mailbox: mtk-gce: fix incorrect mbox-cells value
Date: Sun, 18 Oct 2020 21:30:16 +0200
Message-Id: <20201018193016.3339045-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201018_153022_515919_218A6059 
X-CRM114-Status: GOOD (  12.21  )
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
Cc: Fabien Parent <fparent@baylibre.com>, dennis-yc.hsieh@mediatek.com,
 matthias.bgg@gmail.com, bibby.hsieh@mediatek.com, ck.hu@mediatek.com,
 jaswinder.singh@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

As the binding documentation says, #mbox-cells must have a value of 2,
but the example use a value 3. The MT8173 device tree correctly use
mbox-cells = <2>. This commit fixes the example.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/mailbox/mtk-gce.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
index cf48cd806e00..7771ecaac586 100644
--- a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
+++ b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
@@ -47,7 +47,7 @@ Example:
 		interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_LOW>;
 		clocks = <&infracfg CLK_INFRA_GCE>;
 		clock-names = "gce";
-		#mbox-cells = <3>;
+		#mbox-cells = <2>;
 	};
 
 Example for a client device:
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
