Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD35C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 09:06:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4632460BBB
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 09:06:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4632460BBB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+9rogFDm7HayXBLyBetHBl7MLeXUkhvu3uK+Ff/0tTA=; b=MO/Ej5iBca9I1DGceFg+TCSyJw
	HemssDcHAvXKepRsEXzaXtcz9Ia0/UMRGiTzQ0nWWYgBMQGAhd+F1AxH47zYSorZbt08fqQYvPbUr
	48gvyNqCWA+Qz2Ir6JVIivumchVie3F0aoahieboGb+ImENP65rUv/wRIX89RdrfRtJgr2yzW/AYi
	YNAQW+8enh0jVyD0e3bgPvUMxZMNVCLiB+lUXeTrac2LYmvtcTRZ6IRw14n0L18NKIvLTByMGmxb4
	0UK4SFV3KisEyWBDdiDJBcBS87tpNNqEByEkQnMCZXQPL+RiqjRwC6jtM9sQzQ2DDWQNJ/Lq443GT
	Ji214keg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZ8oY-00E2yW-31; Wed, 21 Apr 2021 09:06:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ8oG-00E2vn-Go
 for linux-mediatek@desiato.infradead.org; Wed, 21 Apr 2021 09:06:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=YN/nmUh9APD9tW++qNNzvwSyrvP9kAzlnRWJP7UTqw8=; b=4JwKDSmTLFdIT/N3lugN6kywGL
 iGvN/VDIjCt2sE+3XteTYbxaLjTH4l/dNJky7rtTHdNrDpEHX+yg3iBHChK6Qw5lUlHaaXymZSZCm
 yTD5gEfupawE/uKuR0xmldlhOoEoO56zo6Yma6CjQ/BPXybllsffuLieyQ1IFGzoxc5HctHDkNh7c
 gv2IffrLqwrGwjSywH2adoUYezL+eXadUv74rv1EmwvV7XrP0GLAXScpWJrrNnC1+Ym40FcFibB+i
 fTxExObV3Z+1RaF9e7hpI109zf961heDLgVPFwJnG9VpTqE9CCeH9kMszkvstr3auEbj/LXj0WrS/
 VpXu+bGQ==;
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ8oB-00Cjc9-2q
 for linux-mediatek@lists.infradead.org; Wed, 21 Apr 2021 09:06:10 +0000
Received: by mail-pl1-x62b.google.com with SMTP id e2so16965039plh.8
 for <linux-mediatek@lists.infradead.org>; Wed, 21 Apr 2021 02:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YN/nmUh9APD9tW++qNNzvwSyrvP9kAzlnRWJP7UTqw8=;
 b=E/bDd4stpigRKHLBmM7boSUFUdSeoMYg70Sxl7+7SdP/bpB0NRDb/XNrxaSYcSbzA5
 O/ZihtJUWg/RkWrVNDJMJbT4d+xrgZm/eKpbGZZ8Gz0sgfEMiO2USQTymahFefQOLsjL
 I8qgC3vQrlj0b7NYEDrICfBCQXev97pB3tliI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YN/nmUh9APD9tW++qNNzvwSyrvP9kAzlnRWJP7UTqw8=;
 b=eX9hdCectNgPl+yZqmCYPjHLDGstQEv3Fo5xbl7P3mpHJQpM7zs2kmzV4q0wBVwcQi
 7L35SlhniBjCRGuaqclPkPhe6Ilqk2yZrlxG6xmVAv4GY/5FFnwiG4n7Tyr7Vu3X4Sdg
 wAD6LN/8dzdGYAzEgHQeyM87oTC1/JeTfarIyeyRbfNs1ed8/jYEDI/Emy/4M/0LJuat
 RX7JO3SNrJtD88S24BsdqT2Z+hIdLwwvLhJ0J10Ov62j5CwxXAod13ALdFAlcE9dF0RI
 N3J+ksID5ppsBIwjtoVNzJe2UDTiK5crb/Qmkxd38a/v2Pthl4YV9dWUWqGKwG1FfS5c
 L1ow==
X-Gm-Message-State: AOAM533urba+fRMKsOJfLJzB64L+O0NaOBx00t6VFBPbC8d7Gchdagzf
 3TsqrtGJ05ksYbcV/ZqGy3BVAB97PziWKA==
X-Google-Smtp-Source: ABdhPJypgg+tTiJKZh+G2ovk+kqA8t7/GJ+LKUMbYaoTtXTh//9Uh6G0vutZCIY27V9JopVBtzfHNA==
X-Received: by 2002:a17:902:d706:b029:e6:90aa:24e0 with SMTP id
 w6-20020a170902d706b02900e690aa24e0mr33502167ply.42.1618995965639; 
 Wed, 21 Apr 2021 02:06:05 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:60c1:887e:ac53:9b5c])
 by smtp.gmail.com with ESMTPSA id jx20sm1495889pjb.41.2021.04.21.02.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 02:06:05 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Ben Ho <Ben.Ho@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH v3 00/10] Add several jacuzzi boards
Date: Wed, 21 Apr 2021 17:05:51 +0800
Message-Id: <20210421090601.730744-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_020607_160868_8DA1F04C 
X-CRM114-Status: UNSURE (   9.95  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add several jacuzzi follower devices: kappa, willo, burnet, kenzo, and
fennel.

Change log:
v2 -> v3:
 - remove unused property in i2c2 in willow and burnet.
 - add fennel.

Hsin-Yi Wang (10):
  dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-kappa
  dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-willow
  dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-burnet
  dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-kenzo
  dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-fennel
  arm64: dts: mt8183: Add kukui-jacuzzi-kappa board
  arm64: dts: mt8183: Add kukui-jacuzzi-willow board
  arm64: dts: mt8183: Add kukui-jacuzzi-burnet board
  arm64: dts: mt8183: Add kukui-jacuzzi-kenzo board
  arm64: dts: mt8183: Add kukui-jacuzzi-fennel board

 .../devicetree/bindings/arm/mediatek.yaml     | 29 +++++++++++-
 arch/arm64/boot/dts/mediatek/Makefile         |  8 ++++
 .../mediatek/mt8183-kukui-jacuzzi-burnet.dts  | 30 +++++++++++++
 .../mt8183-kukui-jacuzzi-fennel-sku1.dts      | 44 +++++++++++++++++++
 .../mt8183-kukui-jacuzzi-fennel-sku6.dts      | 32 ++++++++++++++
 .../mediatek/mt8183-kukui-jacuzzi-fennel.dtsi | 27 ++++++++++++
 .../mt8183-kukui-jacuzzi-fennel14.dts         | 16 +++++++
 .../mediatek/mt8183-kukui-jacuzzi-kappa.dts   | 16 +++++++
 .../mediatek/mt8183-kukui-jacuzzi-kenzo.dts   | 12 +++++
 .../mt8183-kukui-jacuzzi-willow-sku0.dts      | 13 ++++++
 .../mt8183-kukui-jacuzzi-willow-sku1.dts      | 12 +++++
 .../mediatek/mt8183-kukui-jacuzzi-willow.dtsi | 26 +++++++++++
 .../dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |  8 ++++
 13 files changed, 271 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi

-- 
2.31.1.498.g6c1eba8ee3d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
