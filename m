Return-Path: <SRS0=ZZ2m=JU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2AECC43460
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 04:21:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5ED4B6100B
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 04:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5ED4B6100B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pvKOfLk7G6EG5BfRSmWe6BT2XjwLUg2JqvCgzsw2j5Y=; b=c/EyIUvF+OfXm73d+TPVjGxdU
	VGg1HRK57/cSSizm/lUPCmDDu7oqV3PTeRT2r7tQvhD30GyDt6AyCvN+K/r1QmvcKZyAHt3APPacW
	1NoTbJ90Bas7Jm89+GtJfAUuQG100QEOVys6SXMWO+4xovFcxiSTbxBZbTvH5qomaQoo4pHH1vY05
	HiWu7XXVqsieLBYlaBGqI0hU6qC6q6O0V+20HJG8PIntKSTgLcZnFJMKamawHWKDGEoI2626lX2R+
	r45VEkg15KRweWLdh8qapiyyBBzc2n9QrH2RA/Maq9fSDaf67r38jvq/+DXUkli3qnZcSJe4Mo+VM
	wrjYTrKUw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZnJV-000ZlS-CE; Fri, 23 Apr 2021 04:21:09 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZnIx-000Zhg-Lo; Fri, 23 Apr 2021 04:20:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=bfLVBnTZtbCXme7JICbwC7/NBVO0O2WQqtAPYxM3Q/I=; b=4LqAV6FOzrhChYYeNH8873yh/P
 ZY/v7JVMpzvEtRkjhvAh0+a5Ba50eOL5u/4I1cQwWKJzbjTQ8YgJvTryuVjrFG3146CGAhhmH+Lqi
 EDm1Zah3ydkSFeSRX09lNkWN8fLZam9cGscXQA6PoC8FH19Gz3sqNNpC3043w6EByolxpsH6oBYDo
 jPbZvv1I861wzhQRBYPK/UH5DnTNRu+jwTcRkloUISG+AH9cedcqp9VBBTlnAt8DcSFc2XpFmG7PA
 toJRSm56dqI/r17ZgzOafQyi1yvV1xaE53ebhnRylOXf0hGDN79pTxI/bSew459PeT69al6jjnWae
 +vNXVmlg==;
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZnIv-00E8eA-3n; Fri, 23 Apr 2021 04:20:34 +0000
Received: by mail-il1-x12a.google.com with SMTP id l9so3937088ilh.10;
 Thu, 22 Apr 2021 21:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bfLVBnTZtbCXme7JICbwC7/NBVO0O2WQqtAPYxM3Q/I=;
 b=FgmcuGZ0syuiKLzYWl2tuYsRKGXhNCUX+7CwwZNf0P0+0SeVPUnX1ETJYReka0munu
 HGb15hd/AoairCHbvNG3ESn6iZzopAD5/5Au6grcEdN8TQqKlxg/GLaNzagsNd+PmnnE
 jzt/ljnomKZ02LXGrJvaJoZ1mltntuqhRX38vzvBC30cef9rFbWElUDEeNBZ1Xgz5OIc
 /SD7afADmlslfruHyI37qaaQ18225zzso5yNvoLBm06YX79qq+6KidIHRX59lhu4IFma
 uSBqATRoqZ3U+65kJspcIrZxiPBfEox7te0MzAhikMv0IfKXUTozvD/82ApZUEe4Byso
 o7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bfLVBnTZtbCXme7JICbwC7/NBVO0O2WQqtAPYxM3Q/I=;
 b=FXKg/zGYQOTSOtE8YcSXVnDgn4kctiEx6eMALYQgQS/3i+zCiFgL5mP1fJTJnJlHw8
 1Y4aYEHo2/PrKA74wiqEd8qa73Tz43B/xAh7RlBC73/Wr47PSsdZGEiD2ZpdzrYspVNS
 l2xID1PPDdAwxyMv37GrNPFXw2M5xY7Gnfg5hEDcQqg2CNderzutOO88+oUXJ7jGh6zH
 niMhUHpl4JrIcApLRUuvyWlTsp1hAPZB8sir0wTtnL3EcW/TrV59lJ3HyyN4HLIyt+q7
 TAZHsTweVBab/eUL3ApTsXFM/DwF7lHwC48WNQ80qnthpE/BJAQXPzp4TGrbyXtvQtQ1
 H43A==
X-Gm-Message-State: AOAM533B+flh1yqy1yEugxtAh8Z5XqoKC6I+7PENvSqR/rQZHun0rQCT
 VU3BsxQ5dZykegs/DA720Wkz81CdwhjczMB/NmM=
X-Google-Smtp-Source: ABdhPJwgV4flQel9CUZ9T70WOiNqK8DPdVt/s0KlhhI3DsBu+w2Fia8e2pMJJA4xV/XzlTD1p/X6G3/CLSvRhF19uzw=
X-Received: by 2002:a05:6e02:cad:: with SMTP id
 13mr1352525ilg.77.1619151632322; 
 Thu, 22 Apr 2021 21:20:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210422040914.47788-1-ilya.lipnitskiy@gmail.com>
 <20210422040914.47788-13-ilya.lipnitskiy@gmail.com>
 <20210422092608.6b8ed5ff@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210422092608.6b8ed5ff@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Date: Thu, 22 Apr 2021 21:20:21 -0700
Message-ID: <CALCv0x0vVzdtr=yezvHsq9TSx-nd76NiT2zYqQOuOa2W86VEqQ@mail.gmail.com>
Subject: Re: [PATCH net-next 12/14] net: ethernet: mtk_eth_soc: reduce
 unnecessary interrupts
To: Jakub Kicinski <kuba@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, 
 Mark Lee <Mark-MC.Lee@mediatek.com>, "David S. Miller" <davem@davemloft.net>, 
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_212033_179452_ED3E1BBD 
X-CRM114-Status: GOOD (  11.34  )
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

On Thu, Apr 22, 2021 at 9:26 AM Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Wed, 21 Apr 2021 21:09:12 -0700 Ilya Lipnitskiy wrote:
> > @@ -1551,8 +1551,9 @@ static int mtk_napi_rx(struct napi_struct *napi, int budget)
> >               remain_budget -= rx_done;
> >               goto poll_again;
> >       }
> > -     napi_complete(napi);
> > -     mtk_rx_irq_enable(eth, MTK_RX_DONE_INT);
> > +
> > +     if (napi_complete(napi))
> > +             mtk_rx_irq_enable(eth, MTK_RX_DONE_INT);
>
> Why not napi_complete_done(napi, rx_done + budget - remain_budget)?
> (Modulo possible elimination of rx_done in this function.)
No reason, I think. Thanks for pointing it out. I will clean up both
TX and RX NAPI callbacks to use napi_complete_done and to get rid of
that ugly goto...

Ilya

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
