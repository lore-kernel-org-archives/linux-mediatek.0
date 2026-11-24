Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A618F606A31E
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2026 10:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X3rPSHM6;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XHYQ5kC9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=PWk3Tf1GjB784piIzDladAPUgmBwYfKuUyQjQkV3yIY=; b=X3rPSHM6YR6Kj7FRp/A6rsnsDa
	1TYilxQr0K7zMvhgqwgldHz3bP4Ba+jbcQh+Mdm/OX7mnp3ROiD+lDZxCdTGIf9nVfGe0ww36dQg/
	8Nu9+JgSMeCQe07zl5TvzlnIiH6W4xBY+DbFfbbGQjK8isFKAeT5N66WPGWfMcUL/jTeIRg1d1J6g
	X8GBfFMgh+hTWMEptKfZFBZttHVwsAMj2MNx4m/EFnj3wprr3sKZzmqQzZsnUJEpGeGiGFLj2N4F7
	+cU+h997GN4vtIk0Rt/JqltbiNNu7jmPY5yiTF3Ec4nYbFzwyHddQT/mQ4yq0lAv59mMK+J9PBhWE
	vQfp8itQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVnUk-00000006BuN-0LXb;
	Tue, 24 Nov 2026 10:11:26 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVnUh-00000006BtU-0OSe
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Nov 2026 10:11:24 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3b40f4d4b5dso1787599a91.1
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Nov 2026 02:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795515081; x=1796119881; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PWk3Tf1GjB784piIzDladAPUgmBwYfKuUyQjQkV3yIY=;
        b=XHYQ5kC9u+mhEmKSy9GmJjNfKz0E6Qq/6UwdKeKmmJiL9ovFgvD4zhE7C7vonQe2Yg
         j5k5pdOt79d2TlOX3GM1+mdI1n/hxi5n9p9VXQNEovGpEBJi6ziPeKZNdlhz/t26B+3u
         eKxZgj5U8618kCs1f/UGnNyiOsY1T5qG3+7Kw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515081; x=1796119881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PWk3Tf1GjB784piIzDladAPUgmBwYfKuUyQjQkV3yIY=;
        b=RboxdApV1fBOUOH/jXHmUE4e92D1Z+TkAiT1sUcfgiwHWVBs4PI3qx7PYrccRz0hkt
         XAq6DrvKpYQSADwtHXq1lMB87IoIfs1IxrtQ26ltklc0ywPeWywPpIoKT6J4QnuvcAhY
         LOvbD/xNwYa8Sf+Q8mA/W1Yl3H+9Qs5nJXZjbBbQ3aQVsDYFpzHEjsCiC10tH74vj0CU
         LEYjonUvmq3u+2Tfa3ycUjVwziq8vwYtkqWdI2XcCuUKHvvCAZsMyRTGLziLwDmaKmdm
         1ZC/OIKVMjeWteECKYji7XLOQCQdRWgVuE0/rNd+rG9sV97SGkzMmREnD+WoN9e8vCXX
         WRMw==
X-Forwarded-Encrypted: i=1; AL+hErGy308hG+l9hmBJ76ExWvQ+1xzTZiSahLKjLHMNQVD7rUp/5SapcQFAaeBefO5hl4Ww/xS3nG5Fdc8wyTm4+Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z9PSnS0ESseT1tAKRH/ANKAenFtZ+h1BjLpe2FwZHNXGwJeh7Z5
	PSCalPxc+102zZJY/yfheIZquC4skvFBwnHcWrX6w4KQBDPhivkSpB2/oLRea138IQ==
X-Gm-Gg: AZFdTZcmHf8CbO0wMh3mWW3VV+l7xV68EYlUlSaYW0FvS1gSxVmbz5PAEIpKcwktvO5
	70R8NUCuZbrsL2KVzm8lmjoVo2vC+/1KC1oD2bAjqR4yuJbo0+bHRTclSVYpLDI5kBBixIsyvyS
	vg1NjUZw3v5CAum/YKwLRZ97jw8BlHqD//RegapeMkL9y3/WeiuMGD2yERidp0/lMEv7aFaVEBg
	bH9bjrkm5D25uC2/6Xfm8YewgAsEDPb9H867iReOgnYsGAbaKig46N5/f5YMdwHFf5zwkqXmmqC
	rnmyRz0f5p0JxidzgOnnukPrW9q/fPL9QPd38vC48954HuoH1oIx5EbP+/VzrMnGPW6ZW/mE+CA
	go9iRHd0kBBY/VW22Ye0lNTtwZqQa8uTsV94UwL8cY4fdHVQWNs4s+psT8uZ4uYB5BSwLpMFZWw
	gHA2aVGC9Q0iRZLNqkJPihtmfss194in4pjnXVt/q2+S4QSQj5atMfBpNp6RqMhpP+ENVnAl1ul
	yvA8H7d14GEF7fC4fbb5hjpum9Um38ocjGQJ4lTCzx5+76G4k8+529cc+lNOhojdA4NlVrxGVBz
	2iKmvCWuttDdVTIlSpxHK83dD9tAKWCEs0cOTqgr81I/o97X8IKlpG9wfoH8
X-Received: by 2002:a17:90b:3f0f:b0:3b4:1b37:ac89 with SMTP id 98e67ed59e1d1-3b41c8ff71dmr19777589a91.34.1795515081507;
        Tue, 24 Nov 2026 02:11:21 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:8f32:8910:4727:ea03])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b41abb1b66sm23171867a91.1.2026.11.24.02.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 02:11:21 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: mediatek: mt8192-asurada: Fix swapped regulator ramp delays
Date: Tue, 24 Nov 2026 18:04:19 +0800
Message-ID: <20261124100420.613422-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_021123_487647_52BF1D8B 
X-CRM114-Status: GOOD (  12.18  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When the ramp delays were added for the MT6315 regulators, the patch
had mismatching context (due to unmerged patches in between), and thus
was applied incorrectly. The result was that the ramp delays ended up
swapped between vbuck1 and vbuck3.

Fix them and swap them to the correct regulators.

Fixes: 9c9f83e3368d ("arm64: dts: mediatek: mt8192-asurada: Add ramp-delay for MT6315 regulators")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 91da89eda13a..6cd93d2d4da7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -1505,7 +1505,7 @@ mt6315_6_vbuck1: vbuck1 {
 				regulator-min-microvolt = <400000>;
 				regulator-max-microvolt = <1193750>;
 				regulator-enable-ramp-delay = <256>;
-				regulator-ramp-delay = <4500>;
+				regulator-ramp-delay = <8000>;
 				regulator-allowed-modes = <0 1 2>;
 				regulator-always-on;
 			};
@@ -1515,7 +1515,7 @@ mt6315_6_vbuck3: vbuck3 {
 				regulator-min-microvolt = <400000>;
 				regulator-max-microvolt = <1193750>;
 				regulator-enable-ramp-delay = <256>;
-				regulator-ramp-delay = <8000>;
+				regulator-ramp-delay = <4500>;
 				regulator-allowed-modes = <0 1 2>;
 				regulator-always-on;
 			};
-- 
2.56.1.809.ga0b61035b5-goog


