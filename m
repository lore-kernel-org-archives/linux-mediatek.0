Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B742CC83030
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Jul 2025 02:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pwRbhdNlSUqboyGDv30P64W8CxKcBuI8SIxaOwyRWw0=; b=nzj47lJx+ZRBEVUm+mz0A7/nJS
	JCB+aI3yGYrTL6FalWYsSAJvRapJ9UPIUOEb4ZVmo7k2SX3L0rPoIL3XnzZH3E8kFUXmmad0gzUxb
	nq+Ul0GUiBvrMvBr43owi9igQUaHIAO/Yge9DT71UHDMjlhY/Fyuo8Xp2iO77c/rlx6dv4FOoroJ4
	qDKJ48dvjLgA+nAQH84ABk/o8YJ/5Z/+i0HO1vEkJ17IxPu5sdKxVszakjcZNiSycUEJ8vbkdHDYi
	ObekARc7ou49i1OkGxBajHP6g4dHXpzB3ROWxnHyv3TaWofZ1syT2W3oDQ8oH8w1xDgwKZSRKVvp0
	cI64hMCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXWXt-0000000D6pC-06nk;
	Fri, 04 Jul 2025 02:53:01 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXWRz-0000000D6Ck-2xgN;
	Fri, 04 Jul 2025 02:46:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 44B7AA51FFE;
	Fri,  4 Jul 2025 02:46:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 226A2C4CEE3;
	Fri,  4 Jul 2025 02:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751597213;
	bh=Sca8HTXk5lZZ2amtFEuOyYMdTFnNHWuwQHd/51XoroY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aYF9lCGnUe2vTZcoR1TTsdrbES2lBUjW4wGSn23VOPVXSffrX3aSJAySG5TcohdM9
	 RzqAupM5aXPVlSOVBTSPfWCRNAaqfmsXDU+7vvOeJjRT/32LcYIsUXz5SJMxBGF5TN
	 YFGUXHOt0Xqaygz3dbRoV+Kfzese3uTTkvjLYnv0HWWwgy79XYujKJIdJmS/uwW/d0
	 ktMtjeai4R+pn+y1p5ybFod4zXFVn/UImeaU/7Gey2ZHg4wnKOZY5cEXn2J2JqmFk8
	 fCOI49sDyVXqC4GDAWhfo6gzHVziJoj4yO3Im3qnrd08LRk94epIYbDgrYAE/7qfuw
	 hFfMVjtrUOZjg==
Date: Fri, 4 Jul 2025 02:46:48 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Cheng-Yi Chiang <cychiang@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Benson Leung <bleung@chromium.org>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	chrome-platform@lists.linux.dev, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] ASoC: Use of_reserved_mem_region_to_resource() for
 "memory-region"
Message-ID: <aGdAmGGPDA71rDE3@google.com>
References: <20250703183523.2075276-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703183523.2075276-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_194655_810851_C9C3E019 
X-CRM114-Status: UNSURE (   7.77  )
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

On Thu, Jul 03, 2025 at 01:35:21PM -0500, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() function to
> handle "memory-region" properties.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

