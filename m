Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD32B60A3825
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2026 10:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sL39G0U6;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fn/ij/Ne
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1aNoVlnvFcsOYz3yDk1hH8WlV460c2AuvXHcDZPvdOA=; b=sL39G0U6mUGcEo
	FaPyZcmlRt4UXdSbh5EQU6roKHOpOhhiYNBvr5R5eQPnsxZ74Uca8uYh1UNrqSMahwclgfxY0vGuf
	J4NayxWocvWgr9DSJovGS0zjRhDzWG0leoFD2G5zJUCA/R8GRGEV//0UEk6QjhwG8+w4Tj/ITkBfR
	QXFYwm+f7jxBaujvJL5Au+eVOF5gU9p+aiOtUGB7haPJva05+sYX1b4w3Mq1d73P100+EQoM7Bohl
	tinyaZ9/xSYx9u42msmEHQe6RNAmk6hRxkkzL0UbpPxv6EWqqNN4ju+bKDdrIwss/c7e1WqHQK1Ln
	h/Pxaz2dtRFsi4WUANCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjwN-0000000BPU0-1lWJ;
	Fri, 30 Oct 2026 10:34:31 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjwK-0000000BPRx-2nHh
	for linux-mediatek@lists.infradead.org;
	Fri, 30 Oct 2026 10:34:29 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-36661f953e4so889802eec.1
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Oct 2026 03:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793356467; x=1793961267; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1aNoVlnvFcsOYz3yDk1hH8WlV460c2AuvXHcDZPvdOA=;
        b=fn/ij/Ne0MrdGqfOgmLTFDhUh3m/Z87UMhanvM7TVfiVn/ER6Pv/Dv0Qp1pZzKxceb
         ATO8VlZwAli1SQMMovnRHhpwae/JyprcT7OdIB84RKZkfO6rgEvQScPHRDdgNBNrtUTW
         GCWse9VA7aEizV7H//BU3AvP2Cb5Y+ZmyjBFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793356467; x=1793961267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1aNoVlnvFcsOYz3yDk1hH8WlV460c2AuvXHcDZPvdOA=;
        b=XkviBmVcU/ljnw6I+GPXOBxEPJWS2tuhd3zxteMKvhdcoc/i9IMvDivAzh8sLJtosU
         l/VhSXMHTLz3QRE8i89f2LuleIvDKPaRVGTISPifycA8fCVnRr7LeXDBp5KGPJjJ+C1n
         onXj0CxK1ldkgoY0c6w4lQtqqsvnC8UplkiXag+AnuLBqHmfChNoK4OxL8kLRg/6RE89
         kjJehO82unNqh7IKuegAZWvhJyekX6+QuElgKlpDvRx8VUPe3xNwsZywn0Dca60oJSMi
         90vxwAR/X4CrXLoP7ydfXsOXlsTq+aFIAWhgDjkA6U38PLnQ28u2lT2n8ZVjdHvFGDDT
         LhyQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5rQjNayL/24XF5KOYkwFiZALOtnrbEeRU/Oa569A3C5J0NXm686Rcne3WZqSN5jlad0DRQhc/DdBj8iXA3A==@lists.infradead.org
X-Gm-Message-State: AFq9FYJQ10GH+H0Ty7XQ12+Te3Cjn9kgg/M8likbrchtwr6VTd9ta4A7
	xmbiCQz1qiguh8Yqa+sEIZLXd44UZj4JWX4pyqhAr8wJOVNpCqP4094zdLFkcYBmug==
X-Gm-Gg: AYBFou2nhQuIz6ViVSGXK46Mqu3pQrUbjFrQfzVTVQRsH3HsHWlO+enmtCR1ML8wARG
	8Ul7WS9ee0AiBcqUBgM6EU5vuQfsWikXXrkkSfz/eFrmrTmdPJ/DZ1nJ8dPVJS63HiMCKt97+2l
	BoV3R83ULrMT4IQ10i+mHPN/34FZ/GD5vtafZ8twz4qqU0ZXtj6BwHSOu4NRNqccACpIne33nfR
	LiL54z0hQTCBq9fI2CeocKc18DlhRMDj6ZMJ4USe43KwXvHXFvIjuldGAztV0bqpwVgJwkqzqVT
	oYwvkh+xJKZXW/qjbhCcucg36FIFkyiBM/D4WCkGuFT6SxElXQ7Te7UcrfOnyC5cVofe4h3ivxJ
	c1q/Wimw8nWRJjspv2cnnYXH7O6ypBdM7IX9nR58kJP8gW6PQ5hRFHzQUevWs/bZInS/2VYIrCg
	xlWk8TIGNCG1PF/IzhsrimAUWDVyfII9pWeEgc6v6ZW0+xrTvhqhRrMtuPfQlTAnmo5UMuVrDGr
	XD8UVjOQ+obIGbOGzzX7RR1n6GsYlUj/XkVMpbKwIZXSyIXvnzQP2J6v8NhtUpZCymO5SNoRX3y
	blYaNCU3grB/NxO/0Q66++h5E7S7ddLBJcL6O5Vyaicg1ayEyoj/k0LFZm5vHTA0Rt2CcT/IQUu
	L/fTWCKKwhIdVI2fnX+jk/goo3DdK82I6sg==
X-Received: by 2002:a05:7300:559e:b0:36a:1846:5c77 with SMTP id 5a478bee46e88-36a42204585mr3068442eec.3.1793356467068;
        Fri, 30 Oct 2026 03:34:27 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:6ef0:e162:ed32:a99f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a61a0csm7471774eec.22.2026.10.30.03.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:34:26 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: mediatek: mt8195-cherry: Fix ramp-delay for Vgpu
Date: Fri, 30 Oct 2026 18:34:16 +0800
Message-ID: <20261030103418.2355854-2-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
In-Reply-To: <20261030103418.2355854-1-wenst@chromium.org>
References: <20261030103418.2355854-1-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_033428_705969_11C9B757 
X-CRM114-Status: GOOD (  13.55  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Cherry, the MT6315 PMIC at USID 0x7 powering Vgpu has its slew rate
configured by firmware to 4500 uV/us, rather than the 6250 uV/us
currently specified in the device tree.

Since regulator-ramp-delay is specified in uV/us, specifying a higher
slew rate than what the PMIC actually uses results in an underestimated
voltage ramp time, risking GPU undervoltage when switching to higher
operating points.

Update regulator-ramp-delay on mt6315_7_vbuck1 to 4500 to match the
configured slew rate provided by MediaTek. (Vbcpu on USID 0x6 is
configured to 6250 uV/us and needs no change.)

Fixes: 260c04d425eb ("arm64: dts: mediatek: cherry: Enable MT6315 regulators on SPMI bus")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Patch created with LLM. Values were translated from raw register values
by MediaTek.
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index f23a0c7aa87e..81628d8a4b0e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -1596,7 +1596,7 @@ mt6315_7_vbuck1: vbuck1 {
 				regulator-min-microvolt = <400000>;
 				regulator-max-microvolt = <1193750>;
 				regulator-enable-ramp-delay = <256>;
-				regulator-ramp-delay = <6250>;
+				regulator-ramp-delay = <4500>;
 				regulator-allowed-modes = <0 1 2>;
 			};
 		};
-- 
2.56.0.317.g454f8302e1-goog


