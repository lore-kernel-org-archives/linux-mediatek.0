Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BCECA5FDD
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2026 20:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yX/9xC1BB29XKcsi1gHnIwdtNtc2m1SRNjsZRYQWmUk=; b=qMQ3SR5nWIhvfxx98bY3iqW2wt
	EXEJ8nED90himaEDWVRrFr+n14WqV2kzRo2Yxv/CcUDtuD0i+DEC54kZ+QV+drS+w5pnkrUDVnyY1
	hkcTr4SiQlg+9N0JCKPraDKyFgHxWNdtDdf6S9dDwF8yW27zxIOI0m2tIlKXYnq/15JuCHeNJTGMi
	fexVnZSRtIanHTdr3pNNU1K23CY6ji0fZtoO7/aTgeamv0gAfIQ+o4Nrl2204rRc/SbO7mZtLtCOb
	B9Gmxvsdec9zUP9KnIkjQ/jMS0O/hKAilHWpa5RVQ7xednNich7be0uNg8WxEHBbAn0x6mYEc6FSZ
	pfPZFPXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCjkB-0000000CTP5-2NLl;
	Fri, 02 Oct 2026 20:20:35 +0000
Received: from mail-qk2-x10.google.com ([2607:f8b0:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCjk8-0000000CTNI-18qZ
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Oct 2026 20:20:34 +0000
Received: by mail-qk2-x10.google.com with SMTP id af79cd13be357-93910ad20d4so889237685a.3
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Oct 2026 13:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790972431; x=1791577231; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yX/9xC1BB29XKcsi1gHnIwdtNtc2m1SRNjsZRYQWmUk=;
        b=Ncik68Bh6+gdnEjvtWGUoXc8nBQ+/aC3Twq9R+9pox25j92qpreP9DSanZ1C3ogNIL
         E3gLqtSVg60w5egBDM3Yyq0sGN07iwr95CGSrGmPN2nJBuKvwrHEk7rXVMPLO1K3mG4E
         5oVA+TcxTR3CtI1WGgpuBuIMpruiC7GmkqqQIkrprtIsxukxHmEwxSOIzYFaHDARRQrD
         PtoaFkoiORHN63ogcyGyLCP586Q6fBLjVU62m+gNe2i0STGRbQpP4XqQTWzsD5wZNDHX
         TLgqzbKRH1mfaISc+qBbOlBDG+wAA9Q/vLCHi+xVabTiOpLRxKT1T8/R+ZG93cRhUcsf
         8y4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790972431; x=1791577231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yX/9xC1BB29XKcsi1gHnIwdtNtc2m1SRNjsZRYQWmUk=;
        b=0xJfXQveNcm56VTWncpmOAIk2KYqLHJ0CnGBzayunng4riw30HCITN/IfwZbZV3vCM
         TlrmTbtwbUFEfIWd85n7bJWbasaIibt2FauUQkwbKdTTQQjoCoQO8hoMUDG3AylmkHvm
         mxY4OiM7ofyc64AyC7jlYt1SinyyMpkNC31LeryGWpILcnPQvHrZPEfzB1C59znn18KF
         Ozga6Vvb6Kxcx8s7+Z/PSZlM/Yfda6Tp7EA6Og522DVLYGbQAC+MO9D3I5YaUEaKse0q
         gJDPiZ6t9sXDLWoFza5QN5OjhtWteuC32PyVeiHML3dehkJiSfhjIxrC3N468iXy35BK
         tIOQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8Mn2bB5TDQTGo4fYUMkoi/D9FMf0sD67x5/LGQi3Ew9WMJrOZnMO/NzA37MuupiDcy8Jo0T72RFq1lMARXQ==@lists.infradead.org
X-Gm-Message-State: AFuF++ltngrSNoHiVArP2Sa44A7k9ZTdZ1S6Lf3lfETemyXZPkYBdxd5
	GPD1qsyh5e5jzdqzpnfSQDpn1XEZZ+yZ/FqfAGR4VDZ4TxkP1ElunlY=
X-Gm-Gg: AYBFou0KtYLqhQ1pBBoEKssmezeZPrzBdha+kCKAM/vXsQaGFUXeJ2KFPl9WWcHSNCb
	wmgKlh/IHZg2+r1lZw/0rSfdxcsUDj0Gr5TLoeeeJ/2kpCx29itvMxYSq0JCb39IY6V2QMeL+hH
	i900zylfwFio29NX+ZHGChBRFUNCwvfH1rBe2PC2s8aIHDKckQD1HOGYGoFa2qOTPBujFyBdWb/
	Yip+8D/tV2R+ZEtna3sWI4vyxKzjwHS6D2qz3tXDoAgbC59SIq6Nbp2oGkec5I6LBQmrUBKB23X
	lLagtzIam/SjeH7S86mwXgi3li0YkUFkfgPSE891yWxgCFWFGPalIBHmIjwJPPPho4LN4Xefa49
	SAKpoYIbFJJm5GSlOMOVsFJyx9Wfm189ktRUUcQQWj5MURks9nbBBJr6wSullc7U5aT1yJAQ+i5
	r+6qJighYOtQ4oIj9VTk3MWhRrXLHDWunEqj2ZFKVel4DkW0W/Ug4XKFRJ1+xcnZRjjwHhzpZT6
	SoXUIpCYu7XfxE4l2qCbbMwD6U5KiWeiwOynh3KfuUFQ+mmLy4Tee2RZbYAzbP8nOPPXF/EUwbS
	V1JP6fxoWLuf5vcPbSN2NJwtF5D6
X-Received: by 2002:a05:620a:649a:b0:93c:c405:3215 with SMTP id af79cd13be357-93cf17580abmr702882185a.44.1790972430750;
        Fri, 02 Oct 2026 13:20:30 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca1a63d8sm305025585a.12.2026.10.02.13.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 13:20:30 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH] soc: mediatek: mtk-devapc: release IRQ before unmapping registers
Date: Fri,  2 Oct 2026 16:20:28 -0400
Message-ID: <20261002202028.420575-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_132032_322335_F97290D2 
X-CRM114-Status: GOOD (  11.50  )
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

The managed IRQ remains registered until devres cleanup after remove
returns, but remove explicitly unmaps the registers used by its handler.

An interrupt handler already in flight when stop_devapc() is called can
continue accessing ctx->infra_base after iounmap().

Release and synchronize the IRQ before unmapping the register region.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: c9c0036c1990 ("soc: mediatek: mtk-devapc: Fix leaking IO map on driver remove")
Assisted-by: LLM
Cc: stable@vger.kernel.org
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/soc/mediatek/mtk-devapc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-devapc.c
index f54c966138b5b8bda32c383d179a57c78172bf52..57ffe49c99eeb9b0989bd5eefa557a0a7dddbf18 100644
--- a/drivers/soc/mediatek/mtk-devapc.c
+++ b/drivers/soc/mediatek/mtk-devapc.c
@@ -54,6 +54,7 @@ struct mtk_devapc_context {
 	void __iomem *infra_base;
 	struct clk *infra_clk;
 	const struct mtk_devapc_data *data;
+	unsigned int irq;
 };
 
 static void clear_vio_status(struct mtk_devapc_context *ctx)
@@ -289,6 +290,7 @@ static int mtk_devapc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err;
 
+	ctx->irq = devapc_irq;
 	platform_set_drvdata(pdev, ctx);
 
 	start_devapc(ctx);
@@ -305,6 +307,7 @@ static void mtk_devapc_remove(struct platform_device *pdev)
 	struct mtk_devapc_context *ctx = platform_get_drvdata(pdev);
 
 	stop_devapc(ctx);
+	devm_free_irq(&pdev->dev, ctx->irq, ctx);
 	iounmap(ctx->infra_base);
 }
 

