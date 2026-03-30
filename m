Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D171F3D61F
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Mar 2026 08:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vndNgbOdyTJpKLwuHM5pad07Ye98EZiTxW8ph85Wc58=; b=obTX/ZSzC8Ry4zKxQvhUh8MqA8
	bH3zura21k3Y+lIsUHZCQBgcnqM2s0vcjJ0qWD6jWM43DkCHisBwytimMDoNQ2TMfa1CFAnygalMP
	Z0eW8BA+cyTtoYTPni0arx82dZ3eS7agkdlLCRoZF01xbtGNJfjEkyQ+Qie+P2yg5oY8nEY8c+nPI
	8WofEQ2S6C2Qbk+bZvBM1lWfKRIqSRxQ28mpBNlsl/kkHERTyJpYqeRLTgzfqPtIBpTvfLOKKyqFh
	am011cbPbEaTDeCsAAMmwWt9Mnlxs7VoEdSXoQC7gDhtSjYZ7DhxNkaeXOgGDXOTvtQ3srwqh/YNE
	GypUbR5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w785b-0000000Arlx-0HHI;
	Mon, 30 Mar 2026 08:35:17 +0000
Received: from mail-wm1-f52.google.com ([209.85.128.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w785Y-0000000Arkf-1BbV
	for linux-mediatek@lists.infradead.org;
	Mon, 30 Mar 2026 08:35:13 +0000
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso35471345e9.3
        for <linux-mediatek@lists.infradead.org>; Mon, 30 Mar 2026 01:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859709; x=1775464509; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vndNgbOdyTJpKLwuHM5pad07Ye98EZiTxW8ph85Wc58=;
        b=mfAR9Nd+GcVlNaO0+AEaGq9PL1SnUp9UqBkgXdc8Wi0OV+2oUliQh7YcVxzTJkDR80
         6kznaIL3Rtfe+//GkvMnQM8zrqAs5DJN84o0NlmjWXB1R93g5QAGzuimpULE9/NIdrew
         FURQmO+xCxgH3/M2P3ifjsBJZpGCzTbVP5WkPzCgXDjWu0bBy66z5yCXOODxBsa4Xc+n
         NzHpTo282W9Yp452z+WqOZiSuMKtnc/wje7DDINpRjU/hGauCuPUwjspIhI5X4EFx9FB
         xSuU0zAr2//WLTC4glIMzefGF+Dm/noktyOP0OLw+egzye973W2eq3QE7AAgDTl/DV56
         h9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859709; x=1775464509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vndNgbOdyTJpKLwuHM5pad07Ye98EZiTxW8ph85Wc58=;
        b=TzHRwwEfU19AQJNI9RLXL/glJLznzuk6Eu5jvyYc5tgRyrcCkFW59fBsXte0wSXunm
         4ezPeVjvDJ75eo+RzbacEVMSCtOUARUerWzioJxwF3wmnwJUm/nG43lYe6RWKXbqDYj2
         9QqbII49yhYfe5nDZC4ZWL8hqcxFwcr/zWfFfFvhuThTgFlq6nFgmYsMaXEYDdp6pawy
         w59G5tTw+6v+VpNGLtuvtRHMOFkcPJWXL14g5qb4aKD8hotzp9IGsNWXyDp2Do2rLRnW
         sFj7hQdbFBZ/Xkjw8nuow94zgHLXy06T7NVCwtYsmWOL9exMV0HZHEkrDbHeNqI67aY+
         qKBg==
X-Gm-Message-State: AOJu0YzXjvkyeYJBRN3xB6hyqR346zFN8ATwyS+o2ojark0Ya0TC/Awc
	b2weQ8WklalBBNShXxoYI7Ep/rx7Y8DOSoXBxzYGDo9ow9+/aUmJnWPMLPmgPBwg
X-Gm-Gg: ATEYQzwj9ll8JzjET+MFw8KYmXk7MSJ11noJY/mGnQWA+Z83VcyVz59LViCqzbaVP/V
	R85iB8HtDhcv9xkdwrWxvu/hOMHXqIDeZjLrRy4xQ7U777b45rfhXhLH7UDhgPE7SbAUNzuwqhy
	h0Y4bEuubTo9BYlHUgE83PT+wlR7HjiZb8dB3CxKgl4SCrim0Zaqumq0zdz5mz990JYK72YQIHJ
	yltRlNg4lltsbg3NfqDpJwKDw/uTkO5qNXZwqyxpH2IOt4BdpbE1QTKUDJ1348xA/nYf7OmUlvM
	Ih6ehE/SFbC9kA2JgzUb3CxqI/9zRdiEk49iR2oCqojKk5ZnLbnf5SmahSZCMeHo4o7diQfY/yZ
	WFoCGeS6oaJd77wbxKYsOKC/6oUhkJQS23qfcsRgGEwb+SjW487zopS9+p2v3g8G41LOs0z6wS7
	fFnTCpp/fS6AMzqOL5h+4=
X-Received: by 2002:a05:600c:a10a:b0:486:fbc8:8dfd with SMTP id 5b1f17b1804b1-48727f80089mr170085445e9.23.1774859709303;
        Mon, 30 Mar 2026 01:35:09 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b495sm508329995e9.2.2026.03.30.01.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:35:08 -0700 (PDT)
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
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Julien Massot <julien.massot@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v4 2/9] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Mon, 30 Mar 2026 09:29:36 +0100
Message-ID: <20260330083429.359819-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330083429.359819-1-l.scorcia@gmail.com>
References: <20260330083429.359819-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_013512_331527_80945682 
X-CRM114-Status: UNSURE (   9.52  )
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


