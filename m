Return-Path: <SRS0=GpGz=2U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18A86C2D0C0
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 03:28:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9CD2208C4
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 03:28:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R90I8wqV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljUmIFIw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9CD2208C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eLZETBWTdhlB1jCnVsxlWl2VKyMTYFMdp/fsgs+3kM0=; b=R90I8wqV2PI6R7
	NS6uLp76F7hNb9BaivN0/Sbz5+oyE46+Q2QFzfjJyrgGSx0ClB0suMvYI1e4LoMc9ppGYEC03Qjq5
	LuYjpvItUSEEYtv9TwjvDIrqLcMBaJ6E9uCf5Q54QpBWtI8RBfh3ydSzykLX8pDT8Bx4S7L3OCXYa
	BkofKihkcuKFkoxgNpkJ2HHhWbSy8tmNhV+qHG7Z0Oul7zbbE+4yZC+owCHG4Uao8M2IumSfuaEWI
	MmuwCbTh8jN5OrV2LOGZgwll76dK2rckzVBttjv/h6cvMa8JPLiKPUPaZou4rqrcM6549YV8ao6qo
	hsuJ2E0iZg2q/urbZ3qQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1illjG-0006dq-7R; Mon, 30 Dec 2019 03:28:26 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1illj8-0006X9-4N; Mon, 30 Dec 2019 03:28:19 +0000
Received: by mail-il1-x141.google.com with SMTP id c4so26897670ilo.7;
 Sun, 29 Dec 2019 19:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/gSpV16gqUugWiREKjeRqrw8NqwpDXSNtuIvz7v7i9E=;
 b=ljUmIFIw0TpKNbfOsZzPy0594sjYu/WDS2ogd7eV+SZZ16rOMs8kMTDMp6r6z/HcDC
 gqeF9js1oULvAa9uPuKoajyItsjEtWIyVR5bWaYyUdJ6TJCtRwzq4+RZVsJAoLwTgmCe
 ULropm0NWnpv5zpmOeO+HeH1QR+jfN9rvbHK1upIzD+IeCFoYPpaQIq080RnM95H2VwG
 TqqF12ZBn8tHuciOJ2AXNUyop1HJqJacA0AgEg+pthBgH0U4qE8OnMLggownEhd75RHg
 8ltU/kKIbQzSd85SF6xHDqt6XgBdTXu0malc/i+gHCoLM+Bkv2aHzp4g+/NbaLl2cqwE
 2fyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/gSpV16gqUugWiREKjeRqrw8NqwpDXSNtuIvz7v7i9E=;
 b=kH6nUXE3oJHIYAR8JXryPXckkx5amGaceL2ZEOuqCmwkVSz8KrTfNvzKh7EvG15/nT
 w+/TLogvCQ0wsPTTn8tSrL2gfEaidMHvXSCtNvMBCMdVRUIeDZZ6OSVSIM1KEaMWPYO4
 wQ8Zj95ifhApbK2er2bbQvH71YzDO3XPeqjUraKnXYFFjLTBsmpw4dFCdUyB0blFMGoc
 sQxT0Gev8nAWbVnVvrLkC8i/P1H9rNapy5SmPJwS0Jr1MjsnwETKZKTlbQMLTQXFAbZC
 AaChZWb5dmjO8xGg2fqShJi5jMZ/vymGguNsbn0htHLdkPXkoULZlt/OQ9H6+C7fiTEp
 6ZnA==
X-Gm-Message-State: APjAAAUCa3Hy7XTwjBxH3ihtdr+xbzO5QydmvsGpYOXZjKncm7wJU6BQ
 BcXTPYHWYOb+saFgRdEKclc1ZtJfboRJrb3aTpE=
X-Google-Smtp-Source: APXvYqyQZm4ZquKEMpBoMyD+GpdMoP23S7ymcucZjFHMEh+UdO/8w5BBcW4WhKQqF8cH3yxedUvYcOX8n0XBNCAgQNA=
X-Received: by 2002:a92:84d1:: with SMTP id y78mr55495168ilk.69.1577676496461; 
 Sun, 29 Dec 2019 19:28:16 -0800 (PST)
