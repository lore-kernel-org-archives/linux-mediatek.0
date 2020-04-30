Return-Path: <SRS0=G+af=6O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A1E3C8300A
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Apr 2020 08:35:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51AAE214D8
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Apr 2020 08:35:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tLYGJft8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NJXEF7jN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51AAE214D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H+7+OE4ampMq+Yd/Y68H/XJE21U61P5r5snurrVooRE=; b=tLYGJft83dhvTz
	aHhgactjmFg9W7ujBHX0kFgivP/2oOW4G9USFp+tk6U2Seb0A2RjdeObwQ4gDI6Os5l1QdQPLxTZO
	rbE2rU3FpqukpAL8/c22AM/b9jgUNGIC43wX557EJbPC5ezqIqmoJQLh7uqVUMkqoHFsbZKq4cnN9
	C1yklefjNaVU6/LIWoFu38YI39OdnoDfFeIJCvFZa2cnwu9kP0KZLVercyH5VRz28I4MYH7aa7Rp5
	MCdXsTSsv3d0HyEXA+s6CYWY9iPOm0539iQue+7Yx/qr86L9JZM3uHn9XzgG7Vbtt7ns8MXUnwPxH
	M9a/mGkVlipAXzFGmYNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jU4fC-0006hW-1H; Thu, 30 Apr 2020 08:35:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jU4ee-00040Y-W1; Thu, 30 Apr 2020 08:34:50 +0000
X-UUID: 36aa161e6d1c4bae8cedf3faddfb33a2-20200430
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=y3dVWlbJZTjwoFW54DLo0jxBmIShjMB5D+SoEOe2dsw=; 
 b=NJXEF7jNt2L2Tjt3F6okEWGHouC8xG61jl5leFJxco5bypXIXsqK9IA3fGlW5BdCJmyP1C5qyNtbbHgVXx8crgn6fUmmkqYY1vao8q3m6E4W2tYtUDOhVPbN9NZmWESFflNnliorucM/JRc0NvdJ9ClKBLd9vNlg76whtne/PYM=;
X-UUID: 36aa161e6d1c4bae8cedf3faddfb33a2-20200430
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1135168007; Thu, 30 Apr 2020 00:34:39 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Apr 2020 01:34:43 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Apr 2020 16:34:36 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 30 Apr 2020 16:34:37 +0800
Message-ID: <1588235677.3197.2.camel@mtkswgap22>
Subject: RE: [PATCH v2 1/5] scsi: ufs: allow legacy UFS devices to enable
 WriteBooster
From: Stanley Chu <stanley.chu@mediatek.com>
To: Avri Altman <Avri.Altman@wdc.com>
Date: Thu, 30 Apr 2020 16:34:37 +0800
In-Reply-To: <BYAPR04MB4629B87143D7BD7693141D39FCAA0@BYAPR04MB4629.namprd04.prod.outlook.com>
References: <20200429135610.23750-1-stanley.chu@mediatek.com>
 <20200429135610.23750-2-stanley.chu@mediatek.com>
 <BYAPR04MB4629B87143D7BD7693141D39FCAA0@BYAPR04MB4629.namprd04.prod.outlook.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200430_013449_045858_59BA45A4 
X-CRM114-Status: GOOD (  10.27  )
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
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
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
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "beanhuo@micron.com" <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Avri,

On Thu, 2020-04-30 at 07:44 +0000, Avri Altman wrote:
> Hi Stanley,
>  
> > 
> > WriteBooster feature may be supported by some legacy UFS devices
> > (i.e., < 3.1) by upgrading firmware.
> > 
> > To enable WriteBooster feature in such devices, relax the entrance
> > condition of ufshcd_wb_probe() to allow host driver to check those
> > devices' WriteBooster capability.
> > 
> > WriteBooster feature can be available if below both conditions are
> > satisfied,
> > 
> > 1. Device descriptor has dExtendedUFSFeaturesSupport field.
> > 2. WriteBooster support is specified in above field.
> > 
> > Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> > Reviewed-by: Bean Huo <beanhuo@micron.com>
> WB was first introduced as part of UFS3.1, and lately as part of UFS2.2.
> Any non-standard behavior should be classified as a quirk.

OK! I will try to revise this patch to allow only standard devices
handled by normal path and non-standard devices handled by device
quirks.

Thanks,
Stanley Chu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
