Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C89CD98CE
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2026 20:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=; b=doODUuvs43z6CBV1a11SZQPmza
	e9YJfhCqm2u/N8/hYR/1u3VC/Ah96jlSEBLhYNuQWMTQw6Br0jwMgSfLc5ZrE9JbH7DyCXC0B47NI
	ozYYK+5xKmg7sE6cZH55qwPhfl6eJKh4se1k88lXDq9x79bu5cMs1wVatOD/erhRiJl3k9lSVi+sF
	HpYuhte6UaJ+hRh45O88EVNNwO5/c+UHQyw0jGMvhPACqCkscQJOetmkabs43Op4woEItCQhiJEeN
	nOMr52fkc2PVYY+HWoWI1/xQ318WuQ0zUJHxAR1zY3al8Ip+S3BLcU8ts9WMGXs+W4vRNP0Fh7t25
	VkkKw0kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY8SW-0000000BXlY-2rdx;
	Fri, 12 Jun 2026 20:26:32 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY8ST-0000000BXka-41wi
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jun 2026 20:26:31 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-460166910e6so809625f8f.2
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Jun 2026 13:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781295988; x=1781900788; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=aPZYiw/ANONrjy7EY5gJVHt14Rv5+6hBdeKInJUgf909DpnJmsSTwXHfHEzZc9V7zm
         hm2H+lwBSW3aqgTWHoEpVV7MLHwQ43zHr5qF4ZtDAvQPVA3ruxbw9bWQH2+M+s334lqk
         0TpwIl7C4iWf9++tie3gb+qcco1Iqp3tX+u1pd+ChA0v+SS8bvOcF6E2tTYoipEpWr0q
         lcJm1K9uP5j4H8rkgJ6Pp2XzFh2hRT7m3/VqdRXw84J76mc7y05Y5VX7RgMnPFs/ErAh
         ArwUf7s8dqOVGBM0HIgYkjOLGC+eW9URu3znxvyGuQefG+2Ek+d8LDc3Ud7IaLiOm2J0
         EPdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781295988; x=1781900788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=EMSqv5CqCK3vIe1bTZQgpka/l4nWS0Zh93yUGds9P4lGUhNvsMfKwO4HxuQvTCfAx3
         gMTDHPrd3iy5sSfo+J8BCqMxl9KoMGQFcmZ8gzXWDFzi7znXmU5kWX9uLX+y5hAYalaO
         vRqtfenonziPD76KtN5kfRowp/blsNevlZXu+ChC/DuvkHNbuslCeco3BoWPQ7wYyEeL
         5R2PX9/84kiv90bPnoWmrCzNFDkjx9zoZOHItXhz+DGNt/d31cG8V3HgquThVMr9qoDV
         3QE9/Z1Y3g2imPu8PUtRz7WNdwDoAQhQBs7iRibdnv0iUvZl+Q+Tv4U5xBZunUd5UqTQ
         1VSA==
X-Gm-Message-State: AOJu0YzyPHRcJykV2zB3SoopODtGyBTQpOGTG4Pl1CkGpZCxkYancq7r
	4NtbrfwJNY0E2CeUE0J15xWZG5RBtPeDDDla4+bM+Evx6IXOg2sCkMpoycmQEGpt
X-Gm-Gg: Acq92OEJYSJnr++J8LOmI5X5iSIwwEWOYF8de7HA3czDMAWfTO0tX2VOtPzWF/QrGkp
	y/kInT+1JjtRQa39HQJkpiT1mVw0p7OCDNi3uUEWB+vzlQ16zX9v0Z5Rok+zF2Si6uPdCLmGfAf
	9/zN2v5WuMaA1m9MDb99yP6mnnu8gbmqCPzjZdIvYMo/IYsSlptUOFGi/89zGJg2tFQsFcCo0WY
	whFNSdRK412iTQEHolnb9IXpfLVbdTkP2Z3MLRFHzrhcwXz1jXwx3513YzsDuoETyrBpbjai4UW
	HZHe451/Q8ap//bTAfruG+XEATONs2A7tsNJW4LQqgIzN/6Fh2l4dMuVPxb5o+n21QCnBvykAN4
	v8w06RNKHrwpz4WTqe0nvb4f0j9ZZFTqOawVC8S5/3rcS4Ijh7e9D1pWLnYgnv3h7HUx+eGfVUK
	GSQzsnh8FgIbZrC1IR
X-Received: by 2002:a5d:59aa:0:b0:460:6731:6165 with SMTP id ffacd0b85a97d-4607796858emr866095f8f.22.1781295987798;
        Fri, 12 Jun 2026 13:26:27 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm9173261f8f.1.2026.06.12.13.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 13:26:27 -0700 (PDT)
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
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Julien Massot <julien.massot@collabora.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v6 2/7] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Fri, 12 Jun 2026 22:04:07 +0200
Message-ID: <20260612200717.361018-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612200717.361018-1-l.scorcia@gmail.com>
References: <20260612200717.361018-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_132630_050023_942A6FAA 
X-CRM114-Status: UNSURE (   8.51  )
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


