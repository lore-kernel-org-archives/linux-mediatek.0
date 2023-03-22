Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A81DC6FD1F
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Mar 2023 06:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ke6cIxwNHxgaZFBB/jfvzTlKS8OVZziRO/zVUdektKA=; b=fvNwgKCz4G1kPUlx6yM4aL8ERv
	RMkai7te716uvJ/zOSTfJzZWymG01GS2tAsHfLaPn3l3nJcuWjifzIHEaugZJuX61kqimvYSCgK2O
	CX/XMkOsTSKlD41VKYdubGOVJdD0QXgbwKvRDayL8BwlXr0xerqHYdFfINUKhARYCCIhM+OzgTFpN
	euJR4jhwvjfCii+YYClbIH87/fjpzKJNMJ7ZEssUiNF+wwYeT+GYO01nIKAfDAoxr1fTEU2uO3/2L
	aSC6SUCt+CZlWqY54lidLRrus/Hztum9xJpHHzWbCZoiahUtEK0bGEl8TN7mkC1T+CeHUTXrgopZT
	aYEC5A6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pes92-00Ethn-28;
	Wed, 22 Mar 2023 06:40:24 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pes8y-00Etge-0g;
	Wed, 22 Mar 2023 06:40:21 +0000
Received: by mail-oi1-x22c.google.com with SMTP id bo10so12912559oib.11;
        Tue, 21 Mar 2023 23:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679467218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ke6cIxwNHxgaZFBB/jfvzTlKS8OVZziRO/zVUdektKA=;
        b=Q+vsce9EVvE2Qi8+y+Ai+bv9SHNlRk/DlNRdlqCbEt3wRtox7tm4AUQbEJsSDmcZ5E
         RW/UOgpCYJ3TugUiBJ4err05Rhxbzy2cSTDV03fuZ/ymiq5oybkMjcte9WTqMQO1vp9G
         VHHVycN6/PA2FqD0gTlAHI2+n2AC1aG5CaN27ZNNsPMoo9DVyVTiXKPUDSGQr80kXYUe
         NkMevox6Mrr54s223nOk4kNYlZCLr1rfhPijhjTQJ4zGiBhvkb1QbcmJJLIjYEXcaCC/
         9rmU/Kn6QsP366UbgIOgfmADBxdlUiSVPDlXkxLVIKQ2sBH6nmH8axd6C09JiwoihP6e
         Fk8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679467218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ke6cIxwNHxgaZFBB/jfvzTlKS8OVZziRO/zVUdektKA=;
        b=8PcNWaw4bURGilWIhwKxTwFLd1m3n9j5byn126VFQ3TQCJMMZrTrE67WYo9bUu598t
         +rrkbZVGfuL+iwjvj/gTgXy0U9vbY5o59wzfezg5jQwi1VM4Vsq81jtJ3Moh+F9Ia8qG
         sJzXI8hnMg9QgKYH9PWADHnE6RtBip4Uboalzt24Yh+Ln9B/DUp4N5NbssWKYeb71DwA
         A0J767NW/PU2ZrkqgGksKBvOtrQ8EFJ+LnLOf1da7Q5ebQkhXhirZZIDIWn4/Hlq+ivK
         Fd5vHtcTAZWy1hA2KwwX79Pdn4gIJic4np2n+KrIOcPZuPfNGcXn96vgirqUUw1nLXc5
         QjlQ==
X-Gm-Message-State: AO0yUKWm8TPTqqvxZa3VDOoQ74h3V/5ybGYoe/vGAXXSALgasiKYklXN
	uJ2O+dyxPCX2dNJAHMyZ7nlqKB/pT9otgWOrLCE=
X-Google-Smtp-Source: AK7set/ivZ6wY348VkcNilAhR/sb4gt0fLnpa3AYCKBQvEAMpAWigD5IYwL/fir/gtIK6LYSFC4gxAsFBcch815+ksQ=
X-Received: by 2002:aca:190a:0:b0:383:c459:1bc with SMTP id
 l10-20020aca190a000000b00383c45901bcmr688095oii.0.1679467218089; Tue, 21 Mar
 2023 23:40:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230321193208.366561-1-u.kleine-koenig@pengutronix.de> <20230321193208.366561-12-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230321193208.366561-12-u.kleine-koenig@pengutronix.de>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Wed, 22 Mar 2023 07:40:05 +0100
Message-ID: <CAMhs-H-44g7Yu-J__1bGK6B=CYqDUrGXehrBTsKSSb-8X6fvSw@mail.gmail.com>
Subject: Re: [PATCH 11/15] PCI: mt7621: Convert to platform remove callback
 returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Rob Herring <robh@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pci@vger.kernel.org, 
	kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_234020_272194_177C7804 
X-CRM114-Status: GOOD (  14.59  )
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

On Tue, Mar 21, 2023 at 8:32=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/pci/controller/pcie-mt7621.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Best regards,
    Sergio Paracuellos

