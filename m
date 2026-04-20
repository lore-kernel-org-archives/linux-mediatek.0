Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C85EF5A8BC
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Apr 2026 21:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vndNgbOdyTJpKLwuHM5pad07Ye98EZiTxW8ph85Wc58=; b=zVbtwJgIyEOqqhEl/2VzMldC6U
	IbcQjL1+H462/cg7IavDOucbaW2Ol4MdxOCBZdR7x8h1vOl6Cfyo0fUcyS/0hgibXQMeJT3OeqE4l
	jHGANc5bwvjbF9zCATEBYLLhJVUcy90DCRBqhkHpiNlNl61+0vllwzmqqg6pRfWqGMPMzfPvW12L1
	GNJbFPSH4YfLvjffvjOx+BPjopmhzKZBnOhFhUqWrSSVy0SGMqTos8dQNF/qT6WWVOF2S9V7LuiiO
	plN+fSP8d0SWt5IvANSm9xUAmIzsLeTZLroc9k/ybRz7nU4gze7IKlq2zxKU1Ysrg1Qsaw01kzvJh
	tZTLkQFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEwIh-00000007jnp-15d6;
	Mon, 20 Apr 2026 21:37:03 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEwIe-00000007jmW-2IaV
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Apr 2026 21:37:01 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so16147985e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Apr 2026 14:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776721018; x=1777325818; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vndNgbOdyTJpKLwuHM5pad07Ye98EZiTxW8ph85Wc58=;
        b=sS98grONc7Gf8yuf8sRUifgcIMxTto7WoD93GDlixwxudR9f/EzE27+EUSPabXojD9
         zvx8GPpXA4A452LrWOHtHQU7W/OaKESu0LUm7cwadR6FER1zGrpGx7ztCGM8RUYTkeN2
         mAWsmh+JaA+23Psu6DtnolE1rD9gUso2u4UYuzvpHgkRWaXzRUVcb3fXwZ0aWaVOU9KH
         OXu9uV+ap7qg2wXQa37RTW1cViuRo+5UD+PFyZ4qzrO5fdOf6bTF194CijSQwHFsbfCx
         J1aISk2nYioNUZ3qyLtZsTBiYYM5uDsHZXwKsFS+fqueHN36ExWRMSA+AIWYHJRO27B7
         1utw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776721018; x=1777325818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vndNgbOdyTJpKLwuHM5pad07Ye98EZiTxW8ph85Wc58=;
        b=FdpVNnykP6/xcJ18dKWAbwY4Ce3VEVCV3QqzjR3DKNgWOvG+2y87dC8R3WvGHHt1Jz
         OPyErrG8y+95GVe1nfWpD9mJXAQTOegEpxvIuWmsZwLswtgQXjjsF8sVzYl6NcvGV+Lz
         2NAQQ9OxlDYKv5Xjj/BDn01wZD6IRhglycxns3d+bWIStJAVoeLNqccLU2+7iMqDlnyM
         kSIvHfGRM7kLCSdhVSJM8P3za9JyEczuu2qw5n2ltmzQ/2OyW6jB7YrHZbYUwDOLxHnA
         O+hpSdyb5voJAydOcVcZnsEejj7PhqH1m6bDFCbggAU+LLDSHpb/vF0WQavcqRU6Gbhi
         Py2g==
X-Gm-Message-State: AOJu0YzdGe6j2r/AfBQQOMdLMquUoVJxUoNmmd8M8FJ19SjLSB4TPJt6
	Xosl15SUtkfVR76Ltyq2mBZ9QRe0DGgwtqQtUzL2FxOrFB4Sa1cTa4FZ1xEh648K
X-Gm-Gg: AeBDietJemgdm+FXIs+7G6Rif6+97o7zP55MFhOy2Tcfv6PORbM2ZfgMqQ0dvGJHDzJ
	PQKDDsBB0frP3smY3/nNL5KyUqE6Q/w0rZ7WbaC+L5cFisTI2FEeOUKn2tWajeiPcYIHNHPhwvL
	7XI2gKTQr9YcecX011Z8y6S1ogBwhHNJpN8JK5ua0FY8M/KBxzEj1sDnZIrsBvKPTjsYPqhofsx
	A89EWlu8+X6n+uQ+2c09EkrYyLK+b7qML/wwASal2+Pyf7bw5v/uVailcEObpyI367gr9vgDTMb
	Va+8/kZDSwvZ7mjZuSK0rluT5S1kZYHJbQHH3v3RvyRlthQGmhha8uQ/zf1ZkZVq3JhETitN4K0
	cXw9bVCePgwsvQTH7FnOQO6rG6OfKkhS+CEEQOfENmtwH5GgZNN2ZCY05VMzuWZd3mt1742VgY3
	ZaQGXWlZTj0ibhXEFKYtloAfvR7qN+AtXy9a8V9Qj6
X-Received: by 2002:a05:600c:34d3:b0:489:1cda:bbb7 with SMTP id 5b1f17b1804b1-4891cdabf13mr74014935e9.25.1776721018309;
        Mon, 20 Apr 2026 14:36:58 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc140c82sm289500355e9.12.2026.04.20.14.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 14:36:57 -0700 (PDT)
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
	Gary Bisson <bisson.gary@gmail.com>,
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
Subject: [PATCH v5 2/9] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Mon, 20 Apr 2026 22:30:01 +0100
Message-ID: <20260420213529.1645560-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420213529.1645560-1-l.scorcia@gmail.com>
References: <20260420213529.1645560-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_143700_592789_D04B1961 
X-CRM114-Status: UNSURE (   9.29  )
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


