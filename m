Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB29C43217
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 11:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1+OjgymNTgpya4cFDzkY6TioB8zsQW+gfuuC/5sIFGI=; b=y3MhOuJzvfhcKwxjenQ3tIIWjX
	Kmt0BpZd55KIiE5R+eMrn66rNCKO5ATFTByOeU0m2aJn7MiPGQHIC/3Qg3q+uPW+L1YS90jyLin7H
	dQS6HDdTRrk+eU6fEXuY0J1745Iz2egkcWxjERM33eBuscQB5ZAXippLfCdY4ClK4Je91xwtZ/fNS
	LOK4RQF2MwFe4vOkodoALNdI4JNzpLxpU5ywgONEOwiFrHp0l2Nz6l2vc00oTccKjcKUZGVGHINn2
	7GYXtBNM+nLb+Tpj0W5J8D1g7sgmJnf+LWKPYaEJv9g1nqs5IJ3qqaHULen0CxFE6FoNKzih2bhr6
	Nk4yKxTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0hhk-0073S6-5E; Thu, 01 Dec 2022 11:26:12 +0000
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0hhd-0073M8-T7
	for linux-mediatek@lists.infradead.org; Thu, 01 Dec 2022 11:26:07 +0000
Received: by mail-vs1-xe32.google.com with SMTP id 124so1250071vsv.4
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Dec 2022 03:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1+OjgymNTgpya4cFDzkY6TioB8zsQW+gfuuC/5sIFGI=;
        b=WJm3P5MCtjzSoLs7LiGyBy2a9Y+3xHS3FkTOUDFaDfO3xpAyiimaBU3hyYR2AkCfMP
         Bl66OvmqYD030PEcT/Md+1x8A9+WD+v27EW5zPDUnTldrKs44PgYCsj4dYXS1S4AzO/2
         AFofI6KaRIxKQElpiGpkTJdmM7JCHoxKNtJTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1+OjgymNTgpya4cFDzkY6TioB8zsQW+gfuuC/5sIFGI=;
        b=GwZqexLGvLwgCv+5NIfqw/Z8Du5uhlnNfL4hojRBkE4cyYAcb7fAELN42dc2scL0u0
         HvyAkIQPeZaq90BmsrBdgW/tsNRk5Tk8h/spThtbQMmml/Cyf1LFETuNKKvpteY/TqON
         UhJrQuMHAKa44dX1P+INqeJZN5ONrcP/mSV2l+Fgxy91n8t53Q82jcMBLkfUrW/54K2d
         jE/VI/0yTaCAutCN0uBcTL8WoFqxATOpgtyxU+XZNvPOnxO2U7YwYtnceLPH01eVFNs5
         iLHLK95PQJaJGZQiqRloJVUo8g8LGpgBA4XjOkVTeeGZJ+ize/ocS/b19xMTMMXKfHpb
         Idlg==
X-Gm-Message-State: ANoB5pn10ACt2r+LU0pXlTWskwvnc4MVngauWQx9K/ngSg4wqkRGWrkz
	8OL1y1AVKww8HoiWzu5tGk6m5XRxMRBGV7KsVwBn5Q==
X-Google-Smtp-Source: AA0mqf4AYXsolIEAOErn11wxr7jiZlTxjgFcbV7F7SwpGeJg2LHiSLwosnWl4RljWivcFnk5n832mUFOiPN4aGcNMhw=
X-Received: by 2002:a05:6102:b16:b0:3a7:a88a:6bce with SMTP id
 b22-20020a0561020b1600b003a7a88a6bcemr28995324vst.65.1669893957629; Thu, 01
 Dec 2022 03:25:57 -0800 (PST)
MIME-Version: 1.0
References: <20221111082912.14557-1-matthias.bgg@kernel.org>
 <46c17d4b-d130-86a7-b5f8-73c30d7fdfdd@collabora.com> <CAGXv+5FORS=iGe55StxR_1E3sdtk9cvitfvNa1SydqCjWGcubg@mail.gmail.com>
In-Reply-To: <CAGXv+5FORS=iGe55StxR_1E3sdtk9cvitfvNa1SydqCjWGcubg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 1 Dec 2022 19:25:46 +0800
Message-ID: <CAGXv+5GfZYdhSCkhdGXRvbprwhceMJy9a9j+cNxsyUFYhMNZOw@mail.gmail.com>
Subject: Re: [PATCH v2] soc: mediatek: Add deprecated compatible to mmsys
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, matthias.bgg@kernel.org
Cc: matthias.bgg@gmail.com, nancy.lin@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_032605_950040_3C763FFF 
X-CRM114-Status: GOOD (  15.68  )
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

On Thu, Dec 1, 2022 at 7:20 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> On Mon, Nov 14, 2022 at 7:59 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Il 11/11/22 09:29, matthias.bgg@kernel.org ha scritto:
> > > From: Matthias Brugger <matthias.bgg@gmail.com>
> > >
> > > For backward compatibility we add the deprecated compatible.
> > >
> > > Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> >
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> >
> > ...And tested on MT8195 Cherry Chromebook.
>
> This now seems like a bad idea. In the dtsi we have two nodes (vdosys0 and
> vdosys1) that both currently use the -mmsys compatible, which in the driver
> maps to vdosys0. So not only do we have vdosys1 incorrectly probing as
> vdosys0, we also have duplicate clks being registered and duplicate DRM
> pipelines. On my device vdosys1 ends up winning the duplicate clock race.
>
> I suggest just reverting this. The display stuff won't be useful unless
> the drivers are able to distinguish themselves from one another.

That and try to fix the vdosys0 node ASAP.

> Regards
> ChenYu

