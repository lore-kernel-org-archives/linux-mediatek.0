Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B21B7F0182E
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2026 12:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+y0veSsgUsUJmnxU5xqCTTpBOt5TLJfl8EzSd1maDY=; b=CkveZ2juW1ZPF9tSfSMf/Kv44i
	AB5ZG49hhmmaSCZQGPrg7ee8oSWMeGsna+UIXYVhaRSxnJfxYtWsTuEN/1wNaCJbDTGzWqDPzHDQd
	UFNXyC5rRzeuLq8Yx8R6o1q7rEB8HNU6QMeEAK08K+Bou5FOxjGaZTysbhdgxtq3bAS9qcYDSKbKt
	UecZI8JinSg3r8ZWH525bcVPLn+7eIpCFglfv0zyrPD+872BDhUY6b2j6juKmCscaBfrW65jv7Zd1
	o+TxD4zlLPywIy19EFTtYS49psXa2tnMig/kWTRig88UZZezY7XSWbFtpGHWDD5bgBSliSjabk+hN
	xJuHKNTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyTwp-00000003bTP-3g4R;
	Fri, 06 Mar 2026 12:06:27 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyTwn-00000003bRV-2c2B
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Mar 2026 12:06:26 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-439bcec8613so3997022f8f.3
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Mar 2026 04:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772798783; x=1773403583; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+y0veSsgUsUJmnxU5xqCTTpBOt5TLJfl8EzSd1maDY=;
        b=lNf7gjaaBEWY6/PVplRVf9Hpr1vIQinYzDTWDfQnFuL7EfkB7jdiSEHxobg9zWb20K
         k1vDLECBrzokCOQO7bU8toGhN3E3qPhLjZg6wRnEU2tBrcJ3sesl3H9E/YdQOKhBIltq
         Q8S2XviKUeprhly3mH1Vn+NwADT+vQlc45ZjYYS0mDwgJnjenxAGpaNiGn2jzB1F6aa6
         J/y6YUzcMrccL7oPnq1dNN0VVjTeCzrnibfCDkq1HyOjCLyfksRHg6xLaQUgZFlAJ/U+
         cnqg545WTT+TnzG4k1CsB8jv9GnW54fu5mKsmZmRvaMgl4Txjqvgr6cCEu/9r8zfe1ZO
         GW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772798783; x=1773403583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a+y0veSsgUsUJmnxU5xqCTTpBOt5TLJfl8EzSd1maDY=;
        b=MSRs6AI6zrYVx5ZmXRAsTv+C10mzyczm+/dQkQpL2Rlf9p4T87QB3PU6sKc/+jnh9m
         BwetLNWvsNx82nBInj9BHcwjc602GQMNW65Mqsq24Mhk5NdE5M2J+Nxt6e7c3/DjOAyd
         IV+bqWEZtpA/jXokmSGwfW4lkR+vrxYte2ruNLc++ckA6nWmE3GG97uWwpuGCgpzISxy
         Jc41zrCLz5zWWyPhloSgKL7JtzPXqA4SgCfikPdx39AVxeMCQHw1GTbgOU7Arq19fWz1
         8wnjIjNlFBN7v8BpdQwsJt/Wk4tT2mjKhJ9yaB5u+ZurHyGLMWOa5ACpIDM4GnabCkhB
         lKdw==
X-Gm-Message-State: AOJu0YzYMpoBt+Fah2pgNm8I9F+dDg2fU2N7IgNF8d5V2xfpbdz0E2CH
	M7Gp1Wt29+szrN+JMxsKxPG0x4e3GrathhYxgQR5vEYRduB6olxh6bu8vLjwUIl8
X-Gm-Gg: ATEYQzzdNlcwE3E2TXHPs28HHWuI4EppBZSC8vE+z9sVLQoOkF15WeUVviJi2sCVQHV
	Sqrf+3ktEV/gUclbmQkG1FMe497EM01VtuWvWxk69nWbckNF7/VRZtP4zmb9xu4h8yz1QTkKeZP
	tJUIEJxzpycxmv6uo2evG1Fh7DQJfT+ZtMzaDcVAYeLzerCVVfgPYw6tWleTZQY0W4EJOEOXL49
	R83DKcePbD2PTnXGoVzEmEstTJasVdQwftV7yaXJaSJhWbqdkClOQLryWZGoDQGVqEd1idMjU6R
	ZefDG8aP30jvrVFkhv8+QMKdPlRryIzMxyuaKxew2ZrED98ywZjNqfSGeOluA2xnIq9Dycyu0Gv
	qp3xPrD5R8S/vBRcNoqlCk2f8bemo9q20EIK1O4b2/6ytkHPL7JGslYcnTf3LfMTEKR5ZJepIya
	HjeODY1fp4TV4IB5/H7ys=
X-Received: by 2002:a05:6000:290f:b0:439:b715:6f49 with SMTP id ffacd0b85a97d-439da86fa3dmr3098642f8f.59.1772798783337;
        Fri, 06 Mar 2026 04:06:23 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2b9d8sm3457225f8f.21.2026.03.06.04.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 04:06:22 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/7] dt-bindings: input: mtk-pmic-keys: add MT6392 binding definition
Date: Fri,  6 Mar 2026 12:03:07 +0000
Message-ID: <20260306120521.163654-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306120521.163654-1-l.scorcia@gmail.com>
References: <20260306120521.163654-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_040625_671347_FE8C57F1 
X-CRM114-Status: UNSURE (   8.81  )
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

Add the binding documentation of the mtk-pmic-keys for the MT6392 PMICs.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index b95435bd6a9b..2d3c4161a7f8 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -30,6 +30,7 @@ properties:
       - mediatek,mt6357-keys
       - mediatek,mt6358-keys
       - mediatek,mt6359-keys
+      - mediatek,mt6392-keys
       - mediatek,mt6397-keys
 
   power-off-time-sec: true
-- 
2.43.0


