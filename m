Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 462C2CD5BA4
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 May 2026 22:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZNDI0lLPNRldsjOACKAWSwRc2mbScMYD4jMMM2OXl2o=; b=Nb9ufODiSLvcRApGrixHCaO2BJ
	aDNYfwAiVGhUz/Bkfsmr8+vqPgION3zyc9hzKM2bRVbIpQM0QJUWCw7InGdftDdhz693MMi7R6LuJ
	LZFrEAA6an+fXcDL9lnuk27eQHOE8TKlpy7ViZWkQEyVdYGNaZdONm7w44aDTfk2B7v/SVUDFHuNv
	mS0xbemXh8JWFozklYqRUlJaDd5+x78NaNvH1X61BheyU3/AuPxD/JsbP+EQ0Gs972fSE3m2wMsc1
	5/Cai0INjWBL6ZjOtPLRErYsxnO5xshenO78CB8EyqD3HEkrgKULwcMTd1wCPtTgQreWLjWB9eKFD
	A9++A19A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPT05-00000002y9H-0yia;
	Tue, 19 May 2026 22:33:21 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPT00-00000002y2L-2fMt
	for linux-mediatek@lists.infradead.org;
	Tue, 19 May 2026 22:33:17 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-44e1860558fso2561481f8f.0
        for <linux-mediatek@lists.infradead.org>; Tue, 19 May 2026 15:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779229994; x=1779834794; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNDI0lLPNRldsjOACKAWSwRc2mbScMYD4jMMM2OXl2o=;
        b=ikaNCtpuFMZc/2Q+BUtvIGKdtSt/sE0NYtz84krslUFBoeNP9SDgvZFEL75aIbx0mc
         ehzdtqfTLKSo0OtxME1TVSTe7mm0P++rxgQ2pbLb0lFmpbX5gMoizeNFVT4EQWN9vn9A
         A3djALA0i9baOPyapSS7dDw0PpPveIBOCvtYQbUxgdGQfWoHmhw12ANIBtorB1qBix6v
         2QMXx8igF7x+44OEbKJNWV7hL5ukrKCwv2qtpbzOR6H4jxWvmAC13qrLfFduCdbgn/+S
         fM/wvb5DXHmq1V6UIdJASqib8KVKTRSTblKPVT+ozFY0dORGB35gi+dKK4BVQmnU6BRA
         A3+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779229994; x=1779834794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZNDI0lLPNRldsjOACKAWSwRc2mbScMYD4jMMM2OXl2o=;
        b=CQ3QTSTCeRHpndhtPNePha4kFrrlaW95nJdxor3Z8Yq7PpWPgMABNyFfDVUE7/cd73
         jk0tBYN+rSGQw3o64bqnfnEEkiNIhXF/g9UTL8rWq/WV6SoK7ZbenaPsgVvOgrtbxYZf
         8hihYQ55ZLkIre+IlDJoauofYG9B0GDxVYXMWWkB1rgT4Ayy/2gKZicj6YLpDvTneibI
         CcCNE98mUs5Adziyy+sKmQz6dz1kXkznHWQJ6apR9but2oeHVEkS3xMKBy6SJmePKk25
         fkJBr/ykRmfSEQHL8DMj6N6ipzrx90gm9Yir7hYwFf8TGHu9t6JIEt3yBOunFCvXhtM+
         IuNg==
X-Forwarded-Encrypted: i=1; AFNElJ/24BOIPv3f00fG1Vp6iHWTon6XnOSgNN0lnMgZsFMFRawF+YToktVZRq9fFY451N9VQXqIAvDA4GT7lTpH1g==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywi1hPaHjPJ0r4rAH7MwYwNxsmY4ZK7zWLYoDBaduaqFJJYm50V
	DbGoC+rbFhG0Wcuf4VMImqoYgZj5rvgi5bomM48jIbQ8lU41SsQtNCrW
X-Gm-Gg: Acq92OGla/X5RJIhhsMG9oE8lq8UfeWGdm/DS/NbeO+MhPSbYD5nHLjqLrJ6VFj/Kbo
	2ZHiv5Yc2jDAv+TgZJxsgCpnGrYY7whqn7vDEdiz6Xf2jPyEcJnC6RN902BB5UN/NLc1EIfkoMj
	0nkrunRDUJ0DPmIVWRHlAQtqpA0PVhtTpLsUYZAFltCb1hWpidr/LG21T5RM9OLWXRgixd+xlfl
	X/A3wSOJz/BAOn6YipxxqQL4ghx1u0d4qb08k7ylQ6rQZ+cEHrlsz78CNSA1zNqZiWvnf97e4rp
	H1wOxkr3uVO7RzZ9qpTSYijsZRD4pXrhA4jaCVw6BFQBoy2Mr6S6X35mx4SlETnTlX0Z/wr3Rof
	CmpqZyELBacT+ZYqzc6rrNm06p6XEsa193KHHvNL89PckcE0F+BrO61td23dqtQxHoDPwN+Sxai
	FdyHqJJzSqze0wlGQkhI852mbpI4NbJA9aFEHYA7h1fmBCSwkfdkt1kpiztjyk04VFoTLFWrT6X
	0qmFyixlg==
X-Received: by 2002:a05:600c:310f:b0:48f:d346:e646 with SMTP id 5b1f17b1804b1-48fe60d5693mr310445495e9.10.1779229994584;
        Tue, 19 May 2026 15:33:14 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-55-252-101.retail.telecomitalia.it. [82.55.252.101])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48fe4c88495sm346659955e9.4.2026.05.19.15.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 15:33:14 -0700 (PDT)
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
Subject: [PATCH v3 5/5] i2c: mt7621: make device reset optional
Date: Wed, 20 May 2026 00:32:47 +0200
Message-ID: <20260519223253.1093-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519223253.1093-1-ansuelsmth@gmail.com>
References: <20260519223253.1093-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_153316_736666_49084AAD 
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

Airoha SoC that makes use of the same Mediatek I2C driver/logic doesn't
have reset line for I2C so use optional device_reset variant.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/i2c/busses/i2c-mt7621.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 3cde43c57a2b..fb9d9701bb10 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -91,7 +91,7 @@ static void mtk_i2c_reset(struct mtk_i2c *i2c)
 	u32 reg;
 	int ret;
 
-	ret = device_reset(i2c->adap.dev.parent);
+	ret = device_reset_optional(i2c->adap.dev.parent);
 	if (ret)
 		dev_err(i2c->dev, "I2C reset failed!\n");
 
-- 
2.53.0


