Return-Path: <SRS0=Vqxm=DT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BDD1C433E7
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 16:36:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96F9120838
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 16:36:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AxTYmMEL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="beOY3p8L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96F9120838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ah2jB/YN1Qrv3b3yLYe4X4GOqBhWD7+KvfGd2BwgaE0=; b=AxTYmMELPEcu669H0cVZRAugo
	0kMKPjPz4hUWNAUGZuB9RF+3MWLCuuVXUvGMBz9PByz3+XdgJYnLdznSnAaKNJWMlhGte8bBcflvh
	WGdUk/BTFH4mLhHoR16NpLJIuR3euK2HlGG299sNMIsdNZtI8laeGSxkZWTg+EeY+uqq1ZX7QzAC2
	Mf9OeP7jaxcnZs4E3GSBQFlS1Ynrr2p6pbSvhRflSHUmBN3D80wlHZ2N+/4J8ogNuSJZT4fnZkxdw
	FiFj77opC1qVW6hz2Mh2YZYxaRr4tCjOGwm9Fr2sMYPpFZFM4506xoljAq6hmrmylbY0EAPQ3gftv
	TnxN8pc2w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kS0oV-0004hN-LO; Mon, 12 Oct 2020 16:36:43 +0000
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kS0oO-0004dt-B4
 for linux-mediatek@lists.infradead.org; Mon, 12 Oct 2020 16:36:41 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1602520597; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=sjfpuF6+YKnsfdv4FleQNSfze7itX1mgqGzQj3DwSSs=;
 b=beOY3p8LbF9vwoqsXsiRIGvsN4Lfc6Ih+SEEGvP5uTx8aV3smDfqqV1kbV8yxKMYN834q26F
 RWu7kvvIdQf783XVvr5LIwXy5GzCoFo46DM56OepH9gYgzhsBmLZa7lHrM0WEAHdwceLh2nI
 1Q+ASsFpkm2h9a8sUUEpxDTgZzs=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f84860aa03b63d6733c0932 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 12 Oct 2020 16:36:26
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C5DC7C43385; Mon, 12 Oct 2020 16:36:26 +0000 (UTC)
Received: from tynnyri.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B0EFDC433FE;
 Mon, 12 Oct 2020 16:36:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B0EFDC433FE
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: [PATCH] mt76: mt7915: fix sparse warning cast from restricted
 __le16
References: <bdd848a347b7c5b037c76b2617f1825402895f2c.1602519389.git.ryder.lee@mediatek.com>
Date: Mon, 12 Oct 2020 19:36:22 +0300
In-Reply-To: <bdd848a347b7c5b037c76b2617f1825402895f2c.1602519389.git.ryder.lee@mediatek.com>
 (Ryder Lee's message of "Tue, 13 Oct 2020 00:21:21 +0800")
Message-ID: <87v9ffqu49.fsf@tynnyri.adurom.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_123637_226726_9D5853E6 
X-CRM114-Status: UNSURE (   8.90  )
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
Cc: linux-mediatek@lists.infradead.org,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>, linux-wireless@vger.kernel.org,
 Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Ryder Lee <ryder.lee@mediatek.com> writes:

> drivers/net/wireless/mediatek/mt76/mt7915/init.c:339:26: sparse:
> sparse: cast from restricted __le16
>
> Fixes: 00b2e16 ("mt76: mt7915: add TxBF capabilities")

Commit id is too short, it should be:

Fixes: 00b2e16e0063 ("mt76: mt7915: add TxBF capabilities")

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
