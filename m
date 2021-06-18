Return-Path: <SRS0=EvOn=LM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB63BC48BDF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 20:36:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DF9E6124C
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 20:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DF9E6124C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wp.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S/Gl/bMlmlyOd6JMPe+yGc8oMIsUzsTOuWPj3tDl3js=; b=xH/H9fJZrayBJQ
	u+t+iOWyXU73+kekVuMDSIDUwwYmQ6orYK7524bGSTaBErCrngVBGUpTqvtQ2RQJL6X/m0mdH4yeg
	c4dTcZaP7eoFnQmTGCBUTpswIkjMi0MQOhoI6FDnyZextX5XUoFHS0MgGth3bN4tMQA/ckbtZ7eaZ
	H4QN5p8QT5CozWbopzcoU76mFNYuoaznjZh+fTm4zEGpQOsh9hbLhkP8uEc9Jk9dREEtwIXlntrmu
	bR5H4ApUS9ILVP0N3rRmm2zjrz27MzVHO1woeu1LKsZu4+Vpf5VhMYHXLWneno0xRi6NpMWAkdceH
	UYvVDN/DoaokhjlcV+eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luLE2-00FSQL-Ol; Fri, 18 Jun 2021 20:36:26 +0000
Received: from mx3.wp.pl ([212.77.101.10])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luLDq-00FSNt-06
 for linux-mediatek@lists.infradead.org; Fri, 18 Jun 2021 20:36:15 +0000
Received: (wp-smtpd smtp.wp.pl 1651 invoked from network);
 18 Jun 2021 22:36:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
 t=1624048566; bh=+T2bcNC2sHv5Q9iE59Xr1PSmlQKpTEY5+sa+qobzycw=;
 h=From:To:Cc:Subject;
 b=iTOJJf9fUeROTjRNWRZ3n2W1HNDuKCswwPfIsbedBObs/qoFDNXFdejAdoli5mfo2
 f9yQ/O201owv5rCglHhXy2sEcXFr3QGezP+/PqKq9vPzGtsuxDf6/+QX3+p1uZdS19
 TPqBDN6kI21sqYGxaeU9UtthBJXkSVStcwzmXwIU=
Received: from unknown (HELO kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com)
 (kubakici@wp.pl@[163.114.132.3]) (envelope-sender <kubakici@wp.pl>)
 by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
 for <whistler@member.fsf.org>; 18 Jun 2021 22:36:06 +0200
Date: Fri, 18 Jun 2021 13:35:54 -0700
From: Jakub Kicinski <kubakici@wp.pl>
To: Wei Mingzhi <whistler@member.fsf.org>
Cc: kvalo@codeaurora.org, davem@davemloft.net, matthias.bgg@gmail.com,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mt7601u: add USB device ID for some versions of XiaoDu
 WiFi Dongle.
Message-ID: <20210618133554.7d5c8e3d@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210618160840.305024-1-whistler@member.fsf.org>
References: <20210618160840.305024-1-whistler@member.fsf.org>
MIME-Version: 1.0
X-WP-MailID: 056658d67fe8a0af829ae53f4852c704
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000001 [8UKz]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_133614_233375_31D40F26 
X-CRM114-Status: UNSURE (   4.67  )
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

On Sat, 19 Jun 2021 00:08:40 +0800 Wei Mingzhi wrote:
> USB device ID of some versions of XiaoDu WiFi Dongle is 2955:1003
> instead of 2955:1001. Both are the same mt7601u hardware.
> 
> Signed-off-by: Wei Mingzhi <whistler@member.fsf.org>

Acked-by: Jakub Kicinski <kubakici@wp.pl>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
