Return-Path: <SRS0=dVWc=FR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D0FC433FE
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Dec 2020 01:01:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51B5D22AEC
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Dec 2020 01:01:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51B5D22AEC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AQ/xP8CkayTyQGIHX5T2U/z2JpF7419t90L4BTmZ8b0=; b=UzTjnO2yHdb3yrRlFwib7u+i8
	cFCWEDNsNyrqGqGK3sEPbnBmILQ9P/kK1OnHqNYwrxW32Vi6Mby8laJmxRCIAW5JTCjkuZTm3742A
	R6IXya/7b0H0vbgWsTWiqGabc4VaLJKHeQoi4TDyrAmYoVMpnkCqO3r1n9MAHVDJTZB0Q7VHponS2
	zXdF0TrikdtIJAS56OauCY4y+4oWuELeXKAT1mnzfsKnMLMex4YxezzicNva8VACziRpkCB/ZjT57
	HKF8WYAE/t2WdVIFGDsVgCABI13UZXKcyaYhMG+RZ+dp7dyQLbkgVYCyobqBxvOEhjB253AHDC0Ez
	jb4hLioXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1koFlJ-0004OC-BG; Sun, 13 Dec 2020 01:01:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koFlB-0004Nn-8h
 for linux-mediatek@lists.infradead.org; Sun, 13 Dec 2020 01:01:14 +0000
Date: Sat, 12 Dec 2020 17:01:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607821270;
 bh=TjjJnFAHpjE43x5O2wyYUi+2iV+3ePeMYO5Fs9lnrb0=;
 h=From:To:Cc:Subject:In-Reply-To:References:From;
 b=p66WcL0RAqv5s8anlXqWt4s/SjYTBR65TokUDUOOmUaLLt3VHrY1PeZE3O/s2P4mN
 LiVv0XvZDzLD+UUOhv+0XUBjM8DoSsuRTWsn7Ch0ZhWEj7fMmiEFoFMlYC4FR9R7q9
 vywoWWCULTTdxO/Zp/cLUu3Vobdbch+MVDpVe2j51NmZCQIs6c4x81y5PqjODG+28N
 iryN3Gs53E8qyePrUhcIfKjiZ1Z1FvHQnjxavlCAckivbq9Q9alxGaKPH6fbX5P836
 hI1g+DMPzDlxkxWu7UHDagYGqfOJGtRK7TxHxz/YJRcILLVh8oI79CRrRT8PUhIM70
 Rz6siGJCElkOw==
From: Jakub Kicinski <kuba@kernel.org>
To: DENG Qingfang <dqfext@gmail.com>, Landen Chao
 <Landen.Chao@mediatek.com>, Vladimir Oltean <olteanv@gmail.com>
Subject: Re: [PATCH net-next] net: dsa: mt7530: enable MTU normalization
Message-ID: <20201212170109.311791a5@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20201210170322.3433-1-dqfext@gmail.com>
References: <20201210170322.3433-1-dqfext@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201212_200113_481673_54584D33 
X-CRM114-Status: UNSURE (   5.49  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Russell King <linux@armlinux.org.uk>, "David
 S . Miller" <davem@davemloft.net>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Vivien Didelot <vivien.didelot@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 11 Dec 2020 01:03:22 +0800 DENG Qingfang wrote:
> MT7530 has a global RX length register, so we are actually changing its
> MRU.
> Enable MTU normalization for this reason.
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>

Applied, thanks and thanks for the reviews.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
