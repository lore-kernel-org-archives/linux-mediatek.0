Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D35C28B28
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Mar 2025 03:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2w2NNoyeUMTe+WJP3vOV4lxBW7OxevPqpMtYOQZ7KSQ=; b=2+GOe+Gjd9b123Xe/gcxF2/McF
	Q3tVyRjODMAwtx1/IejxFG/lZRsosBOracpkLQ2Xl8OtGbHjj6e6eznO85Kiwe1wBu1PeqEmx6Bgd
	6AyotZ2A1vRUZCsO3LHmsI/bZFbAerohxRezimLPbbpPKZhPYIPQPaBntSAwVMd39QlYeLlYbkvkM
	W517dkKYxYVZpTxDw+cnQCjlYeVL7dit3QKrfG3cy/tAAM7U8mW49cFe0qDPHLMRMWLXMz3oKtSXs
	UQLPwhSt9k4ZNag+PJP8fpI6FyEOLcgLRqoo9PTHPmVnwoaj5RRNmqxT938CwBO/4up1iMu/GJQ1f
	nXUAX4UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsYyU-00000009zHV-3FTg;
	Thu, 13 Mar 2025 03:11:10 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsYwp-00000009zBV-2k3Q
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Mar 2025 03:09:28 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2fe9759e5c1so950595a91.0
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Mar 2025 20:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741835367; x=1742440167; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2w2NNoyeUMTe+WJP3vOV4lxBW7OxevPqpMtYOQZ7KSQ=;
        b=d6hx2HQPTJwe2pIByrt4zZw7sMYHp54JIkuVHd5J58l6v2BmmewzGcLv292Cg2sc6j
         ilrDJW0QwIsiO2PH9NMuROHXsvF+FpoU873xLBqOcts4bFPChvO3GOHRab/UYi0sXYcW
         HlnJGAoAolzNLg+SIZTmllH8LDpQk4or0eCv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741835367; x=1742440167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2w2NNoyeUMTe+WJP3vOV4lxBW7OxevPqpMtYOQZ7KSQ=;
        b=Wnw7Udul+Su4VZ+EAqRgvuaZBWO4JgbYzI6w767a1KN25RclyknRpI0xeuthDsGJuL
         l/jClfZqDpjrUW0hds2CAWgcclNKsegM8jW9xV/q6fXxsRy09Fqi9X2B9c5+GukDSrgd
         huW8F/jqMlmguZxt1ZZ6LsLXPgj5R6mPBikWUYw+8PkIMOJ29ZAvcjBrShAnf07G524K
         ESQsiVI2GjKb4+OizzObHZ8r05OZ7AqIeQi7IWKh3uK2M+BL71gKJXX0y6wm0iNS0yjm
         T62gfQd+XtLoIaE4y7Rew1IE/WPRKIy8Tgm3ZVHtGBcP8oGrJrZmJLZ6FOw3ChGVHhps
         vG3A==
X-Forwarded-Encrypted: i=1; AJvYcCV/FrdIvXaVk+rr5UcziuYPeB4z4xTEIvbSrQ16aUZnrg1Y84VbAfflVXXPXswUR3SoIROItPpMjNw5F8GQuQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzcFhXiQ7YWdCQw0KdiEfOFtzdUfmXNlkBXO1aFvREcvnjMG8Uk
	a4XbU/Z2so7EzMrFJTz5UbZ201B4XTEjtz8rJppRf9xoWrb13Qf4JZ7lb13Wqw==
X-Gm-Gg: ASbGncvWdOOdqJe74UPuNehDVQiEN2DUXhobp5IdL0DsJkuorDGsTvcJZkYnmiEw9A5
	SNMGt726Iywq1+CIMYsCDPIvFzrMtr1v08H54KnETYG1AyN6uqiT48bBEuZBqIgD3rVx8O8cuWi
	GQWQq4Ankq6X0AxJ+LIeVWHjzjFoEhWbNDrS8cbcKrDNeYi/K254zh9KGccW+I7ZMwCNzHSdfnI
	eT4rodyTyq1O37yz8SbHABS6kShTtxgBURaE29kY3nWuQ+K6ZZXiwfy0mGfIN1nuA88qTgkgf0x
	NYWNrQVd23Koeqs98qNIQsQvrJr8hk5HkGZ1ZwDS0MBmi/o=
X-Google-Smtp-Source: AGHT+IGFWO2nTLQPYrZdNHWAUjr4TV9jgOKxZGHY6bU9yRm/owksjVUBeXx/Vr3GQFVpil54DqonnA==
X-Received: by 2002:a17:90b:2f4c:b0:2f9:bcd8:da33 with SMTP id 98e67ed59e1d1-300ff10d6d1mr11929540a91.21.1741835366628;
        Wed, 12 Mar 2025 20:09:26 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:ef7a:848f:3b9:98dc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301302a8995sm848639a91.1.2025.03.12.20.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 20:09:26 -0700 (PDT)
Date: Thu, 13 Mar 2025 12:09:18 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Minchan Kim <minchan@kernel.org>
Cc: Qun-Wei Lin <qun-wei.lin@mediatek.com>, Jens Axboe <axboe@kernel.dk>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Vishal Verma <vishal.l.verma@intel.com>, 
	Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chris Li <chrisl@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, "Huang, Ying" <ying.huang@intel.com>, 
	Kairui Song <kasong@tencent.com>, Dan Schatzberg <schatzberg.dan@gmail.com>, 
	Barry Song <baohua@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, nvdimm@lists.linux.dev, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Casper Li <casper.li@mediatek.com>, Chinwen Chang <chinwen.chang@mediatek.com>, 
	Andrew Yang <andrew.yang@mediatek.com>, James Hsu <james.hsu@mediatek.com>
Subject: Re: [PATCH 0/2] Improve Zram by separating compression context from
 kswapd
Message-ID: <5gqqbq67th4xiufiw6j3ewih6htdepa4u5lfirdeffrui7hcdn@ly3re3vgez2g>
References: <20250307120141.1566673-1-qun-wei.lin@mediatek.com>
 <Z9HOavSkFf01K9xh@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9HOavSkFf01K9xh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_200927_685164_44ED1978 
X-CRM114-Status: GOOD (  18.51  )
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

On (25/03/12 11:11), Minchan Kim wrote:
> On Fri, Mar 07, 2025 at 08:01:02PM +0800, Qun-Wei Lin wrote:
> > This patch series introduces a new mechanism called kcompressd to
> > improve the efficiency of memory reclaiming in the operating system. The
> > main goal is to separate the tasks of page scanning and page compression
> > into distinct processes or threads, thereby reducing the load on the
> > kswapd thread and enhancing overall system performance under high memory
> > pressure conditions.
> > 
> > Problem:
> >  In the current system, the kswapd thread is responsible for both
> >  scanning the LRU pages and compressing pages into the ZRAM. This
> >  combined responsibility can lead to significant performance bottlenecks,
> >  especially under high memory pressure. The kswapd thread becomes a
> >  single point of contention, causing delays in memory reclaiming and
> >  overall system performance degradation.
> 
> Isn't it general problem if backend for swap is slow(but synchronous)?
> I think zram need to support asynchrnous IO(can do introduce multiple
> threads to compress batched pages) and doesn't declare it's
> synchrnous device for the case.

The current conclusion is that kcompressd will sit above zram,
because zram is not the only compressing swap backend we have.

