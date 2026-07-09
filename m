Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A423BC43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 15:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YxyneXxmkkxVO68GHRQzBQ9RaQVnrXZvpdY/k0JkhzE=; b=M9vVfSy13QzhndZYmzfheWtc/W
	3G3aKAKjcODySbjEWRtbNriei11lN5dncbhyUoEl/GckJAsvDlM00ZBKBRtp3EN6Walmztoj8MSc9
	o+ew6x7LEx1z3CbZ+ON87k+Uf5t6BeFlLWWRj2AVY3wTirezlfGxXmrB+B3/tu00MVPc9uNL86Mlv
	Hxr1SBmR6+GOO1MYTLRC/HZwa/uyVheNcVlGNhxxZS6tYgum450m1/Twy+uy+a9cvwJb0many0Z9J
	Mt+8F0iKe/fUUM2C2J3UJd36VAk8HX9tDNw4eCyxlzQmztvz7K17DDd/8s2VUhKdXJVxIJX7sWZ4x
	TVYbVTmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whqqq-00000002x4D-3cJe;
	Thu, 09 Jul 2026 15:39:48 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whqqo-00000002x2X-0oCy;
	Thu, 09 Jul 2026 15:39:47 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gwzfh0PyGzKvv7;
	Thu, 09 Jul 2026 17:39:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783611580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YxyneXxmkkxVO68GHRQzBQ9RaQVnrXZvpdY/k0JkhzE=;
	b=QTyX1fhpSC5KPr4Lg3niIxaxCObsqA5pCvkPB5jGLufIHuv4pNxjxGK3AfxJHLmt+awE5m
	nvp1BxscunbqgbD7tFW5H2DwCJSVeTmrWsG5idk6NldpSzybbD7ZHSJXo+/3Z5vMLaQ+Fj
	oyS4tyUvbNF/UANUw2mM9VHxOMb5s2hMAqYTBBW0LCU/eDaHXhrfWmfBysnauLRrbfaGlS
	CeiXKmsfDv9GHTtXpLG4O8otohycuwg42Blgym/tRH9VarM7rhzeQYqzCpvYbQPRppznA3
	SKtwGX81fACRsg2VW1KH3obdm+ry3ZelPHNTTdQucLoGE4tFWGqfw8p3S0rF7Q==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=IHGo7TyT;
	spf=pass (outgoing_mbo_mout: domain of manuelebner@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=manuelebner@mailbox.org
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783611578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YxyneXxmkkxVO68GHRQzBQ9RaQVnrXZvpdY/k0JkhzE=;
	b=IHGo7TyTy0hD7yI7cXx+MPJM5uC3dd7J+0GsWXeaJ8Sc7EemdxI916EJrkfEyy+RIDCEfH
	9xRYvrvhz8pIFfa/Wd06apfJFkDvo7Q4negPbewxk3qg7qvANb/0mipLaKE/TL8vXdjtTv
	c4RPsiePa91hGZ/Z4KaEUbeInB+OHGSfoFFoZ77UeYF4on22HH5mRXUQJfkUhuWSbZT8y6
	ySozpm+xixbETAd7g5yzAmStgMyrwJ0WAeT887MBX5j/e+SCssjj3/KaCz3tdbhy8njT4n
	rnksSGnt56vxFXSS0QC14OlqJVO3G9D8NigfTztuAqh7hgQEw1NwEB7oGtUsPQ==
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Benson Leung <bleung@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: arm: mediatek: fix brackets
Date: Thu,  9 Jul 2026 17:38:58 +0200
Message-ID: <20260709153858.407734-2-manuelebner@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: usx4qrs8pqm651fziqnnagcipcnjannn
X-MBO-RS-ID: 0cb7372cabee112e174
X-Rspamd-Queue-Id: 4gwzfh0PyGzKvv7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_083946_401665_EF2552EB 
X-CRM114-Status: UNSURE (   8.33  )
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

Add missing ')'.

Fixes: 8101382c24b9 ("dt-bindings: arm: mediatek: Add MT8186 Squirtle Chromebooks")
Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 382d0eb4d0af..cd4040ad3437 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -314,7 +314,7 @@ properties:
           - const: google,steelix-sku196608
           - const: google,steelix
           - const: mediatek,mt8186
-      - description: Google Squirtle (Acer Chromebook Spin 311 (R724T)
+      - description: Google Squirtle (Acer Chromebook Spin 311 (R724T))
         items:
           - const: google,squirtle
           - const: mediatek,mt8186
-- 
2.54.0


