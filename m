Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B373C433FE
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Nov 2022 11:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:
	Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pCQDOALh79Wg0//BO+hwd+gUI9nb61JMC5A9n1oxDJo=; b=PTpqA7bFIVh5GtbUziOKM71zCN
	e6kDeZ+FWm11aACXQpmmeSemXnXCwZy/8K/nSHuZi1v4y9FDdJv3aT3XT22u4vSbKq4kI4uLNOCcI
	LY4KyG/LdKJwqXMfitrC3MK7llJbOmEoSBQ0LBvd8QPg5B7emn9goy/6rBudZWrjNDyJnKLzghgv/
	zmuxVMU2RW9E3IhZeMSQb2dijbJ2dQ1AAkc00CBIN3SzfCQhzPU0vRZponPh/3r/VlIFADFCwTqJ2
	lqDC88dP4YXazT1hfc8Bt48KxR5wsbNS3uWR82Q1D0/+6Zrxe9uFLqnzOo29M/jzrVA5epjL712+S
	mB5Nz7NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otoWn-005Hmg-4J; Sat, 12 Nov 2022 11:18:25 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otoWk-005Hlw-ES; Sat, 12 Nov 2022 11:18:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1668251878;
	bh=pCQDOALh79Wg0//BO+hwd+gUI9nb61JMC5A9n1oxDJo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=tC3jbkeFkyX2cGN5JP1yoh4sVVWUa5ymY5NF+It/5QcNljZdruXu1yBVIN1g7T1qe
	 A9EZgSPfohPm/l3mHuWUeS7927l1fYBKiP92ZCzzfkBYfSPL6g9MJKb5L6xUFkg/Ev
	 Zs83RBF1wRw1eWZzTCO53hJPyo4Qyx3iucl4Ubpg5VuJb9njcoms2FNpgpo8MArnfT
	 Ih2beDS9/awFyP+bWyZYtoxCk7MOHZUYLjpGuqCRsGAkmR0KZBHzVSThSGMoyPOes6
	 t0lAgaAU0zI5LXWOfKpRfmNlOZ2VWyBKNCcj8LM4bWG+heAeLkxJpZx8861Zjdh7Mk
	 sjTeHAcdWDPbg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [157.180.227.41] ([157.180.227.41]) by web-mail.gmx.net
 (3c-app-gmx-bs18.server.lan [172.19.170.70]) (via HTTP); Sat, 12 Nov 2022
 12:17:58 +0100
MIME-Version: 1.0
Message-ID: <trinity-33afde2b-7023-45f4-844c-db49f68e38aa-1668251877983@3c-app-gmx-bs18>
From: Frank Wunderlich <frank-w@public-files.de>
To: Frank Wunderlich <linux@fw-web.de>
Cc: linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I <kishon@ti.com>, Vinod
 Koul <vkoul@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Bo Jiao <Bo.Jiao@mediatek.com>,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Aw: [PATCH v4 02/11] dt-bindings: phy: mediatek,tphy: add support
 for mt7986
Content-Type: text/plain; charset=UTF-8
Date: Sat, 12 Nov 2022 12:17:58 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <20221112091518.7846-3-linux@fw-web.de>
References: <20221112091518.7846-1-linux@fw-web.de>
 <20221112091518.7846-3-linux@fw-web.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:IdjKRZAc4G6HLMosS9W3l4ACXAgHyMBKtsfZjV4glKnOIzpgLETAF/Ge5C5uC/JhQ6zhZ
 /Zvg98qbTZFOmoFYCHzhZG5sxbYMoGDfz5NyaC58aArUlPzICX8mFJZzw2ZfO9S3lKXGy3BetKKi
 339Em2xQ9y3WF05mYO60eRivo3jDP2APs7nYnDZn9c/qjxP/IGwmfTaMoq30YO1xt8nfdyTEj7R7
 O9m8Dghdk8Dqr+rq2rF69B43EIqlU6iSuD3jvw35BgDi6pJ7SDX59buR56WIYe8gzXP8s1CDX/Oa
 Ik=
UI-OutboundReport: notjunk:1;M01:P0:Wc91JkxEs9I=;xIIdT2P6VfTS19OEOCIzPeazsU1
 n1qm5hLpvysdWBP1oqyWMAFpe5vNdlKFVrtIPzSrbmEmH2ED6XNLsi46eP617uq7hhQJH/zBM
 DS8FrSx2mFuk38mJsDr4xMLcinXuQswZN/dpJH/qHFTSHwxlonxzT24tZNsYn2UABe0C4Ulgk
 rlbfKzC1cEbF9kYOWByhDvnWQKEq0RvuB9QM3uPOFiXec3DAchkKMrwJIRgtG+z5bjs5EkHll
 6DoZGD9DgxJxQ5ToSH2nKlNyq52WLWXYWWikIJCano2QLV816u2+i2L72C/h4nXsUsdDIP5d/
 CBeRv6+U3qcDm4Pi6RnFU/xgqFNqsLdKIlYRRRcB24qZt0aBPpnJlkwGU4YMGgnCjbdEW/Dex
 sqRrXwV3Kqyssq6xwMvlQd5Yp3Acgw0BNy3gv7p6bwO7DtrMVf3PUNmsurROoX42gHKseyAc7
 qskz+HyFSwMlwl3EUGwgviSYfHjp2BpBLjyhAh6EhgLuKpQR9f1rc3f1W8txvGBN/7W6gywdq
 LTdwp3Sisurq1EyHwhxINCvnziH6Kvx9X8316+4ipx1QJwO/918v99elQFXmL+c5Qxh2AxP9d
 dnXPTRbigZEa/VgW4Pd/W+bw9nLTlAggS5LA1w7ZrJ65ybPFvJobDAdrN4tdk9lfoJb1uillM
 UsfOV8TItHB+Moe2oYOJzqyH3aS17kHLAq0SIXMuhYHiujRTCLsfZ5/oMjepyVcm+s5fQ95T6
 QGAQg5UQxreUGlHKg/3bGRhWCzrRRevxxfmd4FCOhM5vhi7vSEb5YfTDJZpH1LqIX0ebqHQM+
 sCXz0Qoiz9HGFjvpLC87PgYg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221112_031822_790344_1D00894C 
X-CRM114-Status: UNSURE (   6.16  )
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

i've noticed that i missed the Ack from Krzysztof i've got in v1 [1]

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/20221017104141.7338-2-linux@fw-web.de/

regards Frank

