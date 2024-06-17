Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE4DC27C6E
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jun 2024 09:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eEUIpHnQGVoJgFUUtr6K5uLL6KfCGzBVgBBz+mc8EC8=; b=Huu+1ipRufBtyzGsiH+S2qD1Xn
	9UPsgpNNjZjJDeXlZeEFh2eifg59MxeqDJ7nGiMpcuuPExNSpnGFPQjx9wd5qj0KpQBFQZx+qYNYI
	KCUH6pYNNOANp0KNHNJpCHTYxUiPiXfiX/YPINl7N0qtRWRYqC+TRrHRBarNhyMBXgYCS/jwlqZnc
	gYR3RCVfH3LtVHG+whBQwKqjmJ5tpv57re7Hyb3mwT3jF6hX4hTvLk9FkyWc3DWMDnpnPv4N3BZU1
	pE3/L/6kVIdzy5Ssrh6K5dRuNozrNJ1yoSgbpS9qpJpFiVGgW5dzwYB918JS2eENpCblV9XwE3cyo
	X0SkWCiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ8ZR-0000000A1Pp-3NRd;
	Mon, 17 Jun 2024 09:22:37 +0000
Received: from mail-ed1-f50.google.com ([209.85.208.50])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ8ZN-0000000A1OF-2NTD;
	Mon, 17 Jun 2024 09:22:35 +0000
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-57c76497cefso4825481a12.1;
        Mon, 17 Jun 2024 02:22:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718616150; x=1719220950;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eEUIpHnQGVoJgFUUtr6K5uLL6KfCGzBVgBBz+mc8EC8=;
        b=lUQU7oh3uJDXTq3VREiodjbxVspyArsAGWZdOeiF3F8x4PNTtqA8zgA7opVEK5Nl1G
         kF3EhLgv9FV9isGRF9btW8Xl7vCYo0cE0Wi92/mBo9tAPwUrMtXa4VANOXnHxdalD5kx
         EDUqLJkBST1rb6ZDKZ6Frus9KTfoCUVbTkRuY8BKI1mWK3RPPBaZQCUi7hwWhTCCafCs
         W5gtqrGJ4hvgWiGUoP5cB+0TKc3nQ0pxgrsQwaS2CO4y/ljjGGO8lpe+qy+1qDFitoxZ
         Ub+ZHCMjv2BFl3dHtbZuvBE4rHJaN75n3xkuWfoEtVVMu58aFDWX/edGa4b38fK34SaZ
         BsCQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0IZov8lg4bso5rmPMcljuWRSTizukSAscOi8HeqXYNKPlF+iH26MtfRQaCg6zPFJt7vbFPUoebcP175D1kDO+mYu7BrqkAixvy8pasfXeZknbefh+yqRPdBEPd+nW6Aq+Ey29+PA56UcYLULrW/P7xC1AFX8tIEw=
X-Gm-Message-State: AOJu0YyhWS8M6/LIvjDSBErWAZyre0Zix/80oiSQP+opKWjvPLyfw7Ym
	jhwyjUJ+Kwq5/GvKXc1ngCzbvgJ/s18vHljWMgxdW9FScNCmdvzLINQosA==
X-Google-Smtp-Source: AGHT+IFOEUVidGPJxpO+GgKTTkPjj7sUIp7yTZvciRnrHQQDmvCrLJJ+SpiU6a/ssk+qbAl8zn9V3Q==
X-Received: by 2002:a50:a693:0:b0:57c:6773:d9c1 with SMTP id 4fb4d7f45d1cf-57cbd6a5a0emr5821631a12.39.1718616149646;
        Mon, 17 Jun 2024 02:22:29 -0700 (PDT)
Received: from gmail.com (fwdproxy-lla-002.fbsv.net. [2a03:2880:30ff:2::face:b00c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57ccc173673sm3466975a12.44.2024.06.17.02.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 02:22:29 -0700 (PDT)
Date: Mon, 17 Jun 2024 02:22:23 -0700
From: Breno Leitao <leitao@debian.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, horms@kernel.org, kees@kernel.org,
	kuba@kernel.org, Bo Jiao <Bo.Jiao@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Alexander Couzens <lynxis@fe80.eu>,
	Deren Wu <deren.wu@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Leon Yen <leon.yen@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>, Ingo Rohloff <lundril@gmx.de>,
	Sujuan Chen <sujuan.chen@mediatek.com>,
	StanleyYP Wang <StanleyYP.Wang@mediatek.com>,
	Benjamin Lin <benjamin-jw.lin@mediatek.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] wifi: mt76: un-embedd netdev from mt76_dev
Message-ID: <ZnAAT/a3DKnTgUoz@gmail.com>
References: <20240614115317.657700-1-leitao@debian.org>
 <87cyogkkju.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cyogkkju.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_022233_808481_FC9FBDA9 
X-CRM114-Status: GOOD (  17.91  )
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

On Mon, Jun 17, 2024 at 12:03:49PM +0300, Kalle Valo wrote:
> Breno Leitao <leitao@debian.org> writes:
> 
> > Embedding net_device into structures prohibits the usage of flexible
> > arrays in the net_device structure. For more details, see the discussion
> > at [1].
> >
> > Un-embed the net_devices from struct mt76_dev by converting them
> > into pointers, and allocating them dynamically. Use the leverage
> > alloc_netdev_dummy() to allocate the net_device object at
> > mt76_dma_init().
> >
> > The free of the device occurs at mt76_dma_cleanup().
> >
> > Link: https://lore.kernel.org/all/20240229225910.79e224cf@kernel.org/ [1]
> > Signed-off-by: Breno Leitao <leitao@debian.org>
> > ---
> >
> > PS: Due to the lack of hardware, this patch was not tested on a real
> > hardware, unfortunately.
> >
> > PS2: this is the last driver that is still using embedded netdevices.
> 
> Is this patch a dependency to other patches? I'm asking because it will
> be _slow_ to get this patch to net-next via wireless trees. If there's
> urgency then it's much better to take it directly to net-next (of course
> with acks from Felix and Lorenzo).

Since this is the last patch for the whole flexible netdev work, I would
prefer to have it through net-next then, so, we finish the whole work
sooner rather than later.

I will prepare a v2 with Simon's suggestion, and I can target net-next.
I am just waiting a bit more to hear from Felix and Lorenzo.

Thanks!

