Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15DEBC433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 02:48:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7915921D6C
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 02:48:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UtrqoxrX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WRgfEzll"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7915921D6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j8Q766YIrdtfXKXQK1aVigGEsyfuaFCmTUWcJnUSmIU=; b=UtrqoxrXdOQsqLZFTyl6q2Mif
	1SIQnv1cAbwPjIGno2JmbItOA/s91HRuZoAkCu8StrgWj4L9OZ9W4z5YgtGV2yQvWsf1qVW8rCHZn
	zO9le9GnzaFBFyn5Z6fxsB/o4fHtJgSUZhdw9as4zYUowLIVUJigPQ3Qr8IcIJSgj091yG+QpM3q4
	jUnP3bL6dqEOq2LFXJ5d349sPOyIQlVpGEKhS4If/f2UV/wZwP8QALgk3vbNqgFBoQrrHmO9ofOXj
	vY12epl827WVmv16cjVxu2uViN5IjQ+ItTK/141sVmSt2pL/RDvNIoMU8hm1gQjTKBRzC0juPa7rR
	3PU9bKSjw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGCdD-0002fx-I5; Thu, 10 Sep 2020 02:48:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGCd9-0002f9-93; Thu, 10 Sep 2020 02:48:12 +0000
X-UUID: 37db293d93ae40188100320d9c52a4de-20200909
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=TGqc1+zgYwYtjPwGXOLfmyB55si+JzeFkKZj3cqjM3o=; 
 b=WRgfEzllMtgZPJpNyqVGY44Xle8BOAZIdAgVyxdRr3vsVhd2LN4ln6Wq0gZqGyaGQ3fY5sgKRwYnoonllfA1uJmDT5Or6m5tud5KHgF4UhNU1hVxB2Ck6iBf/cwLkBf0dWXVRWx+6p2+hu+l5gV1NNIhHeRi1Nxyc+bAYZRiOgc=;
X-UUID: 37db293d93ae40188100320d9c52a4de-20200909
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 626288222; Wed, 09 Sep 2020 18:48:04 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Sep 2020 19:48:02 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Sep 2020 10:48:00 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Sep 2020 10:48:00 +0800
Message-ID: <1599706080.10649.30.camel@mtkswgap22>
Subject: Re: [PATCH v2 1/2] scsi: ufs: Abort tasks before clear them from
 doorbell
From: Stanley Chu <stanley.chu@mediatek.com>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Thu, 10 Sep 2020 10:48:00 +0800
In-Reply-To: <yq14ko62wn5.fsf@ca-mkp.ca.oracle.com>
References: <1599099873-32579-1-git-send-email-cang@codeaurora.org>
 <1599099873-32579-2-git-send-email-cang@codeaurora.org>
 <1599627906.10803.65.camel@linux.ibm.com>
 <yq14ko62wn5.fsf@ca-mkp.ca.oracle.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: C95A5FF5A81532B7594C3EEBC793AF7F2BFEA205FC1420AA08019861A81DF8022000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_224811_520267_C22C50BE 
X-CRM114-Status: GOOD (  11.27  )
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
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, rnayak@codeaurora.org,
 saravanak@google.com, linux-scsi@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, nguyenb@codeaurora.org,
 ziqichen@codeaurora.org, Avri Altman <avri.altman@wdc.com>,
 Can Guo <cang@codeaurora.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, salyzyn@google.com,
 Alim Akhtar <alim.akhtar@samsung.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, Bean Huo <beanhuo@micron.com>,
 kernel-team@android.com, Bart Van
 Assche <bvanassche@acm.org>, hongwus@codeaurora.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Martin, Can,

On Wed, 2020-09-09 at 22:32 -0400, Martin K. Petersen wrote:
> Can and Stanley,
> 
> > I can't reconcile this hunk:
> 
> Please provide a resolution for these conflicting commits in fixes and
> queue:
> 
> 307348f6ab14 scsi: ufs: Abort tasks before clearing them from doorbell
> 
> b10178ee7fa8 scsi: ufs: Clean up completed request without interrupt
> notification
> 

Can's patch has considered my fix in the new flow.

To be more clear, for the fixing case in my patch,
ufshcd_try_to_abort_task() will return 0 (err = 0) and finally the
target tag can be completed and cleared by __ufshcd_transfer_req_compl()
in Can's new flow.

Thus I think the resolution can just using the code in Can's patch.

Can, please correct me if I was wrong.

Thanks,
Stanley Chu


> Thanks!
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
