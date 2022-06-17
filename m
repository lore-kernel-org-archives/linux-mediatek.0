Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB408C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 22:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hcQBUS0J30U8xugY8dWgr8kbhk2f8a3f6lCUgKub7yU=; b=TGHhp1ldpSV2NR2rs7cKi6Y7fI
	eIt9iej7uhO5ARhwzd00uV/DHSp0ir5lSzT2tcJlsesRXvWtGzB60VebD0MDQLsXXd7IOJ3pBdCM6
	LzP0deHJegYWDkQnC+qEJfFnWQgeJCv4ygYTNKu5OWY+yPDmgh1ZM5wfEgYxT5t0v/oT36yfahM0y
	YVGhsGA1JNJb+1tTKu3OvOZpp7FpDRyV2JssvdBEKAD/stpLL+YyXjEPQ/JBo1BydQrAszwzolglO
	2aH2KcUr262KnnPKmBKdZQrw1H52nvoz9SlRkGi/ndGJzAVdB8BAIh3dlI2tpDTdbwft0zQR0wgy8
	ri8ZD5fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2KTj-009Piw-F4; Fri, 17 Jun 2022 22:30:11 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2KT7-009PSH-FV; Fri, 17 Jun 2022 22:29:34 +0000
Received: from notapiano.myfiosgateway.com (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 19FB966017D5;
	Fri, 17 Jun 2022 23:29:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655504969;
	bh=LiuIt0O1st4pigoWLWLdzdDQsMQyWjLJmbkbK2WQ2JQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B0qW1zKQn7s7lkcwKhRcS7dJcW/uaGGSGTqmn2M3zYGnho0ENhwBUOMxi/EgdpwNs
	 WkutZM4ZhmAeCcSlxmOJJZEpmsZk1QcxOhMdiD95PQSar8nhW/gNMHVk1pSR7BCCtV
	 yfZ+Lpb3S0JcuI0/w530vjQcDMRIdm9NT3OMSen1OoiyhYS2gK8/j0EmZKqtnnjc8q
	 UVJny3NnxHeHBrZDbCzC5CJ4ORVYEvfpqWM19uKwl1xcqgAJ7gj4F5HS4JH0FXbll9
	 C7ppEBde34noGxQ5v5sNLw2BNIt0PYWAYmIL7JpKMm/AR//aXnW0YJiheLWyrltRVO
	 5mkAVMTkZwQrA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 3/3] arm64: dts: mt8192: Follow clock order for XHCI
Date: Fri, 17 Jun 2022 18:29:16 -0400
Message-Id: <20220617222916.2435618-4-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220617222916.2435618-1-nfraprado@collabora.com>
References: <20220617222916.2435618-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_152933_689955_AA530814 
X-CRM114-Status: GOOD (  11.29  )
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

Even though "ref_ck" and "xhci_ck" are optional clocks for XHCI, the
binding expects them to follow a specific order. Fix the order to get
rid of a dtbs_check warning.

Fixes: e5aac2258e66 ("arm64: dts: mt8192: Add xhci node")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 733aec2e7f77..c8158b573bf8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -723,9 +723,9 @@ xhci: usb@11200000 {
 			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
 						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
 			clocks = <&infracfg CLK_INFRA_SSUSB>,
-				 <&infracfg CLK_INFRA_SSUSB_XHCI>,
-				 <&apmixedsys CLK_APMIXED_USBPLL>;
-			clock-names = "sys_ck", "xhci_ck", "ref_ck";
+				 <&apmixedsys CLK_APMIXED_USBPLL>,
+				 <&infracfg CLK_INFRA_SSUSB_XHCI>;
+			clock-names = "sys_ck", "ref_ck", "xhci_ck";
 			wakeup-source;
 			mediatek,syscon-wakeup = <&pericfg 0x420 102>;
 			status = "disabled";
-- 
2.36.1


