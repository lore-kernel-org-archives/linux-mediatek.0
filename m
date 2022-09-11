Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE09ECAAD5
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Sep 2022 00:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bppXW6VDR+pb+O0s/GBMgHjeo0dyk4Z19CwR9nRdUqY=; b=5Em9MvvVWR8h1metmBR2iQ9eDc
	DYtAM0nnA0hYVTj6WfAF0oEcjjOl4WrpA8kKi3q6B5kHPAOshn/jwzEhu9yMiL6nxAG8vLankmYfX
	pV7W81hTlWVKSUEZoDHjgrei/FxODWLbqrfuOrZPKWY+nGlERJsvnt4At89+J1+FwC8GzzqMhYuSp
	bDwDO2n5Mgjk0AQJkfP5KmlaBJOAY8eGQcxcMAZ+qmz3RzcH0mLzYSTdcRRqNR4yAA2ih/uD9o9+g
	LVNV0G0w3EbeaoBhjGfy+gr6/Ys5X5LMW2elM9g+1D1PFxt4svulqMBAwWCqlW/nLsjNy8wPpiKIh
	k6wJY+8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXAbs-00Edef-QL; Sun, 11 Sep 2022 00:14:04 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXAbh-00EdYo-TD; Sun, 11 Sep 2022 00:13:55 +0000
Received: by mail-ed1-x532.google.com with SMTP id e18so7860033edj.3;
        Sat, 10 Sep 2022 17:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=bppXW6VDR+pb+O0s/GBMgHjeo0dyk4Z19CwR9nRdUqY=;
        b=I/dbdccpmFyof6NN2fUQMmS80Kye7WCB0cQOnWsCWr6kbYBSqsVNXYvpajN4WTXs5N
         PXhbKdVGq8qaZvgMB0u24QvcgieMU5sZBUZfzJF2amKkSCjUsiAOitoc/N3eYjx4+nbU
         UkvrRIvjsJnsPK6sjy/HtdP6xSLhmtUOAOXnyRclsyX3fiW0yb7AKTCDLDXVMQdlnFWk
         mil8xpZZTzvqkglqCqTqsMJxVx8FC4xg6utVXrjwvfOZdCzMwfSKP+sa1fb1IAQfgDPQ
         pESQws6EXy9LgJ4AVvyxftq7I/HfsvAzi5cWrDfXOlqoYDBtxh9cVpuCsIrL0Hca4ds+
         PlOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=bppXW6VDR+pb+O0s/GBMgHjeo0dyk4Z19CwR9nRdUqY=;
        b=Jpe4Q8yWs/15kBeAu8G4dwS3hZ/odmC/4KvFDLYY9TpTznplNvUe50d35kueugYJg+
         1dnIt3RQxyVvyr3Bf6dk56beiSJgKyT4cabFjqgjhCol/9S50yvewsLLzwZ937Rujmja
         9gus4z7pCXadLuWCCHgRw+G7nPl085ZqVTJpK7M3aBADaa9u8xijEyc2/JXSIe7foPM4
         b58/K7XCXxD7KZyG16+JosPe0vvxI8fp+k5KeZjCr+mYXbTeHy8J02vCqsaWFyBk8O3U
         kP8MLpJou4pqC/872t/xH4pR/Y7xqxiII1RG0p0y3BpQdNFC6qlrqrp8yWn2CtJmzofN
         78cQ==
X-Gm-Message-State: ACgBeo2/FBDuPoK9l/D1cECWfuJP+Siu/1yLOzpnflJtBpUu+Q0nJywM
	Qf/Sdv1nwDUPyj7iFzUNu5Q=
X-Google-Smtp-Source: AA6agR52fycHpO9WU3O4tQqWIpSfhUKG2OMNd9yKS0R5NgefgysDjUnyzSr5YsGH9u2uheidlYIZ6Q==
X-Received: by 2002:a05:6402:110d:b0:451:9fc5:fe7f with SMTP id u13-20020a056402110d00b004519fc5fe7fmr346191edv.200.1662855231160;
        Sat, 10 Sep 2022 17:13:51 -0700 (PDT)
Received: from skbuf ([188.27.184.197])
        by smtp.gmail.com with ESMTPSA id c18-20020a17090618b200b00773f3ccd989sm2265945ejf.68.2022.09.10.17.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Sep 2022 17:13:50 -0700 (PDT)
Date: Sun, 11 Sep 2022 03:13:46 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: netdev@kapio-technology.com
Cc: Ido Schimmel <idosch@nvidia.com>, davem@davemloft.net, kuba@kernel.org,
	netdev@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com, Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Shuah Khan <shuah@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Yuwei Wang <wangyuweihx@gmail.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bridge@lists.linux-foundation.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 net-next 6/6] selftests: forwarding: add test of
 MAC-Auth Bypass to locked port tests
Message-ID: <20220911001346.qno33l47i6nvgiwy@skbuf>
References: <YwzPJ2oCYJQHOsXD@shredder>
 <69db7606896c77924c11a6c175c4b1a6@kapio-technology.com>
 <YwzjPcQjfLPk3q/k@shredder>
 <f1a17512266ac8b61444e7f0e568aca7@kapio-technology.com>
 <YxNo/0+/Sbg9svid@shredder>
 <5cee059b65f6f7671e099150f9da79c1@kapio-technology.com>
 <Yxmgs7Du62V1zyjK@shredder>
 <8dfc9b525f084fa5ad55019f4418a35e@kapio-technology.com>
 <20220908112044.czjh3xkzb4r27ohq@skbuf>
 <152c0ceadefbd742331c340bec2f50c0@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <152c0ceadefbd742331c340bec2f50c0@kapio-technology.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220910_171353_984054_8AC4E9AF 
X-CRM114-Status: GOOD (  19.72  )
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

On Fri, Sep 09, 2022 at 03:11:56PM +0200, netdev@kapio-technology.com wrote:
> > > > On Wed, Sep 07, 2022 at 11:10:07PM +0200, netdev@kapio-technology.com wrote:
> > > > > I am at the blackhole driver implementation now, as I suppose that the
> > > > > iproute2 command should work with the mv88e6xxx driver when adding blackhole
> > > > > entries (with a added selftest)?
> > > > > I decided to add the blackhole feature as new ops for drivers with functions
> > > > > blackhole_fdb_add() and blackhole_fdb_del(). Do you agree with that approach?
> > > >
> > > > I assume you are talking about extending 'dsa_switch_ops'?
> > > 
> > > Yes, that is the idea.
> > > 
> > > > If so, it's up to the DSA maintainers to decide.
> > 
> > What will be the usefulness of adding a blackhole FDB entry from user
> > space?
> 
> With the software bridge it could be used to signal a untrusted host in
> connection with a locked port entry attempt. I don't see so much use other
> that test purposes with the driver though.

Not a huge selling point, to be honest. Can't the blackhole flag remain
settable only in the device -> bridge direction, with user space just
reading it?

