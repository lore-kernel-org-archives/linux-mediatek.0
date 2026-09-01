Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567EDC624D4
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2026 14:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HxeaBvDlKAqKYcHDBk+Xfrsk7n+I0JQxkCoAoHuqNkY=; b=EIKUHbO3BHIVifIvUwvDOfdlj1
	gFg0G8MaDlgBV8C5BfU2IflfMAItv8bFg5SoliRYfB0cxQXbMjFPUf1LGK6LkrYNTt/w1T3YMSbjq
	spdBaZ0nxwSKTS320nXvQAgh6UU//S7EF7Utyo2ceUGE4qcOKfGExDM8Mp2WBK85x5ORFLjLdYHiu
	scRa9snboF6aVjHz8/x6GYcEvdfxy6to0Z/DegcPSLzTVlvzsbk+SeUHacena4P6AnSu3x2CWqE6h
	R1cwn/GuxFsa3Rhy0cuZDrX2tBaHFwa+AxnnJw2ZDT8eiH3svjHtx22mhON3wTgdmSxaZe8Rf3IqS
	gVvV9dhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1PCc-0000000CJ1S-2yS8;
	Tue, 01 Sep 2026 14:11:06 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1PCa-0000000CJ0n-1pxi
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Sep 2026 14:11:05 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-81f3b227a4aso12200807b3.1
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Sep 2026 07:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788271862; x=1788876662; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HxeaBvDlKAqKYcHDBk+Xfrsk7n+I0JQxkCoAoHuqNkY=;
        b=JLpqrPZj1es72+EFzP/s/2sqJl6y1NHE/nhBHVl4gew6y70bm4bE1jb3Bjdoa68q/v
         tlz1scu0ef+4Yl3/Yi79mSYnODfWOkdbzxwSc+26rckeThUnwnBStnPOU+kcNAMAFQ4t
         JhqFtWFOhBPaRLx5tPSi7Lq1w1dnDTWTFkeKmrlkD1mMlnvZmtt41xc3UVb3G6IkeQym
         JWLwT2O9JqsVKvKaBkPmLz92YgtsMExSPS76UzkPtXtcYeE5tnB5CCYFuSUAzd2hNNHB
         KRWIqyMQItMUK9W/y/IOav1XGC6u8ik0WypFkDDJ3Rfm4pR66X6eeJpuMwvZ7ATw86/t
         wP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788271862; x=1788876662;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HxeaBvDlKAqKYcHDBk+Xfrsk7n+I0JQxkCoAoHuqNkY=;
        b=IMaMLX6WAbQiX8aAIwXIIWpg5QDkA6ROomS/XaK2Ifasl3gJpHuUtDGZIBt0G4je1f
         /M8gx59tGAY3SGlNxNkA8A2alu6z/sMaXz5pvB92ZA6Gif/7Ex7wQFsBvML9s7BZeexw
         OAk1uuR5SMVObP4XfXRAfZJX8sW8/OezMLUrYLiNxlFx5FvGNUgtAOYlHb5r6FLA51b7
         422tt82Mhe/9RTquDwgPDxkVup4TRUXeHnqJ/wa2WTeK2oObWqOrzmBOxKMSD0YJHmGb
         G16RozAsX2l64uoN0OMm9AiIqpTnIVf571K1368ukUaj947JtvNzLMXkC1cT5EVKSff4
         RA8Q==
X-Forwarded-Encrypted: i=1; AKwUvBx5B0+sUAyQPkxg1eCSte1kBVL6HzqTcC4OzaVsYrvkwxqPXk6qPNhpUkJkcMqGPX4l/Pwjzr+aB2DBgvDODA==@lists.infradead.org
X-Gm-Message-State: AFuF++lGyaYmSkfY5wxzGVKfAXJr8w2KZo/+EkUs7J6hnFIQNQX4mAbq
	TPGqUcLQ/kVaXUDxBVDYLWviUtg6hz82dZjfT9JVe1e6V438yFHkTBjq
