Return-Path: <SRS0=2M+Y=3G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A8CEC33CB1
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jan 2020 08:00:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E047C2073A
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jan 2020 08:00:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X7jkQe25";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="fJBlCoKS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E047C2073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Boa0CEzfyNjI1a1Ap0lZzgxFnkVtGJ69EP+tArcH56Y=; b=X7jkQe25wrNyOW
	hMF8hr8aUcGOT63lm4DbmUT9jHyGmKjKg0Ew+oRPnec7bqJmrWPzRRnQYttfRe6ExQ5vL01fwwJ5M
	J9LklLqcUoP6SrjnMrUGwSdnyToMSjSwCmSDKCCRlP10mo/fgxvb7GS3KH9KzeLb3DEZZ+nbY8hmh
	tIKdOuzBWhvcoYJiTS3wyFzQ2SBfuwMASZN3O3xcjkZMs4ZMX5wJn6yGcTx4gTKYexwkCh7EW9Gty
	GuS0WBdveMxt3inmUadwTi03FVj/qt3dYoMjyZjgomSQKZ2FUO7yf/EUgeXE7voaAQGjw6IXlrpHv
	0zbO7r93L0rWgDxH1KvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isMYg-0007Fk-CS; Fri, 17 Jan 2020 08:00:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isMYV-00078s-AH; Fri, 17 Jan 2020 08:00:39 +0000
X-UUID: 1d3d4e051bd043a39e65a86b89fa56e2-20200117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=NVAlmuv6kEuotYvF3hdfckiboI5Lrf79DB2d2V0aLRQ=; 
 b=fJBlCoKSYvqmh/krlxy7dtvHbCj6JN770MyPSkAJi8L7TAXVazgVP6fsPChMCP2gtmoC9c97z15JapQJrJ/zy/BjqvVLSy/eVP+y6RSZbmpK0mZ1ZJxpuZsqaUTTH/7JQd+U9VCr9wwwdjeCIH9aBHoh7xf2foS2XEULsVLkRg4=;
X-UUID: 1d3d4e051bd043a39e65a86b89fa56e2-20200117
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 499332844; Fri, 17 Jan 2020 00:00:33 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 16 Jan 2020 23:58:31 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 17 Jan 2020 15:57:38 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 17 Jan 2020 15:56:38 +0800
Message-ID: <1579247852.19362.10.camel@mtksdccf07>
Subject: Re: [PATCH v1 1/2] scsi: ufs: set device as default active power
 mode during initialization only
From: Stanley Chu <stanley.chu@mediatek.com>
To: Can Guo <cang@codeaurora.org>
Date: Fri, 17 Jan 2020 15:57:32 +0800
In-Reply-To: <e13011fd858cf3ec0258c4b7ac914973@codeaurora.org>
References: <1577693546-7598-1-git-send-email-stanley.chu@mediatek.com>
 <1577693546-7598-2-git-send-email-stanley.chu@mediatek.com>
 <fd129b859c013852bd80f60a36425757@codeaurora.org>
 <1577754469.13164.5.camel@mtkswgap22>
 <836772092daffd8283a97d633e59fc34@codeaurora.org>
 <1577766179.13164.24.camel@mtkswgap22>
 <1577778290.13164.45.camel@mtkswgap22>
 <44393ed9ff3ba9878bae838307e7eec0@codeaurora.org>
 <1577947124.13164.75.camel@mtkswgap22>
 <4888afd46a9065b7f298a5de039426c9@codeaurora.org>
 <e13011fd858cf3ec0258c4b7ac914973@codeaurora.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200117_000035_365808_2226E36C 
X-CRM114-Status: GOOD (  13.46  )
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
Cc: "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "beanhuo@micron.com" <beanhuo@micron.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 Peter Wang =?UTF-8?Q?=28=E7=8E=8B=E4=BF=A1=E5=8F=8B=29?=
 <peter.wang@mediatek.com>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "Andy Teng \($B{}G!9\(\(B\)" <Andy.Teng@mediatek.com>, CC
 Chou =?UTF-8?Q?=28=E5=91=A8=E5=BF=97=E6=9D=B0=29?= <cc.chou@mediatek.com>,
 Chun-Hung Wu =?UTF-8?Q?=28=E5=B7=AB=E9=A7=BF=E5=AE=8F=29?=
 <Chun-hung.Wu@mediatek.com>,
 Ron Hsu =?UTF-8?Q?=28=E8=A8=B1=E8=BB=92=E6=A6=AE=29?= <Ron.Hsu@mediatek.com>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-scsi-owner@vger.kernel.org" <linux-scsi-owner@vger.kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 Kuohong Wang =?UTF-8?Q?=28=E7=8E=8B=E5=9C=8B=E9=B4=BB=29?=
 <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "subhashj@codeaurora.org" <subhashj@codeaurora.org>,
 "pedrom.sousa@synopsys.com" <pedrom.sousa@synopsys.com>,
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Can,

On Fri, 2020-01-03 at 13:28 +0800, Can Guo wrote:
> > 
> > Hi Stanley,
> > 
> > Above description is correct. The reason why the UFS device becomes
> > Active after the 1st link startup in your experiment is due to you
> > set spm_lvl to 5, during system suspend, UFS device is powered down.
> > When resume kicks start, the UFS device is power cycled once.
> > 
> > Moreover, if you set rpm_lvl to 5, during runtime suspend, if bkops is
> > enabled, the UFS device will not be powered off, meaning when runtime
> > resume kicks start, the UFS device is not power cycled, in this case,
> > we need 3 times of link startup.
> > 
> > Does above explain?
> > 
> > Thanks,
> > 
> > Can Guo.
> > 
> 
> Hi Stanley,
> 
> Sorry, typo before. I meant if set rpm_lvl/spm_lvl to 5, during suspend,
> if is_lu_power_on_wp is set, the UFS device will not be fully powered 
> off
> (only VCC is down), meaning when resume kicks start, the UFS device is 
> not
> power cycled, in this case, we need 3 times of link startup.
> 
> Regards,
> 
> Can Guo.

Hi Can,

Very sorry for late responding this thread.

Now I would like to focus on 3-times link startup behavior found in our
platform because this dramatically downgrade resume performance.

According to your description, then could the driver set
"link_startup_again" as true only if "is_lu_power_on_wp" is set to avoid
unnecessary three-times link startup in other cases?

In addition, for the scenario you mentioned: "the UFS device will not be
fully powered off (only VCC is down), meaning when resume kicks start,
the UFS device is not power cycled": 

1. Actually I tried to set xpm_lvl=5, and enforced "is_lu_power_on_wp"
as true for evaluation, but found device can be still back to Active
PowerMode (can be accessed normally) after one-time link startup after
resumed. 

Only VCC is down and VCCQ2 is kept during suspend in my evaluation.

2. In this scenario, during resume the peer device shall have "UniPro
Warm Reset" triggered by the first link start-up and then device power
mode shall become Active according to UFS specification.

So what device power mode did you see after the first link startup in
this scenario? Or any other conditions to make device need
"link_startup_again"?

Thanks,
Stanley

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
