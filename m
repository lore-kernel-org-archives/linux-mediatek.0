Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18953D7831B
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2024 13:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=b34YvHtqxda9zhxpm4/WgVMhfPl7xcswd3HT+uIodbk=; b=yrtsTEaGIUV6LNYVUrNYmwFeQg
	GFGjeEydt4x0DjjiKREIijyd/nVKWipj5dYRIFfkmqqxQJfGsA6Vi1DQbLrJUD3yjixr/awVEer4j
	2BrxfYZOKkmBsE0zbPsn09iZQ+RzmX5SFmvAht6x2Rvyqt9nyN8zw3HmRtOiEfFMe+Au6pYhrbjQ4
	2sVMUjjv4pn+McqeZ14Wb69OZkpncHIWvxznnKynFTyAHAOV4u7aN/crjuwj+u0WbPIfZ8fKPDTW6
	2+dYaFf/y0wIH2rL48gepIfB8hS/buHaNHBhGXNoyv9zRJD/PxX6r1mJ7DYNXHqnJxS5YK/bl7ADr
	zVWTiw8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI62n-00000006ABh-0WvX;
	Mon, 02 Dec 2024 13:00:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI62k-00000006AAX-3Shk
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Dec 2024 13:00:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AFF95A40B5F;
	Mon,  2 Dec 2024 12:58:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D110C4CED1;
	Mon,  2 Dec 2024 13:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1733144449;
	bh=FQOXZBFxn3veCwnvT9pFlIikl1ThGm7bEL0mPnHBeRQ=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=WmlfZSwV+SyHoHLGBUUZ1GQub2FR6fJzUNEzYpeFo4O7QC1L7v7Tzz9hb/XU6/U/B
	 nHUb93DFuQr/juxIKBHnzxdqQEUHAtXHRI69oDGIs3PGGD5teL6g0v8n5MBFd0svAb
	 pvzsM2FXcTHWG1DifztzWx0d91P3YJg50hxCqHpg=
Subject: Patch "arm64: dts: mediatek: mt8195-cherry: Mark USB 3.0 on xhci1 as disabled" has been added to the 6.6-stable tree
To: angelogioacchino.delregno@collabora.com,gregkh@linuxfoundation.org,koichiro.den@canonical.com,linux-mediatek@lists.infradead.org,matthias.bgg@gmail.com,nfraprado@collabora.com,sashal@kernel.org,wenst@chromium.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 02 Dec 2024 14:00:43 +0100
In-Reply-To: <20241202081552.156183-2-wenst@chromium.org>
Message-ID: <2024120242-trapped-query-ed27@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_050051_002310_9CAC884A 
X-CRM114-Status: GOOD (  11.26  )
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


This is a note to let you know that I've just added the patch titled

    arm64: dts: mediatek: mt8195-cherry: Mark USB 3.0 on xhci1 as disabled

to the 6.6-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm64-dts-mediatek-mt8195-cherry-mark-usb-3.0-on-xhci1-as-disabled.patch
and it can be found in the queue-6.6 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-95935-greg=kroah.com@vger.kernel.org Mon Dec  2 09:16:34 2024
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon,  2 Dec 2024 16:15:50 +0800
Subject: arm64: dts: mediatek: mt8195-cherry: Mark USB 3.0 on xhci1 as disabled
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: "Chen-Yu Tsai" <wenst@chromium.org>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, "Matthias Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, "Koichiro Den" <koichiro.den@canonical.com>, "Nícolas F. R. A. Prado" <nfraprado@collabora.com>
Message-ID: <20241202081552.156183-2-wenst@chromium.org>

From: Chen-Yu Tsai <wenst@chromium.org>

[ Upstream commit 09d385679487c58f0859c1ad4f404ba3df2f8830 ]

USB 3.0 on xhci1 is not used, as the controller shares the same PHY as
pcie1. The latter is enabled to support the M.2 PCIe WLAN card on this
design.

Mark USB 3.0 as disabled on this controller using the
"mediatek,u3p-dis-msk" property.

Reported-by: NÃ­colas F. R. A. Prado <nfraprado@collabora.com> #KernelCI
Closes: https://lore.kernel.org/all/9fce9838-ef87-4d1b-b3df-63e1ddb0ec51@notapiano/
Fixes: b6267a396e1c ("arm64: dts: mediatek: cherry: Enable T-PHYs and USB XHCI controllers")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20240731034411.371178-2-wenst@chromium.org
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi |    1 +
 1 file changed, 1 insertion(+)

--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -1296,6 +1296,7 @@
 
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	vbus-supply = <&usb_vbus>;
+	mediatek,u3p-dis-msk = <1>;
 };
 
 &xhci2 {


Patches currently in stable-queue which might be from wenst@chromium.org are

queue-6.6/arm64-dts-mediatek-mt8183-kukui-jacuzzi-fix-dp-bridg.patch
queue-6.6/arm64-dts-mediatek-mt8183-kukui-jacuzzi-add-supplies.patch
queue-6.6/revert-arm64-dts-mediatek-mt8195-cherry-mark-usb-3.0-on-xhci1-as-disabled.patch
queue-6.6/arm64-dts-mediatek-mt8173-elm-hana-add-vdd-supply-to.patch
queue-6.6/arm64-dts-mediatek-mt8195-cherry-mark-usb-3.0-on-xhci1-as-disabled.patch

