Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78563C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 16:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n28H0NTHw9ye/gMJ/VRKiUdPe9Wnb7D2OJb6Ems8YpM=; b=4TVNDWxWcioVLP
	CLi/3thRQAYBxL7QeQ98TXLDg1EMydsOWfHm3L5M8JPXhaIdoRUitKVu2/lJPXHpaqhTIFCuUgK8q
	5z0Bvtb5B7J3/U8hMa3kwznZL1oS2PKCS3Zos1YV7pLzQR/U0hTvMk1PGf4XqCSNv1D1HUbU/i8bR
	D3zwOcLjJ3iKWHkltObNc/Z29Vxe/zceyRc+QlSFDURwby3d026Q3FMkE+lPO+FYSrTAk/ezIK5nF
	NPDHvGcNPQlm53QieGmoIZO7ezPza9MAbHT8ycQYOFmU4e0idybar6ky9wkfZmIAH1dAh+2shw3v6
	h+pXdv6buECNqoF8mj/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njkAH-002ApZ-1i; Wed, 27 Apr 2022 16:05:17 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njk5h-0028LM-Aq; Wed, 27 Apr 2022 16:00:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651075233; x=1682611233;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rXX+rT71J5egDkFCr0XNgCNM2Ip7kcs7C+TCy0oaa2o=;
 b=iAwwp2dzuc1zUe6xP2fHqaeCyPuoCqTQEcVpUkJbie9OZs6uSKIWThDe
 /GA59L7lGfZhgmVq2GoJzvH1GoIFYDUWcAuzYwxWcQFg3g1zh3g5G39kH
 v1eolmvfrg5sTJGDwdy4S/ZTrT+P12gA4I3v7vLjYHBhNyZmyCXZ5lVg8
 qNFzJXLebiVfvVfWYHClotYClycaSWXFTORTxmHo6XuFOaYSFIqK3PzWh
 K91DUJuZ3COJV0s2hpgywTH9ehJ/7zlVYUciq1n8VXhmP4nYJBIkRimOC
 E6xFG6KCc766rr5qPut07tZclwfbdDYYnaX74r7fbvbJJvLxGpdqEhOvv Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="326472124"
X-IronPort-AV: E=Sophos;i="5.90,293,1643702400"; d="scan'208";a="326472124"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 08:56:35 -0700
X-IronPort-AV: E=Sophos;i="5.90,293,1643702400"; d="scan'208";a="559008157"
Received: from dktowns1-mobl2.amr.corp.intel.com (HELO [10.209.20.44])
 ([10.209.20.44])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 08:56:34 -0700
Message-ID: <7213fec3-6844-6913-b63e-2be8fc6df626@linux.intel.com>
Date: Wed, 27 Apr 2022 10:39:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v2] ASoC: SOF: mediatek: Fix allyesconfig build error
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yaochun Hung <yc.hung@mediatek.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Yang Yingliang <yangyingliang@huawei.com>
Cc: sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220427071030.10172-1-tinghan.shen@mediatek.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220427071030.10172-1-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_090033_508992_F433AC69 
X-CRM114-Status: UNSURE (   9.07  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 4/27/22 02:10, Tinghan Shen wrote:
> ld: sound/soc/sof/mediatek/mt8186/mt8186-clk.o:(.opd+0x18): multiple
> definition of `adsp_clock_on';
> sound/soc/sof/mediatek/mt8195/mt8195-clk.o:(.opd+0x60): first defined
> here
> ld: sound/soc/sof/mediatek/mt8186/mt8186-clk.o: in function
> `.adsp_clock_on':
> 
> ld: sound/soc/sof/mediatek/mt8186/mt8186-clk.o:(.opd+0x30): multiple
> definition of `adsp_clock_off';
> sound/soc/sof/mediatek/mt8195/mt8195-clk.o:(.opd+0x78): first defined
> here
> ld: sound/soc/sof/mediatek/mt8186/mt8186-clk.o: in function
> `.adsp_clock_off':
> 
> ld: sound/soc/sof/mediatek/mt8186/mt8186-loader.o:(.opd+0x0): multiple
> definition of `sof_hifixdsp_boot_sequence';
> sound/soc/sof/mediatek/mt8195/mt8195-loader.o:(.opd+0x0): first defined
> here
> ld: sound/soc/sof/mediatek/mt8186/mt8186-loader.o: in function
> `.sof_hifixdsp_boot_sequence':
> 
> ld: sound/soc/sof/mediatek/mt8186/mt8186-loader.o:(.opd+0x18): multiple
> definition of `sof_hifixdsp_shutdown';
>  sound/soc/sof/mediatek/mt8195/mt8195-loader.o:(.opd+0x18): first defined
> here
> ld: sound/soc/sof/mediatek/mt8186/mt8186-loader.o: in function
> `.sof_hifixdsp_shutdown':
> 
> Fixes: 570c14dc92d5 ("ASoC: SOF: mediatek: Add mt8186 sof fw loader and
> dsp ops")
> Fixes: 210b3ab932f7 ("ASoC: SOF: mediatek: Add mt8186 dsp clock support")
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
> 
> Changes since v1:
> Rebase on Mark's for-next and update "Fixes" commit id
> 
> ---
>  sound/soc/sof/mediatek/mt8186/mt8186-clk.c    |  4 ++--
>  sound/soc/sof/mediatek/mt8186/mt8186-clk.h    |  4 ++--
>  sound/soc/sof/mediatek/mt8186/mt8186-loader.c |  4 ++--
>  sound/soc/sof/mediatek/mt8186/mt8186.c        | 18 +++++++++---------
>  sound/soc/sof/mediatek/mt8186/mt8186.h        |  4 ++--
>  5 files changed, 17 insertions(+), 17 deletions(-)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
