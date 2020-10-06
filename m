Return-Path: <SRS0=UyV0=DN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A57C46466
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2020 07:19:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3694820760
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2020 07:19:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oeL7pyXr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="uscmwix/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3694820760
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HsRhX3CUi9KPdS4fWiZqSb1JklG1Hn3vs07EHNhCvJA=; b=oeL7pyXrFsk+RWp3HycQzGGo1
	I5tFouItjDaCZniaSdI+N4m+Wp9nFSNTO6p2qBcg3hpb/pYO/V/uLFdSRKZqw12E1Xk2dPFSlVFdu
	h3y+82JYnSM+EHbmIRcqtby2t7dQANErjLoWfCiqueIJK59e/vGgu2hvQJRuLe8LF9WY25Zc5yJsn
	yY59P1qjE1IRrsirhrB2Iiai43RNmAfTB8DxO1Xptzqk/36qOWgsld+DnbyHyogl9Fk8SS08p3UHW
	rw6OTxnQgFV0SHbk4kjG2IMtXN60tAscsIn5TiTCJfXa65cmRtbEWvckq21PIMk7mUr5vy1CK1yeP
	ZDRbbRpuQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPhFb-0006EF-2S; Tue, 06 Oct 2020 07:19:07 +0000
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPhFV-0006C0-1M
 for linux-mediatek@lists.infradead.org; Tue, 06 Oct 2020 07:19:05 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1601968744; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=9Bgnf5yb7Qe23xkz/B3GUG4YvFw6rRqLrKIvEHwuJW4=;
 b=uscmwix/dLl+TZKqPWBM22wSiSI+ja38SjE+5875IhTAauBK3BbVkbNfXpLNdI/W2hwIphnI
 UInEklyqv041JIbBG+3Dqz2Nz0/tTiyuJoRGz6VYK3oggemW8cQjkvH/YXG3mEHRkUpT1HV8
 S/bYXBWt+7UDMAT7x3Tm6xNu0So=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f7c1a5957b88ccb56cfbb5a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 06 Oct 2020 07:18:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 89319C43387; Tue,  6 Oct 2020 07:18:49 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A263BC433CB;
 Tue,  6 Oct 2020 07:18:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A263BC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Allen Pais <allen.lkml@gmail.com>
Subject: Re: [PATCH 2/2] wireless: mt76: convert tasklets to use new
 tasklet_setup() API
References: <20201006055135.291411-1-allen.lkml@gmail.com>
 <20201006055135.291411-3-allen.lkml@gmail.com>
Date: Tue, 06 Oct 2020 10:18:43 +0300
In-Reply-To: <20201006055135.291411-3-allen.lkml@gmail.com> (Allen Pais's
 message of "Tue, 6 Oct 2020 11:21:35 +0530")
Message-ID: <87h7r7bz58.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_031904_727742_744A603F 
X-CRM114-Status: GOOD (  14.39  )
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
Cc: ryder.lee@mediatek.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, davem@davemloft.net,
 lorenzo.bianconi83@gmail.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, kuba@kernel.org,
 Romain Perier <romain.perier@gmail.com>,
 Allen Pais <apais@linux.microsoft.com>, ath11k@lists.infradead.org,
 nbd@nbd.name
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Allen Pais <allen.lkml@gmail.com> writes:

> From: Allen Pais <apais@linux.microsoft.com>
>
> In preparation for unconditionally passing the
> struct tasklet_struct pointer to all tasklet
> callbacks, switch to using the new tasklet_setup()
> and from_tasklet() to pass the tasklet pointer explicitly.
>
> Signed-off-by: Romain Perier <romain.perier@gmail.com>
> Signed-off-by: Allen Pais <apais@linux.microsoft.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7603/beacon.c |  4 ++--
>  drivers/net/wireless/mediatek/mt76/mt7603/init.c   |  3 +--
>  drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h |  2 +-
>  drivers/net/wireless/mediatek/mt76/mt7615/mmio.c   |  6 +++---
>  drivers/net/wireless/mediatek/mt76/mt76x02_dfs.c   | 10 +++++-----
>  drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c  |  7 +++----
>  drivers/net/wireless/mediatek/mt76/usb.c           |  6 +++---
>  drivers/net/wireless/mediatek/mt7601u/dma.c        | 12 ++++++------

mt76 and mt7601u patches go into separate trees, so please split the
patch into two.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
