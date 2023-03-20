Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A59C7618A
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 11:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zGLzDQkG6KSjYKi7uuPER6fatoxAaQTWwyFIcRCkjxY=; b=BfVmyxUm/A0v0pKrSzenoYE99Z
	otU6o+cVb3pnIG1rckjuZScfqS67V6hz3X6e39+/Qw/VC0qPKTkoL88rS/MA+xeAoDPA/KCI0EXnz
	7GYt6Oqe4ebSQyjaHpMnKX/PHPdsFo7FY96ca6+hJPEpfoXdSDFYjNCZ3FaPxQxDUwUvc9IkyHT+W
	Bcju2kn/dJEX1jZsSm88uMXey0GyVnIh4dek+VP9VEEZQD56U/CPLUd3nhSWtAJs31sZc7EcRmT4o
	7nbu91nF69oTTX9wBR1UtB6H0NfbqnTxVaRgrL4tz9ng9lX+tXGYWJADaQf/qanqCLI7swRU/rrZ+
	uU4js0hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peDqZ-008qEe-1M;
	Mon, 20 Mar 2023 11:38:39 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peDqV-008qDg-1B;
	Mon, 20 Mar 2023 11:38:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DF99FB80E56;
	Mon, 20 Mar 2023 11:38:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 714C1C433EF;
	Mon, 20 Mar 2023 11:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679312311;
	bh=YfQJfApGvnHfGU8gi0gNukjaGzsg84xu5lWbeqt0lnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Eb0R3e1JjZqoZgzBIBGjddsyzF5oRvdKqX4zJzfcsM0/DnTdJPwvylLD+N+LKBRzx
	 IUP4xObd68HKq8F/Qvpt1W8+ib5Odyumu8IK77yOV7UrOlBps49shv9e9/SC/xo2kz
	 m0aAW+ll4AWGsB8I2maII0LRP6fC/xl2FJLRDWSewz86h49su8evjRUcjYOvGhEqEP
	 OqxjJPCWzSjGCbGJ72Q91R07MKL6mi3EU3EI8GH5XvBh3WyMEz82QnPL2OuhZKfQhY
	 kOBto01PJnNfY6OWt0wG8oiBvRdeyp56uvftv10KL3GXZXlc50hUNdkT6jkk/wjKoa
	 ZZVIoO4TNk3KQ==
Date: Mon, 20 Mar 2023 17:08:27 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Icenowy Zheng <uwu@icenowy.me>, Justin Chen <justinpopo6@gmail.com>,
	Al Cooper <alcooperx@gmail.com>, Pratyush Yadav <p.yadav@ti.com>,
	Rahul T R <r-ravikumar@ti.com>,
	Swapnil Jakhade <sjakhade@cadence.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Liu Ying <victor.liu@nxp.com>, Yuan Can <yuancan@huawei.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Allison Randal <allison@lohutok.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miaoqian Lin <linmq006@gmail.com>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Dan Carpenter <error27@gmail.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	JC Kuo <jckuo@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Roger Quadros <rogerq@kernel.org>, Matt Ranostay <mranostay@ti.com>,
	Sinthu Raja <sinthu.raja@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tanmay Patil <t-patil@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lv Ruyi <lv.ruyi@zte.com.cn>, linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	kernel@pengutronix.de,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 00/31] phy: Convert to platform remove callback returning
 void
Message-ID: <ZBhFsyXyN4wHV5BB@matsya>
References: <20230307115900.2293120-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230307115900.2293120-1-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_043835_704856_23512E0B 
X-CRM114-Status: GOOD (  16.48  )
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

On 07-03-23, 12:58, Uwe Kleine-König wrote:
> Hello,
> 
> this patch series adapts the platform drivers below drivers/phy to use the
> .remove_new() callback. Compared to the traditional .remove() callback
> .remove_new() returns no value. This is a good thing because the driver core
> doesn't (and cannot) cope for errors during remove. The only effect of a
> non-zero return value in .remove() is that the driver core emits a warning. The
> device is removed anyhow and an early return from .remove() usually yields a
> resource leak.
> 
> By changing the remove callback to return void driver authors cannot
> reasonably assume any more that there is some kind of cleanup later.
> 
> All drivers in drivers/spmi returned zero unconditionally in their remove
> callback, so they could all be converted trivially to .remove_new().
> 
> Note that this series depends on commit 5c5a7680e67b ("platform: Provide
> a remove callback that returns no value") which is included in v6.3-rc1.

Applied, thanks

-- 
~Vinod

