Return-Path: <SRS0=SHoq=2V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49ADCC2D0CE
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Dec 2019 07:51:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03AAC206D9
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Dec 2019 07:51:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YXb9Ogzn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="sd2ARO9Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03AAC206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g+dNal01ASKu+zvP6z9grFHllYeisOJGRYnE4hMnPeo=; b=YXb9Ogzn2lmyhS
	IKchKLP3VTsHNgOhOGI/oL/sgCOeN0rBRgbt3GyvMb5A3HPPN8zfbai5c1x1F20xuXpiVJXL/YI1+
	qtVzuKnDA7JZXiiwqXQBqYqp5KGYwxKyKOgdkF7AXlTRWSQhPfKLM/Y7VBqSKohgR38LpiCoOhCa3
	jhWyjbJ6V1SyY7E59+KP0x5IeUxMast1oB4X1oy4Li3R5XfxpoQu+28/utRwTpW7gcyhnEkIaSN3P
	+rDDoYkwz+arHSia41K97I4io49k+AbGx5wM3Vnh1sAmXHSsbPQGbQyvRzQddImZbRfcu5QnRnd7O
	IeAzOypVz0GhA1YGLYOQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1imCJe-0007Y0-Ec; Tue, 31 Dec 2019 07:51:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1imCJc-0007Xa-Ay; Tue, 31 Dec 2019 07:51:45 +0000
X-UUID: cf0a849ff3b34751a89a2312357c3bf6-20191230
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=G3qstG1VMSmVPYGxJvUnbDb79Y6VwOFhgHb1R1BPAB4=; 
 b=sd2ARO9ZcLQg+xPUgoNfM0dwG0ZQfhw0lKWKHnqr+5d8syR7SPOPjSP77c/bveshPhmXBF9Ohsx4uf/I7Wu1Mou/hhpX7QwamGqDOjS3c/cUK7VlxkFABt4efIXd6NCfr+Ih4jG58MZ9EpgbVHbmRGNaBQBubzs6tibmesJZvQ8=;
X-UUID: cf0a849ff3b34751a89a2312357c3bf6-20191230
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1932347968; Mon, 30 Dec 2019 23:51:33 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 30 Dec 2019 23:45:16 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 31 Dec 2019 15:44:06 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 31 Dec 2019 15:43:33 +0800
Message-ID: <1577778290.13164.45.camel@mtkswgap22>
Subject: Re: [PATCH v1 1/2] scsi: ufs: set device as default active power
 mode during initialization only
From: Stanley Chu <stanley.chu@mediatek.com>
To: Can Guo <cang@codeaurora.org>
Date: Tue, 31 Dec 2019 15:44:50 +0800
In-Reply-To: <1577766179.13164.24.camel@mtkswgap22>
References: <1577693546-7598-1-git-send-email-stanley.chu@mediatek.com>
 <1577693546-7598-2-git-send-email-stanley.chu@mediatek.com>
 <fd129b859c013852bd80f60a36425757@codeaurora.org>
 <1577754469.13164.5.camel@mtkswgap22>
 <836772092daffd8283a97d633e59fc34@codeaurora.org>
 <1577766179.13164.24.camel@mtkswgap22>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 45FB1168EF4BF48378D8C06BB302A9DF542A4E7C9858C67C2092FB067919067B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191230_235144_387904_344DC4F3 
X-CRM114-Status: GOOD (  15.75  )
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
Cc: martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
 andy.teng@mediatek.com, jejb@linux.ibm.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, asutoshd@codeaurora.org, avri.altman@wdc.com,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 linux-scsi-owner@vger.kernel.org, subhashj@codeaurora.org,
 alim.akhtar@samsung.com, beanhuo@micron.com, pedrom.sousa@synopsys.com,
 bvanassche@acm.org, linux-arm-kernel@lists.infradead.org,
 matthias.bgg@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Can,

On Tue, 2019-12-31 at 12:22 +0800, Stanley Chu wrote:
> Hi Can,
> 
> 
> > Hi Stanley,
> > 
> > I see skipping ufshcd_set_ufs_dev_active() in ufshcd_probe_hba()
> > if it is called from ufshcd_resume() path is the purpose here.
> > 
> > If so, then ufshcd_set_dev_pwr_mode() would be called, meaning
> > SSU command will be sent. Why is this SSU command needed to be
> > sent after a full host reset and restore? Is ufshcd_probe_hba()
> > not enough to make UFS device fully functional?
> 
> After resume (for both runtime resume and system resume), device power
> mode shall be back to "Active" to service incoming requests.
> 
> I see two cases need device power mode transition during resume flow
> 1. Device Power Mode = Sleep
> 2. Device Power Mode = PowerDown
> 
> For 1, ufshcd_probe_hba() is not invoked during resume flow,
> hba->curr_dev_pwr_mode = SLEEP, thus ufshcd_resume() can invoke
> ufshcd_set_dev_pwr_mode() to change device power mode.
> 
> For 2, ufshcd_probe_hba() is invoked during resume flow, before this
> fix, hba->curr_dev_pwr_mode will be set to ACTIVE (note that only this
> flag is set as ACTIVE, but device may be still in PowerDown state if
> device power is not fully shutdown or device HW reset is not executed
> before resume), in the end, ufshcd_resume() will not invoke
> ufshcd_set_dev_pwr_mode() to send SSU command to make device change back
> to Active power mode.
> 
> But if device is fully reset before resume (not by current mainstream
> driver), device can be already in "Active" power mode after power on
> again during resume flow. In this case, it is OK to set
> hba->curr_dev_pwr_mode as ACTIVE in ufshcd_probe_hba() and SSU command
> is not necessary.
> 
> Thanks,
> Stanley

I think currently the assumption in ufshcd_probe_hba() that "device
shall be already in Active power mode" makes sense because many device
commands will be sent to device in ufshcd_probe_hba() but device is not
promised to handle those commands in PowerDown power mode according to
UFS spec. 

So, maybe always ensuring device being Active power mode before leaving
ufshcd_probe_hba() is more reasonable. If so, I will drop this patch
first.

Thanks so much for your reviews.

Happy new year!

Thanks,
Stanley



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
