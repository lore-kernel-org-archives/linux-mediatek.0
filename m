Return-Path: <SRS0=F/ID=6V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5D9FC35280
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 23:51:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A514E20731
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 23:51:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SBm3WAr1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="pqFEksD4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A514E20731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QoIqIkO8yR2NVdkq5nDkt2jR93UQmKNnOBmNEubkcNQ=; b=SBm3WAr166D7VN
	9ZFd8WqTK/ArCevLoYqlykL2xCdPm8mP6o7jaBgsBDTA51LgB4CoLjamEpq8fputWL8lBi/RQjFb3
	RQG/SQetrTZH+vOoiw3Jm91ZothWwJqxdNm/RkvtsrVAb5oWL4PSKmGkRaSfKpd0lLkVNrO64st11
	J9a3FbZc3sEHPHXnLKq+YKAnU4FsGoH3pNAHJfVJMhZ55HeYFOIegYkS7vgn1aThMDIbUDR+oIQGx
	c1LT86Kckib18dbEnwr138P4TOnEfRc2R4wZu+bpmhCwhoYNS+Xr0SUzYjqtVpzYek+N1KHsYOsVp
	TNm8Keq28Cia6GvewfYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWqIZ-0003EA-HU; Thu, 07 May 2020 23:51:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWqIR-00037x-R6; Thu, 07 May 2020 23:51:21 +0000
X-UUID: 983b75d2fb3341bbab9b6c40dd6f09c8-20200507
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=7rh/xNev2bozJWN2jpMZ42zVTLpDJdHHe0AkEEw+riA=; 
 b=pqFEksD4ggHIegkXQTKEXf1adsl5Vqtd0yZnmajUF+a+blHp8FILsOHUVYw9VzM/gpWlB6ro5kDxk/mgk7MHROeC9ni2GDgFUfEsi2aqjAnH3F7nk4EepCgVyfXnPbpGzoU3MuXgX/SJMbIVgkQlBKzBJQ4pHj9y7Rab2BgVBX8=;
X-UUID: 983b75d2fb3341bbab9b6c40dd6f09c8-20200507
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1045793458; Thu, 07 May 2020 15:51:12 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 May 2020 16:51:12 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 May 2020 07:50:56 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 May 2020 07:50:54 +0800
Message-ID: <1588895457.3197.40.camel@mtkswgap22>
Subject: Re: [PATCH v5 1/8] scsi: ufs: enable WriteBooster on some pre-3.1
 UFS devices
From: Stanley Chu <stanley.chu@mediatek.com>
To: Avri Altman <Avri.Altman@wdc.com>
Date: Fri, 8 May 2020 07:50:57 +0800
In-Reply-To: <1588602837.3197.32.camel@mtkswgap22>
References: <20200503113415.21034-1-stanley.chu@mediatek.com>
 <20200503113415.21034-2-stanley.chu@mediatek.com>
 <BYAPR04MB4629F2C00ABAB512DB833232FCA60@BYAPR04MB4629.namprd04.prod.outlook.com>
 <1588602837.3197.32.camel@mtkswgap22>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: E528BD5724FFA756FDB6C319DCE7ED3EFAD25D9B4B53F50DE16DB1ECC31FC39B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_165119_878982_F02BF76A 
X-CRM114-Status: GOOD (  11.54  )
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
Cc: "bvanassche@acm.org" <bvanassche@acm.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "andy.teng@mediatek.com" <andy.teng@mediatek.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>,
 "kuohong.wang@mediatek.com" <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "cang@codeaurora.org" <cang@codeaurora.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "beanhuo@micron.com" <beanhuo@micron.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Avri,
On Mon, 2020-05-04 at 22:33 +0800, Stanley Chu wrote:
> Hi Avri,
> 
> On Mon, 2020-05-04 at 10:37 +0000, Avri Altman wrote:
> > > 
> > >  static void ufshcd_wb_probe(struct ufs_hba *hba, u8 *desc_buf)
> > >  {
> > > +       if (!ufshcd_is_wb_allowed(hba))
> > > +               return;
> > > +
> > > +       if (hba->desc_size.dev_desc <=
> > > DEVICE_DESC_PARAM_EXT_UFS_FEATURE_SUP)
> > Should be 
> > DEVICE_DESC_PARAM_EXT_UFS_FEATURE_SUP + 4 
> 
> I think this description length check is redundant because the device
> quirk shall be added only after WriteBooster supportat is confirmed in
> attached UFS device. So I will remove this in next version.

Sorry this statement is incorrect because this kind on devices may have
short (without DEVICE_DESC_PARAM_EXT_UFS_FEATURE_SUP field) before
firmware upgrading. So the checking for descriptor length is still
required to avoid out-of-boundary access in below codes.

I will add it back in next version and also fix the length.

Thanks,
Stanley Chu

> > 
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
