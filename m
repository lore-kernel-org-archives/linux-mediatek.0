Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED9CC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 06:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xcjJfmoNjG3TfBu5gYzdcP69bny5QYna9KRL6oEam58=; b=WBI/s+FH0N5QA+
	5dlVVnX84QUIIVw2lnPyuqS3h44LHAZsqsJmjOCdKOyvi5nxGXYmPUiEvAMUlEkXdVVcaYJvjfiML
	dLUrgK11AML36dVtZimq1shPuMfckI16gdICyGN9zCK3yZFnTclRpMI9Q5+Sg9W6h3/s6P3SkyEhk
	wMj5pt/uadAxVfdxKmVy/PQ/BEPDIs62Z+YlwEbo7RkERTnWy3Qy8PqGce52ZrPdwZgbzDbi1NqsH
	ac66+CYxoCm6ayEyR/XbDeYwg/kcTgSAO0mi9qLCee3IYTwai6+z4hTdKbz0u2Sa9PzQ4NDaDvAMb
	wt8hnxIutB2wt2u/eshQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nisXC-008XyC-VY; Mon, 25 Apr 2022 06:49:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nisX2-008Xuj-K9; Mon, 25 Apr 2022 06:49:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=6sZk6f+SSX04oov9b/0Di56u0HzBXaGb0E+tZ/QneV0=; b=pQCPYjwmcdCvhXoGzBGRGjbDbW
 cw+ERhokKwdTCmbri37bEKuTavklvCikkyjFAIJXRH6ZWQZkD74DXcDj6fJx8mDKp9D98l6Zz4fq6
 dYggggwpkSo41KjrwVHvu8kYksaL/pgmOxkMMfifMO6Wifbe5Hfi/Dk186FHh/r+A1xJ5RIlcL4PS
 qh+3iHE5UxLh1rxM+MRj131L4Zc2CEKxbDRwIHD01VfwHz5fKoy5YPu7B1cSuu8sDnUkgxQC8qHxr
 U1oLIAx8njDl0FM//4E/bPRn+0TXgue3AES1O/ihzMJa7lHM714PSM5U6mLIYiCGTuhFrZrkdBv6R
 0p8ob7Pw==;
Received: from mx1.riseup.net ([198.252.153.129])
 by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nisWz-008UGv-7S; Mon, 25 Apr 2022 06:49:11 +0000
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4KmwbQ5KRkzDsMn;
 Sun, 24 Apr 2022 23:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1650869346; bh=X9r/gViEyERj3QdfbSpzf1vJ7D4I2koJWoEPclEgUyk=;
 h=From:To:Cc:Subject:Date:From;
 b=hU6Ht86PcVkEicT6g8dKFu+l8SWsrHNnWP11RbVrMgjVeoPwQpyObmWKp7VR80cx7
 zvUw5BItgetPee1YlfEBnZrP+hNxkOuiuHMENK2I4f69QQgVJwBR4Xhw9VHU59qN8A
 aTBAPqZS+yXt3s8VyJM8MLTSuR/W7d8INu9OutKA=
X-Riseup-User-ID: B99F5AF868D304E13E026E41E8363AE8632B12E80FB7D65A24F398B2BFEA6E64
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4KmwbN3mNBz5vTc;
 Sun, 24 Apr 2022 23:49:04 -0700 (PDT)
From: Dang Huynh <danct12@riseup.net>
To: Dang Huynh <danct12@riseup.net>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: mediatek: pumpkin: Remove input-name property
Date: Mon, 25 Apr 2022 13:48:51 +0700
Message-Id: <20220425064850.246228-1-danct12@riseup.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_074909_513816_DCEA61BC 
X-CRM114-Status: UNSURE (   9.81  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This property doesn't seem to exist in the documentation nor
in source code, but for some reason it is defined in a bunch
of device trees.

Signed-off-by: Dang Huynh <danct12@riseup.net>
---
This patch is a split of this treewide patch [1] to ease the 
maintainers. 

[1]: https://patchwork.kernel.org/patch/12633497/

 arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
index fcddec14738d..7a717f926929 100644
--- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
@@ -25,7 +25,6 @@ optee: optee@4fd00000 {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_keys_default>;
 
-- 
2.36.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
