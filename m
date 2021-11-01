Return-Path: <SRS0=DXFh=PU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE8CBC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Nov 2021 17:56:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 923CD61058
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Nov 2021 17:56:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 923CD61058
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TIamE7tP1e+UT4gYbI65TjG8sG60Pk9auq4MaPC09gE=; b=IqLALri2M/fhjp
	g39pNHjyCiY/JqT6xi5miakFrK2AE1RLWB8le0wCp5yFtHXiwc8/ZKWNjhCsvpyvjrg74DhzVyOAv
	MHkoviASIOfW8XEYqfw9dZmsOa9qO3G8LqYYokpPRaRp0OD4iEDMQzD2JMl8qZIoHEP0n8ikTkLWf
	gdHY5v8uP9Es68/n88JU7djh3tWL93A2t7CZkBk7ghPwJhyIkjBL2wNr42J/73txK6qh2p+DoH1Ve
	CQnOqsPe361M4W30YnzIpZAjLY7I2Bs0sAtQYkbov6d9LDnam9VNLqZqx1Y0OtwB+GKDWCZ7yrLO3
	0oMtcA6jfu3XdqIk2COQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhbXj-00GxrN-Eb; Mon, 01 Nov 2021 17:56:23 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhbXe-00GxqY-PL; Mon, 01 Nov 2021 17:56:20 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so468464wme.4; 
 Mon, 01 Nov 2021 10:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YZ2A2AWagNpv2J8C8P3tLCVgYhd2un+CUt39jsHUZpc=;
 b=JsBw+/WDf2+nx6I0RUT1eXgDPCkJk4ykkvyEZ238RYwKJ3qDaKRsJODzA9eJ1SrR6M
 KR5MYPjaYeQUnH52j2eXrj8I/uz8phJ2Z7uZ+JjusWHJFxfRDYpZ9+sZbyqLjnDzf2P7
 /Z8TjVHHXrDSqPhsxCSjk/6CL8CJsOc5ZJE78ur0eMGBNcJBrd51DCpeRCyzH7ovKCoh
 kgE2c64VAfVU0nY6ajuPze5o6VeNElMlXUmUiJ6wKhmfn6Lvdnc1qGAJouGUubToQr1R
 aIoxZ+m+5GfutNpg8WEN8FS2IfUjXSci/JYQ5IPSRX97WHpmhFJfi//GDhu6nPIvtG9j
 FK5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YZ2A2AWagNpv2J8C8P3tLCVgYhd2un+CUt39jsHUZpc=;
 b=0YgTBxR6BIrvP4fERkRZsIvgR85C5TY78Kjivsr7qTSQANahkHCOMyxFF7rQdWD2sD
 z+i0DiKoflde9EB5+9WV7mB9aJpDQXoP8fPJ+XRHg0TnHELOFb3WX5EHqburCEir1qed
 bJxZE0QV38zrudIHogGsVZRMAN7+4lHYZobhO5dD3lwq49Nj7zUoH40hadg7/tooXfqw
 HupJaSNjQ4btHp2Ei1Ujl0TITdfJ0W1OuMx8DzQCzxATESTPk5ZzRUYHvqjWcCPl4orQ
 xAZZtwHsU5i3UyTDdq0cmt5jGTqM4Gat/kXjIE+4nE60ZMLvXH3xVdyPApNfRwKzqK6k
 NYXA==
X-Gm-Message-State: AOAM5302cEh8/0tv7yMpt56loig6wyNlr+1C+k/wUid4E4sbHCqd8a6Q
 8KLDMezxxW6Os6YUOk1YcRESOleyxZEIF23kX24=
X-Google-Smtp-Source: ABdhPJw8wKcfyMP3WnvzELw4fAFEeF9Qqe/NMhnO6k7F1oamAM9YgTt8bPddiGlxtH3a7+NJoBGGnIWyIHXYGeKvo1o=
X-Received: by 2002:a7b:c1d5:: with SMTP id a21mr502663wmj.14.1635789376712;
 Mon, 01 Nov 2021 10:56:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211028135737.8625-1-yc.hung@mediatek.com>
 <20211028135737.8625-2-yc.hung@mediatek.com>
 <YXwoB7FtRw0AzgcD@sirena.org.uk>
In-Reply-To: <YXwoB7FtRw0AzgcD@sirena.org.uk>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 1 Nov 2021 19:56:04 +0200
Message-ID: <CAEnQRZCQHxctG+3L72Xx3083shytF478ONGGpZf0A-6-+nFE=w@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] ASoC: SOF: mediatek: Add mt8195 dsp clock support
To: Mark Brown <broonie@kernel.org>
Cc: YC Hung <yc.hung@mediatek.com>, Takashi Iwai <tiwai@suse.com>, 
 Rob Herring <robh+dt@kernel.org>, matthias.bgg@gmail.com, 
 Linux-ALSA <alsa-devel@alsa-project.org>, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Devicetree List <devicetree@vger.kernel.org>, 
 Daniel Baluta <daniel.baluta@nxp.com>, trevor.wu@mediatek.com,
 allen-kh.cheng@mediatek.com, angelogioacchino.delregno@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_105618_845537_90E349BF 
X-CRM114-Status: GOOD (  14.25  )
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

On Fri, Oct 29, 2021 at 8:00 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Oct 28, 2021 at 09:57:36PM +0800, YC Hung wrote:
> > Add adsp clock on/off support on mt8195 platform.
> >
> > Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > Signed-off-by: YC Hung <yc.hung@mediatek.com>
> > ---
> >  sound/soc/sof/mediatek/adsp_helper.h       |   2 +-
>
> This doesn't apply against current code, there's no such file upstream.
> Please check and resend.

This patch was sent only to get an Ack-by for 2/2 from Rob Herring.
The patch will go first to SOF tree and then I will
send you a patch based on your for-next branch.

YC sorry for not being more explicit. I think the right way was to
mark this patch series as [RFC PATCH].

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
