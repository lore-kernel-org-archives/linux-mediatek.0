Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0340EC79FAA
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2026 17:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzjiq1bNAWSar6CSSzfU0ZIGYB2L0BzVwz/Bd6duqAU=; b=z0/tMDis+BsZ0LJrIBA8MxnVGW
	Rtu2OHC9xO/FFv0PBcBqxFAHHNx91+pVaUrQF7lOPBvkI+gEcfbeUomVvcyS4477/StmeaE2NXCux
	c95N1/EELna9A5f5RqeOfjjHcEXtfrRbv9GSDgbkWhGbr/74Xdd6kcfk8+RPRnsh/ctBcC9AbqqdF
	fc6fzD5uIob8rL2hnmGfwFbAZ3GZtkOKkVZKcPdyKsszERMcN3dEL3IvCH/iZMx0wj/p7pUG3UhXP
	ZSZqnYmqMdHHcJqf1yH4AgfZ/Q6W/HKsK6rhRzQ/9qv1J0InfZFoLk3qXjEneuKZmLnD0A1BLk/NE
	Efsvgveg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zsK-00000009sHR-3TTx;
	Tue, 08 Sep 2026 17:44:52 +0000
Received: from mail-wr1-f48.google.com ([209.85.221.48])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zsB-00000009s5o-3pTR
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Sep 2026 17:44:45 +0000
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-482ea739de2so3385003f8f.0
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Sep 2026 10:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788889482; x=1789494282; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pzjiq1bNAWSar6CSSzfU0ZIGYB2L0BzVwz/Bd6duqAU=;
        b=EHBcMX/gHYBwpSvJNulTmnHtErJ+RrSdFWSJgtAXIKJhF+Sg30IEnhH34QvB6AIELM
         HAC79HiQERp7CjrrDHk09f3odVtJ4cbUqmVICEhFHYZ4j4r4oIclt+vFZaxUqrpagGBD
         9vM98cyxsR0B8BHx9iUmBhjPKun6x5j+PPeJDQXRZJrjg/MAVJxtSr7Mk/PMMgST79yp
         fxfqoFPWu0zQG9rFifKEHchV3ZNKgqzd85hWz6DkrXO0OZO0dhkM9DnWqjMXYWY3YoUX
         MV0OHzib66WjtbBs/ll+is51oyRQAnk1UL1xzB98zSYQoyBbnIhuAgVngKYReP8N3xeg
         km8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889482; x=1789494282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pzjiq1bNAWSar6CSSzfU0ZIGYB2L0BzVwz/Bd6duqAU=;
        b=oaYVwNVkn0ITsYuXI9ujwcR1wBqGqr6hD80yU+dwXI+8f8L9NtXDamx4W3pzLlhPXM
         dzqpIA023H70UuPCsu44/LAMy+nBL1b9bs+nc+QPLViQNUYyK85JmOrCBv1OSSkuSAmg
         SJiRuM6qh+8ZrAzqr2zmqb6/164K6bqLOJg9kZ3tkkLnAoTcQ30TSl9ZPqzY2IDupzEb
         kMQeaP5kBdNeubWPCs5hjmf+Os1ZzoMKt5DAaN1YPe9DVvkEyt6gvMnkyxTlVL0OzooK
         Hwx0zsT7q6gyQ7WvxG7i09ZK2mDPA4g3XlJMAYEvOoMR3X0Nh9KspKArx5wbYa1jzImg
         DO5g==
X-Gm-Message-State: AFuF++mKiptWkR8WzO6o4ERwf522o2t1uvmLRXnQORYAbBCWobQjMcbo
	vf+tiE6+cNFjBUUuh/p3Rwkr4+IYsgX1J7MIi5d6AF0kiw/Q0uW0j/iqqJa09IQq
X-Gm-Gg: AYBFou3JRfVk3+l3E5F8EBWfiiuGmjV0iZNFOG4Do2SHKpCO6lFZ2uP7EZop6vG9SzW
	Po72cUAcCsPYXBVkHzIL1JzLfa4SBmqcLzHscOs6CKzKSN6b4owtSoMrIiF1QiwsJbG6dOKkrRj
	h8uJj1AMR6yY0+/g3kv3DRqV1EbQ9oluOGak4ol5q5GkUUFvqoW0/5DkClLnaOQHImhJkn2U6Lt
	eX7T1ONmS3SHsEkklV3qSTaOgxyZdLOwhmqT1h/TWdJceY7Ej6iYHtI+JHwcrsSfP3Rj20bjeYN
	Ddk8tg6KIHRoysQdBJrL/wzan1KTV4X36EGYPvhPt1fy2ZC00KW9NoYqVLCw6pPRdQ/r5vPoU6K
	l5xL0nHpTlym/p6FEoICSNWdSLtMmKHZTcmNmIHhJeVHKGnYBhFvQqT/979lXcE1H3U99XzU7Io
	8fZTJ5/PKtjM1S24PUM3swmxcsfn7QuMEJ5EbE2QiHbi4E6MVP6NZ+byMD
X-Received: by 2002:a05:600c:4fc5:b0:49c:fe18:6dd5 with SMTP id 5b1f17b1804b1-49cfe186dfemr274872685e9.29.1788889481519;
        Tue, 08 Sep 2026 10:44:41 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm487081105e9.15.2026.09.08.10.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:44:40 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 8/8] arm64: dts: mt8167: Add support for mmsys resets
Date: Tue,  8 Sep 2026 19:38:35 +0200
Message-ID: <20260908174259.9009-9-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908174259.9009-1-l.scorcia@gmail.com>
References: <20260908174259.9009-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_104443_991030_95B68593 
X-CRM114-Status: UNSURE (   9.41  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add support for mmsys resets by declaring the reset-cells property.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index be215390730b..9eb24dc8715f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -132,6 +132,7 @@ mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8167-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		larb0: larb@14016000 {
-- 
2.43.0


