Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5982BECD6D6
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Feb 2026 19:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=92SAHgAplCp4yQb9ApiGrHWDXrzlV3xmhRggcLV+hYY=; b=TR3In7YJYcGu6ZsrGYA1zYr2Kf
	lnXFmsge+0YO+XxKlfqiOiBctaJew8G5NLxlzXOT8NEguMSvZfNLk035tGLLmI5SA638af2c42aqm
	oHkK/sRL66eIrMF8sfqxwJ/k2TKdvQ7OiDHXyVqbDF+OrpQ/LGGkVU/ttro2/udm7bFjRlKq3AlDa
	8nloDqWPttQzZmdvQUOS7MQFFRZ0WtV8WQaQEcK6X7fmwHQSJPlPQ+yQ+nTqgKVi3TNiz+8DTtG/P
	P4ZAFaHqAu8H3nG2KoLNCRlZDPJqdeHDLgm1blyPWnS9gtw0s4WUulZYSLA/T0EEPXux9+aKqNalY
	QYKZd1Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqFXn-00000000xZH-33um;
	Wed, 11 Feb 2026 19:06:35 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqFXj-00000000xUE-0ggo
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Feb 2026 19:06:33 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-48069a48629so64686915e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Feb 2026 11:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770836789; x=1771441589; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=92SAHgAplCp4yQb9ApiGrHWDXrzlV3xmhRggcLV+hYY=;
        b=bVbKX8IJXX0RF4mYOG2ZR2GP8pgeRPmKRNY+lij7TpORoOazEG0+lbYpuFJ+dUT2qq
         uhwJso/lXEvjLqJqgh7tdH/5optOY94DgIif9yT5wjYSb29HB6Lo3A8hB6m+x9T447x2
         Mhn19WjAuoFUyqASh/ieSttPquTjnCvPRRs2EpeWtqGnkCd1BKble8u/pxS9ilHarGKa
         HC8hTZcUCN/5kYNzPeMwuiIRd1VylddcvlaaxehysxYgUWRI4NHo1Ih/2uqn3ZCh6mBP
         6jV0wKIikOjz4wW0NNoVPlNuEBCYak35VP3dg8wHXbtyVz4IqYtMiZuZ4FO1pqMm0oA/
         zf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770836789; x=1771441589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=92SAHgAplCp4yQb9ApiGrHWDXrzlV3xmhRggcLV+hYY=;
        b=IyOsnPGzbVsm4B7VLoiD6qiorU+egYIQUjMbnqBaYfz3SrvotJeqMZ9J/RiUHAZPfZ
         EjwELb3ViVI7cGm+D5cxfmDGCuoxl9xXTMKgFzfhCiKV74JJj+kGGsLz6edgBhOxXpp1
         0JH7nSkqPdNlooAtKnnv5DYfXSCSQ1e9Z8zyNG/FWekfAj+Cjfr6rC9oefyDbWdYyfkx
         NR5CnO6hAxMnIoyIGUsZOih3JNS5pq+nt7aGYZiXCRl2vw0hqFij7MPNqHMaxeCJL3jt
         wtQshY5yXUB1W0J2yoE10kvSkwzajnYPulo+gjkESUbOe65Sak3MPghH9iz+Iwq7q1AP
         kbJQ==
X-Gm-Message-State: AOJu0YyEP3IsIRcuz4iceGL/yWAA9v/kgqqT9Hg1XjqIjXRlmz80h9Jg
	6SBoqRrGgs3y5mZ1+PqORRYfygOf4gKa06vSuMERzsK9ONjGurK1cfUzZzgmSg5n
X-Gm-Gg: AZuq6aIEuWobNPHTsS+dY1L8SC7r/bYqNqViMwi7eMN8rPgvyEMKQOrkuyNvvRdAlRf
	egV2hROxaCmHUv2uxe3841jwtD/K7nbZFObkJhox9Q8KoaUCcq5FI812ZBfx/f0I5cWa9ZAud5C
	AGlNnd9d8pzWcHFu0gMBxKY7gi+lHdLmqtlhvvp3RWiN6vE1diAg67+mZU+MEVGhTTpemtIbAk5
	Qc0maCI7cm1ddi/yQ89UYWVIVFRHJ7ZCauJFF5G0zuIJTLCRorJb7414+hsU8EFF8A17Pv2MI19
	1ISBIugcOBhCHWE+lhNWxZmuGwLDN7W/HrzsBibfLast8fRiHGa6+6Zp3CJhEolPUsGOfQ+HZCN
	YfPy8OwX/DG+8KnJQSCPxRWQMdJ2rz+hepMsaR0hqpdxBKToY+QFd/n+zOigfYctYOD/265kr0m
	H3e0rIrDE3JL+Gzf8XK9s=
X-Received: by 2002:a05:600c:1d86:b0:477:7bca:8b2b with SMTP id 5b1f17b1804b1-483656c1151mr3219115e9.15.1770836789098;
        Wed, 11 Feb 2026 11:06:29 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4378e122df9sm211223f8f.15.2026.02.11.11.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 11:06:28 -0800 (PST)
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
Subject: [PATCH 4/7] dt-bindings: watchdog: Support MediaTek MT8167 wdt
Date: Wed, 11 Feb 2026 19:03:25 +0000
Message-ID: <560b1985c911ce25950c9caedc42677ae01fa8bb.1770836190.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770836189.git.l.scorcia@gmail.com>
References: <cover.1770836189.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_110632_606432_C338B62C 
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

Modify dt-binding to add support for mt8167 dts node of wdt

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index 953629cb9558..f514be8a5851 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -26,6 +26,7 @@ properties:
           - mediatek,mt6795-wdt
           - mediatek,mt7986-wdt
           - mediatek,mt7988-wdt
+          - mediatek,mt8167-wdt
           - mediatek,mt8183-wdt
           - mediatek,mt8186-wdt
           - mediatek,mt8188-wdt
-- 
2.43.0


