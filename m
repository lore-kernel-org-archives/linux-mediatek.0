Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3445AC6FA8E
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 19:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E/QCWYuH2nsuLLSwjW9p8CNACLHy0WkzpzQOkqVJYHU=; b=kLQ6GXQ1YwkUx28PdGrhskecOp
	7p0uLHGQ4kOAqDmPv68WKNKhzMZ9e+Ho2eFGJuPAQcp78tC27mm+o7kicFpNP7MMdD4xftdym4BGw
	ggxy9wh5Tzfe8ISTW9SrlTSkbsXRs6PHDydRV0jMA4khd/GKlW0IenyhKgRdqUi6dK5fTlgca31wf
	dZyS/hgJCRzDBlR4m4yS6XdoQ7r+AZTNPEjAUvgv/qiJ89ogYW65AeeXAFLe/AnZ/RNBCKD30PBK+
	cdVyJY719GLLDMBuYyZbpghW3D+DhbvGH7VsXSW+hREPK6Tc9JXjVjRD78faBgUGzdHsTNpKVBT1z
	c4nsEmZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVdPi-003c14-S9; Fri, 24 Feb 2023 19:07:26 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVdPR-003bte-G3; Fri, 24 Feb 2023 19:07:11 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A2E326602FCE;
	Fri, 24 Feb 2023 19:07:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677265622;
	bh=CCW4naAHvfl4tjBL1Fqp4N6OXlt0PApFtXxoADlWb68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZnwcqKqjUfDZPu0RLuyMr6gR4w84I1K+tAaBLoztEfEqXZq0Z0vfwgpYy/xmYPUOp
	 K5GPK9VN2ekdlb1iof/C3NeauEhO9uzh60IWL/k0rxvBJIBFFnZ/h8z7XomRVjWfdG
	 ue1167sxgj6A+Xv6TaZtt3WXQTbPOp9OJOFtvFI7bVEi8GsfemGBzlx3G2bfoQYNbz
	 SKH8oEl3/aUqbFfWFNj0OCREI3MmDWkO/7AO7LIdg5gM5jpTwqIrd/FgxgxbeW59Fz
	 wGAt6i/WIhdHYDXeiVL0dGXLhhcP1RZ/oiIbskcSWTKrTND+dkaEUs5DTLZ4+YBcHf
	 Ia1TkwtumA6Ow==
Date: Fri, 24 Feb 2023 14:06:57 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] ASoC: mt8192: Remove spammy log messages
Message-ID: <20230224190657.edrvkg22gz5gff4g@notapiano>
References: <20230223-asoc-mt8192-quick-fixes-v1-0-9a85f90368e1@kernel.org>
 <20230223-asoc-mt8192-quick-fixes-v1-1-9a85f90368e1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230223-asoc-mt8192-quick-fixes-v1-1-9a85f90368e1@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_110709_803123_35FA272A 
X-CRM114-Status: GOOD (  11.52  )
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

On Fri, Feb 24, 2023 at 02:03:55PM +0000, Mark Brown wrote:
> There are a lot of info level log messages in the mt8192 ADDA driver which
> are trivially triggerable from userspace, many in normal operation. Remove
> these to avoid spamming the console.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Probably the spammiest messages are 

[   33.881459] mt8192-audio 11210000.syscon:mt8192-afe-pcm: mt8192_afe_runtime_resume()
[   33.889320] mt8192-audio 11210000.syscon:mt8192-afe-pcm: mt8192_afe_enable_clock()
[   34.029456] mt8192-audio 11210000.syscon:mt8192-afe-pcm: mt8192_afe_runtime_suspend()
[   34.041718] mt8192-audio 11210000.syscon:mt8192-afe-pcm: mt8192_afe_disable_clock()

from mt8192-afe-pcm.c, so I think it would make sense to get rid of those in
this commit as well.

Way less spammy, but there are also

[  176.209790] mt8192-audio 11210000.syscon:mt8192-afe-pcm: mtk_dai_tdm_hw_params(), id 43, rate 48000, channels 2, format 6, mclk_rate 24576000, bck_rate 3072000
[  176.224149] mt8192-audio 11210000.syscon:mt8192-afe-pcm: mtk_dai_tdm_hw_params(), out_channels_per_sdata = 2
[  180.272153] mt8192-audio 11210000.syscon:mt8192-afe-pcm: mtk_tdm_en_event(), name TDM_EN, event 0x8
[  180.281462] mt8192-audio 11210000.syscon:mt8192-afe-pcm: mtk_tdm_bck_en_event(), name TDM_BCK, event 0x8, dai_id 43

from mt8192-dai-tdm.c.

Anyway, if you prefer to keep only changes in the ADDA driver for this commit
that's fine too, and I can send another patch removing these other ones later.

Either way,

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

