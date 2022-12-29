Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8267BC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Dec 2022 17:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1UAqcUu7o6oEpma0eAg/XpascSM9CF4mPZAbW48BLs=; b=Yt7doG8cPbls0V4TguVEEv08Cd
	DHomzXQKGGRlFDDoYP0j65hbmP5Y9p+HK/8EYAdmt1uZNtAbvQDs5L8YD+XeuNFQylC/r98sCuu7Q
	QIc7iV34t6ENuAg5XN0S2MqFqS0fTGNNwAb3sjXzvR7jGGnYYt0KGZYvEM5m2Cv0gtWPp2kAmmfZR
	Z217fODGpgyxsv0+z349rKpvI8n4adw91lfKqkBCHBWqO8kobzZZ7UL4TRvXtkTJ1xnFq238RzAej
	Xjng4YMpI1Qyyn9SvIT92zswL0fH5xkXOYXjN7mkVMwJK0AiC1vQGz/xQrCtQeYcfiQNAD1G1SGOU
	r6ngtf2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAwe6-000J5P-NK; Thu, 29 Dec 2022 17:24:46 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAwdc-000IkB-6k; Thu, 29 Dec 2022 17:24:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A432FB81A1D;
	Thu, 29 Dec 2022 17:24:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D196C433EF;
	Thu, 29 Dec 2022 17:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672334654;
	bh=m9HPREp2BBaXTvbpQHx2WQprM9b37LXlFfRjZD2pPbc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qt7/hxQDBIvlE+UOhExIE+gpA1yr2Ytl6cD8uXTtl6jgmBiTsoa9S2hzoepP7nwKs
	 hhpc3+xHFhXVHpJMCUop4bill7ozLgMzwQO9LA8YMAFtxiODZoV/t6jq0Emw7Vrcpc
	 e3wDGuhBEwoBzI4P7WQzE+OVPLDTQ1V36xIiwX6Tdlhhavqpe87KM/WVAf3FA/niGn
	 Ujoi3sHXiSMn5Y2NVbd6ytWoXoohJM3TaDA3JajgPrNoErUXxWekYOsYNjAIXlTMEQ
	 vMYOqfDifnyfUtz3zYMqXx6dcSELIGyAql3swkh8gUSPi1+mCzcYJTnQt6naxTJBRV
	 xmQpIqRdURmSg==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-kernel@vger.kernel.org,
	pierre.gondois@arm.com
