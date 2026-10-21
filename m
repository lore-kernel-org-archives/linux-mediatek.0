Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9481F606A329
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2026 15:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fmes3SCM;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kKuObP6e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C4B42IGcjj02HwNf34eRwrJxmCqj0YjAetyw+WBTjes=; b=fmes3SCMm8oSPPdhl6zWt5NtKi
	9qemyvvWteFTFq3wVtFl+n0OdqpyrScfScVD5FsvSNq+UWV3rYw4Qp2O7/Te9U8/WR/SsKlTz2hLE
	F2tfo0VHnc9GQgf/HYOUTDmxpiTBd+VHkKgTUTda4xAkLypQYGOPijkMZxLQNfGm/GmSkZr6zsgBs
	LRXzs5/uYMp271nIfCRtUW3dKM/k/mT0SGE8Ujs/R7O8v4SR0KxX02SyR4oIE3/69hd0urhFjTz8h
	em/sfOGrSkPW+48wxidDBonjxtZ+CusMaS8OHDV2PNq9RIHnjF4jS7oeA2CrYomG9jysN1gvmU8qf
	DrDlp/fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJYQA-0000000CHoV-2Xiw;
	Wed, 21 Oct 2026 15:40:06 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJYQ7-0000000CHmQ-388s
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Oct 2026 15:40:05 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a1dec056ddso5636615e9.1
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Oct 2026 08:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792597201; x=1793202001; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C4B42IGcjj02HwNf34eRwrJxmCqj0YjAetyw+WBTjes=;
        b=kKuObP6erUurPn83F6yHLn8rYkKLGP6K2mYmwsYPzXkq7WGB58DULzSjseqYdcPdB+
         nC2Gh2T3BVnqkf+ug9r788KibR7EN/mHvF1idla1Uo0+Ba3cpcex8hRDRjt+xCfMsLQl
         oNlV9CjzVbi04Dz8dxFjcUJOcB40IgrOPCIrklGz67tqAue3FDirgxV1pwjJNqWvwuq3
         qzjTGrTV1o33huC61NuivG8vuK0ltPYnDdgGjV/Gl54F2LsPsdZBSYq8DxQgcd0dZHJU
         D9XwFjF5xImGuQ5qxyMzO1dJmun7T009hgL54RHp/9Jh8HcrNHX2cMLGh7D6SNfv4ZFY
         9+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792597201; x=1793202001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C4B42IGcjj02HwNf34eRwrJxmCqj0YjAetyw+WBTjes=;
        b=BsSmmMCqLYh0lec3XRKG0lfLd0/jAexlLn3hAXl2HN5eiGuVZoboH9m0lcz8fMZHxn
         IXaUpzZw5CktZTQc2HLy3l8980vCRsB4KkVfUCNHh9TSoWRXZ3rRMbPhlvSleukgl4Sv
         iQ3O8L2W4BO6w+U/d0g5hr6FAkR9oIlfJwWF2zAoV7ybwhALT7rk07lzuO6IUFi470QG
         I/OwmI0nwJHxWmqE4hdkgSILjnNJ/3jE147WE7CeZEuN/ssiq2cONCCQLZjFpoh8HTDu
         d4FgHeuI61C8mwdAIV1ToEgo/6ZlFZre9AZUgWhiffwLfd/tc2SBPCqnxLvr10J4uPBb
         XS9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxWtWmvjgqPlm0LHv5xg/4A3c/ok/OZE4BzagJdX2xaLp7QS0PiIO2CyVLeDTY3EInlepI4jhVlK7WY7okcKA==@lists.infradead.org
X-Gm-Message-State: AFq9FYIb5lKSmmxr/OSZr2oyvIhI/TIXc4Fdy8ztPEr113VKbVIgOkTv
	43SBKp2QALfDFUghAkRStZRE0n3Cd48LclqDpfgOFP3XTzI4fHIyo4Fi
X-Gm-Gg: AYBFou3XNkc2QrEjg5jR+jg6L1UwrKKBaDiOKZPvKa1YoxV/78U2R8gf8ZzvrJZHRMh
	G3TluGzTKc0DV4ajN4BBD2NPnSgIqoELUTw4rabs8+nRAk5et1OSAA6H0OCl3Yxlpi/1j0EYgFh
	0bYitfBJhVh+MrT1OawYOXwS7lA38Hi27d824vzOTwTInXeHsNuYYGWgFvWLxMWeClS5EjWlY3H
	pXyae6jYQupyELnbyE5VqoEnyDKG2tXDpYQxVBmOCKwJWC/gAs7kTDGlqy47GhW8rRR2PklcyME
	eDFuwtVCwV4PZA3Slnm24ASOd7bk/5TDwkaS2j+gcLjtbmZtJyVvxELqNiL2msZoXMUZcm1W2ig
	kOkazJTHRKP53nZtS425QvBmBmKi0/BsH7nmzEQJ57aPNS7m8d83tvQWCkc047u2dTi1thTVHrU
	k6r25htwQ0Kh3tciIAIVYSz94LYoyV6lZ9hKJt6/rLWwt6nxOuWqQ2NXCV77EsUp6T/VGfSbayp
	Q67jgvyzY1PE4N99yQUWVQ42gACEtwbZ/l1khCyOSzq/sinVlf0qXqdCnkt7wawbPnYsvfMCpOo
	U6/NoUlQLFEiX69caPcWQvk0wLVOtKGSdn93GARxlV4cqo+qxMPDZ9ZsSzKi
X-Received: by 2002:a7b:ce82:0:b0:4a1:7ec7:a479 with SMTP id 5b1f17b1804b1-4a1fdd22b0dmr39355265e9.33.1792597200529;
        Wed, 21 Oct 2026 08:40:00 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd70027sm27793675e9.0.2026.10.21.08.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:39:59 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 1/2] dt-bindings: i2c: mt7621: Document an7581 compatible
Date: Wed, 21 Oct 2026 17:39:51 +0200
Message-ID: <20261021153953.285222-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_084003_797642_9634E0B3 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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

Airoha SoC implement the same Mediatek logic for I2C bus with the only
difference of not having SCL_STRETCH bit.

Add a dedicated compatible for the Airoha AN7581 SoC to abbount for this
minor bit variant.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml b/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
index 118ec00fc190..e6ea5bc1c681 100644
--- a/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
@@ -14,7 +14,9 @@ allOf:
 
 properties:
   compatible:
-    const: mediatek,mt7621-i2c
+    enum:
+      - airoha,an7581-i2c
+      - mediatek,mt7621-i2c
 
   reg:
     maxItems: 1
-- 
2.55.0


