Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD78C47077
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jan 2024 19:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6TLPOhvUQxQxpHJYecTyjhD9JdQ3vTgQmkBcVauqkyg=; b=KYK/i521I+f6gfbIURYDTz+rns
	mqpfmFMr8ZHuDlLTi4cG8feY+U50GXRPW178O2D5pCYl9i0bJNRyvHu7WjuZ0IAnJ3w8tiCbCHGrZ
	mJn+EE61A4pxsCA15kO/YSSnQsl1dIZF7YzxDPShmdnShOQGip5YgFT3qf8G3y2Rx0gUTJaXAPEsP
	nPJlpm8SO90gC7SY+743I3KAj6OVhaHndnQGAGx/B5cDCBEA6T+fa3A6XJFuxIlvxGXv2rEYHapj6
	5gLifegsXMW/d9raYZvXiqeq3Mf/E/NNcBjNvSJ7+PNHl9O9AwvFKV3SgQqVTdhwdz5QpgyfxoztM
	RqEr74Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rO19d-0012JU-20;
	Thu, 11 Jan 2024 19:55:53 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rO19Z-0012It-24;
	Thu, 11 Jan 2024 19:55:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705002944;
	bh=SmeOEDSBky71Md5WcIgFutmSu6F+tVl6/qd5e5Nr00I=;
	h=From:To:Cc:Subject:Date:From;
	b=vXUnY8TokOIid07j7JM3xAa6tWdwjj2xyHSGuAXP1cTmJrPb+dtU9lKsB3GINxata
	 uuEkniEOyCZ+2jDJ1Oor6r9Z9D5oecP/6jjVjT0/NytnnbtvFBp84swvmWtXpzVap6
	 2tzb9d3AIWMTzvDV+JXpsJyZDuDb3ql2UTdv04Uo07yd+Rfjoe7taQYgl3RQnhkyis
	 maRheIu04/BTdEN+WxUapufoIdG+H51lE+53vrQiOsXSuq2YE0LoKOuzAW9+VeAFZQ
	 IN81QP0RDna7P9+REF+hROxy82SpudMNKHzeQubyYQqHezxy9bXqatha62wQs6F3Kv
	 5fC+RDYnksbfg==
Received: from localhost.localdomain (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 35F703780894;
	Thu, 11 Jan 2024 19:55:39 +0000 (UTC)
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	Ikjoon Jang <ikjn@chromium.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Stephen Boyd <swboyd@chromium.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] arm64: dts: mt8183: juniper: Remove CrosEC base detection node
Date: Thu, 11 Jan 2024 16:53:12 -0300
Message-ID: <20240111195335.871096-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_115549_844638_28DEC1C9 
X-CRM114-Status: GOOD (  11.41  )
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

The cbas node is used to describe base detection functionality in the
ChromeOS EC, which is used for units that have a detachable keyboard and
thus rely on this functionality to switch between tablet and laptop
mode.

The juniper-sku16 machine is a convertible, meaning the keyboard can be
flipped but not detached. The detection for the keyboard getting
flipped is handled by the driver bound to the keyboard-controller
node in the EC.

Since there is no base detection in this machine, and the device backed
by this node fails to probe and goes unused, delete the node from the
DT.

Fixes: 4fa8492d1e5b ("arm64: dts: mt8183: add cbas node under cros_ec")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dts   | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dts
index 8ac6bf5b17f9..8096ca215258 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dts
@@ -13,3 +13,6 @@ / {
 	compatible = "google,juniper-sku16", "google,juniper", "mediatek,mt8183";
 };
 
+&cros_ec {
+	/delete-node/ cbas;
+};
-- 
2.43.0


