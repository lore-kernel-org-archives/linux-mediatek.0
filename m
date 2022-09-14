Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D491CC6FA86
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 10:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ps7PgMWhxefgbtcNKjLN/FBssr1YHBS4wSEf1QompGQ=; b=Rwxxv6D77uEekROyrokMOY3GQr
	5/IQ+jLDEg8Yp1LJ984tnfiO6QvdfpnaDSNDBzB0Y3gyjuwqGzKtet9yR6oiq5RC4hlWDUJPjGfrp
	V/6iuj4MlHC7lqipZpnUwf/lzfTbKQuVBCQLjxV+WfGAcnyJlTgjenCAogjxn1P+zdYuSAhrqwfJK
	CEOI8D6wVRdBtF5qcx1TcrlSJBwlbSAm3rb9k/RXwsOxYBfme49ake5gMdTKunfTkZn6K2hh3LZja
	v+7vQWUZHNjdq6hXjce8+wWvfl0HopwC30QKgPm6kTqTzkYqke6bDnuVgVUBTxNqU6UxegmcxcwfJ
	pp3NbrIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYPWk-00F21E-By; Wed, 14 Sep 2022 10:21:54 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYPWA-00F1Dh-Uq; Wed, 14 Sep 2022 10:21:20 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C9212660201C;
	Wed, 14 Sep 2022 11:21:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663150874;
	bh=+t+eS5uIq7be1EAHToZiBnClNaJKjeBU4Ul3SPxFOAg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U8xUsm4llePZLK4+gmK9cVOZa6u5GdXx0q9y+xXYW7TEL8roG9249T7pQ7JKw/dth
	 aYI8FMx0mzU7dXn9er5jfyxsuef0HFjgEtRGAUqHLevq5MiAuiZt5tOSpvqqeuSOra
	 WLTuT2GAY6ngDengo2Ru4/uNr6jLALaTEGp3jIVxWZ51v7poOribtsURx90/5vJ/oo
	 125VMs0ilxUxlVkgiP9RcxCHTg+bSBsfwvqD08rsbzWo+VLiJIHarnd05rFIGZ6ZKd
	 ffp3ezY7Q/bWgTstgtFYwSh8f7+PmlxJqXkG2qNOvYfyfmeXu4G5OrwEylbYvC0tZ+
	 mrTGQLAUHdz1w==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: krzysztof.kozlowski+dt@linaro.org
Cc: dmitry.torokhov@gmail.com,
	robh+dt@kernel.org,
	matthias.bgg@gmail.com,
	chen.zhong@mediatek.com,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/2] dt-bindings: input: mediatek,pmic-keys: Add compatible for MT6331 keys
Date: Wed, 14 Sep 2022 12:20:59 +0200
Message-Id: <20220914102059.41757-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220914102059.41757-1-angelogioacchino.delregno@collabora.com>
References: <20220914102059.41757-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_032119_177746_71DF683F 
X-CRM114-Status: UNSURE (   8.66  )
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

Add a compatible for the keys found on MT6331 PMIC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index e33fdca50b16..358d027e3e81 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -25,6 +25,7 @@ properties:
   compatible:
     enum:
       - mediatek,mt6323-keys
+      - mediatek,mt6331-keys
       - mediatek,mt6358-keys
       - mediatek,mt6397-keys
 
-- 
2.37.2


