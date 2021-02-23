Return-Path: <SRS0=4Hoy=HZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7DBEC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Feb 2021 02:45:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8177F60232
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Feb 2021 02:45:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8177F60232
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=70Nfadn7Ir0mzTnPYHWAm12sP7QwNT/mBqg8EMrsMrE=; b=jHxjcHhCXtAhmACmJxa7JCC04
	2xLkjGJlhvCrUF5K//5EuaZTJ+/VWYEjuJjVdzd7IRYXPvY/iqjq6e9rQDGcg8QBv19aY1BTHo7Aj
	caBDKJfgwxIkSyzTgh/XMhF1Dq2vy1sBx6YPW/KXofHeQqw+fUwGdGHEAxBRSMGeNjOLuK/LhSOto
	ux2HfCDTKXYCoQpVeeo0QgfJ3cjLNHyRdkDQckbq+fVCcnXNiaDynjdfmIjmgqqmrC5GqT3GBsANZ
	VpORiKbK+G4QE83gT1np5Vnu1NwSlpBRsZY75/+6aE4Ucc7yBQmAGxD3hwU5FuxyREMwPYFChEmgm
	CIS/w2FSA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lENhV-0007iO-1c; Tue, 23 Feb 2021 02:45:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lENhQ-0007hm-Up; Tue, 23 Feb 2021 02:45:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE4446023B;
 Tue, 23 Feb 2021 02:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614048319;
 bh=PufLx0l8jwwD+QrNL96jJCdWhbaoxfgLzn8QuxgROHs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pls659a3oV40H01Yg6G4tnOIA7CGvceZjX+zYHKTz25Zd2OP2JVSd+rYTyAFwWtPY
 chOflQP07cSB0rdNCYLQ982DWBErx5xoPoILnSbwNsCs9QLt3AXLJclh4LG+Cypp0e
 CrNPOI0kzMseQfn98bKVgGJOk90JOgRVqJYzyCBD+ahYQTwR18pwCp8XNoNlRhH/3b
 sv7FRZLPaHL5IJf/5U6Ryimg+UpapTuOCI/g3TkzSsGxlXvp2rI/oWc1m/9pNK+EKA
 PIRv2ZUmhT+r3vHWgeQIK9pOpe8UsRCFTGseM6AQY2p7K/F6p0tbCeQj/EuBGoKXIZ
 2wcjQg+T24eXQ==
Date: Mon, 22 Feb 2021 18:45:15 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "rocco.yue" <rocco.yue@mediatek.com>
Subject: Re: [PATCH net-next 2/2] net: ipv6: don't generate link local
 address on PUREIP device
Message-ID: <20210222184515.61c268ec@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <1614045791.6614.3.camel@mbjsdccf07>
References: <20210128055809.31199-1-rocco.yue@mediatek.com>
 <20210129190737.78834c9d@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <1612418761.1817.19.camel@mbjsdccf07>
 <1614045791.6614.3.camel@mbjsdccf07>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_214521_170640_87E40EF3 
X-CRM114-Status: GOOD (  15.72  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: wsd_upstream@mediatek.com, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 23 Feb 2021 10:03:11 +0800 rocco.yue wrote:
> On Thu, 2021-02-04 at 14:06 +0800, rocco.yue wrote:
> > On Fri, 2021-01-29 at 19:07 -0800, Jakub Kicinski wrote:  
> > > On Thu, 28 Jan 2021 13:58:09 +0800 Rocco Yue wrote:  
>  [...]  
> > > 
> > > There is no ccmni driver in the tree - is this for non-upstream
> > > driver?  
> > 
> > ccmni is the name of MediaTek mobile interface, currently, it is
> > non-upstream driver and we plan to upstream these driver codes this
> > year.
> > 
> > Honestly, the reason why upstreamed this patch is not only that it can
> > be used by ccmni, but also I observed that the current Linux kernel does
> > not generate ipv6 link-local address only when addr_gen_mode ==
> > IN6_ADDR_GEN_MODE_NONE. We hope kernel can add a device type so that no
> > ipv6 link-local address can be generated in any addr_gen_mode.  
> 
> gentle ping for this patch set.

We don't merge patches without upstream users.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
