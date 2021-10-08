Return-Path: <SRS0=sTTz=O4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71304C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 02:15:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F99161139
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 02:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F99161139
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wp.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gT7JrtcTmN635rWzNDmbGnZJnMMuQgZBCOf2OZpDY5E=; b=h7xwzETpYxj7Kv
	ndAO2zZluUS6eUS/DjD6TgofZe6IB+rqzoCOhbNpptur/0QOO5Y0GhiMfvBTSnVa9wcXRQeM/fQ6C
	FHjMlshZhBbbRdQneDjT+1u8H+6xg75/NarGZEaNW9E+X3OhzGT4ir75u+KgmikGDYfMNJtptbDeo
	CHIHEKWlszCfVnYrne3GWGer+i/CejKvvqMTBGgJ9bC06xw2aZVVBolu9kMoYbsTeWvmtazFu2El1
	C+BjDj1N/dmh/MX11AnQ6vz85IAO/8rtNnHrfxxPfx8xg/LigYwhEwxcDW1l3BKe8/n91nV/PlPJz
	qdGoPuOhRWKIUsPuX5LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYfPa-001JEL-Un; Fri, 08 Oct 2021 02:15:02 +0000
Received: from mx4.wp.pl ([212.77.101.11])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYfPX-001JAi-HW
 for linux-mediatek@lists.infradead.org; Fri, 08 Oct 2021 02:15:01 +0000
Received: (wp-smtpd smtp.wp.pl 29449 invoked from network);
 8 Oct 2021 04:14:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
 t=1633659288; bh=4+iA2jWt06Zj7Wf7mNNn1ZAYUuFTYUHAxtblldAFv6U=;
 h=From:To:Cc:Subject;
 b=EEuFNsE2kS9t5ssacWgxkwcwiivkoloSjdhsPjt1dK96noh1LYbU75w1SFhfAAX1h
 IlQnzMt3pKTmtpEz/Oi0AFtnxNmqLkdY5TtmT7To+zRlei3NYPn9725uCeoRxxgErF
 Z6IQUKhAq5+7XggJE6Uhlm7w58GE37JYhxQhr5a4=
Received: from unknown (HELO kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com)
 (kubakici@wp.pl@[163.114.132.5]) (envelope-sender <kubakici@wp.pl>)
 by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
 for <colin.king@canonical.com>; 8 Oct 2021 04:14:48 +0200
Date: Thu, 7 Oct 2021 19:14:42 -0700
From: Jakub Kicinski <kubakici@wp.pl>
To: Colin King <colin.king@canonical.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, "David S . Miller"
 <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mt7601u: Remove redundant initialization of variable ret
Message-ID: <20211007191442.2da691df@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20211007234153.31222-1-colin.king@canonical.com>
References: <20211007234153.31222-1-colin.king@canonical.com>
MIME-Version: 1.0
X-WP-MailID: 97d23a12387b9de539baf411b446f3b8
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000003 [YVDm]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_191500_107232_2EDED234 
X-CRM114-Status: UNSURE (   7.24  )
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

On Fri,  8 Oct 2021 00:41:53 +0100 Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable ret is being initialized with a value that is never read,
> it is assigned later on with a different value. The initialization is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Jakub Kicinski <kubakici@wp.pl>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
