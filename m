Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E58C43458
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 11:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+wQQi5qAJUnUkHX1saOq3zIx6e8dXlHzf8E6xF+VOzM=; b=MzxXD2l5C3CDk46S9sZGMR07MB
	XQMIqT6DbMT33HN6QK8TwSHjWALDejcuyuaL9X6jOngcAgnytPn3tWQkBpyOlvSe+64I8aKRjg+68
	Xm2KluYmrXQeuETjMYp/LIoHU7DNfCPk2w3reucSdlD51gfOCk10TijH16Cxq25le4pYstSKizpVz
	JoulM4U9l3bnBrRNAvza3ZIDESE9fuG6ywb8zqtp4Rc9LnZwMuwvtTTI2zChqxTZrZQ1aEeel7Qoh
	9S2BKPozoU93azB17RQvEzLhWiReQcVPev045XqxptbtWVgiekhkU+ArQCazWnegSpJ/pE9Vab16g
	76YtMs9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcVf-00000006s9p-1a4P;
	Fri, 03 Jul 2026 11:56:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcVe-00000006s8b-1Fyj
	for linux-mediatek@bombadil.infradead.org;
	Fri, 03 Jul 2026 11:56:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=+wQQi5qAJUnUkHX1saOq3zIx6e8dXlHzf8E6xF+VOzM=; b=jbEUGUGBA+x2zmkkyCWvjR2D+l
	zOnzZKf+UsxBzB30IK2IdynrvegrFFlz6pruKK59+5jNZJBYqpzUoXKcd+JhmnG3Zl5DhAM23/Nfi
	jIUpFpeBWLF2nIcqX6M4iGYq3l8XQCW7YN+gXZuECUjRnoJS5AS2cpQdCKzdd3a4duXBpM4wfhlFA
	rAY7qsuhBQO9GNH/gB2QLEZ7AEb0w2Sb22FJ3V83lxVIv/OLtz28Tptt6Q8Ny96O9CZ0tXj2AkwR7
	v01C7LcwMukI2IRWFuRgWpwa2PxW5jIYV0bb6TlfPBjDmcbF1ok1YlLZ4l9bnpfEVSXuyLru2kA1u
	WrCWjjgQ==;
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wfcVb-00000004m7r-1Qj1
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 11:56:41 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3812c718debso366629a91.3
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 04:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783079796; x=1783684596; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+wQQi5qAJUnUkHX1saOq3zIx6e8dXlHzf8E6xF+VOzM=;
        b=Pw1UV5izLBcVfLLmuKCcIUytLN8zNTkMvqlO/aaCR784lABCiZGmAlPn5baMxRf5Ap
         aFF6fXn7zsurCDyTW7+DjiGxfk0zQNzFmhBJCYptJFnccii7HnRrTVTPe4uEKwSCuzYg
         AdaU5V+6biGA6TZBfnvYv2tLjqV17fKSTp25o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783079796; x=1783684596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+wQQi5qAJUnUkHX1saOq3zIx6e8dXlHzf8E6xF+VOzM=;
        b=OsKFUMrF43jgmIJZbd7nRlMTrYG2nSkASWCOf1EF4w3SxZKC4raRjNimRJ66pLOjWC
         PcabX3V9Wzg4DXS/vv+Y5AXKhNEY2iteN76YHNrDkKdBsU8iQe7OyHo/8npZkuHpOX9W
         +WLH4YJ/JjWuWvIrXvxl9KGEhUEuHgiip3jXzoPelp44l9GMQZ+lXj4C0RFg0fK7MPYT
         GMvge75tvkzeb1nGqvwhl1I7Pw+/zc4aZ47dwW33KAvB9WwKeZE9p6MFmae3bHmcU2bi
         YL/JO4FQN0VuJ6MdJlejhfLfgIbH0caCVdoiTWuSotDdCeYki/m3eRGb0Vxnu/rySQzQ
         9LqQ==
