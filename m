Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E242E606A324
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2026 21:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=po9VVxwh;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RzEQNVVe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=AqZ+Q6+JQOnxenc3GUY9TdYd5SGi7vhfYzorexaHK30=; b=po9VVxwhHi5KFohcQPW3oXKsMv
	u0PJ8zeoIhLH9Crw48LsGyu2tusBHeHOgdcgkiWe0aAmEbKHRpuKQ4UMPqitfDxgQfWxexfHifi8G
	qqA3Wszuhjj+7zgusxBvj0qQRNXuL1Cy1pq3z76LHgUKiYkunscjtjhJktzdls1FnXRp3z6m5CPFY
	EIb4R+t0stmYseBShlQjEw2sGTyDdrR9QclnPBBWprT+y/crQckYHxDdb4MHHxrCOvKhIk5aEYVnS
	V03lZrkbTZIn1fhUN2ZPWZ4+FM71EFp7TpaPVk7lXPkNObAoWdCGQyxEYnoPy8f+WYcFTFf4CK5P/
	YhfgRfaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOLhf-00000003f3W-0PVW;
	Tue, 03 Nov 2026 21:05:59 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOLhc-00000003f2C-3wtx
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Nov 2026 21:05:58 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48afbd2c386so14283f8f.3
        for <linux-mediatek@lists.infradead.org>; Tue, 03 Nov 2026 13:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793739955; x=1794344755; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AqZ+Q6+JQOnxenc3GUY9TdYd5SGi7vhfYzorexaHK30=;
        b=RzEQNVVeKLogNiRGzBhk8p6ohiyw+SgJrSagtNB4A49UHrIReHmcwR0vp8KTPvNb2N
         oG2fLHYY/GvVvVf9qzwfkBIg2P7qESeYrJN+CeoLSsDdYUrCwN8Az/Ne/MezXINapVgt
         N5DInOUvX1Bzmj2Gj8PLxwgnz8mdoI7H1fvKHrPc+gVU4F0OhLHgupZF5hqxyTY77OOZ
         Ix0xpKqhuQGpUS0E8yw+LuNP9OMU97QHwK2V9k5GU4xJZxsmfW2poozKf5SkDdRDbtUs
         aN6GhgB27o2INswxqHvRtwK/9d2EAon6zFQAQaDIvrBmvwUDKkINBJfRlVK1kdIwLcC+
         peeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793739955; x=1794344755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AqZ+Q6+JQOnxenc3GUY9TdYd5SGi7vhfYzorexaHK30=;
        b=na5Rbe8k/+rGjmawLt2S0QlQtokB/Xm3ckH+mQpQqGbkazwxxpoUvqIXSalhpHDkCz
         DDtSUOnGaepFFIBGxXQH5eLoJZyfnzXl3pWlK8jMp4gH/jXi6aqKXA0QV1FEAufd1lG1
         3frlHpig3jxDXKxHluunVgvlVhAfuTqAAOWCWHw3qLNlHHbOBrW/kFU2Qix5n4ArTJzg
         JdsHvdyN7UMk4rWDHeA0hUi0SIft6Ylt6IUc9kn8UFhCObrOzac+rOMCt48yasYpHbrR
         IkKzte/cqAuKHhziGnj4h19+aDT9tUaFsR5GaN1avIRaIk1idAkcoaEc2EsXDFnGewIP
         jpQg==
X-Forwarded-Encrypted: i=1; AKwUvBxb6RlcqW58CzL+u/wzWjrd53u0FYMudK/2MWX3CE5ixCd7yc/69JLpqnc/IM6Z+AjL4B9VLjhCmJnclF7WeQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9jWnQjtRs+Q3haQGxJZ3YyfjARnKRxseg6/EgLFMDY6dX20tZB
	mBevTrvHPWaP7LHqiaxCC7hTkT2lzoUie7agSgnt3ZJ9YBb5qt/ans8NVT167w==
X-Gm-Gg: AYBFou35Bmbg2cxN/wKJRUCjWr7vi11ROVvzCY0ARzVmOz2ohMqDCOHJI3P8Sa974+O
	goMz5Da/l9QF3KbshjFdZcbiyRFR5Gq+GIjvxgxerfSgz+GM8TPl5YKQnvafCkVOBJSHAfRCBBM
	zhFJg+9VwaSTZAc9BVU/yeSpDKi/1Uu9CDOXkrJ/LZyEtNO4LaefgCZ3QzEC/fkg/ppASZFAuCH
	5QSpcMsIHZAk0yGhuZBFy9FFHhjodxjLjwThyCVbAnK4IvJvAFLQ82dBruBer0h02/aNo3mC3c0
	ExKiO1iXrnTAgN8FL2MPSWqD+mACD1+dvSJ2Tyv0QP314+Vq4Q6F3eZAvrmQH3HfuAVi0MISxLC
	9oVEb+bwWlh4o/j/w5lMPqJsNdz7kAV7PUMmg8VBMSlPtDqOCCUUPZGqXo7SQp+4OixPPK54YNh
	LKmWXhJqDBAPhQDk3INl1JP+o+4257acPmxh+xVQL0atpxAX3Xj6X+NnhTCFdVYhl7Vk8KWBQaI
	wPyD+mdc63wOXo80/CJfbXiMHijfRn95/6s5RPn1gNfY/+13rCGuG+Zk5H0qMC7Q8iMb9gz7UJk
	agHpiptO4GHN0qUz6JIM+dCkYOCn9uxgE2UbkSgSg3yGeg51Skxz23LsG0XaQisXo9zOk7QTPPR
	8uN4Rk4MFiX4TZjMFUi91Vffb2bf0sx6S29YIo7/0yoBWF6Cquv2kqCI=
X-Received: by 2002:a05:6000:29d6:b0:48e:3fc:e393 with SMTP id ffacd0b85a97d-48e6e2c2f66mr20419511f8f.6.1793739954927;
        Tue, 03 Nov 2026 13:05:54 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48fed553441sm41850f8f.43.2026.11.03.13.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:05:53 -0800 (PST)
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
Subject: [PATCH v3 1/2] dt-bindings: i2c: mt7621: Document an7581 compatible
Date: Tue,  3 Nov 2026 22:05:40 +0100
Message-ID: <20261103210542.15965-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_130556_995437_2AEA60ED 
X-CRM114-Status: GOOD (  10.25  )
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

Add a dedicated compatible for the Airoha AN7581 SoC to account for this
minor bit variant.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes v3:
- Fix typo for account
Changes v2:
- Add ACK tag

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


