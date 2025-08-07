Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9383FC87FD2
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Aug 2025 07:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XEkUsPN+k+MJU7kRrD9l63TqRFA4OQCOteatAqsTD0Q=; b=ubKLe1KMLQ/H5E7CYuFU1fMcuw
	Zbkgsn+pO8b9VEOCVOOsUOkcqU/NXkRQK8susaO8CJW+SPRh3jDTd7kShJb3igudlzBlwoMAQ1Kph
	XKzfetq/Lg8tgB6whDwLt4HQ4jnyF4Eq63qe/ujO9J45F5QQCO2xsMnX0Tq8g1r0TeKg5Nq8BvpOo
	OP0Ja3qAWTwj+00PCtsQHFgvVyXoMGvG9kDh6umdvZ64fqM+aIIAXM55MkFIfYL+5NEigej+D8JXg
	Ze77wWqVYy6sWBPdCRUNylFs92x4m6EPqM5qu5tm/aJzwHrPq8jaZp7gDm7LjNcmr17+u2XqcUabF
	WIq2GTMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujutM-0000000HRSj-0Z71;
	Thu, 07 Aug 2025 07:18:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujuqp-0000000HRMb-1XKa
	for linux-mediatek@lists.infradead.org;
	Thu, 07 Aug 2025 07:15:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754550945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XEkUsPN+k+MJU7kRrD9l63TqRFA4OQCOteatAqsTD0Q=;
	b=C/jvAugV7pMGoLx3o/OGwcDZtg2CKc1g0sfA0MXDR7iNJvodfsqNDYq1QRMC5iG03lm5LJ
	Di3H+38esryN2BUqiCuln0OtR5E2mVctXjXZ/9ZqgGhNB1L2BE8nLsQ8ZHf9cVaSfxV0uS
	bBiUxYWDEPp6Ez83OAT8qTcmHMJev7M=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-333-NE3s2w5SNoCHmranRMVUmA-1; Thu, 07 Aug 2025 03:15:43 -0400
X-MC-Unique: NE3s2w5SNoCHmranRMVUmA-1
X-Mimecast-MFC-AGG-ID: NE3s2w5SNoCHmranRMVUmA_1754550943
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e36e20d700so149960585a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 07 Aug 2025 00:15:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754550943; x=1755155743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XEkUsPN+k+MJU7kRrD9l63TqRFA4OQCOteatAqsTD0Q=;
        b=W2RwA2qn/uX1wt3VKgOYpGBilswMoQIXluW/3WmVElehuwPYXZxsmScrqp41BfQUyp
         m1/Jjmg2IajDNmUwwPzIBoQxR/7GTay44e/Y0NSxOjIiuwnKshOznhaKTZzx81jvFPr+
         kLUuunOhlpUsFDeiqh4PYBGfC/KLnxxO3oJM19rtfcAoWtXvjvip6ZzPwdM6tSf6Wajg
         cnxAXI7RuOArWDxaFNFfbdx8/pYBAjvIiu5V1J1Bee5Z2cX1GVt04sgIePdEps3nLH8F
         XuRj1+bwvA1X4y8rZBpi1ktM28cwIkbCicw+Q+xY41+VQv8E031VKv2RNN7ITsfnmZB7
         a+Rg==
X-Forwarded-Encrypted: i=1; AJvYcCWNBtaEMzzDACa1MpTe298Jzz2NRTOl5uWT0w00YVcIVBLhS6Taf0rTvV0ZFfMjPdPl1qT6ycHIRp4m9E9lww==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw05++CVnJmSTRkI2jeDgpy1Bwymoz61GEHA5e7sVVJ5NRkJu9P
	1aRy+O5fQm8rU7CplQeLu1f24OzHNP9oSbPSh8FlLPHoML2LfSkT+kqBur95XcoKx2YpudOSE1T
	3sqWfkQRzK86nJq8DhJkMGv7IOonReoZO4F1NWtRVKvLzRQknlfr/gQXTQH/LBkh9iebm1rIJkw
	==
X-Gm-Gg: ASbGncu6LiqkADoTL8KgQk6ACs+QzJMYnbmBHh7RwaiWs+m2v81ojAly9+mhPxGBCNq
	4NklrLbtOxt2nhwb5+Os3LEFQCaMF5H9l6twAEmf/LJuBPwWhmAqXBnAUViy5WsitNMizazju3a
	PpNQ272c1kPsizs5OO8B8KAx6R/cCcg4BfGTyXd5ThOyWgFonkrwzDrsNxhG7qdb6oLBtmTHaah
	o/LfyBVt+ahrfuEjvARKWAQV4MPqBPX0AY2DYDVKCD8g+myXCNMM8arfhOnOy9dEe/01ObGz8hG
	dbVpzzDh4exmC2ELJEmCdoNutC+iEynED8UVIRoUUHzFjW3jKWjPxosVIPfDF3RSQbU7bRRIGeC
	v1aYoIWz9GERfKKkK8bTIec8=
X-Received: by 2002:a05:620a:1a9e:b0:7e6:3e26:63b6 with SMTP id af79cd13be357-7e81ff9ae91mr302608885a.21.1754550943145;
        Thu, 07 Aug 2025 00:15:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9+WiBRRCq+H4RnB0Tr6tHhfPNZd1WZfXKOFerdMaIC9DXsn94l4MoDcA4SpZi97fGQJP2Hw==
X-Received: by 2002:a05:620a:1a9e:b0:7e6:3e26:63b6 with SMTP id af79cd13be357-7e81ff9ae91mr302606485a.21.1754550942754;
        Thu, 07 Aug 2025 00:15:42 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb (host-2-102-14-151.as13285.net. [2.102.14.151])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e817311ad9sm186328985a.41.2025.08.07.00.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 00:15:42 -0700 (PDT)
Date: Thu, 7 Aug 2025 08:15:37 +0100
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
Message-ID: <aJRSmWCJI-GlApsR@jlelli-thinkpadt14gen4.remote.csb>
References: <20250805155347.1693676-1-kuyo.chang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20250805155347.1693676-1-kuyo.chang@mediatek.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: worRvcI4WmWPQtAqkyCNoA0nOpWYVoFsfNuKccSg9UU_1754550943
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_001547_476707_8B4208F7 
X-CRM114-Status: GOOD (  19.56  )
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

Hi,

On 05/08/25 23:53, Kuyo Chang wrote:
> From: kuyo chang <kuyo.chang@mediatek.com>
> 
> The DL server is introduced as a replacement for realtime throttling.
> When RT throttling is activated, a message
> "sched: RT throttling activated" is shown. However, it is currently
> difficult for users to know when the DL server is activated.
> 
> This patch adds a similar message to indicate when the DL server
> is activated, which helps users debug RT/CFS contention issues.
> 
> Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
> ---
>  kernel/sched/deadline.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index e2d51f4306b3..8e0de6cdb980 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -2042,6 +2042,9 @@ enqueue_dl_entity(struct sched_dl_entity *dl_se, int flags)
>  	}
>  
>  	__enqueue_dl_entity(dl_se);
> +
> +	if (dl_server(dl_se))
> +		printk_deferred_once("sched: dl_server activated\n");
>  }

Not sure if we want/need this, but, if we do, I believe
fair_server_pick_task() might be a better place to put it, as it's
really when the dl-server is called to do its job.

Thanks,
Juri


