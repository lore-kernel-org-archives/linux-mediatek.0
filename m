Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4710C25B78
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 15:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xOzwspco9m1fk0/3X/vN1/Fn9+eqrj7CPzvWL0mp6Ho=; b=r/no1l3r28J3dsxq7w4OA3iWi6
	IMjT54erXLTeUfS7q+DhZ2QYUTfu6zhYgurHhTcca42L+2pkIG65DzNJJH+LNP+PFQjRMHP7Hl4rl
	QVwPFIFI/2zFAXdsf9e6Ipf3Kr1SBY94cw9QFqK1i0Qeuw5x6wGKXdx6xycCjCOqi58LKIqEwGk8+
	NMiw21VAmYk2CraM+w2u/FJi/g36x0rwfIRLDZbbhOq8x4INGQv9BpD8AoHNkA8G+WCAJJ2bLXNO2
	wFEPvSmHY25dO4cPRROMzvMY7RHBOFrpA/8nR0+/A9lRSKP72CF2cSjA5YUqPYu5UTOnCCGKf8JLY
	pKd4b8gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEWJ6-00000002xpS-1rL1;
	Tue, 04 Jun 2024 15:42:40 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEWJ0-00000002xnW-0hMy;
	Tue, 04 Jun 2024 15:42:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 14AA9CE10B9;
	Tue,  4 Jun 2024 15:42:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AB18C2BBFC;
	Tue,  4 Jun 2024 15:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1717515749;
	bh=gvxpfHQ65oWsKW/gpsh/uvOZGyM//B6SX2D/4rQ0Nsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1p0RL9O1txeF88r7BI4R3mZCPecX9o5eCeU291B62J/7N4Hkguvf1lfLd3cqQUs8P
	 4Y1/0W4FQ0ElqLZ7UU0nmattnWlXk/Z10eyZip8sZHsKgLIIU/ogQGQB9n7FHaJ/iv
	 fP0oOcb6nC636FrLvgUA+RegIdHHg80BK9dpAXYI=
Date: Tue, 4 Jun 2024 17:38:24 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Joy Chakraborty <joychakr@google.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Vincent Shih <vincent.sunplus@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rafal Milecki <rafal@milecki.pl>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michal Simek <michal.simek@amd.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, manugautam@google.com
Subject: Re: [PATCH v3 1/1] nvmem: Change return type of reg read/write to
 ssize_t
Message-ID: <2024060445-amaze-sitter-88da@gregkh>
References: <20240510082929.3792559-1-joychakr@google.com>
 <20240510082929.3792559-2-joychakr@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240510082929.3792559-2-joychakr@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_084234_403781_10C42A93 
X-CRM114-Status: GOOD (  12.78  )
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

On Fri, May 10, 2024 at 08:29:29AM +0000, Joy Chakraborty wrote:
> Change return type of reg_read() and reg_write() callback to ssize_t for
> nvmem suppliers to return number of bytes read/written to the nvmem core.
> 
> Currently nvmem core assumes the amount of data read/written is equal
> to what it has requested from the supplier, this return code facilitates
> better error handling in the nvmem core.
> 
> Signed-off-by: Joy Chakraborty <joychakr@google.com>

I thought this would be two patches, one to change the return type, and
the second to change the logic involved here (making it easier to notice
the logic changes.)  But it seems ok to me:

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

