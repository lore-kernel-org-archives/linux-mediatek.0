Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759F0C4167B
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Dec 2023 10:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ryh1iGTa7kF9idOemql3ilVj21B/Zv9mQQDRw2KtiZk=; b=NczMsycefOaocAeUFAqotM0CES
	v/iotjtVRk8OWTq5ABngtqqNDxOItZW5wM81EMhgqUDuR+nrS0fvGoVQvLFR6afVda+xXt6VqeSA5
	izmdsPCNp8j4EiAa/xHPyGPKxNwm5fNqrqGOrBZt9ToTgmWDoYNX8ki0+f0EQ5KCcLa6urq3536Ws
	jXVDMe/Xn2OiFVr2RdK2QovCX16WQGqqgTJdKl7al4H/OqGYesvPLTTRANTBonPnzV/ZNIO4FlqPk
	KZeFgu7xh1f8S3Ji1dQfqNB7ZKrLU6gs6FInkaF99ztPQ7rcwtkuQcL2LMVjfMEvo3sPQoid+WUd6
	N3OaloBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE5hy-002oh3-1H;
	Fri, 15 Dec 2023 10:46:18 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE5hp-002oc9-03;
	Fri, 15 Dec 2023 10:46:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702637166;
	bh=/CmNXLjXKNYtE3QqvhH1lwezEnrtQSIJkJcxeOmHOgs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kVTRpd/QXiE/fuAxIqthRZXkouBjFQYgItywSZsLJrn7P2ek1WFaczYYy6AezJwvu
	 z1n1jckY6JH9ZDRGuMPKp2I4IiRmEqGd+sDufnJa1aB49oanAmcIERk5gWE6ajzSC+
	 JRG7lL7NYb2XVWbX2jyon60DbIkHTnyIaCaWQqqTnpvlPoXufRHv9zczg85fDebCRI
	 +s/hW2SvwIhpf1qyaQ7xwlvqVSCLrOjVIXxaNgaTcq3Yyi05skff9e9l9RQbFqX8DN
	 SGsmV24D01n7jHIYh4GlSGG77R37fan293irVkgoYmLdHWrtMJVIU6zCWdDD/fbNVM
	 3HVsXNzZWiR9g==
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id BDE013781FD6;
	Fri, 15 Dec 2023 10:46:05 +0000 (UTC)
From: Eugen Hristev <eugen.hristev@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	linux-media@vger.kernel.org,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	Eugen Hristev <eugen.hristev@collabora.com>
Subject: [PATCH v2 3/7] dt-bindings: media: mtk-vcodec-encoder: fix non-vp8 clock name
Date: Fri, 15 Dec 2023 12:45:47 +0200
Message-Id: <20231215104551.233679-3-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231215104551.233679-1-eugen.hristev@collabora.com>
References: <20231215104551.233679-1-eugen.hristev@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_024609_223257_BD613EB8 
X-CRM114-Status: GOOD (  11.40  )
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

Looking at the binding it makes sense that the `-vp8` compatible has
the `venc_lt_sel` while the other bindings have the `venc_sel` as name for
the clock.
This was also mentioned in the txt version of the binding before the
conversion:
 `
 clock-names: avc encoder must contain "venc_sel", vp8 encoder must
 contain "venc_lt_sel", decoder must contain "vcodecpll", "univpll_d2",
 `

So it is easier to check for compatible that includes vp8, since that's
just one, to have the requirement for the clock name property as
`venc_lt_sel`, rather than for all the others, some of which are missing,
thus for them, the requirement is wrongly `venc_lt_sel`.

Reordered the if/then/else to match `-vp8` and have all the rest of
the compatibles using the other clock name (`venc_sel`).

Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
---
Changes in v2:
- new patch.
 .../bindings/media/mediatek,vcodec-encoder.yaml       | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
index 403530de5624..5166c1c6934e 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
@@ -111,10 +111,7 @@ allOf:
       properties:
         compatible:
           enum:
-            - mediatek,mt8173-vcodec-enc
-            - mediatek,mt8188-vcodec-enc
-            - mediatek,mt8192-vcodec-enc
-            - mediatek,mt8195-vcodec-enc
+            - mediatek,mt8173-vcodec-enc-vp8
 
     then:
       properties:
@@ -124,8 +121,8 @@ allOf:
             maxItems: 1
         clock-names:
           items:
-            - const: venc_sel
-    else:  # for vp8 hw encoder
+            - const: venc_lt_sel
+    else:
       properties:
         clock:
           items:
@@ -133,7 +130,7 @@ allOf:
             maxItems: 1
         clock-names:
           items:
-            - const: venc_lt_sel
+            - const: venc_sel
 
 additionalProperties: false
 
-- 
2.34.1


