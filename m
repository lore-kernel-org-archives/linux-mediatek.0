Return-Path: <SRS0=F/ID=6V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69A8DC4724C
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 23:57:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4091E208E4
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 23:57:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a1XhQlVD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="G9fFRxzL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4091E208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=owwU4YRv4eb+7sx72wMM57mmE5Xn4hTQk1S4mmdGlts=; b=a1XhQlVDbsdps1
	zKT57ew2B47jIu9n5WchY1oVuHoOF/TsaCkoZGF4OptV7Btw5epYkTFasIYW45eOuBeb3V/f48tU9
	HRGUQ1YBVtiajeYPptMwCb5mJ9RMI6GLlQQ3f+lsiUt5ufyT90IiSiCeONou1Di3cE0NpmSac/6Ic
	NUPOIZyMirhuOvB6Jqcz0zB7jmxkGphUu+WiHOzAuJFaXzPwuW1CCqhz1CC19aC2GFzh4tcOjbIh7
	whZRDC1msZ9SkwLAQyfr8TRFVnyzZZwudFcsuRMEDO7G0ISNYBQn7DqgSbVTWNWqA+2kXZ7lV486H
	m8vbONhg56V9xyVKF3iw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWqO8-00068o-Pe; Thu, 07 May 2020 23:57:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWqNz-000610-4a; Thu, 07 May 2020 23:57:04 +0000
X-UUID: 866f838dcf014a479b67a5d32148daf6-20200507
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=JhHIyBxzU60a1fEjAc2AhM3GWgEwwTj1mu/Pn9wiBHA=; 
 b=G9fFRxzL6DQ9u+Xd3Gy+VOaLgHpS7LqgRAY/NJcyYznEB0km80kiiA+/EeSAY/eRdOhvNPRkS3FRgaQjUsraD4E8HKZPu8eWGTC390dj+Qa+EefN2+EkgpqPy7mnL5MO1zKu1nvmpGsq8BP3ELA0g9D1E8MZQce4SO6la4lBqAE=;
X-UUID: 866f838dcf014a479b67a5d32148daf6-20200507
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1108194849; Thu, 07 May 2020 15:56:59 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 May 2020 16:56:59 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 May 2020 07:56:51 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 May 2020 07:56:49 +0800
Message-ID: <1588895812.3197.43.camel@mtkswgap22>
Subject: Re: [SPAM]RE: [PATCH v5 2/8] scsi: ufs: introduce fixup_dev_quirks
 vops
From: Stanley Chu <stanley.chu@mediatek.com>
To: Avri Altman <Avri.Altman@wdc.com>
Date: Fri, 8 May 2020 07:56:52 +0800
In-Reply-To: <1588603287.3197.35.camel@mtkswgap22>
References: <20200503113415.21034-1-stanley.chu@mediatek.com>
 <20200503113415.21034-3-stanley.chu@mediatek.com>
 <BYAPR04MB46294C86DB9BD1A91256F39BFCA60@BYAPR04MB4629.namprd04.prod.outlook.com>
 <1588603287.3197.35.camel@mtkswgap22>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 66C8E74B693F90EA0A8EBB8993C8FC6E17EBBF32BAC6523C6BFC6E4B55825C9E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_165703_186356_418AB9B1 
X-CRM114-Status: UNSURE (   9.04  )
X-CRM114-Notice: Please train this message.
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

On Mon, 2020-05-04 at 22:41 +0800, Stanley Chu wrote:
> Hi Avri,
> 
> On Mon, 2020-05-04 at 10:38 +0000, Avri Altman wrote:
> > > 
> > >         ufs_fixup_device_setup(hba);
> > > +       ufshcd_vops_fixup_dev_quirks(hba);
> > Maybe call your new ufshcd_vops_fixup_dev_quirks as part of ufs_fixup_device_setup
> 
> The latter patch exports ufs_fixup_device_setup() for vendors to re-use
> it to parse vendor-specific device quirk table during the call of
> ufshcd_vops_fixup_dev_quirks(), thus ufshcd_vops_fixup_dev_quirks()
> cannot be as part of ufs_fixup_device_setup().

Maybe I could use a new function to contain ufs_fixup_device_setup() and
ufshcd_vops_fixup_dev_quirks() to make the code more clear here.

Thanks,
Stanley Chu


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
