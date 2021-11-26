Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F0AC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Nov 2021 04:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kl/rHS3T/cREG5Vr6exKLtbIHziidQl4ol4Tm4cOIO0=; b=ZUXIE+8kxB6gmA
	hApX1DxBxYS7Np2HpTT32gTUmaZzbidJDZLftZrcfyynasUgeqe0qbRvlAOGBBCdMZyNEUv5pIMeg
	0pFmk1wpP7qYHisGrB8B53qRuOdrEA2Fx8KL78s0jDLjJ5m4XfqBXy29CTfXa7JPd/5EG+IWuI1EI
	4Ub3M74jZps2Wtdt09IJ4IXDthJsn2HNKcNlneZEjFnZdLmkWOXs9tU5BMX1ToH/29zmzKI5e+bIb
	7LB2K7SkKg0V5bk+ehdMfH9VHDPBVmpx+dwArY0FxSgAQ0fjqDuGUwtd44qJiy3WxNisEgc2vRiR+
	2B3o76rTSjiJARbQcy+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqT57-009Azl-OX; Fri, 26 Nov 2021 04:43:29 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqT4s-009Avy-9T
 for linux-mediatek@lists.infradead.org; Fri, 26 Nov 2021 04:43:16 +0000
Received: by mail-pj1-x102c.google.com with SMTP id np3so6408325pjb.4
 for <linux-mediatek@lists.infradead.org>; Thu, 25 Nov 2021 20:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2LgS2eMeGMdnukM8cUoBve3IMu8b+A022tBUdPAN3OI=;
 b=OMrr+Nwu0J1jMehGE7uVSNYBlFIZq8YEo1TshuWAuOw8rXnVxBWCnOTWjX0tJ8xk/B
 p/Y59W0vsB2Wi3nvclkhheA1yJPtWLGCQz5/4tkKL1gPMOU2yaJCZLPkduIJmevR+iY3
 vswhEHp1va64ULvN+IMrCNIV1d2YA61/uy2GPkHqP2FTr1PXJiPtEZ0UPZJBgLuBmyBf
 y8cGvCCOLzRmUZVK5fD4B7khJLpGmSqs27GzUwOIZBA8TW1UWIdSWXg5lNS+PXZKiJBG
 i8E2GgHrlX/vOX7yqdeWm+uof9bMapyGZc8cAcILcgUrEmOl0V9Ycq6yjJMMtFtCKdRx
 JRnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2LgS2eMeGMdnukM8cUoBve3IMu8b+A022tBUdPAN3OI=;
 b=ojOkKcmc9FNBIiJeU8Qkl3KlK7O2DOK40zUM9XJK7LMHnZdg1uisrJ09x+DlCF/0G3
 6aUh2u/VUF4oN3+vH9IKphab7FNx2dWJv1FXE3UKdEz9EPK7ZwrNMGn3YkPk+GadtQEO
 cW/RMsNhsd4Ni6lwHvkHgxpQTG1C2f/orjsEfcEcQjjyQ3/RBbdcF13+7i21/pez25x5
 g8sZOmzstZK4Igr0ZQSf3qNE3Jg90a6JJSwzLYqUWLOKkilJX1RKxVzSbQxYJ2/QmMzR
 HTiQ+HowRpYRO/8qNCV8F0sODSL0qgb3P9cAT4mt6v6tl7X6VzwITk9X5Por9Yxmdj1k
 syqg==
X-Gm-Message-State: AOAM530glefTQ1MhjMPC9ojiOVqoQCvPxHQP1WLGdSHp9hhzJbv59h6M
 TofScBsdM0GlCFHCldC9zFxWbQ==
X-Google-Smtp-Source: ABdhPJzHNlb6Iu4GBBMDy3fHylI190Sir9kysQUFJV6XRqGjoRO7VKp/xNJdJgj00ozyg+MXwQzm1g==
X-Received: by 2002:a17:902:7890:b0:143:c4f7:59e6 with SMTP id
 q16-20020a170902789000b00143c4f759e6mr36149485pll.87.1637901788687; 
 Thu, 25 Nov 2021 20:43:08 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:5eda:d984:1426:91ca])
 by smtp.gmail.com with ESMTPSA id o23sm4843770pfp.209.2021.11.25.20.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 20:43:08 -0800 (PST)
Date: Fri, 26 Nov 2021 12:43:04 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, cujomalainey@google.com,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Daniel Baluta <daniel.baluta@nxp.com>,
 linux-arm-kernel@lists.infradead.org, sound-open-firmware@alsa-project.org
Subject: Re: [PATCH v4 2/3] firmware: mediatek: add adsp ipc protocol interface
Message-ID: <YaBl2PMPHnOMGKY+@google.com>
References: <20211125122925.1303-1-allen-kh.cheng@mediatek.com>
 <20211125122925.1303-3-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211125122925.1303-3-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_204314_385200_4BC571DE 
X-CRM114-Status: GOOD (  14.41  )
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

On Thu, Nov 25, 2021 at 08:29:24PM +0800, allen-kh.cheng wrote:
> diff --git a/drivers/firmware/mediatek/mtk-adsp-ipc.c b/drivers/firmware/mediatek/mtk-adsp-ipc.c
[...]
> +static void adsp_ipc_recv(struct mbox_client *c, void *msg)
> +{
> +	struct mtk_adsp_chan *chan = container_of(c, struct mtk_adsp_chan, cl);
> +
> +	if (chan->idx == MTK_ADSP_MBOX_REPLY)
> +		chan->ipc->ops->handle_reply(chan->ipc);
> +	else
> +		chan->ipc->ops->handle_request(chan->ipc);

Using switch ... case ... makes the intention more clear.

> +static int mtk_adsp_ipc_probe(struct platform_device *pdev)
> +{
[...]
> +	for (i = 0; i < MTK_ADSP_MBOX_NUM; i++) {
> +		chan_name = kasprintf(GFP_KERNEL, "mbox%d", i);
> +		if (!chan_name)
> +			return -ENOMEM;

It needs to go error handling path.

> +static int mtk_adsp_remove(struct platform_device *pdev)
> +{
> +	struct mtk_adsp_chan *dsp_chan;
> +	struct mtk_adsp_ipc *dsp_ipc;
> +	int i;
> +
> +	dsp_ipc = dev_get_drvdata(&pdev->dev);

To be concise, I would prefer dev_get_drvdata() inline to the line where the variable is declared.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
