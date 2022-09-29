Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA38C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 16:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c5YoEWNjyvIP6S2IX0gRXRFnp5Vc2gN0mY0swCH70bE=; b=RI094BU8S3klwov9YKYGxkjjal
	ZVxoo9YtL1/s9HU2RALx0Z7oF/vWr5m+VaFVxXm5JVGSHjJywO9uGVpTU77FLckCL21pUR9/HD8Vn
	ZcUdLTqGSVTVthG5Jfds3xSGEM6XZ4E3Yeh8uuKvKw8HaQ9GaugKR9ejhSdvHr50UtEjJSfz0Nk79
	P4Guyu782U5Ayyp4RXgu2glPyHkVLB3ktOq93jb0sfsBHBnPFlVfKZFgW/DpmZSaxrkqiA/OoA8aG
	F7f04/CuBGXJAxdpkqIyiY5DGxvItGFq4EO+I+drixE2X4FGkpM/FwbvhL9viMwaVsL6r5fZCX2KJ
	QNewQFGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odw8o-00444c-K3; Thu, 29 Sep 2022 16:12:02 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odw8a-0043wn-Iv; Thu, 29 Sep 2022 16:11:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E3067B823E5;
	Thu, 29 Sep 2022 16:11:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0464AC433C1;
	Thu, 29 Sep 2022 16:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664467905;
	bh=3UNXmMc0XLFmLrPUUGDB5+gyNKMjhdigqOhQGHRSdrA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WNh5qrP20dU0231I3OsV82y6I7NXzOH1OEvW/U+XYIvzP9zf4bw9oKl+OUo6uu+fw
	 FEdMtq7advOwZCOCnuIAxfEsjRcIJB62ZnVUVy0dnTTUdFxBYKxByOiGEZ6F8NxUBZ
	 1gX6UkmBf/lwa9i8heosMZWm9LEmelnaiZ5KuJIG0P3eL7/tfQxpTZ32R60iec3q3g
	 HFlmvjS60DbN75pqxIRqlL54ivAOh4f1InBwTyEQiYjTFN2DT18W58v1pWsyVuin+j
	 9abrb1S1v2Pf8XlhIo0BVZPb1ypyfglLA12eHr04Uijk7zkzuUkuYb+f/b97lfuymk
	 6eqkF7ZPUwOyw==
Date: Thu, 29 Sep 2022 09:11:43 -0700
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
Subject: Re: [PATCH v6 net-next 9/9] selftests: forwarding: add test of
 MAC-Auth Bypass to locked port tests
Message-ID: <20220929091143.468546f2@kernel.org>
In-Reply-To: <20220928174904.117131-1-netdev@kapio-technology.com>
References: <20220928174904.117131-1-netdev@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_091148_802872_CA47EC15 
X-CRM114-Status: GOOD (  15.97  )
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

On Wed, 28 Sep 2022 19:49:04 +0200 Hans Schultz wrote:
> From: "Hans J. Schultz" <netdev@kapio-technology.com>
> 
> Verify that the MAC-Auth mechanism works by adding a FDB entry with the
> locked flag set, denying access until the FDB entry is replaced with a
> FDB entry without the locked flag set.
> 
> Add test of blackhole fdb entries, verifying that there is no forwarding
> to a blackhole entry from any port, and that the blackhole entry can be
> replaced.
> 
> Also add a test that verifies that sticky FDB entries cannot roam (this
> is not needed for now, but should in general be present anyhow for future
> applications).

If you were trying to repost just the broken patches - that's not gonna
work :(

