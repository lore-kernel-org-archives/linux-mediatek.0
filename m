Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21064C25B74
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 May 2024 09:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E6DloPiefzm/qXqiNwYZs2huUAIrNESynKBgB03chFs=; b=MkLf+r4xHv+5yFLy7ck80Z0kpp
	O6Jv2ej+DN9Ej6iSwj41d54RhKPM+YaI+JeUTsa/sKwV2OajD+lg803I1bsLyuEwbPTC+C6k8r9sf
	JIhYAhu89089DskgMoEGuabhMtGlorOTpHmWRthi9H2tY/oNvRhD196rqbUCaEGwGpyfbmOJwgeo8
	XZmwmq1i5/Ju/algEUY2nvmqr/KjTFM0hoQYodplNg+dr2YeNUO1zu2SPtTe8w//MejDSeS/Jh047
	/puJBqxl5fzg8zW815QhTA59Zwf3uuqWTL/0B92qtSPqfGyU/eJLqgr9rLmM4LqzdDU+Jlfzz03oI
	flDPo/FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBWpa-0000000ESwp-3HqK;
	Mon, 27 May 2024 09:39:50 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBWp2-0000000ESb7-13Y8;
	Mon, 27 May 2024 09:39:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716802755;
	bh=OiPBAFsu0z+fLHyKUPGOZVRQqVDS03RDPW95gydTYUc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qe8BeP9Z5JJLAQoxQykrmznc8aBQZesyg1HM/YgTqwUcst8/PhQ7I7odtQoXtMsj4
	 qDxi8Nk8jM+DkkrXIkbWRhKq1S9d2JhoeKidroGU9mEn956Y72uEEx7R8HaOYCEBaq
	 oyShpxJ4xtqV4mmoCpA7Ougqcr4c23yXOYQANU52B/uTr+doxsLyAmvBvbu6nPgnA7
	 Ikc6qrv+uTQtBrCmFqze+iWJgxxXWC9Ne1fq08hd49+tldwGJo1d9LVE8qwD565Zcd
	 Lyf5zhkBgCurLFWodNdus1+7UOVU1Mc9oiXIcCR+C3F9ZvmqhaDjWmEPCX6fV5zQAI
	 23fc0X3ySr5Ig==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 29CCA378212E;
	Mon, 27 May 2024 09:39:14 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	mandyjh.liu@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	jpanis@baylibre.com
Subject: [PATCH 3/5] arm64: dts: mediatek: mt8188: Add VDOSYS0/1 support for multimedia
Date: Mon, 27 May 2024 11:39:06 +0200
Message-ID: <20240527093908.97574-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240527093908.97574-1-angelogioacchino.delregno@collabora.com>
References: <20240527093908.97574-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_023916_459574_786AECD3 
X-CRM114-Status: UNSURE (   8.75  )
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

Add support for the two VDOSYS blocks in MT8188, later on used for
various Multimedia related IP, including display and video codecs.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 06fa3b862c31..84f2809eae7a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -969,5 +969,22 @@ vencsys: clock-controller@1a000000 {
 			reg = <0 0x1a000000 0 0x1000>;
 			#clock-cells = <1>;
 		};
+
+		vdosys0: syscon@1c01d000 {
+			compatible = "mediatek,mt8188-vdosys0", "syscon";
+			reg = <0 0x1c01d000 0 0x1000>;
+			#clock-cells = <1>;
+			mboxes = <&gce0 0 CMDQ_THR_PRIO_4>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c01XXXX 0xd000 0x1000>;
+		};
+
+		vdosys1: syscon@1c100000 {
+			compatible = "mediatek,mt8188-vdosys1", "syscon";
+			reg = <0 0x1c100000 0 0x1000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			mboxes = <&gce0 1 CMDQ_THR_PRIO_4>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0 0x1000>;
+		};
 	};
 };
-- 
2.45.1


