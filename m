Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F22D78319
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2024 13:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Uj2/xrmqPhCTuIIoLM1cGtB1WlPOwHRH6yz+7TfAeBw=; b=ff82Pkn3n1/Giem3Lgrdf6di79
	BRhQ7F8dOHW50tW5liyUxrmFk3ioEksUl1tDq5/DH2nc9+cBcr+1AhJvXtMoQtZ1RbrShdmKAm4VV
	GQ0opfMMCle/M5zN9LLWEuEPmpS/kAgJKu2FHWq5GIYvsvMrCqaKADQuZWhA5PrcP4KAPerzCguKA
	gSV2O8xsh5ibtI1Px/8TMDyWOieSMumqIKallNdIgkd5M3xNx8vAY7qljB+/731b7Q/Pasxfv1V0x
	c93PA1nMRtgUx3BCodmmY/EoDvm88ipE1+C4FJmNQkRjX7nDIETxDwLK7Z2uZM6dkSvagE6tV97Wb
	iw7OJABg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI630-00000006AI1-3bI4;
	Mon, 02 Dec 2024 13:01:06 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI62y-00000006AGZ-1ShF
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Dec 2024 13:01:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 49D82A40C9B;
	Mon,  2 Dec 2024 12:59:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD8DEC4CED1;
	Mon,  2 Dec 2024 13:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1733144463;
	bh=N3SM040uS2rx/W/DIrvVP6TTmJM6NfaQSvcPhiakICI=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=dwJyLFZP9YM2U2T+KNht/bytfPNfRsM+wszXelGOZ9ivmxC5gtaz8id6OynhjQyhG
	 MUsmFTByiSpw7uBd6eJzKi2+XAKEYoRf4L9GLp6M2XHvEXgl7R2c04nC+1iZg40PzM
	 b3My0VnBT1hWBfv9tkNXoQoYmP4RVswX/jnjPEY4=
Subject: Patch "Revert "arm64: dts: mediatek: mt8195-cherry: Mark USB 3.0 on xhci1 as disabled"" has been added to the 6.6-stable tree
To: angelogioacchino.delregno@collabora.com,gregkh@linuxfoundation.org,koichiro.den@canonical.com,linux-mediatek@lists.infradead.org,matthias.bgg@gmail.com,sashal@kernel.org,wenst@chromium.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 02 Dec 2024 14:00:48 +0100
In-Reply-To: <20241202081552.156183-1-wenst@chromium.org>
Message-ID: <2024120247-entrust-scoring-a72f@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_050104_517509_9369FF23 
X-CRM114-Status: GOOD (  12.40  )
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

    Revert "arm64: dts: mediatek: mt8195-cherry: Mark USB 3.0 on xhci1 as disabled"

to the 6.6-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     revert-arm64-dts-mediatek-mt8195-cherry-mark-usb-3.0-on-xhci1-as-disabled.patch
and it can be found in the queue-6.6 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-95934-greg=kroah.com@vger.kernel.org Mon Dec  2 09:16:23 2024
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon,  2 Dec 2024 16:15:49 +0800
Subject: Revert "arm64: dts: mediatek: mt8195-cherry: Mark USB 3.0 on xhci1 as disabled"
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, Koichiro Den <koichiro.den@canonical.com>
Message-ID: <20241202081552.156183-1-wenst@chromium.org>

From: Chen-Yu Tsai <wenst@chromium.org>

This reverts commit 090386dbedbc2f099c44a0136eb8eb8713930072.

The hunk was applied to the wrong device node when the commit was
backported to the 6.6 stable branch.

Revert it to re-do the backport correctly.

Reported-by: Koichiro Den <koichiro.den@canonical.com>
Closes: https://lore.kernel.org/stable/6itvivhxbjlpky5hn6x2hmc3kzz4regcvmsk226t6ippjad7yk@26xug5lrdqdw/
Fixes: 090386dbedbc ("arm64: dts: mediatek: mt8195-cherry: Mark USB 3.0 on xhci1 as disabled")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi |    1 -
 1 file changed, 1 deletion(-)

--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -1312,7 +1312,6 @@
 	usb2-lpm-disable;
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	vbus-supply = <&usb_vbus>;
-	mediatek,u3p-dis-msk = <1>;
 };
 
 #include <arm/cros-ec-keyboard.dtsi>


Patches currently in stable-queue which might be from wenst@chromium.org are

queue-6.6/arm64-dts-mediatek-mt8183-kukui-jacuzzi-fix-dp-bridg.patch
queue-6.6/arm64-dts-mediatek-mt8183-kukui-jacuzzi-add-supplies.patch
queue-6.6/revert-arm64-dts-mediatek-mt8195-cherry-mark-usb-3.0-on-xhci1-as-disabled.patch
queue-6.6/arm64-dts-mediatek-mt8173-elm-hana-add-vdd-supply-to.patch
queue-6.6/arm64-dts-mediatek-mt8195-cherry-mark-usb-3.0-on-xhci1-as-disabled.patch

