Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D949C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 19:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aaDEdw4XrYhaGhynkqNY9M1M+YMfTVdk8OXVm2FFzzQ=; b=FuoOYrkGUa6yWM
	pr5BeQ8wMumKCrOb2QS1hAxy8O4Se4A6J20+wv01x8iTT88HOeM/pQ+EOfxDrEHf/2OKPxHIo1t4t
	mICD2F9RGyb7p/ZpEWMhRZIJOfZZOoEXKPk7nNtS+epvSOG1/sRt3+pglbjn5m9zhopICDVJdCnqL
	0q+HTvtFZRwD5l0HGD3ZoAX4scI0RdNI7oOpWJ6llLhu9e/Dw8vf3BelDqL/fdHyh3AeB4jAEYtXl
	Z78nEcVw++D0ZHGFqA4VxywY4rF+rluY71wiILb4ct51zdJ8e2t9mS2hyaC3/vPvMliGjiYlwXP1N
	+nDZ8zowKDqyOg9vpAvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhzFS-002AV6-NK; Fri, 22 Apr 2022 19:47:22 +0000
Received: from mx3.wp.pl ([212.77.101.10])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhzFP-002ASN-Mg
 for linux-mediatek@lists.infradead.org; Fri, 22 Apr 2022 19:47:21 +0000
Received: (wp-smtpd smtp.wp.pl 29161 invoked from network);
 22 Apr 2022 21:47:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
 t=1650656832; bh=xN2TT2giRziTYzxkSRV3HAksGNGWVBKa+uXJBNXkzg8=;
 h=From:To:Cc:Subject;
 b=OaGiXdxuDtJlr6gXKJMqvpfHpw99AKST0JhzfU229DzbMl/J+krQWmDL0JaMn3wZ+
 nLYzvdrGHvHszYhPrBHs6aXhFXMAhayra5vhItjEqeLtXIx/Awutg9aHIuu0eIUDfd
 DolY4LgU+nV3ARsdp1tJC43865542AEiY+9HqATk=
Received: from unknown (HELO kicinski-fedora-PC1C0HJN)
 (kubakici@wp.pl@[163.114.132.6]) (envelope-sender <kubakici@wp.pl>)
 by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
 for <zhaojunkui2008@126.com>; 22 Apr 2022 21:47:12 +0200
Date: Fri, 22 Apr 2022 12:47:04 -0700
From: Jakub Kicinski <kubakici@wp.pl>
To: Bernard Zhao <zhaojunkui2008@126.com>
Cc: Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, bernard@vivo.com
Subject: Re: [PATCH v2] mediatek/mt7601u: add debugfs exit function
Message-ID: <20220422124704.259244e7@kicinski-fedora-PC1C0HJN>
In-Reply-To: <20220422080854.490379-1-zhaojunkui2008@126.com>
References: <20220422080854.490379-1-zhaojunkui2008@126.com>
MIME-Version: 1.0
X-WP-MailID: 9321f50bc9e4db09d6c2149ef2c2edd3
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000A [UYOE]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_124720_278389_DE9A49F5 
X-CRM114-Status: UNSURE (   7.36  )
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

On Fri, 22 Apr 2022 01:08:54 -0700 Bernard Zhao wrote:
> When mt7601u loaded, there are two cases:
> First when mt7601u is loaded, in function mt7601u_probe, if
> function mt7601u_probe run into error lable err_hw,
> mt7601u_cleanup didn`t cleanup the debugfs node.
> Second when the module disconnect, in function mt7601u_disconnect,
> mt7601u_cleanup didn`t cleanup the debugfs node.
> This patch add debugfs exit function and try to cleanup debugfs
> node when mt7601u loaded fail or unloaded.
> 
> Signed-off-by: Bernard Zhao <zhaojunkui2008@126.com>

Ah, missed that there was a v2. My point stands, wiphy debugfs dir
should do the cleanup.

Do you encounter problems in practice or are you sending this patches
based on reading / static analysis of the code only.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
