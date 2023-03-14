Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB0DC6FD1C
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Mar 2023 13:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rUQI6BU1IBTSG/kudnwVdGHgTOU2we1fQXVkabTw92g=; b=gAdNT2duzCbLmXmkRbf8qEPEv2
	hwdMTymh/hUfXYVumycmk67YEapy3nNvO3b1//TgAj3TDGSrJmTdxdD1eIEFOp0Zy6vk3eczPqz98
	C08rFLEtBZtTDZkx9Fj+Q+YESnpLoZgPGiljA8T+bcYXa2R9qu5AgXuOlt+Ix+nzLDfHGJy5xYGnN
	jLZUyyVhSfbXOiw00Uo4+HNR5llizD8YQcxV1LVOTCvA2WF3obTZtjAuDkFu6yXBtXneCf7DdVlCD
	QxJYfPV7vTigubFeOwXimQsAAJad2V80nwbO+XbdG7amw0xnKVq0XR/bTp/y0znRn1nQ7xaXUcMTi
	b61ZLwkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc4tW-00AKJb-28;
	Tue, 14 Mar 2023 13:40:50 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc4tS-00AKJ2-1t;
	Tue, 14 Mar 2023 13:40:48 +0000
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B331B6602FE7;
	Tue, 14 Mar 2023 13:40:41 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678801245;
	bh=SFPwXvcjYlpe+WHZRER6c+pWCXhtFKTjbX1zkF7J7ao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=URtjOTkW6TkqD7dIl9lJAed9SJ5pALFeq7VnUAo7hHEoDZCN5h8tZVJai+SwcL/30
	 QbYGjxpYRH0EvmOVkKhfK44JjvFbZUUOsByrNE5H7OXm5MRzdBA51V57vGiuBoebjG
	 puOPfP9F0mMRnV7ALTzcSuvlwkuqwLu1AW2HQWtTgOM9Qe8X5TPWPO/0VS4J5LpHfV
	 QX2IAuX2s6UEJdz357jNLiBPDlpKGAwKILc6FWwduDBclFXleme5oLRiscHQRMVynT
	 5vrKCG4nNqq+mYN6lQiferPbBCQBlyBPUS9ZHQaOCmp435gp5EvfpZ9NrM4cW4uzpI
	 pzDszWupqPZQw==
Date: Tue, 14 Mar 2023 09:40:36 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, kernel@collabora.com,
	Akihiko Odaki <akihiko.odaki@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Takashi Iwai <tiwai@suse.com>, Tzung-Bi Shih <tzungbi@kernel.org>,
	alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] ASoC: mt8192: Remove function name log messages
Message-ID: <20230314134036.wo6oib55dhzsgv4d@notapiano>
References: <20230313212908.2282961-1-nfraprado@collabora.com>
 <20230313212908.2282961-2-nfraprado@collabora.com>
 <f8d1fb49-c802-5c2f-0c7a-aeea1b25968c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f8d1fb49-c802-5c2f-0c7a-aeea1b25968c@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_064046_757706_352F65CA 
X-CRM114-Status: GOOD (  12.44  )
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

On Tue, Mar 14, 2023 at 09:30:15AM +0100, AngeloGioacchino Del Regno wrote:
> Il 13/03/23 22:29, Nícolas F. R. A. Prado ha scritto:
> > There are some log messages in the mt8192 sound code that print the
> > function name, presumably to aid in tracing. However this can also be
> > achieved by ftrace and without spamming the console, so remove these
> > messages.
> 
> Yeah, I totally agree.
> Did you check the others (8173, 83, 86, 95) as well?

Not yet. I can check later if the patches from Mark didn't already address this
for those other SoCs and send another patch/series if needed.

> 
> > 
> > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 

Thanks,
Nícolas

