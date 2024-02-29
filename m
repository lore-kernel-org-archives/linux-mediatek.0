Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A718C54E49
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Feb 2024 19:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DLYUiy2ZdgM9pt8Rb29MY8lqGAgwJ3fO7KkZ5lylSZE=; b=HIFbbLI7z8skDpUKrvq81PbRr7
	ijxd7PWon3pur8EI2fW9pRRQurTot5I0giCGjApJrP8szy/KwRWaXocW52IaIhO89pOQZc1munAkE
	fGrlq0s4JnB0VIQLFmt9wIz7/c66Xv4dxKQIu67NqtbXquOCWuG5Dpw0FBWWoB4+CmrDMBvfhFsye
	PRCzpJGWYVWuPGuMKRE0cTBfWNIEYPvniuAVxYUnVWwxhXHpTjIcnFuyAvYWvqdj8ZpTwYEPcPMPN
	R70AaNGwBw29M4kZGhXumWL4OYbQHE69FTlF0Y6LudPi8xrIxSKKGaoHx8Cs33OpsKiSWxKGhuhVv
	3Wjxm+kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfmLY-0000000Ewsf-3UGP;
	Thu, 29 Feb 2024 19:45:36 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfmKw-0000000EwcN-1lgg;
	Thu, 29 Feb 2024 19:44:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709235897;
	bh=JoI5PzB7Uwtf6ghTh18wTJK5kDEzfk5MGVMmMtia5Yc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dp/5TFnP7UOdtnGJW8/TQMfvjgLPg4yy6tySuLfjJIMC6wjw3cM/XUAsD8YK1Slvw
	 MOTLIUCao5kr0+nr7QllK64+yFb4pxqHK4LaKNypcXxD24RzfPV910iDKcy2rTJM48
	 vz5frg+YsAlllNsQPvSkQb6HKiVhRleyt/C0Qq/Z10Y+WVwgYi1ziTcZwXX9JynE3i
	 NjU40S5hWB7i+T/RcwJ6N772gEH4pnUSKITAAsdBFqi3qm2P/QKQjOY0PdjliP6zUk
	 zlKB8Konnv9eC5adgQi54Ez/x8nj1Tfe8HJJlWbPLO9i/jUeMuk9U3FGuLYwfCJddS
	 fmHyXg5rK8xBw==
Received: from [192.168.1.200] (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 42EE737820ED;
	Thu, 29 Feb 2024 19:44:54 +0000 (UTC)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Thu, 29 Feb 2024 14:44:30 -0500
Subject: [PATCH 3/4] arm64: dts: mediatek: mt8195: Add missing
 gce-client-reg to mutex
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240229-gce-client-reg-add-missing-mt8192-95-v1-3-b12c233a8a33@collabora.com>
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
X-CRM114-CacheID: sfid-20240229_114458_680271_06D05A45 
X-CRM114-Status: UNSURE (   9.50  )
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

Add the missing mediatek,gce-client-reg property to the mutex node to
allow it to use the GCE. This prevents the "can't parse gce-client-reg
property" error from being printed and should result in better
performance.

Fixes: b852ee68fd72 ("arm64: dts: mt8195: Add display node for vdosys0")
Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index f2912e1a0e49..fd074103979c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -3264,6 +3264,7 @@ mutex: mutex@1c016000 {
 			interrupts = <GIC_SPI 658 IRQ_TYPE_LEVEL_HIGH 0>;
 			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
 			clocks = <&vdosys0 CLK_VDO0_DISP_MUTEX0>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c01XXXX 0x6000 0x1000>;
 			mediatek,gce-events = <CMDQ_EVENT_VDO0_DISP_STREAM_DONE_0>;
 		};
 

-- 
2.44.0


