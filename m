Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0729E95A8E
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Oct 2023 13:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:
	Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ytxZPHe6tFONDf+5l4xYRtY+76c88p10P1MBcS5kg14=; b=29Cd/C8G54cS/I2RXxZQ7+OzFE
	rIallSAq70zUPCo4X9E2LF6EKEZzg6/eCgSUjZiNt9Bf/aSWyG06yB3IsWQZyD+DSO79Bke+hT+IL
	LrW1at/3nAe5efByf3xqlHz7jpPhj1iM1bU43gQq5Npn+pm0PaTH4Vlb7k3OPLkNgAJTj6I5Pww3q
	5tRHDIO3A+m7fO6On6WGfYq2a91e5/jpLKf/Oj4ZccG0ePL/sVEf7tuXztnh+hP+uev0zPuSgRPlP
	wCgH4MXUfuFlyCy4XsnIYYo0c5KLkzF9AZmNGYgKPwFCfUj+PpN33lzLjcylsdYrfrRw5HmY4iuP6
	wqYsKKHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpqOY-00Aohf-27;
	Mon, 09 Oct 2023 13:34:02 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpqOV-00AogU-1w;
	Mon, 09 Oct 2023 13:34:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
 s=s31663417; t=1696858422; x=1697463222; i=frank-w@public-files.de;
 bh=ytxZPHe6tFONDf+5l4xYRtY+76c88p10P1MBcS5kg14=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=EwF2aOmzUfyYGAJ5PWznBQYEWjrJxre/BRBPGX7odNzHyDZ3G9B8dVLwCWzEVi/E6EiqdEoe7AS
 cHlVLuql82R0MKYtCIC+Nht3j+dy9F6j8yQEDChceoBQ06IXNOLLHXFUjG/reJ4uyh5uDlbgSLSVN
 8QT5RbgaRRYchsLBBTAbZZbgyhlalHIPF2agOVps2agSBSNOPmHR2N2nIUdxstIdzWp8nXuYIuO3+
 BXtm4pe+RsXlgPq+pH/NIuhsIcFM9R+WEcQTs4REgNQ8pA6h4kk6EuZXSgZjVt8YZT76WA015go6Q
 Oazy3S8IwME8iP43GnGAgot0ReQCN2SlGtZw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.151.237] ([217.61.151.237]) by web-mail.gmx.net
 (3c-app-gmx-bap21.server.lan [172.19.172.91]) (via HTTP); Mon, 9 Oct 2023
 15:33:42 +0200
MIME-Version: 1.0
Message-ID: <trinity-67cbdf3b-6a3b-4f29-ae8b-c54e46378faa-1696858422016@3c-app-gmx-bap21>
From: Frank Wunderlich <frank-w@public-files.de>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Alexandre Mergnat
 <amergnat@baylibre.com>, Chen-Yu Tsai <wens@csie.org>, Macpaul Lin
 <macpaul.lin@mediatek.com>, =?UTF-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?=
 <nfraprado@collabora.com>
Subject: Aw: [GIT PULL] arm64: dts: mediatek: Updates for v6.7
Content-Type: text/plain; charset=UTF-8
Date: Mon, 9 Oct 2023 15:33:42 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <7a877ad9-481f-bad8-5cad-5d013c6cd70d@gmail.com>
References: <7a877ad9-481f-bad8-5cad-5d013c6cd70d@gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:lCSM5Yw7IuQWy0+3+hYqGhefVjjNqGDemGoIw4ciA/4hYeXLF9rLLC2+AyhFfJPVWtaUs
 ZsPa9j9RFR6r6wdffw6HgAc6sApX93yqUMBMC0oLzyDLkw1wzbfKbJXzsflbyuNqRARTtcb8iU5P
 URfR/nn+RLIfi8d0Xc6Xrq+o9BU+GqunFYMFwAbKkR0UGN6e+dl0wmaa4QfshDNAJW6+YUFvySjy
 EKvzDiPKFXlFK0HTXr+RzSFJNoqoWkaPHyAamBhc/fe73k9ISpIrU9QJH0P61hk81LyRO+mnFT0n
 fw=
UI-OutboundReport: notjunk:1;M01:P0:9UK90TlX0Xw=;1ZZJMwoEE1VoDa2+Ey/wwivrRD1
 zhoM4igZ6ao5vEv4g23K+Q/eZ8atUnDr6hggbjfw63hsEvrKeo7ldt89YW43W8XtGSaJMUoxR
 AoV6b42VX2ggNl2IIcY1Pfu73eBGbgVrd5fYsvwfjIkAhLJ0RMd6cX6p1BXKsSkDYghSz/eNv
 uhpgknbOEU+mbbsBCOJIq81qP8D2mV6WwO04eIGLj2ng10PUu2i6xAG0StlcIhedOJz+iaApy
 gEYCbwVfXLagGV7K2SrhnS8XeSY2jaK5oCIFwVae38A/Dp0Zrqg0gK92g6s3u/vzSEMIlPbqI
 oEJYB6uRr6lfFI/EAi+xeeDCfm0PZpIr1teqaHoQiKl4nFF9yAf58ZEDUQgEWre47w01rPE1Z
 8Z/EVQCuOjDt1Xs5ybCm7kGNXt85roRBh40QS9/B2uD8/LTKqVSZO1bVFo4ztbZnC2ng/krZt
 USWdx6aDkHDccLbOXQmiSTKKGMJWGQe3Xn4S21wbFee7dNidmQy6p3Y9fHl6W4XGOaUyriR67
 4tI7TN/bwIDVRKXtFxj/Zv2tvpy84beLXlKCe3wM0i2UVP6XBmvNvJIppFsHfU3yRTuusS+GQ
 ScJMgLpoLWiMszmGwM8dHe1VVCkdcMSLB4INudvcJmpG9f6rT0wEjpHNS+rSB2+n2sW7dsZ/5
 vdOtCji+6xUemzh+3Ruk3hKW5wB0RYsJzAFBJT79fVuA7Kbd4kSgC1we016bNGUapTEToLMzO
 2wtEdlRNWRxhQMyvdR7or8wlOykNmhXMcE5PQ1BzCyM11+B0ml5hima67vzmqY1cuNRIaimYM
 4r6I/V0SY36wsZYF0tRkZ4Qg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_063400_029926_1ED3868D 
X-CRM114-Status: UNSURE (   5.98  )
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

Hi,

do you have these 2 series still in view?

https://patchwork.kernel.org/project/linux-mediatek/list/?series=761293
https://patchwork.kernel.org/project/linux-mediatek/list/?series=777712

regards Frank

