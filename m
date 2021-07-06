Return-Path: <SRS0=SroS=L6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE99C07E9E
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 10:01:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F08166198D
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 10:01:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F08166198D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/LAx+7Ry3A6NEqQOHuxDQad+ZjawtSPqoRzfv9xiFgs=; b=LY6fRPTqhhYpuJ
	/p7Nz485PKIz31XMH6b+8cmuSSmyhIYTM4FZ+WFOaIfhVwI2ZJtVOzdYjEdP9HoeXszlYfBiLA7Uu
	KE0/YKgUrKHQF3ODYOod8T9cycmhfTIRNXB5ty8KsCslSMmabF9YrOoJ2CCWz8bEqN4EvFPICCXtr
	wydpf0EMfhRkRmTXGRzYSFsmuWbFERP/HyxsuOffv8ReMe78zhVYW+rSE9ywqEumE96Mv6/jt78qJ
	U++m2KUqM16TfUaB7kDFgR7B2P7Ikk0Y2yg/Da/aNkfQPbFH5Z8OKc//YZM+klTa/o8fnGGQvgCN5
	WRcj3P9xwFRCtjKKpwng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0hth-00AyDj-Ii; Tue, 06 Jul 2021 10:01:45 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0htf-00AyCr-6q
 for linux-mediatek@lists.infradead.org; Tue, 06 Jul 2021 10:01:44 +0000
Received: by mail-pg1-x52c.google.com with SMTP id w15so20853144pgk.13
 for <linux-mediatek@lists.infradead.org>; Tue, 06 Jul 2021 03:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uliIU2m17ulU3tWZdvwBwlJdH1ELovSXyv/0ht1xq+E=;
 b=KpDXFN2TB9LCytImhRbUZP2d+IBfn13+vuF79l5n94yQG2rFYRnlTXzm0KhkQ5olSl
 aYJGpLzzoEc9LvndZgFz5TJtMQeqWFSZaEUgX4qKjcK4iSmu9CYiPFzDMzmvO8aZIz+3
 OztLGz5EOMNfSfACHa5E63GQgOrCHXqi4ut9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uliIU2m17ulU3tWZdvwBwlJdH1ELovSXyv/0ht1xq+E=;
 b=Rhl1LSOo6UYxKh9Lkf7r46CkwpkAkVDCBt2tO/LBQ9T4nnK0em7TtMo6PNRgWOF4r6
 o59Pm4By10zcyAJ1QSP8AnCfkrluGBlfqXxonOZA27XBvD00ceIwQgH5XjedPdN5kvfs
 T4PB3m/FV2pdhOn3U+cMMn2mp7YhjwZxCYwzxdY9HBGR+QqlDAoFsFgay9CF+cYmGm95
 5XJNxqGM3H0WeNp8E1N8pwKcajH5sPRqPShuiRMLiVAdEo+b4HtsvHuY9/5xPJiQPaa0
 Ay8wJQWeXVnY82DaBlbur3NPCE5hWwboDJZTk2+ytgb5S1tnZoMD64H8OZeVoWTaM9z4
 /Tpw==
X-Gm-Message-State: AOAM533/9ojSZ0ROqmf3Csg3hWw4T9S/Mng6dMYVrK506AIipQR4z0cE
 NDXD+K8Cm+5lg6eSkrp5UEPrGw==
X-Google-Smtp-Source: ABdhPJx+Ir/qwXQ68CxJH4FAZ/envqizD1shhTEclBQijaU/eCQH5OPZfyru4yGvuoxtIPqBcuTPvQ==
X-Received: by 2002:aa7:87c2:0:b029:320:d13:d8a7 with SMTP id
 i2-20020aa787c20000b02903200d13d8a7mr8761493pfo.44.1625565702530; 
 Tue, 06 Jul 2021 03:01:42 -0700 (PDT)
Received: from kansho.tok.corp.google.com
 ([2401:fa00:8f:203:39c:c8d0:5422:cb9c])
 by smtp.gmail.com with ESMTPSA id y4sm4446642pfa.14.2021.07.06.03.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:01:42 -0700 (PDT)
From: Kansho Nishida <kansho@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Shunli Wang <shunli.wang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Eddie Huang <eddie.huang@mediatek.com>,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Kansho Nishida <kansho@chromium.org>
Subject: [PATCH v3 0/2] arm64: dts: mt8183: Add kukui platform audio node to
 the device tree
Date: Tue,  6 Jul 2021 19:01:34 +0900
Message-Id: <20210706100136.1205047-1-kansho@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_030143_302283_F2FF3244 
X-CRM114-Status: GOOD (  11.62  )
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


Hi Matthias,

This patchset is the v3 patch!

Regards,
Kansho


Changes in v3:
- Use audio-controller as the audio node instead.

Changes in v2:
- Changed to the dual license GPL + MIT.

Kansho Nishida (2):
  arm64: dts: mt8183: add audio node
  arm64: dts: mt8183: add kukui platform audio node

 arch/arm64/boot/dts/mediatek/mt6358.dtsi      |  1 +
 .../mt8183-kukui-audio-da7219-max98357a.dtsi  | 13 +++
 .../mt8183-kukui-audio-da7219-rt1015p.dtsi    | 13 +++
 .../mediatek/mt8183-kukui-audio-da7219.dtsi   | 54 +++++++++++
 .../mt8183-kukui-audio-max98357a.dtsi         | 13 +++
 .../mediatek/mt8183-kukui-audio-rt1015p.dtsi  | 13 +++
 ...mt8183-kukui-audio-ts3a227e-max98357a.dtsi | 13 +++
 .../mt8183-kukui-audio-ts3a227e-rt1015p.dtsi  | 13 +++
 .../mediatek/mt8183-kukui-audio-ts3a227e.dtsi | 32 +++++++
 .../mediatek/mt8183-kukui-jacuzzi-burnet.dts  |  1 +
 .../mediatek/mt8183-kukui-jacuzzi-damu.dts    |  1 +
 .../mediatek/mt8183-kukui-jacuzzi-fennel.dtsi |  1 +
 .../mt8183-kukui-jacuzzi-juniper-sku16.dts    |  1 +
 .../mediatek/mt8183-kukui-jacuzzi-kappa.dts   |  1 +
 .../mediatek/mt8183-kukui-jacuzzi-kenzo.dts   |  1 +
 .../mt8183-kukui-jacuzzi-willow-sku0.dts      |  1 +
 .../mt8183-kukui-jacuzzi-willow-sku1.dts      |  1 +
 .../boot/dts/mediatek/mt8183-kukui-kakadu.dts |  1 +
 .../dts/mediatek/mt8183-kukui-kodama.dtsi     |  1 +
 .../boot/dts/mediatek/mt8183-kukui-krane.dtsi |  5 +
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 67 ++++++++++++-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 94 ++++++++++++++++++-
 22 files changed, 336 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219-max98357a.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219-rt1015p.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-max98357a.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-rt1015p.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-ts3a227e-max98357a.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-ts3a227e-rt1015p.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-ts3a227e.dtsi

-- 
2.32.0.93.g670b81a890-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
