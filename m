Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9598C6FA99
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 07:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0KiZWQvFJRfa63tGK2tSC7sVHj6kzq5OwpzvzUwFG6k=; b=mVeKMTjxFIzyiKYdHO28+6MIHE
	QcA4l3HFaE9pExHLARJVTHSlGr2dzQpZC2ZiXry6vf8Vfd024cYz54HAo8ZGnYXDjKmYwqvWTBCzV
	kPtu26jrTLiNaHeb810OyF0LzVt7RvtI6VYv/CqlNJbF2PlXysN6cqWMpVuOiULfXYthymIcxBuIQ
	m3/Fg2aVkk0dXjAYUYxfebnWWY1i9e9lCpHfBHmoQaoWGTMnT4BZAKdQ+5njdWiqsPiCzJNSsBqLq
	eBcrpkLfiZvBStkON3y3USrNMlMpP2Lcpr/cuIME3m/pO/Ev8KeMiaWQRiSO0+qJ+TWpJlbIlfFLx
	MxQc7SPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paWqx-00DM6Q-1B; Fri, 10 Mar 2023 07:07:47 +0000
Received: from server-237-49.tentacle.cloud ([185.179.237.49] helo=bitmer.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paWqn-00DM3x-5i; Fri, 10 Mar 2023 07:07:38 +0000
Received: from jarkko by bitmer.com with local (Exim 4.92)
	(envelope-from <jarkko.nikula@bitmer.com>)
	id 1paWpw-0003gh-Gf; Fri, 10 Mar 2023 09:06:44 +0200
Date: Fri, 10 Mar 2023 09:06:44 +0200
From: Jarkko Nikula <jarkko.nikula@bitmer.com>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Cc: perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
	james.schulman@cirrus.com, david.rhodes@cirrus.com,
	tanureal@opensource.cirrus.com, rf@opensource.cirrus.com,
	oder_chiou@realtek.com, shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	linux-imx@nxp.com, cezary.rojewski@intel.com,
	pierre-louis.bossart@linux.intel.com,
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
	matthias.bgg@gmail.com, srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com, vkoul@kernel.org, daniel.baluta@nxp.com,
	thierry.reding@gmail.com, jonathanh@nvidia.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	sound-open-firmware@alsa-project.org, linux-tegra@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH] ASoC: do not include pm_runtime.h if not used
Message-ID: <20230310070644.GA13582@bitmer.com>
References: <20230307103022.1007420-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307103022.1007420-1-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_230737_231812_44DC1885 
X-CRM114-Status: UNSURE (   8.37  )
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

On Tue, Mar 07, 2023 at 12:30:22PM +0200, Claudiu Beznea wrote:
> Do not include pm_runtime.h header in files where runtime PM support is
> not implemented.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
...
>  sound/soc/ti/omap-mcbsp-st.c                              | 1 -
>  36 files changed, 37 deletions(-)

Looks like header was copied by accident from omap-mcbsp.c when sidetone
functionality was split into this new file.

Acked-by: Jarkko Nikula <jarkko.nikula@bitmer.com>

