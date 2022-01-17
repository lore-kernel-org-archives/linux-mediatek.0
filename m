Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA41CC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 05:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yd2wn5W1KVDGrV0KyExNYMf3TqXaCmLIeRqNE/1kw9U=; b=21KXUjIkWr4Ddi
	RMMGZFMA7WVrSfZLTUNozXOpImLi2tzkmjn8XxFO8plbNxWHOMrvcFc8qxb/SS3UNh5tXPmoC0v6i
	cqBN9K8vgiQ+fyVIwU42ietR/2BVBwynrFwhfNEnTjQ9jbJWiGdNWQJ6I/Kb9U6iAWFmxav2IHr8D
	yDhpfDKv2yvBet4DA/a31TFIiZlKYz1evDmUDXbKBYSKnyYsThhz3gzHEPoJHv+a1ytB61Tx6q41u
	ZL+kGRxlH3Kyg7azR5fkHN4zoZ8EDbNCQx19OQe0LKi8xr6cHCtgx7l2UymDcRwzDgtq7yPcHzhNl
	aegi0Q5H1JkFjpqSSh4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9KpZ-00DUiZ-Qu; Mon, 17 Jan 2022 05:45:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9KpO-00DUhI-Bn; Mon, 17 Jan 2022 05:45:15 +0000
X-UUID: 03e8143850ca4bb3907d8e0459718a7c-20220116
X-UUID: 03e8143850ca4bb3907d8e0459718a7c-20220116
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 77228836; Sun, 16 Jan 2022 22:45:03 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 16 Jan 2022 21:45:02 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 17 Jan 2022 13:45:00 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 17 Jan 2022 13:45:00 +0800
Message-ID: <73221aee8a6144384309c1b2e01acdb8c1531c5c.camel@mediatek.com>
Subject: Re: [PATCH v14 2/2] mailbox: mediatek: add support for adsp mailbox
 controller
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Curtis Malainey <cujomalainey@google.com>
CC: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Linux-ALSA
 <alsa-devel@alsa-project.org>, Tzung-Bi Shih <tzungbi@google.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Daniel Baluta
 <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Kevin Hilman <khilman@baylibre.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "Linux Kernel Mailing
 List" <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <sound-open-firmware@alsa-project.org>
Date: Mon, 17 Jan 2022 13:45:00 +0800
In-Reply-To: <CAOReqxiSAhrSjXVW=D+ndXko95qLuHGkkNs5Wf-yVEcv1YompQ@mail.gmail.com>
References: <20220114114633.742-1-allen-kh.cheng@mediatek.com>
 <20220114114633.742-3-allen-kh.cheng@mediatek.com>
 <CAOReqxiSAhrSjXVW=D+ndXko95qLuHGkkNs5Wf-yVEcv1YompQ@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_214514_444457_8DD32A71 
X-CRM114-Status: GOOD (  13.81  )
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

On Fri, 2022-01-14 at 08:57 -0800, Curtis Malainey wrote:
> > +
> > +static struct mtk_adsp_mbox_priv *get_mtk_adsp_mbox_priv(struct
> > mbox_controller *mbox)
> > +{
> > +       return container_of(mbox, struct mtk_adsp_mbox_priv, mbox);
> > +}
> 
> this could probably be inline
> 

Hi Curtis,

I check the symbol table of kernel.

get_mtk_adsp_mbox_priv is decided to inline by compiler.

I think it's ok use inline this function.

on other hand, compile will not use inline definition of
mtk_adsp_mbox_xlate for the mbox_controller's implement 
(I also check the symbole of kernel)

I will update next version for get_mtk_adsp_mbox_priv.

Thank.

> 
> > +
> > +static struct mbox_chan *mtk_adsp_mbox_xlate(struct
> > mbox_controller *mbox,
> > +                                            const struct
> > of_phandle_args *sp)
> > +{
> > +       return mbox->chans;
> > +}
> 
> also could probably benefit from inline


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
