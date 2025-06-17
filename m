Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B43C71157
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Jun 2025 13:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jo+IXIxSNIYAuiTCVjY+MjOblSENU+5Bkagj0uUgN34=; b=V+m0WmQqDTKuEh2zQIvjs9r/de
	A1xiEUbmBv30S2lusrDJKe9WburPD83FST+TA1plJvfQ3ZQoUmbRbFdZhJYx7/0xCy74PZcBUR8Ah
	VgKQezBcwHnU7pgjZ9atBPnVWnywV0xYcxX2iG4umfQNWNng0QhahCzHH5kIGYDm3Ez5s0+3GklyT
	nCSoubM5LSkiN1WsCT9Du69MuX0nK06egJYi23fk4ImyEFQFSQzuEtdTta8OoBVAyLxraZeDD22po
	Ae1R0N/eeCFDcpyzenNrpjOE2ejdMpMnt9apSL97r6YZKKquXCY+8GGY/UgkcCSdZQQb+mltuCwex
	bonMkaag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWBs-00000007JjZ-0vPs;
	Tue, 17 Jun 2025 13:17:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRVVC-00000007Cbx-0gss
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Jun 2025 12:33:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750163601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jo+IXIxSNIYAuiTCVjY+MjOblSENU+5Bkagj0uUgN34=;
	b=CapEiCO/ELiSKdE/ZT8m97KIMN9HMhemALxizF/VZsdPbdpf/3Q3fSV/4YVZzDccyLg359
	Q1qrCAn7pP+qUmCc3dZAapJbGNgUg61D53YxX5jpFvkjCky8CQ+ApB4xZkpQefM01t4v+s
	tScF7da/DbZMSvzwiHoIy+BBGTHo27E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-544-Di4VwiyyPICrCZAEPprCcg-1; Tue, 17 Jun 2025 08:33:19 -0400
X-MC-Unique: Di4VwiyyPICrCZAEPprCcg-1
X-Mimecast-MFC-AGG-ID: Di4VwiyyPICrCZAEPprCcg_1750163598
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450cb8f8b1bso11721685e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Jun 2025 05:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750163598; x=1750768398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jo+IXIxSNIYAuiTCVjY+MjOblSENU+5Bkagj0uUgN34=;
        b=c8m1Nt1HvrV6lVU/C3JVscmYT+b48zZSTh0HeqLkkF4GqvBo+zpKRcU2O0GVhKrzwj
         h0kq1hIKukG4J1kj1cACwhHzaA0f74m55p4zUm1KUceK9WXXjeS7XOsBX16aa+ZLXUwW
         gELBbM8viIGomnem7mfpViPxruCzN9hZSMd+eOd5/sfQOMTF+wG4mcJKlDQ28fsrekOC
         XVtWGv89314fnS6uxggjYD8FWwqI4Td9UmGQbyxda4zQSSMxpO0PwxBhDppkj3jHvkXP
         0s/9tWarBiRMP/6oNU0h2JAJWUbRM5Dut75XFB8RhqP1kp/0sIJgp3la0YKIsmgohdLn
         44xA==
X-Forwarded-Encrypted: i=1; AJvYcCWq6G/qjguBcBAON3pQMx2Scz2W86u8vPSOL28qDVyxKkdgEIUdzL4SrOxvSKdKifZqMNhlDUNNxAg0vorx5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyDCFZNqboRRd6jyU3hAlCHmni5rV8WdVu++6Rt6HoHL2JNTq/G
	umwV+jgcCTmkqn++rDXg4PiDiBmrw4TG9zpatj5sfeSkl+QBckLAmgBP5MueswVk2DwHUe5H7hQ
	LNT/Ax6NDjDs0LjUOSG0rtpw6jUkKYQjgWOopdxdN1SJ1xenZh8Tc0N8Q+DPg+UNmewgfyRDlSg
	==
X-Gm-Gg: ASbGncvrNAMXHfFM6ntntgXGM72wSEAhUKzoJXQ0+dDplk9ONpZZuoY22JBb9KoIUt1
	uORjmMeLITdvHkM0R2uomg2hmuO0ZdxrJSkOgw8DBhgiKcqsTxUfdV1bC3pLaWfmJMJSBC4W35s
	V7ZJQriry/9E9gqP8kv2UInQ1HkLeIAj9DaYoPI/B+PoF/bWTT3CDLt6+EyjBxfhnpnNXpz4qTM
	3DL5zIjDXhBK/V3zvKFTXnilaE4ZaxcjFDjr4sVYAj9Y5/hW2gnwHDZpM7LWqFmI6NXveRi9Fqb
	8wUUc4Dr0hcL4qaTINZFkK6mRcUcTTWzjzXm38EgzUY1Quoufg7/aw==
