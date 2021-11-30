Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 015A8C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Nov 2021 08:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aNgERMCVimgimCLB7WK1dHTFlvZeCKC1bIl0YWjQ2vw=; b=Y1OqdIjM5ToivG
	TGXsWc5CUHWl+NqgJrbVkKrA3oKROmwYuIGMvHjuIVuX2dTjwFiMqw6Gprp6rB+uyLuaNAb8NfJwZ
	zfrQgPN9yi7j8zyu3hR5sTJEd8bjY1MLknx9IFGyyEg8LY8UT9rh8O9aaNN7A74r4PlrU5lWwcgCz
	75nwmj6rqEqapWDVYiBGYJJIklbv43/6aHYmbm9wLWnWpzNiAY+is8fZVzlpBQnKd2ANy4UH/b/j4
	d3d/eSXGgZP2j6xvQqAPXvOrajrXdF6lL7i5iswUSVEQJlQw5qTMS0E3/M38WSQakWxm8K4yVLvqo
	zjVQOUOeVo7Mri/otMIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mryjh-004AdN-Ux; Tue, 30 Nov 2021 08:43:37 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mryjO-004AV1-2W
 for linux-mediatek@lists.infradead.org; Tue, 30 Nov 2021 08:43:19 +0000
Received: by mail-pl1-x62b.google.com with SMTP id y8so14364807plg.1
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 00:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fHVy98BTaUQF52BWKLZtuQVRzz01N8+H95C8cB4Mhtg=;
 b=dkAqbyqTPRY4L/DB0uLdYdRPU6b1N+TybDCY0FHBvSZn/2S8Ae0v0tdFZwYj7zBLDi
 8QqrjFuNnxaIPD8BAr2rJhpwB2cDkqWynWjh0Ac4qLo6dTsE54UqsPiCOX+RddtIHAO2
 8JBLdxXwcjC/F/oqOtekIMDpqcxK4ymeEg2t/OKu6eb2DQDHJUzH+N2n7plAhq184vX+
 3ilr42mjOAMqMwT+OGrhYyComtrMz2+AeX0KPKFk06V5xiL+cTmcyS3TObk+6xDdalRD
 5Gaot3pJL+djNMmQ9F1IXX3Sxk97PgB1c7iou+/rl9Rq5op0ena4PcLEXQYlr5biumJp
 qtzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fHVy98BTaUQF52BWKLZtuQVRzz01N8+H95C8cB4Mhtg=;
 b=4hsQR0AkGuh33hxnhKILH7RRYyDrPcf3rhycpubsmCS5rudZAm1zy7gx+1n8yFwZfS
 GRM9UFcp/7OYDMKTqn5rcShTfrhn4tBVSxW0bmSK/Cq5pRE7EKPheFgrvLp+buTaLkLC
 RYyJ/cVQxb+CYV0+lPIXfFLHCHRkyVqXVBMZjHQmyA9Xnfk4wOE2RVi8IY/afBFYYGlx
 0xG8AQ1smvu741kB8JSUSqbidE7Nhul1UjH1qW3rR6fxCfs6P6TBnSgrPsC4zUEDkD0t
 sn7V22NNw74XLUQYq2fMK66OX9xeNAr3dlL9ysNhnBK0MhQ6E7jKbsm/FhOMvaAJv40/
 z+iw==
X-Gm-Message-State: AOAM533O4SWrIJxWUVZygOK8D+44MQzirG0yg6VTLFC3LGuT+Hd7d+6u
 EIeH2d11JgsUgSgX3v2p/icmKQ==
X-Google-Smtp-Source: ABdhPJxue2FBF6O8NbPbziRrwGNOciaOEZ/z8FnZ1b/zhjeFgaTTmvLKkjb9rz4cIuDD9UU5GWKBaQ==
X-Received: by 2002:a17:903:24d:b0:143:beb5:b6b1 with SMTP id
 j13-20020a170903024d00b00143beb5b6b1mr66622707plh.54.1638261792852; 
 Tue, 30 Nov 2021 00:43:12 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:6cb4:a0cc:6d7f:cba7])
 by smtp.gmail.com with ESMTPSA id v10sm20770644pfu.123.2021.11.30.00.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 00:43:12 -0800 (PST)
Date: Tue, 30 Nov 2021 16:43:07 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, cujomalainey@google.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 sound-open-firmware@alsa-project.org
Subject: Re: [PATCH v8 3/3] mailbox: mediatek: add support for adsp mailbox
 controller
Message-ID: <YaXkGym5QQDBSfcP@google.com>
References: <20211129101946.6008-1-allen-kh.cheng@mediatek.com>
 <20211129101946.6008-4-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211129101946.6008-4-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_004318_178250_41924699 
X-CRM114-Status: GOOD (  11.24  )
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

On Mon, Nov 29, 2021 at 06:19:45PM +0800, allen-kh.cheng wrote:
> diff --git a/drivers/mailbox/mtk-adsp-mailbox.c b/drivers/mailbox/mtk-adsp-mailbox.c
[...]
> +static int mtk_adsp_mbox_probe(struct platform_device *pdev)
> +{
[...]
> +	mbox->dev = dev;
> +	mbox->ops = &mtk_adsp_mbox_chan_ops;
> +	mbox->txdone_irq = false;
> +	mbox->txdone_poll = true;
> +	mbox->of_xlate = mtk_adsp_mbox_xlate;
> +	mbox->num_chans = 1;
> +	mbox->chans = devm_kzalloc(mbox->dev, sizeof(*mbox->chans), GFP_KERNEL);

I have commented in the v3[1].  To be neat, I prefer to use "dev" instead of "mbox->dev".  If you ever have the chance to respin the series, please fix it.

[1]: https://patchwork.kernel.org/project/linux-mediatek/patch/20211124084514.28002-3-allen-kh.cheng@mediatek.com/#24614933

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
