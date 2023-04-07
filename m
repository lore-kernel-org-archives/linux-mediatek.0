Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BCDC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 14:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4QkkEgowsBjZnjX/gOtAy8+xgH7LTkosTkX/GzGdyGM=; b=QjtFWj9+RFjNR3fNCo46ptcdXm
	lbQw6d65k5cPmFuoVZ3HybIseZSGb3na/a/iy3nQhDtTSxIq/c9KCOkCLhj0yQrx8fH7rMdRBUUYu
	Jgrao+DIWcAZrDzqr28eaZdMS08XNbn/H/1fu+aKkrjirFYuJOoT5dIAHV3Pcz2OyvZW2xpoTjlnj
	bwYVjARtsQANYYZPZyz9iZBllBbYllLMQk497UTwCc559KwVXqW1CQMnBmWrKAh992lkSwBgTiENT
	LMBYhoQ2R+8M2D9nZ7f7C3snx8rMIxvTBU9I1c078g4e9K2B3JA6rV/vEVj89SHi/3N+NeWWJnu5/
	PHf/4j6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmgL-00ARTN-0p;
	Fri, 07 Apr 2023 14:03:13 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pklgw-00AENm-0s
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 12:59:49 +0000
Received: by mail-wr1-x432.google.com with SMTP id l12so42223438wrm.10
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 05:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680872384; x=1683464384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4QkkEgowsBjZnjX/gOtAy8+xgH7LTkosTkX/GzGdyGM=;
        b=Bdvy/suIOXko5XBR0JKtHYSCABSjQLM/1tUCg34Ut96SZt4sMW7nKVJVQ+GRqfYKDd
         Un09JL9jh/B30nUI69Wt0SuvJvd6kLiC8cczMoW1DOcjwGprXacidpUoOp9VVj3fxSTo
         sEgo+Z64qA13yRtGY8uZuiy1yYmpNxTG3qaEhPoeewq5D0duXHlylPQ4oeiXRgCIhut6
         H82s4KJscvvZES+Mun79usp3aRw/KUWJyvDFBtWE7gWpomtcTP1pQlrHc1mUQ1Fl9N/G
         jJ8OFpwphHSE8Xwu3aKMqYSwPAg+LidKsdQGqz9GWl3T/VUx9uWTV8q0y1ajjFZFDl6C
         u7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680872384; x=1683464384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4QkkEgowsBjZnjX/gOtAy8+xgH7LTkosTkX/GzGdyGM=;
        b=QNxOm3FtzVcMDMy1zN4fGvRCjbxlslNURVauSha50Ix5U9d7FUugQEpZzyRVAR7fjT
         /7VY4QHP2395R34VlHEHqPTYKNBgyDOI1WZFGuFJbFjmi5eMY8coovzzFCsqSVLiS45M
         lt5IHYIWuAAUDbpAYAUq9fQoCD/VT3WHcfG2Ey10EyNL15pF5DtFf7XcDJYSaBMXYLYO
         mRQOoIXJ+7zQjZLrUFHoaIcJMEthhKxsSPaaOgZK5FJPfAdiczAdb9ty7Kh3iaSRZUjq
         BpbrdO3BiHPuuHsIhvHES9Id5iYhGoBEARz3qp5aTZLu8t3rC00tKc0lBrDbDu0EUup1
         b4/w==
X-Gm-Message-State: AAQBX9ejl28czg0jrzsnLOpQe6gSJVyVLfj5mi8Qns0nBA5X3HtjxNjz
	oK727l5UJvHTW3il+amXQ7dCQQ==
X-Google-Smtp-Source: AKy350ZvO+9x3qEAYCwaeUCsOC2teddU6Rrcv2PND6+EBP8rSISG78UD6RwHKOKKL/0QBirN8m8b2w==
X-Received: by 2002:adf:eb4d:0:b0:2ef:b5a0:35e1 with SMTP id u13-20020adfeb4d000000b002efb5a035e1mr238129wrn.8.1680872384143;
        Fri, 07 Apr 2023 05:59:44 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id t4-20020a5d6a44000000b002e558f1c45fsm4471446wrw.69.2023.04.07.05.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 05:59:43 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 07 Apr 2023 14:59:22 +0200
Subject: [PATCH v5 03/12] dt-bindings: watchdog: mediatek,mtk-wdt: add
 mt8365
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v5-3-1883c1b405ad@baylibre.com>
References: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Zhiyong Tao <zhiyong.tao@mediatek.com>, 
 =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>, 
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1036; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=e/j+wpeA8gY8YWfUFggkrkBUqt/uFn1RH7+Bbqouv28=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkMBO6InolBLE5hgMS/ilZjfIXr7ubVwxfLfIr3ic7
 ugBTojeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZDATugAKCRArRkmdfjHURXdFD/
 sHzp7rInfWJnE03dVcquz1XCJOk+lLZHqrmmLKwT5NeqRLVwrwRuQXGlRlPGQ1j6OxdFqiQjG9Rwbe
 kNCW1JUau97hUjlVsWUNQ9TiqzETCBabQIcLKLDx5bKsqLR8b8CuxndfMRcwxnVpiXNZYDVtXpK3Rj
 lHd0iVlVe80rzfmYcjgAW6VVF9OqI/VdHPOl/Uwk5Di3LMOQQhen9kNWGjJlrqJaChXywiRelLUb//
 M1u+7uLG6lLEmAQCKMT5oitgHLv+qVc2DWAXXY9fbB4o5n+3Twi8uqYebZ+MUhdOsZ8E1gWr/tjTjV
 0Im5vfmGY2T9IJ8pfyvhnPFguOkVsbRkcFpXPYp0v28aATUvfdgPa9Y3nOwytKh5WbhLt3FLPq078J
 DerjdPnI2mjBx/GYaiuR2Icj+Jqv4YyR9OUXY9K+UyebFFLVPcJKKtRWON/tI++RghlvJaVvbF25tV
 zwnydim9nRXlvUjOmdIypRtZCpsudOkGakbEymPB+XFfkc7Mr29TbE6bQqK+eKGvkUxzuWKi+5rKSy
 Zu4VtO5mOfvrkRuX7Qw0a+U3hs+AtN1V+Z+iW0n5h9XDbe0BlngU+35pn0m3MmEvNNlnycYcFjvnbM
 nrRcj/HF/8IRrPxnOP6gX3+pkPok8sallrrkzLUcdQxKnxDYu/LcuoLeenuw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_055946_312672_4CD974E7 
X-CRM114-Status: UNSURE (   8.69  )
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

Add binding description for mediatek,mt8365-wdt

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index 55b34461df1b..66cacea8e47f 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -38,6 +38,7 @@ properties:
               - mediatek,mt7623-wdt
               - mediatek,mt7629-wdt
               - mediatek,mt8173-wdt
+              - mediatek,mt8365-wdt
               - mediatek,mt8516-wdt
           - const: mediatek,mt6589-wdt
 

-- 
2.25.1


