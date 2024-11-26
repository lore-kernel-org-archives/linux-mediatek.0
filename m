Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FA8D59D90
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2024 10:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w9WF3O3Q9CqJ+jQNAGLBDdeZMuKGc8yveqCJFxa21hM=; b=1bfI93LfXjD6sPuUwDiQj4tkjS
	zMQyO1YN8slKlJaEWiFPAO0e7RKFpfCHiCmAyzUbCX56OXoLcm13ObqiNBRL1sPt3L2iYSjZgdEVy
	e4tyRbPUOAZyIFuILnFH3twP1Egzb9IHMh/ZOWtOTBwGxAHjsQ2o0hpHrT5AN/dSGydmxpvTFjspP
	JsCC0Uzr1YV+MT2kqkYqnNX8WYCNYIHwHecJI7ps4GBpmZ86TqWIAYOg2CpyLJWa7c9isQeW/HSy1
	Ygy78HmZnDyZmPy/mSS5kP6D87GyGnHNIRbZmU5/7UHJvsLOL18IRxh09t5B5qUh5RvvCeod4lqzN
	5ZZA4pwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFsvv-0000000AJxt-2tqv;
	Tue, 26 Nov 2024 10:36:39 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFsvt-0000000AJwf-1WAf
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Nov 2024 10:36:38 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2ffc1009a06so30661911fa.2
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Nov 2024 02:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732617395; x=1733222195; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w9WF3O3Q9CqJ+jQNAGLBDdeZMuKGc8yveqCJFxa21hM=;
        b=EJMmbCHZ4ira8P/UaldYrpZHS4Q/Knhm8jxJo7Ib0McbF6e5AXrVihH27aD72GjSCZ
         GaG/NrzmajkjIel3yuiFtAPDox+0mnpshuKMofXdHx5ZIjKQN/+yx+r4Ft0orsXoAORo
         8SlNbA/uuL0u1/7+WcHq/cxrqoGWIp2ZpCcWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732617395; x=1733222195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w9WF3O3Q9CqJ+jQNAGLBDdeZMuKGc8yveqCJFxa21hM=;
        b=ERfkHgk9XTXEU7UspXSLdCfNCT2dQnvPxeHwS6NW5pm1f59LyDi1jRwLZAvNaOYErF
         e/q0ogh/XwW+rHmqnOtihflm8f1kBv6vDk3+WlsyIxkLWoHO8wPujErzXzrhNYaOF5Ls
         Zpb0gXWFX5cmYDONL8JZ54/csDG8K9abGUL/F3sNEuaqskaxQfeO4jxyY5JM/8jnEBxO
         vSoADcDax10MlNITciycfNvcAowLbimChil6xOy1xyfNVntYm7lPbVenXsVvejEnSC/G
         liA6xL0mxvNWf5+YzHyvJK4lzxO1Z8USg3d0BdLBV/l843+q840skg4561pPrFScFGYb
         DOaw==
X-Forwarded-Encrypted: i=1; AJvYcCXXdlcKeQt4+yzP57QMApPWqFygtcoMf8b8qPu7gfwPrq2iICXRUJCLs3pyHY4a5BqqB4W2JASrsQSvr43NCg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwqBZHs1QriQHisZlEiKl9UFKjNFIXqJTlR1e/Z9IYaXAPVjWAc
	BytCQ2JpjG0C0FrphWxAJK88yAXqjITz7Rz+BBN1R6gYSvvW/OhsVLA4hcfyGA==
X-Gm-Gg: ASbGncuB5DbhcNyQ6RkumdRqi00YtgfEJ1Tx6EsrjLYf32GvoyaUwnHmcxAw1ZJX9+k
	QiVaxjokQUhXLq0SLmIooQoaCg+YRNSqbQL2gOCVQFG/X4G5OkEfUUsvHVneeOQtkz15m3NPi/u
	K8QGwXh8gPjRDIEqTVLrZTGG8QOVM8h7FqkSQrKZzQdN0RQAYirippaYK2Fsz3HPhBevq4tWqMk
	B8dPsjH7cefy9P1XdXjsPC6WcuZLbEMsMyA2fKtpgPCFX0m4KkvOie5NdHbsuSsN/lCMpNPxPpX
	43Y2/Q22
X-Google-Smtp-Source: AGHT+IHUd82WHFzG3Ngfmo9+Qx0VDQrc7wt1+aqc5AYj5jle85lRZhKtCbEOP9pPHyNo7rQmWMAmcA==
X-Received: by 2002:a05:651c:54f:b0:2f0:27da:6864 with SMTP id 38308e7fff4ca-2ffa711f902mr117712941fa.17.1732617395232;
        Tue, 26 Nov 2024 02:36:35 -0800 (PST)
Received: from localhost (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-aa50b5b6e9dsm578926866b.172.2024.11.26.02.36.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 02:36:34 -0800 (PST)
From: Wojciech Macek <wmacek@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Rafal Milecki <rafal@milecki.pl>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Wojciech Macek <wmacek@chromium.org>
Subject: [PATCH v3 0/2] Add support for Starmie Chromebooks
Date: Tue, 26 Nov 2024 10:36:30 +0000
Message-ID: <20241126103632.419469-1-wmacek@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_023637_417167_0A972502 
X-CRM114-Status: GOOD (  10.54  )
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

Add an entry for the MT8186 based Starmie Chromebooks, also known as the
ASUS Chromebook Enterprise CM30 Detachable (CM3001). The device is
a tablet style chromebook.

Wojciech Macek (2):
  dt-bindings: arm: mediatek: Add MT8186 Starmie Chromebooks
  arm64: dts: mediatek: mt8186: Add Starmie device

 .../devicetree/bindings/arm/mediatek.yaml     |  13 +
 arch/arm64/boot/dts/mediatek/Makefile         |   2 +
 .../mediatek/mt8186-corsola-starmie-sku0.dts  |  31 ++
 .../mediatek/mt8186-corsola-starmie-sku1.dts  |  31 ++
 .../dts/mediatek/mt8186-corsola-starmie.dtsi  | 465 ++++++++++++++++++
 5 files changed, 542 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie.dtsi

-- 
2.47.0.338.g60cca15819-goog


