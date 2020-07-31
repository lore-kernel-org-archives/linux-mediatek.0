Return-Path: <SRS0=UCxl=BK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C449C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 09:37:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAE9520829
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 09:37:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nflinr/2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="DiYFsj2l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAE9520829
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9xdpn/MuAffiTdwJ/o87KYVZxaRnSSY4bDVX/PwuIio=; b=Nflinr/2P8hzG7oGBNQOt8KJS
	LZ2PfvyvSap+v6EdN/CU1dScncsMiYxn3bcnFYSyelcDS+L3Kng3IrH8FLpS0d6+TvUzDJ+10+I3V
	lHgqjYFkQ5lrlrDI9lC1KBw2/HFTb/gLjaj4bVVk+Ea5+FR6n/Zgvbu3wkxEMnWAqqN+u62YrCcLe
	5DJqEY/cmFavl4fe4RfRlvPAjNrJlZiOE1TRfKtVH4m5AhjY7nD2XLsoR0uPuPWXy++a9G/1VQutD
	K4IYkcIxa5wFwNaVxgxxY2n249hbxKco1nU/jWZbuGp3c0I3cuAaEJdwj+aQYylHwBOV4WujjG3xa
	Z33KbbRYQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1RTt-0001kW-Qs; Fri, 31 Jul 2020 09:37:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1RTo-0001j0-BJ; Fri, 31 Jul 2020 09:37:34 +0000
X-UUID: 576c44c7a3374af5a1ef97136a9571a3-20200731
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=au+qktezYgw+jt5L5XG7E4RAshRFGuWcZYnfoHyoQQY=; 
 b=DiYFsj2lfgst5j049P5VVFhtWVduxXYty6PAgtWFTp6+TIsF148sD43WcmGOEEXpltYvZgfkhhzNZ512aPm/Wigt+2oAo7Aiig8YALHB37x7oVtsa/+o4k7/8TH6BuSBM3KoH2T6cSUH/4H5Kc/WK9v3wfZm5VoiSxGe0cqFaro=;
X-UUID: 576c44c7a3374af5a1ef97136a9571a3-20200731
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 447678340; Fri, 31 Jul 2020 01:37:13 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 31 Jul 2020 02:27:24 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 31 Jul 2020 17:27:21 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 31 Jul 2020 17:27:22 +0800
Message-ID: <1596187643.17247.62.camel@mtkswgap22>
Subject: Re: [PATCH v4] scsi: ufs: Quiesce all scsi devices before shutdown
From: Stanley Chu <stanley.chu@mediatek.com>
To: Can Guo <cang@codeaurora.org>
Date: Fri, 31 Jul 2020 17:27:23 +0800
In-Reply-To: <1d74498da71ba54e23cd82ee6400dbd4@codeaurora.org>
References: <20200724140140.18186-1-stanley.chu@mediatek.com>
 <84510fc12ada0de8284e6a689b7a2358@codeaurora.org>
 <1596183773.17247.60.camel@mtkswgap22>
 <1d74498da71ba54e23cd82ee6400dbd4@codeaurora.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_053732_740057_E47463E7 
X-CRM114-Status: GOOD (  23.54  )
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
Cc: linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 "Andy Teng \($B{}G!9\( \(B\)" <Andy.Teng@mediatek.com>, jejb@linux.ibm.com,
 Chun-Hung Wu =?UTF-8?Q?=28=E5=B7=AB=E9=A7=BF=E5=AE=8F=29?=
 <Chun-hung.Wu@mediatek.com>,
 Kuohong Wang =?UTF-8?Q?=28=E7=8E=8B=E5=9C=8B=E9=B4=BB=29?=
 <kuohong.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 asutoshd@codeaurora.org, avri.altman@wdc.com,
 linux-mediatek@lists.infradead.org,
 Peter Wang =?UTF-8?Q?=28=E7=8E=8B=E4=BF=A1=E5=8F=8B=29?=
 <peter.wang@mediatek.com>, alim.akhtar@samsung.com, matthias.bgg@gmail.com,
 beanhuo@micron.com,
 Chaotian Jing =?UTF-8?Q?=28=E4=BA=95=E6=9C=9D=E5=A4=A9=29?=
 <Chaotian.Jing@mediatek.com>,
 CC Chou =?UTF-8?Q?=28=E5=91=A8=E5=BF=97=E6=9D=B0=29?= <cc.chou@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, bvanassche@acm.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Can,

On Fri, 2020-07-31 at 16:58 +0800, Can Guo wrote:
> Hi Stanley,
> 
> On 2020-07-31 16:22, Stanley Chu wrote:
> > Hi Can,
> > 
> > On Mon, 2020-07-27 at 15:30 +0800, Can Guo wrote:
> >> Hi Stanley,
> >> 
> >> On 2020-07-24 22:01, Stanley Chu wrote:
> >> > Currently I/O request could be still submitted to UFS device while
> >> > UFS is working on shutdown flow. This may lead to racing as below
> >> > scenarios and finally system may crash due to unclocked register
> >> > accesses.
> >> >
> >> > To fix this kind of issues, specifically quiesce all SCSI devices
> >> > before UFS shutdown to block all I/O request sending from block
> >> > layer.
> >> >
> >> > Example of racing scenario: While UFS device is runtime-suspended
> >> >
> >> > Thread #1: Executing UFS shutdown flow, e.g.,
> >> >            ufshcd_suspend(UFS_SHUTDOWN_PM)
> >> > Thread #2: Executing runtime resume flow triggered by I/O request,
> >> >            e.g., ufshcd_resume(UFS_RUNTIME_PM)
> >> >
> >> 
> >> I don't quite get it, how can you prevent block layer PM from iniating
> >> hba runtime resume by quiescing the scsi devices? Block layer PM
> >> iniates hba async runtime resume in blk_queue_enter(). But quiescing
> >> the scsi devices can only prevent general I/O requests from passing
> >> through scsi_queue_rq() callback.
> >> 
> >> Say hba is runtime suspended, if an I/O request to sda is sent from
> >> block layer (sda must be runtime suspended as well at this time),
> >> blk_queue_enter() initiates async runtime resume for sda. But since
> >> sda's parents are also runtime suspended, the RPM framework shall do
> >> runtime resume to the devices in the sequence hba->host->target->sda.
> >> In this case, ufshcd_resume() still runs concurrently, no?
> >> 
> > 
> > You are right. This patch can not fix the case you mentioned. It just
> > prevents "general I/O requests".
> > 
> > So perhaps we also need below patch?
> > 
> > #2 scsi: ufs: Use pm_runtime_get_sync in shutdown flow
> > https://patchwork.kernel.org/patch/10964097/
> 
> That is what I am talking about, we definitely need this. Since
> you are already working on the fixes to the shutdown path, I will
> not upload my fixes (basically look same with yours). However, as
> regard for the new change, if pm_runtime_get_sync(hba->dev) < 0,
> hba can still be runtime ACTIVE, why directly goto out without a
> check of hba's runtime status?
> 

Thanks for reminding this. Then I will fix it and resend both patches as
a new series to fix the shutdown path.

Thanks so much,
Stanley Chu


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
