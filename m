Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6208C47088
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 11:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nnfdBIDx/ThTuuxIdap1q8GCjjcmxAGw3qs8tBxtzrg=; b=LHq5x6H1CBkn/eRWJtjlNHpzvS
	iGAxX0vZRMd4x3ACrv7mGC/xB2BH7Oe7fqCvrkWKHlYAE+lWNvVaR2NOZb1y5ENyaqI0QJoMxyCjF
	+vEiKcqKa/vUJ0ZB8zPCrwxMwVORByPvdOZYQbhbG7QTeqeDU4usRmRvn1JVFqE2d72unMqan14vb
	pPwYLKJB7b3cBCJZlaL6URe21KXiU4cu2LgqtytvKhGQF953F/96U6oCQpx+6qF379nnJWOd/9X90
	p40IputUJKAu7W8CCo3Ycritpi1Jqkm4rNKNiZcl1e+JTUkZXw2QNkV/iB6Iav9HsKM8KsdBugE5G
	InAK3HmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0hcD-0071o1-AS; Thu, 01 Dec 2022 11:20:29 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0hcA-0071lg-R1
	for linux-mediatek@lists.infradead.org; Thu, 01 Dec 2022 11:20:28 +0000
Received: by mail-vs1-xe35.google.com with SMTP id 125so1217233vsi.9
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Dec 2022 03:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nnfdBIDx/ThTuuxIdap1q8GCjjcmxAGw3qs8tBxtzrg=;
        b=PzeC+ibqlNyJld1Tn2f8jLjq06c8fOJ83yLHBjS3ztc1gV+KW568QeoVC5zvRzmX0H
         fj7Z4m3Vs+/NLYHJW536uNxE1amEp0ZTTHDaYw1smNplw56+kticLa76tmXi+jw69SMa
         IeMvXRHFAfISdZEZfm5rFA85J/irGzSsz/G3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nnfdBIDx/ThTuuxIdap1q8GCjjcmxAGw3qs8tBxtzrg=;
        b=GrWyQ5YnLkYWA0wv0o1r2dlLaYQ8NMSTZZIAo9Od94lFyk1qe8+QdmYVt3nHwQeLFG
         0z/zqCSX+ts2A/pNrlE6i0dSF4UblOdw1bFLTSojUqVBNlBifpPcUCtICNLJ5GecJdMk
         0a124M++vpEhjPrSXZeTRVbRF7RCkIglu7TpnH+7hgvEDBM+JkaTvSXzu0qJJWs+9F/F
         xM4H3e4VMsoghVZcsr6DpVIfm6yiDJNGFDPSkWZdKLkrq+bYPVqYPcy28x383xxAtATI
         zSGMPTX5ubztLrcaysanp6ZezyhLETUe/p1QrSefPQ6gYgSbm13NGD/pV/xHQO2ft8M7
         IukQ==
X-Gm-Message-State: ANoB5pkhPh3ZrBxluXDvhyGUq7ejI9L3GFGI187DdskDFvko+pGq97Ln
	DckRooxPCaGWxIJjSn12LJeWaXOyP1hrGpCRxyBj/g==
X-Google-Smtp-Source: AA0mqf6Yi1TtSo1SAdDFyuKjmdVnWtDNsOV+rHvgF7IEs6aMJ2+WtlCzJxwxybiATsjU5uxcy15K+4ZVnvezmP1ONH8=
X-Received: by 2002:a05:6102:e0c:b0:3b0:6da7:39ba with SMTP id
 o12-20020a0561020e0c00b003b06da739bamr24612364vst.26.1669893625753; Thu, 01
 Dec 2022 03:20:25 -0800 (PST)
MIME-Version: 1.0
References: <20221111082912.14557-1-matthias.bgg@kernel.org> <46c17d4b-d130-86a7-b5f8-73c30d7fdfdd@collabora.com>
In-Reply-To: <46c17d4b-d130-86a7-b5f8-73c30d7fdfdd@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 1 Dec 2022 19:20:14 +0800
Message-ID: <CAGXv+5FORS=iGe55StxR_1E3sdtk9cvitfvNa1SydqCjWGcubg@mail.gmail.com>
Subject: Re: [PATCH v2] soc: mediatek: Add deprecated compatible to mmsys
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, matthias.bgg@kernel.org
Cc: matthias.bgg@gmail.com, nancy.lin@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_032026_915018_9A014930 
X-CRM114-Status: GOOD (  10.82  )
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

On Mon, Nov 14, 2022 at 7:59 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 11/11/22 09:29, matthias.bgg@kernel.org ha scritto:
> > From: Matthias Brugger <matthias.bgg@gmail.com>
> >
> > For backward compatibility we add the deprecated compatible.
> >
> > Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>
> ...And tested on MT8195 Cherry Chromebook.

This now seems like a bad idea. In the dtsi we have two nodes (vdosys0 and
vdosys1) that both currently use the -mmsys compatible, which in the driver
maps to vdosys0. So not only do we have vdosys1 incorrectly probing as
vdosys0, we also have duplicate clks being registered and duplicate DRM
pipelines. On my device vdosys1 ends up winning the duplicate clock race.

I suggest just reverting this. The display stuff won't be useful unless
the drivers are able to distinguish themselves from one another.

Regards
ChenYu

