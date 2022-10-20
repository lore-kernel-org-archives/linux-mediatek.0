Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A66C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 15:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qPwKKOSL5o3iKP3/dq2Q/Xqf5eS+OyCN/8/d6oWiIbo=; b=FLkzuO5twoKasPsCJRl2Q7QsBr
	TczROZH8RoT9mBgNQWKXNjYFz/t/DLTPOvIrUl7e2GsFo6oo+crUZk7R0GsovKW4cbtQxlkRgRKth
	mxU2u4U03Mpaxu2oP1e6l0YDbPfhOaSygZaulT5DjqNVl65LJH9NZ+KKfaIPrQryRrhawAlB1ccdH
	fo5ng9IEQ6oXFeUePtjXZH2ydWyV/e5QHuVsUJsFDCCP4lZm58QnqF+aIbCvZt3DqTcsyjxOYFZVa
	Ekwy3pfDQYcp+Fg5uHqMDb5zbr1aHhmU7G7/CYEM5lxVoO/evV/urLGNEO0iHBcjJuNM6X1uq+Iue
	FrgYTF8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olXbS-00H861-1d; Thu, 20 Oct 2022 15:37:02 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olXbA-00H7xp-Qd; Thu, 20 Oct 2022 15:36:46 +0000
Received: by mail-ej1-x635.google.com with SMTP id d26so345898eje.10;
        Thu, 20 Oct 2022 08:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qPwKKOSL5o3iKP3/dq2Q/Xqf5eS+OyCN/8/d6oWiIbo=;
        b=Wez6UWR4yVy7ljjWDwKmXH6VNrw+c4JqEj+dW/C4iE13oGKDcKlajUuNqxj6oLepyi
         C0skbvziSspULzvlwn8TBGB6Tv1ygZ83Nk9yz7CmVwEt93bAqdM1W+mP5lRva/Mu2sfA
         wUJ27HWB96G1EoRapxy1zVd0dSfec6ORQh0UyIB4LVjAyzUCUXaiRRDCLvVFoEQ8Rdxg
         Ub7Q/WvBLNLViJ6sWzK+Oz8/bF7ofcwRMyWfFsvy2ESmkC+fRO+XYiQFfPUaUZI46ja+
         kaaUkAOdxxOythUrOTUZPvVTZDJCnY2dlbASFAtPDOc6Xi/cXW/qf28qa4TWVPqSRx7W
         vAKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPwKKOSL5o3iKP3/dq2Q/Xqf5eS+OyCN/8/d6oWiIbo=;
        b=t7SBOHxdbgoxukayaky4xNN4MvT1smILDsFIfneFp28l212Gi+vlZlm4IzZYXG6a68
         AfmjDCFhM6JRcObt50qXe2Hwqn1AjaO3yA/BDfZvDcuJOhubjmBWhye+mxyu5uNKG96i
         hGU12Yz4uB6+r8JHcqLfYcasPZVepWAa51VLf7cpC0r3FfybDUW/NVaAEqdANmhImljQ
         3rQ4+fKtvYpMnEuvZ6NMxiF5UxIvbudliXwQWgJHiUgGzLqiTrEXYSG7NRvrSmwR41+b
         3CUeHnFAxVbuqoDc9+mflbFVv9/wlc9GfQ5tV9EDkLz0Vuy9KrKZAvJkZB+KcCWhha+I
         G1/A==
X-Gm-Message-State: ACrzQf1PJ+eh/cSuAG/iRQ9nOAAQBv6okk0MInnk90fph8YSbXjXBV4H
	dxUeplLs3YwJpXrI2Huy+7s=
X-Google-Smtp-Source: AMsMyM5s+eomvicrwy06vylV7JHYWUXt7SptVI0OJ04clH7AsmxgYkS4j30ouF2cBsqK3IsRWpsFNA==
X-Received: by 2002:a17:907:724d:b0:78d:acf4:4c57 with SMTP id ds13-20020a170907724d00b0078dacf44c57mr11472630ejc.516.1666280200876;
        Thu, 20 Oct 2022 08:36:40 -0700 (PDT)
Received: from skbuf ([188.27.184.197])
        by smtp.gmail.com with ESMTPSA id m13-20020a1709061ecd00b007305d408b3dsm10388170ejj.78.2022.10.20.08.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 08:36:39 -0700 (PDT)
Date: Thu, 20 Oct 2022 18:36:36 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: "Hans J. Schultz" <netdev@kapio-technology.com>, davem@davemloft.net,
	kuba@kernel.org, netdev@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
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
	Shuah Khan <shuah@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Yuwei Wang <wangyuweihx@gmail.com>, Petr Machata <petrm@nvidia.com>,
	Florent Fourcot <florent.fourcot@wifirst.fr>,
	Hans Schultz <schultz.hans@gmail.com>,
	Joachim Wiberg <troglobit@gmail.com>,
	Amit Cohen <amcohen@nvidia.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bridge@lists.linux-foundation.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v8 net-next 05/12] net: dsa: propagate the locked flag
 down through the DSA layer
Message-ID: <20221020153636.ceqk67hmut3govsp@skbuf>
References: <20221018165619.134535-1-netdev@kapio-technology.com>
 <20221018165619.134535-1-netdev@kapio-technology.com>
 <20221018165619.134535-6-netdev@kapio-technology.com>
 <20221018165619.134535-6-netdev@kapio-technology.com>
 <20221020130224.6ralzvteoxfdwseb@skbuf>
 <Y1FMAI9BzDRUPi5Y@shredder>
 <20221020133506.76wroc7owpwjzrkg@skbuf>
 <Y1FTzyPdTbAF+ODT@shredder>
 <20221020141104.7h7kpau6cnpfqvh4@skbuf>
 <Y1Fn+TnbI/uMH0VR@shredder>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1Fn+TnbI/uMH0VR@shredder>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_083644_899181_53FE850B 
X-CRM114-Status: GOOD (  13.06  )
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

On Thu, Oct 20, 2022 at 06:23:37PM +0300, Ido Schimmel wrote:
> 3. Miss. FDB entry not found. Here I was thinking to always tell the
> packet to go to the software data path so that it will trigger the
> creation of the "locked" entry if MAB is enabled. If MAB is not enabled,
> it will simply be dropped by the bridge. We can't control it per port in
> hardware, which is why the BR_PORT_MAB flag is not consulted.

Ah, ok, this is the part I was missing, so you can't control an FDB miss
to generate a learn frame only on some ports. But in principle, it still
is the BR_PORT_MAB flag the one which requires these frames to be generated,
not BR_PORT_LOCKED. You can have all ports LOCKED but not MAB, and no
learn frames will be necessary to be sent to the CPU. Only EAPOL, which
is link-local multicast, will reach software for further processing and
unlock the port for a certain MAC DA.