X-Forwarded-Encrypted: i=1; AFNElJ+niRLFLGkWMLquS/SvdNNOwXRPM4Zkc2uB0zosQs+QTcAGmnqbU+qtD9GjppDWFMhu86USWcT+swObwO94rg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUz4if2yGAYXLw7tF2K+a25WHCFQ0mTMC59hdpDqxtZf2Sj5Tk
	3+KglB/HtPrTokHmbEhnLqXMwzoIc2DNqeU3ASY1Lr1YbAxhDRrLVFEDs5bk6wM+Cw==
X-Gm-Gg: AfdE7cn0woJbDL051JzFCOZhsdcM6plKPETP1doYvN88ZAgE77HD/RVYp127pEl+vGb
	vDaIjNpM399YF1UMwi/NAkicjdOi9oggluLSo2eL2ItvtP324j/bQNhB17Yb52azoP39eIz9jHn
	lMLXdLkl2kdug1M+AXLm+ZnsWdDx+4T48TGNVsRorYo2WS06SoiD0DWX3mtYYDmM1S8LWSgYqnA
	L4GJgH0WzJiEaBRiaX4P5ESoDmqr3qVLT/NIUT0pvorZqSJClDzk+wzCWLf4kr+HaKFpEmroEmY
	dlaiSuk5prX3PkX+TK42f+vKGG4P1uvJyjoSSabSIs0BzGQxrFFXc1oA/yvhvsiivxUc5d8r4Al
	20dPSnBpoJDiJjgUKmsradKYwHp7UhONnhEJYboHrOPmxoR8Ogj3WTtCdDA9CctPWkvDuXL7YWB
	ks14PRV+fcwKy04eVjFZ5GIrSY5tZ3/dTOSVSgghnmY5UIXmPTaF4aZ+TsExQbHBTT2zPcmykRQ
	QwKDEin
X-Received: by 2002:a05:6a21:b88:b0:3bf:6222:2e7e with SMTP id adf61e73a8af0-3bfed0e254cmr11946730637.4.1783079795734;
        Fri, 03 Jul 2026 04:56:35 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8bd30ca5sm2569540a12.0.2026.07.03.04.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:56:35 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable+noautosel@kernel.org
Subject: [PATCH v2 7/7] arm64: dts: mediatek: mt8192-asurada-spherion: Add Synaptics trackpad's supply
Date: Fri,  3 Jul 2026 19:56:00 +0800
Message-ID: <20260703115601.1323491-8-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703115601.1323491-1-wenst@chromium.org>
References: <20260703115601.1323491-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_125639_551460_2A7378E6 
X-CRM114-Status: GOOD (  13.36  )
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

The Synaptics trackpad, like the Elan trackpad option, is fed from the
system 3.3V power rail. Add it to the trackpad device node.

Also add the correct post-power-on delay, even though in practice it is
not required. The Synaptics trackpad requires 100ms after power-on (or
deasserting the reset, whichever comes later) to fully initialize. The
power is always on and the reset pin is not routed out, so the
implementation could try skipping the delay.

Cc: <stable+noautosel@kernel.org> # Without driver changes only lengthens probe time
Fixes: 925ebc0cd55c ("arm64: dts: mt8192-asurada-spherion: Add Synaptics trackpad support")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
I think this shouldn't be backported, as backporting it without the
driver enhancements just delays the trackpad probing with no real
gains.
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
index 163960f58db5..147a8e9a3a71 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
@@ -90,6 +90,8 @@ trackpad@2c {
 		hid-descr-addr = <0x20>;
 		interrupts-extended = <&pio 15 IRQ_TYPE_LEVEL_LOW>;
 		wakeup-source;
+		vdd-supply = <&pp3300_u>;
+		post-power-on-delay-ms = <100>;
 		status = "fail-needs-probe";
 	};
 };
-- 
2.55.0.rc0.799.gd6f94ed593-goog


