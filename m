Return-Path: <SRS0=Eo9X=NA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08293C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 20:54:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A261F601FF
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 20:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A261F601FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sXvGgENUWiMB4aaw/hWdgplvSWXqlgfMS738jyWNvd4=; b=X0plHUlbWYPoB3
	Yx0oZKwI2yQD3P7KYznS5NOrcNQgsmLaEetKZWwHexpf0Uvg6k3QsWbugB0s8LXrUBa6FFFjiwW5c
	Lo83oJopbNbi1Gge0GTJDrd5RdaYMx0MxDV7ijvkYluuxEb32l5Xiu9hi4MkuWrh1GLwqexKmYCUk
	erfkJTu+yuFKzSHJlFJ3aL/56KDSig1nE+k4HImvUwPTk9+q/FjFXVApU9xU/SVXCHgP48fRNB+5X
	RzyaU/sjjICE1uDM0piLLIU3TKR1xUzx+VbklzoMjgA1JNHwnU9HwWkaFToGmteqg3Mg5078Fg3Ok
	xSq5dZZeB5aySnt1uiDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDCHM-001zMs-Nm; Mon, 09 Aug 2021 20:53:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDCHA-001zLZ-CI; Mon, 09 Aug 2021 20:53:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 13A0961019;
 Mon,  9 Aug 2021 20:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628542415;
 bh=VxjNPYWZUiQJduiJINk5u08LoDlzM1BFYtxKoZ0PqjE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Le3Wg2uSqGKjxozUllFPAR1ZeOOpaHLAwVQlCmBSdTkf+E2jAgiw+otWdZTVQFvWi
 mlJ/el8KlkKThkDJIbpFKajmf3TjfLeDZ6iKpt7wRX9WZkPHBRHdfBoM8odaT9B4hl
 zYJNbLsZQ9ea3F7n08WoQ6xKUUnwe9ZXhaKG+yMk93Ax4Jz7aAALoy0PZk7hqOEMxJ
 /3j3mxW0xKfgFJHXdgkwI3A19eifzSCZiZhLkCsB4j9YpbV6D/9R8JUi4ot35BilmW
 9I0BdNR6QvMR4fb8hSe9QzoP4BfrVHHBB0J2OMNw4+uMXsGCLm7VyeHZneH15UqIIz
 l4kqKLj/h7ifA==
Date: Mon, 9 Aug 2021 13:53:34 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Rocco Yue <rocco.yue@mediatek.com>
Cc: "David S . Miller" <davem@davemloft.net>, Hideaki YOSHIFUJI
 <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <rocco.yue@gmail.com>,
 <chao.song@mediatek.com>, <zhuoliang.zhang@mediatek.com>
Subject: Re: [PATCH net-next v3] ipv6: add IFLA_INET6_RA_MTU to expose mtu
 value in the RA message
Message-ID: <20210809135334.79f000e2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210809140109.32595-1-rocco.yue@mediatek.com>
References: <20210809140109.32595-1-rocco.yue@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_135336_490626_3AB8E281 
X-CRM114-Status: UNSURE (   7.94  )
X-CRM114-Notice: Please train this message.
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

On Mon, 9 Aug 2021 22:01:09 +0800 Rocco Yue wrote:
> +static inline size_t inet6_iframtu_msgsize(void)
> +{
> +	return NLMSG_ALIGN(sizeof(struct ifinfomsg))
> +	     + nla_total_size(IFNAMSIZ)	/* IFLA_IFNAME */
> +	     + nla_total_size(4);	/* IFLA_INET6_RA_MTU */
> +}

Please don't use 'static inline' in C sources, static is enough

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
