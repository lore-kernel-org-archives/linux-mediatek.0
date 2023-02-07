Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9A9C636CC
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 09:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YoW3sjlSzqH6ySQMRZbQRxMotG8FJyB7q2pV+SeilrM=; b=aczIUAbT/FwSIb7n8uebfkP2XM
	eUIY/7ZsFF/sIQBLjeI/TTAKJyf7+DMNSlutDGPsM90p9bQyBarVIc5uscJcZ8kOdH9euAPH+q62C
	gkvcDJ2ZJfoAZu0WPjSFmmgda1VORYNRwrYgjf0OAiMInRcLmiCaKTqAEETT0UypcOGlr/wVsMwxG
	8D0V0z9AiDBLjnd8Fq8BV80/lll8RI+cojBIEjrm5ibAEVOianiUoZv7lWzUyV2DmUvcFzgAUpGIM
	6z2bmUEXXCPfPtCM1zTcC50314Dpsd6VRsJyTIYsfgniEHvX96UJZdSR6XM7RuenNCCoD3XVCOeq5
	t2dA4fWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPKbr-00BZeH-VL; Tue, 07 Feb 2023 09:49:55 +0000
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPKbi-00BZZ8-0R
	for linux-mediatek@lists.infradead.org; Tue, 07 Feb 2023 09:49:51 +0000
Received: by mail-vk1-xa33.google.com with SMTP id i38so7572063vkd.0
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Feb 2023 01:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YoW3sjlSzqH6ySQMRZbQRxMotG8FJyB7q2pV+SeilrM=;
        b=g2IUWbA4gGq0AVgEaJMonDk+PY1GyDAWQ1luMTjMLAlvh/+9cE/NrqaQj1S0Y/IMJM
         VQUkPzq0sY7z0gCgMS5B6nczHQ/c4a5W/imV0oP6cAIiBbRncsWLULqSd7GyoRZcb3OK
         zzDmyfFZl05yo1SHwisn1V5xitiF52XUzoNQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YoW3sjlSzqH6ySQMRZbQRxMotG8FJyB7q2pV+SeilrM=;
        b=pT2BWkpbJJeE5uoWF33xFGBr6akc9n+FA5pf5NWkUToqGe7PXp10kUdnePwksyfczj
         bYdMXkufEyzhEklkBzQIGnAbCqOcBz20+QiAaHMs/NTiTbCN9O5D0VNAPRujxvtfpAKE
         jMFOtqc1rcnmfn7cfKXN87RHgkKOdnBRRropu/Hz3kVTAi+8BgRuUqVgZ8eIXjuOoRH9
         nO6xCAiSPzcj5bElZUCsY+3TuezYeSa5tP2aYiLJnMs+GMc0uVi3piwvkcNdQ0c9MiiG
         oCYdqFVViKjWON9TOmTCHF4rQyTyh3Cf0pb19okG1N9B2wug39LlyhpCLfheVMGOzN++
         qm8Q==
X-Gm-Message-State: AO0yUKWM2ZfCrZZoIxIZKVqfPRIWiZd/IRxSBj4sa5DnswrWeXBXkP79
	jxSLPufD9QQ5/iz6aZ25EsxzGZT4LJ3v1aPpLx7HNw==
X-Google-Smtp-Source: AK7set8D6nY7w9ShU5K2U8eRiHiDa9ibytJS0Wv6eY0rGBr0MJsKEKzmlFXTcfeZomR8j6SmMRYHpsgb6aDQlDYucJs=
X-Received: by 2002:a1f:9493:0:b0:3ea:7394:e9ef with SMTP id
 w141-20020a1f9493000000b003ea7394e9efmr317423vkd.11.1675763381226; Tue, 07
 Feb 2023 01:49:41 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com>
 <847332fb-5f10-a8dd-4203-a1906973d0ff@collabora.com> <CAGXv+5GUaWzoPZuO3ZUX60exZeg2S=91u-i1bGOraV1AcWP9Og@mail.gmail.com>
 <ea5b8fd0-579e-12e1-d9ca-775b6db30f69@collabora.com>
In-Reply-To: <ea5b8fd0-579e-12e1-d9ca-775b6db30f69@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Feb 2023 17:49:30 +0800
Message-ID: <CAGXv+5F3eReSDY2ZLVSg4RoT-H9uA9G1zboN5e_8x-beuZC9sA@mail.gmail.com>
Subject: Re: [PATCH v1 00/45] MediaTek clocks: full module build and cleanups
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, 
	msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, 
	yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, 
	sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_014946_085523_5A57AD62 
X-CRM114-Status: GOOD (  17.51  )
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

On Tue, Feb 7, 2023 at 5:19 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 07/02/23 10:04, Chen-Yu Tsai ha scritto:
> > On Mon, Feb 6, 2023 at 11:38 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Il 06/02/23 16:28, AngeloGioacchino Del Regno ha scritto:
> >>> This is part 2 of the "MediaTek clocks cleanups and improvements" series,
> >>> which was already picked.
> >>>
> >>> If reading this full cover letter is too boring for you, here's a short
> >>> summary of the changes of this series:
> >>>    - Added mtk_clk_pdev_probe() for mtk-mmsys probed clocks;
> >>>    - Added divider clock support to common probe mechanism;
> >>>    - Various cleanups here and there;
> >>>    - Converted most clock drivers to platform_driver;
> >>>    - MediaTek clocks can now be built as modules.
> >>>
> >>> NOTE: Applies on top of [1].
> >>>
> >>>
> >
> > Something broke on MT8183 Juniper, though I'm not sure what. It ended up
> > crashing in mtk-cpufreq in a badly written error path. Once that was fixed
> > it was endlessly looping through deferred probe. Seems like mtk-cpufreq
> > was not able to get all its resources.
> >
>
> I would be silly to expect everything to go alright in v1, wouldn't I? :-)
> I'll recheck and try to understand what went wrong here.

"clk: mediatek: mt8183: Convert all remaining clocks to common probe" is
the first patch that breaks things.

ChenYu

