Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88317C47258
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jan 2024 08:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e5IbYX72GKDgKEeebQF3JWpFaouRh1FyJnCJ8FxmRXQ=; b=mLTWCRlddQVvjdun63D1Rh+tYs
	m20vjeFkDbb9IhjwuKrck25yuWTVXnsmp0c5AJlHYVPXx3ujNegZR8E723Scz5UKsOHyTIoNX49/6
	PAKH0QMMhBpkRjp5kF0PKUkHx0MTGZ36w2r3RK3CVw+TmRR56cTdqEtiFu0sqgA4ubjFgPd9cOc43
	MWgohFAcIK7LWh2lBziU/81I7Xi6NTSGeobuAzKP3afS9aY01RXlYjz4h8ZFCqQR1u6gFmHQ8zk91
	Xwe/rq55Sa4zD9t2f+3LAHXUIfwHS7QGFdrtNp24W2R65OgJ8QWzQHG/VM8tQR45QsUsX16hrShdj
	U3pCqd5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSC2X-00FWbO-0J;
	Tue, 23 Jan 2024 08:21:49 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSC2T-00FWZD-1g;
	Tue, 23 Jan 2024 08:21:46 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50eabbc3dccso4930309e87.2;
        Tue, 23 Jan 2024 00:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705998101; x=1706602901; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e5IbYX72GKDgKEeebQF3JWpFaouRh1FyJnCJ8FxmRXQ=;
        b=h62eaAedDCEx89my+4F8JKuJgQlMFWQeP2dMQFjrjYdz7yHjbRu24W8xSLwEM1UtPs
         JwMB5Z7c2nUmM6v6mfgmRfeGMKfCasEedaFkH936tLrXMYIz3eGKWx5LBMwiKEpNCnQX
         CqNV15/6K5WGMzqe/ZyvClkL3SggqDmf4zWZsjff1iGlPhR2Lw4atDXzm6cSACsSv0HZ
         Nql64gpQem12qIxvLf6vLaIRLKsgNgZAMA1Sc8F5CgY0prjstiE6gspjDyYKmigU2C9n
         yn1Qel3/x0TCL1hSrSyOiGCZl6UM81fKf4c9prVbOu/eDumFvkUQE08ev0G+ywTNJb+O
         /Gow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705998101; x=1706602901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e5IbYX72GKDgKEeebQF3JWpFaouRh1FyJnCJ8FxmRXQ=;
        b=Z4PTB1RnWVMlBKAqF0qwW6ZxuyMZOqvTTT+gv38WaBUa3Fo6kqFExsi2CZNoRrzyKE
         eYwujCR1ndbV55SspwBGrkrnbP4sHSspnD7mxGxr96muVOU/PudWJED01Ri/AEVgbYh3
         /AVNqxAVSSa8U10XL2sprv0d6TPReGdc+7SJsmDKHsKAI131zxnTH4lCib6Dxsn9ntsc
         a8SrXIYVhC/TuPLoKyMvNJIHGcK3f3Sg+CR/uR9rymph+xCWtWttGDdl1vyYaCI5KB+W
         aY1kkfzLyUmwhvMhCXKJ1vVOx+xrc9WCfQ+na3ST2RLS0h3aK7SuNLepzJzkTxSNrfNS
         32xg==
X-Gm-Message-State: AOJu0YwlXcdzoCLykcl0rSBGZVh3cx4IHVloHmRo3yKN3SlYD37nFFD9
	s4OO0Ri6Bq/bJd2XFSsZ6wck7ZP6Itjntmlv2HGQ0ipADv1tfZrK
X-Google-Smtp-Source: AGHT+IGW98fsghFfKlw+hkN3TgO1Gz02ckvGCA+O1HdiFcvUycwq8dljNadfhv7w5DjrFW/E7/gJmA==
X-Received: by 2002:a05:6512:31c9:b0:50e:2e5d:10a8 with SMTP id j9-20020a05651231c900b0050e2e5d10a8mr1214541lfe.133.1705998100946;
        Tue, 23 Jan 2024 00:21:40 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id u11-20020a056402110b00b00558aa40f914sm14810435edv.40.2024.01.23.00.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 00:21:40 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 0/3] dt-bindings: arm: mediatek: convert MT7622-related bindings to the json-schema
Date: Tue, 23 Jan 2024 09:20:57 +0100
Message-Id: <20240123082100.7334-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_002145_582546_0BFBB8D7 
X-CRM114-Status: GOOD (  10.56  )
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

From: Rafał Miłecki <rafal@milecki.pl>

There are more MediaTek bindings to convert but for now I focused on
those used by MT7622.

Rafał Miłecki (3):
  dt-bindings: arm: mediatek: convert hifsys to the json-schema
  dt-bindings: arm: mediatek: convert PCIESYS to the json-schema
  dt-bindings: arm: mediatek: convert SSUSBSYS to the json-schema

 .../bindings/arm/mediatek/mediatek,hifsys.txt | 26 ---------
 .../arm/mediatek/mediatek,mt2701-hifsys.yaml  | 54 +++++++++++++++++++
 .../arm/mediatek/mediatek,mt7622-pciesys.yaml | 47 ++++++++++++++++
 .../mediatek/mediatek,mt7622-ssusbsys.yaml    | 47 ++++++++++++++++
 .../arm/mediatek/mediatek,pciesys.txt         | 25 ---------
 .../arm/mediatek/mediatek,ssusbsys.txt        | 25 ---------
 6 files changed, 148 insertions(+), 76 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,hifsys.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt2701-hifsys.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-pciesys.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-ssusbsys.yaml
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,pciesys.txt
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,ssusbsys.txt

-- 
2.35.3


