Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D7F0C3DA60
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jul 2024 17:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g2JQbY7PsSahjVcQbjA5G1MLjb4KOC10oukwY/xrmhg=; b=ADMmr4JEVkBeE1Lbdjq4b0zC/V
	pjmsmIyHYDr7JfzmLG1ouKxMkFDjby8ulGOZFK2Pc1lfq7OITO1HjKG0dULnRNwXon8HeqL/EZ5Mr
	w5P1/b4hOyp4gOLrGha+NKf4G/j3hBG0iE/EtkZODQQvICY/rUvCUYAmA3R+L7uOjWu1jqZvv2sYX
	w8v+YbWeskU30qGmSAU5K6wJUhbyhpCzjT7Z215eV8h7h04GGtQk6LS4b4UKXxFH8iPEW0E72ObQA
	O4EjE6YXNg+vcdIqsD5SfQI4ZofLXP8+gMSYFSCZ8b20YYyBwYIsfu7lysIEXuxSm5xLtPWRdKH4m
	6SPg8VgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU8dR-0000000EVl1-1PWQ;
	Wed, 17 Jul 2024 17:40:13 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU8dN-0000000EVkO-448L;
	Wed, 17 Jul 2024 17:40:12 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-703775e4d5dso272289a34.0;
        Wed, 17 Jul 2024 10:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721238008; x=1721842808; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g2JQbY7PsSahjVcQbjA5G1MLjb4KOC10oukwY/xrmhg=;
        b=kxNa/F9ZDu3eHFsklaRhwHk63LxQz8AF4jHXL+WgzpHG3gRKjq+MD9K/0Ow2bR4hPi
         Gjf661QTLg5/34CUoUHfYTb9eSTAqZXX13wgqTtClS1ZLpb1bG5WPuwPZhMb99G93fxT
         LlbTLGcsVErBWNfuvNp5e0S/V4n/m5Mf8YXKbGly61azY5XiZopcNRZCwhkVBYnX3EJ1
         IKsIrRH+bnfoTfeakCgBG6uR5pw1TVGm+NNbUCFEP3aqR4NmKaFXOFS2KRd9nMm85OSf
         NEtM+ERAyWSP9tDZP6ibr/CGV4IXI4PEN9Oa4NzOSD16VGw7rqZS3iZuu0oawc2kPJHM
         TrdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721238008; x=1721842808;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g2JQbY7PsSahjVcQbjA5G1MLjb4KOC10oukwY/xrmhg=;
        b=MokL0iz0e+oOKsTsOyW4kA7Bxa58R8vp0T20kLW5pCk8ATkFKq4hKK1+O1on9KdlyI
         LbrZw2poZvSphH2d72Z01pPY+092+/gRIkoNvqRof3uk3h7/DbKdE9zN+Ey0w5v88IkN
         03Tr2lb0dT6QRE2GMIz7gK7OWyYGoofHm7C8gmFNtP2Q42epRHz4VIO69BBzEVV0N0VO
         N8mAWxgPvOjsQOgaD4bQw1YF7cL+frgzXuaIoUbFHx/s7hCwb6oiqwNdqgOXa50I5010
         LM1eL3005M2/aoEAiXY8IBwCoqZHcFPV0lY4OlGGrqNMxA6wodZPck6jPrli12EMdBpM
         QjIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUH0gTJ4pFLk+JxMtTpo+GA36rzZ4KtIaSab+WkhFNZxJn3/ZG2V13HxSa7wwhBLsUHkoYw2r5NCvoWSwb6JjdwphEfBFHs/48n0+98Lz2AYpOfb9jeZpAb4ECgBtenIGNKwV+kjNp+2skj8kCdnD3KaERf11o2qNk=
X-Gm-Message-State: AOJu0YxHLoIg5LQhtdWIIY1ENbC1lUKXBL4/1dS8rzCJiaLJAPRwXIc+
	eX6vlL4tWGkeSiCl09Z3CSU1HMDd6pp0ksp+O5KQ9gBoC5xryCYu
X-Google-Smtp-Source: AGHT+IFkKZ6cesFsV43HG1DzUL/qwe8kHhOrrOef3v21fl3azGhUoimP4PYwyLrhqiMFCkjOYt1Sig==
X-Received: by 2002:a9d:7ac6:0:b0:703:5c3e:88ff with SMTP id 46e09a7af769-708e37f5ae0mr2401403a34.22.1721238008578;
        Wed, 17 Jul 2024 10:40:08 -0700 (PDT)
Received: from localhost (dhcp-141-239-149-160.hawaiiantel.net. [141.239.149.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7eb9e285sm8421878b3a.8.2024.07.17.10.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 10:40:08 -0700 (PDT)
Date: Wed, 17 Jul 2024 07:40:06 -1000
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
Message-ID: <ZpgB9kCAxAAXAtSi@slm.duckdns.org>
References: <20240716075206.23121-1-boy.wu@mediatek.com>
 <Zpbify32lel9J-5I@slm.duckdns.org>
 <c5bcbcbaeacdb805adc75c26f92ec69f26ad7706.camel@mediatek.com>
 <5560c690cc6de67139a9b2e45c7a11938b70fc58.camel@mediatek.com>
 <1b19b68adb34410bf6dc8fd3f50e4b82c1a014e4.camel@mediatek.com>
 <Zpf3ks2drDZ7ULTa@slm.duckdns.org>
 <f448f66b-7a91-4281-8f77-159541cbacff@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f448f66b-7a91-4281-8f77-159541cbacff@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_104010_034815_B2954C18 
X-CRM114-Status: UNSURE (   8.94  )
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

Hello, Waiman.

On Wed, Jul 17, 2024 at 01:37:56PM -0400, Waiman Long wrote:
> bis->sync is still being used in blk_cgroup_bio_start(). Replacing it with a
> global lock may kill performance. We may have to use a per-cpu lock if we
> want to go this route of eliminating bis->sync.

So, the idea is to keep using u64_sync for blkg->iostat_cpu and use
blkg_stat_lock for blkg->iostat. The former is the only one which is updated
in hot path, right?

Thanks.

-- 
tejun

