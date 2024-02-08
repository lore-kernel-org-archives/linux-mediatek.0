Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D364C48260
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Feb 2024 21:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AVepR+rGi9qP7QecZrVNZGxlAacyZEcN1GI2ljcPknM=; b=A8HPQkAZ8NjrKTxbp3M9IHcfdL
	5V3wPMXGmvT6EpIFd93sQRIrqZlZW6M+9/mXiEYqu12om86wZktj21zlUlLLwfDMzwsxQjkgmq+Hw
	HnuyyO5BOdPrlAgox92pZOwJ/qz7yIWEewplB3L0a+FmRwc5aJSa4xkw0QdwhR1qMporfUdGG4Yw9
	+t9NmtuRg7GiBTHfAYKd8ryDVSpinFPxXKD1ITkAbMqmlM83JovBqxyqhOX64C386UQPz9syVl1rv
	PKGlPY5AzLE8k++inXgeBN2e6fe0h6F0AgrhUj/PcFY6HxdMLcfknOgZcmKKbiz1DdsZlosIG9Bup
	RyC5B9/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYCQl-0000000F7do-28Cv;
	Thu, 08 Feb 2024 21:59:39 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYCQi-0000000F7c9-2hs7;
	Thu, 08 Feb 2024 21:59:37 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a29c4bbb2f4so37494566b.1;
        Thu, 08 Feb 2024 13:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707429574; x=1708034374; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AVepR+rGi9qP7QecZrVNZGxlAacyZEcN1GI2ljcPknM=;
        b=YiwzgRV7384CNoWf7k3u402KR8pvWezjQkLx7njVhfYs/IAxTW7uBeEVPBAuoOfb5h
         CoJyGFEDeeAF5+bMQ9tpHvsG8WhBJp8ADdgi0mLIMWPSwtaN6NQEhJ02fbDzmitromrZ
         pvVOJ/c+T9uegfyaJwGQVo9HFpLSuI0eghKmVHj4sB0wqLR1TgZ9DE8PHxjJoqFj7foP
         6nPwNmVyzTstnnd90N0wqeh3QC0rJmUBEJxUM3cQNPePKIoDmRt5aI9jsdZeOqN4XPqD
         /ZPwAvyxZSe2nLljIthPmFAqZzvDu2/y53s0yuYfX6QJQ8CWlxFjevvHqTo5BAKoivVL
         1NcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707429574; x=1708034374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AVepR+rGi9qP7QecZrVNZGxlAacyZEcN1GI2ljcPknM=;
        b=pzHsbDFBJNJPLiPYKhljcQBjt0itPpEDM6UPE0Mx3WuquSm4Eb6sbtdLNZD1Z5JJak
         llFSE1vAXygctTKgvGY1TiCY1FwZUdm3ul/nrlZWwkMebK5LcxMT1V8BSYMjXIZOtGCB
         ODSPXDxqyRfiO+DQ4V4sG2jf7+6w2IKQt3svvdu3owTO0eY07Vw0c3smv3oB5P8JD0Os
         /pw3Twg3UQyjjfdtZoi7GjIUEXFCP2p1mdrh3KvJw/u/TpM9XEpVQ6LxluB/ygPJgNeV
         NWLvv68UmEReVCM4UJkCMEZCg204Uz+F29ODaUvKyL6R9mnKWHVqNN4j2oa+3WLALzY8
         0HKA==
X-Gm-Message-State: AOJu0YzeIujTc5Mtyq8rTihCVNIrXjCVHus7ZSi29EadnshavbxKUR0k
	papbxPTRCZbO4fH6xhf6xpMpAAgonGaSyTGC8HGlLkOjxFoDQWL6
X-Google-Smtp-Source: AGHT+IEVbsowZHNTpuOZoU601hiKKk3mWRkCBHnoXB13FY31HnF9RpvsMi6ycgM1IRowDJQTYenTMA==
X-Received: by 2002:a17:906:4acf:b0:a38:350:bbdd with SMTP id u15-20020a1709064acf00b00a380350bbddmr425752ejt.48.1707429573863;
        Thu, 08 Feb 2024 13:59:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWqyCuLpoE7cM/3uLYgV4UJ6clpSsEYm9CsGZNT7AzfgdOIJKirfgJjt5TTDl9Q/ltRUhJeYTh5pPtgzcOrivc0ClfGBRijNGIHSuqKR4HnIgGQe1agfegzSFID9YemtwFA6UWyURUCozfrantbxlEyXTO0ZhQreQ2sbOsKiXTcvCZeBEJw5un3ygPl5uEOXbc9RNrRsQ+b5r6jUCPWfL6jYF2SfzkKLdK/2160WkZmrv1wV86qZ6fxVMJCNuTkAP9MaHtPuVe3uqARUqVhdnMo7CbEYVmcU3NC8IA6DmvC9cTUs1Cbt+k3HbKdFzNG3k0MVPD0hoRkCdqCPejsjfqU0yhIcOf/fdvAvJcY2uUVDbxnauh1Cy16FsAAoXwkNaq9Zmd5Fi9hDy5+kMfXAQJEXBTV0guJolL09hmmLAFsd8SsC9NKQc5ois0CmbWuzp5XGBa0zDwwfBGPIlXHdTbkq7ubFP8pAlicSYb5brBE745Ir5uiBAdNI2GuajblMfc3ZVo=
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id rf19-20020a1709076a1300b00a3743142429sm108255ejc.39.2024.02.08.13.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 13:59:33 -0800 (PST)
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
Subject: [PATCH V2 0/3] dt-bindings: arm: mediatek: convert MT7622-related bindings to the json-schema
Date: Thu,  8 Feb 2024 22:59:23 +0100
Message-Id: <20240208215926.10085-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_135936_718820_72705D33 
X-CRM114-Status: GOOD (  10.34  )
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

V2: Move bindings to /clock/
    Use clock-controller@ nodenames
    Drop incorrectly specified "syscon"

Rafał Miłecki (3):
  dt-bindings: arm: mediatek: convert hifsys to the json-schema clock
  dt-bindings: arm: mediatek: convert PCIESYS to the json-schema clock
  dt-bindings: arm: mediatek: convert SSUSBSYS to the json-schema clock

 .../bindings/arm/mediatek/mediatek,hifsys.txt | 26 ----------
 .../arm/mediatek/mediatek,pciesys.txt         | 25 ---------
 .../arm/mediatek/mediatek,ssusbsys.txt        | 25 ---------
 .../clock/mediatek,mt2701-hifsys.yaml         | 51 +++++++++++++++++++
 .../clock/mediatek,mt7622-pciesys.yaml        | 45 ++++++++++++++++
 .../clock/mediatek,mt7622-ssusbsys.yaml       | 45 ++++++++++++++++
 6 files changed, 141 insertions(+), 76 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,hifsys.txt
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,pciesys.txt
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,ssusbsys.txt
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7622-pciesys.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7622-ssusbsys.yaml

-- 
2.35.3


