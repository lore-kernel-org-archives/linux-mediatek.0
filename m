Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6620FC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Nov 2021 04:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A2sEWnNFi6ko0KK3Bs1qFsfIu0jC7KEaibMxTEV3VAY=; b=prpYm3OKAuB5K/
	k4vWqyD/5eqWh2J+b++1ipYnGU4FvzGo3UY3HeQIgvHl3mUNDCuJSNHETn++RH6heufI9Y+kTZQqt
	37S5R5ikoAPmYwck8CbNOoKr0Cu67dZ3/bTFQEuK6zqB66lBxrmGfA/6EQNQMT/XdMjkmJaMrTasU
	o/XZN+V0UowvnBsXhpZraxCDujo4Mp6Pt5OkIZPppQCkZhNTV3rj2wcRCQY5tT2Cp3fHUpXwglWOr
	RrcnIJgISXHqtDzde7bqmsipqeSlU+E8vFCjkXJZWgu83kCGf2aKwecHuMqmRV7ey45jcOuD77HJf
	w6pSoLUCsIqCGKY8/MPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqT59-009B0u-Rn; Fri, 26 Nov 2021 04:43:31 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqT57-009Azo-28
 for linux-mediatek@lists.infradead.org; Fri, 26 Nov 2021 04:43:30 +0000
Received: by mail-pg1-x52e.google.com with SMTP id g28so7070363pgg.3
 for <linux-mediatek@lists.infradead.org>; Thu, 25 Nov 2021 20:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gwJIiwnisD6cF408GW4bOCdNiOevm+kN2DCfktfQz/4=;
 b=p/HPnND/JDqjAz5osN2fiqxWxjwlxeukWlCnWFYdia3ksPcLdj2T2/w7EYHHk2wHzh
 8NoOKsyeh7nIRO3jA2Qp5+Zzr44CZP9J0vSuGvhzzd5Ul9T7StHo8IKBzGd2fG7GtWDY
 nTuYDnPwWGPJ6wmjXG3VlLZeKT3MdPKSc62rgr6+X422bqTD4m2MyX/LeNEwCfWWPAmJ
 WL1g3/QQ9L7Sk4aUC+UtrkapDFWHLz0QFTssZtHaZhFkEONtoJXKH8XKz0xoFpLLMfX9
 T9eYriy9fff/4MdXaIi3AukGZ6kvEwLf0KIs6V+L97ucwyXzlqO5xkmijlGi/tylQq5u
 qsYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gwJIiwnisD6cF408GW4bOCdNiOevm+kN2DCfktfQz/4=;
 b=sCMqTEFUDiBvI5m+2rJP0zPFyLvtKZ1kMBzTBqJ2Vope83JHeKwd7g5s/21Na31tpr
 0JFx43YJwWPNb9J/5ZhmyiOqsl2ZmgwjYpi5vS9RHHnG1dfMJN49tsHzy3Tdt/e2YBQs
 CsVlGOTAlZCKKnXw9vdeaQfQVnxSm0wYlbvdayKyXvrzWxNB6saVfSpaaodFFV3tlR2a
 EkLLYGehfS9Am2amqccWCLxPMazLlqOIwNMQJYONScqREm3yhN3o5VYLC+U4SZ8vgZWU
 Hpa7DeAe5adYITgkYIGgBIUxrHWqZEcTQRJgW2OFyN9lfOYAEsdJGECpazzUM126GgYk
 g2QA==
X-Gm-Message-State: AOAM531VhnC4OoTorKOQ64LqD9ZlgwJrzBm3wRazaefZtLRISNINcG06
 wzqV5idBpuS2NnE2L9F7+VsCNw==
X-Google-Smtp-Source: ABdhPJx0FjXR51YfULBYoNlN6azVm4pmsK/QdHHWCakrLIU0+ikdrQc99GBXkyRgdyNDpZyG+Rly5Q==
X-Received: by 2002:a63:150c:: with SMTP id v12mr19528275pgl.442.1637901808160; 
 Thu, 25 Nov 2021 20:43:28 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:5eda:d984:1426:91ca])
 by smtp.gmail.com with ESMTPSA id g9sm5600382pfj.160.2021.11.25.20.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 20:43:27 -0800 (PST)
Date: Fri, 26 Nov 2021 12:43:23 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, cujomalainey@google.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 sound-open-firmware@alsa-project.org
Subject: Re: [PATCH v4 3/3] mailbox: mediatek: add support for adsp mailbox
 controller
Message-ID: <YaBl66b7VFJK84F4@google.com>
References: <20211125122925.1303-1-allen-kh.cheng@mediatek.com>
 <20211125122925.1303-4-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211125122925.1303-4-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_204329_146732_393467CA 
X-CRM114-Status: GOOD (  12.61  )
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

On Thu, Nov 25, 2021 at 08:29:25PM +0800, allen-kh.cheng wrote:
> diff --git a/drivers/mailbox/mtk-adsp-mailbox.c b/drivers/mailbox/mtk-adsp-mailbox.c
[...]
> +static bool mtk_adsp_mbox_last_tx_done(struct mbox_chan *chan)
> +{
> +	struct adsp_mbox_ch_info *ch_info = chan->con_priv;
> +	void __iomem *reg = ch_info->va_reg;
> +
> +	return (readl(reg + MTK_ADSP_MBOX_IN_CMD) == 0) ? true : false;

To be concise, readl(reg + MTK_ADSP_MBOX_IN_CMD) == 0.

> +static int mtk_adsp_mbox_probe(struct platform_device *pdev)
> +{
[...]
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(dev, "no adsp mbox register resource\n");
> +		return -ENXIO;
> +	}
> +
> +	priv->va_mboxreg = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->va_mboxreg))
> +		return PTR_ERR(priv->va_mboxreg);

If using devm_platform_ioremap_resource(), it doesn't need to call platform_get_resource().  res is unused.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