MIME-Version: 1.0
References: <20191121072910.31665-1-bibby.hsieh@mediatek.com>
 <1575426135.31411.2.camel@mtksdaap41>
In-Reply-To: <1575426135.31411.2.camel@mtksdaap41>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 29 Dec 2019 21:28:05 -0600
Message-ID: <CABb+yY2w_h-weh15hFkGuC-b7XLYrvkT7QVkkj1u6uS99qOnrg@mail.gmail.com>
Subject: Re: [PATCH] soc: mediatek: cmdq: avoid racing condition with mutex
To: CK Hu <ck.hu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191229_192818_176525_68558007 
X-CRM114-Status: GOOD (  18.30  )
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
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Houlong Wei <houlong.wei@mediatek.com>,
 Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Dec 3, 2019 at 8:22 PM CK Hu <ck.hu@mediatek.com> wrote:
>
> Hi, Jassi:
>
> Are mbox_send_message() and mbox_client_txdone() thread-safe? If these
> two are thread-safe, this bug should be fixed in mailbox core not
> client.
>
mbox_client_txdone should be called only when the client _knows_ the
message has been sent.
There is difference between knowing when tx is done, and assuming
tx-done because there is no way of knowing it.
Your issue arises because you immediately call mbox_client_txdone
after mbox_send_message, which may be the only way to do it but that
doesn't mean you shouldn't have to take any other precautions (like a
mutex). So I think your patch is reasonable.

Cheers!


> Regards,
> CK
>
> On Thu, 2019-11-21 at 15:29 +0800, Bibby Hsieh wrote:
> > If cmdq client is multi thread user, racing will occur without mutex
> > protection. It will make the C message queued in mailbox's queue
> > always need D message's triggering.
> >
> > Thread A              Thread B                  Thread C              Thread D...
> > -----------------------------------------------------------------------------------
> > mbox_send_message()
> >       send_data()
> >                       mbox_send_message()
> >                               *exit
> >                                               mbox_send_message()
> >                                                       *exit
> > mbox_client_txdone()
> >       tx_tick()
> >                       mbox_client_txdone()
> >                               tx_tick()
> >                                               mbox_client_txdone()
> >                                                       tx_tick()
> > msg_submit()
> >       send_data()
> >                       msg_submit()
> >                               *exit
> >                                               msg_submit()
> >                                                       *exit
> > -----------------------------------------------------------------------------------
> >
> > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> > ---
> >  drivers/soc/mediatek/mtk-cmdq-helper.c | 3 +++
> >  include/linux/soc/mediatek/mtk-cmdq.h  | 1 +
> >  2 files changed, 4 insertions(+)
> >
> > diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > index 9add0fd5fa6c..9e35e0beffaa 100644
> > --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> > +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > @@ -81,6 +81,7 @@ struct cmdq_client *cmdq_mbox_create(struct device *dev, int index, u32 timeout)
> >       client->client.dev = dev;
> >       client->client.tx_block = false;
> >       client->chan = mbox_request_channel(&client->client, index);
> > +     mutex_init(&client->mutex);
> >
> >       if (IS_ERR(client->chan)) {
> >               long err;
> > @@ -352,9 +353,11 @@ int cmdq_pkt_flush_async(struct cmdq_pkt *pkt, cmdq_async_flush_cb cb,
> >               spin_unlock_irqrestore(&client->lock, flags);
> >       }
> >
> > +     mutex_lock(&client->mutex);
> >       mbox_send_message(client->chan, pkt);
> >       /* We can send next packet immediately, so just call txdone. */
> >       mbox_client_txdone(client->chan, 0);
> > +     mutex_unlock(&client->mutex);
> >
> >       return 0;
> >  }
> > diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> > index a74c1d5acdf3..0f9071cd1bc7 100644
> > --- a/include/linux/soc/mediatek/mtk-cmdq.h
> > +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> > @@ -28,6 +28,7 @@ struct cmdq_client {
> >       struct mbox_chan *chan;
> >       struct timer_list timer;
> >       u32 timeout_ms; /* in unit of microsecond */
> > +     struct mutex mutex;
> >  };
> >
> >  /**
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
