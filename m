Return-Path: <SRS0=7tkd=FN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7959C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 00:29:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BDEB233A2
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 00:29:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BDEB233A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:From:Subject:To:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=f1YE31L4Am/gTql9tIn7EImzJWyKbq1P6eSMyJCvyyg=; b=FpyXdb8srifCSDLxubT/JL16N
	PN4f6HTAMnf1MUh/XD5ltQT4Wjq+ETBWIBB+o/1xJeKUEgkMAl0V6/KIU8ImmImXR/H6ijQhHWCzh
	pwnlTHL2ofpbfvuGWbtUnG6ClFv2pjMjCbwP4j29zu/kOnzCBQAPEw8+oKoey0veP4Xg8UTcs7WZK
	4Dq2yQz4oXx0eUar9BQj0aJaCO31PNQW4f2r+hHYdHcOqwcwnthlrtTxkTYLjMRaWGik6kR8vX3wG
	JVcwUo7DCormNIRa79gjsLz6nAhnpFd2btXtdS6VbCtvfIz8bpW277KWQc7DOQbgaYeo3LyjlfAG1
	UQXCN5TZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmnMb-0007vu-IQ; Wed, 09 Dec 2020 00:29:49 +0000
Received: from shards.monkeyblade.net ([23.128.96.9] helo=mail.monkeyblade.net)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmnMY-0007v5-FH
 for linux-mediatek@lists.infradead.org; Wed, 09 Dec 2020 00:29:47 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 by mail.monkeyblade.net (Postfix) with ESMTPSA id 6E7784D248DBE;
 Tue,  8 Dec 2020 16:19:59 -0800 (PST)
Date: Tue, 08 Dec 2020 16:19:58 -0800 (PST)
Message-Id: <20201208.161958.862390002072491156.davem@davemloft.net>
To: dqfext@gmail.com
Subject: Re: [PATCH net-next] net: dsa: mt7530: support setting ageing time
From: David Miller <davem@davemloft.net>
In-Reply-To: <20201208070028.3177-1-dqfext@gmail.com>
References: <20201208070028.3177-1-dqfext@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2
 (mail.monkeyblade.net [0.0.0.0]); Tue, 08 Dec 2020 16:19:59 -0800 (PST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_192946_613006_8F61323C 
X-CRM114-Status: UNSURE (   6.45  )
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
Cc: andrew@lunn.ch, Landen.Chao@mediatek.com, f.fainelli@gmail.com,
 frank-w@public-files.de, netdev@vger.kernel.org, sean.wang@mediatek.com,
 linux@armlinux.org.uk, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, kuba@kernel.org, olteanv@gmail.com,
 vivien.didelot@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: DENG Qingfang <dqfext@gmail.com>
Date: Tue,  8 Dec 2020 15:00:28 +0800

> MT7530 has a global address age control register, so use it to set
> ageing time.
> 
> The applied timer is (AGE_CNT + 1) * (AGE_UNIT + 1) seconds
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>

Applied, thanks

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
