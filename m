Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3887CDB466
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Jun 2026 08:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=; b=Q8Zjxm5idsw201d7Tm1g9uHA0j
	6vPIAjbXITu7Ln+1iOc8NS+wicjtZu7H/PzKDXRKOrAXLqIkKW/K+BXrD2rThhZrgJe5TEa4hrPT6
	2K0seehYuQ25nJL7zOvEnB41TjjbjsjHtsJW3XFhPKqmbYn+WrwZX7WpMmwOg6efJStK90XVeZgTa
	PsieI60keZW5RpZTP647GfYE+P2DtTkPXvJAlymtNF69Gc5indvZKVkzi58+t6YpleqmTXmJfu/qX
	5feQ80Ult3CmB8a58txKRUNMuxhhjrs8Va6lrTQUXF3orybF6FQYRep3F3cMYcGDFYk6ZotQagYek
	Plp8EJ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbDMr-00000003pek-2g7A;
	Sun, 21 Jun 2026 08:17:25 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbDMo-00000003pd6-35uL
	for linux-mediatek@lists.infradead.org;
	Sun, 21 Jun 2026 08:17:23 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso22647555e9.2
        for <linux-mediatek@lists.infradead.org>; Sun, 21 Jun 2026 01:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782029841; x=1782634641; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=gERglFOfPjAhZzQUZsBGOlVv4RhT5pESSz0IdKFeoMua4YwlKNyc5gww5Z/QvLoa13
         a+OidWtrDKl4fUXo0egksSOH0B+Vt0T2COcdeMWxX5ytjZq2xKLI2RLIYMA003SOIkC3
         nlOKz+9+XgkxLvINLGLeWBaKV+haX2HI1fGL1katGDJly+V/3ICH4RM9WBHZj4ogefaY
         q/PMvy7cjsAYUlIgP1tyxTK7Tg7pLD0E6t8GHABljDdWQCeclUryv0u7PpXQCYJP2eGb
         Od/MUXkhPhxpBjpb19mh16zXnu0AUtK7QBrr39DD/6/T325Qjj072wgi8Vi+lHXdnkB6
         nlbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782029841; x=1782634641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=JjQQuxOfqS3Zuemermock9iv9/FKU61AR+DWktp3pOlZGnvQhbLfkwhKqymXxbi2Op
         af/tuQMDnlIoVH/pZuEbb/lea6O+hzK7F5HisDDiyFr+m0FE7wFaYrFnutOWCzOWFnK1
         FTE/MpEawz1vo/KMK2b3VvJ3elx85LBo2SqyFVeOM1dSNZ0Xm8BFgN0OmLTLE0ad+akJ
         poRcX5JdD3ai2hfxpSzomCVtSRuwiWJsElhRh1DZ/3sFI9QI9Y4b5s8mM57xO6mBLLqo
         vTdpRhXD+cAqYnQl0HOB/PBzVBXDE3nnJ5DJugNV0S5H2PWWVvD5sqfvXYmibj2Y3O9q
         GGOg==
X-Gm-Message-State: AOJu0YyGikl1ZDEVx4H8cNhXCSYZP9IQkWo1UFdtSdpuY7OxOZOhYw4l
	rPo/1Bn/pABhdn5E4JwU8hlc+kSXyG826oFxQT8Wzd4UuLOlQu6NLhq9iqxUyz9H
X-Gm-Gg: AfdE7ckocQQq4XT/DTR7wniTaPKcqfkIoP73bdtE/iG8WuXcSXvzDpgYVEXC3G/koNJ
	UWO8Eoeq2mMBY23OeWOa2CIo14GgDQnSBfmS5h8TtreYfAwcgjV2cfWnSIaQb8GsQsVrPkGq1J+
	F4lsotRXklNW5sPMLv1LfEPYVPCT6/oIjSQ2n1skGVcM/VpGpsIioKlUAZdhm7VXGn6c9mzFSl3
	AqNXDdZLQJ5RgwnNwoHy07up4mSHzFMe6Vc6/o84Uyc32ACHYd+d4/J6Z9O5Qg4Jfi4LFiJ3Rui
	RV3GMwTdzAkmkHpS1RRHxiLpiO2SNRw1srKs3JKwy2Au30k6Cd2gFC/beL7j4p2LtdaLa56AnKE
	uWyNqi1fjOwTLCzFW5jqLZRWA0ErWIBJ5iMrwT++2rDYbCoMU20sVOILJGQcRFS7BVOLoO0A4zZ
	DNGmKMWQ==
X-Received: by 2002:a05:600c:5289:b0:490:3d62:f5e1 with SMTP id 5b1f17b1804b1-49240e81ac2mr164933815e9.22.1782029840525;
        Sun, 21 Jun 2026 01:17:20 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fe7b9e5sm194100445e9.10.2026.06.21.01.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 01:17:19 -0700 (PDT)
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
Subject: [PATCH v9 2/9] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Sun, 21 Jun 2026 10:13:27 +0200
Message-ID: <20260621081634.467858-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260621081634.467858-1-l.scorcia@gmail.com>
References: <20260621081634.467858-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_011722_787689_3877768B 
X-CRM114-Status: UNSURE (   8.71  )
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


