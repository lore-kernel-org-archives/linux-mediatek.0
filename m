Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB49C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 15:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JOJYIxLhKlqXLrEBq+v5LlENJBXu/0YMWzvW35tuScA=; b=3m5SDYItfwCszLTSESUpIJ8tgE
	Qky3HoKO8nwzINiG+IMF+MymKLVSJgqdG1Iftum1/LdmXke0Rnl+aLzxKx2cpMEX/cIyqwIiUbJ7K
	l2xvlWihX1anQhinlZ9rc3nYGrjmb3G3LCpyzmOewX02P/DUJZOOOruHHSAJgCSlWp4234tGPGg67
	1JQqIgg+BsaKlN6yQPBHXJNSOD6HllF1Vi5sx8g3KyZY7Hk6EXlzYO6DjXnitpFS2fU47N8V0Dta1
	xxGm18J1hy2qYI1Dps/GxoU6JgF2dO/xWt2NzT9rslb23RJO2/NXhn9QU4lgWcT6KTqSP7XRdIfjJ
	rHCLasHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNblY-00GVJ0-At; Thu, 02 Feb 2023 15:44:48 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNbkS-00GUpz-Fi; Thu, 02 Feb 2023 15:43:45 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 31F625C01FA;
	Thu,  2 Feb 2023 10:43:34 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 02 Feb 2023 10:43:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1675352614; x=1675439014; bh=JOJYIxLhKlqXLrEBq+v5LlENJBXu
	/0YMWzvW35tuScA=; b=m84jr8rKQV77Hb2CmakvgDV89DA0ahqSC9yuKDL6rjip
	xqThy9a3EDhOe7S1QQXC/FOAlej+sJovhmyCI82ZlkzBXvfb0DKAvIr68wAA0zuT
	lqyMTRCZaPCOfHTJFCDXNq+/G9cOttfUr+M34Ty0V6qCPeARAsRXDJKD7PD7q3Xk
	bDVjhYjpnWTH21BRAtqa4cdgylS7bPRO/pN4REBryibmmeJPZ2Iq582Uhh7z7CfY
	fyUxmXAqFRMj1pvmgaqi9YeXpMOq37zQo5tPy8GaWLs1MEJzdEHMQNJwQb9AYrD9
	ROk/hoKvpk8yF52jkKzvAcLYB4qy1Dhjww3ZrMOMiQ==
X-ME-Sender: <xms:JNrbY1-2B1Jauxz6iGZOPDh_1tGT9yVQ3s2KgkXEtW7DfSfyC0VFmQ>
    <xme:JNrbY5scrKQaLiVv6D_8mJ-I0mWRjpVWOhkdQc5EASB60nIhDMa94q7nVjeru589L
    jFQmbNEyJ8h7dU>
X-ME-Received: <xmr:JNrbYzDIP3-XVCr5kihSOShCyU8ZyFodH-b1PUggVtVh_4JqYg4yMMLfc9lieothdALuf4dLCXL1_DrwOvKehccUe3U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefkedgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepkfguohcu
    ufgthhhimhhmvghluceoihguohhstghhsehiughoshgthhdrohhrgheqnecuggftrfgrth
    htvghrnhepjeekleettddtgfeuvdffieffudegffetgedtteffvefgjeejvefhffehtddv
    ueevnecuffhomhgrihhnpehpohhrthdrshhhnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepihguohhstghhsehiughoshgthhdrohhrgh
X-ME-Proxy: <xmx:JNrbY5fIJu3RkR1-Z8e79Q7xoV9OaVLUEUwi_b44d8SeRnfvpVNsDQ>
    <xmx:JNrbY6PWMusIRYARBSAajbLYQHtybAPmv1lHbV96nnrHdqKmyi-jIA>
    <xmx:JNrbY7lxpopmegWbvsco-sGcH3kOUGGaYqwM6UDLv-IsjOW8EqaH7w>
    <xmx:JtrbY_YdzL_72r4z2IEfXcoob5oPx8XHspmkBS7hMc9LAV-bALXVpg>
Feedback-ID: i494840e7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Feb 2023 10:43:31 -0500 (EST)
Date: Thu, 2 Feb 2023 17:43:28 +0200
From: Ido Schimmel <idosch@idosch.org>
To: netdev@kapio-technology.com
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,	Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>,	Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>,	Kurt Kanzenbach <kurt@linutronix.de>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Woojung Huh <woojung.huh@microchip.com>,
	"maintainer:MICROCHIP KSZ SERIES ETHERNET SWITCH DRIVER"
 <UNGLinuxDriver@microchip.com>,	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,	DENG Qingfang <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Russell King <linux@armlinux.org.uk>,
	Christian Marangi <ansuelsmth@gmail.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
	"open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER"
 <linux-renesas-soc@vger.kernel.org>,
	"moderated list:ETHERNET BRIDGE" <bridge@lists.linux-foundation.org>
Subject: Re: [PATCH net-next 0/5] ATU and FDB synchronization on locked ports
Message-ID: <Y9vaIOefIf/gI0BR@shredder>
References: <20230130173429.3577450-1-netdev@kapio-technology.com>
 <Y9lrIWMnWLqGreZL@shredder>
 <e2535b002be9044958ab0003d8bd6966@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2535b002be9044958ab0003d8bd6966@kapio-technology.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_074340_665075_17A70041 
X-CRM114-Status: GOOD (  13.15  )
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

On Thu, Feb 02, 2023 at 08:37:08AM +0100, netdev@kapio-technology.com wrote:
> On 2023-01-31 20:25, Ido Schimmel wrote:
> > 
> > Will try to review tomorrow, but it looks like this set is missing
> > selftests. What about extending bridge_locked_port.sh?
> 
> I knew you would take this up. :-)
> But I am not sure that it's so easy to have selftests here as it is timing
> based and it would take the 5+ minutes just waiting to test in the stadard
> case, and there is opnly support for mv88e6xxx driver with this patch set.

The ageing time is configurable: See commit 081197591769 ("selftests:
net: bridge: Parameterize ageing timeout"). Please add test cases in the
next version.

