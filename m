Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A4E2C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 17:52:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 073F560F00
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 17:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 073F560F00
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K9QluofMhNAQDU6o5TpusjDHTgy0yaGF3550uc4IUWA=; b=4qwflJ7MV7iC8y
	1NmGYzUMS06J4e7ZyKFAvg3o8AeWaHfdOATgzK+sow70nI5p++VqCgLxSRCxCSertvuTo6NbhGhZY
	fjgQXcW5YGcDrV8c7ryKDNa+WU75iDeaAWWOdM+VcFfdJIrdwHtEPSVD8hz3dZ/u4Ie1jr4jEjmPQ
	6vIY49YL6CZKYRschpsDccHlwyOOFHiDjgLrD1Rja+K9Eo/8l5vtrLBIA4G4jmSumyczJZ4OnSQO/
	wxMyZJUAJMwgQ+vE+lIr3h22b9xnfjojCNPhtmOyuGRE9g1h5VK6qce0R191TaGkSeS5tpdEHK3P+
	Ayaoum8zlMFZQqtv/7hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9Wfz-009mQb-6G; Fri, 30 Jul 2021 17:52:03 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9Wfl-009mNy-8n; Fri, 30 Jul 2021 17:51:50 +0000
Received: by mail-il1-x131.google.com with SMTP id f8so6982446ilr.4;
 Fri, 30 Jul 2021 10:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-disposition:content-transfer-encoding;
 bh=sAh2TyVPupc4SlO/7+ZRZndIoKJA5QlMvjRl7Cc62vo=;
 b=vZaWUIG9YhzoHq/DrESu1sNvIu/+WtI93Ev4/7u26zHEJwAkhM9T/x0vyZhjWIEfpW
 drknizjaupZUrwoTTO5eXxZKB+MduPyzoZ2+qul0opbUSFMl0STzKHlp72bIb5YbBGUa
 mU35xosjPM3VJA6kzSqxJX+PLQMfiYWSolg5DKrAWvqWhRPG+nUea+PEnyggSofkrKLZ
 S3GCYrkb1UeGgCfiGO/6zPnZmDnREVbMY1H5VmYfTR2qG0FS4AU98lkDnGt/WYXbWlcT
 vVX500xSOkVAUUoAKm2q/tZJHqyPTlTGxGWgUzJNHLjOkY/j+ZivlXUotWvw4LmauAVZ
 4GGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding;
 bh=sAh2TyVPupc4SlO/7+ZRZndIoKJA5QlMvjRl7Cc62vo=;
 b=Zo1Xz9taTMAYM50UB+Y11ZFZ5ZuVRvr2p9Fa31TwvSsyMoOO9OMAnK8TYY7eI4HIoM
 jx8csxD+godC/v2rSfaWU8fKVTiXxpIr3gL359QSUxTaRs16lEGt7kUsunnO/5pM5kZ0
 zw6TvzFtokqcfr8Pj7SBNyY7d97VwgS2qBFSm46dXj3QAof6oCIz22UzfQX0Bd/K1Gqy
 LsIH7u5w8LpEzUSgZxFvdMASMn+tyq4bPhm0BkvKh4zpao7CntjSkhxEg32N7EBUP8g4
 oimJrrYaCo2rgwtiJh0q3WBVaMPe0lXYd51K5yCGMCFJq5iVplPlkW5Hbae+9+pR6b/1
 HBbg==
X-Gm-Message-State: AOAM532rZseDB8SKiNJdcne38Y3CmGOBe6v864wMAUrsNMzzZI+02ieO
 DEaDKq69qfQFC+XOwxr4Yz0=
X-Google-Smtp-Source: ABdhPJwikl+WdVj7X74h8YFsRMAjuzkEZaOB6L6n9wMeM+n+iyQaSmmXyece5DyOUrBOjpnmxFi/Rg==
X-Received: by 2002:a92:bf11:: with SMTP id z17mr1793894ilh.3.1627667508071;
 Fri, 30 Jul 2021 10:51:48 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id t11sm1427256ioc.4.2021.07.30.10.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 10:51:47 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev <netdev@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [RFC net-next 2/2] net: dsa: mt7530: trap packets from standalone
 ports to the CPU
Date: Sat, 31 Jul 2021 01:51:39 +0800
Message-Id: <20210730175139.518992-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210730173511.ulsv7wfogk5cpx5j@skbuf>
References: <20210728175327.1150120-1-dqfext@gmail.com>
 <20210728175327.1150120-3-dqfext@gmail.com>
 <20210729152805.o2pur7pp2kpxvvnq@skbuf>
 <CALW65jbHwRhekX=7xoFvts2m7xTRM4ti9zpTiah8ed0n0fCrRg@mail.gmail.com>
 <20210729165027.okmfa3ulpd3e6gte@skbuf>
 <CALW65jYYmpnDou0dC3=1AjL9tmo_9jqLSWmusJkeqRb4mSwCGQ@mail.gmail.com>
 <20210730161852.4weylgdkcyacxhci@skbuf>
 <20210730171935.GA517710@haswell-ubuntu20>
 <20210730173511.ulsv7wfogk5cpx5j@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_105149_363884_461513B6 
X-CRM114-Status: GOOD (  14.36  )
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

On Fri, Jul 30, 2021 at 08:35:11PM +0300, Vladimir Oltean wrote:
> On Sat, Jul 31, 2021 at 01:21:14AM +0800, DENG Qingfang wrote:
> > I just found a cleaner solution: Leaving standalone ports in port matrix
> > mode. As all bridges use independent VLAN learning, standalone ports'
> > FDB lookup with FID 0 won't hit.
> 
> So standalone ports are completely VLAN-unaware and always use a FID of
> 0, ports under a VLAN-unaware bridge are in fallback mode (look up the
> VLAN table but don't drop on miss), use a FID of 1-7, and ports under a
> VLAN-aware bridge are in the security mode and use the CVID instead of
> the FID for VLAN classification?

No. Both VLAN-unaware and VLAN-aware bridges use independent VLAN learning
i.e. use CVID for FDB lookup.

> 
> Make sure to test a mix of standalone, VLAN-unaware bridge and
> VLAN-aware bridge with the same MAC address in all 3 domains. If that
> works well this should be really good.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
