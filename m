Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80074C87FCA
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Aug 2025 13:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dHA46DuTY9pFuv3EKrWijSQmC2yks3Je0CkaUrfoHJU=; b=c7Z2Xm/Ik1TxuBPk9834F2Jo1n
	r9pvdknoE8WUD1EhUe46skcdhU/XnOGlAzMJTDvmfrneO8VC/4qLXtxu5hrzub+NeAVI6T2XLjzAH
	fYbd2NJOrj3J37Sa6t+j+JXhpZo9+7un6d/XmivUtm5uUMOPPfr43Kk8i1xhyxPwEwhfd6U2PnMEu
	GP0EnDfqdraZnTWJjJFu7JQFz1ujt63JKge4m9Om3ia2uy3C3S9js7AFiGFC4K86SPMhuXvo7iFf3
	1vVdSLeKc73R4N0wklkH09rMbPHq60kkx+3GZbmFOJFXeIgyzLWND7JtKNkyFO9/Lj0K28eiPyeS6
	3znks9Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk0dq-00000000h2e-1n6R;
	Thu, 07 Aug 2025 13:26:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk0aq-00000000gcw-1N4p
	for linux-mediatek@lists.infradead.org;
	Thu, 07 Aug 2025 13:23:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754573018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dHA46DuTY9pFuv3EKrWijSQmC2yks3Je0CkaUrfoHJU=;
	b=IKiCcbvWfpXKRHFMSX4zua9l+mOHQna50VO2bNx5yjF6zk1nlPl120t4ZLKQvS3oCRLgo1
	3KnL8o0Ro9zfTdKFbLulGIZ7AnGgMpYYBIdrpPgVTelaKM5k508M2CjVdzQj+pwOSOonWg
	+W4+RPK1MAncokoTD5yQynHFDtTX2G4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-Fr4kd03NMkWchkiREcxYzw-1; Thu, 07 Aug 2025 09:23:37 -0400
X-MC-Unique: Fr4kd03NMkWchkiREcxYzw-1
X-Mimecast-MFC-AGG-ID: Fr4kd03NMkWchkiREcxYzw_1754573016
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3b7812e887aso401170f8f.2
        for <linux-mediatek@lists.infradead.org>; Thu, 07 Aug 2025 06:23:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754573016; x=1755177816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dHA46DuTY9pFuv3EKrWijSQmC2yks3Je0CkaUrfoHJU=;
        b=C2YMrVrLSFKYcmcc/KgahmMjo4KszeKlV21UM/c67NaMpYn2OeINjmN5Q5D1/Vun9V
         0cZ+AhR5DcNpqWwwpYMBMF63t9DiNgJjHMZpcOjlA1Z2HXlqLxXG3MffKHPiubJgBiBB
         SxQf8gvbsgnZSoEpgkqXvqIK9TzivVEa9iP7SzSRjvIJno5XpCHnl/QXN13KwPRjAAh/
         JKarhXcEgfeGzqJTuyLWoi65dLS4nAJLylAApH92n2ulUHDPG0Rc3FNplr8MgqyClUqS
         ksJ0/Cnk+zY183ofLns2LYS8JPOn90OdKSRLT9FJRBMCY1YQ/fjBi7Y4LoKxE72V4H2H
         90Jw==
X-Forwarded-Encrypted: i=1; AJvYcCW/YX6DtfB1ISoX06n+82l3bWVae6PdBCnSLhsiCBK4WJxzGVYuMWKCnKP8mkpGjKbZPRK/d8uDp2HGAkxYlQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwuO7hAw4kWkbEYSIMyCu6RjfrqZPyrdJjHQ47svjxv0WsGH2uw
	ydaZJ9Qrwn83Y3SqNn1nMPwStV2vwQ3VvKy80EvVjmUaAA3JLAwnJqkh9yGxjSXDVZ2uFWs57wE
	Zaum8B8F6s5O9YMTs4et8l842Hdp7VBhRARnmGCPR7Y411E1egDSZagKP6x8XbFmqvGLAcH/0oQ
	==
