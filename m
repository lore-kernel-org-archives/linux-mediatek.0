Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15688C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 16:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sTZrnb96bHmIjthcRrQMVXYHbfM3Gzj53kIxlmzsmjU=; b=w9BZqWukbpy52z
	JzRNyYE/HzdjABb+P0FFe/pbxlWblCYE2Ihg7GqGFy4N2QyHL93jMCVeo0zq4Ir0PtpJ/05UhoR8k
	MkOV4QJLVWUWNplyslxH0rh2CFx9m9YkZEAU0Dwlgja4UzN5myhrVGAdD+N02aactN2fwqPK3TJ9w
	MhyqgS015JRHrgDQpcNR6FgxdymtzwDoNKhtpOrGw/lohjzW+OPhyu++Jr4fSRU0jeJUlFjpzISdi
	rEwr7hkoFi8CEDI33hC6iAje70K0ytPJk0WAh1Mv2WWRZZsq4hPUaMDR0tiM+XQ1t7HgP52eiClbZ
	8gWQ8mAXSOfgvuz7n7xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8Pu3-009sse-Fq; Fri, 14 Jan 2022 16:58:15 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8Pu1-009srZ-6t
 for linux-mediatek@lists.infradead.org; Fri, 14 Jan 2022 16:58:14 +0000
Received: by mail-qt1-x833.google.com with SMTP id w6so2836529qtk.4
 for <linux-mediatek@lists.infradead.org>; Fri, 14 Jan 2022 08:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3/LknUee5tShvPQdGCDJMgZycBj7j7tFq0oVBnp2e2k=;
 b=iVbeHVWMHHQPD1rqqEEZ8DrfcGbToE5o1zbVM35kRg/Odick5qpphoDqLNEV9QsqWM
 MdJuBLZpxmVZUGKZ/U+RT1Dz9gF35kE9KGSv9DtH01kx/MVKsj0th6OCGg44bRFur3do
 owooPCV25uNhuTReUXOtvctS+yL0qqIjAuYoQWs4Z/fXicEeTIVphCSjEonP+DaPuugh
 iRERJ3q7mKRJ4tiaWnKlZ7vUZPO83bjO7ijrkCdhr1Td21bxGEASeVEyhxiK2/fZmGpC
 HdiecBrry7MYtklo3Uo9OBTlnElF/8Q4Pd8a6vxoN6d9aP8OLwdBZQ6B3ug4ThoM3j8K
 v2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3/LknUee5tShvPQdGCDJMgZycBj7j7tFq0oVBnp2e2k=;
 b=Q/QYNYzOU1vdLAUx5ULWq2/mkJM1Il+RjsO/9e8oFt9atYdylzNheWZHjYE1ilGIQL
 cj0gxXYhbuHal3Pmwq5gHsgynTFjlN1RAf3D22jkgdWzV+/7kVaqgs5dys3jclsRfSPm
 pGHtv+8L7JX67sgCC4F4VJ2GVNYyKy7hbrnGwqiBINtdo8H671L42Lb92yrh6FqImIZu
 TfDBD63XHA1j8Dyxf7ww7dK/mN/PFyCnoJZCkvqXuU26/LhOTgsHVso6bcKiHyGO3eBy
 6yv5onkDVL91cFVzE60KRMqe8VTkrCd2l75JbccDehU5jUe1FfoX0aRUdYlrMGD4zr76
 QKmw==
X-Gm-Message-State: AOAM530HmXVWenBGMs2bf/nMEipMeFAIhRlQK+9PTu5vjQ9hQVICs1OU
 z59S0FYPMsH/C4PVDm8/EkaxL3sjypc+k7LQBsTj9w==
X-Google-Smtp-Source: ABdhPJxLfPwEEBa+Ap9zKOritX0zyA/zOHrcclb56wSl9nFh7Fse60RiU41+kwlDQ+/tbTFIav2jJw6+dJm7B0eVyJU=
X-Received: by 2002:ac8:5c8e:: with SMTP id r14mr8329561qta.42.1642179488381; 
 Fri, 14 Jan 2022 08:58:08 -0800 (PST)
MIME-Version: 1.0
References: <20220114114633.742-1-allen-kh.cheng@mediatek.com>
 <20220114114633.742-3-allen-kh.cheng@mediatek.com>
In-Reply-To: <20220114114633.742-3-allen-kh.cheng@mediatek.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Fri, 14 Jan 2022 08:57:58 -0800
Message-ID: <CAOReqxiSAhrSjXVW=D+ndXko95qLuHGkkNs5Wf-yVEcv1YompQ@mail.gmail.com>
Subject: Re: [PATCH v14 2/2] mailbox: mediatek: add support for adsp mailbox
 controller
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, 
 Tzung-Bi Shih <tzungbi@google.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Kevin Hilman <khilman@baylibre.com>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 sound-open-firmware@alsa-project.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_085813_275385_AF269332 
X-CRM114-Status: UNSURE (   8.44  )
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

> +
> +static struct mtk_adsp_mbox_priv *get_mtk_adsp_mbox_priv(struct mbox_controller *mbox)
> +{
> +       return container_of(mbox, struct mtk_adsp_mbox_priv, mbox);
> +}

this could probably be inline


> +
> +static struct mbox_chan *mtk_adsp_mbox_xlate(struct mbox_controller *mbox,
> +                                            const struct of_phandle_args *sp)
> +{
> +       return mbox->chans;
> +}

also could probably benefit from inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
