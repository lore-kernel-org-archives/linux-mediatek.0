Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7329CDB47E
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Oct 2023 15:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ruH46/Sv5ry9MQrljpI9Fl9XOAOSQSv72qxbvgXgtX8=; b=3mbnYeva7stptVo1qBAlPI1fdj
	QO/90HoCURTwlHe4OXw9VPc8bXh+NhVAQWvs7VQKRAEu1y8z7vdVw4Y7NBq/Yo7e+s6UsB8uc9QTi
	0GQxiejCMjfZhlKgFCPpyAWBfWVUCLvzewvAw8+QLX7jaCaGTc2eDYXJZQGcLZ4W87bSb0UlS8XHq
	sriNxAwHLLEmG9xbIkoXYLOFrUqsoz+AmAt1WFXTOqdvmHGB6a8MP95+9xuUnw2Jr80pYTMRcFNG6
	s4V5WBNDOxycxLEZVH7egnNHQlSW9/Eiajvp9qaCk3e5sWbeikvtNaopwKM1yQesmpbyOQUHZuOOW
	WbicDqDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrJlQ-003e6P-0W;
	Fri, 13 Oct 2023 15:07:44 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrJlM-003e5N-1J;
	Fri, 13 Oct 2023 15:07:41 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 02377660731E;
	Fri, 13 Oct 2023 16:07:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697209655;
	bh=KENb6WnDrYEIv2tlDoQvqvhs4xHUGs9UXkMbd8bq8HE=;
	h=From:To:Cc:Subject:Date:From;
	b=gNe5ra6S/GCUHQiYbmDocwcriA4LrHATwxyGJWNY9fFpxT3CIgJdlrKcY0Uy0Khvw
	 djPpT82RXWmws+oEHWKvrTMRhRjXmcxW2D6guBRX2nfRTatZGqYw7+6tKPSDyn3MSO
	 2J8qVXPOGft/KwQahO9ffeE5TrL33P87geTiqf0JqfekkrdkmWKormxIzzXn/6Kub1
	 e1yPci12wiV2so5j1xGqDkAiziV711S4ue0TGDWlaUAi3yPrYgJhmdbhbsm/T2V9H5
	 L+bRkuSuTVfy0FmFtdC3Y+JEcepB0BaG7EiQk8ThtbIAMsLsfcqcnKlWCZp5LsUT6m
	 JWKmBgnm8ekQw==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] arm64: dts: mediatek: mt8192-asurada: Remove CrosEC base detection node
Date: Fri, 13 Oct 2023 11:06:38 -0400
Message-ID: <20231013150729.750609-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_080740_617227_C108472E 
X-CRM114-Status: GOOD (  13.09  )
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
Chen-Yu,
if you could test this on Hayato just to be extra sure tablet mode
detection still works fine, that'd be appreciated as I don't have access
to one. That said, I've tested on Tomato which should behave exactly the
same so I'm confident this node was entirely unused.

Thanks,
Nícolas

 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index f2281250ac35..02ce05bc151a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -1336,10 +1336,6 @@ cros_ec: ec@0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		base_detection: cbas {
-			compatible = "google,cros-cbas";
-		};
-
 		cros_ec_pwm: pwm {
 			compatible = "google,cros-ec-pwm";
 			#pwm-cells = <1>;
-- 
2.42.0


