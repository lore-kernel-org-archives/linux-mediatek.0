Return-Path: <SRS0=Odcq=HK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BE3DC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 08:11:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F086764E7E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 08:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F086764E7E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ohtRKk+T4h3hVZJbC1aKPmOM1jp0sjqNe4cT/UL8UQA=; b=hEGkpUnCX6AVMFAd2BGdWANh+
	kTe6Oygpwk+s8D4YjI56cMhny75QJdWjiOw2AxsdWnr9a/qZic2GTesftwKbjEcHyyha/YGltL/pR
	UzV8aURozcbYncjPhn0eqq/XpQaG8f3PvNx2TtAw3p2CbWMwuNhHQ5p3yD1KLdCLAZ1ALaDkQk8de
	iDD6MVkO7+bbAcuJ/npb0fYlLkxX/5JUEQxZKxvSfR/ERZv5X4w38vcLy2s04NU1rJWGzZjQmfZeM
	qmLyJ+7WPbubJIQf3qWUhMWQzuFAa+MRPC0JWWPmcv0egsC005AhGv0bqo21X7GgSbkdqDUTzo+Bl
	5OgFt4OOw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l91e7-0007BY-SG; Mon, 08 Feb 2021 08:11:47 +0000
Received: from 8bytes.org ([2a01:238:4383:600:38bc:a715:4b6d:a889]
 helo=theia.8bytes.org)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l91e2-00079o-Ep; Mon, 08 Feb 2021 08:11:43 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id E6CDD3A7; Mon,  8 Feb 2021 09:11:33 +0100 (CET)
Date: Mon, 8 Feb 2021 09:11:30 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] iommu/mediatek: Fix error code in probe()
Message-ID: <20210208081130.GA7302@8bytes.org>
References: <YB0+GU5akSdu29Vu@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YB0+GU5akSdu29Vu@mwanda>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_031142_623896_05085A04 
X-CRM114-Status: GOOD (  12.06  )
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Yong Wu <yong.wu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Feb 05, 2021 at 03:46:17PM +0300, Dan Carpenter wrote:
>  drivers/iommu/mtk_iommu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