Cc: linux-realtek-soc@lists.infradead.org,
	alim.akhtar@samsung.com,
	clin@suse.com,
	krzysztof.kozlowski+dt@linaro.org,
	tmaimon77@gmail.com,
	chris.obbard@collabora.com,
	ming.qian@nxp.com,
	william.zhang@broadcom.com,
	linux-arm-kernel@lists.infradead.org,
	Markus.Niebel@ew.tq-group.com,
	m.felsch@pengutronix.de,
	jszhang@kernel.org,
	viorel.suman@nxp.com,
	liviu.dudau@arm.com,
	openbmc@lists.ozlabs.org,
	agross@kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	xiaoning.wang@nxp.com,
	mbrugger@suse.com,
	hayashi.kunihiko@socionext.com,
	aswani.reddy@samsung.com,
	linux-arm-msm@vger.kernel.org,
	s32@nxp.com,
	mhiramat@kernel.org,
	marex@denx.de,
	Steen.Hegelund@microchip.com,
	anand.gore@broadcom.com,
	thomas.lendacky@amd.com,
	pshete@nvidia.com,
	benjaminfair@google.com,
	diogo.ivo@tecnico.ulisboa.pt,
	jbx6244@gmail.com,
	heiko@sntech.de,
	tharvey@gateworks.com,
	vigneshr@ti.com,
	linux-rpi-kernel@lists.infradead.org,
	afaerber@suse.de,
	jun.li@nxp.com,
	victor.liu@nxp.com,
	linux-mediatek@lists.infradead.org,
	mperttunen@nvidia.com,
	peng.fan@nxp.com,
	abelvesa@kernel.org,
	chris.packham@alliedtelesis.co.nz,
	lpieralisi@kernel.org,
	laurent.pinchart@ideasonboard.com,
	ezequiel@vanguardiasur.com.ar,
	rafal@milecki.pl,
	jonathanh@nvidia.com,
	konrad.dybcio@somainline.org,
	UNGLinuxDriver@microchip.com,
	martin.blumenstingl@googlemail.com,
	linux-rockchip@lists.infradead.org,
	kernel@pengutronix.de,
	qiangqing.zhang@nxp.com,
	amhetre@nvidia.com,
	linux-tegra@vger.kernel.org,
	andrew@lunn.ch,
	kristo@kernel.org,
	nm@ti.com,
	spujar@nvidia.com,
	leoyang.li@nxp.com,
	vadym.kochan@plvision.eu,
	daniel.machon@microchip.com,
	paul.elder@ideasonboard.com,
	khilman@baylibre.com,
	avifishman70@gmail.com,
	tali.perry1@gmail.com,
	linux-samsung-soc@vger.kernel.org,
	robh+dt@kernel.org,
	alexander.stein@ew.tq-group.com,
	festevam@gmail.com,
	brijeshkumar.singh@amd.com,
	oliver.graute@kococonnector.com,
	martink@posteo.de,
	shenwei.wang@nxp.com,
	f.fainelli@gmail.com,
	sumitg@nvidia.com,
	devicetree@vger.kernel.org,
	eagle.zhou@nxp.com,
	sebastian.hesselbarth@gmail.com,
	atenart@kernel.org,
	l.stach@pengutronix.de,
	xuwei5@hisilicon.com,
	tsahee@annapurnalabs.com,
	ping.bai@nxp.com,
	shawnguo@kernel.org,
	linux-amlogic@lists.infradead.org,
	jbrunet@baylibre.com,
	bcm-kernel-feedback-list@broadcom.com,
	neil.armstrong@linaro.org,
	suravee.suthikulpanit@amd.com,
	thierry.reding@gmail.com,
	rjui@broadcom.com,
	lars.povlsen@microchip.com,
	magnus.damm@gmail.com,
	geert+renesas@glider.be,
	wei.fang@nxp.com,
	linux-imx@nxp.com,
	gregory.clement@bootlin.com,
	yuenn@google.com,
	vidyas@nvidia.com,
	chanho.min@lge.com,
	david@ixit.cz,
	aford173@gmail.com,
	s.prashar@samsung.com,
	khuong@os.amperecomputing.com,
	sudeep.holla@arm.com,
	sbranden@broadcom.com,
	shijie.qin@nxp.com,
	venture@google.com,
	kursad.oney@broadcom.com,
	linux-renesas-soc@vger.kernel.org,
	hongxing.zhu@nxp.com,
	akhilrajeev@nvidia.com
Subject: Re: (subset) [PATCH v2 16/23] arm64: dts: Update cache properties for qcom
Date: Thu, 29 Dec 2022 11:23:41 -0600
Message-Id: <167233461757.1099840.14261373049741719746.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221107155825.1644604-17-pierre.gondois@arm.com>
References: <20221107155825.1644604-1-pierre.gondois@arm.com> <20221107155825.1644604-17-pierre.gondois@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_092419_190335_5B88A323 
X-CRM114-Status: UNSURE (   9.84  )
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

On Mon, 7 Nov 2022 16:57:09 +0100, Pierre Gondois wrote:
> The DeviceTree Specification v0.3 specifies that the cache node
> 'compatible' and 'cache-level' properties are 'required'. Cf.
> s3.8 Multi-level and Shared Cache Nodes
> The 'cache-unified' property should be present if one of the
> properties for unified cache is present ('cache-size', ...).
> 
> Update the Device Trees accordingly.
> 
> [...]

Applied, thanks!

[16/23] arm64: dts: Update cache properties for qcom
        commit: 9435294c6517dc70bb608505b79097a58ea7c6a3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