X-Received: by 2002:a05:600c:3587:b0:43c:f70a:2af0 with SMTP id 5b1f17b1804b1-4533cb48951mr120533815e9.16.1750163598479;
        Tue, 17 Jun 2025 05:33:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEk1xWsef/FxGyotWPmKQtLjGTobu8UAwOJhzqxxuFF2cZ9pfD3uHBQHPFjkme52CF+GzKbfg==
X-Received: by 2002:a05:600c:3587:b0:43c:f70a:2af0 with SMTP id 5b1f17b1804b1-4533cb48951mr120533385e9.16.1750163598021;
        Tue, 17 Jun 2025 05:33:18 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.151.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea1cc5sm179772325e9.16.2025.06.17.05.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:33:17 -0700 (PDT)
Date: Tue, 17 Jun 2025 14:33:15 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kuyo Chang <kuyo.chang@mediatek.com>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	jstultz <jstultz@google.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/1] sched/deadline: Fix fair_server runtime calculation
 formula
Message-ID: <aFFgi_9yxLN-auBE@jlelli-thinkpadt14gen4.remote.csb>
References: <20250614020524.631521-1-kuyo.chang@mediatek.com>
 <20250617085558.GN1613376@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
In-Reply-To: <20250617085558.GN1613376@noisy.programming.kicks-ass.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mpopA4qFLCvq-0_U81KX9Ge4dj3Odc1tMHs972AlKsA_1750163598
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_053322_281037_3EF696FB 
X-CRM114-Status: GOOD (  21.34  )
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

On 17/06/25 10:55, Peter Zijlstra wrote:
> On Sat, Jun 14, 2025 at 10:04:55AM +0800, Kuyo Chang wrote:
> > From: kuyo chang <kuyo.chang@mediatek.com>
> > 
> > [Symptom]
> > The calculation formula for fair_server runtime is based on
> > Frequency/CPU scale-invariance.
> > This will cause excessive RT latency (expect absolute time).
> > 
> > [Analysis]
> > Consider the following case under a Big.LITTLE architecture:
> > 
> > Assume the runtime is : 50,000,000 ns, and FIE/CIE as below
> > FIE: 100
> > CIE:50
> > First by FIE, the runtime is scaled to 50,000,000 * 100 >> 10 = 4,882,812
> > Then by CIE, it is further scaled to 4,882,812 * 50 >> 10 = 238,418.
> 
> What's this FIE/CIE stuff? Is that some ARM lingo?
> 
> 
> > diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> > index ad45a8fea245..8bfa846cf0dc 100644
> > --- a/kernel/sched/deadline.c
> > +++ b/kernel/sched/deadline.c
> > @@ -1504,7 +1504,10 @@ static void update_curr_dl_se(struct rq *rq, struct sched_dl_entity *dl_se, s64
> >  	if (dl_entity_is_special(dl_se))
> >  		return;
> >  
> > -	scaled_delta_exec = dl_scaled_delta_exec(rq, dl_se, delta_exec);
> > +	if (dl_se == &rq->fair_server)
> > +		scaled_delta_exec = delta_exec;
> > +	else
> > +		scaled_delta_exec = dl_scaled_delta_exec(rq, dl_se, delta_exec);
> 
> Juri, the point it a bit moot atm, but is this something specific to the
> fair_server in particular, or all servers?

I believe for other servers (i.e., rt-server work from Yuri and Luca) it
might be useful to have it configurable somehow. I actually had a recent
discussion about this concerning single task entities (traditional
deadline servers) for which as well there might be cases where one might
want not to scale considering frequency and capacity.

> Because if this is something all servers require then the above is
> ofcourse wrong.

To me it looks like we want this (no scaling) for fair_server (and
possibly scx_server?) as for them we are only looking into a 'fixed
time' type of isolation. Full fledged servers (hierarchical scheduling)
maybe have it configurable, or enabled by default as a start (as we have
it today).

Best,
Juri


