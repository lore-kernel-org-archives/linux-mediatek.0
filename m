Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA91C00528
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Aug 2023 23:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9R9TsZJFm9tb6NY9cbrLrjZ7ptggedYqjBEMLSAFnPk=; b=szT54wnyWcA6ciSD8hG/S/pVqj
	xH/fFRN+jES78okZBQlMiK7kRCdgOtv0szUgxhCt4kwK37EbY4Jr6LYRTrZCn+K09WzFeg+Ufh5Bz
	P6r5BH/iHAY3HtF1ESL55+HfsyDutNPjC8fB+PozwjVcwlV+ClwVIb3Ac4jclJ68YmKsjqnhs86RA
	Gxp714Y0jBvsb19QYWLnwC00dAZIV8zhsxdrVQQGrwpnvV9ysSiBOo8jw5SHXX33SzZq8VkUpSgXa
	d1conIa6A31W9Hu82KEqDsooyncMhQDK6/B6poVdE45aAiH8tZFarvp8SG7sMcD9+fMvxtpQn82hc
	OXmbOyKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qS3qb-00DPXZ-0D;
	Fri, 04 Aug 2023 23:04:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qS3qX-00DPX8-2O;
	Fri, 04 Aug 2023 23:04:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 65E616214C;
	Fri,  4 Aug 2023 23:04:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06C0DC433C7;
	Fri,  4 Aug 2023 23:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691190275;
	bh=10xI+HjYOYbP7/HZy6qa0eDd3rO5r9dGZDks2kyrxE0=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=B0EVsNRZtz+8yQpyUje12rZJUflCilAdoN3VAcgm7gvsr46t1+FysJed1KvgGN4S3
	 U9JbN0rSyaC331hEW1wNF4aeDcMz6GZ8uXvBL/qgIb5kETy8g/UmESoKFOvxmKkwos
	 SOrCuQcjeeet99Ys6aH0X2VOz0xebTCmQP05wzK7MlGvfMPI9UQZP02F9rW09S7JTE
	 8t5kOG10C/k/bdIqgikri+7rOfHERunKv3EF/uNm2VDB1kEOJxup63feEQFg15ZTjS
	 M96Qb00ltglGDfRcX/1MGci7YlxxTOyhyFl6xYxLsM5rCHT4BqTPO8sMEN44/DCgcd
	 vTFczCfLaxeZw==
Received: (nullmailer pid 23766 invoked by uid 1000);
	Fri, 04 Aug 2023 23:04:33 -0000
From: Rob Herring <robh@kernel.org>
To: soc@kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Alexandre Mergnat <amergnat@baylibre.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [RESEND PATCH] arm64: dts: mediatek: Fix "status" values
Date: Fri,  4 Aug 2023 16:58:13 -0600
Message-Id: <20230804225813.12493-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_160437_827236_1240D6A1 
X-CRM114-Status: GOOD (  12.56  )
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

The defined value for "status" is "disabled", not "disable".

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
Arnd, Please take this directly I guess. I think Mediatek maintainership 
needs some help. Maybe AngeloGioacchino should be co-maintainer as 
that's the only response I seem to be getting.

I think for future .dts patches I will not bother splitting them up by
sub-arch because it's a pain to chase down the maintainers to apply
stuff in a timely manner. /rant

 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
index e4605d23fdc8..86cedb0bf1a9 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
@@ -585,11 +585,11 @@ &pwrap {
 };
 
 &sata {
-	status = "disable";
+	status = "disabled";
 };
 
 &sata_phy {
-	status = "disable";
+	status = "disabled";
 };
 
 &spi0 {
-- 
2.40.1