X-Gm-Gg: AYBFou2YCVTwey7OvydmH3Gjjxg3SnCWyRwlo0GrVIaYHe95yBh0q5m+nShG9MLqSyg
	qivEiwvCcQsHGYxwJpVSFt70aMTTOmWyw75hQv12p5hUO1EB6HPzw/UlCzcdjCuxncBAf3HiJQC
	9hYyQiuu/EpmUsQ0yecVxlYgifOKGzXWmMfN/zgc3pEA6rwTI1F/3YptJgWmSrqN5tfoaDHPMJ5
	7SWcVMq742WF1FEKWg/drRYhDYBLbw/z/58QOtZ0bJIIM6M1CGA/M2M0jfpTCa4Av0HTwWqP8RI
	4L6phqNBPnpVOJJhI9yi99NCSwF0jvg1fWRfe5uJEv+aKbsnx9FXg43hm4QmqDF4M7+XO0Ishcw
	+tB8IbE8zVwbO8IpssYZTq9IY7St54yHa2iWnzTp8S7sc5eZfb6deVusnCPBIJQ9lunn9A3JygD
	lsO1xOosIT2C2FxquYaM8MSKJ06cB+Nrxq0RRcDYGHbvFwhNVxGAEcgUrnk3MwEKoBzVLbaGqqa
	7W24D8SzJwysTznFbFytyMxercrgfpoQ0Y/dYiXVg==
X-Received: by 2002:a05:690c:386:b0:855:2d6d:2db5 with SMTP id 00721157ae682-85d69e03e9cmr131893827b3.12.1788271861366;
        Tue, 01 Sep 2026 07:11:01 -0700 (PDT)
Received: from gmail.com (234.207.85.34.bc.googleusercontent.com. [34.85.207.234])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e65f146edsm76395397b3.32.2026.09.01.07.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:11:00 -0700 (PDT)
Date: Tue, 01 Sep 2026 10:11:00 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: zhaoping.shu@mediatek.com, 
 edumazet@google.com, 
 ncardwell@google.com, 
 kuniyu@google.com, 
 davem@davemloft.net, 
 kuba@kernel.org, 
 pabeni@redhat.com, 
 horms@kernel.org, 
 matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, 
 dsahern@kernel.org, 
 willemb@google.com, 
 netdev@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
Cc: haijun.liu@mediatek.com, 
 xiayu.zhang@mediatek.com, 
 lambert.wang@mediatek.com, 
 Iven.Yang@mediatek.com, 
 nbd@nbd.name, 
 HW He <hw.he@mediatek.com>, 
 Zhaoping Shu <zhaoping.shu@mediatek.com>
Message-ID: <willemdebruijn.kernel.4214410e062b@gmail.com>
In-Reply-To: <20260901082312.14596-1-zhaoping.shu@mediatek.com>
References: <20260901082312.14596-1-zhaoping.shu@mediatek.com>
Subject: Re: [PATCH net v5] net: gro: Fix nesting of TCP GSO SKBs in
 skb_gro_receive_list()
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_071104_489538_811E065D 
X-CRM114-Status: GOOD (  15.04  )
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

zhaoping.shu@ wrote:
> From: HW He <hw.he@mediatek.com>
> 
> Fraglist GRO and hardware GRO can create an fraglist of
> HW-GRO packets. This cannot be segmented back into
> the original form on TCP tethering scenario.
> 
> Avoid constructing such a GSO packet, by flushing an already
> built fraglist GRO packet if a hardware GRO packet arrives.
> 
> Scenario (Tethering/Forwarding):
> 1.Driver submits a single TCP packet, P1. P1 is kept in the
> gro_list as the first packet.
> 
> 2. The driver submits a TCP GSO skb, P2. P2 has already aggregated
> multiple TCP packets by HW_GRO, and its non-linear data is stored in
> frags[].
> 
> 3. P1 and P2 match the GRO rules, and since there is no local socket,
> they are aggregated by skb_gro_receive_list(). The resulting skb,
> P3, has a frag_list entry that still contains frags[]:
> P3: [ Linear Data ] -> frag_list -> [ Linear Data ]
>                                     [ frag[1] ]
>                                     [ frag[2] ]
>                                     ...
> 4. Later, tcp4_gso_segment() or tcp6_gso_segment() calls
> skb_segment_list() to segment P3. However, skb_segment_list() only
> segments the entries in frag_list. It does not segment the frags[]
> inside P2, so P3 is not restored to the original packets, which leads
> to IP fragmentation or packet drop in the following path.
> 
> Check skb_is_gso(skb) and current GRO method, make sure fraglist GRO
> applies to consecutive non-GSO skb, others adopt regular GRO path.
> 
> Fixes: 8d95dc474f85 ("net: add code for TCP fraglist GRO")
> Signed-off-by: Zhaoping Shu <zhaoping.shu@mediatek.com>
> Signed-off-by: HW He <hw.he@mediatek.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>

