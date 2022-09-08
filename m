Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3FA1C38145
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Sep 2022 11:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G8ZnoARtuecckP3hweHke5GOybQ4Tx8AFkQAdpOiTb4=; b=dnJQEkA2ACbECNs/lKzMSVcFK2
	ciQcUD9Ml6Ku/0mns9othfzSDaOCrdjCmk3krQgrA1ViuzfZw7bIHsYrsjDIGN72Jt6ZOWItDFpk4
	v+5qal/HtwrXA+p+5Z7glFZYe7wrE1yoLeyGmkVWr7QEwDL3CE/+HjkxL91TGGVeVraZ/QN+YNOOS
	xUriWIbdBpirqOLKz5iwJRQVzcnXh5a0GAraUxwKmFhawjtkrn6t+3WPDNLwGhgE8oz7+EsqCp66d
	X/d4OanfpPHbZelCwKTxwEXHEfUP6rxpwu/dozv2qbECWEOfM5buubQCZ8efw5Z2thjcMSlO4463c
	OXxY/BUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWFaq-002fcO-0T; Thu, 08 Sep 2022 11:21:12 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWFaa-002fUn-OU; Thu, 08 Sep 2022 11:20:58 +0000
Received: by mail-ed1-x532.google.com with SMTP id q21so16199834edc.9;
        Thu, 08 Sep 2022 04:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=G8ZnoARtuecckP3hweHke5GOybQ4Tx8AFkQAdpOiTb4=;
        b=o3CYbDyCbEVhWcKDUNyemWRpDB/jalwhB9aKwfAiQiAAIycxvO3x8vNjM2BbbmGETQ
         qmYVGwNejRe0ZiGsWxi1PC8OdZqDIWoZb6HYHGpLUxXu7Om1xnQ034XpYv4zMiLlLX2h
         sg4C2k2Xv+IX34PF6zos9eS3dY/zY+vCALN73udNDncKWjxals7NZRLSiXB42Q2fNGPw
         co3sk3l0aMsDyc4fy+12gj1OOrSw+NB0qHRKLgqxrc3+6GvPnmIf7NdGZtkt+84PR2n1
         pzz0uWK02TyFNkFyV46Dr3F5EA1HbcwnOnOGQ4r60egXvGebPdNn6mZrsBtgihpNyO8R
         N1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=G8ZnoARtuecckP3hweHke5GOybQ4Tx8AFkQAdpOiTb4=;
        b=tH2oKXNxo8tBdOqivI4cGtDx1jqQd8O1PPLoTH1rDGBKSaYdWCF7ZY/Zyvz33Twlsw
         b9bhw5P9mn3hDv05Kx438HkADKfmBCnB9oycFQNb495ACVBBffEwmCLssjE3qfJxJrrk
         NQrqLEpOctwfaUpDVhPL71LWdmr4ngyaCM1ObNTnIGmtmMoRuTCtkjwPIcqjKpiUc+1F
         F5mxAeOS2bVm7Sa5WAARP8F6Q1Ism+qIw6xqaRREauV/BkmyFfSboszjzbjxPhMDgJeo
         +LTpYMeeAAKfTH2IFhpSL3MNQlmZ7JL68YNWr8AcuGpZiJSTEssZ8qrJfnoj6g9XYEm7
         FhOA==
X-Gm-Message-State: ACgBeo1PJ61dDMwRI+bh7Tgw0HKTca5mkzL8e4m12ZhDVPg2MrFM0nbh
	jvakUVrYDjIyQo6jvr5CVMo=
X-Google-Smtp-Source: AA6agR5FVS+CRHX7ZNRp3l6+bfFEe/zLpbi+VIWGy2rLmJ3mU9ZkunVXWhrZz/JnhHHr46WP0K1dVQ==
X-Received: by 2002:aa7:d703:0:b0:44e:a7b9:d5bd with SMTP id t3-20020aa7d703000000b0044ea7b9d5bdmr6773436edq.425.1662636051345;
        Thu, 08 Sep 2022 04:20:51 -0700 (PDT)
Received: from skbuf ([188.27.184.197])
        by smtp.gmail.com with ESMTPSA id lr23-20020a170906fb9700b0077077c62cadsm1120329ejb.31.2022.09.08.04.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 04:20:49 -0700 (PDT)
Date: Thu, 8 Sep 2022 14:20:44 +0300
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
Message-ID: <20220908112044.czjh3xkzb4r27ohq@skbuf>
References: <Ywyj1VF1wlYqlHb6@shredder>
 <9e1a9eb218bbaa0d36cb98ff5d4b97d7@kapio-technology.com>
 <YwzPJ2oCYJQHOsXD@shredder>
 <69db7606896c77924c11a6c175c4b1a6@kapio-technology.com>
 <YwzjPcQjfLPk3q/k@shredder>
 <f1a17512266ac8b61444e7f0e568aca7@kapio-technology.com>
 <YxNo/0+/Sbg9svid@shredder>
 <5cee059b65f6f7671e099150f9da79c1@kapio-technology.com>
 <Yxmgs7Du62V1zyjK@shredder>
 <8dfc9b525f084fa5ad55019f4418a35e@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8dfc9b525f084fa5ad55019f4418a35e@kapio-technology.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_042056_838126_4C6566BB 
X-CRM114-Status: GOOD (  16.05  )
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

On Thu, Sep 08, 2022 at 01:14:59PM +0200, netdev@kapio-technology.com wrote:
> On 2022-09-08 09:59, Ido Schimmel wrote:
> > On Wed, Sep 07, 2022 at 11:10:07PM +0200, netdev@kapio-technology.com wrote:
> > > I am at the blackhole driver implementation now, as I suppose that the
> > > iproute2 command should work with the mv88e6xxx driver when adding blackhole
> > > entries (with a added selftest)?
> > > I decided to add the blackhole feature as new ops for drivers with functions
> > > blackhole_fdb_add() and blackhole_fdb_del(). Do you agree with that approach?
> > 
> > I assume you are talking about extending 'dsa_switch_ops'?
> 
> Yes, that is the idea.
> 
> > If so, it's up to the DSA maintainers to decide.

What will be the usefulness of adding a blackhole FDB entry from user space?

