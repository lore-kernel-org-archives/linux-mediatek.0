Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3A7C2BD09
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jul 2024 18:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qiT8ueAJ+Ik9eGxQHnzcsayjjgwYfS8TKbVcB1sjgcI=; b=Vd0OLG2DKTkoDmn5OE4NbkYk03
	qvJMZLuu1QfmQGwwCUylstoRqEkvoPhJTeficAKTomvBVaAcAOrN1ojxt4FROsUspBcWsQOin2N1C
	QL6vEYxf8mE7Rchmoo2wKVk/8vCQjlP+yxPKkZXCD4DObvhKE9E3v4+TMPOCdHDpaEDqITMa4qaY9
	5zH6jAOMuLe/NO2PFqoQ0u/ue8kJfjJbPYPd1YUS2sQtCvivVjFsxP2oceI5+pJD37p2hN534KNLH
	u3h77laP/3Nes3+jyFrgkEOwk1ELzESn69ZIvCoqir4dIL9OZ9BqJ10iGkIsbse3ovPjbL3rWOSB6
	9z/5PdqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSLAZ-000000010If-1IUG;
	Fri, 12 Jul 2024 18:38:59 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSLAX-000000010IA-0wRI;
	Fri, 12 Jul 2024 18:38:58 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-70af5fbf0d5so1571647b3a.1;
        Fri, 12 Jul 2024 11:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720809536; x=1721414336; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qiT8ueAJ+Ik9eGxQHnzcsayjjgwYfS8TKbVcB1sjgcI=;
        b=Cn98sg6dAgMfa/rSjFqdYFtQzHo0YuoXJ79o2KmSNefmLBd/ENT6B0JNeCFZBKzv6d
         KwaVVE5wnX9qjbrZbqux3p61rJwXYLouH2Fncy/DmGtqfr/xsPlsipC6mqHUZxwr4wJC
         kfNUbZ1Dj97+GzUhC4AsSDZLfFfVCuUNvo09lheicrhRwXEMUOl3LzmGEGtlt0eZcEul
         hNr8pDIeTYQShEXR7CTvFXGd+Y2pniwez62fZ+RGllH81YTFnkmQD/44I6r4u4dddshQ
         lGqbpn37XSvB6DEpalRa5KDiUTZRYtG9mklfDj6PzLhekY4PjjqDnhsDa43PavXXs/UJ
         rppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720809536; x=1721414336;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qiT8ueAJ+Ik9eGxQHnzcsayjjgwYfS8TKbVcB1sjgcI=;
        b=KOW8CWGCz6lbl/f4cj2reoT9jM2BPnKwR3KME0BjUKbkDs3vT+wd4Kosy9FBUobHXu
         q/LyAuI8IeXK26zNa37DfIcr3u/D+flf6EalesqqIImHcprKLQhV6Kod4o3zePenYmYt
         Mq8XRh10m2bZoHjZNrH7YLxW8XlNBxFRPHvuNWHKEiF9QI4hm9hepTKZfDesOdny3N/u
         NOAZix8ZA195jlRYtEEGeFP6Z22U35rb7fkwnAggpbldgJKp9g2qxxHSAoTS9KpE/kQx
         w8TYvt0GZv6BKVp0zkhkb3S9e24cvHG55atpo3DE+BpD+ykM0Kl9Hped8VHtdUDG++iF
         t3gA==
X-Forwarded-Encrypted: i=1; AJvYcCVY7OWDmSBj/dBqZ4VyMGS8kQfbeqQ6/Xtt6pF59rTcv1v4VYFyDyuYiCOrIYovYYBISeo7W1ODkoboGJtCHTI6hMUA/psX7WWbfyqxZmw7k+muWomHXwr1KMrQjTkQuCPIFnUKCKH+Ib/JJP9wpJYWIJ8y2UN6p6o=
X-Gm-Message-State: AOJu0YxB6Rglf23urlH8aF8XQcr7GEQeOfijhRcuSxBCCYo0+g+kJRnz
	ZfNBoMD6VyjuKjsBx4O1ZUzCCi+lSXoEzHTW1t7yuQuQ3HK6WCm0
X-Google-Smtp-Source: AGHT+IFo66xx+y6LX4NUko0NsUUhq/bMv8PhKj0aFdyuHdHX7Sc3p1A2XaQYMv6PApWMzwZOr8BxNA==
X-Received: by 2002:a05:6a00:1acc:b0:704:2516:8d17 with SMTP id d2e1a72fcca58-70b6c8b282emr6137659b3a.8.1720809535678;
        Fri, 12 Jul 2024 11:38:55 -0700 (PDT)
Received: from localhost (dhcp-141-239-149-160.hawaiiantel.net. [141.239.149.160])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-787089bc5f6sm2638479a12.92.2024.07.12.11.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 11:38:55 -0700 (PDT)
Date: Fri, 12 Jul 2024 08:38:53 -1000
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
Subject: Re: [PATCH v2] blk-cgroup: Replace u64_sync with blkg_stat_lock for
 stats update
Message-ID: <ZpF4Pfu83W9Wp_R9@slm.duckdns.org>
References: <20240710061334.1888-1-boy.wu@mediatek.com>
 <Zo8HTD2AD-b51q0C@slm.duckdns.org>
 <6114fbad7bce9b15806bb9fee25a1075ecb53dd1.camel@mediatek.com>
 <ZpBIfwThiVwstlXL@slm.duckdns.org>
 <70c37035f006de3a4fde895ceeee92826cd280e0.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <70c37035f006de3a4fde895ceeee92826cd280e0.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_113857_284525_1B898E43 
X-CRM114-Status: GOOD (  13.92  )
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

On Fri, Jul 12, 2024 at 01:39:51AM +0000, Boy Wu (吳勃誼) wrote:
...
> I agree, but for multiple updaters, we not only need a spin lock but
> also need u64_sync for 32bit SMP systems because u64_stats_fetch is not
> protected by the spin lock blkg_stat_lock. If removing u64 sync, then
> one CPU fetches data while another CPU is updating, may get a 64 bits
> data with only 32 bits updated, while the other 32 bits are not updated
> yet. We can see that blkcg_iostats_update is protected by both u64_sync
> and the spin lock blkg_stat_lock in __blkcg_rstat_flush.
> Thus, I think we should keep the u64_sync and just add the spin
> lock blkg_stat_lock, not replace u64_sync with the spin lock.

I don't get it. The only reader of blkg->iostat is blkcg_print_one_stat().
It can just grab the same spin lock that the updaters use, right? Why do we
also need u64_sync for blkg->iostat?

Thanks.

-- 
tejun

