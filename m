Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD3AC47258
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jan 2024 11:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I9Zq9GKWqta6ICAtqEU6fr3Wjl7exxbBxBD4kWvF4dU=; b=MxBIfiz+N89azW+koQhq/hH5pu
	EAnX/nB8Vi8JJ0+UunYHfpo1fZJeoQ4HDvXGV7cqNJI236qO4wWaD/e21F6H68VmSi6RQFGgr9tGn
	Tx23YacUsTYU8Xne2gZBYM0jJGsjaaK9gLs4jMmxyZZQxXAbuSzjFqTltCzdN5OXAcIIcoBdma3Ov
	cS1hm52QnznPKcXkHtkOiyvsUW/YDkYhDi8ZQC9RvYOexH3B0R6DEQOJNrlb6LRbAaYHdpA1UFFWV
	8+ln/wjR0gw1Snaam1nWomIrtZlDZYU6HstYVAMVZ1OVLcA1DmQ/rup4yrGGqejKgAPwd9FOubEfF
	1NigfNlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNX4F-00BWXw-1l;
	Wed, 10 Jan 2024 11:48:19 +0000
Received: from mail-ed1-f43.google.com ([209.85.208.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNX4B-00BWUx-05;
	Wed, 10 Jan 2024 11:48:16 +0000
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-55642663ac4so4553520a12.1;
        Wed, 10 Jan 2024 03:48:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704887291; x=1705492091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9Zq9GKWqta6ICAtqEU6fr3Wjl7exxbBxBD4kWvF4dU=;
        b=bKrBeH5Nvqct8FuEqcCUQtqhU4QjFgbf7BAY8DNI2uP9+aLTsBWVU1vdKgHX+aSd2t
         EIqd/xrRy2bq/Jm7ZjBS5dWlRVFdhXthUZhryf4bgA4oWWlgbcOk4MwEyR7StO43goRp
         JWlzHHL4zNJZym8HuvgCAqx2ixKMv4lASLaC8xWz+GtQaAaHJTj2BnAdH1fq1Z4PuXdD
         P1C5dkU2QfqhNIeVyzwY20vR/f8O92o6v5+GQ+XwivOTH1YTwPGOuoxKjTOoej2s2del
         1+hF22BbtEHekkDv3okBloHmvzlfodkWq8Z9EYGcxSr3vnhL3e0OxIgh7cm9HmnZyA1G
         6w3Q==
X-Gm-Message-State: AOJu0Yx8v28IjBXkFrIe6PBUMUtq61bxxNRfq4V0z4gut4TRiODufx7J
	Zqfo6csdHsQrc/HsMTzVhBI=
X-Google-Smtp-Source: AGHT+IGjzvnapI0zijY7x5/NYywNVV1ffVnagAX2zyHlUgtQbten23Ytlf8qlfI9RIg1uAtJdyiFDg==
X-Received: by 2002:a05:6402:26c7:b0:557:91e1:25aa with SMTP id x7-20020a05640226c700b0055791e125aamr410983edd.78.1704887290635;
        Wed, 10 Jan 2024 03:48:10 -0800 (PST)
Received: from gmail.com (fwdproxy-cln-017.fbsv.net. [2a03:2880:31ff:11::face:b00c])
        by smtp.gmail.com with ESMTPSA id x3-20020aa7d6c3000000b00557463cdc76sm1894746edr.69.2024.01.10.03.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 03:48:10 -0800 (PST)
Date: Wed, 10 Jan 2024 03:48:08 -0800
From: Breno Leitao <leitao@debian.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, Alexander Couzens <lynxis@fe80.eu>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH net-next 10/10] net: fill in MODULE_DESCRIPTION()s for
 PCS Layer
Message-ID: <ZZ6D+AylYTNDW9F9@gmail.com>
References: <20240108181610.2697017-1-leitao@debian.org>
 <20240108181610.2697017-11-leitao@debian.org>
 <cf825e28-cceb-49e1-9880-7971cc955b2c@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf825e28-cceb-49e1-9880-7971cc955b2c@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_034815_067129_6E972D3D 
X-CRM114-Status: UNSURE (   9.64  )
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

On Mon, Jan 08, 2024 at 08:21:03PM +0100, Andrew Lunn wrote:
> On Mon, Jan 08, 2024 at 10:16:10AM -0800, Breno Leitao wrote:
> > W=1 builds now warn if module is built without a MODULE_DESCRIPTION().
> > Add descriptions to the LynxI PCS MediaTek's SoC.
> 
> Does pcs-lynx.c also have this issue? It can be built at a module.

Absolutely. I can see the warning in pcs-lynx and pcs-pts.

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/pcs/pcs_xpcs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/pcs/pcs-lynx.o


