Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56071CD1292
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Apr 2024 19:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p+CbQTA2iSYs41dobAl4Mn03s52UBZLR03o420g0nXE=; b=2FBltKXD1JEI/ODXj1Ph8xO13f
	TXGXNNpTVX7Kb6LBVuZP0aUkTp3mw1W3OOsC4eXVucffNcXjcT88+R5dINVrVWhtbNF9OiLWkgHfl
	KAeisDFu5kjm1JFwUWmwKJBLnnnv8d96xMbo36dOzojM/SafmtIdfpR0fY272ljaHAdcnJaVboOcJ
	A+cqAFnb+/Ot7/x2B6Xy4lKh/Opl36DEdfATsFlnmvHonxXqj1O1dI4GLsTGH6IzIgabbFsTVE2Ci
	XiQ+I613P06dhyUULMXFnHgoxwHc9hDRXlQgY829LsdPAwQRomtea8Yxf9zE8fIWvKVDL6rle3TrA
	j6pPcFkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsSNG-00000003xeB-2nge;
	Thu, 04 Apr 2024 19:03:46 +0000
Received: from mail-ed1-f46.google.com ([209.85.208.46])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsSNC-00000003xdF-2tQe;
	Thu, 04 Apr 2024 19:03:44 +0000
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-56e0e1d162bso1376446a12.1;
        Thu, 04 Apr 2024 12:03:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712257420; x=1712862220;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+CbQTA2iSYs41dobAl4Mn03s52UBZLR03o420g0nXE=;
        b=DyGbKVNJ01pAf08NUmzbbzsNHQp6haD5W+wtLKXGOuUzVMDaveR0vv5uuUf2Fw2ZLy
         worjq7AyswIgwRskemMZVKOUeIbPSE5MDS/rkhXvOZpXywfduXKT1jhctHkINiAg9I3J
         Y7nHEisv8nuVC98Ap2H0bXpEW1ZAFGeeqol/gvTpgzPIY1g2DHiYJYYQDUMLzNFDovpp
         kD+i+YdzcLqfQN7FPOgjkt8W/kn4YmOQmKQq62BJPyRmJZuvKpVIsixwHeExo+BF6UP/
         0+U0JuFUjpb9Shem4bVNMK7IhVKx38Pup+FYIHGqRJ4zZXxCIl5h69J5pSBe1NtM5etX
         //DA==
X-Forwarded-Encrypted: i=1; AJvYcCV9vN6tGQtczVSHQOLDDISGkpNmCvoUWQoE8wyu+P6VfPEw6+TtXc0bxdJ11MznLL0y0tawNFY73Ah07vl3psOpwjGiBIEa1tWi99azzOCTTIgq//+2txlKkHN/87CN4SN/fIXRmvKLhQ++taEgceMo1UDD78Drnhs=
X-Gm-Message-State: AOJu0YwkqNYu2hj7p7UDtmzWCQBwR0uYwwaRe8tW5HuLM+IGLECFRTkD
	4SWBtPj8XKmyMJLoTekzWTNXxkzJAxlf52R58SJHtEF4SEhFdfW/
X-Google-Smtp-Source: AGHT+IHmvFcFisUvqZnNo8wPKYtf8P8HNEXIVh2KGY7KWKzBSyC21xcVPnv1zgUB7h6HBBv0BS0kWA==
X-Received: by 2002:a17:907:10c2:b0:a4e:21e0:2e6e with SMTP id rv2-20020a17090710c200b00a4e21e02e6emr2104481ejb.5.1712257419825;
        Thu, 04 Apr 2024 12:03:39 -0700 (PDT)
Received: from gmail.com (fwdproxy-lla-005.fbsv.net. [2a03:2880:30ff:5::face:b00c])
        by smtp.gmail.com with ESMTPSA id q6-20020a170906388600b00a4576dd5a8csm9326341ejd.201.2024.04.04.12.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 12:03:39 -0700 (PDT)
Date: Thu, 4 Apr 2024 12:03:36 -0700
From: Breno Leitao <leitao@debian.org>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: kuba@kernel.org, davem@davemloft.net, pabeni@redhat.com,
	edumazet@google.com, elder@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, nbd@nbd.name,
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	lorenzo@kernel.org, taras.chornyi@plvision.eu,
	quic_jjohnson@quicinc.com, kvalo@kernel.org, leon@kernel.org,
	dennis.dalessandro@cornelisnetworks.com,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	bpf@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>,
	Simon Horman <horms@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH net-next v3 1/5] net: create a dummy net_device allocator
Message-ID: <Zg75iK8VtzZL9/G+@gmail.com>
References: <20240404114854.2498663-1-leitao@debian.org>
 <20240404114854.2498663-2-leitao@debian.org>
 <1b1dfe1f-57ed-416d-a9c0-408aafa69583@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b1dfe1f-57ed-416d-a9c0-408aafa69583@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_120342_965445_0074C20D 
X-CRM114-Status: GOOD (  17.13  )
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

Hello Alexander,

On Thu, Apr 04, 2024 at 06:40:33PM +0200, Alexander Lobakin wrote:
> > @@ -11063,6 +11070,17 @@ void free_netdev(struct net_device *dev)
> >  }
> >  EXPORT_SYMBOL(free_netdev);
> >  
> > +/**
> > + * alloc_netdev_dummy - Allocate and initialize a dummy net device.
> > + * @sizeof_priv: size of private data to allocate space for
> > + */
> > +struct net_device *alloc_netdev_dummy(int sizeof_priv)
> 
> Repeating my question from the previous thread: I see that in your
> series you always pass 0 as @sizeof_priv, does it make sense to have
> this argument or we can just pass 0 here to alloc_netdev() unconditionally?
> Drivers that have &net_device embedded can't have any private data there
> anyway.

Sorry, I answered you this question in the previous thread, and gave you an
example why we need the @sizeof_priv.

	https://lore.kernel.org/all/ZgWrcvKyAzDvl%2Fjn@gmail.com/

I didn't see any reply from you, so, I suppose you were OK with it, but
maybe you missed it?!

Anyway, let me paste what I've sent there here, so, we can continue the
discussion in this thread, which might make the reviewing process here.

This is what I wrote in the thread/message above:

  We need to have this private size for cases where we need to get the
pointer to their private structure given the dummy device.  In the
embedded case you can use container_of(), but, with a pointer to
net_device, that is not the case anymore, and we should use the dummy private
data pointer back to the private data.

For instance, see the example of iwlwifi:
https://lore.kernel.org/all/20240307174843.1719130-1-leitao@debian.org/

