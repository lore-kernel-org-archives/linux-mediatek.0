Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFB4C27C52
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jun 2024 21:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lX2Ng7XFCj1aDAMOT6Ma1blTJm8OQAtEZ+Gj3uHDogo=; b=xRkYzSfQVMyjpKQ3xylAUpCRbT
	38XNV9hYDfTP6i6MiLtSmNb4ehqK2UiKwZJffMfsjcHiUlioDdJT0JHBQA34T8fnYF57ff5tmIvrt
	sE0kDFJZ+uU3IAkwKunsaoLK/b5oGNa7UTDaVcD3V4m2L3iR8RA+g/pwE9YodEYYrjyURSEIlQkd5
	mZeNgDVey/6bHqLx5rDB2vK2UdcvCeglMWEtuYIV6B/iRGh6vdW9+WB7qjk+vQjwK6okHIeDb0Wxx
	1UAOpG1pbXkvlwMqx8F/bP1Xq8J5vmnkNLkjCXfS5IFKHL7evI3QJE+fStNoZ3MfKhmJvLE3M5W4r
	UaU1IjSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFKPl-0000000BLzc-1YfB;
	Thu, 06 Jun 2024 21:12:53 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFKPh-0000000BLz0-1QJI;
	Thu, 06 Jun 2024 21:12:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717708367;
	bh=gfnupUAPz/WWhzeYdhaephd6S8G+uSgDbb6ssPacr2I=;
	h=From:Date:Subject:To:Cc:From;
	b=ou8kv5INNIPOe3y4ZRitv2E8GiMeLDqmhO0agsTUR5lVsRLxNeknvaBhN6raFEzoc
	 WeuUIZOtMhHhBspNI+KeOet0L6HTZ0XSg71Ylfg/EpGde5h5uqslJ5rZFiB79wlf8h
	 F19SzZAP4FWnPt6wI76tI5KqzXgqc7k2Gey5PIG+yFffnRGGrRqhuyPunF8VTRlISM
	 XliylfIFW4Vk3dDzePOgxGSi/tqJf31C7Smfb1r+feNfQ9f6ohYvFkaOGxIJMJi89N
	 QkGC9KL+WRJzRp4NDX09avtNHAUjVqF9rANgTHflIydBq7YxwMdF7xHIQGFD4S8zcX
	 gyTTkzdDuw/aQ==
Received: from [192.168.1.216] (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 403E9378143B;
	Thu,  6 Jun 2024 21:12:45 +0000 (UTC)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Thu, 06 Jun 2024 17:12:04 -0400
Subject: [PATCH v2] arm64: dts: mediatek: mt8195: Add SCP phandle to MDP3
 DMA controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240606-mt8195-dma-scp-node-err-v2-1-e14702e9d3f2@collabora.com>
X-B4-Tracking: v=1; b=H4sIACMmYmYC/4WNQQqDMBBFryKz7hQzxGC76j2Ki5hMakCNTERax
 Ls39QJdvgf//R0yS+QM92oH4S3mmOYCdKnADXZ+MUZfGKgmXZu6wWlt1a1BP1nMbsE5eUYWQWN
 bz5aM16GBsl6EQ3yf5WdXeIh5TfI5jzb1s/+bm0KFgVyvKZD2hh8ujaPtk9irSxN0x3F8AWOwz
 jLCAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Moudy Ho <moudy.ho@mediatek.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_141249_695216_1BDDFACA 
X-CRM114-Status: GOOD (  10.54  )
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

While the MDP3 DMA controller can look for the SCP node based on
compatible, it's best practice to supply the MDP3 node with a phandle to
the SCP since that allows supporting dual core SCP as well. Besides,
relying on the compatible search causes an error to be printed, since
the phandle is tried first:

  mtk-mdp3 14001000.dma-controller: can't get SCP node

Add the missing phandle to follow the best practice and get rid of the
error.

Fixes: 5710462a116c ("arm64: dts: mediatek: mt8195: add MDP3 nodes")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Changes in v2:
- Added scp phandle property in DT instead of removing the error message
- Link to v1: https://lore.kernel.org/r/20240605-mt8195-dma-scp-node-err-v1-1-f2cb42f24d6e@collabora.com
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 2ee45752583c..a46062258603 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -2037,6 +2037,7 @@ dma-controller@14001000 {
 			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x1000 0x1000>;
 			mediatek,gce-events = <CMDQ_EVENT_VPP0_MDP_RDMA_SOF>,
 					      <CMDQ_EVENT_VPP0_MDP_RDMA_FRAME_DONE>;
+			mediatek,scp = <&scp>;
 			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
 			iommus = <&iommu_vpp M4U_PORT_L4_MDP_RDMA>;
 			clocks = <&vppsys0 CLK_VPP0_MDP_RDMA>;

---
base-commit: d97496ca23a2d4ee80b7302849404859d9058bcd
change-id: 20240605-mt8195-dma-scp-node-err-6a8dea26d4f5

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


