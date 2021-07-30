Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95120C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 17:39:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52D9F60EB7
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 17:39:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 52D9F60EB7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1OhDfn4CXmI1KEDSy1ltl75WvpOLsGccpFehjd2HGzA=; b=P8SJ2znAbvDU4A
	m0UfvF4lEyl4D2tjXY51lIUnv4spp8Zsw5z8aWMWXYAg1hI7cMS6ySW9b71zmSWupPZtw2u/VcQoz
	HukcEqDj1Eia0xlUwV5o0emEJRpyZN5msrvNboIgIJcJqPRUDM11f+2NzRAUplSVzp757uthD+SA/
	BZTMZA7vfj4KqbHZpRC8yFSjpyO0iSydDSTRL7hSwDpXOfdClz3ZqzWP8/q1joGDd63c6aqYxabbi
	SAD9vXLh3mt3UQsRIA71sHsQwI/cfbLQUB3NOpWLat7Rrjy5xGTlGdpeJqEeTuUQIHukUNZwLene7
	8OSgeuAeETtkBfDIr22A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9WTt-009ifX-KJ; Fri, 30 Jul 2021 17:39:33 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9WTf-009iaO-Em; Fri, 30 Jul 2021 17:39:20 +0000
Received: by mail-ej1-x62e.google.com with SMTP id nd39so18171599ejc.5;
 Fri, 30 Jul 2021 10:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rLir4FWjvOp6ZJf+cfDSNyFMYsW5UypVa5Nv92w1F70=;
 b=MAJGdguNvpPgy1tNMEq8I/UA3VztX5ISiW9NO7tWm6lmm2BNH9IZYEwE8DZK1XP9BQ
 2nupAb0ChgKGyhlqvUiJD8ppQGd4sYA3V4F2dMRXWs0tUMNMYsrdd5KmyVZ115teX52w
 zJrxGie4O0qL2RLzKADXuq7I31OTLJLoA5ucT2uJa1/PANbfcl67joxrQImy5HNNe8cq
 CYjGqT3hb0tcbVIOrd/owvLrHlYmUVQE6IVRAq7JAAc93/8gCZBxsJ8XcGychuvQ1yV6
 LOL37mlhXA8Od/mzZ4fyB4PdmsrTftEXLyW/WUX+4rYmuhNz0U/2IkNfm8JVOTvys6fW
 Os6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rLir4FWjvOp6ZJf+cfDSNyFMYsW5UypVa5Nv92w1F70=;
 b=Uo9N9pGJx8LUQTtwYicnan8zwTUgCA8Oxc8kKYQ9AtI1bpZp7DQ0+roPkAd+cg78ZO
 X9yap58UN91EovNYcIZp5ppGUKQPxyO3T1wnXAiaffP2PkXnTFdM314vzIhavjqjIGC8
 ZRSRnRp6YsEAorKmcSgACC4XqmXoaUnTTzI30ThgiIFn//PZh0doz8ptwmhLXOaSuCz/
 88pK08YsQH4fileLNgXM/H8Iym64r88fEhFVXsz2y49Jw5Oq6SAPSnAzpskxDsfqzvoC
 hWfMHDq7rJHBA67Erlrux2ycA2SeRW9PFO/Bz1Af8/Q+m00VEmXz15RMkKM+gZCGBh8u
 tLBQ==
X-Gm-Message-State: AOAM530EVvdNQzgoRoZt9PDLB0Gn0InpkYnfp/FGh+L70jskXNLKbE0g
 MQH2hCLBi/Ob7ftgjEy1YMQ=
X-Google-Smtp-Source: ABdhPJyMG0+p7JQgo8gwHHSpkpQyBLmzs3tjsdlTyDsl3fj9i3VhlEWin5b66qk2eHuHcPTAx+OYQA==
X-Received: by 2002:a17:906:9c84:: with SMTP id
 fj4mr3591329ejc.274.1627666744344; 
 Fri, 30 Jul 2021 10:39:04 -0700 (PDT)
Received: from skbuf ([82.76.66.29])
 by smtp.gmail.com with ESMTPSA id s3sm792678ejm.49.2021.07.30.10.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 10:39:04 -0700 (PDT)
Date: Fri, 30 Jul 2021 20:39:02 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC net-next 1/2] net: dsa: tag_mtk: skip address learning on
 transmit to standalone ports
Message-ID: <20210730173902.vezop3n55bk63o6f@skbuf>
References: <20210728175327.1150120-1-dqfext@gmail.com>
 <20210728175327.1150120-2-dqfext@gmail.com>
 <20210728183705.4gea64qlbe64kkpl@skbuf>
 <20210730162403.p2dnwvwwgsxttomg@skbuf>
 <20210730173203.518307-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210730173203.518307-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_103919_541797_C8F8D014 
X-CRM114-Status: GOOD (  17.42  )
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

On Sat, Jul 31, 2021 at 01:32:03AM +0800, DENG Qingfang wrote:
> On Fri, Jul 30, 2021 at 07:24:03PM +0300, Vladimir Oltean wrote:
> > Considering that you also have the option of setting
> > ds->assisted_learning_on_cpu_port = true and this will have less false
> > positives, what are the reasons why you did not choose that approach?
> 
> You're right. Hardware learning on CPU port does have some limitations.
> 
> I have been testing a multi CPU ports patch, and assisted learning has
> to be used, because FDB entries should be installed like multicast
> ones, which point to all CPU ports.

Ah, mt7530 is one of the switches which has multiple CPU ports, I had
forgotten that. In that case, then static FDB entries are pretty much
the only way to go indeed.

I am going to send a patch series soon to convert sja1105 to assisted
learning too. It doesn't support multiple CPU ports, and it does have
hardware learning on the CPU port, but it can be arranged in cross-chip
topologies where each switch has its own CPU port, so from DSA's
perspective, it is as though we are dealing with a multi-CPU port switch
(the DSA tree does have multiple CPUs, in fact).  I have been
obsessively testing this configuration for the past few weeks and I
think the assisted learning functionality works fairly well by now.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
