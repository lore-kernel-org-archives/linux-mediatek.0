Return-Path: <SRS0=ZZ2m=JU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F29C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 04:17:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0ABC06100B
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 04:17:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0ABC06100B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7XQXCdDm3NThgLMvBle0ogGoAtMDOuqBv8M6cPvJfd8=; b=H5qUGI/lQXD4Vq649NJxfMYow
	7zZvWiSQ96ikPTNc5uO/xJY9I1BQHpqCSH7U+nfLBGTrEZzGnc6BVhkqnV+JqWFMaaWylzoyuTL0w
	mkRnDjHY/IudrXK868klTZ0s8nMpR2DTkyKGiAMC7WOzdu9G1GOEnhy2q+gSQjDCH7no56Z0d163D
	+iQ41TtErDlZBXQfsmkeb5+AVJwsHwtgI/XtS9DRQ6eISfPh0VxmnM9CoVn81cr3cZX4RVvF58S3Z
	7TPo0D8eSc0yBZ5l0rAKdXezw4Uo8XQPCn7VkK/rpfI1pIBrw4I5/S8c/ALteyVeQHRXaQyV59lke
	9jwjeHnPQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZnFQ-000ZD8-CL; Fri, 23 Apr 2021 04:16:56 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZnF4-000ZCK-TW; Fri, 23 Apr 2021 04:16:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=hPK7cG0zjnt5TeP27jRXX6nUc9rgjxQfRBDSkb6etdM=; b=mj3ISaeFRV3mw7eiVzu8jO9QTT
 rd0esGiiO9oy/Xz+vvtpJh8H0x1v//d0Ki9TAHjU0AcoaowA3JoM0MrjxoOUE2IHsbpWMYB5xRw11
 6mknlkNrfoqLgjac7mVrr0FV+bLW3Y00V6l/HfQeFTB5oZqlu0T8cjOEGr07sCS9iVlQQpHZImxd2
 FpmHT70uZ64m8zOCby+qJ1LvA4dJM173FiWRWQq8RY+PpA4AVfzwXCd6PyJRxipUYwqG/zPlzd2Ek
 gv07NiUn/G10nd2JfwyQiJL/rp3atO4WcB+XmMSTmEIseFLZvYxnI+jsmmHdmnkQ9TASJDP0JM776
 8951AyTA==;
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZnF2-00E8YP-C1; Fri, 23 Apr 2021 04:16:33 +0000
Received: by mail-il1-x134.google.com with SMTP id j12so25787224ils.4;
 Thu, 22 Apr 2021 21:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hPK7cG0zjnt5TeP27jRXX6nUc9rgjxQfRBDSkb6etdM=;
 b=ABcxNFaWRXA4+Ao/XLy8ex+as4Wjge2NpRvhfycyIe7eGjGf4seefFjFm0WmD0a6Cz
 1KgTFlKnijJARlQmdE+klWSDWuEub8losRomhubAH8aBhUpfG/xpd3yjDuyvJzYvnktn
 UdsnoXiA0F/iZm9aKAvvhzm6hy2WFWHRUt62GHL5rwHr797FihDR0iQPfG2cehhAl5WE
 XiPLowo/rxLwwVxf7Yg/no8y4i8sX8nmGG4nXNfr0qtuqB3GanmxUYA6xdSBeaHDCgEj
 6ZHBb0g/cx3b68Uo7eSZ7qoCKHlgAD4RlrKb9KApXxhugluA+tVUxQgpxbKhGcDoJMzR
 1Tew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hPK7cG0zjnt5TeP27jRXX6nUc9rgjxQfRBDSkb6etdM=;
 b=b2UGy0y45vW6I2AMy5UsVvpCO4Mduw/G92J00A/SDG9mRnq956wvFBnmQTK849M0FE
 WBec/pXDDlFnLEogWgU8DtW1s2+o4Q4tv/gfKvflbKtTLN6mQXjMu9l+A89GqePDfGbK
 eu7hy+ra5m+kAym4Zg22bY3ENAJJbxTUSNR/oghY8zWOBRtSngjlRrsFjiE6tmHHmK/g
 JmYaXkQOIVRShpUFuWFiZi6UkWRgJ4Ys4o8XVfQncV442elyW/jT+bOaCf7fEfBbVM/F
 ZNKtIvMAlI3Gk7TtcEzJIeSs5yy9Bxpk+Q9ZLW4gkBqr0SAl69WWHDUMmY8enrUY0ct9
 yJdA==
X-Gm-Message-State: AOAM533OeR4JYsOpywTR6NuFydvaD1/6J4XUW+VHo3YPRNjmhyLXNmmR
 64hS4UR1LcCz8+MKKVSr4kudZXRV9I793nbYQZOg22VWluyIuw==
X-Google-Smtp-Source: ABdhPJwGHyGyExbKWugTt390DWihZsZ7YnfgC0bSUbNtiC0PmUmYeiHfmohSfuyl01ciyvNB11XHGySHTPoN2BBs3Rc=
X-Received: by 2002:a05:6e02:d41:: with SMTP id h1mr1395747ilj.0.1619151390373; 
 Thu, 22 Apr 2021 21:16:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210422040914.47788-1-ilya.lipnitskiy@gmail.com>
 <20210422040914.47788-6-ilya.lipnitskiy@gmail.com>
 <d96206db-96e2-1eb7-6b19-47c9596ccfea@nbd.name>
In-Reply-To: <d96206db-96e2-1eb7-6b19-47c9596ccfea@nbd.name>
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Date: Thu, 22 Apr 2021 21:16:19 -0700
Message-ID: <CALCv0x0dRPDsrkNYOgWW-+rFj_7ysNfj+x_2AmFRa0f3No2YZg@mail.gmail.com>
Subject: Re: [PATCH net-next 05/14] net: ethernet: mtk_eth_soc: reduce MDIO
 bus access latency
To: Felix Fietkau <nbd@nbd.name>
Cc: John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, 
 Mark Lee <Mark-MC.Lee@mediatek.com>, "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 netdev@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_211632_445023_2F9E0A95 
X-CRM114-Status: GOOD (  15.72  )
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

On Thu, Apr 22, 2021 at 5:33 AM Felix Fietkau <nbd@nbd.name> wrote:
>
>
> On 2021-04-22 06:09, Ilya Lipnitskiy wrote:
> > From: Felix Fietkau <nbd@nbd.name>
> >
> > usleep_range often ends up sleeping much longer than the 10-20us provided
> > as a range here. This causes significant latency in mdio bus acceses,
> > which easily adds multiple seconds to the boot time on MT7621 when polling
> > DSA slave ports.
> >
> > Use udelay via readx_poll_timeout_atomic, since the MDIO access does not
> > take much time
> >
> > Signed-off-by: Felix Fietkau <nbd@nbd.name>
> > [Ilya: use readx_poll_timeout_atomic instead of cond_resched]
> I still prefer the cond_resched() variant.
No problem, I will respin with your original change. Looks like we
can't take advantage of iopoll.h routine in this case, but that's not
the end of the world!

> On a fully loaded system, I'd
> prefer to let the MDIO access take longer instead of wasting cycles on
> udelay.
>
> - Felix

Ilya

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
