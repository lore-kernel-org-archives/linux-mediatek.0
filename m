Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE7BCA5FCE
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2026 10:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kvK039c+ndNZqYLtVZw/RUvQrQGmrUovg0Lat0BxvJw=; b=VDTJFxpj6dO67TSB5NYBPs0DwD
	DACA6KtPCcbF1K9TsjuwrXDcqQCUhqtpJKbxcEITFN/mJIJ7Vxj8QUo7Q2QqmE3KkNC93eCc/5H7D
	IjjFnD6OrBjnMYPm5TufXWG7SONBe/uOcWVP/rue4K1VokLvK2MP7xdxkfVjFFnzeATeZNglCaAao
	SqVlbFpY4/ftfoRPDxHxRnEb8QSqh/SYFQdQ/uashHW/dBU6imJcOlY9epmXO8mSrfVrZri1RdJDS
	aM4Zdkw4nMW6dZYfgmLXrDPvNWx7xZB/7U647SC7gN8u7j8ZNuh/qmcnCXxS9hCRbTPuxznO5daW4
	L3SrXQBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDg2D-0000000GC7Z-0SYt;
	Mon, 05 Oct 2026 10:35:05 +0000
Received: from mail-pj2-x2b.google.com ([2607:f8b0:4864:39::2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDg2A-0000000GC6k-0Ftu
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Oct 2026 10:35:03 +0000
Received: by mail-pj2-x2b.google.com with SMTP id d9443c01a7336-2e2c7eb3b8cso6390445ad.1
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Oct 2026 03:35:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791196501; cv=none;
        d=google.com; s=arc-20260327;
        b=ejC8TJr9TKfIsO1AwhSmPlHgoJjGANu5RoWtDOewTleqq96SIm+SSNmBrSpatQ6DT3
         wYkQOhg8dVhY8UvHypTleNg+z05NhE0FnDi4Yur23nPpBPN0IJHF3DtPDGH7GZjIvf8c
         B6MVf1Esk9qT3u7patywYjiR6kDLvRoGpQAseZmLEalyMHu5d/GmUiHepgmftFiLCUw2
         XaUh64evNHRj39ZuRqYYZqCdMdxUIGrxs5nrdrhrBiTHvg0VlhVq5mIRozCkQB50/7FJ
         IY5eyQmBg+ywmLshUyNTbEz5drokWaE2aVWHanYNoE+yFo7zbcEIR527PuWFPUA73aZV
         dgWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kvK039c+ndNZqYLtVZw/RUvQrQGmrUovg0Lat0BxvJw=;
        fh=UmX48vjqZAWlm4dzeWt1vsC8GOCdhfs2u7ycfI1wg38=;
        b=QyW7/BrhavqQU3sFnm8TbGpPpChmPzf/5mFVZFeZV0qeZQxhlNTQe5fxZfAwQGW/Gu
         Th7hYdugVspHqh52cy4WX4LjTW302q6plU5CKPDLJ7WrLRZDl1/dDtt3EGJWIyi4s+5G
         KN2/llYgfwFK6kwfmOtNSPVTU2frXRNR14fiv/wZiXhHVSBBrznnuoRyNTAH6YMs7a/7
         cVIyW8h5p26EsbgRGfCUmsW0WIGT4CzbsIEiC6pOduXBITZB4R17pxctlOSxdN0/fFkL
         r7hxZeqCBQQI78bNuLxYCDg2qH+4fwoL3fOwLiwFFG1RGjVf63PoGsUegi206d/LwJqk
         Hr2A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791196501; x=1791801301; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kvK039c+ndNZqYLtVZw/RUvQrQGmrUovg0Lat0BxvJw=;
        b=rOY1LzQgLj9X/LZhcZZBkklG5HglyiSNRKvAr891npWbxrFJOMiirO6DK2PG0z95lW
         1Att/BzgPHmZUmkkBhQ6TTvzqIDt25lMs1I1vgGN5NGEWU0rcumuXYk5re53dIxFZgZT
         NsF87a37gkLhfPWUn8tzmmAx66e+09Hfc4KSS4zqMHEaEnsh+bInTfeqMnrelrrc17wO
         kX0DPoamZippHOjIwihDz7jtU7MrepJ33HdPNilV3rlTzp7hOnMDXky17pjc+c1o9Yv0
         iagd3Cu6jWNnL/oWq+3StG+f7lRz7pYPURU7m3YIVr/b5Gh7IwYlmbT96h5c8A6iWV3X
         Q6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791196501; x=1791801301;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kvK039c+ndNZqYLtVZw/RUvQrQGmrUovg0Lat0BxvJw=;
        b=fhs9eeXnibZ0yYGDU7DSxSQuUQxEgqHfSl4rrQtrbSQ0juJCnD6wmS5FfAOdWkLuci
         +BqJm8K8TEnb8zZmj9OHYcJBde5Za+ODaWQAtzsuwYC6U8EgSrcRpHmt/CfcH8MDfRxT
         dCgGblJxuCL+gHj795ZULcdYF+TjtCzwXB2CCtmVgnTKkF8MclA10nKKkcMe59aBG1R1
         7mu/WQ/bmb3CE4H4MQ4a4rjjOpr7i0hi1S4xrDadlwBePV8jXsgYQJtjePCL0QxreDUe
         yjtcRiLMag50YVnHXQkoG6/ysR6Ya+FP6/VOlu1ReFlhTYZd76yJ3aT2SOFszycXsJkl
         Vlpg==
X-Forwarded-Encrypted: i=1; AKwUvBx4Dfh10cA/Zjy7BeGB/x0SZFEJlGwg2/wFQVrL2uwwEC6yCaarhKiKC2Ysf8vtI71y4RgsDmfWFLLcwbA3tA==@lists.infradead.org
X-Gm-Message-State: AFq9FYL2YB/b3v/tq98jnC+YiQKOGu7DTcpyeLg2TDKDGP87P43lkp6R
	BKCaYqvl8m3h4EAec1GkoBtHoD9O5QgTchfduO00/dfUzdIalvjHWmaIDE1+XP4GlWGWY61lGZm
	3hSdMO1ntiokDN1MtqBFIF4jVSAkAT44=
X-Gm-Gg: AYBFou0MKx1qduzwSTaKy5cTrgfSQmDLA0ow3E3yj1tPrUttwWrcE5BdGW2HSWrvLBI
	lNQwrOaegncGSbs9g28+shqy3IohMbdb4WTOTlGkNdBdxdhhY/X/f0esbSRGPp/s8VZ5VelZgxW
	5GkAS5USpI8xDSvrFbgjNmM/zxoL4bcgr+AQ1b5fEwkrErwQCsK+eNa757ioFebAHQXF72C31D4
	amznCNnoKTczlGP/y1kpyihWFC6jLTFfQyzD08k5nsTGaxzw2mAuUo6MEfB2Kh9Lc2YREq5xUXj
	iiz9A6LwX8MUs9+v32SzSZXiTipRZwRMRrfUbl7qjV5kY1s4z7ktlEGde7+koiT3kPZJ879nOe8
	MduOibYiDA4aBa4dBTYTHMeFvrtWTU/BmqJgJlf0S5qOP2j0eIHmNjuPih8YI8+I9+g8=
X-Received: by 2002:a17:902:ccc2:b0:2df:8aea:7d92 with SMTP id
 d9443c01a7336-2e49b7f79c5mr90908515ad.47.1791196501061; Mon, 05 Oct 2026
 03:35:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
 <20260925044908.450775-7-phucduc.bui@gmail.com> <asKt42FgsbhSbQUP@sirena.org.uk>
 <CAABR9nFyEJBwXP=4SjuGNfGQJub2y_DPE87c6j6BPmqMBgjESA@mail.gmail.com>
 <asNbjSrPYVbeqSae@sirena.co.uk> <CAABR9nEXM1OSnV6L4=N1YCbtWn5yMNr+OMEZ4p8h3WMaQXbgmA@mail.gmail.com>
 <asN8HzfxSHmBjfu1@sirena.co.uk>
In-Reply-To: <asN8HzfxSHmBjfu1@sirena.co.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 5 Oct 2026 17:34:49 +0700
X-Gm-Features: AclHuK8Ugc5AChxqexu-mkihhLXhmwiRf4SISUAZ4NMYY9zRq0-VJGBtciRXzWY
Message-ID: <CAABR9nFg2mPOA65Q-9SEDwmEoJ+-YUQqOi=c2nspSYF=UBejYA@mail.gmail.com>
Subject: Re: [PATCH 06/14] ASoC: mediatek: mt8195: Fix FE startup error handling
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Trevor Wu <trevor.wu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Haotian Zhang <vulab@iscas.ac.cn>, HariKrishna Sagala <hariconscious@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_033502_118020_4F143BA4 
X-CRM114-Status: UNSURE (   8.79  )
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

Hi Mark,

>
> > On the core side, snd_soc_dai_startup() only treats ret == 0 as success:
> > it calls soc_dai_mark_push() only in that case.
>
> > Is a positive return from startup intentional/allowed?
>
> It shouldn't be, no.

Thanks for clarifying. I'll send v2 soon.

Best regards,
Phuc

