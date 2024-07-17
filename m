Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65DE9C3DA62
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jul 2024 18:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JL/3fZ/KL80SbG0gxIevxprQw4yP8Zt7WBtlleXdZVg=; b=BGa1eV18ohf0li3hHfuqFnt8Xf
	e3CKcp50u1/xfJjxu4cIARXC0DgQf7qr3jxDipNvdrzxJ8MjN91JrP2je6rfz34P96zZE1sdZjYSW
	dMYpndqPRtj3abX14k5u3kcanncVWV+gSPK/F9rFY0652KYP5tI5fqe6/Ws+Si385KmMynrUt9bts
	7QWuQe828UNY5tf9e8C5hg1OH6uC6Jbay/d3gLn4HAu9ivdIl2r/rvAXGl/hTRjPEGRcRL1mCmlrN
	rgerd5GcA2C0QrVLe+0wtOSI86p3mt9E/KfgyW7MzHg5lJWYuXrgq22fJdCccod+3nAeKzQ5BFcIu
	6KKOvp+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU9pu-0000000EfW2-1EnR;
	Wed, 17 Jul 2024 18:57:10 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU9pr-0000000EfVC-1Q0K;
	Wed, 17 Jul 2024 18:57:08 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-7515437ff16so5200180a12.2;
        Wed, 17 Jul 2024 11:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721242626; x=1721847426; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JL/3fZ/KL80SbG0gxIevxprQw4yP8Zt7WBtlleXdZVg=;
        b=V9Xv2rxy9wBhCA76IkSnieRiERmMnz/osNDP1AMm1Tan+n3IDIslt/uEcDBW6/2pad
         qWSTKTvMHVny/PCQevlrRjHyt9ozYPtdIP1T/Lzc32Zu/bvYc4eAkXbE7IlZok4tm7dY
         5r0RCRO0QI0adaPPk8yGqmou3RKvS8aQTlhkP47aDvKy18mC5WZy4n9cYEY8YIaxB4yv
         a+103CmoCGHq5J4Oqoga+zY3SS4fieeXSxeA2Iy1qAtQOQ7H1MXmAXL5EiBaNJg0abbh
         i40qiJa7RLVeoAEa/Hitf9I2PuNPrQL5/PpJRK4U0kNicO1iqhMDXQ4oMBXgy2jqCXtx
         MT4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721242626; x=1721847426;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JL/3fZ/KL80SbG0gxIevxprQw4yP8Zt7WBtlleXdZVg=;
        b=O3ZPk57krwZF3X12v2BQ7EtCxFcbkYdtxEXR3917gWNSfqKt/4aR0A1uxN0hav527H
         QXvVzRdPr4p+1qIzo7VL/5Ne4oR6nlVqe3rRJAOj5l1iutp/ftKOReuvrLNi6vNx/PtF
         Z9RUfXoIl3JQcJ6sUK3PgnTA/LpU8U0ImZEfpBEO7rfKBVNK2b97MeqeTM1ObubRGj1y
         OMKDSoF2AzPfYn42HHF48dPgLww88xyvNiBpZDrB0afNSD/tUYtPQnQ9lSk91IGHb8rA
         64QgzClQNzl4FTqMIvHJaNEQDInTp2i22C2744jiVUDIQNqlJrd0L4pRIfcwD92+9h+4
         2Nzw==
X-Forwarded-Encrypted: i=1; AJvYcCUyHk3+Ljecp6sWaFMdr6yX1CO+0L5eLCaV+6V6Hd/9RI/0McauYDUHUkhpSRvWcHG/pbYS46uVY756Je82XeRpxTz6NyJy0hha/QKs8UlRjyFcE1fmQWnOEWbZWdGWy+/c+8c0OMFFJ9aQWwbUGOW7pzq55EEq860=
X-Gm-Message-State: AOJu0YyFkJPXhafv0Si8fd16FhhIEXfIQgGAiplRBY967VotU2kRg6qP
	dpfO6EO7kibWSZcmNB3q8+PAvkZbSsD4GZejI9FTuH84WN6rjONy
X-Google-Smtp-Source: AGHT+IH3DCORNRV66+DX2G4j/+aDcK3/wP21M12HIrSoFR/73qsZi0G8Yd6O/P2L+EWP1V3eBSr4Mw==
X-Received: by 2002:a05:6a21:9997:b0:1c2:1ed4:4f91 with SMTP id adf61e73a8af0-1c3fdd2bf9fmr3817008637.31.1721242626016;
        Wed, 17 Jul 2024 11:57:06 -0700 (PDT)
Received: from localhost (dhcp-141-239-149-160.hawaiiantel.net. [141.239.149.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bc52bbcsm78305985ad.291.2024.07.17.11.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 11:57:05 -0700 (PDT)
Date: Wed, 17 Jul 2024 08:57:04 -1000
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
Message-ID: <ZpgUAJn-ypO-0JZg@slm.duckdns.org>
References: <Zpbify32lel9J-5I@slm.duckdns.org>
 <c5bcbcbaeacdb805adc75c26f92ec69f26ad7706.camel@mediatek.com>
 <5560c690cc6de67139a9b2e45c7a11938b70fc58.camel@mediatek.com>
 <1b19b68adb34410bf6dc8fd3f50e4b82c1a014e4.camel@mediatek.com>
 <Zpf3ks2drDZ7ULTa@slm.duckdns.org>
 <f448f66b-7a91-4281-8f77-159541cbacff@redhat.com>
 <ZpgB9kCAxAAXAtSi@slm.duckdns.org>
 <134fc34c-10b8-4d00-aaca-8285efce9899@redhat.com>
 <ZpgMajKn2O521H2s@slm.duckdns.org>
 <48fa8bc9-9f8d-4406-9137-88a555883ea2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <48fa8bc9-9f8d-4406-9137-88a555883ea2@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_115707_399794_06B7EF01 
X-CRM114-Status: UNSURE (   7.02  )
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

On Wed, Jul 17, 2024 at 02:55:37PM -0400, Waiman Long wrote:
> I was wrong about __blkcg_rstat_flush(). Right, the main updater of
> iostat_cpu is  blk_cgroup_bio_start(). We do need to drop down some comment
> on what is protected by u64_sync and what is by blkg_stat_lock though. It
> can be confusing.

Oh yeah, definitely. It is confusing.

-- 
tejun

