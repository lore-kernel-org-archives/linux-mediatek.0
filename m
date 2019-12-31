Return-Path: <SRS0=SHoq=2V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC1FFC2D0C8
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Dec 2019 04:23:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F4A5206D9
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Dec 2019 04:23:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d5d3W4D2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="EcY3oldM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F4A5206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Ay3xD8L/YfI+rQcjT1ZLWZeNRKabhTTEHyUPulWQlU=; b=d5d3W4D2Qx9ATC
	waleygLdSB8e0P76RUfrkHiyOAlcRwn88p6Cd0MYzftAfR5QrcKjeguH5UX8ejOcneqmvOdhWKojG
	7P7RYJs78fq7cdo9l8KpJliZ3Nur5DeT5SbGCSYIWbL/R4s42ESETZekJefz0+sG29Sc3ohiYK1CB
	skh2+Z1u1P/2AH2vHbLEWExQp47c3fL0v9GyLBMIOhXlhzajUCDsrvdOYOBZQyVk7o8zKdJIeKTzm
	xQWxY1IB7RMzVLJZDQAgaH7tRDAalNyYD+N+1Gnpmm2Cx0j7qmqgCe11efd2CcwA2mT2yGjFQQx+r
	xVg9rTT9gSU2dUyVJnaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1im93x-0002Hg-5l; Tue, 31 Dec 2019 04:23:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1im93t-0002HE-Rg; Tue, 31 Dec 2019 04:23:19 +0000
X-UUID: 98e0c9660030436f9401c062a3ccfe06-20191230
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ZRPxTeleJ3Mzk+ieB3WYQPdLPRugIPC5zES30k7LlyI=; 
 b=EcY3oldMEN/Wjz8fNDots3u82qdEKdB28IMyFnNja/FsK+w1Y78jN/PGlcnc9+ggnDcRxEf1plhe3LoC9Pp5yHvcv6I/NOwVRe2kt0hBkHiG1RbyAeRLlhSr/lELEvT5dRKfS+OdVB49rOmoVcaa5vnNeIh9NdUwHngAQEO5YqQ=;
X-UUID: 98e0c9660030436f9401c062a3ccfe06-20191230
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1555363358; Mon, 30 Dec 2019 20:23:08 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 30 Dec 2019 20:23:25 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 31 Dec 2019 12:22:12 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 31 Dec 2019 12:21:43 +0800
Message-ID: <1577766179.13164.24.camel@mtkswgap22>
Subject: Re: [PATCH v1 1/2] scsi: ufs: set device as default active power
 mode during initialization only
From: Stanley Chu <stanley.chu@mediatek.com>
To: Can Guo <cang@codeaurora.org>
Date: Tue, 31 Dec 2019 12:22:59 +0800
In-Reply-To: <836772092daffd8283a97d633e59fc34@codeaurora.org>
References: <1577693546-7598-1-git-send-email-stanley.chu@mediatek.com>
 <1577693546-7598-2-git-send-email-stanley.chu@mediatek.com>
 <fd129b859c013852bd80f60a36425757@codeaurora.org>
 <1577754469.13164.5.camel@mtkswgap22>
 <836772092daffd8283a97d633e59fc34@codeaurora.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191230_202317_900687_32938629 
X-CRM114-Status: GOOD (  10.35  )
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


> Hi Stanley,
> 
> I see skipping ufshcd_set_ufs_dev_active() in ufshcd_probe_hba()
> if it is called from ufshcd_resume() path is the purpose here.
> 
> If so, then ufshcd_set_dev_pwr_mode() would be called, meaning
> SSU command will be sent. Why is this SSU command needed to be
> sent after a full host reset and restore? Is ufshcd_probe_hba()
> not enough to make UFS device fully functional?

After resume (for both runtime resume and system resume), device power
mode shall be back to "Active" to service incoming requests.

I see two cases need device power mode transition during resume flow
1. Device Power Mode = Sleep
2. Device Power Mode = PowerDown

For 1, ufshcd_probe_hba() is not invoked during resume flow,
hba->curr_dev_pwr_mode = SLEEP, thus ufshcd_resume() can invoke
ufshcd_set_dev_pwr_mode() to change device power mode.

For 2, ufshcd_probe_hba() is invoked during resume flow, before this
fix, hba->curr_dev_pwr_mode will be set to ACTIVE (note that only this
flag is set as ACTIVE, but device may be still in PowerDown state if
device power is not fully shutdown or device HW reset is not executed
before resume), in the end, ufshcd_resume() will not invoke
ufshcd_set_dev_pwr_mode() to send SSU command to make device change back
to Active power mode.

But if device is fully reset before resume (not by current mainstream
driver), device can be already in "Active" power mode after power on
again during resume flow. In this case, it is OK to set
hba->curr_dev_pwr_mode as ACTIVE in ufshcd_probe_hba() and SSU command
is not necessary.

Thanks,
Stanley

> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
