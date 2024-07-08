Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C626C3271E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jul 2024 13:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a9KZem+hR+Ssu5sLJZQFJef/Bm0HGi/lC7YM1maoGyM=; b=F5Hh64RNTkjqM5u7rqNJcbz98D
	vZJYeXX2Xvxv6hdxF9DYkJRahIFDmGUAHON+dywe7Q8yrHWLwsk6TJaJwx5QPp4k+R1xoynzZtfly
	JyULzf3HJeAEXPN0AXYhUgWWvwiFBI/TSHmlH3gMX6wEbYvmf8y7kl6sRdXCXpcD7vpE3bkhHNGFs
	lio5QF4lQZvE0v9aw8KpG6q4S87K3QFiWjAvsgia2syEg5yU3FkB/n5bUaJ1rlslTXhA8PLu2ZlRC
	z5lrGKdlYsbapI23F9IVyaqby21rS5YQ8cU+nmehlGI89fHeDTBEHTSlXtV9Px/G5ybezyAlUqTOJ
	P2FHgMqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQoVi-00000003vfP-1PbH;
	Mon, 08 Jul 2024 13:34:30 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQoVJ-00000003vZB-1Un1;
	Mon, 08 Jul 2024 13:34:06 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2eeb1ba0481so2782941fa.2;
        Mon, 08 Jul 2024 06:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720445643; x=1721050443; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a9KZem+hR+Ssu5sLJZQFJef/Bm0HGi/lC7YM1maoGyM=;
        b=RhxnWFck3jwdgM/++Rred0wN+DOrcEHD4czNd1Ub9wW31s730f8D4ofhwplwvhxrkm
         dE5SR1UhyusDTxylbhGM9F3SQdspkukbYl9x4v3wUk318GAdZzMvDS2ns028DAY/7QVg
         e69ih5aoK1PXyHkeKyou5esKZI4X5+64FBJy1wLA9Yx+NTGpLLIzSrhQ8Vab7Nq6/0rO
         GC7qZvwJlF1JrpMV1Y3vehIubal8vwj/cdwXxNPkf5EgR0XCvwwshQtyV0aox30ws+CK
         ANP1voPhBPumwB2DogYkVVs2e9tDW/0exs7Fs0A0T8sQTtM3qLtywWw3iZJxwsub6qu8
         FHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720445643; x=1721050443;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a9KZem+hR+Ssu5sLJZQFJef/Bm0HGi/lC7YM1maoGyM=;
        b=so4syok1P3OrbKF6AE2AMv1q8FseI+X3Ozx1CBgIqrCBGvFhSeSsqu+RrQPvO080rt
         YgWIkiY8mQE6v3xS+Bldv3VhbdZCr6GuNT4uFhud3b+GKaXmYov9g0gRMec5eUlaPzjg
         Avgb+ila63qcSkE6TKUM6Rnl1mbEFY46U/zC7JBb8GVuL4ej3zF+gJ6h4giRnULUZUNP
         YOG2wjV/yWoMT9mhn3f0TcWw2qWQrtfJzDxAxtayXN9VIZAAcWR5gc09tlmvNXUrGI7T
         S1VbzOc28SExnE5hbGyCvdpBC6lzvc0oFXwckU8qnrevCZlM3SyJXQvmhGnPDtQaVwet
         k/yw==
X-Forwarded-Encrypted: i=1; AJvYcCVLRA0nGYc0UeTakr9X3TGa+FkJzVyN4zytFzFCM6z2JRXSP+tBroAfMBUvqspxHvgNFmehwDdnBNsUyaqX4Y3i1jRCIQX8bz532eE6uRmvSvPmFdVrUng56iwawbVJm2raiBrMCH3tyC2+wywP1F4GyHUFflEVHSw=
X-Gm-Message-State: AOJu0YxoKDXjPAC5+VIbNN/TIKspKhYH22+S5Wiipz51+NH2UXmKuYAt
	KEgE2kFvzql+SmY7IPDWC8gjz616SBY3RTh/5eS0d3sQKVxzXpr8
X-Google-Smtp-Source: AGHT+IEQu9zjQlULh2lm47m/DaCiSvsXwcsjLuaAMCjs8rdt+0vOxB36+NT7Ah6gIEaprzFcZ7Qu+Q==
X-Received: by 2002:a2e:bc0c:0:b0:2ee:7bcd:a3f with SMTP id 38308e7fff4ca-2ee8ed5edfamr103234371fa.22.1720445642560;
        Mon, 08 Jul 2024 06:34:02 -0700 (PDT)
Received: from skbuf ([188.25.110.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36784e3e0f5sm16538327f8f.11.2024.07.08.06.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 06:34:02 -0700 (PDT)
Date: Mon, 8 Jul 2024 16:33:59 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Landen Chao <Landen.Chao@mediatek.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5] net: dsa: mt7530: fix impossible MDIO address and
 issue warning
Message-ID: <20240708133359.rylvvmpcwlsxtrs5@skbuf>
References: <f485d1d4f7b34cc2ebf3d60030d1c67b4016af3c.1720107535.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f485d1d4f7b34cc2ebf3d60030d1c67b4016af3c.1720107535.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_063405_416902_A515A463 
X-CRM114-Status: GOOD (  22.21  )
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

On Fri, Jul 05, 2024 at 11:48:40AM +0100, Daniel Golle wrote:
> The MDIO address of the MT7530 and MT7531 switch ICs can be configured
> using bootstrap pins. However, there are only 4 possible options for the
> switch itself: 7, 15, 23 and 31. As in MediaTek's SDK the address of the
> switch is wrongly stated in the device tree as 0 (while in reality it is
> 31), warn the user about such broken device tree and make a good guess
> what was actually intended.
> 
> This is necessary to not break compatibility with existing Device Trees
> wrongly declaring the switch to be present at address 0 or 1, as with
> commit 868ff5f4944a ("net: dsa: mt7530-mdio: read PHY address of switch
> from device tree") the address in device tree will be taken into
> account, while before it was hard-coded in the driver to 0x1f
> independently of the value in Device Tree.
> 
> Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Reviewed-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---

Despite having commented on v3, I am not going to leave a review tag on
this patch. Its contents has nothing to do with DSA, so I have no
technical objections of my own, plus little authority for an ack.
It basically boils down to whether the phylib maintainers are okay with
this use of mdio_device_remove() API from mdio_device drivers
themselves.

I did have a technical concern in v3 about a race between the finishing
of probe() and the call to mdio_device_remove(), which Daniel did not
respond to, but I suspect that __device_driver_lock() from
drivers/base/dd.c will serialize those.

