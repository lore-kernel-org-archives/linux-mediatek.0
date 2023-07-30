Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA4DC001DE
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Jul 2023 13:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xkZEY2DZQuBC7x5lPq3YoSZP0kijtDo+iwB2rylakJY=; b=zm061zVWT1Lb+3Ocs8sKv4p647
	55tCNm1GbMySPx6BCWY1Cm+FEB+woSfD0D/wEdgxs8b0GHT7oLyvaTx0yo8Z2Uh1GRUA8Dul9ZPFC
	dhhWg0rBhiUptTsCcm8kTqI3r3QL0DcdCa4dr+DnCSAQ5IGBWIb0OgmE3+RCFzQnu4I0/xv8RUfY3
	Tfdv2lYJ0FWv1NzvRIdKx58iYCsXXQd+QVsg9Mc56kcs6obMMOgHzj6MEL5/DSu7tkxnYNYUfugI9
	dUaKJgMp26uBG/X65ggYxSdms6fWxNMTuDLiQPLbZNfMeqTgcKTX5m3MlxcJ18HKPTWT4BeDDhtv4
	i6KkDirg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQ6Ni-00BYU2-0S;
	Sun, 30 Jul 2023 13:22:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQ6Ne-00BYSf-0F;
	Sun, 30 Jul 2023 13:22:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C307E60BB8;
	Sun, 30 Jul 2023 13:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87871C433C7;
	Sun, 30 Jul 2023 13:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690723356;
	bh=P6nPWoKkxLgNiPFLFCS/pA3Yhg+T0LHnBETGJfKED3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HE9OFlxOrv4Vx3o9jpsWD/v8UK6ftT2ikE37v64Vk03ummVdqJkSipsfe34M508ok
	 Bf5i3/5wVedwAm6wLsh7NiT8rgumrT069jwkdGTPZRusArpkVt06uj2/64sJPYEhIa
	 BrPunXOkwmqm/cJMQgxZkDKy1b7+5AouaHPL4/Y78qnQw3sIln51jMVMEWnVlLFJQt
	 IdJUqFaOw3tO3FGbXxm4mmRmdGIlPTX4YmVufnqSM0BJsNk3O2VSm4ocKVFeih7V3K
	 lNvltHclccx1pdb+Zn+5ydiR4ugPVO6ad6GACP/B4HEB6XoUGHp935x+ZunwXD3xaO
	 BOY08iSg7gCaw==
Date: Sun, 30 Jul 2023 21:22:17 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	=?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
	Tony Lindgren <tony@atomide.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 3/6] ARM: dts: nxp/imx: Replace deprecated
 extcon-usb-gpio id-gpio/vbus-gpio properties
Message-ID: <20230730132217.GP151430@dragon>
References: <20230724103914.1779027-1-alexander.stein@ew.tq-group.com>
 <20230724103914.1779027-4-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724103914.1779027-4-alexander.stein@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230730_062242_183435_2EC4D384 
X-CRM114-Status: UNSURE (   9.41  )
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

On Mon, Jul 24, 2023 at 12:39:10PM +0200, Alexander Stein wrote:
> Use id-gpios and vbus-gpios instead.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied, thanks!

