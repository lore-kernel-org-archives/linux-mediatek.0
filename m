Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E584C3DA59
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jul 2024 16:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Nv19soFhNUV8ipqDT2/zdeWLsnE40qNxixGhgPAIJNI=; b=hv7Bj1za8CJMVlIyFYUcolIsnH
	OD1drk5YhQblUflfmjqDARtfollQcemhyO0gPSNj9SX3X3Im5fV0yGVyCowAett8FQbROfht0oG53
	rrenhDvmzzxfrJ2kE4ICX0Od8Ygo/UEU54J8ENshJ7VMATw4/0sViV1rTjRhqxmhl7WEEY4ilvZPc
	tQcAIERRNj5CbhTfP+p7V7rk8F2CsC+XDiiXmTUdz5he8tQIbfjltrThvmGC80gTlDql2f6sp84zQ
	6k1zC5Xr9ygCkjSbBI3DtOQwqLy6H0+plrvLbBWRXFv1vLiu5mCjDJY9/SZmoKQ6TdsgBYIZvmpwo
	AAqRi03w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTOKR-00000007hFP-24u8;
	Mon, 15 Jul 2024 16:13:31 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTOH6-00000007flp-3SO8;
	Mon, 15 Jul 2024 16:10:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721059803;
	bh=TSg1Qn36aw8Oi8+lnfedWfNIgT3VJ099nZPKoyn36eA=;
	h=From:Date:Subject:To:Cc:From;
	b=qccw/SLAZwYlSe3zRD81SpyIe0tT0hHfZ+bkd1Q/ru0paghFBsCMcfR3Vo44HA6zC
	 q8oDkJNtdWs/3vKhAAXLq0NSlFHy3Yz+2AyD67CjFQqF5ekMOb5e0v6DIePIP9mU6H
	 O0z/XjFozyXI4k754D6SsfgnhKPfUPLmFejt02q+PvSytjIBSyUsh3F808RRh9wzvY
	 xu5gPnkfOrXSZgCVBJk5i8pjP3n/M1XplZPsGhbvsCscf0QH4uRd1c8pxGRZlzLt7j
	 rm7Bmyz3NHM6PKGYYW7pwGlNZY56oERfBybp0fqUxbKOK8N6ZlY6ykQ3UVksZi/6jD
	 ATZ2Wtv0LC/tw==
Received: from [192.168.1.62] (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3F31A378020A;
	Mon, 15 Jul 2024 16:10:01 +0000 (UTC)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Mon, 15 Jul 2024 12:09:34 -0400
Subject: [PATCH RFC] arm64: dts: mediatek: mt8195-cherry: Remove
 keyboard-backlight node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240715-cros-backlight-dt-probe-v1-1-0b5afe64c94b@collabora.com>
X-B4-Tracking: v=1; b=H4sIAL5JlWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDc0NT3eSi/GLdpMTk7JzM9IwS3ZQS3YKi/KRUXXNzU5NEC2OjxBQzAyW
 g7oKi1LTMCrDJ0UpBbs5KsbW1AGKIYd5uAAAA
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Tzung-Bi Shih <tzungbi@kernel.org>, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_091005_045395_59B0BB82 
X-CRM114-Status: GOOD (  13.43  )
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

Commit 970c3a6b7aa3 ("mfd: cros_ec: Register keyboard backlight
subdevice") introduced support for detecting keyboard backlight
fuctionality through communication with the ChromeOS EC. This means that
the DT node is no longer used. Remove the unneeded node.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Different CrosEC FW versions could potentially not support discovering
the keyboard backlight functionality, but I've tested both a recent

  tomato_v2.0.23149-099cd3e539 tomato_15699.72.0 2024-01-03

and an old

  tomato_v2.0.10686-234e646fd8 tomato_14268.0.0 2021-10-07

version on mt8195-cherry-tomato and on both relying only on the
discoverability works. I've tested on both tomato-r2 and tomato-r3. I
have not tested on dojo, however, as I don't have access to it.

My motivation to remove the node is because the DT kselftest expects DT
nodes that can match to a driver to be probed, and with the "breaking"
commit, the DT node goes unprobed which results in a failure:

  not ok 225 /soc/spi@1100a000/ec@0/keyboard-backlight

I can also solve this in a different way, by adding this driver to the
ignore list of the test. But this solution seemed better as the DT
isn't meant to describe devices that can be discovered at run time
anyway.
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index fe5400e17b0f..20dfa18c9dda 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -1228,10 +1228,6 @@ cros_ec: ec@0 {
 		spi-max-frequency = <3000000>;
 		wakeup-source;
 
-		keyboard-backlight {
-			compatible = "google,cros-kbd-led-backlight";
-		};
-
 		i2c_tunnel: i2c-tunnel {
 			compatible = "google,cros-ec-i2c-tunnel";
 			google,remote-bus = <0>;

---
base-commit: 91e3b24eb7d297d9d99030800ed96944b8652eaf
change-id: 20240715-cros-backlight-dt-probe-7754a832ad60

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


