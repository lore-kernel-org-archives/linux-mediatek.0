Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1380C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 21:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v5991RrXScJhmv3IUMGcu52NKLks7Sr9R7RvijLy0Po=; b=g1xmQ725dxb3UrVAUUF1D0TOzp
	kwBRllUN+8FacZwsrNOVgYkgbW/5wGtdTFJb76vwOOefmTxBJM5zHUXXH1XRcj++WtVK0KVp0/qad
	+iBlTuF4G1AeoOKo1z9Z4vKktEZixIBh1n3f78Pg0GHt9lkRfx9WSJZv9QVzNHFCtsyCytJlPUT13
	0pP2H9MM8Qqxx9/70fBH2Vvn/tPyR/6mk+RtPjG+QtCoBaPCvf2tG9j1l1qnovbX80KOEIFi0vnTa
	uN6kOv3Ka2Pe+6QKkHVNUPlfeTlQTT4UbnKcKi3Y+f1l4HuGLChsbr4R/Oh7GU7BHOc1Apcd31Ygy
	LWT0ok+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqLW2-00EYl9-DU; Wed, 02 Nov 2022 21:43:18 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqLVr-00EYjJ-OY; Wed, 02 Nov 2022 21:43:09 +0000
Received: from notapiano.myfiosgateway.com (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BF48C660037C;
	Wed,  2 Nov 2022 21:43:03 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667425385;
	bh=I6k0VYTBtgXqylue8+whQkMj2wwlEM89xgbgwhw/Gmg=;
	h=From:To:Cc:Subject:Date:From;
	b=dFDgAJLbSFI9EOSca34tAKkHzdhLLdsf9vnQaR0Cj4ijTC5sqJoLsaeZn+rGY1jb6
	 U6X1C7odwcSRrtrUaMkS4wwAoXiiWuwbYXxswZBS/MoSVB7LY9AlgGvbNvMbSFTuU2
	 jjAuXo3zpDnwoHnrkdtpRg/0Q89AiQr17/T2VxqhPDyt2EmbR1c0wDcggEYth7R1Of
	 kyvmIb2DOC2+/uDdqom/3gfaKCs1wWZCun5vXp7ysr76L0n+OZaQ368qfxswpO6MDG
	 YqQkW5COIllOaScVlOUvE45dtf/EUl2TiKmOpPx/lY4/4OmmOb5jyIiVJ0y+z1V3qv
	 n0XRk4mlOJWjA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Rob Herring <robh+dt@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] docs: dt: writing-schema: Document usage of CHECK_DTBS make flag
Date: Wed,  2 Nov 2022 17:43:00 -0400
Message-Id: <20221102214300.309347-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_144308_062417_891FE31D 
X-CRM114-Status: GOOD (  12.17  )
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

It is possible to run checks on a Devicetree by passing the CHECK_DTBS
flag when building. This is a useful shortcut to the dtbs_check make
target since it avoids checking unrelated Devicetrees, which can take
some time and is unnecessary if no bindings were modified. Document it.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 Documentation/devicetree/bindings/writing-schema.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/writing-schema.rst b/Documentation/devicetree/bindings/writing-schema.rst
index 4a381d20f2b4..55ad556472b4 100644
--- a/Documentation/devicetree/bindings/writing-schema.rst
+++ b/Documentation/devicetree/bindings/writing-schema.rst
@@ -167,6 +167,13 @@ setting the ``DT_SCHEMA_FILES`` variable to a specific schema file or pattern.
     make dt_binding_check DT_SCHEMA_FILES=/gpio/
     make dtbs_check DT_SCHEMA_FILES=trivial-devices.yaml
 
+Note that ``make dtbs_check`` will validate every DT source file that is
+enabled. When making changes to a DT but not to the bindings, a possible
+shortcut to validate only the DT in question is to explicitly build it with
+the ``CHECK_DTBS`` flag enabled. For example::
+
+    make CHECK_DTBS=y mediatek/mt8192-evb.dtb
+
 
 json-schema Resources
 ---------------------
-- 
2.38.1


