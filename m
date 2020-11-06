Return-Path: <SRS0=NSCp=EM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34AF3C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 06:26:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9024E20936
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 06:26:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DVKVwVj/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kWF5PMzh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9024E20936
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5xO8ri9x9Fkpl3G/HvvnWbyceSiMZxZtH1Hrwdyly8k=; b=DVKVwVj/rvbs+ir6dGqysU2Tf
	ZT1LPoyvSUaX8yNcoE8QZvJMd+9wXUijloGfLF52Y5h9nfnEATv15w0mmRGhk25WwBk14unIR4UQf
	RjOUAmvuSpozQFvL7EKJ/2PqoP9eXWp45YNegpuOV612R+ZyVuIexMLIqKftf8uUBO7HTbZDJFAmW
	3fWiFf97t6sEd/e1A5LsS8L4eAwDqYLk8iQK6co2S/JnEGSw0E7fj2t+yR0ITnSocyd0oNky7W1Hz
	7lf7h7PWCLviduFKRGfQllyIfK5qGbNO215XK+bg2uXL3cxMY5I6/FRWknrbuPhhp4HfElzlqcKJy
	xRntcf3jw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kavCH-0006QV-43; Fri, 06 Nov 2020 06:26:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kavCE-0006Oo-UX; Fri, 06 Nov 2020 06:26:03 +0000
X-UUID: 3aa62f451f444c9d9a9e179823478720-20201105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=p5DSa8Nnu7wbNc1hwM5sOPH42DGFe7+JpMveJyzKtq4=; 
 b=kWF5PMzh+jNvqReBydVOg+VSfsydUpB0kv2dkmVMLYJ/DxiWcl9CpwQ8A1uKGVeWREMw76Gf5h1SWvZJ/RncPU/40J9P/cZduzsic6wMBsLr/S8kpZS0Q2uEFAg3OaQkvpCnhjIwYU54q+GuXhXEZM/1ALS1DaG+hK4Choyh8oE=;
X-UUID: 3aa62f451f444c9d9a9e179823478720-20201105
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 763419075; Thu, 05 Nov 2020 22:19:39 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 Nov 2020 22:11:00 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 6 Nov 2020 14:10:58 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 6 Nov 2020 14:10:58 +0800
Message-ID: <1604643059.13152.19.camel@mtkswgap22>
Subject: Re: [PATCH v1 0/6] scsi: ufs: Add some proprietary features in
 MediaTek UFS platforms
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>
Date: Fri, 6 Nov 2020 14:10:59 +0800
In-Reply-To: <20201029115750.24391-1-stanley.chu@mediatek.com>
References: <20201029115750.24391-1-stanley.chu@mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_012603_127101_63C3C448 
X-CRM114-Status: GOOD (  14.78  )
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
Cc: jiajie.hao@mediatek.com, martin.petersen@oracle.com, andy.teng@mediatek.com,
 jejb@linux.ibm.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, avri.altman@wdc.com,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 alim.akhtar@samsung.com, matthias.bgg@gmail.com, chaotian.jing@mediatek.com,
 cc.chou@mediatek.com, linux-arm-kernel@lists.infradead.org,
 alice.chao@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Martin, Avri,

On Thu, 2020-10-29 at 19:57 +0800, Stanley Chu wrote:
> Hi,
> 
> This patch series provides some features and fixes in MediaTek UFS platforms,

Sorry for the gentle ping. Just please consider this patch series for
merging to kernel version 5.11.

Thanks,
Stanley Chu.

> 
> 1. Support VA09 regulator operations
> 2. Support option to disable auto-hibern8
> 3. Support HS-G4
> 4. Decouple features from platform bindings
> 5. Misc fixes
> 
> Stanley Chu (6):
>   scsi: ufs-mediatek: Assign arguments with correct type
>   scsi: ufs-mediatek: Support VA09 regulator operations
>   scsi: ufs-mediatek: Decouple features from platform bindings
>   scsi: ufs-mediatek: Support option to disable auto-hibern8
>   scsi: ufs: Add enums for UniPro version higher than 1.6
>   scsi: ufs-mediatek: Add HS-G4 support
> 
>  drivers/scsi/ufs/ufs-mediatek.c | 218 +++++++++++++++++++++++---------
>  drivers/scsi/ufs/ufs-mediatek.h |  22 ++--
>  drivers/scsi/ufs/unipro.h       |   6 +-
>  3 files changed, 179 insertions(+), 67 deletions(-)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
