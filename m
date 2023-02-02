Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F22FC61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 19:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0XqCItSDIlA9UN2KgN+ixgTMg/eGZMlJcrANVyohEDY=; b=Xz9aQky2Vccxb4e8yFHAJJXDVJ
	MARYakczdFEYjH5/KGyTLlOQFsYlUmD20vOybQ025APcK8rdOWkod4+ykq9702woXCNj8YNDPM2Fm
	zlYBcnnrEWb+fzLYEvbaHy7cGm2o6RI4SZEJ5yqrR2nP3gukbUZ1TvS7IezEqSsda4mKi8Z+5bjqZ
	eWQ3ALsHxGNQLtnYTvpguFBZRoZIMAc9tVykmpynywd0ypCtunuMzDcMEem740xVq6zdOz9677sLD
	NJ2CShuOF7IwW/tjm/xue/7/IWl2A4AyNFuekU2OzsEn1VD+yN2Ux3jIhPY5ZT5ttTjiF88BKe7SN
	0Cl2WfZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNfbA-00H65l-1S; Thu, 02 Feb 2023 19:50:20 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNfb6-00H64e-K3; Thu, 02 Feb 2023 19:50:17 +0000
Received: by mail-pj1-x1030.google.com with SMTP id nm12-20020a17090b19cc00b0022c2155cc0bso2844806pjb.4;
        Thu, 02 Feb 2023 11:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0XqCItSDIlA9UN2KgN+ixgTMg/eGZMlJcrANVyohEDY=;
        b=iNBaT8Z+Ig7zrOQHc1RHN6iLOys2Q0io9gpYMeH9LzsUki6o83huVNzd3aSQV5JEzL
         QaQrK6iF24BTp/OaynHeDuVzOKVK72wVPLciBF0niO4O89anZ3czxsEFPo9KcbK3hZOt
         xG4jzE2Scyetx+HzYrSSxtl9aOcoJWt7DO4NNuUYH0sVPe9PeEABvNn+l8pjQ4rYu3hh
         1m/ogKgjMf6hFOFKPOWgr9Yndv0LRIChXjzkP0tt8mBZy2lLUtpjoTvaLh+fjVvLr1Kj
         EyoozxTzk5b4ThayMM0cCuOkOqWvXk59XVYxSz5oynrw23D0jagogoyMumcW0Jk+MF/k
         NQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0XqCItSDIlA9UN2KgN+ixgTMg/eGZMlJcrANVyohEDY=;
        b=cY2XYX2eVB8M1bdqSfmd3j5JObnzr3RsmXmPI1oY3OWGfmaAV5m7DpUe3FKs2q3MDM
         w+aGJmz8xtwxEI89KQ/L0ib+pkI0uHh7jp8aeNhN8X3HdGJ4q3MTmhKJMISDWgdo1GDy
         ZQj0UUKv4erRrCBh1IdRrUg8xTFpNFlMM0cXoNEITmtLpsgvTJ5oAkSyrymhNO8RPceV
         /e2QCF0Bd5F47mE6VmPhbBSBgCagJ7wN9sUqR1s8B73CuU0p73uxRYFMXZLDBi44JUgj
         63hEtc2LCynDiUptAdBjxkJBOc+6M4HyrelEqQb3qQ0yiKQI5Y07NNlkAI1J2adyrv/q
         deGg==
X-Gm-Message-State: AO0yUKWmdG6enU6dvmm+uwkjTL+AAPZpWxHH3VltMXGwz9FrK+8KcMHJ
	2MRoONiZIxYRD4nk6C/lo5IAznutXb0=
X-Google-Smtp-Source: AK7set8UdMNY7Vm2C0NqcIGMDxS2MwKLVQ9fsxr+QAUN2RaNXftZlJ9+zwp/GclwyjOof6sss5w9Qg==
X-Received: by 2002:a05:6a21:33a7:b0:be:a9c7:5d12 with SMTP id yy39-20020a056a2133a700b000bea9c75d12mr9659198pzb.18.1675367410339;
        Thu, 02 Feb 2023 11:50:10 -0800 (PST)
Received: from localhost ([2620:10d:c090:400::5:48a9])
        by smtp.gmail.com with ESMTPSA id d5-20020a170902654500b001892af9472esm37767pln.261.2023.02.02.11.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 11:50:09 -0800 (PST)
Date: Thu, 2 Feb 2023 09:50:08 -1000
From: "tj@kernel.org" <tj@kernel.org>
To: Lixiong Liu =?utf-8?B?KOWImOWIqembhCk=?= <Lixiong.Liu@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
	Wenju Xu =?utf-8?B?KOiuuOaWh+S4vik=?= <Wenju.Xu@mediatek.com>,
	wsd_upstream <wsd_upstream@mediatek.com>,
	Jing-Ting Wu =?utf-8?B?KOWQs+mdnOWptyk=?= <Jing-Ting.Wu@mediatek.com>,
	"hannes@cmpxchg.org" <hannes@cmpxchg.org>,
	WJ Wang =?utf-8?B?KOeOi+WGmyk=?= <wj.wang@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Andress Kuo =?utf-8?B?KOmDreWtn+S/rik=?= <Andress.Kuo@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Subject: Re: cgroup user-after-free
Message-ID: <Y9wT8At0MF1S5v0k@slm.duckdns.org>
References: <697032f2331a92eec0e03e85e46cb78bd975a788.camel@mediatek.com>
 <Y8Cwdsk5pYNd8fX8@slm.duckdns.org>
 <f8b24df3bd009d112479e9d5db36ec4afff9bb71.camel@mediatek.com>
 <3bb8e65797b905e4e9d4fad93a8f4fe26b8958a4.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3bb8e65797b905e4e9d4fad93a8f4fe26b8958a4.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_115016_681741_960A2216 
X-CRM114-Status: GOOD (  19.63  )
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

On Wed, Feb 01, 2023 at 06:04:04AM +0000, Lixiong Liu (刘利雄) wrote:
> On Fri, 2023-01-13 at 13:40 +0800, lixiong liu wrote:
> > > > Root cause: 
> > > > cgroup_migrate_finish free cset’s cgroup,
> > > > 
> > > > but cgroup_sk_alloc use the freed cgroup,
> > > > 
> > > > then use-after-free happened.
> > > 
> > > Sounds similar to the problem fixed by 07fd5b6cdf3c ("cgroup: Use
> > > separate
> > > src/dst nodes when preloading css_sets for migration"). Can you try
> > > it out?
> > > 
> > > Thanks.
> > > 
> > 
> > 
> > Thanks for your quick feedback.
> > 
> > 
> >   
> > But we encountered use-after-free version
> > 
> > already contains this patch.
> > 
> > 
> > 
> > So, with this patch will also encounter
> > 
> > this use-after-free.
> > 
> > Thanks!
> > 
> > 
>   Do you have any suggestion for this issue?

Unfortunately, there isn't a lot to latch onto. It's on an older kernel and
there's no reproducer. Refcnting in the path is tricky and it wouldn't be
too surprising for some bugs to be there. If you can repro on a recent
kernel, that'd help a lot.

Thanks.

-- 
tejun

