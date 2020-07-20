Return-Path: <SRS0=A+tK=A7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31218C433F7
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 15:55:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0267C206E9
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 15:54:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ysLIpWDv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=wp.pl header.i=@wp.pl header.b="FYBCbTFU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0267C206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wp.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0mAJVKaOmjT0u8/yJgxLrMlcsGpSO1PFUu95cKCN+C0=; b=ysLIpWDvOjY4wmsFvYx9sEbQP
	9jKoQ1RTqGobBgztxmIHNhq/dYo0zuptOGponPyYEPl582DrQfBpgtrQ5MmBR8lbR876oytNvYC7Z
	YfFlN2xKVLZpZWNBGJROG/iKCcvgFNFprDd3GSgeusp93VPnqNDGOet4UDCjCtKfBzTvVIemHSOdG
	9vkdwkQ6gWoVx9nJxcymWo3nv2+0T4YtCZXwBIEORIUN0NT0SQAcowjXUr/KrOuq1zLHDURmMMd3c
	s4C8elgtwYH43WZ1cfJ33wTDuFlrkbb0pLIK5/2CQt75NXQyt2cd0plGwC9hBlmCs116JDMEEjdZF
	3m6//xmJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxY7l-0005sx-0S; Mon, 20 Jul 2020 15:54:41 +0000
Received: from mx4.wp.pl ([212.77.101.11])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxY7h-0005pr-M8
 for linux-mediatek@lists.infradead.org; Mon, 20 Jul 2020 15:54:38 +0000
Received: (wp-smtpd smtp.wp.pl 16606 invoked from network);
 20 Jul 2020 17:54:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
 t=1595260471; bh=Y0bZYOg1d1EJBOpSBHiUjDo02WQDRKDZBBBZtcRjU7Y=;
 h=From:To:Cc:Subject;
 b=FYBCbTFUnDIBtbI8nTQmeLGktKbYGctKcXLK3jORi7mXETEucsm7LCdpr4Bf1uKX8
 bbYHCWx/1KOkegDqDqRBH/pctdGFLWPUKKjFjq5ON0hd/U10aiHTiJHn9vsPgTrx73
 9GR+tLSiaIUzFWokKbrx3Qq3gQwhVaQ05ylNKn3E=
Received: from unknown (HELO kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com)
 (kubakici@wp.pl@[163.114.132.7]) (envelope-sender <kubakici@wp.pl>)
 by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
 for <navid.emamdoost@gmail.com>; 20 Jul 2020 17:54:30 +0200
Date: Mon, 20 Jul 2020 08:54:22 -0700
From: Jakub Kicinski <kubakici@wp.pl>
To: Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: Re: [PATCH] mt7601u: add missing release on skb in
 mt7601u_mcu_msg_send
Message-ID: <20200720085422.40539aa4@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20200718052630.11032-1-navid.emamdoost@gmail.com>
References: <20200718052630.11032-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
X-WP-MailID: 86ad31f636f93e20d39630a6dd07675f
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000001 [geJz]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_115437_900370_22B28222 
X-CRM114-Status: UNSURE (   4.93  )
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 18 Jul 2020 00:26:29 -0500 Navid Emamdoost wrote:
> In the implementation of mt7601u_mcu_msg_send(), skb is supposed to be
> consumed on all execution paths. Release skb before returning if
> test_bit() fails.
> 
> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>

Acked-by: Jakub Kicinski <kubakici@wp.pl>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
