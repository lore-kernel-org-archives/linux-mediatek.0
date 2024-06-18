Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B80C2BA18
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jun 2024 15:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5oZ0AwGMLAJJHw2epqD7XqOCUyUz3rxpE12RQUU/9/E=; b=NM/YS0Cs96Nbt4wzGySgmP6kXI
	qwz3vkSWB6FZfY19W9B1SOqZyb/xmSawZJFCJ/0AlgovxNgmJminGgqR6c92V6rQdThRJrV8kkBJ0
	umLki7bogJJNWwsF0HZDImXudK7QAGsLxUhEGGYJDxOXXtIrS7sosrVysVvnD5CkM8KcuhQswmknm
	f4la6Ar2SlFAUyWTisIVmoTnFksUIrZX8LpO3EzFnfPHpFBDXPCnT9xuLdTts9bU/zv4kEc4yzL44
	UKK/J67LKylZ8eTPgSDvHlOltp1w9A14pqKxXiuc1bQg8J7XM+p+ca5HBADXvRuM9A5bBlIxXZd9p
	GWGKihOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJbEp-0000000FikJ-3nKo;
	Tue, 18 Jun 2024 15:59:15 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJbEn-0000000Fiip-0PNZ;
	Tue, 18 Jun 2024 15:59:14 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a6f0dc80ab9so868353166b.2;
        Tue, 18 Jun 2024 08:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718726351; x=1719331151; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5oZ0AwGMLAJJHw2epqD7XqOCUyUz3rxpE12RQUU/9/E=;
        b=Bn6eT3gS6/6dxoAi9TCqYWVVWWB1gHn1Avl2+MOF/QL6vFl4Qmf1iOqzag3BrgPn8W
         I2l4H4+TQD1DHyZiYYalfn/BLWHW3g8jfVu4KpyYbAfRVRgFzRBn0tbDlG7s1MHLss3I
         1LNA3Qunl+ZUdQwP0mCGvwjwr/m+hG99arUrQO+/w27T+b2/T+ZdIrW4ve5QzQd8VmWQ
         sXihhF6K+tyXYIlj3ubOSpFwLb71C+v1qO4COhWqSAeJZMnZD5/tuvXZ0enV//R/Cgjs
         ydHaY3MZ88t5o8pF81VAAOGflBrqu7uvyOgC9K3RcFJpH8TQaJZ036D4qNnpayWQDfkL
         TDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718726351; x=1719331151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5oZ0AwGMLAJJHw2epqD7XqOCUyUz3rxpE12RQUU/9/E=;
        b=bqsl0xLa4LA1umGCHUQpuTnahphCcH+hFhYDc8DYX0hLnLuW3hftuKaWVko0DP4oaA
         Tr5G+lmFleH9XIwusas3c2TluOvgivSonU4PKV4vU4xwwGr35QLSqRupOLkjnAJ7oEYq
         ZZBFCeNYMra2h3++vzAhEKAAmBoCiIRlCJAWrkBdmRR5iTVINj8JzBGRfWMsJD5ET0QA
         LbcoUbc5RyQwNf8AS/u1TaQ0W2xrWjUsnyJoUqTUyYQ+ytab9GRx74+EIr5CV7gLqYE5
         EeGOLhZH5w6G1F20wq3U7VflM6W/fZJ6kqrAhg54ry3nyOOknUmHO3tsbb0GdieBfkEz
         qpsQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7g0Ad5Wtof7jfIZI5IoYVUoitFq7YvL2RqZs9qUBAtbRubLCezqBbmaZEwqy5XqobbsOpEtUmmbkTEPccAEdd9txqpTcxlBwkt21fPTq083WW/NU=
X-Gm-Message-State: AOJu0Yy6mMXJVTgA0wr0CxKyiQO9ad6K6567zVD+KqqL6U3ma+9aC90a
	R8ugdT2i4LLxhmcm4UYi+ftApRAo+WVOh/TCHNjkydf4K1GN/csNVOmWAmK0pFJ6Yi7596/Vn+o
	4iGuSp5YaCKzcDR41PJH99zKCb44=
X-Google-Smtp-Source: AGHT+IElkkUK4RJSU4a9gzsjtuQ74Vg1wXqUlx1l+0cTTgPHxK8Efp3nkLznkDcUlOZBRHI0bNvpIXCY4+r/yIj+rLw=
X-Received: by 2002:a17:907:d312:b0:a6f:668b:3434 with SMTP id
 a640c23a62f3a-a6f668b35f7mr1009094466b.31.1718726350815; Tue, 18 Jun 2024
 08:59:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240614040133.24967-1-jason-jh.lin@mediatek.com>
 <20240614040133.24967-3-jason-jh.lin@mediatek.com> <CABb+yY2bwj2BcdJLGe1ZYwCrnXL3LtcePMb=wQPaBKorBSs2yA@mail.gmail.com>
 <fc92d51cc6e55301c081ea2d589e1ba6cdd295ee.camel@mediatek.com>
In-Reply-To: <fc92d51cc6e55301c081ea2d589e1ba6cdd295ee.camel@mediatek.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Tue, 18 Jun 2024 10:59:44 -0500
Message-ID: <CABb+yY1L+YGjf6O9UgPYkS2gWAdo=7QoojSAUNWC_8o7XtZQSg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mailbox: mtk-cmdq: Move pm_runimte_get and put to
 mbox_chan_ops API
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
Cc: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	=?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_085913_159582_8339C7F2 
X-CRM114-Status: GOOD (  17.10  )
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

On Tue, Jun 18, 2024 at 3:42=E2=80=AFAM Jason-JH Lin (=E6=9E=97=E7=9D=BF=E7=
=A5=A5)
<Jason-JH.Lin@mediatek.com> wrote:
>
> On Mon, 2024-06-17 at 13:18 -0500, Jassi Brar wrote:
> >
......

> > As in, how often and long are the "channel idle" periods? And when
> > active, how many transfers/sec ?
> Is there any debug logs in mailbox can measure this?
>
> This mailbox channel is use to configure display hardware in every
> VSYNC, so the channel idle periods may be less than 16.66ms.
>
> It should call rx_callback() before VACTIVE, but sometimes it will be
> dropped by mbox_flush() if the new message is coming.
>
> > I see every TX is acked by one RX packet. How long is the typical gap
> > between a TX and its ack?
>
> Typical gap between a TX and its ack is less than 16.66ms.
>
So basically the usecase is driving some display at 60Hz. And I
believe the display is driven
continuously for at least some minutes ?
If so, RPM between xfers is not really in effect because the
autosuspend delay is 100ms while you
get() it every 16.66ms. So all that is happening is some variables
changed under a spinlock.
I think you should consider get/put RPM in cmdq_mbox_startup() and
cmdq_mbox_shutdown().

Thanks

