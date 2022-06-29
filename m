Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DEEBC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 16:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MOWGQUicuat7lNyOBFkkSt4fTO26VEM4AhOi/5PJxog=; b=PtMzYtdYDz0gaTw0yFn7qOygBr
	Tu8SLi/7VBnZ2HOGAvN3SEwC+SfOp4bg6tY8Iy5ZT01iS+/bHG5PhIINREB5C5iAozNzchsTIgqIR
	6KAgaaZVDHa2Dw70FkOOQegyxhAnqNMlCfzWNa8wo1J0vdkGDEZbxxvNMevG9nchLsGLVfqMUYbqG
	rXuB6ibPDETGWpTpzpVuwHbrL6uAPQBarK0MoVG+h8aQJe+KJ73gHl7oLst/qWTRfUM2+JTPK1+3R
	/Hvxr1jBhDBnZOdhX9Ef5PjctK+Ro2sC9EaQ/ay86w+XMQAtvRwDP4ibH3W6WnAYqImV46J0JHiCn
	hsmCE9dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6aE5-00CsXT-72; Wed, 29 Jun 2022 16:07:37 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6a75-00Cod5-TH; Wed, 29 Jun 2022 16:00:25 +0000
Received: from notapiano.myfiosgateway.com (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7DFDD66019A7;
	Wed, 29 Jun 2022 17:00:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656518422;
	bh=WwpPbFWF71BcviKH9+5zJIkujt+1e+ShgiMHmhnibhI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=REkGP/3Av9tLCsMI1k+M+ZSrjZOnpWOzu8IjqUxciTUidm02mtNHXYb9iQvTKLTG8
	 FHRh+Uo2peZRsqaTmGqkr8uGsXH8HeHl7QpQBCFMFDKTMir9LuLq+WTs0hhNrqj+Pp
	 OlvXOMI9IzIT2vjEedlAKEZ4pFAwQsZPJI1fCMxUaTJiUh7FkQLsDvRjmiO5l7m30p
	 qQci6w3RY76KTQ2S5+7G7x2fdK8dzJJfSli85eMHtFaR+RcDqs9udMgu/8jcykC1PX
	 1Jcn64IAaQ/RrvuaV41+HdfaZnmWcypdwrGUgShdISMXgBng4QrK2fLG6HZBsZtAj7
	 HU1pF1JSe+xSA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	Chen-Yu Tsai <wenst@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 13/19] arm64: dts: mediatek: asurada: Enable XHCI
Date: Wed, 29 Jun 2022 11:59:50 -0400
Message-Id: <20220629155956.1138955-14-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629155956.1138955-1-nfraprado@collabora.com>
References: <20220629155956.1138955-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_090024_116633_989BBD33 
X-CRM114-Status: GOOD (  11.25  )
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

Enable XHCI controller on the Asurada platform. This allows the use of
the USB ports, and therefore a rootfs can be loaded and a usable shell
reached from a live USB image.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

---

(no changes since v2)

Changes in v2:
- Added this patch

 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 6eace280c14a..69bb43f7b346 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -579,5 +579,13 @@ &uart0 {
 	status = "okay";
 };
 
+&xhci {
+	status = "okay";
+
+	wakeup-source;
+	vusb33-supply = <&pp3300_g>;
+	vbus-supply = <&pp5000_a>;
+};
+
 #include <arm/cros-ec-keyboard.dtsi>
 #include <arm/cros-ec-sbs.dtsi>
-- 
2.36.1


