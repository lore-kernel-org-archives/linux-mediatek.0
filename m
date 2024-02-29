Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C84C54798
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Feb 2024 19:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MMm8Egc0i/uXXRHq7J2E/e5hrHjB5yo+K0ec+4m18oY=; b=f2offPHj2RLc85SRN2R7dkdJ9E
	E5HBxr91UZl3eXSFbcLxNCkgAXfXC4zTVtEjTR0LKaUpd3uHJzVYcbb/eSz5djAnmlpPuZsuf5xn5
	2gYuc0dwRetX06zeTYw1a18gf16JAlF2I+aTXAle3k55UOC/cVLYuPgG1Uv8UiG08BCRT6Bq9nf0P
	UXMob8yVjP/rNueg16QeoLV1ciiz2cHfgDjbjrl+D3fwYk1nrRuzgQ/jGHb7R6W0n91GSDLqxIsrT
	dm5Q27X+hDwhv6oG3UcZDSTBKm7KT18mkjzgyRUFhaAWVT7dSYqMRNH895SkLun4aVb8v2REGmHpt
	pBRVp1dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfmLO-0000000Ewn3-2KYB;
	Thu, 29 Feb 2024 19:45:26 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfmKt-0000000Ewaq-0ImS;
	Thu, 29 Feb 2024 19:44:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709235893;
	bh=EyvPm0SXhcvriUDncncMFebQg0lQMcMsL/UTspQPx/I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=u9Z5W72Hfbqdc4elUBeUYU8z3Q7CvyoJ0tkniAgRzd2Jyc6YZmaGYlrObvcR9I8Fz
	 lGfz5GHesiPMNEgb1TyiEoFhT8b37z2dN7GtAPddYLDb/yYsaB1wxwOrwfO1fCvWyH
	 0O8znoqy3Zu+gNkir+fMos8bu5lsPnti4RzTP+eEcfD5LrxRbs4N+e9HoYT247+Qd2
	 1+DaK8iZxDAeU93QVhXCUwidCQaJEPTqCpZe1q5JV5X/nTD02QEwQYAGYDhjC1O/zy
	 5+CivC5a6kc70UmJsMMqzaFDEAWNdOWLrFvv7gS6I7W8w21COc2RwYcbI0TP8v9Coj
	 6UjdJXAtpZd9Q==
Received: from [192.168.1.200] (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9554237820EE;
	Thu, 29 Feb 2024 19:44:51 +0000 (UTC)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Thu, 29 Feb 2024 14:44:29 -0500
Subject: [PATCH 2/4] arm64: dts: mediatek: mt8195: Add missing
 gce-client-reg to vpp/vdosys
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240229-gce-client-reg-add-missing-mt8192-95-v1-2-b12c233a8a33@collabora.com>
References: <20240229-gce-client-reg-add-missing-mt8192-95-v1-0-b12c233a8a33@collabora.com>
In-Reply-To: <20240229-gce-client-reg-add-missing-mt8192-95-v1-0-b12c233a8a33@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>, 
 Tinghan Shen <tinghan.shen@mediatek.com>, 
 "Jason-JH.Lin" <jason-jh.lin@mediatek.com>, 
 "Nancy.Lin" <nancy.lin@mediatek.com>, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_114455_325858_555E6B83 
X-CRM114-Status: UNSURE (   8.93  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add the missing mediatek,gce-client-reg property to the vppsys and
vdosys nodes to allow them to use the GCE. This prevents the "can't
parse gce-client-reg property" error from being printed and should
result in better performance.

Fixes: 6aa5b46d1755 ("arm64: dts: mt8195: Add vdosys and vppsys clock nodes")
Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index ea6dc220e1cc..f2912e1a0e49 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -2028,6 +2028,7 @@ vppsys0: syscon@14000000 {
 			compatible = "mediatek,mt8195-vppsys0", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
 			#clock-cells = <1>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0 0x1000>;
 		};
 
 		dma-controller@14001000 {
@@ -2251,6 +2252,7 @@ vppsys1: syscon@14f00000 {
 			compatible = "mediatek,mt8195-vppsys1", "syscon";
 			reg = <0 0x14f00000 0 0x1000>;
 			#clock-cells = <1>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0 0x1000>;
 		};
 
 		mutex@14f01000 {
@@ -3080,6 +3082,7 @@ vdosys0: syscon@1c01a000 {
 			reg = <0 0x1c01a000 0 0x1000>;
 			mboxes = <&gce0 0 CMDQ_THR_PRIO_4>;
 			#clock-cells = <1>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c01XXXX 0xa000 0x1000>;
 		};
 
 

-- 
2.44.0


