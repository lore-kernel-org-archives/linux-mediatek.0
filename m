Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25BD0CD1284
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Apr 2024 14:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zVyUlV+3sDAiGX1EZuWoigVBp+zRmpt7JVsfIU0B7GI=; b=vrmS+cUbjFxu92RSok9e/XyaPv
	vDJcksTsJM0x6HilAqRMI2ET6HBLsKlBOkdw2ol5CXcMa1oRVzqtLXbkqwGNDDeypb0tDfOICrRNu
	8ye+Iwe5rWX6KAVvV+ja4EnjpoFAJMwTlUyjifyuzlteT1dK7Mh5AkH+h+tVeWwashtFeOgyTU7bt
	33UoqaE6GCTZWDUXBBgcBhLaMMAtPuXq3+elg3dn+M0mrtZHAhrCefrVLPlxSTXoEg9Kvc61L5rS+
	s6i7GydEhyZoxdNrIM9fQPyCAAkW7BGc3o8i+HlXzuwlwZbZzIbjzitQ8Il5dxiAskQneY/iyfc+3
	zR/CC1/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsNz8-000000030di-0lYy;
	Thu, 04 Apr 2024 14:22:34 +0000
Received: from mail-ej1-f51.google.com ([209.85.218.51])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsNz3-000000030Wg-3si2;
	Thu, 04 Apr 2024 14:22:31 +0000
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a51969e780eso40960566b.3;
        Thu, 04 Apr 2024 07:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712240526; x=1712845326;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zVyUlV+3sDAiGX1EZuWoigVBp+zRmpt7JVsfIU0B7GI=;
        b=byRMDgA/JtT5O4W0SyyN9CBpkDb3EQ/O/HyZ9OzDCCMOCD/Te9OG4snLfCV1uVCXtM
         04azllSjAgMP/8kfafSHh3d1dlFDWRhE5IqNfpG9nQItfACQGePxhzSsWhsYRXRgybQa
         K5VpQSp3IpVxx8P5oHiChlZQ0DykYAHTBq7y4M66Z2dwOVXP8dgzWQYYgxvTa5dzmgko
         gVhfzMaOJlpoLDvVS6vZkW3QB49pVu9vDvz1h1ZH41pKzED1rEtg0GwSlltsnC789X6l
         vnCI20OawgzYfUXliBR+fin+/H91EgVOYwa+KolJG4YVv85jqxEnwQyh0JQm+qSBHMAU
         D8zw==
X-Forwarded-Encrypted: i=1; AJvYcCWA19ZlGU27JBr4PWI6ajZOU8Q9/le1fBZfkgnPM5yZ9CZfNW15Fw9k5EEsKkz79hYsnaAuIAp4rJT36UutuIf04O4staTJUlXS1QC+edJ4KIx3VSAEoudaeDXt/VRizJtN9EpBmVbN9HH2TzZdlf7+6HJTnJzVtm0=
X-Gm-Message-State: AOJu0YwsfwZ6vXsTzebld7aI0/mzghAiYOVjMeheFySW7hMmehkm4te1
	BdQwf1CYoJ5F1ZBQj42extmt745cpj76gLUD6MK3yyd82H26yBL5
X-Google-Smtp-Source: AGHT+IFEAzsGI4DJHhKL+bYgqHldQtzLWBNbrwkKIk9EHS3URioNQOJVyi4uwzCL2HY+yQHKnE8VLg==
X-Received: by 2002:a17:906:a208:b0:a50:9190:b751 with SMTP id r8-20020a170906a20800b00a509190b751mr1908287ejy.10.1712240526426;
        Thu, 04 Apr 2024 07:22:06 -0700 (PDT)
Received: from gmail.com (fwdproxy-lla-120.fbsv.net. [2a03:2880:30ff:78::face:b00c])
        by smtp.gmail.com with ESMTPSA id jw19-20020a170906e95300b00a4e26dfc7fdsm8738908ejb.29.2024.04.04.07.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 07:22:06 -0700 (PDT)
Date: Thu, 4 Apr 2024 07:22:03 -0700
From: Breno Leitao <leitao@debian.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: aleksander.lobakin@intel.com, kuba@kernel.org, davem@davemloft.net,
	pabeni@redhat.com, edumazet@google.com, elder@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, nbd@nbd.name,
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	lorenzo@kernel.org, taras.chornyi@plvision.eu,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	quic_jjohnson@quicinc.com, leon@kernel.org,
	dennis.dalessandro@cornelisnetworks.com,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	bpf@vger.kernel.org
Subject: Re: [PATCH net-next v3 0/5] allocate dummy device dynamically
Message-ID: <Zg63iwvtTMlZSGcd@gmail.com>
References: <20240404114854.2498663-1-leitao@debian.org>
 <87plv549ts.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87plv549ts.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_072229_992891_03461229 
X-CRM114-Status: GOOD (  17.95  )
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

Hello Kalle,

On Thu, Apr 04, 2024 at 02:59:59PM +0300, Kalle Valo wrote:
> Breno Leitao <leitao@debian.org> writes:
> 
> > struct net_device shouldn't be embedded into any structure, instead,
> > the owner should use the private space to embed their state into
> > net_device.
> >
> > But, in some cases the net_device is embedded inside the private
> > structure, which blocks the usage of zero-length arrays inside
> > net_device.
> >
> > Create a helper to allocate a dummy device at dynamically runtime, and
> > move the Ethernet devices to use it, instead of embedding the dummy
> > device inside the private structure.
> >
> > This fixes all the network cases except for wireless drivers.
> >
> > PS: Due to lack of hardware, unfortunately all these patches are
> > compiled tested only.
> 
> BTW if it helps, and if you have an ath10k or ath11k patch already, I
> can run a quick test on real hardware.

That would be very much appreciated! Thanks!

I don't have them ready yet, but, I will work on them soon and I will
send it to you probably tomorrow.

Should I send them as RFC, or as a regular patch, and we iterate over?
What would you prefer?

Thanks!

