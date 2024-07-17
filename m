Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CD0C3DA60
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jul 2024 18:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TVRW8hLHIUSZNhVfLPVIOXLlJElKjBJKeg9q2jucIOk=; b=NklQvseus0qaOzo+4LDbVJ+SsX
	6qXNJH1u4PUeaTxbqbIGwCF+34vYzDonWMPLeCKtca3JRAQ0crWm35OYvJaw60K0FXSkJu9P1Ab16
	v6wg0asVo0OhJ6VtvznfKw0sxoBGP4X4KVSXVGAuTR0I7frqJ/gznNPfTEls3nDfgyX49ngiYAApn
	+V1Xd+SAPr+8aszK//aWh+5vig4g1ZjB1AOKqD9D2UL4ozU1WMWwvkUL+sD79hE85wewskSjDzb4l
	G75B/Ws5rRkDVevemp7d+GgmdZAVQBoaHFrD3l59IKecMUI3973Rj3o/J2A6dmtzlWOAY68ZuGNIn
	74lU24uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU9Ka-0000000Ec2q-37BP;
	Wed, 17 Jul 2024 18:24:48 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU9KX-0000000Ec1m-2T0i;
	Wed, 17 Jul 2024 18:24:47 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-70b0e9ee7bcso5373602b3a.1;
        Wed, 17 Jul 2024 11:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721240684; x=1721845484; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TVRW8hLHIUSZNhVfLPVIOXLlJElKjBJKeg9q2jucIOk=;
        b=dcMNde86RSOKQ3ra3/87zWJHEk+XySccFzlIljQH24PrTQR8ooRPO81iD1Wh27bZS0
         +1LSFt78h1NzGuHl6Z09rWnKBamzYUKJwK3BxQtoEdv4usyNoKSqpgwekf0etPrpz7iz
         u5MaUun8xa8rsxqutNlH3t6Ow1yPdnWXIjes2iR43VXlMabGA85881CNKghSe9OGZFJL
         RFx25r1WI3jFEzPQxB5kkQyjJ+nNJZqdyg86w51ZVk7tKX1whxkpKfy34aCyQLZXfSAQ
         PMgJDVJhPcEhJSbNcCkB1wMaJezpyHopYoEaWrB/wdQ9Ap7y1kugnKAzZc3bjH2HR7b4
         R8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721240684; x=1721845484;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TVRW8hLHIUSZNhVfLPVIOXLlJElKjBJKeg9q2jucIOk=;
        b=p8qZMHWPzZsPfpLxVHjDTVdOM1ksSY+KDC49FxizPCkozXNsSamq9WB4vmUEg+1M3h
         m03hCcGKWWW/s+jOZATIMgjIJZcYUwOxvR5a5s8O+gaVO6NbP6WgXleqC0BrqeEIEBGo
         acOHrr9Cyi1oE9jAKH/xSxrab3Q4e17hNDHkVXWBGphwSR1CYdFwqDwI4gsikTpvx2o2
         sTDt1d0kH3OZ0M0roisPYSP1maXdzKZy1lA4TstOuGBxZih/WYdBneZ16U6PF5YOX+IE
         3aQIBvwWY+QHugJ9YwFaaGQbNcnsqOA+PWi+QQAmb8BxorbLIT/+A/6WvWYN0i04ntwZ
         O46A==
X-Forwarded-Encrypted: i=1; AJvYcCVbvFM3RvvgNL0EaedMIr7xM1LpVmI1zjre/nzfaAU4KL5ZEkMYR2DyA34oV9lB1Zi61C5WLaFF1Aj6MSGRScVUjT1EcXb9LkbM1dzlZJca+Hs0dHmrLnT/1HDK1JFyZHZX+xu9rX+O4IcLa2RJTiDOUXu3Aa+bHXg=
X-Gm-Message-State: AOJu0Yxlz1YcA1o9GOZ/GsZJsHR5BmUfU9MjK9afgRcdFd2Sduubc97z
	WYSzlLMv7Tv6xo7/JqPvBqK6u++8XgBp2M9A23l26yZhtCp/Y+MD
X-Google-Smtp-Source: AGHT+IG+8XAut5x9RnVX0256xGnt+rKtGG2XFJero3WSej4KWrPLZ7hzVXL3loyY3SJ2Mysy4szevA==
X-Received: by 2002:a05:6a00:2d83:b0:706:381e:318c with SMTP id d2e1a72fcca58-70ce4e8d2e5mr2750414b3a.7.1721240684126;
        Wed, 17 Jul 2024 11:24:44 -0700 (PDT)
Received: from localhost (dhcp-141-239-149-160.hawaiiantel.net. [141.239.149.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7ecd2820sm8436751b3a.212.2024.07.17.11.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 11:24:43 -0700 (PDT)
Date: Wed, 17 Jul 2024 08:24:42 -1000
From: "tj@kernel.org" <tj@kernel.org>
To: Waiman Long <longman@redhat.com>
Cc: Boy Wu =?utf-8?B?KOWQs+WLg+iqvCk=?= <Boy.Wu@mediatek.com>,
	"boris@bur.io" <boris@bur.io>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"axboe@kernel.dk" <axboe@kernel.dk>,
	Iverlin Wang =?utf-8?B?KOeOi+iLs+mclik=?= <Iverlin.Wang@mediatek.com>,
	"josef@toxicpanda.com" <josef@toxicpanda.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3] blk-cgroup: Replace u64 sync with spinlock for iostat
 update
Message-ID: <ZpgMajKn2O521H2s@slm.duckdns.org>
References: <20240716075206.23121-1-boy.wu@mediatek.com>
 <Zpbify32lel9J-5I@slm.duckdns.org>
 <c5bcbcbaeacdb805adc75c26f92ec69f26ad7706.camel@mediatek.com>
 <5560c690cc6de67139a9b2e45c7a11938b70fc58.camel@mediatek.com>
 <1b19b68adb34410bf6dc8fd3f50e4b82c1a014e4.camel@mediatek.com>
 <Zpf3ks2drDZ7ULTa@slm.duckdns.org>
 <f448f66b-7a91-4281-8f77-159541cbacff@redhat.com>
 <ZpgB9kCAxAAXAtSi@slm.duckdns.org>
 <134fc34c-10b8-4d00-aaca-8285efce9899@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <134fc34c-10b8-4d00-aaca-8285efce9899@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_112445_650316_AA8CA4A6 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
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

On Wed, Jul 17, 2024 at 02:18:39PM -0400, Waiman Long wrote:
> Well, it can be confusing whether we are dealing with blkg->iostat or
> blkg->iostat_cpu. In many cases, we are dealing with iostat_cpu instead of
> iostat like __blkcg_rstat_flush() and blkg_clear_stat(). So we can't
> eliminate the use of u64_stats_update_begin_irqsave() in those cases.

I mean, we need to distinguish them. For 32bits, blkg->iostat has multiple
updaters, so we can't use u64_sync; however, blkg->iostat_cpu has only one
updater (except blkg_clear_stat() which I don't think we need to worry too
much about), so u64_sync is fine.

Thanks.

-- 
tejun

