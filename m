Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F253EC282EC
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Mar 2025 22:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IL4ph+nMApQKiG0jjdYDwg3HmV59NomY3yqhCM575c4=; b=Bb2wjRGbtk54eLwT9Plv7Ncd8+
	t4BhGJt+UqF+u4be48oK2SthLXBWF5/PWeHakMkW74pT1nG75vFY4p3BoKahA6v5qsASmNFfHbBx1
	XqDA3NkEEghjqWmKA5NXrYE46vt4GSY9BkcUbI3CDtxvfWlCM8NfEgM6QyL5GwmsvmG2ylfBwohzU
	8eEr9uyBT60bpWOhenKidrXJFyNnk4WVuvZ8znDzPUVUXq5Ma+rozLe2fUC7LxsK99+vggJr2lY1K
	X5ZJ08L3ttswHHD+h5ZoCQ8ErutquYGfmH2vXV+GUtaB7rYHc9XnDTMnKSVxWuATfirahsjHz7Xmv
	uCpvFn5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tufUp-00000007GMP-0gxP;
	Tue, 18 Mar 2025 22:33:15 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tufMe-00000007FBh-10Sh;
	Tue, 18 Mar 2025 22:24:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742336686;
	bh=P1vtmk+9u5G+Zjiu2jlC44IrlzgRmSDtGJusM9LFedk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aJatjFct7ueDLUvYjXrczWUQf/Kjw0f9PhAE4Er+3AZ7E6nfd+0SdMGwfK60GtHCD
	 /Cr97lnTp3Vlv/K+l6dvmsNpajw5+uOYadyUQGeDy539Tbm6bFjB1czcXIq49wGWWn
	 vJp7BspKP9GtRYJ1eQtaUwEv49Fyjk4Y2xAC9gy8IUvmYL5IPBknNfuz1aEbuyOlDS
	 3BXhJdLYDH9wIroXA2B2Ds8izBS6OI+wTMvDg/RPsmnsqgAdy9iA7PNHuvpyDdy2/l
	 /KTyCRXm6LwIzBh4dE+qrGw5iHGr5Luy5lUVDG/cTX/jv5gUaKadzB6GcjSizELErK
	 cUyNzfRZGC4/w==
Received: from [192.168.1.63] (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 80A1017E0B25;
	Tue, 18 Mar 2025 23:24:44 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 18 Mar 2025 18:22:18 -0400
Subject: [PATCH 4/4] arm64: dts: mediatek: mt8390-genio-common: Add
 firmware-name for scp0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250318-scp-dual-core-mt8390-v1-4-8733e192cc73@collabora.com>
References: <20250318-scp-dual-core-mt8390-v1-0-8733e192cc73@collabora.com>
In-Reply-To: <20250318-scp-dual-core-mt8390-v1-0-8733e192cc73@collabora.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Tinghan Shen <tinghan.shen@mediatek.com>, 
 Olivia Wen <olivia.wen@mediatek.com>
Cc: kernel@collabora.com, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_152448_420415_A140D121 
X-CRM114-Status: UNSURE (   8.00  )
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

Add the firmware-name property for SCP core0 so the firmware can be
loaded from its canonical location in the linux-firmware repository.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index 65952bcf5d03e3b22984dd3e997e7107e74dac72..53951817df468ee27d20db1f1028c21a1832b880 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -1060,6 +1060,7 @@ &scp_cluster {
 };
 
 &scp_c0 {
+	firmware-name = "mediatek/mt8188/scp.img";
 	memory-region = <&scp_mem>;
 	status = "okay";
 };

-- 
2.49.0


