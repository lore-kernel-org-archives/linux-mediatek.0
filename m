Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB9CC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Dec 2022 18:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bsAx81CS2oGtFlCOIKJ8N6Se9n8UswnoX6gUXWJhq9s=; b=EZQ5g87kjkQxPYcgHfs3Si4sR4
	//rLllfdhA4BcneRa2bJCX5xuGVr2/5a1+4II/WU6bXkojN1nKgD4zBwvE9XQcAbp1OPyJwSz17xn
	dYAWOknuaM+XQA8FEM2m/lV3WseYu+s0RZqJkHQuf4NKzerRgjsY5M9wuvNi6uZJcE934U+7h8iGV
	8xycIv7JIR6FfNODSuIks1erFzackJTHqXA6iwh/L5LgjGomTj188d8g95zdlMurkcwLMqLuVW6WJ
	9RvL+VptFAGcxqwBkG9p4EVJ8CBhaNvtP5MxNYb8Y8wrBZSADn+i4La4pbx2fokdXoX9oYt2aOHDO
	/j/DuNGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p59mi-004TBA-QC; Tue, 13 Dec 2022 18:13:44 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p59mg-004T7w-C8
	for linux-mediatek@lists.infradead.org; Tue, 13 Dec 2022 18:13:43 +0000
Received: by mail-pj1-x1030.google.com with SMTP id js9so4268525pjb.2
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Dec 2022 10:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bsAx81CS2oGtFlCOIKJ8N6Se9n8UswnoX6gUXWJhq9s=;
        b=VuOVc9dMuIMJz0Dd34VYPlU6ugaxmknQDoMrG5R7uQ5/qpQpbyKwiY7mNU+QgDUtCK
         VkpAdxjZCrFA2AMI7fBHmIIkmi/kUbLQPoxtN0WcjCl9Wu9pcPv2N9pbGogcYhmmgu9x
         wuB1AkD9GkJYjpTrvyeJmuVJOnt7HPvElLbG7uivUVNghl8B8jEXZeTqTyTxUsFVtTS7
         U2qeQkM3IsBjwUJnG2ATPrYF+QYaYNX0X/Kt4O3HyDCyAcRLNQkML35HHbvsC19YHzyq
         Ue5043VbSlz6zLlvo1tcJHA0EmlHu3Ecg/ObI9fgQ6NOjD18pG5cCS68BdXHOs+DiSuR
         0Q4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bsAx81CS2oGtFlCOIKJ8N6Se9n8UswnoX6gUXWJhq9s=;
        b=WjlCymB4eVzq5d6c8AceqveCOajLQyqkg57yPoJyi+QXQu8hnB2hgOkJDstFO3pgqN
         sUZApRaZvcsw5t8QJSzwdoXcwiUC2oY5ozlVfK90pSvMEiEUXlW3ZTBkTNEWLKIUg9Rs
         AQv8HMGhqmV2zzlqPP5QdgezwOr7GXwj+2bfRtO+7QoBJ2+gtwJBV1xsdhM9b1Fl5Ysa
         Cll7qSp52z7kY1DME0M1XSRzEG9i/X+FqMSk2I+5Z1i2jkjO/j1vU+F35zMK1FwmLIHO
         GPtM6dhkqS4jzt93932JUuD3Ear8nAFhQ2c8nSJdlSdI2QE+B46T4k4oi8ep4RpLlXfP
         7xfg==
X-Gm-Message-State: ANoB5pkHw1jDE4bi3xjMUoGyIKH5qxYThXlUiCMC4+bT+T+s/LPW2h+m
	Jmzp18J8/bUDXH78+g6+uuodmTs6rojrfaVZSkL1NA==
X-Google-Smtp-Source: AA0mqf4/WHF+AYjmztxjz2jxNUncNhbMJ1aubsknOZGZah2GaEZhPlFE9bFEzQuI53SC2AwxWPH0+sI2DPdk1GSfNbM=
X-Received: by 2002:a17:90a:6708:b0:219:2b00:8d23 with SMTP id
 n8-20020a17090a670800b002192b008d23mr412904pjj.167.1670955217708; Tue, 13 Dec
 2022 10:13:37 -0800 (PST)
MIME-Version: 1.0
References: <20221213115617.25086-1-yc.hung@mediatek.com>
In-Reply-To: <20221213115617.25086-1-yc.hung@mediatek.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Tue, 13 Dec 2022 10:13:26 -0800
Message-ID: <CAOReqxihOWVh0rGqwqCJ3SEOnEpH3RDQv-U1PEQJ6Tj5e02Vag@mail.gmail.com>
Subject: Re: [PATCH] ASoC: SOF: mediatek: initialize panic_info to zero
To: YC Hung <yc.hung@mediatek.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Chao Song <chao.song@intel.com>, 
	sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, chunxu.li@mediatek.com, 
	Trevor Wu <trevor.wu@mediatek.com>, Curtis Malainey <cujomalainey@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_101342_428442_E02B6826 
X-CRM114-Status: UNSURE (   6.98  )
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

On Tue, Dec 13, 2022 at 3:56 AM YC Hung <yc.hung@mediatek.com> wrote:
>
> Coverity spotted that panic_info is not initialized to zero in
> mtk_adsp_dump. Using uninitialized value panic_info.linenum when
> calling snd_sof_get_status. Fix this coverity by initializing
> panic_info struct as zero.
>
> Signed-off-by: YC Hung <yc.hung@mediatek.com>

Reviewed-by: Curtis Malainey <cujomalainey@chromium.org>

