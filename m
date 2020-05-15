Return-Path: <SRS0=cOAS=65=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2AB3C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 13:33:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82F9420758
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 13:33:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EVA1Gy/9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82F9420758
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xRYZLSZujmEs/tbOPsBKsQjgcZE/bD81az3ctEtLM3c=; b=EVA1Gy/9mrFlDi
	GhiYPPJRLHcvhZDbW5e5jyqxHRxUWSxwrnOGy0HxEk6iqOLMqfSR7iZ/057qNaapWWrzMVuIctFfZ
	yb6Pt/ApkvNIm441bC2Y+dfDjLMUt2KRwskrMZ3vyDds5usq8mVooeaq+sLC+rlGjXqDx4zCC3ESy
	2g5i9lYX4HKMA+ZLj0NoJ0Th9tfGgTy0ObWd/bzyfprBsJXV6FnElLGoPv+IJrRRnD/+YFVEWVrit
	51Zg9V8lowBlJ89Q3CdW+xv1yoaeFo/RN7abmK5KeuHcWHIjUG0H4kfuUFyI8xeYi1DVV95LGmQZA
	9EWBPbc+9GZk2MjnJyNg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZaSM-0008Eu-2t; Fri, 15 May 2020 13:32:54 +0000
Received: from mout.kundenserver.de ([217.72.192.74])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZaSJ-0008EB-JE; Fri, 15 May 2020 13:32:53 +0000
Received: from mail-qv1-f45.google.com ([209.85.219.45]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MLyzP-1jrWym0ghl-00HsXG; Fri, 15 May 2020 15:32:49 +0200
Received: by mail-qv1-f45.google.com with SMTP id d1so1050380qvl.6;
 Fri, 15 May 2020 06:32:48 -0700 (PDT)
X-Gm-Message-State: AOAM530JwE0bxDFD9+eDlPLZQUxXP4H2M/zizrBPnyi9gQF3pvNqQt0s
 tAbSy34cnSsQ8WcJtZBMvx65VjC4FI/UUBPhrYY=
X-Google-Smtp-Source: ABdhPJxRaY7zY8QTvNzuxerWSaqGbHKOK4FIyf/5qJLFxDuhmkrh8pWdFCVTHGQsHaBEpA8LvsOh8UJboFLS9sON+fo=
X-Received: by 2002:a0c:eb11:: with SMTP id j17mr3448680qvp.197.1589549567720; 
 Fri, 15 May 2020 06:32:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200514075942.10136-1-brgl@bgdev.pl>
 <20200514075942.10136-11-brgl@bgdev.pl>
In-Reply-To: <20200514075942.10136-11-brgl@bgdev.pl>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 15 May 2020 15:32:31 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0XgJtZNKePZUUpzADO25-JZKyDiVHFS_yuHRXTjvjDwg@mail.gmail.com>
Message-ID: <CAK8P3a0XgJtZNKePZUUpzADO25-JZKyDiVHFS_yuHRXTjvjDwg@mail.gmail.com>
Subject: Re: [PATCH v3 10/15] net: ethernet: mtk-eth-mac: new driver
To: Bartosz Golaszewski <brgl@bgdev.pl>
X-Provags-ID: V03:K1:7NQvBRThVrzObBDSJ03Eocseq+bZx5c3QTKTd0EBFoXkb0IabPo
 WBkUQ8OPKR+AY/DJjNkuorc3fMeSuYmVtHwzcwaBwPOtcXOkaCkNbYFWtjsPQjnw23iYQN+
 sTU9oXEiYf9Bd91E/qqwzqCFNOBKOFcx5UZGPieMNzMhJAZsoYvSPGmBDkkGxdoC/Ux6/yX
 KFGORbeo5W3sc0YBxgZGA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pR54HUXy2TA=:QC/gINpMpCTjA2olnii28D
 MXSH9dJaDaYmgJmG+S7psobl59GHolYKzQge0/0HlefbruqAet1KzcruqTkV9bjUwu13GOtH/
 XwBuvabe6FMNO+rlOIbj18Vp//ojcp+YqnjKUwL2w2R21R/6qMghnKFziO7mtXSiegHoQixP1
 qj4D0cF6rB+hEbUGIpEe6Y2vi7HLzAbFvf+zIrxIfXW4P8Mpcbw1rlCz3/E8S3bfMskdRDJ0i
 G9VWgdaw64lIb8mkpRR9JOI0gt6Mix2T6j7Tfb1OybaLeph16otBYZDGQdRuJYwULJgFR0SQz
 YIL4VxfLpCcNlzbOJzqiqEXtsF1S/2EHUO3kg/51HNIIx905R4KEYuv1cJh/MJpMmoFgu8zXV
 8q6wS8qL6b0ABDolIk9Mjfsw6dUZ6Guposo8Mtel2FuwCV0dlmj9+LgzghmTzdErRYvnVOlOM
 bICzTuQ+iXqLGPJuhPdc0psbE+Mr55ihlCHeT1QjZwyZOqwuCaVzdTazxU+ZUBvMp7LSUPtKA
 vvyampbsjGIJUanoDPnA2laNazgQryNm0NsPpdZ1QGmDp9DWSCw6FyCHvJZvWmokYCekYC55h
 14VfAHgQxvpPL8oVGb6z+mS/VS7SE5tlTBbfO86ASwUAePZP9rmaogmLzNaFCSoqRlLp3UX8t
 U90b46tjAOHRf9zDcZlKXDNbvd7wg9nLPyxam+Ps5NEIO3+L4/MmZreLkOLjsTvkmtTyc2TCW
 1KkZhIYxz4LwcWv1wkK2FM4jahER3NTA7aHb/+s4CqtfNRoBOZY1HxgIOHT4esKSH+l+tj3AT
 sv7t3z6KO8OmjFfpPSdsNoO58gpBzEI7+HgxonLo0ZZBHqaJlc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200515_063251_926240_A020A6E3 
X-CRM114-Status: GOOD (  14.81  )
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
Cc: Edwin Peer <edwin.peer@broadcom.com>, DTML <devicetree@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Jonathan Corbet <corbet@lwn.net>, Networking <netdev@vger.kernel.org>,
 Sean Wang <sean.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Pedro Tsai <pedro.tsai@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, May 14, 2020 at 10:00 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> +static int mtk_mac_ring_pop_tail(struct mtk_mac_ring *ring,
> +                                struct mtk_mac_ring_desc_data *desc_data)

I took another look at this function because of your comment on the locking
the descriptor updates, which seemed suspicious as the device side does not
actually use the locks to access them

> +{
> +       struct mtk_mac_ring_desc *desc = &ring->descs[ring->tail];
> +       unsigned int status;
> +
> +       /* Let the device release the descriptor. */
> +       dma_rmb();
> +       status = desc->status;
> +       if (!(status & MTK_MAC_DESC_BIT_COWN))
> +               return -1;

The dma_rmb() seems odd here, as I don't see which prior read
is being protected by this.

> +       desc_data->len = status & MTK_MAC_DESC_MSK_LEN;
> +       desc_data->flags = status & ~MTK_MAC_DESC_MSK_LEN;
> +       desc_data->dma_addr = ring->dma_addrs[ring->tail];
> +       desc_data->skb = ring->skbs[ring->tail];
> +
> +       desc->data_ptr = 0;
> +       desc->status = MTK_MAC_DESC_BIT_COWN;
> +       if (status & MTK_MAC_DESC_BIT_EOR)
> +               desc->status |= MTK_MAC_DESC_BIT_EOR;
> +
> +       /* Flush writes to descriptor memory. */
> +       dma_wmb();

The comment and the barrier here seem odd as well. I would have expected
a barrier after the update to the data pointer, and only a single store
but no read of the status flag instead of the read-modify-write,
something like

      desc->data_ptr = 0;
      dma_wmb(); /* make pointer update visible before status update */
      desc->status = MTK_MAC_DESC_BIT_COWN | (status & MTK_MAC_DESC_BIT_EOR);

> +       ring->tail = (ring->tail + 1) % MTK_MAC_RING_NUM_DESCS;
> +       ring->count--;

I would get rid of the 'count' here, as it duplicates the information
that is already known from the difference between head and tail, and you
can't update it atomically without holding a lock around the access to
the ring. The way I'd do this is to have the head and tail pointers
in separate cache lines, and then use READ_ONCE/WRITE_ONCE
and smp barriers to access them, with each one updated on one
thread but read by the other.

     Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
