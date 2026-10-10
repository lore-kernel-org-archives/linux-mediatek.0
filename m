Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B90CA9EC1
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Oct 2026 16:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MEIQwNWMcMY7HhQDtjEWtbdNYuCPb8sPCT17bZmYgvk=; b=y/ZBFeXvt/MZi13UVSY+OjKWfp
	ct23AqAIM1TfO/f/qWBPkJe4qH30ehwM+xx3HNfKQ7kJ67zw1Mzk2O+BbSTUw2OELCIXDW5hfPa6T
	I1Jbs+7oIrpLCztJh6W/3MNbqaXajxZt3fskDDd3Uk0Vd+zw/roK5ny0MSSK0s2ImYXdc7SnkYEki
	1ttnBMVjygj5wry/krLHt9v0c3wm6s1WnzAqpfz2TfuE4IaLstIHfFZ7UqwZs6KVHgRIfC6yFLDWU
	Cotn9ro7cOQQOddyx7514RsLl4g3ZT1UA5hMXxg4+wR366ibLK2PYGd1WzglJSqui4kwmu7UwyQj3
	VajG3osw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFZWF-00000008FJx-0Ef7;
	Sat, 10 Oct 2026 16:01:55 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFZWB-00000008FJC-3f06
	for linux-mediatek@lists.infradead.org;
	Sat, 10 Oct 2026 16:01:53 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-48b0584ad71so346736f8f.0
        for <linux-mediatek@lists.infradead.org>; Sat, 10 Oct 2026 09:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791648110; x=1792252910; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MEIQwNWMcMY7HhQDtjEWtbdNYuCPb8sPCT17bZmYgvk=;
        b=HlMMPBzrbCQy5/35KzT0oMac9H/5wFICJVk4evVO1Gj/8zCXj7bKL9xV+cHCot9Rux
         xgO4/2IIwPwd9YlMFn5kV9T9YP8wsMMsPmJRbrH7JQvKGHZT55xXSVSv27uCmUFwHCOX
         1NaYQ5UCdzlLACbNiGCIY6Rjy3RB7n5z/rcZ8jCduWvtbqRRAhUaOHUDaXcOjwN/CE+L
         HfiDyIkqP9GfEERbqPrs12vkwIKgz/WSq9RN+c1ACIRFhiH/ldXTLJa+APhoYtlvF9r/
         vFhkg52oSJkg4LJaiYN+JzQa/KZvlFYg/R2JtA8YYIxOyINRHtEymV5IjKyE6C5RhqEK
         1n8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791648110; x=1792252910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MEIQwNWMcMY7HhQDtjEWtbdNYuCPb8sPCT17bZmYgvk=;
        b=MwzO6U4wMylu3JRBZAgT5NJ0lFmiKq1hD0WVaIHBFVGb8j3ZZsZT2ecwfI1SOcmsmv
         T8YD4/PC+YSh/rMtWomno9PNaFaMxCkkCelH3TiDiu1xY9lJRIwimAA6rPN4NY2aajXE
         teRrbymaPg4oPdqLkIlSphvgD4/pbGNp6fCsFsTj+0J3PeCHoo3Pb2EJaNOVdQ+f2BSi
         bSIyx53IB7+erOrcXbgJMT6jxvQQOvkoKkmjTyZWUaxAeK9dgCER1Z8AI78WpNwerBP6
         C+OgNFEU+NoH2yScCI/ntKO+1BnPpsJFtbY3bCAxsJfIZBWLRtDgjJhEEaVCdhpCa1+G
         mxoA==
X-Gm-Message-State: AFq9FYLWiBHtO+gbbLFsxwB3m7DpYRBOks8yV7hfm/FRqG+F2c2fJmok
	u9T+rryXAY1ez8VKoeHsnG2r6SBEDVYcoDih7XoHhHClaDP21otXocTicfImCWO89DU=
X-Gm-Gg: AYBFou2oNA8fzQyus2y2K0ghLhhiEusHVoxXXki6ZgYpHW9c/3ghRrTytn2AnSE7567
	acKaPhb7U+FYQKv6FRkJwlAXiXJVv+PjE7GGExCb8MmQXQCgl8O1UBAqaecj00/I6XPi2YTWTpS
	QCzHQwif+AMzQj07Kjz4v35tKbJWGDXJl+OZ1jYueSbUqNsaa9Lni7F3Uq9cESzpADA8vjGHiyh
	9V84orClghNUKOBeGICQxVU/CES3CpkF6zeyLCiRqrihpcXrIwyosd4HFV5O9Ft4B8xnlCtFTzJ
	w74SvsEaUlLXG5iylh7K3ZjoBHgwX6kc8LTaeWwWuahq41G+JVtxKihhQzwrUqVKahIdjP4E0io
	B/d/daqxsdJbEh0u1MgonqzHRj83J24kDEywPMxb2PppstRc42I3vvnLjPIYI3n8Yixz4cepre6
	c+CtoGhBVZQzoYwKBGVkvaX73KX4xuiSr0i++CXCOxzjgJrBwguYOfjoOyeAgIm4Ne7A==
X-Received: by 2002:a05:6000:184e:b0:488:8904:cf19 with SMTP id ffacd0b85a97d-48dbaceb60cmr10490477f8f.10.1791648108898;
        Sat, 10 Oct 2026 09:01:48 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ac6a91sm8579603f8f.41.2026.10.10.09.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 09:01:48 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: mediatek: clk-mt8173-apmixedsys: Invoke platform_set_drvdata on probe
Date: Sat, 10 Oct 2026 18:01:30 +0200
Message-ID: <20261010160134.112136-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_090151_909793_597143D4 
X-CRM114-Status: GOOD (  11.53  )
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

The remove function for mt8173-apmixedsys needs drvdata to correctly
unregister apmixedsys clocks, but the probe function never calls
platform_set_drvdata. Add the missing call to platform_set_drvdata on
probe success.

Fixes: 4c02c9af3cb9 ("clk: mediatek: mt8173: Break down clock drivers and allow module build")
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
This issue was identified by Sashiko while I was working on the mt8167
apmixedsys, but it is present on the current mt8173 driver too.

 drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 2 ++
 1 file changed, 2 insertions(+)

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
-- 
2.43.0


