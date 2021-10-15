Return-Path: <SRS0=QAkp=PD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AEC8C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 13:33:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20B906115C
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 13:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 20B906115C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=flzBhhulPHxyhoG2dDdczLPEn0bufTx2bbB24b/+Pe8=; b=Z225rMFvgWOYj3
	bYUmLfcURG4pSXpaNX1ZNZAD4AeFnIU+qSRyhX03n1sm5s6/YOtJeclQo0VjFMLhIXKqm9VgbkHZL
	EQVy6jodjgZ8V4ypx/pLBl1Vr/YpP213dnQiiTdOTtcYTOlkb/DxoQoUaeS+0YbLNdM6hhOOidnGn
	Br7qDwVxevAJ+86pzzSKqQIlyylRUOl/TH0UVeb+XOj4y4/YkcUf5se0vnAdGSpS5fBckeRfCpfWG
	a7QIMdWONCvUzn6x1DjwRoh7VqCmhIp8hEgVjcn154TvRYvU5BV/qlU0EnlwHkY4EItgAFq+4ddXF
	0KiixNa5NhSA5KPxxLWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbNL1-007GZY-Pg; Fri, 15 Oct 2021 13:33:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbNKl-007GRY-9S; Fri, 15 Oct 2021 13:33:18 +0000
X-UUID: 4da86995cfff42b09ec01d9f2b9c3fe3-20211015
X-UUID: 4da86995cfff42b09ec01d9f2b9c3fe3-20211015
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 653815548; Fri, 15 Oct 2021 06:33:11 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 15 Oct 2021 06:33:09 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 15 Oct 2021 21:33:08 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 15 Oct 2021 21:33:08 +0800
Message-ID: <d656179616d61623e1c2b45c1df219c0693749a1.camel@mediatek.com>
Subject: Re: [PATCH] scsi: sd: fix crashes in sd_resume_runtime
From: Stanley Chu <stanley.chu@mediatek.com>
To: Miles Chen <miles.chen@mediatek.com>, "James E . J . Bottomley"
 <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Bart Van Assche
 <bvanassche@acm.org>, Martin Kepplinger <martink@posteo.de>
CC: <linux-scsi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <wsd_upstream@mediatek.com>
Date: Fri, 15 Oct 2021 21:33:08 +0800
In-Reply-To: <20211015074654.19615-1-miles.chen@mediatek.com>
References: <20211015074654.19615-1-miles.chen@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_063315_371416_637E3A1F 
X-CRM114-Status: GOOD (  13.89  )
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

Hi Miles,

On Fri, 2021-10-15 at 15:46 +0800, Miles Chen wrote:
> After merging commit ed4246d37f3b ("scsi: sd: REQUEST SENSE for
> BLIST_IGN_MEDIA_CHANGE devices in runtime_resume()"), I hit the
> following crash on my device.
> 
> static int sd_resume_runtime(struct device *dev)
> {
>         struct scsi_disk *sdkp = dev_get_drvdata(dev);
>         struct scsi_device *sdp = sdkp->device; // sdkp == NULL and
> crash
> 
>         if (sdp->ignore_media_change) {
> 	...
> }
> 
> I checked sd_resume() and found that sdkp is possbile to be NULL, and
> there is a null pointer test in sd_resume() for this case.
> To fix this crash, follow sd_resume() to test if sdkp is NULL
> before dereferencing it.


LGTM.

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
