Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD76C71136
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jun 2025 15:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3KT/2mLdsrhe4l5WXh2mMIJOHdvnt3ZcZb+h3AjjEok=; b=KVg4gBY5VIVK5wvp0dQSFqK8wf
	aMRD5m8nnE+qI6hsdVey8Pp3LGgGoUGL/f6strFvIppiqu3383aCNw4cTjfKpHqVKdQZHe1JKb7LT
	ajodz3ZRaJC5sXgE+coHeIL7pNfSNDf8r8HzI9cmYagThJoH5SmzbcJKLAd4KbYSAG2FLvR3Fw2Xu
	UBZ148S/bNlBHETNixazLTYqJ8bMUUupT9g/iDk+xN3YZDtGrAuqOx7BydqfhVISHnPyI2zc2iWmp
	shq8Jnk+SCckok1vbzKR3Ah6mPEzTCoFfm7qoGXFcWH+hITYE1zLoyC6dFzKGNj4udlVoY4KH2Rpj
	07QpFDjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBkU-00000004rXm-0IX7;
	Mon, 16 Jun 2025 15:27:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRAQz-00000004dfa-41zz
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Jun 2025 14:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750082615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3KT/2mLdsrhe4l5WXh2mMIJOHdvnt3ZcZb+h3AjjEok=;
	b=ibvuht1rUdFRv8LML76zvNXbIBU+ByHbR3cihqf1Tn7vSz+Z3i3GBLXBWiw7rmuvhMfPFe
	kp6LR+Aq3jSKh1t330YLLssIxzCSa04b7LKjovCUefLDIuHKbPqMbta0aKk9+NajOq9pjO
	SB8PQ6xh5ivK0U4m1JhJKN4zPZRJNNw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-OPBr6j_ZMEig8NPl8A8R6g-1; Mon, 16 Jun 2025 10:03:31 -0400
X-MC-Unique: OPBr6j_ZMEig8NPl8A8R6g-1
X-Mimecast-MFC-AGG-ID: OPBr6j_ZMEig8NPl8A8R6g_1750082610
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-451ac1b43c4so25754005e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Jun 2025 07:03:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750082609; x=1750687409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KT/2mLdsrhe4l5WXh2mMIJOHdvnt3ZcZb+h3AjjEok=;
        b=m2P86Ymkpd0Eo4z/UoxE75XAneoLesxKtPVNX7Ogo6jyWR2czWSrqLQP1fFAJcdlOd
         XdWZTlfVMFIO1raaOvZs32DfRk4QLMz5eTPQILO3rS9Erby8ZMmVR7EEn3g43IbB/nee
         Blfp8Om3r8FkU2Nt3h+RTxcUQSF85Qa5KLcX0zUel064JwAV48WfRM9lFIsYNkm2UJTC
         gZn6h/pwbZcdA0TSJJksAvkgdQ/rs/RtbOw9oFyteItFOKJNlDsjYwgleui/XiFN6da8
         WdGR0KBtQuAUMO/ZcjeB+nfqtxEtu3IdYsm0RXLVjbAixaGvkkWhNh188icJKjWiqyUo
         coHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOYV9KHckpCU74HYSZzKVg3O6dYc3jRdF3LRH3nmv3Yaqrvu62wvfmIf4dITwfXGnbNXgirSUTUEMR2SqR9A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx72n+FZdxMXP63rr5d/2SdPO4IchA/Srkw5fTn22v1vVJINZ/B
	Bvtoxvs3WpsaCurrIP1hgZ2enPIY7KQYFk+dFv8yzn9bkT/INWBhNJ/UsdUgtsgOOBaQYrq25UN
	Ijb9Iv2oUXh5avDTshoDYCLtk9eZQzlo378a1q8yRmw7GugbFsDWlZmvm0Qsvnp0T1NSZghwfTg
	==
X-Gm-Gg: ASbGnculYfZZp84oILdpmxQDY7h+8xZZ+CqytAayON2RgMpVDqJdo6tGbw3O0DTengo
	cRD2fHr/7t8l6rtgY0WchV3aBqH3qHFFGPnbu3nmMS48oaNzmkbalb3YS6B4/mqVwySszk1ueyt
	98JSEE72FQmflk4NIE159olFMQwNL7OXUWR42dpoc9ovMTzsByuhmyNX5ylHBnexr/fX7XwrvNN
	AbNQ2LJYcojb9kjqSbBZBpzovD/XKb4OHGdKPvldnpl0oZjMAobMhTBUVEMb8jB0EBdhuoTi4Ra
	0r3bP57v02LsLsCOxVJrOmkBNOrWOzYw0UJU7J0MF9tGVWAnNWtu1g==
X-Received: by 2002:a5d:64c9:0:b0:3a4:dde7:ee12 with SMTP id ffacd0b85a97d-3a572e9e01cmr8627005f8f.53.1750082607422;
        Mon, 16 Jun 2025 07:03:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhnN5lqHyekM9U5mFuJ4VnEOh6SefVAzY1bT/B5jogeMQLSgptuYNFVoJKZP5a2pKpaGM6cQ==
X-Received: by 2002:a5d:64c9:0:b0:3a4:dde7:ee12 with SMTP id ffacd0b85a97d-3a572e9e01cmr8626772f8f.53.1750082605375;
        Mon, 16 Jun 2025 07:03:25 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.151.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54d7fsm11345085f8f.18.2025.06.16.07.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 07:03:24 -0700 (PDT)
Date: Mon, 16 Jun 2025 16:03:20 +0200
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
	jstultz <jstultz@google.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/1] sched/deadline: Fix fair_server runtime calculation
 formula
Message-ID: <aFAkKGs5h6kfXYnO@jlelli-thinkpadt14gen4.remote.csb>
References: <20250614020524.631521-1-kuyo.chang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20250614020524.631521-1-kuyo.chang@mediatek.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PpufSPHuEd0fMCMCSrTg5MUq4fEvQ0Na-s8hlRGOy7E_1750082610
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_070338_086976_77C3571B 
X-CRM114-Status: GOOD (  12.73  )
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

Hello,

On 14/06/25 10:04, Kuyo Chang wrote:
> From: kuyo chang <kuyo.chang@mediatek.com>
> 
> [Symptom]
> The calculation formula for fair_server runtime is based on
> Frequency/CPU scale-invariance.
> This will cause excessive RT latency (expect absolute time).
> 
> [Analysis]
> Consider the following case under a Big.LITTLE architecture:
> 
> Assume the runtime is : 50,000,000 ns, and FIE/CIE as below
> FIE: 100
> CIE:50
> First by FIE, the runtime is scaled to 50,000,000 * 100 >> 10 = 4,882,812
> Then by CIE, it is further scaled to 4,882,812 * 50 >> 10 = 238,418.
> 
> So it will scaled to 238,418 ns.
> 
> [Solution]
> The runtime for fair_server should be absolute time
> asis RT bandwidth control.
> Fix the runtime calculation formula for the fair_server.
> 
> Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
> ---

Right, I would agree we don't actually want to scale fair_server runtime
by frequency/capacity. Your change looks good to me.

Acked-by: Juri Lelli <juri.lelli@redhat.com>

Thanks!
Juri


