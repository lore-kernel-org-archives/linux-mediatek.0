Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481CDC54EE9
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Sep 2022 07:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZvCDE9XNaLADCdtB8DMHkwQrDY3Vq7nlRxJru1ABOt8=; b=4GaQJKByZAz+ya9YCUSo9spXLr
	M+BLRRC5O5qX/ttVtGRMeMAgvaiJBOicf+Z29Q78ec9l+Q7HrsY9Fa3UKdLOPWkj/3OVBaOVcyFBj
	FTGuPlTCbXZCP4nS7fdw5QNhxuJPoxNr0DfTtqJxNkRmtGm6ludYVSycDze+kpizD2V/SEYLsudbs
	OlIAUL9hp7yUJlJJcJZEMts8N6S4lz99vF2iRuc3WCXK5p7f8VjgcaSYz1l/vYUhnv0XgipDqVCai
	p7xMCZL2KooGtng6i/HGFkRFApgbwS9b3pg9s8rLcxCBX7evdaX+yRKE2crrX2MGm3DCzEQ3HSoiC
	W+idcECQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ5m3-009uC4-VG; Fri, 16 Sep 2022 07:28:31 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ5lj-009tyJ-2p
	for linux-mediatek@lists.infradead.org; Fri, 16 Sep 2022 07:28:14 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B340E6601FA1;
	Fri, 16 Sep 2022 08:28:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663313287;
	bh=O0FbbxQMiGakV9I9s/YIWd4YvZeDELGtzjRh+ITi6J8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=F7ELVSVA06qolFwkfrwQ0090il7AXNTXCqCnP5wqo/M74pMxxYNLLIRE6gFdsvy17
	 A572zoP5Xrr1K7zmx4TydLKjSoWwGF2pNERLgVj/e+m+534UlKwIuSuT0nNuG6TQZe
	 rk7omfXZ7m05nn34m/4bNnKP/F2b9YatdvSa9ivGtDunIc/uFYDRV2DobAdOVpkrlM
	 wrntAL4QXfg9RLei6mKDAVf8GLyIiO2VajcLBq2hyzPhjq6cmIq6VahByJeDbmU8VJ
	 AUzBzADKT/5o//slAu0/Ne5W3tSTH0fqD44Ub3l0GG/KUi4qmkkxj3isxFKLYOWHQi
	 R4e52GZTBqhMw==
Message-ID: <8b130b9c-1d86-46de-f4c8-1a9cdae45c45@collabora.com>
Date: Fri, 16 Sep 2022 09:28:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PULL linux-firmware] Update mediatek mt81xx SOF firmware
To: Tinghan Shen <tinghan.shen@mediatek.com>, linux-firmware@kernel.org
Cc: linux-mediatek@lists.infradead.org, chunxu.li@mediatek.com,
 allen-kh.cheng@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220916032146.17774-1-tinghan.shen@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220916032146.17774-1-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_002811_399075_69685B2C 
X-CRM114-Status: GOOD (  15.92  )
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

Il 16/09/22 05:21, Tinghan Shen ha scritto:
> Hi maintainers,
> 
> This pull request adds new MediatekTek MT8195 SOF firmware and
> updates MT8186 SOF firmware.
> 
> Please let me know if there is any problem.
> 

TingHan, please, also add sof-mt8195-mt6359-rt1019-rt5682-dts.tplg as
that's used by "google,tomato" (for more information, please check
sound/soc/sof/mediatek/mt8195/mt8195.c).

Thanks,
Angelo

> Best regards,
> TingHan
> 
> ---
> 
> The following changes since commit f09bebf31b0590bdc875d7236aa705279510cfd0:
> 
>    amdgpu: update yellow carp DMCUB firmware (2022-09-13 08:02:23 -0400)
> 
> are available in the Git repository at:
> 
>    https://github.com/tinghan-shen/linux_fw_scp mtk-20220915
> 
> for you to fetch changes up to 78cff08a90dff21fe6f5f2f961d12604bd125e95:
> 
>    mediatek: Add new mt8195 SOF firmware (2022-09-16 10:42:01 +0800)
> 
> ----------------------------------------------------------------
> Tinghan Shen (2):
>        mediatek: Update mt8186 SOF firmware
>        mediatek: Add new mt8195 SOF firmware
> 
>   WHENCE                                                                                      |  11 ++++++++---
>   mediatek/{sof/sof-mt8186-mt6366-da7219-max98357.tplg => sof-tplg/sof-mt8186.tplg}           | Bin
>   .../sof-mt8186-mt6366-rt1019-rt5682s.tplg => sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg} | Bin 16191 -> 16191 bytes
>   mediatek/sof/sof-mt8186.ldc                                                                 | Bin 0 -> 48436 bytes
>   mediatek/sof/sof-mt8186.ri                                                                  | Bin 128712 -> 128712 bytes
>   mediatek/sof/sof-mt8195.ldc                                                                 | Bin 0 -> 40568 bytes
>   mediatek/sof/sof-mt8195.ri                                                                  | Bin 0 -> 100740 bytes
>   7 files changed, 8 insertions(+), 3 deletions(-)
>   rename mediatek/{sof/sof-mt8186-mt6366-da7219-max98357.tplg => sof-tplg/sof-mt8186.tplg} (100%)
>   rename mediatek/{sof/sof-mt8186-mt6366-rt1019-rt5682s.tplg => sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg} (86%)
>   create mode 100644 mediatek/sof/sof-mt8186.ldc
>   create mode 100644 mediatek/sof/sof-mt8195.ldc
>   create mode 100644 mediatek/sof/sof-mt8195.ri
> 


