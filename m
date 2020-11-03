Return-Path: <SRS0=lxeM=EJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C90FCC388F7
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 04:41:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CFF9207BB
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 04:41:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OFzyTNnC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MXiyWkoX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CFF9207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GBGJWaRUe/c12NnTbIu+SYHZL8nK/fS2YxLzJ/4KEz4=; b=OFzyTNnC4dM9LDpa5WmMIbd4L
	IB//Xqs9iP0g0aYpcWpdys5uSgsMWt4b1xLwyZLs5E/MLjrqjqBIKv+jrOyxqPVRk/JhpvMXs3W5Z
	jzUSmtUiRYo6zJ0ZH2C9rua5+Kkk7W/XPrbtZSo4ujTkwQgahzeCj9yLBwEC+JRo7rV6KDn1YWpck
	6AV9KXBOBzdvpEwS9k1EOnUKAuMeCrpBvAGFGY5WFGsN3cmhGGo0Gxl3JBZVtRrzVZUZvYYyajZ2I
	3zkc3Dh7ejOGJl5FUu6k+cdAlQqO5Ikc5M4pdsct7QlGdOWg0Mo/M3bEaOIGYoEzY3bpE4JNCoVfN
	ZZuJu/79A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZo7q-000578-4k; Tue, 03 Nov 2020 04:40:54 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZo7o-00056Y-61; Tue, 03 Nov 2020 04:40:53 +0000
Received: by mail-wm1-x344.google.com with SMTP id c9so9852140wml.5;
 Mon, 02 Nov 2020 20:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZsLiELZDgcODbFWwv/znA2TZHH9P89qCS6Bl8IJIhes=;
 b=MXiyWkoXcOBvIDIqhK/7qOuAxVzeBzwauMfq6g7W67XTP6rdqX3h4BkrPvcLMiYUaX
 Df79GopWOuKeglWChvyynkNPTYMC5e59eNVN4MojGsaN0q0bxUfZcUrNp+J9eskY5/ku
 HPVB8S47rbbEd6OCj88GuEVD0niVjehAZAZ096Yvh9ghh7O4u/NNZxahSkuKa1JgrrDm
 quRLqVkpKNs2VcfNs+GQyi+3y5S8K4twujeXLr1efTN8zakcGKSeyRsH72IgV78qx08v
 OfQdo0z0DErlpFAuHBIik3V5QNTXt8efZHcVAFpg5KSgTJawkoFsSPnWBrSgEWNLegZr
 IjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZsLiELZDgcODbFWwv/znA2TZHH9P89qCS6Bl8IJIhes=;
 b=Jh+RVoO81BvCrccgoW9faS+eR19YjffFpLGzjoWG1Uq57IpjTOK3SKncND8zv1P7l6
 KWMH9KoPz1LBgL/4a8I54mwnmpiv8R1ts86mtmUYc31hNm9fLpEU+ATJHqHDjn9zGAnZ
 BVOaKsCSbIIfjYxWCz0F2XeY4lgyEZT12ZGaljWIYhQqCbyu8B7jFcRI6pp686ZWOMUJ
 kNEpmd3X7vP7znxhOlsXxUVwhJuRPalLvPXYwLBNWwXSnzItNs57FObc0nERjqfzblyW
 QpnO0RX7IDRY0s+IvRTZdZHgU8sphjkQHPCK7dubL5s/WLAJtk14mG0Sfv0/zBz9ZcOC
 dxZw==
X-Gm-Message-State: AOAM530QNXLS0QPZmn/zo4JQSp/wjzxP3dGqPjhZS1ibG/UWJDU0q80D
 k/vuRWBajZMbTvwAAmXjychZZc6kYjZ3uDC9Lw==
X-Google-Smtp-Source: ABdhPJxQpc0z0XrT27/+lJ8iKLXRrHcrLo1NjLe8WzIH9ejxMt/T2Mirus5FzjK4k8biDW4mWHMYyRRjS2/iV1pJIB8=
X-Received: by 2002:a7b:c305:: with SMTP id k5mr1455562wmj.102.1604378451087; 
 Mon, 02 Nov 2020 20:40:51 -0800 (PST)
MIME-Version: 1.0
References: <20201102193402.GA14965@Sleakybeast>
 <20201102194055.GA2429929@kroah.com>
In-Reply-To: <20201102194055.GA2429929@kroah.com>
From: siddhant gupta <siddhantgupta416@gmail.com>
Date: Tue, 3 Nov 2020 10:10:39 +0530
Message-ID: <CA+imup-scsOiVghh9UyO=3SXFqj614dqJ-FjppF7hzzgz_D+Qw@mail.gmail.com>
Subject: Re: [PATCH] staging: mt7621-dma: Prefer Using BIT Macro instead of
 left shifting on 1.
To: Greg KH <gregkh@linuxfoundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_234052_330026_46814419 
X-CRM114-Status: GOOD (  16.88  )
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
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 Himadri Pandya <himadrispandya@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 3 Nov 2020 at 01:10, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Nov 03, 2020 at 01:04:02AM +0530, siddhant gupta(siddhant1223) wrote:
> >
> > Replace left shifting on 1 by a BIT macro to fix checkpatch warning.
> >
> > Signed-off-by: Siddhant Gupta <siddhantgupta416@gmail.com>
> >
> > ---
> >  drivers/staging/mt7621-dma/mtk-hsdma.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/mt7621-dma/mtk-hsdma.c b/drivers/staging/mt7621-dma/mtk-hsdma.c
> > index 354536783e1c..a9e1a1b14035 100644
> > --- a/drivers/staging/mt7621-dma/mtk-hsdma.c
> > +++ b/drivers/staging/mt7621-dma/mtk-hsdma.c
> > @@ -72,7 +72,7 @@
> >  #define HSDMA_GLO_TX_DMA             BIT(0)
> >
> >  #define HSDMA_BT_SIZE_16BYTES                (0 << HSDMA_GLO_BT_SHIFT)
> > -#define HSDMA_BT_SIZE_32BYTES                (1 << HSDMA_GLO_BT_SHIFT)
> > +#define HSDMA_BT_SIZE_32BYTES                BIT(HSDMA_GLO_BT_SHIFT)
> >  #define HSDMA_BT_SIZE_64BYTES                (2 << HSDMA_GLO_BT_SHIFT)
> >  #define HSDMA_BT_SIZE_128BYTES               (3 << HSDMA_GLO_BT_SHIFT)
>
> In looking at the code, does this change really make sense?
>
> (hint, I don't think so...)

Following Checkpatch, I thought it might be good to do as checkpatch said,
but the code looks better and more readable without the change. This
is my first patch and also a
lesson that i should not fix every checkpatch warnings. I'll pick
something better next time
Thanks for your comment
.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
