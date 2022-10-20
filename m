Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8771DC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 23:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jNzg2CMoVd1I4LouGMN20H+N7eFasZcE1vbuzP9T/xs=; b=VLq9iXAmQbjMHAqFlGYJzeZVcq
	jKQdHhFusG1nojed2WYpvEYZ3x8slE+mLmrvBN99GxA8y4PMC+qYNf0sjPboNZaP0jIrYDIooOQQy
	yacx+XodWEHdKnjmCgLZhn9mSk/CNYDTyYpqFkXTJTQe8vnRuaa1YeBvDfgpM54AkUSodc8PjbwJH
	+1rqjAtZWUbLCxvaHE2b6n7+RZnVkUWd+KhTgVbmaHT5As+ajiaeUGCp8yyycyfA2e3+gcXWPAyl7
	o//LqgafMDxXFmEzD0K3LFF7dGorgMiyyHantD6JXUi4mwzb4A7WIFfOaETFG8mGbKTwfVPaMz7kj
	vyv4PYYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olfQY-002oJK-IJ; Thu, 20 Oct 2022 23:58:18 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olfQN-002oGj-Eg; Thu, 20 Oct 2022 23:58:08 +0000
Received: by mail-ed1-x530.google.com with SMTP id e18so1924217edj.3;
        Thu, 20 Oct 2022 16:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jNzg2CMoVd1I4LouGMN20H+N7eFasZcE1vbuzP9T/xs=;
        b=jGsALBlOoX8f5qbY1dWPMgFbqX+TDJEuFICi8yi8v6ey26All+ybVMGus3u4o7CjtB
         2MlnTxAcMRNfrsJedjfk/cuF/95qZGp4fH+fJXWDNJozR5YTGoA10Lc9vs3BOIr2lmMI
         dxTsF38Tb8LG0uhRUly/piC5DxyLD8p/1KuWo8oLhwv7A3K8/GykppxaQsk8JSb+9BAA
         wNpb5AxxxGQlOKS4/adV7zfUH6dG8tJdUg8eyCGmIbl0tA3XCun6GVm7+XnY1YWsmZpG
         Kl/yNyKO6CH+FIURbM45H9nWjE6K3Ad/kHxcMcsi7kjVibiY8S1pBQQAlaEaeYR2oKp3
         6ghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jNzg2CMoVd1I4LouGMN20H+N7eFasZcE1vbuzP9T/xs=;
        b=eMrYGksL8zVdf+1tXDvQqC4GiMRzsVX/GoYhBw17nkvxvZfXIRAdHhOGCsMggoVAZ8
         P4PgGcc0omYNdU/9f4rU66ika91OIN3p2sexnJojC3JUbPt5pD4xONE4jrUEQ6tDpxTo
         Cfvzdya4zuo/26Of6F1yQs/VVaET4uf7X0c4UI+Vo0i8kSphM1kAyDuauKMWnSoiZztq
         xK6UmrrA+Fnl97QkZmU9FUw7nzwO1r7MryOZaSNQiiZLuEwCas81sIeXSg9M8+uUiXXx
         8jHM6/lJTKltIIV2lCjMLuF67uiL/ts2DOjbv9ba/9dzkNulZS9GrtxN+5f4kLdr7rUc
         W++w==
X-Gm-Message-State: ACrzQf07KqjZtMZ+0lFB/Bg4Px8r5ooni44fl/TU+6ifqHxd4V/exuHb
	9Suuh6o6eSf1AbtiE8OYqDubJmkjZxe9Dg==
X-Google-Smtp-Source: AMsMyM6ssiTPx2XFwPqjIn7V795i4Bu9+MHPdpCMZkdeH3IV8p2KB475oEPOc+uSDgaRj3mmcC4d7g==
X-Received: by 2002:a17:907:86a2:b0:791:910e:cce4 with SMTP id qa34-20020a17090786a200b00791910ecce4mr13251967ejc.36.1666310274807;
        Thu, 20 Oct 2022 16:57:54 -0700 (PDT)
Received: from skbuf ([188.27.184.197])
        by smtp.gmail.com with ESMTPSA id x24-20020a170906b09800b0078d46aa3b82sm10822041ejy.21.2022.10.20.16.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 16:57:53 -0700 (PDT)
Date: Fri, 21 Oct 2022 02:57:50 +0300
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
Message-ID: <20221020235750.ql5v55y3knnxofna@skbuf>
References: <20221018165619.134535-1-netdev@kapio-technology.com>
 <20221018165619.134535-1-netdev@kapio-technology.com>
 <20221018165619.134535-6-netdev@kapio-technology.com>
 <20221018165619.134535-6-netdev@kapio-technology.com>
 <20221020130224.6ralzvteoxfdwseb@skbuf>
 <Y1FMAI9BzDRUPi5Y@shredder>
 <20221020133506.76wroc7owpwjzrkg@skbuf>
 <8456155b8e0f6327e4fb595c7a08399b@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8456155b8e0f6327e4fb595c7a08399b@kapio-technology.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_165807_520099_F482D493 
X-CRM114-Status: GOOD (  24.49  )
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

On Thu, Oct 20, 2022 at 08:47:39PM +0200, netdev@kapio-technology.com wrote:
> Just to add to it, now that there is a u16 for flags in the bridge->driver
> direction, making it easier to add such flags, I expect that for the
> mv88e6xxx driver there shall be a 'IS_DYNAMIC' flag also, as authorized
> hosts will have their authorized FDB entries added with dynamic entries...

With what is implemented in this patchset, the MAB daemon uses static
FDB entries for authorizations, just like the selftests, right? That's
the only thing that works.

> Now as the bridge will not be able to refresh such authorized FDB entries
> based on unicast incoming traffic on the locked port in the offloaded case,
> besides we don't want the CPU to do such in this case anyway,

..because the software bridge refreshes the FDB entry based on the traffic
it sees, and the hardware port refreshes the corresponding ATU entry
based on the traffic *it* sees, and the 2 are not in sync because most
of the traffic is autonomously forwarded, causing the FDB to be
refreshed more often in hardware than in software..

> to keep the authorized line alive without having to reauthorize in
> like every 5 minutes, the driver needs to do the ageing (and refreshing)
> of the dynamic entry added from userspace.

You're saying "now [...] to keep the authorized line alive [...], the
driver needs to do the [...] refreshing of the dynamic [FDB] entry".

Can you point me to the code where that is done now?

Or perhaps I'm misunderstanding and it is a "future now"...

> When the entry "ages" out, there is the HoldAt1 feature and Age Out
> Violations that should be used to tell userspace (plus bridge) that
> this authorization has been removed by the driver as the host has gone
> quiet.

So this is your proposal for how a dynamic FDB entry could be offloaded.

Have you given any thought to how can we prevent the software FDB entry
from ageing out first, and causing the hardware FDB entry to be removed
too, through the ensuing switchdev notification?

> So all in all, there is the need of another flag from
> userspace->bridge->driver, telling that we want a dynamic ATU entry (with
> mv88e6xxx it will start at age 7).

Sorry for the elementary question, but what is gained from making the
authorized FDB entries dynamic in the bridge? You don't have to
reauthorize every 5 minutes even with the current implementation; you
could make the FDB entries static. The ability for authorized stations
to roam? This is why the authorizations are removed every 5 minutes,
to see if anybody is still there? Who removes the authorizations in the
implementation with the currently proposed patch set? The MAB daemon,
right?


Could you please present a high level overview of how you want things to
look in the end and how far you are along that line? Maybe a set of user
space + kernel repos where everything is implemented and works?

