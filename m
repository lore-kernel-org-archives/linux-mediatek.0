Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F22C61DD3
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2026 07:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ehsC4fkcGYgZxU5YfTTtJEKH9Dtw/4IjhfNmBesfrM=; b=qBtfCiCrh9yonI/ueHMHn04EJS
	b43YUzywNmpUP+RY7L1RY8/bYAPSsO9xmsLAMwqPbVeq2k60234686omM8RXtB5mGGeIWkgxE1/Vt
	HfNWWxBEi6PMH12OdowalnMGBqwoDpiGK7LYlDiU6OC1mwjTZziLvRT/D95vbFYeK28G/2Wq1W51k
	3kKW6+FkfQWYK0X9Xv3U9cWzo8a4pHToJNSehNzUhbNFus34dtt/cRDhOBq3GxoMVLJledEKgl+cG
	urTxtNTK0H6dLHDsIQSaIo2UPCvy4RpHNBl/3vCIWkHSWYxp+zdBJkhCl9SQ7YSW5y2FiDeGrexdS
	07FxwX2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JGA-0000000BAXv-3lvP;
	Tue, 01 Sep 2026 07:50:22 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JG8-0000000BAUR-0Wqh
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Sep 2026 07:50:21 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2d71a50caa9so7542625ad.0
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Sep 2026 00:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788249019; x=1788853819; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ehsC4fkcGYgZxU5YfTTtJEKH9Dtw/4IjhfNmBesfrM=;
        b=mW5KMc++gmbOUjzso8RDr+rOwo8X5s4Av+Dn4sHOYz/UfsDuNnLB/2qGvKRrYTSX7I
         GNmLq9r6c2WTICf7ECqXFa26oRABEVLFiETWQC79mycKos1w75r+pgKkGE+zt2y3E0/B
         fIR8Vk3NAVhIxUMy9zrsJSDwFm0uJ2+UGcpms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788249019; x=1788853819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ehsC4fkcGYgZxU5YfTTtJEKH9Dtw/4IjhfNmBesfrM=;
        b=Zko1qGlO+TtwbNr9xElQWA82r82rgefxIbf7Wexanypi9hDdZdifQ38q71PsKW5q0V
         drSBv4rthjLDsPoN6McZENFJNt9nVY4/xwBxuXgJHh1CfARP1ohL9wcGCTSPxMIaZDer
         Luz0A2d0XdPqNEt7Qo2x6MsYYPH6aQuOkGAMm8ePkZV4KFFFLXSXt7fxmnp3jbN8wLeF
         qohb4EK58iZ3sxo1JEkwDmhxrpeP4iKJfCuNaTUUOTzOIYl5Fr6cO96jzVnGA1G6zfFZ
         BtGGemcb1kyEqTNpaDTHv8h7tAOwkl3iaSfP3OoXxVSkYEOjMQ4K/fzZMjTlXzcdsmV9
         VRjA==
X-Forwarded-Encrypted: i=1; AHgh+RqOOof5SJubwRP/rsbbJ/FQUwBt+yBdQar5AYWfnAs2vf0wt5OAIbgqSjUPS827B2Y2TWfe2K7ZWyI0Nq3rcg==@lists.infradead.org
X-Gm-Message-State: AFuF++n07bHzpL1/BVhGnNElAnE7Fp2/4Eg8/SAFSPaH8lAq8UgrlBeL
	0Vq0Cs+EFjt/Okxj34yiZXBrmOfDGNCnb17N6pLhq58uogCqDBii+O9ug+/HVY8KkQ==
X-Gm-Gg: AYBFou1cgis2+3fSJLK3yKaGN92UbbvUetTL7iAc1LbIeofZ+gF0KD6xwZUN5i84sud
	hlnynTU7dV+SHf/jLYFwpeu3z32RqPkGOFuOzKpDqZt2GwVeAsEoANZFKktHN7dkLkq/7Akxbkm
	7kdjtvb9xoZHr1hj6JJcOAS/LKlHDF4ot/oP9wrGN7nUo1cv1BsN+cIlku2FOZwhkDsLleap7cl
	nnK5OvzyOEClq5LH3z0QlT6quMQDP9SthTpcUplqs2ER7D9oAcFywGPMirC6KfRMgpnolV5fGF7
	gPjeaKMxHx82jlp2StHEGYIauIEpWqR4s+owzh9UlKIpAk+R8cmy1uH/PVH8U5QGfoysr5/AiUe
	jvNDWE021zHdURFG12XMkazKnjniBuoFtfj4P3Bv2dILVWJbpurFIvlVlAFHM6Kq2Mko5USW1q3
	hsyj7hBFmfRneutESInFe0nN9VRH2hvbsboyfBVyjs6IX9LtOm8S2xU8uO2Owk1CsLrOlL9j9CC
	hM9L6MzafdxWeTgnYZ8v4xFHz5YVQRJ/lLLdWrTJtjCu1c=
X-Received: by 2002:a17:902:f791:b0:2d9:1dee:43db with SMTP id d9443c01a7336-2d91dee456dmr196089085ad.15.1788249019467;
        Tue, 01 Sep 2026 00:50:19 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:8cf:6df0:9c4e:f5e1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988b699sm48142515ad.59.2026.09.01.00.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:50:19 -0700 (PDT)
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
Subject: [PATCH v6 8/8] arm64: dts: mediatek: mt8192-asurada-spherion: Add Synaptics trackpad's supply
Date: Tue,  1 Sep 2026 15:49:26 +0800
Message-ID: <20260901074930.764550-9-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
In-Reply-To: <20260901074930.764550-1-wenst@chromium.org>
References: <20260901074930.764550-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_005020_161458_024FD9B1 
X-CRM114-Status: GOOD (  14.20  )
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
2.55.0.897.gb25b4bd76c-goog


