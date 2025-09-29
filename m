Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02163CAC5B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Sep 2025 11:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eYKIS6AUB4jbN6LRMHpfAVlAKJeZBTFDpfK2oWN9FEQ=; b=AuZsZf7lp1brxpx4aAmcfokuQG
	XDZ55G8ryl/0QJcnPqSqcm1rhrZygtHfUcHgJdkZC7v9EPgnZVy+AyTBAR6O4PiN7ncLsBbzws9Ba
	ZHZ0F+8rTtC2r2I+UkGtYZj6R4aj5SPXMuVtYAITOX15JfsZ60ZnzxKaJWtp8z3ec+XkqunCISX4R
	MYLaHTgm0XL/yQheym0EqPDHAlw+EPmxggiljOAEXupPrWgMDpJlrvwoEwzUWeIMndAU0I0AgNrnd
	ub/UJDYo+d51AqinHRzkolpsulbhumxMA87qmU6cpP9syEgM8dadIH+6nFGYUwRrzbTjYb8yuEnJ0
	gFsELtmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3CNq-00000002ObR-0XLT;
	Mon, 29 Sep 2025 11:49:34 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3CNk-00000002OXR-2zkv
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Sep 2025 11:49:30 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-46e37d10ed2so43575905e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Sep 2025 04:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759146567; x=1759751367; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eYKIS6AUB4jbN6LRMHpfAVlAKJeZBTFDpfK2oWN9FEQ=;
        b=H7GTstg0lkiugMuFPHkNJG9/v/nXxkN3IrowTRr41SlIkt92Crnqxxn3Y1No2h3k/s
         DrDxQnkkCyy+vYO06MHE7TkDI/kOTgemnZUQqcz4R0vmlKEdfXiIdm6muye5rrybPfp7
         momq0GWgbRAytfofmYIGO3I4c9NPdicCsLvgQt00oqtvy7GFSCSh6ry2eMtC+OI0CMbS
         wq0Yo3kCjcl+ekMeR8ybDU1Sm7rNDAV1KmKYx1h3SZmaDSyhdf6bgDjqtK9h4ftuuJZ1
         yAIYhF+VH9a1hBO48BlOg99B4Oa+WR1APgzXED0M4SO49O0jqLu3W6TJPjS3NqK9OrlZ
         0Kbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759146567; x=1759751367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eYKIS6AUB4jbN6LRMHpfAVlAKJeZBTFDpfK2oWN9FEQ=;
        b=Z51+HYorJn4qeREsq5OcgBSbvSkSleF20WH04nbKspvu7YlR0qoUTQ4Jvaslyesn8/
         8CliRr4RAj6ZebneIAB/TEToO8vZIjD26U5O8zCyHVYR+c+yGxgmUlTeqjAY+d6lQQxJ
         adHLR9wP225x4JcMWygWXzOtPjC6JZyPsyQjN6sZ1G+dhOHUhaqGzpYUwhggxvqJLWaM
         llFRG8koIq0mZSMkWxlT2L1w64APGs3MBvJMpdpAlOOTE3QagHqO5qEyuwehauKaRJKg
         5SypZlHHQdPJz3xm3lRvGo3yAm3SMPTW/UXfZgquzFPkCLMPRDG9/gAs6cBBk6iV+TQ/
         6FaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYOcVEgqIWtM2bDEPNbWPbfOzH+dtpUsfaU43k+Pa8wAY4qzA1HvQNT5wbiN4PNILvi8vlv0pKviwmPvtFhw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxJDX7U51i9KjI1pKzh982DDybtzpfFWDnKAMLSliJbxXkxXaqy
	8auEa2wJjZcv9Zf3TQwCuV4XJ6sJkdBNjLxVNfUUfDtd6zDJPtS+myUn
X-Gm-Gg: ASbGnctJprk8nihXt3LIIvOZFZHhE6x7JJl53h8aGfY0KsfZ0x9rzhF5Ks41Mz9W/4V
	fDENlfcx0DBX9iUlb5xXNNpFpyI3E5sRdmABcIiz6GBEk8uxu665G8v4T9BzfDmXwWgAcsYk6O+
	I401Zn6pfgEj6PAxexxjtfhE87DogK0gh6cZu6ZpaFrKBL3YupLwBGQQbU3FJ89ZSfKo2qfE6Tw
	awsQqZcSmrRCOw4oNR/y1muPJ1XqtNVwvC02soTmpoOz3iNB7J9fpmUQp1tqEi43bonXl6+6pbr
	ICPr4Ddrj8qd/JMgj6xdu1qbSrCg/fAV2PIWu4qlYt77w3sSWLK+l6f7sgAAJ4t+6iYhBy46S8i
	WzVKaTnmyPWvxLB6N8jqcYg0sWzJkWw81RIxqjW3ZnuIqbiUT5emy1nGLTOtwaysMOI0cH+A=
X-Google-Smtp-Source: AGHT+IGuqXMPmewneHZfTKdYco1M53FvKmmiliFcGFMcT7OaxUtdD6+QR3/I0y4H9RP2qzHFLrfHpg==
X-Received: by 2002:a05:600c:468a:b0:46e:4705:4958 with SMTP id 5b1f17b1804b1-46e47054a6fmr69438625e9.30.1759146566851;
        Mon, 29 Sep 2025 04:49:26 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46e56f77956sm10030835e9.20.2025.09.29.04.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 04:49:25 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 1/4] dt-bindings: crypto: Add support for Airoha AN7583 SoC
Date: Mon, 29 Sep 2025 13:49:12 +0200
Message-ID: <20250929114917.5501-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929114917.5501-1-ansuelsmth@gmail.com>
References: <20250929114917.5501-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_044928_778225_C3B655F5 
X-CRM114-Status: UNSURE (   9.93  )
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

Add compatible for Airoha AN7583 SoC. The implementation is exactly the
same of Airoha EN7581 hence we add the compatible in addition to EN7581
ones.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/crypto/inside-secure,safexcel-eip93.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
index 997bf9717f9e..2269d78a4a80 100644
--- a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
+++ b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
@@ -30,6 +30,10 @@ description: |
 properties:
   compatible:
     oneOf:
+      - items:
+          - const: airoha,an7583-eip93
+          - const: airoha,en7581-eip93
+          - const: inside-secure,safexcel-eip93ies
       - items:
           - const: airoha,en7581-eip93
           - const: inside-secure,safexcel-eip93ies
-- 
2.51.0


