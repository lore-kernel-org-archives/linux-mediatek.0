Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35481C47074
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Dec 2023 21:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0uNg0JJza3ekbCEOERdWEzmvDh/VhU6Jzy3Re4RDF0=; b=ULO0ohMgeeBMTlQcmrhE17t/yH
	FVM3v8iUB1VPWqReioVhn+C1+mKohR3r/8KoB0fqc1CBB1W2BLA0UpJ85vFAMWi1g71t/lNBIW1Fg
	K5NaZ/d5tdd/BsROCCc95SIlieW6NWmhubpViKsWX+Wr67q7oLMopWObm4tn85zDfeF1dvr9Hf2d0
	rMdWO3cw7HQQW6RMq5hAC6EvKjgj6JArbVH+inw/MVm5NzkSgtusHl8WruX7rZUkR8+2Ti4PXUg3p
	2ogJd8Evv9i0XK9d18HZ1LkK+MsLhjr71OMITkyLRqucCv5X7nt3I9hO1WEILmjN0zYBkZrIINxCj
	XevDttxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJKRq-001a2P-0p;
	Fri, 29 Dec 2023 21:31:18 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJKRi-001Zzr-1F;
	Fri, 29 Dec 2023 21:31:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1703885467;
	bh=XL6wkiD2HYx6HaI4hGDV0Keb34y3XqC2DjGmqSSBy68=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HPgwDdLKJcKpAtUbU9HxQhIW+JM1CO3SqRQv5YJMD2R4TwrVN+DJJBNTbNklpO7nS
	 Bfklfoae+bCfaUPBoDG9McM1aebFRKxtHozaTaQZ2xjsuoC8tUX2utslWOKSADvf04
	 X3SsEQVGUlzn4VfGVG6l45wtPcjIY10tTUeqZE1BMjpgEdkp9qbFSx/B+rl2z0vc6r
	 Pc3Z+/REaBuT1b029wtURtyKCBUpAcvbzgfDOiGMi98HAa1J+/5/Kj+5QPvT44UK92
	 9/ZIkguje/JeQsZ+vuHU81HeqEy4/e9iz0AM/HwPdFOdLMqtxuaV3IA0ALA/L8jQWL
	 Pfsh9wZQX7AdA==
Received: from localhost.localdomain (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E0A023781FDE;
	Fri, 29 Dec 2023 21:31:02 +0000 (UTC)
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Viresh Kumar <viresh.kumar@linaro.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/2] arm64: dts: mediatek: cherry: Add CPU supply dependency to cpufreq-hw
Date: Fri, 29 Dec 2023 18:28:40 -0300
Message-ID: <20231229212853.277334-2-nfraprado@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231229212853.277334-1-nfraprado@collabora.com>
References: <20231229212853.277334-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231229_133110_554856_553425E6 
X-CRM114-Status: GOOD (  10.73  )
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

When the mediatek-cpufreq-hw driver enables the hardware (by
writing to REG_FREQ_ENABLE), if the regulator supplying the voltage to
the big CPUs hasn't probed yet, the platform hangs shortly after and
"rcu: INFO: rcu_preempt detected stalls on CPUs/tasks" are printed in
the log.

To prevent this from happening, describe the big CPUs regulator in the
performance-controller DT node, so that devlink ensures the regulator
has been probed and configured before the frequency scaling hardware is
probed and enabled.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index dd5b89b73190..505da60eee90 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -502,6 +502,10 @@ &pcie1 {
 	pinctrl-0 = <&pcie1_pins_default>;
 };
 
+&performance {
+	big-cpus-supply = <&mt6315_6_vbuck1>;
+};
+
 &pio {
 	mediatek,rsel-resistance-in-si-unit;
 	pinctrl-names = "default";
-- 
2.43.0


