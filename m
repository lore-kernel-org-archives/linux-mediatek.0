Return-Path: <SRS0=cOAS=65=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E01FBC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 01:26:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A238720727
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 01:26:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jrNk0gXR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="npz3Blg4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A238720727
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M7wLJI0DYD+y27eZz1Av/bv/dWlcTRDW2oj+6VPjFdg=; b=jrNk0gXRuAjZSD
	FezUEp2yMon+zDwB1iKDkpzl2l+LmPzwA0+iV1tFEnoPS5+PYwql3+777SUcLS1PwgXMk28zPXbVH
	vGE7JECUowzktUAoHWA6q++IoDd0CweJ2u3C2Q3JzZuIv3zcIIwZPDRKWBqI1IaNrofLmZxzuDjCx
	79B5RehE5B2EtwX5diUz7FKf5NGr0Ceubr8cl5HYrXe/zzEUz07RlIbuzw/ilZPXuCZrgzPCUkh4J
	Sx/1kbpCcCWcoWQRCNfAhPSzpj8Pqi2561vaDNGQvjfgdXUhXTebYJcYJQRxZC5ez8hnemUhNb4pW
	EE6P5OGrIrbVsqLQQQ2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZP7C-0006Xz-EK; Fri, 15 May 2020 01:26:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZP78-0006WP-3T; Fri, 15 May 2020 01:26:17 +0000
X-UUID: c9947cc7022d41218a7f3a373f9a0e07-20200514
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=fqRhhH59jTJIvLK90VopqKiASNWrF23G1ykGc4EPhlE=; 
 b=npz3Blg4aa1IlPD0nrV+b36oFGbaJo9n4E1wAGASNNpJ/AFraajOUrj8cPciHxutWyhWrLBGZj2hy8G/fWuIvgBfTQifnAC+x2UYjPt4dTugy61losQlmuXTKoWym/xMHdg7nc9QVGpFuUc+xSdOSU7gvbGLEo1Ot8iVRr+8t/E=;
X-UUID: c9947cc7022d41218a7f3a373f9a0e07-20200514
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1664807439; Thu, 14 May 2020 17:26:23 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 May 2020 18:16:05 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 15 May 2020 09:15:58 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 15 May 2020 09:15:58 +0800
Message-ID: <1589505358.3197.101.camel@mtkswgap22>
Subject: Re: [PATCH v2 0/4] scsi: ufs: allow customizable WriteBooster flush
 policy
From: Stanley Chu <stanley.chu@mediatek.com>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 15 May 2020 09:15:58 +0800
In-Reply-To: <158950485295.8169.36549719949053326.b4-ty@oracle.com>
References: <20200509093716.21010-1-stanley.chu@mediatek.com>
 <158950485295.8169.36549719949053326.b4-ty@oracle.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_182614_162128_C99BCB90 
X-CRM114-Status: GOOD (  10.99  )
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
Cc: bvanassche@acm.org, linux-scsi@vger.kernel.org, andy.teng@mediatek.com,
 jejb@linux.ibm.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, avri.altman@wdc.com, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 alim.akhtar@samsung.com, matthias.bgg@gmail.com, beanhuo@micron.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Martin,

On Thu, 2020-05-14 at 21:10 -0400, Martin K. Petersen wrote:
> On Sat, 9 May 2020 17:37:12 +0800, Stanley Chu wrote:
> 
> > This patch set tries to allow vendors to modify the WriteBooster flush policy.
> > 
> > In the same time, collect all customizable parameters to an unified structure to make UFS driver more clean.
> > 
> > v1 -> v2:
> >   - Squash patch [3] and [4]
> >   - Remove a dummy "new line" in patch [3]
> >   - Fix commit message in patch [3]
> > 
> > [...]
> 
> Applied to 5.8/scsi-queue, thanks!
> 
> I had to combine patches 1 and 2. Otherwise you'd get compile
> failures due to the fields moving inside the struct.
> 
> [1/4] scsi: ufs: Introduce ufs_hba_variant_params to group customizable parameters
>       https://git.kernel.org/mkp/scsi/c/90b8491c0033
> [3/4] scsi: ufs: Customize flush threshold for WriteBooster
>       https://git.kernel.org/mkp/scsi/c/d14734ae3ae7
> [4/4] scsi: ufs-mediatek: Customize WriteBooster flush policy
>       https://git.kernel.org/mkp/scsi/c/f48b285ae658
> 

Thanks so much for helping the patch squash.

Thanks,
Stanley Chu
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
