Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650CEC47077
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jan 2024 10:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c96eHGeRMy0FA5YmUP0POLqi/6OSA4NTqHeMHP6wHhc=; b=gxc4ED5Zk+XNl8p6gxm1rcCxwh
	ZZekXy2LiMvh/9OArBGOyVYVLn0aSKOyQG9VOTC30USkgXb80lqABSo23Dbs5cusKIqRGFIweOsoH
	k+QssS4f0qTtKWwtFkMr1BV0zPVL2a5UwVoVHWm2BNONkMGwuFVqG4YgcaNJ228Fun4i1ZfPJxQIn
	xD3dqiGchH0wVQlFuW6MafMFlsoMEQ63fepVGtRQWONsAZangQn9XQNFwXGE/ZUpZZ4h6pY4Om9yn
	zrjOFrztW7WLVv6FqtARAJF1czqz1xctg6gMikO7GPep/qoxQ1D+5GHlRg7bgJufC2iN5ljmg0fZp
	OG6RWqDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNsLu-00H0Y6-0S;
	Thu, 11 Jan 2024 10:31:58 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNsLq-00H0VP-0g;
	Thu, 11 Jan 2024 10:31:55 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a28b2e1a13fso544980366b.3;
        Thu, 11 Jan 2024 02:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704969110; x=1705573910; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c96eHGeRMy0FA5YmUP0POLqi/6OSA4NTqHeMHP6wHhc=;
        b=m1QsBbGIV9NZkhSShMlkFWEZr43nCCiBgzVhDlR0ZjoTgCvKROodyO8n+GZvWTUMou
         BOKLnEVBgAqL8ObF+cm4gtIClfUpohUIM06hDdArECL5IhsT4fIw4LQD4q1XiX8H5F2o
         qYgoMnpkfAudyEm4cMTbEfyy/njaRwqavAUB45r7rkgdz5Fxd+UK2k/Vvc1uhNOsLpK9
         +8U1UuyAHiwH7xD3XLsYfr7uEnGfKiCKh50KftDkH3HPskEc0nL7NWInLii38OTSVqNi
         QBK1VajAb7CsYTFohhGLLYXK2O4oB4D9tks5cI1rYHnLvmMtBDBwM6/+sRVtvfQiqyO0
         ej0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704969110; x=1705573910;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c96eHGeRMy0FA5YmUP0POLqi/6OSA4NTqHeMHP6wHhc=;
        b=PX3Y/P4kHWF0cTi6uZ75b4/7Nf0sN+iKHLxjvWCuBW7lhhbN4OXFUh1OmfhWtZoJeq
         vlRhc9TrFuDy+L1wiwDKyRI6gCCiQ1z9I2IXjrgFCDA38H+ByLxjavwjJbT4nXy9rZgN
         TI/MbUhCrJSGyn5ByxduU5UltFBvQU7J3OKERrUArdXc2t9YDpLh/bAYp0of+qemWbbR
         t2ZFaYPJ7BUh4i6yBB0H9zXamSH9dBfidFdRBASR1E0dweIHqOPbGxAf8LtadqMiKwAC
         SFe9+t6EXtzTDsIvvJAagRX3GaQeLNcafJErVcdrPTuHqc/aI0EMd1bnuIY2JYumb//I
         LwLQ==
X-Gm-Message-State: AOJu0YzRGQ/jqf9n3pL1E07BmRLClQbjuhzL3S6cbefFGrJhYCWmBNdr
	8WXDHOpwmefeGp5ZtOvxBaw=
X-Google-Smtp-Source: AGHT+IG1bsDJjT+tCb6RsDzpYr+HZg8W8eOGQ5g6FgdP2xO4ZZeFbzslfzXkR//fI092SnqELgkksA==
X-Received: by 2002:a17:907:842:b0:a28:fd0e:6051 with SMTP id ww2-20020a170907084200b00a28fd0e6051mr697695ejb.33.1704969110140;
        Thu, 11 Jan 2024 02:31:50 -0800 (PST)
Received: from skbuf ([188.25.255.36])
        by smtp.gmail.com with ESMTPSA id g6-20020a170906c18600b00a2a9ddd15b8sm409460ejz.173.2024.01.11.02.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 02:31:49 -0800 (PST)
Date: Thu, 11 Jan 2024 12:31:46 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net-next 07/15] net: dsa: mt7530: do not run
 mt7530_setup_port5() if port 5 is disabled
Message-ID: <20240111103146.t5fzr2wlw2tyrkkb@skbuf>
References: <20231207184015.u7uoyfhdxiyuw6hh@skbuf>
 <9b729dab-aebc-4c0c-a5e1-164845cd0948@suswa.mountain>
 <20231208184652.k2max4kf7r3fgksg@skbuf>
 <c3a0fc6a-825c-4de3-b5cf-b454a6d4d3cf@arinc9.com>
 <48b664fb-edf9-4170-abde-2eb99e04f0e5@suswa.mountain>
 <2ad136ed-be3a-407f-bf3c-5faf664b927c@arinc9.com>
 <20240109145740.3vbtkuowiwedz5hx@skbuf>
 <0a086b5f-b319-4f08-9513-a38c214e1da7@arinc9.com>
 <20240110182358.ci7pg7ipcbsjxqjf@skbuf>
 <009fec43-0669-419e-a3a9-ce54c676a324@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <009fec43-0669-419e-a3a9-ce54c676a324@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_023154_247140_70C3CCF3 
X-CRM114-Status: GOOD (  13.08  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Dan Carpenter <dan.carpenter@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jan 11, 2024 at 01:22:12PM +0300, Arınç ÜNAL wrote:
> > BTW, besides OpenWrt, what other software is deployed on these SoCs
> > typically?
> 
> Other than OpenWrt which is widely used for these SoCs for its ease of
> flashing and upgrading, compatibility with legacy U-boot versions that
> usually come with any vendor making a product out of these SoCs, I can only
> talk about what I deploy to run Linux. I use mainline U-Boot along with the
> device trees from the Linux repository to boot mainline Linux kernels with
> Buildroot as the filesystem.
> 
> Arınç

I meant what other software (operating system) _instead_ of OpenWRT.
I'm trying to figure out what other users of PHY muxing there might be.

