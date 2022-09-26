Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CC2C07E9D
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 14:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cMkjFJ/Av0wmCMCslOb9fnHFt1e3jT0fQytGWi8vF50=; b=0eWTUdaeWTmYBO/dzyAj5B3Vsf
	ieEnfG00rLLjIl4OHHTwXI13dS/qp0EAEj0hyRQE4eHxpQHHWYj8l87eqRfcOnkOpbBOQwjx4nofY
	G+TzIppAJyOmC/X8UyTf/7JdZsr6jSUQWM/RpQi+y3TxCgyY1Xqlhpyzr2fUNGSpMnh7TWxUrVOHb
	DzLVcqfXe4YQXrhyoz7kh3Ea84njOLCJyi8zoEIjI7TeAZt4bptqh8DnNMk2lYE/Yc5XlmrgoxZLj
	yFBaOLRGGYX4GMlVGcNBB7wLDBxtnGOWinvuCoqsjLen56yuIHiTQffNKOKQV/uICJne+RUk5y3wL
	Hq06g5Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocp4s-005M4N-3p; Mon, 26 Sep 2022 14:27:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocp4p-005M0n-1V
	for linux-mediatek@lists.infradead.org; Mon, 26 Sep 2022 14:27:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4AE3F60DFB
	for <linux-mediatek@lists.infradead.org>; Mon, 26 Sep 2022 14:27:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF220C433C1
	for <linux-mediatek@lists.infradead.org>; Mon, 26 Sep 2022 14:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664202437;
	bh=1U5VBGz85XhNUc2UADvk3Pgf0NByRxd3FTgYZdNJFrM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=LU70XK5my3UbwctpDxoJy3hgYk5kwu8eoDcOYfPOP8HG+zkUymfsgCpGYs9gjGec0
	 9/IbuEVXRR+SiEyWOZwGOR/60S/Vhe+7GsVZ9An17Cekt/RnBLBiIv8QU3T9ka1okr
	 7aZPGeueHXLIum7Yn+tFPpclxhUgpgDzKYlpBjbNsR/b7sd+qNS+UQavkQzhqMi2ex
	 R5L4LRQu3lkln8Kcg1zbNYp16eZEIx5tVXqikdTUunwKVBNQ8lO8ikn/tH500KbpAH
	 desMhcyN6gEHrjwT7ZXP4L3DBUxBmOKAp6pkZwMggJ/qVL3YjFcLokbtQspfj5bonW
	 Al/+ntCRRu9nA==
Received: by mail-oi1-f169.google.com with SMTP id n83so8406786oif.11
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Sep 2022 07:27:17 -0700 (PDT)
X-Gm-Message-State: ACrzQf0Xvqy505a3RNzJ1soG9WCcRpOfon03mlliOkKBXGAROmslqnAk
	4i4N7k3iJ32YWsGROfw8ej/dMtlYOVUY1jO4HIY=
X-Google-Smtp-Source: AMsMyM6ECsDl0rUTQCplACP+WIsxAWk/8w6OCE7Tlu//TA9K039EvcqcUk0Nu4YyLih4ANv0ZWTPXCNf+aSr6GeWGYM=
X-Received: by 2002:a05:6808:f05:b0:350:c7fc:3a71 with SMTP id
 m5-20020a0568080f0500b00350c7fc3a71mr10597133oiw.267.1664202436844; Mon, 26
 Sep 2022 07:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <835f393df9cc985fe5b815bc6eeaf06ab4d07192.camel@mediatek.com>
In-Reply-To: <835f393df9cc985fe5b815bc6eeaf06ab4d07192.camel@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 26 Sep 2022 10:27:06 -0400
X-Gmail-Original-Message-ID: <CA+5PVA60ODTEZPoYqPMqjxu_ARxFLmeHie11McQUAx95+bXwFw@mail.gmail.com>
Message-ID: <CA+5PVA60ODTEZPoYqPMqjxu_ARxFLmeHie11McQUAx95+bXwFw@mail.gmail.com>
Subject: Re: [PULL v2 linux-firmware] Update mediatek mt81xx SOF firmware
To: TingHan Shen <tinghan.shen@mediatek.com>
Cc: linux-firmware@kernel.org, linux-mediatek@lists.infradead.org, 
	chunxu.li@mediatek.com, allen-kh.cheng@mediatek.com, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	angelogioacchino.delregno@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_072719_206432_90EABF33 
X-CRM114-Status: GOOD (  21.29  )
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

On Fri, Sep 16, 2022 at 4:35 AM TingHan Shen <tinghan.shen@mediatek.com> wrote:
>
> Hi maintainers,
>
> This pull request adds new MediatekTek MT8195 SOF firmware and
> updates MT8186 SOF firmware.
>
> Please let me know if there is any problem.
>
> Best regards,
> TingHan
>
> --
>
> The following changes since commit f09bebf31b0590bdc875d7236aa705279510cfd0:
>
>   amdgpu: update yellow carp DMCUB firmware (2022-09-13 08:02:23 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/tinghan-shen/linux_fw_scp mtk-20220915
>
> for you to fetch changes up to 3e08c58f8af488c41573c4a64a261e3b3f35849b:
>
>   mediatek: Add new mt8195 SOF firmware (2022-09-16 16:19:11 +0800)
>
> ----------------------------------------------------------------
> Tinghan Shen (2):
>       mediatek: Update mt8186 SOF firmware
>       mediatek: Add new mt8195 SOF firmware
>
>  WHENCE                                                                                      |  11 ++++++++---
>  mediatek/{sof/sof-mt8186-mt6366-da7219-max98357.tplg => sof-tplg/sof-mt8186.tplg}           | Bin
>  mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg                                  | Bin 0 -> 20895 bytes
>  .../sof-mt8186-mt6366-rt1019-rt5682s.tplg => sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg} | Bin 16191 -> 16191 bytes

This fails check_whence.py:

[jwboyer@vader linux-firmware]$ ./check_whence.py
E: mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg not
listed in WHENCE
[jwboyer@vader linux-firmware]$

Can you fix it up please?

josh

>  mediatek/sof/sof-mt8186.ldc                                                                 | Bin 0 -> 48436 bytes
>  mediatek/sof/sof-mt8186.ri                                                                  | Bin 128712 -> 128712 bytes
>  mediatek/sof/sof-mt8195.ldc                                                                 | Bin 0 -> 40568 bytes
>  mediatek/sof/sof-mt8195.ri                                                                  | Bin 0 -> 100740 bytes
>  8 files changed, 8 insertions(+), 3 deletions(-)
>  rename mediatek/{sof/sof-mt8186-mt6366-da7219-max98357.tplg => sof-tplg/sof-mt8186.tplg} (100%)
>  create mode 100644 mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg
>  rename mediatek/{sof/sof-mt8186-mt6366-rt1019-rt5682s.tplg => sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg} (86%)
>  create mode 100644 mediatek/sof/sof-mt8186.ldc
>  create mode 100644 mediatek/sof/sof-mt8195.ldc
>  create mode 100644 mediatek/sof/sof-mt8195.ri
>

