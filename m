Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2848CC3DA5D
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jul 2024 01:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y4ozxE+CESJqEyygZCUvpW9+U/UE2rBQc20tR/KurlY=; b=lZkis5K/ZLccdhIpqa+mNH5Z2s
	vFwDPfA0NPyVESNkoL1dQyq+xWiRbwUtTYp+g51na5g7Abh4kM+LW+7QZx49KBTekuo/xJUUDMWNX
	UWl6Qg1Y9Q6dnLinCgKQGzku9inozK2nTyis9nZeqzxQlyGIeJOxC1EDAFQ5Dhxo456JJLb09gwYy
	9zr+SfLJIIdYRxntwqtkVUqpHRdE2l6XE14omKemisd/q75yiFwDQXGOnKvhJhRNISFBB4u8f4HlC
	Gvkihknh1gErXlUziC2Ja3J8ADBLqB9xN8JjCN5WuX0PReWgHstwrbDImZ4bSLQiBIjSpOsJKsE/a
	s7cbMfsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUFvy-0000000FPvJ-1UEL;
	Thu, 18 Jul 2024 01:27:50 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUFvu-0000000FPti-2bvP;
	Thu, 18 Jul 2024 01:27:48 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1fc49c1f3e5so2910905ad.1;
        Wed, 17 Jul 2024 18:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721266065; x=1721870865; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y4ozxE+CESJqEyygZCUvpW9+U/UE2rBQc20tR/KurlY=;
        b=nWiDyAUCnj/W0O0yjPPjRYmHOBguw9+ZTug+um2byKXwD4Ya60HusYGaOZFvatwBtp
         PQPeFjkXEVTGWWfLLQE1FqG45gOC1cU8E5CH9BuUR1jqunf99TXz4ywLK0Nm9FcUDw3I
         PWB7jRsgj8QAssFZiqOwDqImx1N0Lclup4cwAgrNmXZuDtTyImpuF0Pt9EHxR7KyZ34K
         +J6uIFachqT4z6f+hsaWfa6SmOO0oM6KNROXgh42PlWmgywg/TPPLLPQfUxgFIIQFLsa
         BC4zO4sFK53+Jke92vDxY0vzEUtkAbak3SeI0DhepKQK4OZDpMnjJPhuuV9gAvgFm1+y
         SeJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721266065; x=1721870865;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4ozxE+CESJqEyygZCUvpW9+U/UE2rBQc20tR/KurlY=;
        b=Pp1NyK1yS6Yyc5ZOrp1NMQUlwQZqfkGBtNVtXLFpg0+riMWsRIeWG3fCGom9+wo8FX
         Ixqwt78Y/yx+Em4J5h4/MXSjBA0Y1kHeaQBZ6Qo6gCZkxRzG9rvys8m2IBJxp9bGprdw
         +6BiRM14WD8ZSocnYaDbB3bb5x0MkU0bnRaCydppO2Dt0u/gGJ9KMkIKaGX3AjDmXca7
         GlbQxI+2NcM94koYKrpRnQY2z5Ey4hVQW6Wnk+odbQnTPUt48CneMM+a5ji7VBPAXf1b
         8i6ZtJKEkpfedKLC6Xk33C2Z5zKBqIy2kFps7/QErkGLib6yFOyh12t0/caUYyfvTgyY
         KhwQ==
X-Forwarded-Encrypted: i=1; AJvYcCURQuY9PD88BqvlcKfoTIucRIl5yF465DtSubEmlCv+NWVghR3DkaeAOmKmcvsm4SLM6aWIhOMrQO0tsO69V10A3b0IIybCMozCuj+k9Z8IBs9xPtMPe4nGpB6DZ+hs4z/Wi1w0aJT8nglPf5XLwGXttZQR6PxNtu8=
X-Gm-Message-State: AOJu0YyYDd0WFYndMdTDNBpT7a3Q8unkpbCoB3wgoe3oFKCMGozM2Q39
	Y+3GWrd1TQgY6EM3ebIm8IV6kL7zvJ/jGtS/kUvB8TX5I+x05v6s/VsK7g==
X-Google-Smtp-Source: AGHT+IGFzhGd/HPG0T+63S0zeLibabNl6AfaM7YtnEYUXk0y2kUd+9RFKrltbxyfxtzY5ZszEYEhRA==
X-Received: by 2002:a17:902:d511:b0:1fb:8f62:a7bc with SMTP id d9443c01a7336-1fc4e571fdemr32851955ad.52.1721266064946;
        Wed, 17 Jul 2024 18:27:44 -0700 (PDT)
Received: from localhost (dhcp-141-239-149-160.hawaiiantel.net. [141.239.149.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bc4656dsm81461375ad.258.2024.07.17.18.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 18:27:44 -0700 (PDT)
Date: Wed, 17 Jul 2024 15:27:43 -1000
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
Subject: Re: [PATCH v3] blk-cgroup: Replace u64 sync with spinlock for iostat
 update
Message-ID: <Zphvj1kXK2xcKj7J@slm.duckdns.org>
References: <20240716075206.23121-1-boy.wu@mediatek.com>
 <Zpbify32lel9J-5I@slm.duckdns.org>
 <c5bcbcbaeacdb805adc75c26f92ec69f26ad7706.camel@mediatek.com>
 <5560c690cc6de67139a9b2e45c7a11938b70fc58.camel@mediatek.com>
 <1b19b68adb34410bf6dc8fd3f50e4b82c1a014e4.camel@mediatek.com>
 <Zpf3ks2drDZ7ULTa@slm.duckdns.org>
 <99af713e187a92f0501482e8344be469f1b3e454.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <99af713e187a92f0501482e8344be469f1b3e454.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_182746_688008_B8D44DF7 
X-CRM114-Status: GOOD (  10.33  )
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

Hello,

On Thu, Jul 18, 2024 at 01:21:32AM +0000, Boy Wu (吳勃誼) wrote:
...
> I think this will work, but as I mentioned before, this issue is only
> on 32 bit SMP systems. Replacing u64 sync with spinlock will increase
> overhead on 64 bit systems, because u64 sync does nothing on 64 bit
> systems. However, if it is acceptable, we can proceed with this
> solution.

We can encapsulate the spinlock in some helpers and make them conditional on
32bit. However, the u64_sync -> spinlock conversions in the suggested patch
are all on cold paths, so I doubt it'd be all that noticeable especially
given that the hottest path of them all is already grabbing blkg_stat_lock,
but either way is fine by me.

Thanks.

-- 
tejun

