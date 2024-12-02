Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E81CD78318
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2024 13:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=7qixmz2tienj8a65HBJojcNKvXHrRWZIl/Gm0EYh108=; b=o1V8GcryXMfGRs1FAnD2vTfc6c
	S9eZjuOyghHxDVEtwBX9e4jJwIDjlADJlpMgg/XLJRb7w/GqcB2T9iRNzxhbueITn3KRXAdtGVM7U
	hKGrY1VUO9RuIh0X1/1QB2ei8orUcNC5hXqV1mfBLF6pmYye9DO5Fdt8v0IiFPZuC922szV52BcdR
	GhKOi+L5898QTLswTKKW21ByZzzqotq/pzpUaSxkQ6qXOaUkxP8RKnKTNZijJqTsPsjzbdADVqD02
	l9kzpuJ3w+92YzKn3D5ZfHU91g7YPZiI3Fg56W1BIEFAuYkeGVmPnngDRWljthI0O+x93sxwNg+gT
	g6QdMzmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI62X-00000006A3f-3ADc;
	Mon, 02 Dec 2024 13:00:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI62Q-00000006A0j-0HLr
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Dec 2024 13:00:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9539A5C67AC;
	Mon,  2 Dec 2024 12:59:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB638C4CED1;
	Mon,  2 Dec 2024 13:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1733144429;
	bh=u8z1m4qF7TpfLHefpz1W/qyAOFBrrgQkDtuTSSi/D/o=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=UVaFN3qKeTFmRGlsdyFT4Ts5mec36v5seyaqUii15yAQVCyR7Gu0F3CzgrKP3alnQ
	 OYS8NYVAOqSro8HmTyrKvZuDP39NNiF1v7gSYCwGsK5iQIbfOCQzAANabAK1SgcHdo
	 7ttrwj7GQiqtedC6hzrMQ1HzCr996aaO9EML1MzQ=
Subject: Patch "Revert "arm64: dts: mediatek: mt8195-cherry: Mark USB 3.0 on xhci1 as disabled"" has been added to the 6.1-stable tree
To: angelogioacchino.delregno@collabora.com,gregkh@linuxfoundation.org,koichiro.den@canonical.com,linux-mediatek@lists.infradead.org,matthias.bgg@gmail.com,sashal@kernel.org,wenst@chromium.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 02 Dec 2024 14:00:19 +0100
In-Reply-To: <20241202081624.156285-1-wenst@chromium.org>
Message-ID: <2024120218-dingy-awkward-e964@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_050030_192647_CA9008A6 
X-CRM114-Status: GOOD (  12.59  )
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

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     revert-arm64-dts-mediatek-mt8195-cherry-mark-usb-3.0-on-xhci1-as-disabled.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-95936-greg=kroah.com@vger.kernel.org Mon Dec  2 09:16:44 2024
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon,  2 Dec 2024 16:16:21 +0800
Subject: Revert "arm64: dts: mediatek: mt8195-cherry: Mark USB 3.0 on xhci1 as disabled"
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, Koichiro Den <koichiro.den@canonical.com>
Message-ID: <20241202081624.156285-1-wenst@chromium.org>

From: Chen-Yu Tsai <wenst@chromium.org>

This reverts commit edca00ad79aa1dfd1b88ace1df1e9dfa21a3026f.

The hunk was applied to the wrong device node when the commit was
backported to the 6.1 stable branch.

Revert it to re-do the backport correctly.

Reported-by: Koichiro Den <koichiro.den@canonical.com>
Closes: https://lore.kernel.org/stable/6itvivhxbjlpky5hn6x2hmc3kzz4regcvmsk226t6ippjad7yk@26xug5lrdqdw/
Fixes: edca00ad79aa ("arm64: dts: mediatek: mt8195-cherry: Mark USB 3.0 on xhci1 as disabled")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi |    1 -
 1 file changed, 1 deletion(-)

--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -922,7 +922,6 @@
 	usb2-lpm-disable;
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	vbus-supply = <&usb_vbus>;
-	mediatek,u3p-dis-msk = <1>;
 };
 
 #include <arm/cros-ec-keyboard.dtsi>


Patches currently in stable-queue which might be from wenst@chromium.org are

queue-6.1/arm64-dts-mediatek-mt8183-kukui-jacuzzi-fix-dp-bridg.patch
queue-6.1/arm64-dts-mediatek-mt8183-kukui-jacuzzi-add-supplies.patch
queue-6.1/revert-arm64-dts-mediatek-mt8195-cherry-mark-usb-3.0-on-xhci1-as-disabled.patch
queue-6.1/arm64-dts-mediatek-mt8173-elm-hana-add-vdd-supply-to.patch
queue-6.1/arm64-dts-mediatek-mt8195-cherry-mark-usb-3.0-on-xhci1-as-disabled.patch

