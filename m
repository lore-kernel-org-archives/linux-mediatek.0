Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D823C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Jun 2022 03:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v9iLe16OQzDjus8PgEyzt81ju785zygpn75Qb7cPKDk=; b=wmTTYKnSwC7mORem3Dvfz6kSaU
	zn/uWyW8emxiyvFSjrgxT3dH7FFzfpijz5pfAYOAJd0NmbTS5ToZVeyLfFqUaq79Uw7XVxUk8j7zK
	QYbrdUGMdtzQvk3+eq5igCUiJCUR+isfhTcQAX3YTtEol5qroSHXUC6YapmQq+u4SqbB8gLG+mhY4
	VuIndRsrjQIlPqiBH4HzDmmD6y2ZmtEzubn1O0JOdrbU4uuONO0TE1adxQC4TlqIXGtNoNDvAmvha
	VQ67Cuj53QcFwUmD5Ka4bs7ZAFDylpibqiZHOIZ9RQ6rmnDEQGcc4M53fbaSpMwuh0/QSxzB5nD0x
	1PU8Nn7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Ojj-00AB3u-Tr; Sat, 18 Jun 2022 03:02:59 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Ojh-00AB30-DV; Sat, 18 Jun 2022 03:02:58 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25I32Nt4004650;
	Fri, 17 Jun 2022 22:02:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1655521343;
	bh=v9iLe16OQzDjus8PgEyzt81ju785zygpn75Qb7cPKDk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ubm9+IAhGGTk3kdTt5x7vdcv21zn8SduavN1QPsDFtatpMEQLnnpq14kmxzjhSdoM
	 EhSYzwprF+3qoaWgxqEa7tkCA7AfNzT0CIUyyPN2V1vMiSYZKDtU+T7Pvq2yIkEfs4
	 7jCtmDUFYShPMx+ispwTz24Ou/91SMS8cN3blxkI=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25I32NTI008896
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 Jun 2022 22:02:23 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 17
 Jun 2022 22:02:22 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 17 Jun 2022 22:02:22 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25I32MBg024730;
	Fri, 17 Jun 2022 22:02:22 -0500
From: Nishanth Menon <nm@ti.com>
To: <krzysztof.kozlowski@linaro.org>, <olof@lixom.net>, <soc@kernel.org>,
        Arnd
 Bergmann <arnd@arndb.de>, <arm@kernel.org>
CC: Nishanth Menon <nm@ti.com>, <linux-input@vger.kernel.org>,
        <khuong@os.amperecomputing.com>, <heiko@sntech.de>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <jonathanh@nvidia.com>, <sebastian.hesselbarth@gmail.com>,
        <agross@kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <tony@atomide.com>,
        <nicolas.ferre@microchip.com>, <joel@jms.id.au>,
        <linux-arm-msm@vger.kernel.org>, <robh+dt@kernel.org>,
        <bcousson@baylibre.com>, <thierry.reding@gmail.com>,
        <claudiu.beznea@microchip.com>, <vigneshr@ti.com>,
        <bjorn.andersson@linaro.org>, <openbmc@lists.ozlabs.org>,
        <peda@axentia.se>, <andrew@lunn.ch>, <linux-aspeed@lists.ozlabs.org>,
        <linus.walleij@linaro.org>, <festevam@gmail.com>,
        <xuwei5@hisilicon.com>, <alexandre.belloni@bootlin.com>,
        <leoyang.li@nxp.com>, <michal.simek@xilinx.com>, <andrew@aj.id.au>,
        <kristo@kernel.org>, <linux-imx@nxp.com>,
        <krzysztof.kozlowski+dt@linaro.org>, <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        <linux-arm-kernel@lists.infradead.org>, <matthias.bgg@gmail.com>,
        <j.neuschaefer@gmx.net>, <gregory.clement@bootlin.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-rockchip@lists.infradead.org>, <linux@armlinux.org.uk>,
        <kernel@pengutronix.de>, <dmitry.torokhov@gmail.com>,
        <linux-tegra@vger.kernel.org>
Subject: Re: (subset) [PATCH v3 00/40] dt-bindings: input: gpio-keys: rework matching children
Date: Fri, 17 Jun 2022 22:02:21 -0500
Message-ID: <165552126299.28422.3856100388848453087.b4-ty@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_200257_587021_5411D12E 
X-CRM114-Status: GOOD (  12.28  )
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

Hi Krzysztof Kozlowski,

On Wed, 15 Jun 2022 17:52:24 -0700, Krzysztof Kozlowski wrote:
> Merging
> =======
> 1. dt-bindings: rebased on top of Rob's:
>    https://lore.kernel.org/all/20220608211207.2058487-1-robh@kernel.org/
> 
> 2. DTS patches are independent. They can be picked up directly by sub-arch
>    maintainers, by Arnd or Olof, or eventually by me (if you wish).
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[29/40] arm64: dts: ti: align gpio-key node names with dtschema
        commit: 85423386c9763fb20159892631eccc481a2d9b71

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] git://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D


