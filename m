Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A23FFCFB43F
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Oct 2024 10:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0ZFTz9Uswka8q9Gcum+i2AIGps8wlGwvgIKYo93JZBg=; b=RLVKvbZJ6HbUKi
	/ceTkGsMz0F+Mw8GM5Fsf6k0zqoWExSlulBAd4tAukFFEetoZAYIHf4Pe9qPY7LeCQQXjOJbgsGP8
	n4CO5MrXfp7pd9hw5FI79gFJ3q/2O7WeTsJAuXY4gufJtRSmeAtfvs+UoqawvUt3ThXsUT+TtGrfL
	tOc5DmseKLObR4lBPvQasw0I6N4aqTPDBLTK87nxLnnJTITi0uZ2s475qN8glHMNlFxtKSv1Yqhh5
	Kj+ciBfiH7ql6kieoZA9NWHSHPYNUFHZFTkoZwWLKgEMXOfRhUmhejO0k4o/m9kP5e1W26wyLYZ2Z
	RSjCX/MEg2BFFSXEBu9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxOVf-0000000HWq8-37ol;
	Sun, 06 Oct 2024 10:29:07 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxOUM-0000000HWYz-3Jpx;
	Sun, 06 Oct 2024 10:27:48 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout2.routing.net (Postfix) with ESMTP id 0C2F65FAA5;
	Sun,  6 Oct 2024 10:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1728210465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0ZFTz9Uswka8q9Gcum+i2AIGps8wlGwvgIKYo93JZBg=;
	b=RJalEN65+aEx8kvgpCDLrjaQWtGIQz4xyAlqf2XJ2JO0J3tBZWF2HQMIovPJKyG7gEQ+Yc
	R2aaqnCKCv+10VpXUgfrF5nA9kSNLNUL0ECHe9cwfjvmKJdr9MyGH2wELA+3uKiYp8iqIL
	TIdxc7yaHCXe6TrCGjnLf029t/Fdbgw=
Received: from frank-u24.. (fttx-pool-217.61.153.101.bambit.de [217.61.153.101])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id 084E5804DD;
	Sun,  6 Oct 2024 10:27:43 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v1] dt-bindings: spi: add compatibles for mt7988
Date: Sun,  6 Oct 2024 12:27:39 +0200
Message-ID: <20241006102740.17948-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: facdb081-b535-49ee-8242-ea660d354237
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241006_032747_002423_DAEA2992 
X-CRM114-Status: UNSURE (   7.48  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Leilk Liu <leilk.liu@mediatek.com>, john@phrozen.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org, daniel@makrotopia.org, eladwf@gmail.com, ansuelsmth@gmail.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

MT7988 has 2 different spi controllers. Add mediatek,ipm-spi-single
and mediatek,ipm-spi-quad compatibles.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
index e1f5bfa4433c..3c707e5de5fb 100644
--- a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
@@ -33,6 +33,8 @@ properties:
           - const: mediatek,mt6765-spi
       - items:
           - enum:
+              - mediatek,ipm-spi-quad
+              - mediatek,ipm-spi-single
               - mediatek,mt7981-spi-ipm
               - mediatek,mt7986-spi-ipm
               - mediatek,mt8188-spi-ipm
-- 
2.43.0


