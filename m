Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5466CC48BF6
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Feb 2024 19:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QO+f/OuAPWGAgqqw/D8SoDwJhazuOmlJ2HSRxuZdTIo=; b=zqSapcWtSUOsZL8k0VOdUs116P
	DINMymfBhLt86dZ03rZAupnGG9HB46PpvBVE1qYfIJSHVrfdsZbzkGCIKOmVJdfLUBzyiMiwzU1dw
	V1hoo7NZb0orWxtkwirvCcqSiVaQHXeFEHxoWtPn4GhAZODGy9a8CFnEos/VFYOpKE/RSoYxtZhhY
	yNPm1E9dmsWzK4LYXTm02tQPjpOdt+aRmF9t4hIE/wvXOtoM/rOOqSxa4p9A1S4i9ofXNZouW43nt
	RGNsrBbZBa8Tvk2PyxW3L4GS5K/gSB/WjBxhtrp0fKcDaefC5ZRkuKDmmqxFYckYOBgpsgcMK8G5i
	jRR+eUMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfmLh-0000000EwxG-3jce;
	Thu, 29 Feb 2024 19:45:45 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfmKz-0000000Ewdk-3YFr;
	Thu, 29 Feb 2024 19:45:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709235900;
	bh=SG+BNB9V12ilA2yy6/wOnUl0q+5MszvwNnI3Q2lsT4o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JyRjACOtVwRIDyFZBlm2b3Sl2LfyksB2Ms9fxLyNNItBrhnxr34d180RyVl6uUdfP
	 MhUQEdIH8Cg/gACRmnYYCkMPfc73kArD+znNzA0eG4+FpwxvapbgBJS9uPdy7xGrPk
	 u0YCMYSSUk9ymTM2pID6BI+mVpkTKowhhbzaiR//U2xl4Bu9uxErv734g+ABfwo/nd
	 X0PCPJ2m30eahQCpLxtRqqgzpjWZ/5iUSFSVXvQ8VKisJ6OlsKiTi9MUdmq5waCJ7/
	 I8aO8mGRrY64EuxqlGIzROi8GqdcN1bLw/qp0yT0tOBjsb1D0hasoy7ak6FPL+Jlcf
	 XIWu9Ak9T3Avw==
Received: from [192.168.1.200] (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9F1BF37820E2;
	Thu, 29 Feb 2024 19:44:57 +0000 (UTC)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Thu, 29 Feb 2024 14:44:31 -0500
Subject: [PATCH 4/4] arm64: dts: mediatek: mt8195: Add missing
 gce-client-reg to mutex1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240229-gce-client-reg-add-missing-mt8192-95-v1-4-b12c233a8a33@collabora.com>
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
X-CRM114-CacheID: sfid-20240229_114502_177566_055B9C32 
X-CRM114-Status: UNSURE (   9.40  )
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

Add the missing mediatek,gce-client-reg property to the mutex1 node to
allow it to use the GCE. This prevents the "can't parse gce-client-reg
property" error from being printed and should result in better
performance.

Fixes: 92d2c23dc269 ("arm64: dts: mt8195: add display node for vdosys1")
Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index fd074103979c..5d8b68f86ce4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -3335,6 +3335,7 @@ mutex1: mutex@1c101000 {
 			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
 			clocks = <&vdosys1 CLK_VDO1_DISP_MUTEX>;
 			clock-names = "vdo1_mutex";
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x1000 0x1000>;
 			mediatek,gce-events = <CMDQ_EVENT_VDO1_STREAM_DONE_ENG_0>;
 		};
 

-- 
2.44.0


