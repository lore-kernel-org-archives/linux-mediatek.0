Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86DFC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 16:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/mQ04TarbYOc81F3XSoNnC0ABQJIzSsrEnSd9dzgC+U=; b=vNFnNWOtzZwl1YLR0RdSFS6dRf
	8Rv4hQn3hnePYGZDyZ2HYDSHTqQGKnuzde5sWJV3/Sret8h+EHV7mcDtvR+PR4+zIqvb1uYvMPw0m
	mespmyHm/P8/AcP7D4DEnoR+Fz4ETZSnYGPvPJAeEQT+d985ZbRQOfrjO7ynaHrSvcYYdBHpF9FqW
	W8MyHRuavg/4x1LcEGaTU58AoEtK/LNdFkYJWXBJXt4UoDQG6sga7dMJzQDqQ+1B8FuJBDV5p0dny
	1AyFaizBq1yYli47AhelY5Zucloud4SOKLc1ZFJVBTh7Iv7ploiv4y4txiUfm48Ur0230sCO276IE
	27aRJVvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odw7j-0043WQ-Cq; Thu, 29 Sep 2022 16:10:55 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odw7W-0043PS-8h; Thu, 29 Sep 2022 16:10:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8C1EBB82494;
	Thu, 29 Sep 2022 16:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF9A3C433D6;
	Thu, 29 Sep 2022 16:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664467839;
	bh=Y6I9baSJX7t5noQG7pic8bbMiKke70Jgc+M0Pyupuok=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Pqfy6CpH04vXHNlCeK8divuCivx2ROtaBL3uONDUej220w1nMOTrfkrIWkCha3cf0
	 mYqgG4WF0OV/y+aDBeObSFdyBirolLFDw+VUqOkkb70Rg1KH2/kEPjOVDoe+UZah8t
	 fUfA/CA+o2xOimsnrbCe7bhgbkI5z38o8HC9pZ+5F+SUKe21VNP2UU3w0PlZHujG2b
	 jlZ11ePpC6UfyRLTHltwyYZwK1XHXpI7O11NQ8du4cieCcQFDnHlv+gSQy8zMlSlYz
	 tXHZMSs03B6i2mo5I3+1x48nn29HmyvGkPlSCx6W8htFtsLAALZ48d9Hp7jndUrUws
	 FwKbObCc3ej9w==
Date: Thu, 29 Sep 2022 09:10:36 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Hans Schultz <netdev@kapio-technology.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org, Florian Fainelli
 <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot
 <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Kurt
 Kanzenbach <kurt@linutronix.de>, Hauke Mehrtens <hauke@hauke-m.de>, Woojung
 Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com, Sean Wang
 <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, DENG
 Qingfang <dqfext@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Jiri Pirko <jiri@resnulli.us>, Ivan Vecera
 <ivecera@redhat.com>, Roopa Prabhu <roopa@nvidia.com>, Nikolay Aleksandrov
 <razor@blackwall.org>, Shuah Khan <shuah@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Christian Marangi <ansuelsmth@gmail.com>, Daniel
 Borkmann <daniel@iogearbox.net>, Yuwei Wang <wangyuweihx@gmail.com>, Petr
 Machata <petrm@nvidia.com>, Ido Schimmel <idosch@nvidia.com>, Florent
 Fourcot <florent.fourcot@wifirst.fr>, Hans Schultz
 <schultz.hans@gmail.com>, Joachim Wiberg <troglobit@gmail.com>, Amit Cohen
 <amcohen@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 bridge@lists.linux-foundation.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v6 net-next 0/9] Extend locked port feature with FDB
 locked flag (MAC-Auth/MAB)
Message-ID: <20220929091036.3812327f@kernel.org>
In-Reply-To: <20220928150256.115248-1-netdev@kapio-technology.com>
References: <20220928150256.115248-1-netdev@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_091042_483631_6B97E9BD 
X-CRM114-Status: GOOD (  12.07  )
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

On Wed, 28 Sep 2022 17:02:47 +0200 Hans Schultz wrote:
> From: "Hans J. Schultz" <netdev@kapio-technology.com>
> 
> This patch set extends the locked port feature for devices
> that are behind a locked port, but do not have the ability to
> authorize themselves as a supplicant using IEEE 802.1X.
> Such devices can be printers, meters or anything related to
> fixed installations. Instead of 802.1X authorization, devices
> can get access based on their MAC addresses being whitelisted.

Try a allmodconfig build on latest net-next, seems broken.

