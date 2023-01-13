Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD86BC54EBE
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 01:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+22Q56bJPrledR2Cz6M9kGSFqzu3U0nD7pq3Hab+AU=; b=ik4pndLyZB7jMBkxDXVrGgCkxg
	XwNkKwlDX5XO0Lfqp2yRjbTSdEHX9o77xX+jXseNv96iSWtCxioW1F8yqBw7L6cIAXG3xbnMwDnJI
	xJuC+xz5K2w0HTHvQ7e7tMgjPJw7Df/uGaPhfAQkE56FWSn5e7RlBYWOxYeBK+67H0tQwcbUYz60G
	viRLEcRPbdfO2zCiEsG+F7y1/Sjc5v0xrJfqot5y85KzoHpXOUQq7zdtNNTGuMl48QzQkbbW/YgNV
	qMFYhO8njhuf3o6Ex/6dA0YflYvdfLQb0ziLU6jH9nxijZtIrlb0i1Z5efkIXM/7/ATObrhrb0wTt
	7Y4WNIuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG8eS-0003DD-G0; Fri, 13 Jan 2023 01:14:36 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG8eQ-0003By-9Z; Fri, 13 Jan 2023 01:14:35 +0000
Received: by mail-pj1-x102b.google.com with SMTP id o13so17399970pjg.2;
        Thu, 12 Jan 2023 17:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/+22Q56bJPrledR2Cz6M9kGSFqzu3U0nD7pq3Hab+AU=;
        b=LskLqLtZroGnCLT7v2RAIbLULPmZdsvu+XzR5D7MTLPsEC8wXxf272Z1o+0hiCjvSw
         qCJB26/ruPEjGO9FEme6GxPxk1Jpqhmzx/rcE2woX5PtAQRllglFJUqPzPqFgHxqLuUX
         JMS8qq+fXNeUZjx7jY80f2+gg6DHsNPa/+ihzIx/5qH3t3iPZiFPRrlkD/34R3crlFxC
         0N8G1VAb51W/zqTdhDE9f+Ox7hgVcOUiN8GVadsvOUT7oovyDsc16OIZ8lve1Qgmdc0W
         tzcL6hwJ49DJ0/nkeSsYJvoBbW8nMevIDVzqk5CFywnuWwFtDcYxU22PgihW9CgQH/Qk
         HIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/+22Q56bJPrledR2Cz6M9kGSFqzu3U0nD7pq3Hab+AU=;
        b=II2t7Xc0/lB6OdMDbEXrF9oc4EcvW3Bfi4bwLw/I4Xmi4pDIu1RoYJYct2xyX/T1+5
         bxMmA2o+IINgHrwm8iyRfG/A40t462bP5/QIvo1XG2GW3w8Q0UPmncvMPc4zA3mEUcBB
         BRmt7327SKcf/ZnMFyVkAfJ85Q4aYi8QYlJKO1EXYXFOHqjuUilfXeSpWLABSUSVVOtF
         9LLMdCF8n4DdeXQoQvL6wlWTGHsF2qMHBxhtFaNML0QM96RTouHt0/ZsRAkGMDXGkPdU
         XKDNUNxB6OC1ceANd70asgfyUwP6dyKQWcHYbWbEJC8stK7N0IVdqd7haoQ4ZmE5pnxL
         Zx3g==
X-Gm-Message-State: AFqh2koedDbjZomo9IhXsiFxypbjuMKUglTvG30wCVQBzTA1xr70BZBh
	YCo0S3bibPdxCASNNKJzs1I=
X-Google-Smtp-Source: AMrXdXujFy2LOPaRirPf6arh4aphG8TPOW1quE5cVwOxrk1jjMoBJkSKwNXWKVmknjsIZv2gbgAjJg==
X-Received: by 2002:a17:902:d918:b0:194:4b9a:ca90 with SMTP id c24-20020a170902d91800b001944b9aca90mr8498898plz.4.1673572472408;
        Thu, 12 Jan 2023 17:14:32 -0800 (PST)
Received: from localhost (2603-800c-1a02-1bae-a7fa-157f-969a-4cde.res6.spectrum.com. [2603:800c:1a02:1bae:a7fa:157f:969a:4cde])
        by smtp.gmail.com with ESMTPSA id n9-20020a170902d2c900b00183c6784704sm12700852plc.291.2023.01.12.17.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 17:14:31 -0800 (PST)
Date: Thu, 12 Jan 2023 15:14:30 -1000
From: "tj@kernel.org" <tj@kernel.org>
To: Lixiong Liu =?utf-8?B?KOWImOWIqembhCk=?= <Lixiong.Liu@mediatek.com>
Cc: "lizefan@huawei.com" <lizefan@huawei.com>,
	"hannes@cmpxchg.org" <hannes@cmpxchg.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
	Wenju Xu =?utf-8?B?KOiuuOaWh+S4vik=?= <Wenju.Xu@mediatek.com>,
	wsd_upstream <wsd_upstream@mediatek.com>,
	Jing-Ting Wu =?utf-8?B?KOWQs+mdnOWptyk=?= <Jing-Ting.Wu@mediatek.com>,
	WJ Wang =?utf-8?B?KOeOi+WGmyk=?= <wj.wang@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Andress Kuo =?utf-8?B?KOmDreWtn+S/rik=?= <Andress.Kuo@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Subject: Re: cgroup user-after-free
Message-ID: <Y8Cwdsk5pYNd8fX8@slm.duckdns.org>
References: <697032f2331a92eec0e03e85e46cb78bd975a788.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <697032f2331a92eec0e03e85e46cb78bd975a788.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_171434_357253_2E8F34B0 
X-CRM114-Status: UNSURE (   8.53  )
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

On Thu, Jan 12, 2023 at 09:48:55AM +0000, Lixiong Liu (刘利雄) wrote:
> Hi,
> 
> We meet cgroup use-after-free happened in T SW version with 
> 
> kernel-5.15.
>  
> Root cause: 
> cgroup_migrate_finish free cset’s cgroup,
> 
> but cgroup_sk_alloc use the freed cgroup,
> 
> then use-after-free happened.

Sounds similar to the problem fixed by 07fd5b6cdf3c ("cgroup: Use separate
src/dst nodes when preloading css_sets for migration"). Can you try it out?

Thanks.

-- 
tejun

