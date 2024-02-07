Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C125AC4828D
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Feb 2024 20:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PUpe2Jbk4fy9t6F9qGtCajORXbieVm36DSqD2L9FrbQ=; b=j05EPBuZwckgTnk0YEah4RDZVt
	pAlGaA8Y6WA5dk/b+mifgyJeXOPc6QXWJ2MZqEJoqceZ4QVJiUwYQSWXeK6h08FCjjjQLXnCatTTs
	Jy0QvFlX+CbnoVvGywATns+OZPfCaDJ6HHaTrBMFJFT0TaqD6iHhkQvzbeKufMkgC1q9vR42UU1Uk
	6EgvTWfBjJAhObLw31Gsdu0DA12Xg5f5hxPQ7fpI0Bc3ehCV2rk1LLnW9Vvq27OXVqQ+jF+B8WuRR
	VQ79C7dq5l2mVYZxXuuq+9XfkHCe5FB7dpEtBtHbD5xfZO1GtFlOQQRuvsitEjj9bVsUniqd+GSMN
	SaxGMhtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXoEN-0000000BfyQ-16Fo;
	Wed, 07 Feb 2024 20:09:15 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXoEJ-0000000BfwC-2hKq;
	Wed, 07 Feb 2024 20:09:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707336544;
	bh=5PzECJm0CObzRT3GachtnhewUzsyt5UC6ouVCFeWJAo=;
	h=From:Date:Subject:To:Cc:From;
	b=vIkO2YUqLigxb5vwOJzXDLfScVqxvRhguAs0B1dAJ7rLb/rcNbiNjvTs8Tv1wKaaE
	 h5VAlF++5pN6jSSQ/e4ga1ZKv4Vt2Iz0wGu8t5lpCMqvaqKbWWMbR7KF7TJvMNcpil
	 uCo7h0rT93UulZKHU/JjTvPOCd+1Mmj/aBO9w0JX7qpzWIZzy2rBdaZm6P8KwK58Mb
	 AzAX8c4FolpSu/8zj9PpX5/gUmibOwUrR/ICsgwR3juNNkdz0bv0e0+1BHyuvkBFz1
	 qkRhXxwJHSp2wk2xOv6MEN5Uk7wstoiwrYA+f9DGAMxGtwEuH2QaDF+wSPBQ6DBYRd
	 4SU3s4o3tu/WA==
Received: from [192.168.1.249] (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4FA9937811CF;
	Wed,  7 Feb 2024 20:09:02 +0000 (UTC)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Wed, 07 Feb 2024 15:08:42 -0500
Subject: [PATCH RESEND] arm64: dts: mediatek: mt8192-asurada: Remove CrosEC
 base detection node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240207-mt8192-asurada-cbas-remove-v1-1-04cb65951975@collabora.com>
X-B4-Tracking: v=1; b=H4sIAEnjw2UC/zXNMQ+CMBCG4b9ibvZIW0TAyUFWBx2Nw1EOaQKUX
 JGYEP67jYnj+w3Pt0JgcRzgtFtBeHHB+TGG3u/AdjS+GF0TG4wyB2VUjsNc6NIghbdQQ2hrCig
 8+IXRUsa6sUVZZwQRmIRb9/nhD7hV9+p6gWfcW/EDzp0w/elUK53qTOWmTPJMHVWJGsdWaIon/
 mx931PthRLrB9i2L+jnpzu2AAAA
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_120911_870277_A98814CC 
X-CRM114-Status: GOOD (  10.35  )
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

The commit adding the ChromeOS EC to the Asurada Devicetree mistakenly
added a base detection node. While tablet mode detection is supported by
CrosEC and used by Hayato, it is done through the cros-ec-keyb driver.
The base detection node, which is handled by the hid-google-hammer
driver, also provides tablet mode detection but by checking base
attachment status on the CrosEC, which is not supported for Asurada.

Hence, remove the unused CrosEC base detection node for Asurada.

Fixes: eb188a2aaa82 ("arm64: dts: mediatek: asurada: Add ChromeOS EC")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 6867c4ad04a9..9b738f6a5d21 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -1337,10 +1337,6 @@ cros_ec: ec@0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		base_detection: cbas {
-			compatible = "google,cros-cbas";
-		};
-
 		cros_ec_pwm: pwm {
 			compatible = "google,cros-ec-pwm";
 			#pwm-cells = <1>;

---
base-commit: 2ae0a045e6814c8c1d676d6153c605a65746aa29
change-id: 20240207-mt8192-asurada-cbas-remove-ca5e1dc89b5a

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


