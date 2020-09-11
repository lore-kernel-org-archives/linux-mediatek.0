Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF06C43461
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 07:06:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E4D5221EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 07:06:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kesRxCEM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="Zj9C1l8K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E4D5221EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1Uu0pRp2jHjwVDrwQZFH24qOLS1S+riAuRY/hTKzCfE=; b=kesRxCEMii1xnyV8mjkacNA3A
	GxOxnDP13XV/bGHVrZhjnLq9dIWKLgddbaCiOs2hXIzCNCT4qFA5QWNZ4afsE8SVFE4iRaPLOv38l
	yDxOoE9WCdP1zdrhkUgoP++yEy1Vl4XkAnKv5pJWufxpDJmJWl0xWAOodgI2urWbbTPdd/k5UKafU
	t0QXM/g4bg3AHL4BIjlprxjpROCjTPKKrQtGl3k7ISbXgCMS0qL7pgaIIGX72jbrz3WizW98rYEnK
	GZ8+nkd1GKOiogDvQqf/VskxIOLQDchPEZqHq2CWHyw7pEuu+gIbNcfuR+DagjYDWQB+4MzXqVUGv
	igDUsf75A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGd89-0002T6-En; Fri, 11 Sep 2020 07:05:57 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGd86-0002QE-Jm
 for linux-mediatek@lists.infradead.org; Fri, 11 Sep 2020 07:05:55 +0000
Received: by mail-il1-x142.google.com with SMTP id f82so3432537ilh.8
 for <linux-mediatek@lists.infradead.org>; Fri, 11 Sep 2020 00:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XjqzgjQOFRpWcDyxvZxk4QJoi3x7zBwCHCwHFZiUpHE=;
 b=Zj9C1l8KtRpl+As+fC2SodYHV3leGr8IKnqUrXtbIKaxuPg+jO46cUnNc8nVxX18SW
 mbEW+8P41/MJvM/E4u41uFzqENs/81i6qVqtPc1CTfNlU3EKI4I1TUEtnco1j69bnEZB
 wLRzlq0oAuyYLrpP3Z5qmaGoU/ISEgtJhEqpeGcisx9o3OBg19btgYSqmZJKzsuqIBqd
 Is69lQN28aGTCuDIiW2Zryc/kx6uTbqlcXQ9Homq6iIxjNcfkNX3gKaIihnTzR7UstAN
 2VmsxeVA/wm3GsAiYpgtNStNHtBtN5TvK8oY9/xl1uIVCpI92OXTTqJMUgchu/8p+4nA
 i2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XjqzgjQOFRpWcDyxvZxk4QJoi3x7zBwCHCwHFZiUpHE=;
 b=X4Y3GXtIDCAoOuxNQH9OsWZQqjC82O99V0UcRwynRVuAtrHi/dQPg/2+nb6MCpfG6H
 qnb3yIjRmybBmHNtkqWQxzcYBNQ1GhGSE5fxApJLcHvg4qMqaQqOeJHUJHUsIszswgPJ
 ccvR0AESALoPMTZE5EgwnrC07WFJKLIbmYaq5BpwR0xpFxP1nA+fck16HI0fiH12bOxk
 LZODlOcY8rP3bCVh3zP0UZzZtxZjEd//XFCGvZ/HGN/KgFkWN2KbvMXHECdNYsj2RMD0
 8+rdY/rg2dYmM12nWBzDYGacAJ6y9FPrF/PFnvdCRvVdK42j1/mpBG9bLW1ohYFWJNP3
 kkog==
X-Gm-Message-State: AOAM530r9lcgq4dm5Hg55+0rrqPu6f+Q/+1sLtMiCzjWNh1iCi0gaDRX
 GL23rab/ckPar9SUioDBARSKgYy1HuIl0gdO4Vg6ig==
X-Google-Smtp-Source: ABdhPJxx9W+H95xTgv9e14gbLyf1rs3mr+kr5EwsJPRKWUGmYYoAK21qecVtMoUC7yBc5BRWpykI7hnP1cxl9BbtPK4=
X-Received: by 2002:a92:217:: with SMTP id 23mr715365ilc.118.1599807952488;
 Fri, 11 Sep 2020 00:05:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200910052347.1790735-1-cychiang@chromium.org>
 <20200910052347.1790735-4-cychiang@chromium.org>
In-Reply-To: <20200910052347.1790735-4-cychiang@chromium.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 11 Sep 2020 15:05:41 +0800
Message-ID: <CA+Px+wVGaSfJxNGXX9LEw10k11vG=m9_bLpONA5w4-0O7XF0mQ@mail.gmail.com>
Subject: Re: [PATCH v8 3/3] ASoC: qcom: sc7180: Add machine driver for sound
 card registration
To: Cheng-Yi Chiang <cychiang@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_030554_700382_F2ADE24D 
X-CRM114-Status: GOOD (  14.50  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Taniya Das <tdas@codeaurora.org>,
 ALSA development <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>, Heiko Stuebner <heiko@sntech.de>,
 Takashi Iwai <tiwai@suse.com>, Rohit kumar <rohitkr@codeaurora.org>,
 Patrick Lai <plai@codeaurora.org>, Ajit Pandey <ajitp@codeaurora.org>,
 linux-rockchip@lists.infradead.org, Andy Gross <agross@kernel.org>,
 dgreid@chromium.org, Jaroslav Kysela <perex@perex.cz>,
 devicetree@vger.kernel.org, Tzung-Bi Shih <tzungbi@chromium.org>,
 Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Douglas Anderson <dianders@chromium.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Sep 10, 2020 at 1:24 PM Cheng-Yi Chiang <cychiang@chromium.org> wrote:
> +struct sc7180_snd_data {
> +       u32 pri_mi2s_clk_count;
> +       struct snd_soc_jack hs_jack;
> +       struct device_node *hs_jack_of_node;
> +       struct snd_soc_jack hdmi_jack;
> +       struct device_node *hdmi_jack_of_node;
> +};
hs_jack_of_node and hdmi_jack_of_node are not using.  Remove them.

> +static int sc7180_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +       struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> +
> +       switch (cpu_dai->id) {
> +       case MI2S_PRIMARY:
> +               return sc7180_headset_init(rtd);
> +       case MI2S_SECONDARY:
> +               return 0;
> +       case HDMI:
I guess this enumeration has not merged yet?  It doesn't sound like a
specific-enough naming.

> +static int sc7180_snd_platform_probe(struct platform_device *pdev)
> +{
> +       struct snd_soc_card *card = &sc7180_card;
> +       struct sc7180_snd_data *data;
> +       struct device *dev = &pdev->dev;
> +       int ret;
> +
> +       /* Allocate the private data */
> +       data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       card->dev = dev;
> +
> +       ret = qcom_snd_parse_of(card);
> +       if (ret) {
> +               dev_err(dev, "Error parsing OF data\n");
> +               return ret;
> +       }
> +
> +       snd_soc_card_set_drvdata(card, data);
To be neat, move this line immediately before or after "card->dev = dev;".

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
