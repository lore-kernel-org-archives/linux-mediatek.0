Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309A6C07E9D
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 07:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=11G5wZe93PJcN4JPjI5GurXGIszeTe2Izd0qLhIMjI4=; b=pLwbpBU1Q8S+6Ypm5RoAQBEX55
	bxTC3wJnFmQQeXbM6nb5CtO/GwEYHJZ4HhQgcu8Dc3N439TvL9UHNEJv9OgaElmvYqGd7dGt1Qksy
	eo7M66qV+SFFtruIaff2W3h28C3sIyMuO2+t1F5hGO5xzajZzXG0k8G1Q3sgy1qIEQJrsgiQ65nIz
	QSIka5/Cslo5ipLlYVanTyzX5Ay24b1X6AuF7pDslLZTFpAXCH3oOlFeh9V12fEgR46PUaJ824SMs
	25awOCLyethhOt8UUGjXPvRVfcDVFcIvdhQQqTYSO+WHtcDru/M96f+8OPWt3F00cvpEFOuk8eVnQ
	HbmROokQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ociDd-002d34-Rd; Mon, 26 Sep 2022 07:07:57 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ociDR-002ctX-Tx
	for linux-mediatek@lists.infradead.org; Mon, 26 Sep 2022 07:07:47 +0000
Received: by mail-ej1-x62c.google.com with SMTP id dv25so11980357ejb.12
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Sep 2022 00:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=11G5wZe93PJcN4JPjI5GurXGIszeTe2Izd0qLhIMjI4=;
        b=VQjC7cLYYYcFa55Oh12+okpceJgr3GoMc/hc+3LlMkfQNrwFafuuNcGoQOcncBpS4M
         fVz/hBy92bmiRXB/J5/+8rXsz3DQrePRddqGPLr7uIdhJFccYgikCVNkdZntfEPjOMNe
         jBGUu6fBx2RA1dy/xubugdWFxtHt5Pe36MNrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=11G5wZe93PJcN4JPjI5GurXGIszeTe2Izd0qLhIMjI4=;
        b=HLVez2Ef5phm9T82YVxysxCuW35a9oHKEzCpow0yR2N8RJlZEfzpVVqdWBOzzIIsWS
         TnYCIXlGAJ16cNsDVGOa4iwaeOpoh8V2cVFujvdNT8PPpx6TvqnneOUm0ONrzRuMI5ww
         kv3Im+jWRtJc60UwoTiCEyenaRiQoXXiajmW5ZYo2a5WXsnTKx8FzxPkKriQ8yhOoaU5
         7Jf9y03t9STrVzzDr88NuS3w9jCjpVw/crX9Sl0g7XJJ7fJ/qeyN/NmQ7sLU7EHsnSz+
         Ba4tZ7SjCigT9yohsMFmjQHKGAzJ9xzGVwMz4/CBEKrnXoFsTdtaWFeuHZcDyMuiIcj7
         xd7w==
X-Gm-Message-State: ACrzQf2zJyw99VnNu/n4WZFNecmXoFiR9AYA63ZlmlrmTAQCMwPWy6lV
	EhPvNHNqO0v9B4pHVJwYwxfkUm89ZCtdghLCe0r48Q==
X-Google-Smtp-Source: AMsMyM747L8SdOtTBm0A1vuOwUIlVvdgf67xu2aLQMPPNr7+JeF3ZNc2Rh6l6SziBDn5+0MBtn+Sp0uZ+FtdD1hcNHE=
X-Received: by 2002:a17:906:770d:b0:73c:a08f:593c with SMTP id
 q13-20020a170906770d00b0073ca08f593cmr17590088ejm.182.1664176059865; Mon, 26
 Sep 2022 00:07:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220813083249.45427-1-y.oudjana@protonmail.com> <20220815121957.hmdjsznp4zj2ijmh@blmsp>
In-Reply-To: <20220815121957.hmdjsznp4zj2ijmh@blmsp>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 26 Sep 2022 15:07:28 +0800
Message-ID: <CAGXv+5Gzd7qA8_4-kZLw=iyhvVVWK1CEKaG5tLYUtDzaQ7-1DA@mail.gmail.com>
Subject: Re: [PATCH v2] clk: mediatek: gate: Export mtk_clk_register_gates_with_dev
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Yassine Oudjana <yassine.oudjana@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Miles Chen <miles.chen@mediatek.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_000745_970477_93F19966 
X-CRM114-Status: GOOD (  15.24  )
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

On Mon, Aug 15, 2022 at 8:19 PM Markus Schneider-Pargmann
<msp@baylibre.com> wrote:
>
> Hi Yassine,
>
> On Sat, Aug 13, 2022 at 09:32:49AM +0100, Yassine Oudjana wrote:
> > From: Yassine Oudjana <y.oudjana@protonmail.com>
> >
> > This allows it to be used in drivers built as modules.
> >
> > Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> > Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>
> This change overlaps with my patch [1], I added export symbol for more
> functions as it was necessary to build the mt8365 clock driver as a
> module. I will rebase after this one was applied.
>
> You already have two reviewed-bys, but if you need one more, here you go
> ;)
>
> Reviewed-by: Markus Schneider-Pargmann <msp@baylibre.com>

I've queued this patch up here [1] and will send a pull request to
the clock maintainer later this week.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git/log/?h=clk-mtk-for-6.1

