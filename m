Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F1CCD4F54
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 May 2026 22:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pqcbLvgzPg/aacFxA3Sf3HYOKcvPcXokYWVGRv6DhFQ=; b=x7UvHlB7zF6RwEy3WmZfIGjCYg
	XpEQJj12z4ZFG5bEJv4CCCwcs158vz6gYszbsi8gw1Mci95IRWFApXdxEzJ+8+W976linESZDTllR
	HKPlW1UgEwm7VOLVPIDzSe1YOR+JLsBWFEHGgGwvaAU4HyXQuEdU2tIjt8H/JoD0jIW0Aj2CGI7Dj
	zl1TDXd5cKeoKFpghyLXVNX5nZ0fF5+ysQjtUD5NQIwe0HcqMXI+Cph9FuaQhmImvqqK5+CLhuvt1
	JxzW2Rpyp/WCZV83slWzBTw5WgWlGh2+Lw+OGtToIbtd8WSS1PYlKSUufy/LxngnPn2oN+KRJFhrd
	cbENxaMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPSzu-00000002xxm-12zN;
	Tue, 19 May 2026 22:33:10 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPSzs-00000002xw0-12V3
	for linux-mediatek@lists.infradead.org;
	Tue, 19 May 2026 22:33:09 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4891b0786beso28810085e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 19 May 2026 15:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779229986; x=1779834786; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pqcbLvgzPg/aacFxA3Sf3HYOKcvPcXokYWVGRv6DhFQ=;
        b=PaglNPmeSvsif/5jGfFP3PZi/b5ryuWZ2RGZOHuwHffxuGnbrSQXt69z9qqyyeovKr
         278FDBYzaBC2JZ6BtqqsXLdXJRgrV/C9iJAOddfp79LGYjgGQUqubdyjtRaz2plusTQJ
         FwYkYPQASf6u19aMZNRGWlsTiyK0R76guTTncjQi0URDmZIBsGJ2MZO/s4V90udJQpWy
         AnEFteBHx8vytWJ62QcztjHQf3X8WSJO2Tnx60d5BpctmbJqxTg2TX8pZ5IVdogXkmNC
         GVVs8RrzavhntJN6E/TfLwpOjBaf4CPSE+++JtstTbRC47w9ShPP+L1532N6vZEn858s
         mUnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779229986; x=1779834786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqcbLvgzPg/aacFxA3Sf3HYOKcvPcXokYWVGRv6DhFQ=;
        b=maEW1HzFthXE9W3KCMU/zqDY3laD55QqM9U6C0S8afI9vt1yyvVI0RMNKP3KN5/hu1
         sx76MS0Mt55SliUYcvVL1FNgVbkCg9WfIRYoooRd2pzZ/ohYHLL61oY4Q9bpZXnPqBMG
         7mkOSd/Z/4d26p6tS353/FNZo9v0SheIiyQ9eiClxsjO8vLQqVW2hNBX+gSqUIABqpwU
         FQMgOeK3C6vwVfcixfp+k51I8SG7cyIqtQum7WIVRIyoOElcQGkooLVkcTfNwDfeadLb
         sD0WuHEWSS6fI9ZDaTDCPJXf5Zl1EnRKbs8q01vKnTsyWx/ip7Molp/dVtrRL8CjEs0z
         YmkA==
X-Forwarded-Encrypted: i=1; AFNElJ9T04vWQcdg1NkRyREp68lJLCZ8Zg+XC5BsjaTmOuQv4hkOQne7j7Cp0JBJqAt/Y8G4zqtCnpvNNWNC/e5CdA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxASvfbXVoyNJFWvBTOf+uYAQDg9uzp5dRTpL2kWHG2DvFL1eZ+
	8QKJGjdaMRWAh2hh7rQTM+3aLwOhfcCia1Lr59l+Mf0f68SiRpugjO6M
X-Gm-Gg: Acq92OEGkgroZLE0b0FOAlqdRqBi+Al7MT3t6+WtZ9WAUpseXMyU/Ow/x+PAsk46S3C
	uMW3hIiH2HTQnBCu0ITETsOrJXJPk9HiHgErZA5NRAdHgYMQY+rSXuMuw3APmfGeihr3qCcJFGl
	YjL3AJqGAWMH5fZ1EY3rr8B4PFRfYLazYCNKMTxMAHEMTjUHRrnrMNKVxUFmmnZzunWduaDRJT3
	fYJJAG5aTmeK0jrJyrhQ9S6VWpygTqZfHOJV4QdVrcPRbgCj8hTsW2cmwHQWzGSn/I7YySl37H0
	fZBx1L74mRytIzkgjQp7Wu0NV/thhbUuYXtrp/czRloBVvmAHfTHm5s2RU6Vf8ry3uUiQXNnQOA
	B6pPve22kcTvXsMZE36Xt5Rev1DTiQhFqMrmSdwfdDCYFYKItpr67LrAT7BnbfVmFihusADkkpn
	bE7OBH8xr7syLZtoOef5y4PGlfyvr/sRvV8nSnycuQSQb5x6tj1akivyY4QxNC7ppnuh84uK4=
X-Received: by 2002:a05:600c:4e47:b0:48f:d835:e0ff with SMTP id 5b1f17b1804b1-48fe63265a1mr361523155e9.17.1779229986180;
        Tue, 19 May 2026 15:33:06 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-55-252-101.retail.telecomitalia.it. [82.55.252.101])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48fe4c88495sm346659955e9.4.2026.05.19.15.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 15:33:05 -0700 (PDT)
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
Subject: [PATCH v3 0/5] i2c: mt7621: improve support for Airoha
Date: Wed, 20 May 2026 00:32:42 +0200
Message-ID: <20260519223253.1093-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_153308_289871_1C4F2B3D 
X-CRM114-Status: UNSURE (   9.53  )
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

This small series improve support for Airoha SoC that use the
same MT7621 implementation. Some additional tweak are required
to better support it.

Also we add support for atomic variant of .xfer required for
some attached pheriperals on the Airoha SoC.

Changes v3:
- Rebase on top of linux-next
Changes v2:
- Fix compatible order for schema patch

Christian Marangi (5):
  i2c: mt7621: rework cmd/wait OPs to support atomic afer variant
  i2c: mt7621: clear pending interrupt on i2c reset
  dt-bindings: i2c: mt7621: Document an7581 compatible
  i2c: mt7621: limit SCL_STRETCH only to Mediatek SoC
  i2c: mt7621: make device reset optional

Christian Marangi (5):
  i2c: mt7621: rework cmd/wait OPs to support atomic afer variant
  i2c: mt7621: clear pending interrupt on i2c reset
  dt-bindings: i2c: mt7621: Document an7581 compatible
  i2c: mt7621: limit SCL_STRETCH only to Mediatek SoC
  i2c: mt7621: make device reset optional

 .../bindings/i2c/mediatek,mt7621-i2c.yaml     | 14 +++-
 drivers/i2c/busses/i2c-mt7621.c               | 70 +++++++++++++------
 2 files changed, 62 insertions(+), 22 deletions(-)

-- 
2.53.0


