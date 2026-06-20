Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A40CD98E4
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Jun 2026 20:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=; b=v3sOH6ejJchUolqtAp9xkQlWdR
	1W/6ldlNS2PLLw424GfFRYqKgGmFTTXfAq3WC/oq5VN1WeDL2yW/ABjTBvbzJkx4Tl0dpy4S5DBz2
	jtRnen9aO+F14fkqJM/GUvV4o6jfBIzPlIIKMPcUY5FhADnoc9I6ywFpBsH+ZX/+q3CEXKDDxzIwl
	u7P2AJiCWhz6fO7UG+3s9OivEaJOGAnRxql8Mqoc6InxC9RjWbI1e1rBBLVAgCXwCxVG6gJwq1z3v
	CkLRFOdhmIQAfpMx+WLGRRtuyYk6rN69vPVXfs4e+ayQvS1MMNIl0n/JGsF331Jyc7gLXGjT7N4Q4
	m+hx870A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb1sV-00000003Wgq-15qD;
	Sat, 20 Jun 2026 20:01:19 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb1sS-00000003Wfl-1zya
	for linux-mediatek@lists.infradead.org;
	Sat, 20 Jun 2026 20:01:17 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-490b3637b90so23564855e9.3
        for <linux-mediatek@lists.infradead.org>; Sat, 20 Jun 2026 13:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781985674; x=1782590474; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=j54GW9chAcRaoIkOU0swV20uZohPlh/fmZGhuzX46QFiNqrAztKCJ4fQapMTdRwjXK
         q4Tuo75qOm+/6cIWFWHTsqh1NUbZnIudn+FeV1vmEtOoID8YqNPzU4JpkfNov9gNwWJt
         Mnx5E4XLK+S2wGc4XFN5OpySeau3tGDzZOdatKDwyzHiFWJQJT7K2f+b9Yt85zhs27pP
         C2LyiX2g1URdhmvc8Njvs1R0/IBs+46k/g27847+GnAQ7zZSVJ+8he9Q1bPwveA4srA7
         dMVLEopn1WEvMxUCNRiW6ab5zQizy/PJj5yIaqDiSyJPU5c++zIP/zPoPGiDWfN7IDGs
         NF5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781985674; x=1782590474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=HJEOcJGes4dRoio9zHunffHlulu1rlB9P1ARGwrdwoh2uHYK3lrFW7AwiziGYjspOu
         2rEAsxo+oISG/STRsrXlQQcrr2t/Opi/Vn0AHVopJeyyXxB6tgM6grg6GZoxja9v067D
         LHcNPZ+Togalh7HI2HH6xrcsGGIjLPY0vSsMX6VhO0uoJJeFcyme+xe3v9gVDZPKXgLh
         RSDlant5yt0jFs+yi6W5rgLyAjRZ7GTdIKA66kQ/k29CBrGGofi+kH68I2JlOqPL9wEu
         L9tyPg+4d1cgC2ZhoKkAG5wZaryoN96uo/bH44UOr5l+XFFlA1npHcBfO3wazPRupdNC
         t5qw==
X-Gm-Message-State: AOJu0Yz2EUBk3t/n5dlrdg+NzvqGr9UyO9yM5/VcvEqIzTKUPh3CPEMK
	Ig32sZctQiuYekLHqeljCjQr5Os6BW4qnRXK5lP6Dm2PeJtcbHTIwkryyBbvqaaS
X-Gm-Gg: AfdE7cnLf2Gxuw74wvu3KHPKO2YTd7NW4S6PvjyuYKPeT7JctJMkaGWWVhsDmwHMmUj
	IybGrdMr42fdcW8bruhMnuL1m447KVNqoVIpyUw89KJ2W+c1oiip+LcRQtF6mpnctfhvcjd2F7I
	/Vf1fFiPOXW71pTfdtpGYbVRgBRUp81o2YAwfcRYOjpI6ug2Xci5R6uPQfJS63gdNNVn37B5shl
	qpPYpMCfNm7AH2tCUhB6Z0k58z/8ehvLRY1UIx8V7Pno4Bbemoxab8Wk+U20t+T6I69+mdS4Qbz
	X5o795jt40hbmU1iQt4xh81SVDmiIkbhddqZLC9+KpfPApy9osCmcd0l3hCoTPqTNKhZ2fjm9vm
	TxHAjx9rR8EKsmxmDKXCmtyoC36twFCXJp69HS+st8mcXTcXMRlfYB2raJUILW3wayYuVSdzdJA
	NA6NYlmQ==
X-Received: by 2002:a05:600c:4443:b0:490:44eb:c1ec with SMTP id 5b1f17b1804b1-4923f582c6dmr168656025e9.27.1781985674088;
        Sat, 20 Jun 2026 13:01:14 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666788226sm10708354f8f.23.2026.06.20.13.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 13:01:12 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v8 2/9] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Sat, 20 Jun 2026 21:56:48 +0200
Message-ID: <20260620200032.334192-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260620200032.334192-1-l.scorcia@gmail.com>
References: <20260620200032.334192-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_130116_533875_BA607B69 
X-CRM114-Status: UNSURE (   8.73  )
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

From: Fabien Parent <parent.f@gmail.com>

Add the binding documentation of mtk-pmic-keys for the MT6392 PMIC.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index 140a862ecfbe..ff720588128b 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -31,6 +31,7 @@ properties:
           - mediatek,mt6357-keys
           - mediatek,mt6358-keys
           - mediatek,mt6359-keys
+          - mediatek,mt6392-keys
           - mediatek,mt6397-keys
       - items:
           - enum:
-- 
2.43.0


