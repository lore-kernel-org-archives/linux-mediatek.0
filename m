Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE88C64ED6
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Mar 2023 10:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=85VIfu5uL3eaKc4jaB4Goy7oFn85dlROCu4EsJpy1NY=; b=jJT/6zAeeGfj4NEAClgV05DXCL
	cFbcMYM8UqkhtKNgnhk8BY/UpPhYUTGGD7la5hDb79Tk7bJHmCBHTpv4nYZJq91nVxhJeMDiQPg1s
	nBB2CIwuh0eN+Kw7KgoPoYK0zcCtGk5uR4ZH86AKaNpts82QmyQz97Jxfi5WaZ0LTp3HbU3NUVpuU
	/nTamtuTyzHnCOfMzk4vYW9nelHKUotZS2Bubnd4HdEbx9flsNzasQxVJFQbW7kASxnPIlPwI24eu
	68Cft/v8qerwCp2sIVSdpnce6oM5XgjUc4eCYzNbcCanAAneObXeeJiuAOm4+wOxM95tHuziJEK+d
	7hmZwalQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXJGb-00Fgff-Ja; Wed, 01 Mar 2023 10:00:57 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXJBT-00FdPS-Sq; Wed, 01 Mar 2023 09:55:41 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 407B666020E0;
	Wed,  1 Mar 2023 09:55:38 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677664538;
	bh=KQl+1992t3fzHAo6w7W+uAYOQeZPx/82oAPGoJNpTLE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=csQbvl89FdpuAsidyeMxB6D5ASTOUwPVgoH5Ldnh9fdZZWivCdS2G7KYUswrxJIFV
	 wlAFmBDrciA0DNmpSPQvoxOzg4ZmLz9OX9X3VtLEz5WV1hhfvwpd+WzeYxjm2KVlfq
	 hS4uiwlRKR3Brzj6zUG//2QeXeFiyqTES4H5FZsz31g99FKXGkPK29LS1Hdhw84Bnk
	 YFSmzIp+lzcbLC1dsmzbz8VpIfNd0ZypdPGyhthbuRE7r9TXmiLjEccDqZT0VGDIYU
	 ZaUTYZgqGsmzhNmqQe8JU8wW0ZfGZZB0XXneg2oqrYRgZn7tBUN/ROgSbCrgTR/yxY
	 dZuxGhlvH1HkA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org
Subject: [PATCH v4 14/19] arm64: dts: mediatek: mt8195: Add mfg_core_tmp clock to MFG1 domain
Date: Wed,  1 Mar 2023 10:55:18 +0100
Message-Id: <20230301095523.428461-15-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301095523.428461-1-angelogioacchino.delregno@collabora.com>
References: <20230301095523.428461-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_015540_078925_2898CF02 
X-CRM114-Status: GOOD (  12.81  )
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

Similarly to what can be seen in MT8192, on MT8195 the mfg_core_tmp
clock is a mux used to switch between different "safe" (and slower)
clock sources for the GPU: this is used during MFGPLL reconfiguration
and eventually during idling at very low frequencies.

This clock getting turned off means that the GPU will occasionally be
unclocked, producing obvious consequences such as system crash or
unpredictable behavior: assigning it to the top level MFG power domain
will make sure that this stays on at all times during any operation on
the MFG domain (only GPU-related transactions).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 8f1264d5290b..d116830d6af3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -446,8 +446,9 @@ mfg0: power-domain@MT8195_POWER_DOMAIN_MFG0 {
 
 					power-domain@MT8195_POWER_DOMAIN_MFG1 {
 						reg = <MT8195_POWER_DOMAIN_MFG1>;
-						clocks = <&apmixedsys CLK_APMIXED_MFGPLL>;
-						clock-names = "mfg";
+						clocks = <&apmixedsys CLK_APMIXED_MFGPLL>,
+							 <&topckgen CLK_TOP_MFG_CORE_TMP>;
+						clock-names = "mfg", "alt";
 						mediatek,infracfg = <&infracfg_ao>;
 						#address-cells = <1>;
 						#size-cells = <0>;
-- 
2.39.2


