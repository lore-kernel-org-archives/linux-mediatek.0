Return-Path: <SRS0=zgIi=NR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 237E0C432BE
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Aug 2021 15:28:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E215061038
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Aug 2021 15:28:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E215061038
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EGWdSszpztyhBw2muyY+A28uqEH2KIOfyeYjqcQc8Ws=; b=kkQJaDBn7AFmlP
	7ar8olZ88YFOP49/q5nmE8jQa78Z/9/beTiLP3Q3SGloOe/N47g1/fNMIh1Bt75bo32LYpqGBjfGW
	dsHKzhovFeZpwjMS461qV9YtDeMG63xmcCdM1nJYTd5ruQUTRL/jdGPb4sI9pO/Pn8JuJNUzoZO+u
	Sjq2UbPJJ7pcjgoDcXkAKnoq9AdcsYFLLzCvejghCnYBbQOlUppjFCwwV832jGnafRzlANZmfyXEg
	D2wzfR/VcnOQDkiqS6Z9v25/TFREufyYCgbDfOMRnpXtUpu9IoocSJi1pKHybwHEXEWoie+g+Gpok
	0WAqaROcrN8S/O+U0wiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJHIP-00ATyC-EX; Thu, 26 Aug 2021 15:28:01 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJHIC-00ATwG-6o; Thu, 26 Aug 2021 15:27:49 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 u11-20020a17090adb4b00b00181668a56d6so2616054pjx.5; 
 Thu, 26 Aug 2021 08:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-disposition:content-transfer-encoding;
 bh=EsDDLFruXfgXRGBZ4psfYrG5xfY4R6rx1WaKqay82xg=;
 b=SYQ4w04r1YPinHAM+T4jRVRpPJhOSpjnJjngD6fmvJjfkVUqfvsuS7U5XuB35Mzg9Y
 j5GCZ0QXaN/xzJTwfmx5CgXnJQTMn88R318UQg45dsQutt4Vp0TDIJZiU6qBWH+wePi3
 gC2l/trUQ4rgzP8l90aKAg+HNpagV4/XNd9685pxUq4AWmLv7rDo3/U0kKUD/421Tdl8
 IFsMF60TponD8ZnQk60fjZneakmVnnT4p580IIvFzR7Hoat/JW9Yz49P5o6iCOfCs6Jm
 EqTFFIgVCniovO+cAhLAt+GVlzwmwZbi8wgQfD976yC9wCxHPPMei3pUcrqKAAf09nLi
 ki/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding;
 bh=EsDDLFruXfgXRGBZ4psfYrG5xfY4R6rx1WaKqay82xg=;
 b=II+zbqgBQlwWxUqVPQAPXony0LRECwM807wbHjjTonaZ5yU/KCv0gBQfH1EylQjhTi
 vfuJcKSlN9UCxM+dfUg84gtytQpmGmrBfJjBHmHN/0CscKMvUMN4IMDhXYLYBFYxnwN6
 coARhZPLHqTJdHHYb4CbOGNs0zsRxgtBg1c2IW2YSWPL+OHQAuGOTk9N4XaxRKWf8KDw
 6xK8cPivu5MwMqyEWw96MzTxUBmMjQufaTSNAj+oyCbftiYI1MxeS5sCJ8Fsu0a4MdvG
 qLa9QnwbtL1C7d/iiOhnXjylApVIy57vsMdF3r+OwotFDmaplz1g75iTxjTt1cvMZw+p
 clDg==
X-Gm-Message-State: AOAM531wbRBStsV6AT2+sTMGTuJ8ymhNKyEOfu5C5RurqRxhnD8ufvgk
 pfqOvCc6GM7MaEgn/ZQfZwE=
X-Google-Smtp-Source: ABdhPJzgulZo1l4aidr56hzMH6tvcn7ua9S8kOn5bpUgwTIF5YUsvQDRBUxw2ie25n0kV5INj6CX0Q==
X-Received: by 2002:a17:90a:bb0b:: with SMTP id
 u11mr17402574pjr.18.1629991666283; 
 Thu, 26 Aug 2021 08:27:46 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id e21sm1505066pfl.188.2021.08.26.08.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 08:27:45 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC net-next 2/2] net: dsa: tag_mtk: handle VLAN tag insertion
 on TX
Date: Thu, 26 Aug 2021 23:27:37 +0800
Message-Id: <20210826152737.3280662-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210826141326.xa52776uh3r3jpg4@skbuf>
References: <20210825083832.2425886-1-dqfext@gmail.com>
 <20210825083832.2425886-3-dqfext@gmail.com>
 <20210826000349.q3s5gjuworxtbcna@skbuf>
 <20210826052956.3101243-1-dqfext@gmail.com>
 <20210826141326.xa52776uh3r3jpg4@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_082748_310665_225284E6 
X-CRM114-Status: GOOD (  19.21  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Aug 26, 2021 at 05:13:26PM +0300, Vladimir Oltean wrote:
> On Thu, Aug 26, 2021 at 01:29:56PM +0800, DENG Qingfang wrote:
> > 
> > The comment says the VLAN tag need to be combined with the special tag in
> > order to perform VLAN table lookup,
> 
> It does say this.
> 
> > so we can set its destination port vector to all zeroes and the switch
> > will forward it like a data frame (TX forward offload),
> 
> And it does not say this. So this is supported after all with mt7530?
> Are you looking to add support for that?

I already run-tested that, it works, as long as there is only one bridge.

> 
> > but as we allow multiple bridges which are either VLAN-unaware or
> > VLAN-aware with the same VID, there is no way to determine the
> > destination bridge unless we maintain some VLAN translation mapping.
> 
> What does "VLAN translation mapping" mean, practically?

It's just VLAN remapping, as you stated below.

> Other drivers which cannot remap VIDs to internal VLANs just restrict a
> single VLAN-aware bridge, and potentially multiple VLAN-unaware ones.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
