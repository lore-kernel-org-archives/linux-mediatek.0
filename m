Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A45C07E98
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 09:15:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3920861369
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 09:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3920861369
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MhyuM1EknNaEd7e/RtB6bwVYXRodR3+L9kvicynC1kM=; b=nX06sUPaL7qKDR
	Kv9dvk4tFQugGudM26QjY8dDL19BVQU5+7st2WmVNDNjd/FGM2vIlUseAj9MKJHv1b+Pc3/hoj39q
	Ue9z+90tpb6mZZzL58SDX0KW7jjwOajodVUaSXdNbE+8mJ7386Bpzrb2H1BsrpaKIqFZGn3mSw7M2
	C01rqtUfKDTl6OwdoGeRmpNGDC/y4YyYbecvrLpYnxB/gBILR/LuZIkoJeyD5goK3rhf7h7GW4r+Y
	0pOtP4JMWiD4ZvMj+dKNfL4BZz9pSyf0UfM4JC9sYvJlvjTakZrjvPNYFeDUgzsoVNEHisqaWzHc5
	SHnKqn+n2Ry1+fLC2v1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0KhW-008O4m-TI; Mon, 05 Jul 2021 09:15:38 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0KhI-008NzR-TI
 for linux-mediatek@lists.infradead.org; Mon, 05 Jul 2021 09:15:26 +0000
Received: by mail-pj1-x1029.google.com with SMTP id q91so11362481pjk.3
 for <linux-mediatek@lists.infradead.org>; Mon, 05 Jul 2021 02:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=umJqdN/Kghanf87PrOW7ly3BAvBjzkV6eo4lUVI3NGE=;
 b=ZV2NSqe96CvOJzGYnnmqxN8ckY+rjz0Vq0upurDVUYC25uAZJRSyAI+EVqkJcXQ7cm
 vDYQqe+0eiKIRVYagfV7CLb9neTq5BVvwuQFZS9WAqE4T0UZqRgq91DjXk1t7JCIORDB
 3C3byV6yYUm9J3wbLWmkN9erWjjKLVVcnJbUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=umJqdN/Kghanf87PrOW7ly3BAvBjzkV6eo4lUVI3NGE=;
 b=WQ9NGw0JOr+tcg0rnFWmoCSD9ko3jgOMQNaZ0bC+6In+s/HhkBlWIFEChaRm7Z2aYt
 cbxRTGRpAPi61m9be0NSoE6nsM8aP+hiTSTdoJW2Z/a8+fN7fKj3kkjyU1b/3OSEXjys
 +kp7/yAnPLB6xn6mBWfH59Z0SpB41utuqQEcPFQetHlGGUcGM3hduoC7J26jLDgLJdDE
 s4kEURJS4el7A0wk4qVrtwR+OwXDmI7C/f6QnlKgLBEwNQMzZyKHHYLBwgmYnQi/Uqeh
 17qv9lBKu9c9dYDAiz/1WfiFEb1I5vBGYSTzt1x3gbALL900buTbEX+qic5YPqypLI5h
 jltA==
X-Gm-Message-State: AOAM533OkYEppDcyDjH4YPG/RdwLoDR2r/GcIPbcYvQG5VKxxp5Ntlf2
 E03qQKvDPUdhFgUlT8LSRiQlOA==
X-Google-Smtp-Source: ABdhPJzvsk3n7se/8QtiY+N021ieLTuJ8ebq64UibbjCe4HmDxTqZ34SFxfYvhwG0OPPQ27RVKh0wA==
X-Received: by 2002:a17:90a:fb8d:: with SMTP id
 cp13mr14382138pjb.21.1625476524343; 
 Mon, 05 Jul 2021 02:15:24 -0700 (PDT)
Received: from kansho.tok.corp.google.com
 ([2401:fa00:8f:203:cdc4:4be8:5ce4:df43])
 by smtp.gmail.com with ESMTPSA id 9sm12245176pfv.42.2021.07.05.02.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 02:15:23 -0700 (PDT)
From: Kansho Nishida <kansho@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Shunli Wang <shunli.wang@mediatek.com>,
 Eddie Huang <eddie.huang@mediatek.com>,
 Kansho Nishida <kansho@chromium.org>
Subject: [PATCH v2 0/2] arm64: dts: mt8183: Add kukui platform audio node to
 the device tree
Date: Mon,  5 Jul 2021 18:15:12 +0900
Message-Id: <20210705091514.912355-1-kansho@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_021525_010579_DA4BA631 
X-CRM114-Status: GOOD (  11.67  )
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

This patchset is the v2 patch applying your comment.

Regards,
Kansho


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
