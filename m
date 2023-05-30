Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2300C7EE23
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 20:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/UhVQK7t+HosSVy3q0W/MQmzaLul2qg9td8dQYWmD0k=; b=Ru2tFuUQrfaung
	IKMWa7eFa8/TailAbcAvM2FdoV3ObGFMKpLS1npqUQAVpqtr6DrWaoHgyrvkUN7ay/+f+jILzu1j5
	yVZ0x5OHt8YTWw/7fKiZtDzpqPkaMDbRUfKUvwY3iLNaV+vQ6vEg1YJfHwVbsMW3hVS5DT71prY/d
	nscf4LSRkEeattyZFWif6QsdjN1ml6FwddpoyULphpb6ThDBZxxRqB/PPcwyPsgIIb9LGwUhHGLmZ
	jaDUHOJwaVPwWuLzuDnbKQhAl6m0xyDdjaY71hHwv0BnK9b3iLYnNCZfgGq9O6buMcfTFPUWt7k/w
	zRCy7Sgc5vAKqwEBOJcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q45j5-00F4R7-03;
	Tue, 30 May 2023 20:13:51 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q45ir-00F4Iu-1H;
	Tue, 30 May 2023 20:13:39 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout1.routing.net (Postfix) with ESMTP id 8979041A92;
	Tue, 30 May 2023 20:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1685477612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/UhVQK7t+HosSVy3q0W/MQmzaLul2qg9td8dQYWmD0k=;
	b=kagLpLsNghQ+3kEot5WtdGyjyNAXlnvLvHr5/6LpcEV1/Ve6J5gEFBOynkFtn+XbgOFszi
	mtvTrw6aFJ7V4RePZW/3dPLp8f5CifvzU0uIkHTok5JssI2pAQPiIqiPXX8zI+bHeGCzSX
	PTwQrZ8KsK6Jj9g0mGaZeyIa3lW0qEw=
Received: from frank-G5.. (fttx-pool-217.61.157.145.bambit.de [217.61.157.145])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 29DA8405AF;
	Tue, 30 May 2023 20:13:31 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v3 1/4] dt-bindings: nvmem: mediatek: efuse: add support for mt7986
Date: Tue, 30 May 2023 22:12:32 +0200
Message-Id: <20230530201235.22330-2-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530201235.22330-1-linux@fw-web.de>
References: <20230530201235.22330-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 96610b03-20e4-48fc-b513-0c5f26603653
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_131337_578971_DD22EB54 
X-CRM114-Status: UNSURE (   8.64  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Lars-Peter Clausen <lars@metafoo.de>, Lala Lin <lala.lin@mediatek.com>, linux-iio@vger.kernel.org, Zhiyong Tao <zhiyong.tao@mediatek.com>, "Hui.Liu" <hui.liu@mediatek.com>, linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, Jonathan Cameron <jic23@kernel.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add compatible string for mt7986 SoC.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
index d16d42fb98b6..7ec2988b597e 100644
--- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
@@ -27,6 +27,7 @@ properties:
           - enum:
               - mediatek,mt7622-efuse
               - mediatek,mt7623-efuse
+              - mediatek,mt7986-efuse
               - mediatek,mt8173-efuse
               - mediatek,mt8183-efuse
               - mediatek,mt8186-efuse
-- 
2.34.1


