Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF16CC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Nov 2021 07:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rUaDoQ+9lkVFz5Xc2KQ+kqryNi4LaWtQMKUvzN+5si0=; b=Ivws3Sbf6h5Sl+
	zvKYmW7ccSZYfsdE4V8PEU78qFhmOaZJosr1BoGzbiiV9M778sGXhESVydD+qbp4e+nshqbs0uxJn
	9jx5Nlj7bjpH0AjlD/Hd3DYcMf0ceE7c3SIwDeFGQZzPIOOg0/w8uvTOxQ5zN6LlzjrceF1sLmv7Z
	TCPYr8+wttqCY4ACZGCQFtLpXKvpYeDvxHFvw8nb8yHI60Q68xqJlAfq3Wuel/NI5zThI5uArZ7d3
	jYesZFVLTtJ4GhOlJ4uNOWy2zWtNw590NWUYZPtXM/OijqLZix/fxOEPs18VUn9cErmd9/ikWMJOy
	jZmjgRQdgWSE/6BPvdRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqVic-009RZz-Fk; Fri, 26 Nov 2021 07:32:26 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqViZ-009RYm-5r
 for linux-mediatek@lists.infradead.org; Fri, 26 Nov 2021 07:32:24 +0000
Received: by mail-pg1-x532.google.com with SMTP id t4so7423134pgn.9
 for <linux-mediatek@lists.infradead.org>; Thu, 25 Nov 2021 23:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/AAtVNxSEEMIS2MWinkvg2Tqw1EN5wSqX+XDPy/nWgI=;
 b=rUX7EPkOpCeOT0XDzv3zPUO65mVufrZATtBDv60kEPRIqIXnd367uOnp27jiHhW1RH
 pfZDsfZurY3opAdcGf9KbD0CAfhLVt2lc23p8w5m5g7ZsI1vPM3dDlMayAl8unNLuaAi
 G7XpZttHEAyra0B8n1oEx1fJSRyN5ROr1twSvleukoCpfjG3iT1ywnNB2G438p+WUIys
 BpRXFIC11cFbUlGHe9PDWmgBInA1QAq8cAUe8RW5pHox17z+ePwRAIRe0iXrndMiPpku
 1llMHJ4ZOUODS2L0ni5PspcTSM8HJ1XdmckmEqkByum9Rjj5mNFqQ6aAS4S/l9AgDrq8
 E8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/AAtVNxSEEMIS2MWinkvg2Tqw1EN5wSqX+XDPy/nWgI=;
 b=Ig5hflD6It5yMUBhaHx+O2v3UOZajpP8Z+Yz+++MGxS0SsR8jSs9mcczKGUseJ+Q2t
 W2aClXi8gq1PIbkTtD68hGbdYASL8sbRIUaruPo86CQaaGrAF61aRGYKSpL7iAMNQA4k
 Eq+cfFFAxCY+QJ5+r/ZpjNp60fwcHvW6RbYbdlWgDXka5TKcXdJ8BqNNS1fXcqmcvDVg
 hYYy1jmVK1QBlEjtGC8Nf4VHO6rSVvzVDsskwzi3gcnzJxIAiJHEeOGuWLm/+UIy6lvE
 zAkcyLLdb2LpY4WOk5QLyvX2Yr20XtykLFunR8YPw8VGc3ubqU+aC0kn1nIz5Cn+INdt
 3F3A==
X-Gm-Message-State: AOAM530N3ziCoX++fkkD7Lk98dlGNYU3AO1QdnjvbiTjxAwscwTLLTf/
 Z5RZUVPlKd1Wu7T/k3iOhSfjXw==
X-Google-Smtp-Source: ABdhPJxBCLapsVbR8S32cbgSLGdf670vLzwnMC/H4p+iIY7hAahthtNMoj8b3XEDxeZJspFRP89tZA==
X-Received: by 2002:a65:4b87:: with SMTP id t7mr19646091pgq.115.1637911941740; 
 Thu, 25 Nov 2021 23:32:21 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:5eda:d984:1426:91ca])
 by smtp.gmail.com with ESMTPSA id d12sm4112656pgf.19.2021.11.25.23.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 23:32:21 -0800 (PST)
Date: Fri, 26 Nov 2021 15:32:17 +0800
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
Subject: Re: [PATCH v5 3/3] mailbox: mediatek: add support for adsp mailbox
 controller
Message-ID: <YaCNgRHFSoHv4toK@google.com>
References: <20211126071432.21990-1-allen-kh.cheng@mediatek.com>
 <20211126071432.21990-4-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211126071432.21990-4-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_233223_236983_92AD1956 
X-CRM114-Status: UNSURE (   9.85  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Nov 26, 2021 at 03:14:32PM +0800, allen-kh.cheng wrote:
> diff --git a/drivers/mailbox/mtk-adsp-mailbox.c b/drivers/mailbox/mtk-adsp-mailbox.c
[...]
> +static bool mtk_adsp_mbox_last_tx_done(struct mbox_chan *chan)
> +{
> +	struct adsp_mbox_ch_info *ch_info = chan->con_priv;
> +	void __iomem *reg = ch_info->va_reg;
> +
> +	return readl(reg + MTK_ADSP_MBOX_IN_CMD) == 0 ? true : false;

The expression "readl(...) == 0" should be already a boolean.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
