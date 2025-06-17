Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45E6C7115B
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Jun 2025 17:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8nZJ22rsS0RPWxh3ZE7aCZVwueQlyLoqt+SFU6IEEhY=; b=gPfYbqvOgPV/6pyCbeObvGpXhj
	NZGO3BHeotfbxTbYFn6Jg9XXO6r4NawXSCVpRp0hP3+tYlPsP7lF6kzCBgkwx29qy3JfvyjD8ZUrG
	uAIqXl8tyeGyT7vTyYgO+CzHD3TW6rGqPtOz/kw1yBxJk4hkuN67hHEPD8Cgqz8ZNddma8vUKaD8W
	dvEC09vBUhqhoRNsUvf94xcyxacOIndVt15O7YfScEt+nKIhWPAy/0NzndxtL+I8Ft9Yc20eDjiNi
	PvWurcv8PoHsQFJs4laHzXX4gBrAGVfM+su7Y+ABL4GXYAFBE9HhkqNQPCbCxCt0hNOPoElbbDR7V
	UHxROQCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRZpX-00000007xcI-0mqg;
	Tue, 17 Jun 2025 17:10:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXET-00000007XbK-1jlf
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Jun 2025 14:24:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750170252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8nZJ22rsS0RPWxh3ZE7aCZVwueQlyLoqt+SFU6IEEhY=;
	b=YFeDjSQTrqWCTahBS30hWV+IV7DHoV3tktIPAZK6D/rrVqcytVXp66Tc3bjOwCE1PcFNz+
	RM7s0ECJExLWvuR+IMvwIQoMytkFT+FC7oMWnPjyM4Z+GgORPhoASKBA4lutYjLVP97P5d
	/EAKX2khl6Z8YajtRZ/jErZe1k/9iRc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-l_ZBLz_gMfumfbwC5wMUCg-1; Tue, 17 Jun 2025 10:23:57 -0400
X-MC-Unique: l_ZBLz_gMfumfbwC5wMUCg-1
X-Mimecast-MFC-AGG-ID: l_ZBLz_gMfumfbwC5wMUCg_1750170236
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4530623eb8fso41556665e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Jun 2025 07:23:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750170236; x=1750775036;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8nZJ22rsS0RPWxh3ZE7aCZVwueQlyLoqt+SFU6IEEhY=;
        b=QubtXjozxdSn17suul9m5wo/hA2sHsd0NeD0tcOM0mZsne8QSxXiNV6JhoJoW1UwRT
         ld8/1NMv+qRJESLh0iWIsZoEMc6BQBlNGfsw5oJr9X/eY6RKobNfvg3Nso9S9rq2Na4I
         JhPTbHgJr7ky+ULEShwN7Tc5UdKutXm6ODCGRTS74aeaRF1h/Z4t9yvV+uAw3/kD7hF5
         AQ24peW5CnGWFiSMNC2NU1ZyAM64F6Wd4HS+NuBnlWoGqOF1mWm2DjlIDu4Di2yJ30N3
         eGxSpSQ1efDFnoQ5vJlTYG/l8lcXX5F6aVOZCP3V5SXwAgjProTPB3OYq66M8pr31Era
         8P/A==
X-Forwarded-Encrypted: i=1; AJvYcCXwZO8HGhlxf5IlJunQdHCKqqzcZ1Ws5fPmKfANyygfgSt84DO4bBbyrRw5OnFzAQAtwP6/Bp80kC517Bz2fg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6ghiTmku1dw3rXX5Y0lT8IIDHNBaiHnStHtZ1DzEwPhUR7c7z
	VcGm6aZSvLADmBycZJO/1zTa/pAty+HYUbhxmq5Rnj2b5wzmL2SwWUUhzSmTe/UO3TueYh2j6xG
	cRVhff1rUYa+BSwab0GwKa9ox3FG5j570l5NKvVwkZwlJ0qSWdcTVri+Rl+k28kybACQ4vO1X6A
	==
X-Gm-Gg: ASbGnctmMYojokQvQ7CA1W5gjgoe9ieflb9Ykc0INRUdfU5ueQSQi42QUxa9PYrkQtX
	eOtdvueDSIPMeqQbmSLZ9a+xT8nmcbkxfJggVBW/46jJfIs4ey7jvpUHi29doXWzFuHjRA1GMCg
	Ke/+pdaCOsGcOMozhbMwoR/yjCy58+PtiyVa5t7v2FGy8aJsSvlZcKy+kHGP+4yOPiJWSZ4UVDS
	gGLhwGU8B1uk2LFYeTEOkj1zrv3Nn2YBMJGiafe3OcveoaABH7jMp/tWYW5qU4H6lVSJTaQnp3N
	kJ1PqKcoiAefehOwjkSxLNbx3qn7YCN7c9Qg2i1Z30ljb9qDgYoSug==
X-Received: by 2002:a05:600c:5396:b0:43d:172:50b1 with SMTP id 5b1f17b1804b1-4533cac8fdbmr122013255e9.29.1750170236082;
        Tue, 17 Jun 2025 07:23:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFXdSBOaD0bkiX6RgDIIItmoJz66Z98LumAPn/RVxW5in7JWmC1em46bTnPvZqEArSrV/R5Q==
X-Received: by 2002:a05:600c:5396:b0:43d:172:50b1 with SMTP id 5b1f17b1804b1-4533cac8fdbmr122013005e9.29.1750170235702;
        Tue, 17 Jun 2025 07:23:55 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.151.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e25302dsm171997755e9.26.2025.06.17.07.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:23:55 -0700 (PDT)
Date: Tue, 17 Jun 2025 16:23:53 +0200
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
Message-ID: <aFF6eYzMahzQ9sxE@jlelli-thinkpadt14gen4.remote.csb>
References: <20250614020524.631521-1-kuyo.chang@mediatek.com>
 <20250617085558.GN1613376@noisy.programming.kicks-ass.net>
 <aFFgi_9yxLN-auBE@jlelli-thinkpadt14gen4.remote.csb>
 <20250617141437.GW1613376@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
In-Reply-To: <20250617141437.GW1613376@noisy.programming.kicks-ass.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gYkSDx9Nu_ooAT_Cgb2Y7sU0j8-2b6rjGOghYVspxTw_1750170236
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_072413_525031_2B53CD5E 
X-CRM114-Status: GOOD (  13.17  )
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

On 17/06/25 16:14, Peter Zijlstra wrote:
> On Tue, Jun 17, 2025 at 02:33:15PM +0200, Juri Lelli wrote:

...

> > To me it looks like we want this (no scaling) for fair_server (and
> > possibly scx_server?) as for them we are only looking into a 'fixed
> > time' type of isolation. Full fledged servers (hierarchical scheduling)
> > maybe have it configurable, or enabled by default as a start (as we have
> > it today).
> 
> Right. Then we should write the above like:
> 
> 	scaled_delta_exec = delta_exec;
> 	if (!dl_se->dl_server)
> 		scaled_delta_exec = dl_scaled_delta_exec(rq, dl_se, delta_exec);
> 
> and let any later server users add bits on if they want more options.

Works for me. Looks cleaner also.

Kuyo, can you please update your patch then?

Thanks,
Juri


