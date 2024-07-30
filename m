Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6412C49EA1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 19:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1XqsIBuR2d65pkoTcMib3SHObnFtV2VvkWqAzRn++NI=; b=3RdLV5emj4h0wFWA50dl+yUEzb
	DRqQ73XmHgMF5RlbG3QLnQO9+Vj9dSqh/BwuizPeYauHi4RHFpXYFf6tvl7Fl1eBzhp9M6htJu0bA
	v4TNFbPYPuvPi6hVCp8r8OzmgDQYxddotHFxXsRg4k467Cix6nUWe1SKFLtqpJ/igg/fz6Tz4NS5M
	CyITPgoAdO6wMp7p5vHQg60KZjEVVPJZX0phrP6PzntmgGl9dqzgMXpCBrkAed+mEn83JIn/fTVs/
	FaUafQG7UJgt1x7reelx1FzYxiZcUF7FhlIDj1+kmhpOXbWGYqs22ijNYfcICjzx4+J0ZeV/rd1Kh
	YuRjdorQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYsrD-0000000GLZy-1DUh;
	Tue, 30 Jul 2024 19:50:03 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYsrB-0000000GLYV-0P8L;
	Tue, 30 Jul 2024 19:50:02 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-70d19d768c2so3716560b3a.3;
        Tue, 30 Jul 2024 12:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722368999; x=1722973799; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1XqsIBuR2d65pkoTcMib3SHObnFtV2VvkWqAzRn++NI=;
        b=Mbk5cB/xJOgO1OAt111kP0TmOEOjjGLppRu0ivC/DT6xJwG/SBOVhvoQdgR/xYcts6
         9n13Y7lI+CSDJsLRAk5/tn5iss/jZi1UO14a38Kf6CDFQdDY34rr/idNrWgMdQ2K1CVk
         4MewObsaq1hE9pWI7BafQfwCMjS0R1DN2Vl8dmJh6b+z08zVSgMtk6/KVbUDax4NocKT
         xP7tAgoqc/kpnAzCec6rdkLp7koVkfHBCA7Ao9YUWFl3zuSLSI3BHRwrnpVdWNpHUJHk
         U4leWHgd1QL4Yu87e0qzFOVy+SfOh0vHeAO1jPucxYdFijZFxtuVmEQrGn6h9epFc2b8
         1vPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722368999; x=1722973799;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1XqsIBuR2d65pkoTcMib3SHObnFtV2VvkWqAzRn++NI=;
        b=ceFHlHRYauJ9W9z9ZyMPixm2j13jISjLrBIUYdNJnl+johqD8tfhp3YO3ZkqeJiALC
         0ZSlgiMXdTHOZkH5txaOGoPOSfbAaAsqfqBjR1T5bFVZdl1bfCWtKBIQ3fYnpo7XySDy
         tNV1bG1hIwEZ2l4rpr64lVYS21Z7yXjyryOeC1NFjbCqAPD/cOD5/zFlq9ditRIL/WD3
         hCmH8WlWER4WV9xBk3qqDpFnsQ9Ys7kvy3ZbKiTPEMBkZIAyEPI6dQM3Y3l8P2sGAqdz
         pVFm7TiJCgCzw+TN4D1RELJV0ymYTqBUJ+oyCOiHH+pi+kp/vvNk1RTdpkUyNcQxo2Rl
         zK0w==
X-Forwarded-Encrypted: i=1; AJvYcCUEaKtz/foJ5Cm07msqqUAhlr6Fb4UskNGTMYeN6dEg2/+akpFEhoyitH5fBUClvSIVbz5aCDArTbloesZWqOf299zbvu7d+wb5N/XmZp9wRR9a5YItC2FRtI80ERluIqM8QRSkDvdNFSfdyVNh+ImGbOm/yXQXfiw=
X-Gm-Message-State: AOJu0YynacGW95mEL9TxzgHFbwh4g3PKvz/RQIX3QTT6S5zQ96syttDT
	CFgaoOUq+oBghaEON/Ecp+GnJDFmo9jm9xxdt4tQBblfa2hCDaUS
X-Google-Smtp-Source: AGHT+IHMofISf8ufHbwXnDvSjNtSEFNZzRptii26XJJ1D92mEtUxcrKRXGJT3wiXryOSkzNe2+u7yQ==
X-Received: by 2002:a05:6a20:2455:b0:1c2:8d16:c681 with SMTP id adf61e73a8af0-1c4a13a47d7mr10418021637.34.1722368998718;
        Tue, 30 Jul 2024 12:49:58 -0700 (PDT)
Received: from localhost (dhcp-141-239-149-160.hawaiiantel.net. [141.239.149.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7ee0190sm105934855ad.160.2024.07.30.12.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 12:49:58 -0700 (PDT)
Date: Tue, 30 Jul 2024 09:49:57 -1000
From: "tj@kernel.org" <tj@kernel.org>
To: Boy Wu =?utf-8?B?KOWQs+WLg+iqvCk=?= <Boy.Wu@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"boris@bur.io" <boris@bur.io>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
	"axboe@kernel.dk" <axboe@kernel.dk>,
	Iverlin Wang =?utf-8?B?KOeOi+iLs+mclik=?= <Iverlin.Wang@mediatek.com>,
	"josef@toxicpanda.com" <josef@toxicpanda.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v4] blk-cgroup: Replace u64 sync with spinlock for iostat
Message-ID: <ZqlD5WXx39E8xVnA@slm.duckdns.org>
References: <20240718084112.12202-1-boy.wu@mediatek.com>
 <ZpmF8HJsuefjC7Xr@slm.duckdns.org>
 <00c595a16b4e96ae56973ac2ce586f6ad736059f.camel@mediatek.com>
 <ZpqjCVxSAV-Q7Yhy@slm.duckdns.org>
 <e944e61fb64e5094aa6a0afef652359734619ba5.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e944e61fb64e5094aa6a0afef652359734619ba5.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_125001_155295_ADFA00C4 
X-CRM114-Status: GOOD (  11.57  )
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

Hello, Boy.

On Fri, Jul 26, 2024 at 03:43:27AM +0000, Boy Wu (吳勃誼) wrote:
...
> The use of a spinlock with u64 sync is suggested in
> include/linux/u64_stats_sync.h:33.
> 
>  * Usage :
>  *
>  * Stats producer (writer) should use following template granted it
> already got
>  * an exclusive access to counters (a lock is already taken, or per cpu
>  * data is used [in a non preemptable context])
>  *
>  *   spin_lock_bh(...) or other synchronization to get exclusive access
>  *   ...
>  *   u64_stats_update_begin(&stats->syncp);
>  *   u64_stats_add(&stats->bytes64, len); // non atomic operation
>  *   u64_stats_inc(&stats->packets64);    // non atomic operation
>  *   u64_stats_update_end(&stats->syncp);
> 
> Is this a incorrect statment?

That's not incorrect and it'd make sense if we really want to use u64_sync -
e.g. the reader is hot path. Here, just a spinlock would be simpler and do
fine.

Thanks.

-- 
tejun

