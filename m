Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083EBC5DF9C
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2026 04:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2tEwhTxKNyJs3pF0LaNEucWWGIQ4rU4SyQWya7wYtjg=; b=qrGzNrx4p6P94oYfWgNL2WB0J4
	wO26su4gO5GE32TLMoOTHQsV52mvwgbGa57XYBuvFDwdxSrjyPwIC2qObAFllZ9hoQUxFcAyA/IDQ
	GwNCPyqwh0nIqL5NoQXTNHJcJvnVQ9gg4HRNCAnAzTj1cJBQtK3jNRVZVWI/wK0jpgzAcU2Q/2sNo
	47BlF0aRHdj8HcfaHzT4rc8jn7ifpzRkBVBe8rzJoU05GJs4S+J4+yocI1RQjX8L6/OzBFHCu1IQi
	a2ipHGNPDipTvH0iAV1x+8ThGN6G/2C43oo+A9ou/ILUXCelfXmD65OfUjOujx65WBoqNNXrrh8fC
	t93/9ynw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyirN-000000008VR-2x52;
	Tue, 25 Aug 2026 04:34:05 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyirG-000000008QS-3KIr
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Aug 2026 04:33:59 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-cc11a905ba5so3110681a12.2
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2026 21:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787632438; x=1788237238; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2tEwhTxKNyJs3pF0LaNEucWWGIQ4rU4SyQWya7wYtjg=;
        b=YQCy0vllvP4gRcfopejwzhySibOel1hryA9jGGFTI0bL48Jbx7cf0fGPfJaGCdr8kM
         WsX1YLzDJ0XytjWj+EyPJDKof68jTmtsD16Yv100TsVoBrQYsMvBrsDCEJjZcaWjQka7
         0qSNG2nYZu8w6Eu4asozfd63x6Ur3Hq0cFWUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787632438; x=1788237238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2tEwhTxKNyJs3pF0LaNEucWWGIQ4rU4SyQWya7wYtjg=;
        b=rPM564pceFXd1BmMf7wHxIUeB9CRs4WN3EXo2ld+hsFPF/OfKiTLHVbUlZ18qke9oh
         WZ+boloXgxS92Fkk7ZjD6tknWMUpKGNxZ0FRLtKMEtUwsBTtSBRbLrJOTX1YGdAk+dWJ
         OY7VexF8+LdGSx8DanFedlmmdu8ffuSXlIZqlGHiBkQ72OymXm51iBV4rxrIEdY1NflG
         WIsytWo2n1Uq5aQnrjRV/LodxAOGdfe1R2INGD5o+eXCjpmO1OYGYRwCQFfS2psL7qgw
         sIzOL4HOvvoG1wf94KAcrvGONClHeZjy5Se8bKmiGe+aBZRmrz6HEyfTzY8BWOP0kbng
         zEhQ==
X-Forwarded-Encrypted: i=1; AHgh+RprPlU5aEw4BoX2pb0kjFJO8cc1b1+Wv/6WqT6HoqjRCgek7Ph4Xmk1EdgMlLJPUT/P/ioEOBdC98Sbt4Cprg==@lists.infradead.org
X-Gm-Message-State: AFuF++l/8y4HdZrqMNH38XfOe2o8RzJUFfBw14c4v7QXGAN7e8ov4qv1
	6nUTCKij8QDjIk9Dqkpwv4+gM4ltc+vkJ0NOls5ZRXUhJN8+hpT+d9YWAh/PW11IIw==
X-Gm-Gg: AR+sD10/De351KcrTTqH8Su7sU0DbiHX+imllqk3WgsCkVf9mS/ChQQEtm4TcZnGxUc
	+wAzOd6M3cVWbNjYzE1glr4Fv+1sjhA/pjxjVaA1aiiL4akaVVElV35+Pz4MNsA9pfYN+c1mUO7
	TkOrge4jkAROrhv75toAhoomO0yG69WlGGeQT0TUx8K4Ic7cZNUaA6JfTFJo4nTpowbly0ngZ0U
	lQtaqJfdYG1Vnv+51Fnfen6jEDMnmRbch+p3bPFRdq3+BWVpTfzvtMvF8a3rkIF8EtzoVQ53i54
	Iewl33fGKlqtLU5+yhytl8opJvVe6GWuH8+V6KIepGqKRS5DZckLneMHuqiIPtaLB6elpEIn2gy
	kJ9FwFXGfBxLQ/2VZ5ZluRVMEIK0Hek43VCPAHXvFBPU4x3ZYUmIYbyYyH+mMJ1Fq0IBaUk9bzf
	cYtWk5SlbH/3yttZZp9uR5EkJObT1BSMJXKvg+ty0+ArJxF45dPpkO7u75Qh87nvVjrhD7O35RL
	EyfETNwIgMBQuuODjY5NKZRueRDXgWm6FJAHr0dQJMAe6s=
X-Received: by 2002:a17:90b:17c4:b0:392:6638:2e6a with SMTP id 98e67ed59e1d1-39646519363mr6944892a91.13.1787632437771;
        Mon, 24 Aug 2026 21:33:57 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:a442:9780:24da:cb4e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396458212absm2187823a91.0.2026.08.24.21.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 21:33:57 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable+noautosel@kernel.org
Subject: [PATCH v5 7/7] arm64: dts: mediatek: mt8192-asurada-spherion: Add Synaptics trackpad's supply
Date: Tue, 25 Aug 2026 12:16:25 +0800
Message-ID: <20260825041628.988369-8-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.860.g4b6b3295ed-goog
In-Reply-To: <20260825041628.988369-1-wenst@chromium.org>
References: <20260825041628.988369-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_213358_831603_B4EE12B2 
X-CRM114-Status: GOOD (  13.65  )
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
index 68caf4c58cfe..8adbfc307fca 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
@@ -94,6 +94,8 @@ trackpad@2c {
 		hid-descr-addr = <0x20>;
 		interrupts-extended = <&pio 15 IRQ_TYPE_LEVEL_LOW>;
 		wakeup-source;
+		vdd-supply = <&pp3300_u>;
+		post-power-on-delay-ms = <100>;
 		status = "fail-needs-probe";
 	};
 };
-- 
2.55.0.860.g4b6b3295ed-goog


