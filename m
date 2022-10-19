Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B96C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Oct 2022 18:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=onZg9bkGpyLkmJj2Fk6FDBy22LakxbtW4dE3qVAG/38=; b=oiWWKDzY6AD1KIJzFdRa9epwDv
	dSknwKXNznO+2akCbnlA5p3YxN4C6k4xmUt7hx4ZNtz35atKJiwVdJbNB07jHt3mo+RpC7JVNmLik
	IkJbxAOwRW1j6lddFf174bRMaMYNHEUL6UIP2+OQLmpSzVOJlm731LwTrjcBGaemLirC2WfhSqu8o
	+3UFM7rmXjqcPIsC9pCLX7dcRbMEgZzs1FaahnrN9/FLhMwf43Jkfc8kTfw8glPhYNAHL4HFruDCB
	Zd2mC1nNlNSr1ZFilh997hfjwcnIMAq3vugbwrjErdGgrBEK/f0dPaLR7LYBoxEfL4npBVhs/HT+P
	Ee9kKBQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olEGp-004kYe-Ir; Wed, 19 Oct 2022 18:58:27 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olEGd-004kTi-2G; Wed, 19 Oct 2022 18:58:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 03989B825B6;
	Wed, 19 Oct 2022 18:58:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74F1BC433C1;
	Wed, 19 Oct 2022 18:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666205891;
	bh=onZg9bkGpyLkmJj2Fk6FDBy22LakxbtW4dE3qVAG/38=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=s/QRSEYU6CfqIOUb1Rd8FcgomGAdkwREiqcsrf0LmVB9BwF9/81d8Y1hYeN2s3s/Y
	 VoD8ADpfMfOiR0hdz4/cPi94E1+bLqNMVKT3J3vpLIc8aXADo8Vb56zjYqOzZIHQwm
	 Q/38SLzyoFqo+T2vN+Dfl2YnHovoF/ZOdzxqgukeU0G4xJlnQ2zpVco6wuhLDrMUFm
	 x1INfQdLxkSsRmgDATky2yE9RbY+tdV1L5uYXxmL7MoWBO6cUCPVPiaEIaejaYJt2X
	 WiE0FZaJ76F0pnzhQxC5KrFNPUpv4xh85ymDN5KCcuWPKeVTpLc3sRp4Qbnax2+ZFj
	 iBmEGWQCRlBLg==
Date: Wed, 19 Oct 2022 11:58:09 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Hans J. Schultz" <netdev@kapio-technology.com>
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
Subject: Re: [PATCH v8 net-next 00/12] Extend locked port feature with FDB
 locked flag (MAC-Auth/MAB)
Message-ID: <20221019115809.552812a5@kernel.org>
In-Reply-To: <20221018165619.134535-1-netdev@kapio-technology.com>
References: <20221018165619.134535-1-netdev@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_115815_298515_729E7FB0 
X-CRM114-Status: GOOD (  12.47  )
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

On Tue, 18 Oct 2022 18:56:07 +0200 Hans J. Schultz wrote:
> This patch set extends the locked port feature for devices
> that are behind a locked port, but do not have the ability to
> authorize themselves as a supplicant using IEEE 802.1X.
> Such devices can be printers, meters or anything related to
> fixed installations. Instead of 802.1X authorization, devices
> can get access based on their MAC addresses being whitelisted.

FWIW half of this posting got stuck on the "email pipes" for a day..
somehow. Let's give Ido and others a chance to have a look but you'll
need to repost even if it's flawless because the build bots can't deal
with a delay that long :(

