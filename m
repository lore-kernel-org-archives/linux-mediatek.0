Return-Path: <SRS0=YoM+=H3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78121C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 18:58:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C14564F1A
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 18:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C14564F1A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wp.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6LnHp4mNqeRsx4I9pBQOh0xxIjo4mYu6ouOUxKYRYgU=; b=X3UU4673Icpye1HaoMaVlnJP0
	XZHRHNN6QwoyZxCj2cg1iTSDhA0jYU8YP3t3XfdW70fa0+7F2TcmmAKbgwp79ei55EHIbRZ9R245M
	jP7zpFBdLhuSfopbaw9IIomiuw8CLAbZrRzwT3xUwZeY7qbr5rt+KTq/HFyTtXGD/SsBJVskqTA7M
	pdgnjfwMgHgOUheeGVGjxgK85Ka9cCWWqxY0WNZTJQq5rT3Vv6aoY14dT+lUcBSlsk+06/H+3TGEi
	bMKo018op+XV6UjM3SRgTrNjECuaZJYXe2vWIKOPZYQ/ghJPRyPTkMyKEbwJzYGOKiU6uzvex4hm8
	Fz1JJAQcQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFLqH-0004Eg-2T; Thu, 25 Feb 2021 18:58:29 +0000
Received: from mx4.wp.pl ([212.77.101.12])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFLqF-0004Df-0g
 for linux-mediatek@lists.infradead.org; Thu, 25 Feb 2021 18:58:28 +0000
Received: (wp-smtpd smtp.wp.pl 5472 invoked from network);
 25 Feb 2021 19:51:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
 t=1614279103; bh=Jlr0mJspKRZ4zpFrq4Z9+nbzOH2E12NSX79EmButAiQ=;
 h=From:To:Cc:Subject;
 b=kW6vYXIBFSAG+UNmM40pyfcMd0GNROJzyfDRCJZx3VjGw8H8Hnza6CRyMKf4RThtJ
 DV2fJPgev3NYaR6XY/p3WLY0FmUk06psLEDvnB0pEUgQbUkEdyK00fn9zVKVjZCaTX
 iwFioTDs7sUP1Rnpz37mK644REXZOBAC0O4b34n4=
Received: from unknown (HELO kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com)
 (kubakici@wp.pl@[163.114.132.7]) (envelope-sender <kubakici@wp.pl>)
 by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
 for <colin.king@canonical.com>; 25 Feb 2021 19:51:42 +0100
Date: Thu, 25 Feb 2021 10:51:35 -0800
From: Jakub Kicinski <kubakici@wp.pl>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH] mt7601u: fix always true expression
Message-ID: <20210225105135.6a2e6953@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210225183241.1002129-1-colin.king@canonical.com>
References: <20210225183241.1002129-1-colin.king@canonical.com>
MIME-Version: 1.0
X-WP-MailID: d4752f3dadd47f61a803e18d0663a885
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000001 [0TIT]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210225_135827_220717_0C9E734B 
X-CRM114-Status: UNSURE (   8.89  )
X-CRM114-Notice: Please train this message.
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
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 25 Feb 2021 18:32:41 +0000 Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the expression ~nic_conf1 is always true because nic_conf1
> is a u16 and according to 6.5.3.3 of the C standard the ~ operator
> promotes the u16 to an integer before flipping all the bits. Thus
> the top 16 bits of the integer result are all set so the expression
> is always true.  If the intention was to flip all the bits of nic_conf1
> then casting the integer result back to a u16 is a suitabel fix.
> 
> Interestingly static analyzers seem to thing a bitwise ! should be
> used instead of ~ for this scenario

In what way? The condition is nic_conf1 != 0xffff AFAICT, how would we
do that with !?

> so I think the original intent
> of the expression may need some extra consideration.
> 
> Addresses-Coverity: ("Logical vs. bitwise operator")
> Fixes: c869f77d6abb ("add mt7601u driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Jakub Kicinski <kubakici@wp.pl>

Thanks for the fix!


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