X-Gm-Gg: ASbGncuOjyI+PrBuOXLyFIxCWQDA4P/VAeFg2ctWySREEKh2DgRJhbB3+7xG2RB49i+
	k2DJIJUblMU/ygsTBFACdErEuqmpQZgJSPVZG/QmRH0ELFCgh/AaRLfepRI7gzc9o1KzvFoGexw
	ZlJGK0tzYXw2IWMUQ4t4pY8XNf0aYD3IyzN/+baA4kU+vA2ptsSPtlNy6vdT5unzXw9RCbowsGQ
	Ti3EiIILNnezBco5TjQJtXHS3+5gv+BeTXXYiicPOiO8vAVBfNxmbWMrL0RVb0XGI9XJ3YMvEjl
	kAoGppErVvoW5pk+5bmCdL06ut8DlBDoY0iqH4gmentSseyPcYo5epcmKj1KfziZcJYZdTiznMu
	M2D8AfnrU0AHvb8utBj970tg=
X-Received: by 2002:a05:6000:18a9:b0:3b4:9721:2b32 with SMTP id ffacd0b85a97d-3b8f48d4f26mr5474496f8f.10.1754573016394;
        Thu, 07 Aug 2025 06:23:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGK7RPK/BHk+aiKWpB1FOVkMIFKk4URmY7R5cJde+3vREbiJsn51qHzJTF0lGZx3w/Ix4ugKQ==
X-Received: by 2002:a05:6000:18a9:b0:3b4:9721:2b32 with SMTP id ffacd0b85a97d-3b8f48d4f26mr5474465f8f.10.1754573015962;
        Thu, 07 Aug 2025 06:23:35 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb (host-2-102-14-151.as13285.net. [2.102.14.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3c33fesm27226884f8f.29.2025.08.07.06.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 06:23:35 -0700 (PDT)
Date: Thu, 7 Aug 2025 14:23:33 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Kuyo Chang <kuyo.chang@mediatek.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] sched/deadline: Add DL server activated message
Message-ID: <aJSo1bvZ54Kl_vKb@jlelli-thinkpadt14gen4.remote.csb>
References: <20250805155347.1693676-1-kuyo.chang@mediatek.com>
 <aJRSmWCJI-GlApsR@jlelli-thinkpadt14gen4.remote.csb>
 <9f91f77e5f39857aa84373fe1ae504de2a881533.camel@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <9f91f77e5f39857aa84373fe1ae504de2a881533.camel@mediatek.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mdCGU8b-XaOHNtl6MXnakyKBa9BmTgSfcY37R8I3WCs_1754573016
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_062340_447878_7BF35AF6 
X-CRM114-Status: GOOD (  28.50  )
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

On 07/08/25 15:52, Kuyo Chang wrote:
> On Thu, 2025-08-07 at 08:15 +0100, Juri Lelli wrote:
> > 
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> > 
> > 
> > Hi,
> > 
> > On 05/08/25 23:53, Kuyo Chang wrote:
> > > From: kuyo chang <kuyo.chang@mediatek.com>
> > > 
> > > The DL server is introduced as a replacement for realtime
> > > throttling.
> > > When RT throttling is activated, a message
> > > "sched: RT throttling activated" is shown. However, it is currently
> > > difficult for users to know when the DL server is activated.
> > > 
> > > This patch adds a similar message to indicate when the DL server
> > > is activated, which helps users debug RT/CFS contention issues.
> > > 
> > > Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
> > > ---
> > >  kernel/sched/deadline.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> > > index e2d51f4306b3..8e0de6cdb980 100644
> > > --- a/kernel/sched/deadline.c
> > > +++ b/kernel/sched/deadline.c
> > > @@ -2042,6 +2042,9 @@ enqueue_dl_entity(struct sched_dl_entity
> > > *dl_se, int flags)
> > >       }
> > > 
> > >       __enqueue_dl_entity(dl_se);
> > > +
> > > +     if (dl_server(dl_se))
> > > +             printk_deferred_once("sched: dl_server activated\n");
> > >  }
> > 
> > Not sure if we want/need this, but, if we do, I believe
> > fair_server_pick_task() might be a better place to put it, as it's
> > really when the dl-server is called to do its job.
> > 
> 
> Thanks for your suggestion, maybe the minor patch as below
> 
> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index e2d51f4306b3..82d1091e56f5 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -2395,6 +2395,7 @@ static struct task_struct *__pick_task_dl(struct
> rq *rq)
>  			goto again;
>  		}
>  		rq->dl_server = dl_se;
> +		printk_deferred_once("sched: dl_server activated\n");

Guess it could work. If we are going to add this, maybe printing
information about the task dl-server is servicing might also be
interesting.


