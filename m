Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE5EC76196
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 10:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9gvRZGzZ81MG5/Kz7opKkMvHNkqBqpdFUorIdo7o5i0=; b=euqD96mPfUr6+cBDxNC2TyprI+
	Qi7W/EAHBhE2ACjR/y0pfbIw4dGguiU2oonuvZAntsO+ayQWEBMaBE5aoOEneEjm+G2XMXXZ2ni0T
	m/JNKSy5pUhcfL6+5zHuDZ74gS9MkrUi3BhiZx1lhuOyOp4YBSFXf/4b2rMBomsuoStsNlZeruJWR
	rwZwubASBsHOGtBwvtVcMvkQUp/6PTqn5UCQnMbcyNrCgz7yimJJ9eg+pNtWKfu6o67EbVWBJZ4ep
	/IpZ1r+RIU7UotYIauP/eX8DGSOli3JI0P+DqU6jsnbE+CmnweGA5CjoJXL4Nfl0rSplYZz4t0ioz
	i8YyYosg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkjAM-009m5c-1g;
	Fri, 07 Apr 2023 10:17:58 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkiAa-009cvB-23
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 09:14:10 +0000
Received: by mail-wm1-x335.google.com with SMTP id n9-20020a05600c4f8900b003f05f617f3cso5760361wmq.2
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 02:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680858846; x=1683450846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9gvRZGzZ81MG5/Kz7opKkMvHNkqBqpdFUorIdo7o5i0=;
        b=xGMUQH8iksEJ8YfExMZNgPR/bg8PQl8w/Qm3p8yAoOnLfxp/qQHfGQsT7zA9DBCMSa
         jbVc6ldqKsbilNojY7mVUwQOcmpV7IFk2IMmFtZmw0oXXhfmMiiKj+Svt0+c5zn6wBQB
         HOcZDsR8aaTwLFrCGep6le0PhA48SsKqumaZMAjGYgih4RB6DiFppRcn+lXy9dFzrCN7
         OWC8bBzY/UKtiAXRrZgytyfiOe3Fb197ke50mBbVfBZFcnHfNjxHXMt59eOPktEMUrmY
         gx5ndQcbxpALYm6Zll5QpoMuPa7HfllcLlIezWoYtOR/nihABCkNrAhNccj2ys2pjJXH
         0KIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680858846; x=1683450846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9gvRZGzZ81MG5/Kz7opKkMvHNkqBqpdFUorIdo7o5i0=;
        b=aePwXmWNZFa0FwR/iuC7cTfPmK2WLWs0CJ33PhZQq/vVxhnUVpG/xd0cRAcugqp/hw
         Kxs+72c8mTWCxijavlTG3R4plujvvpY3tNk895W95AU1jBLHqLuGMixlSqYKgabUKXlN
         zubcXBbSt1cSi1DxDiEe7yYM9L0J6pg6mpiY+nWJJyEIWVGxaoSmmDYx4h4UYkTNusUc
         1XkGTZPRJiXgLfG6DpauL6mu/QIprGdg/tD0I62Qd0L77erDPG+jcTBeZhiQV7ShYEEN
         OmT1nVh/9NTAPIq4Y1UvI7QQ04uIhWTy+ro5qIX9j6ImtPNxNx4Op8JVOAr5vc9JRu9s
         W+cA==
X-Gm-Message-State: AAQBX9eg5q+5gKvES4CJ2zRgNGzpro4YFbqdwZhGajiOEPJnkOlwSM0e
	mY0600F0ZwWkFs4wocyoIwShzQ==
X-Google-Smtp-Source: AKy350ZRrTOfycKW9wpb1ySxaW2Z852gPkXpKIHM/8ZPrQgUAJnMq62jSsj7nPudOUhDoiebI/srKQ==
X-Received: by 2002:a1c:f719:0:b0:3ed:9212:b4fe with SMTP id v25-20020a1cf719000000b003ed9212b4femr793548wmh.0.1680858846111;
        Fri, 07 Apr 2023 02:14:06 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id k22-20020a7bc416000000b003f04f0c5a6fsm4026429wmi.26.2023.04.07.02.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 02:14:05 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 07 Apr 2023 11:13:53 +0200
Subject: [PATCH v2 3/3] dt-bindings: memory-controllers: mediatek,smi-larb:
 add mt8365
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230407-smi-driver-v2-3-8da6683cdb5c@baylibre.com>
References: <20230407-smi-driver-v2-0-8da6683cdb5c@baylibre.com>
In-Reply-To: <20230407-smi-driver-v2-0-8da6683cdb5c@baylibre.com>
To: Yong Wu <yong.wu@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh+dt@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=951; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=dRVBiL9RiPJX/FXqDzKoQWbHskXPf7KJD11X+Bn//b4=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkL97ZGgOc4pIupSNVBNwzWquNMS9nseDM+yjJIvB1
 +Dfza6GJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZC/e2QAKCRArRkmdfjHURWJED/
 0bCm/8nQsFGhHGeEqIxX9hTkSaIRJOb4F/1r9lSCfquAUx8xV4ArzZu/AmQad0YBbYjSLKtRe6syP/
 nAe+u/8rzKqcb7mITsPUtQ9r2LMHkePwwzRIbiTvm5aw9XTLkK7tHZjqFFlzMfp/DqurdTXTO37TIK
 4jbFYUguWI33kDHvQfjdSc1rq94IALcD7uCqhNiHjEq7lfJdReZ4SX/u97liUieDv4edDlLJPcQcI3
 I34rW2fZU6ETMVozsRDysD/NPq8Ux+jvmxAa4cS6b30rbfwb00+68iCtc4jS307LUEXAc4Odb1LPlj
 /3LH9BtyzuVsNdN+d+ByjPsrV947p5cklLP/MoSaC3Z08VYIaghcLRd4KJIy76UtHn1n5HcPvl4W6C
 ZiQfr2ycl0TK7m7QtkrH9SB/9pVUFTFSOQhCPyqMnx4X5r/RZUAtn+bVzNI0cP6tg37MLvUiCNsj0x
 wCHjFrhEFKDmbT5nUUniLI+6xMIk6T8cJg8EyEb7moE6KsZe+GSD1/yQHrZzb/sXm/D7pMLiMEjPJ9
 Lh7RqARBb280RhjDGrHVnNWs0+82lfRk16xGlp7oYtd7StIOIWX837WGbNlyxHhJGS90f+QVlmnavh
 2SXS+01KaySmjWKmMF7GNZs9XxHMYMZf0Ukd8mYDfXlFtKkapnhdvNPf36Dg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_021408_675009_20690503 
X-CRM114-Status: UNSURE (   8.15  )
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

Add binding description for mediatek,mt8365-smi-larb

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml     | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
index 5f4ac3609887..aee7f6cf1300 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
@@ -34,6 +34,10 @@ properties:
           - const: mediatek,mt7623-smi-larb
           - const: mediatek,mt2701-smi-larb
 
+      - items:
+          - const: mediatek,mt8365-smi-larb
+          - const: mediatek,mt8186-smi-larb
+
   reg:
     maxItems: 1
 

-- 
2.25.1


