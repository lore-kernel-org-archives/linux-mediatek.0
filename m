Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E5A60A2633
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2026 10:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2vlAjX12;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a/2nMQaJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=kr1Aa3+HTl57ifUnZ6jARduOXVoJ4F2DQRpWjtSxKvg=; b=2vlAjX12BVWQj43z9xHg1HG/5l
	CasrACALyiYBk8YjzMVA0kR228KjMguZzaoWslCVFg8UOERKxtEruSPEOrIH2rkDxDKDNcHmffO9x
	Z0aAHEKcQYOhYawA4j69+tcia8LzXjEsNp01BLSh/Bz+fNffqHzSJNRLn7H6fKHzWC5qpLOyMK+gC
	Bj8LYuU+QEsc3M0HCg4GGnjwtsseSfjdMji1Yx+guDEMrx2ncqJfjQnhPDM5kMlMSSmy3/P70jN5e
	yLlQVQAMNj+2xRRYFIjLysIiJ+b1DWfnxBBiAQua5PqO/bVyYYODez8YH1X8VI7tUsvquywMHvGW2
	e5jf8SYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHq9-00000002Fup-0ZgA;
	Mon, 26 Oct 2026 10:22:05 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHq5-00000002Fst-3mrT
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Oct 2026 10:22:03 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-48b060ec084so1695147f8f.0
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Oct 2026 03:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793010120; x=1793614920; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kr1Aa3+HTl57ifUnZ6jARduOXVoJ4F2DQRpWjtSxKvg=;
        b=a/2nMQaJwqaXD8K8OgA10o+9jItI1duelKMqOAL6lCCwmMV23Lea1QWL9xUEWlECux
         EtE9jxcoTlC4wLxwBGdhe1ShZyYhiDyPkdqlW9e3/2gwaTrcRgZwzNipA+MWRACC8V4C
         AnR0kAX37WAQoDNrXpJFGC2K8xATcmOn4XN0vGLuZ6ynEDDQecaNkCoO35EfssESnGo5
         m8nYeFWnxhrE95zXfOim8EHGH61Mv2raRO5bZfcX52xoez/FhkQRgPeMb35jQhmn0c7R
         rtnoyrxjw61oyX/Y9cLFqsl26/dv5iSw919ehLzdQkxRl9hh2KGAGqfalsTAIdcj3wno
         G7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010120; x=1793614920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kr1Aa3+HTl57ifUnZ6jARduOXVoJ4F2DQRpWjtSxKvg=;
        b=UzukyiNuN5XZ+UxycVVu+e/JtKFmIxZ75l+MJ6fDEklWtsNavEESN4H8FipwYNHg69
         nzNVB3usUjD2SbX/A57D1pX0iiHfpE+tS7atkqbcL+1nZKuyQhYc1YANJItPPUP4ZdVE
         A9NDOjVh2vBQo3dQ0ROdVN/H6d/nYw0OM9PzVxHVCpIvWG2wF0EJnjfR36vK8+KmuiJR
         21jnLvhW6ybk3BxFL1T4VXWG07yKMa2F9//DVfBW6f1AYg5PIHKdnFH56Z1w/F9uHJuY
         N7cEcvXYQphZfxnkAEw8Ybc8j1UBfOs0wa+HTu/EWfJHsMB1uoHMz5o9GiP5QaEBq2Bs
         Q4Kg==
X-Forwarded-Encrypted: i=1; AKwUvBwrgG/IAAF+JgG+oSl2JZRUVmD+aRxCJpcl+YyxN1uqbarZE+5Ouev9LJWefBs4P9kOWrmOMRcqb+oL+fegQw==@lists.infradead.org
X-Gm-Message-State: AFq9FYJZT7f2BFOfZyRta/D57vfoF9XXe/tfnFJDvqisHGMVGl4Ewbpj
	Nhl/2dMgsbG31m0QUQ3cfldZaM7pZxcaDRa2r6iyZmjrINhqos9LnFag
X-Gm-Gg: AYBFou2DtiL2/7uxkLunjWTKmIhW5eKuBErpZgxz3MSmsBhHbbtZAKAJrOTB6iguu2M
	cmwEgin+0DMn1klfuBQygCKaeERX2CBlVBlY6Q8eCWnysYGxRZ8T533xW6611VfoWb4B6NyGqMx
	cyxknBMgK6+35380TzOo6HXO4S+rJplMjNUMLcdii2kkIyaqtzaROPdTdLI9bo/eZirSQqH8pAG
	XPabCy2qaunDqBa9r3ZGDdOlc8ssGwbI6FtM+a9yu/W5wPE3rXQbFQ0VzdOYRLzCndpsA+p0Cae
	LoJn1kaCDIfwW1Co2GdN+qrq2qNV88zaQxo/HHnk3xe0un/BMFZ04o8OZ/036mJrbL5woYP9VZX
	QTiDWOUoxX1QgPLnNxyVjhPaBcLjnwe+zLAbDqqzcJCyHtoQ5Z7Q0fGBm/0tnoBaFEPow+0zmNJ
	fHeGetuAtTIky3P1xK061PW4WA3+FgluYFtva4mzkGndyQuBjDKKPjgg/Nobzq1zhQBHZxF73V1
	5hAG9oFGqieBTI+U8RnzslRlA9QRbtFjN4rz/0nAPGxpYVfB1XiwRNqHy7n9pIuwlGPUxWVumsw
	sQDkuZy98BjGDILv6ydmahMOa3RhRj+r0FOa3WaOHcWIVNDCJFMLvow0AQjR
X-Received: by 2002:a05:6000:612:b0:48d:b650:69aa with SMTP id ffacd0b85a97d-48e3eba5700mr11608540f8f.50.1793010119803;
        Mon, 26 Oct 2026 03:21:59 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3932sm16762876f8f.18.2026.10.26.03.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:21:58 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wenbin Mei <wenbin.mei@mediatek.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 1/2] dt-bindings: mmc: mtk-sd: Document support for Airoha AN7581 SoC
Date: Mon, 26 Oct 2026 11:21:36 +0100
Message-ID: <20261026102138.36786-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_032201_959270_E0606B76 
X-CRM114-Status: GOOD (  10.30  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add dedicated compatible for Airoha AN7581 SoC integrated MMC controller.
The MMC controller is based on the MT7988 with the difference that it does
have a single clock controlling it.

Add the dedicated compatible to describe the 2 register requirement and
permit to define only 2 clock (the main one and a fixed clock for HS)

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index a4d032224dce..49ad2a8a390d 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -14,6 +14,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - airoha,an7581-mmc
           - mediatek,mt2701-mmc
           - mediatek,mt2712-mmc
           - mediatek,mt6779-mmc
@@ -238,6 +239,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - airoha,an7581-mmc
               - mediatek,mt7986-mmc
               - mediatek,mt7988-mmc
               - mediatek,mt8183-mmc
-- 
2.55.0


