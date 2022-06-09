Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA04C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 11:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EijUNgmw7oSoWA6a5WhbXZVqMfxjIE8FweEYfSlVRCs=; b=aZZDTNpMluTe3N
	Gu27mm40BsrJdIwHGPThzFLyQ17vdE/v81oPS7bR2m1jG2oBslVl169MxrF5nYM8tjd3Ivrd6WWCY
	S9N6mM+FPK67N+YgXbqw70uaMj17I+197d1BhGtlhNNE5vKC9BHfHKlRrxGA5gBeIpZ39pDCDa862
	XL0O7Hjb5CE7aJZ6x3a9qNmjDSfZWZp+VBDeDRvh8MwjkNUeH3xRB3AAvpAlr6xTsMNO+Je/s00Vk
	KJgi5L5/f0vZFoxajkMj8C2s2jbseCH7xi9GsqNAE9gvr+2Ls+yrbsLO7/xpZYgsFCJyFSYmPwYx2
	nFk4cZSli3TbO5YEEqRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzGJe-001Ip8-UK; Thu, 09 Jun 2022 11:27:06 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzGFy-001GQR-Uj; Thu, 09 Jun 2022 11:23:20 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EAB4366017DA;
	Thu,  9 Jun 2022 12:23:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654773797;
	bh=anrmzD+t/qVGkb+sXMtzx5Tb0qXyjpZIloaFJGDHMDQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KRjmrjOo76qrWUeoSIFEZ/k+0evvk/sWJUZXzutKJLAnMF/R35VRRPVNpmgHM2Kek
	 HSxDO6ki1/D57i6R5mInVVuOtAI/GSJpnHXPq+ciP8fzp9MyPmBPPj0GieoO5DGOPb
	 CCzFLdklOu9NcatZSPYpFg5hgSZAruVDRPTbj21X6yBsiBHYR88tu4wQ4axVAcdJOM
	 M9WYcRrzxbczJDixAiOsuUjrrkQtsukC38YfcWnJvIDuZnFtP0ViO/hSddIRNfikgR
	 yQA9NYcmTF/hDvpeJFDNUcr1cVxcm8bJrDClWkQRWfiey+V1ZHqlGad3/YGLlJk8bT
	 V2yupPBZjq+Rw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	konrad.dybcio@somainline.org,
	marijn.suijten@somainline.org,
	martin.botka@somainline.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	paul.bouchara@somainline.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 10/10] arm64: dts: mediatek: mt6795: Specify interrupts for vGIC
Date: Thu,  9 Jun 2022 13:23:03 +0200
Message-Id: <20220609112303.117928-11-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220609112303.117928-1-angelogioacchino.delregno@collabora.com>
References: <20220609112303.117928-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_042319_190235_9C1FB1DC 
X-CRM114-Status: UNSURE (   7.74  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add the maintenance interrupt for GIC-400.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index f52800e287ab..d3bce9429e9b 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -246,6 +246,8 @@ gic: interrupt-controller@10221000 {
 			      <0 0x10222000 0 0x2000>,
 			      <0 0x10224000 0 0x2000>,
 			      <0 0x10226000 0 0x2000>;
+			interrupts = <GIC_PPI 9
+				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
 		cci: cci@10390000 {
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
