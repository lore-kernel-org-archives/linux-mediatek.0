Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6942E784AC
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 14:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9xwbB9UUJNHYGsvOL2OWasF1jedaAyNp2p7Cekqs654=; b=nYGDwYh7oIwDmgnHLXsm+aC7+g
	QNtE/oXNqhsuC2SPf+DWkO11ZkKmRl/iKbKHN5iusdW49HCcslwb14kwxUwDWxXNIoPrzFFqi2psu
	qyYH6X/+8ohg1y4wEh/QS77PWVy/kML+dhwh2UxDW7jQXfA/F6BO3hd1E5P3fObMiB71kqsJfR+zu
	iR+5I4RRb228K6t+wiWXIM27/bhKdigeam4JcGFja0322uuS+OAgVnW/C7PPdRRDH0Ce66mIof/Qf
	iyOxvGLlJ6IZeroJtfkgwNgGUaC6aWjBRLYkdzuvNchZllcZxR0nab8f/NZIxql/uPMkQPp3Rf79Q
	GgGhfYoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnJh6-00CrLv-1I;
	Mon, 02 Oct 2023 14:14:44 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnJh2-00CrJv-09;
	Mon, 02 Oct 2023 14:14:41 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 392EDi1r029079;
	Mon, 2 Oct 2023 09:13:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696256024;
	bh=9xwbB9UUJNHYGsvOL2OWasF1jedaAyNp2p7Cekqs654=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=By/tIsGE+iOxh5Xc+vk8G7bJIcgKrRMlPYXZHcFUKin/3+STUwGcSbwHAlEJAygAg
	 cYX4zyPPw/iOWY5DN75uQdDwGYBXfP8SBN+kqJyxUMDBGrYpXulQ+jDabJRfTmMu9G
	 DJaTDmzj2DXwuD/TrpxGcgigx7G0iwH+ZRX59CSI=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 392EDiPN020538
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 Oct 2023 09:13:44 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 2
 Oct 2023 09:13:44 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 2 Oct 2023 09:13:44 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 392EDhKD007764;
	Mon, 2 Oct 2023 09:13:44 -0500
From: Nishanth Menon <nm@ti.com>
To: Joel Stanley <joel@jms.id.au>, Li Yang <leoyang.li@nxp.com>,
        Herve Codina
	<herve.codina@bootlin.com>,
        Qiang Zhao <qiang.zhao@nxp.com>,
        Hitomi Hasegawa
	<hasegawa-hitomi@fujitsu.com>,
        Huisong Li <lihuisong@huawei.com>, Krzysztof
 Halasa <khalasa@piap.pl>,
        Karol Gugala <kgugala@antmicro.com>,
        Mateusz
 Holenko <mholenko@antmicro.com>,
        Gabriel Somlo <gsomlo@gmail.com>, Yinbo Zhu
	<zhuyinbo@loongson.cn>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Conor
 Dooley <conor.dooley@microchip.com>,
        Daire McNamara
	<daire.mcnamara@microchip.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn
 Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sumit Gupta <sumitg@nvidia.com>,
        Shang XiaoJing <shangxiaojing@huawei.com>,
        Muhammad Usama Anjum
	<usama.anjum@collabora.com>,
        Rob Herring <robh@kernel.org>,
        Santosh Shilimkar
	<ssantosh@kernel.org>,
        Michal Simek <michal.simek@amd.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
CC: Nishanth Menon <nm@ti.com>, Andrew Jeffery <andrew@aj.id.au>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Zev Weiss
	<zev@bewilderbeest.net>,
        <linuxppc-dev@lists.ozlabs.org>, <loongarch@lists.linux.dev>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>,
        zhang songyi <zhang.songyi@zte.com.cn>,
        Lubomir Rintel <lkundrak@v3.sk>, <linux-arm-msm@vger.kernel.org>,
        <linux-rockchip@lists.infradead.org>,
        Alim
 Akhtar <alim.akhtar@samsung.com>,
        <linux-samsung-soc@vger.kernel.org>,
        Nick
 Alcock <nick.alcock@oracle.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        <linux-tegra@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        Ruan Jinjie
	<ruanjinjie@huawei.com>, <kernel@pengutronix.de>
Subject: Re: (subset) [PATCH 00/40] soc: Convert to platform remove callback returning void
Date: Mon, 2 Oct 2023 09:13:43 -0500
Message-ID: <169625598637.2878306.1181893226380989815.b4-ty@ti.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
References: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_071440_172992_A7DB0118 
X-CRM114-Status: GOOD (  15.18  )
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

Hi Uwe Kleine-König,

On Mon, 25 Sep 2023 11:54:51 +0200, Uwe Kleine-König wrote:
> this series converts all platform drivers below drivers/soc to use
> .remove_new(). The motivation is to get rid of an integer return code
> that is (mostly) ignored by the platform driver core and error prone on
> the driver side.
> 
> See commit 5c5a7680e67b ("platform: Provide a remove callback that
> returns no value") for an extended explanation and the eventual goal.
> 
> [...]

I have applied the following to branch ti-drivers-soc-next on [1].
Thank you!

[33/40] soc/ti: k3-ringacc: Convert to platform remove callback returning void
        commit: f34b902c5ba67841902cd7f0e24e64bb82f69cb4
[34/40] soc/ti: knav_dma: Convert to platform remove callback returning void
        commit: 3af4ec7c7dd39a2c4618f6536b2e7b73a19be169
[35/40] soc/ti: knav_qmss_queue: Convert to platform remove callback returning void
        commit: af97160a0c5f1908c6f2830023fb93baac4451d3
[36/40] soc/ti: pm33xx: Convert to platform remove callback returning void
        commit: 9eb950e9fffc5337bfe1798cf89ce4d97a4f1221
[37/40] soc/ti: pruss: Convert to platform remove callback returning void
        commit: d183b20d340b7c098f44cb5c02f4ced01cfd0b16
[38/40] soc/ti: smartreflex: Convert to platform remove callback returning void
        commit: ba03aab9bfb4c9d456419da3891375d45c6bfe15
[39/40] soc/ti: wkup_m3_ipc: Convert to platform remove callback returning void
        commit: 82e83cb51c87b5bf3ab83f7c7b150c19400056c2

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

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D


