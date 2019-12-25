Return-Path: <SRS0=B1Xv=2P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53AD0C2D0DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Dec 2019 07:34:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2359120643
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Dec 2019 07:34:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ekVLcvLD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Khx0xUkh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2359120643
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f79cJ2CQRVIdTq2N90Q9zxp0mQ/wY9FzgEiqyUj6M7I=; b=ekVLcvLD4lT7we
	tuMWzNw63Z0VSt5NVgyv4+BhTUVuFObdKkHg8l3+PXt3CxbxzsecJ5wbIktf14NmV8FuSqYRX7gac
	UgBN6ic/4i3+P+IhKJaBFFF2xITjeHno9JZbZIRJYyFiJhS+LuQQ4/OzOs/8WTi31K/kC1f69Woam
	xoF0aHRTu7n6EQRoTE1a9C39SDEnF/0qz7VMUqsPkdqFnONsVxut/uelV6+NC9vTH9Yi+1388LMA6
	dQ7uByewD5Wm5kGTnQdWfCF+U50M6yijxkPbF2hHbYyjEwgbvd8MaNgPv+mz+jIt/DLzBtg2UdnfZ
	1whfisT1POl+oXKQp5Ag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ik1Bt-0006iu-33; Wed, 25 Dec 2019 07:34:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ik1Bq-0006iH-L7; Wed, 25 Dec 2019 07:34:44 +0000
X-UUID: 2627886deff14469874a0d31fddd8438-20191224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=3JsaGytja2s0ajkjRHpfBvJl0ga0ZN42HUPzYb0ma90=; 
 b=Khx0xUkh8FmsBa3JL6plIqjqti5oH22TgB+YA7eRm5kFIg7/+61XtMfij71nd+pfTCnzXqMzG5vEDRJxtt8wb+SJwPI23f0KVV+qmvYl54dWLg46lDYcp8sQz/Ob+DkjyUCAkadFI7Er/oxrTuiBWNmCRtuIkV9bzK/wf94hjY8=;
X-UUID: 2627886deff14469874a0d31fddd8438-20191224
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1051648185; Tue, 24 Dec 2019 23:34:40 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 24 Dec 2019 23:35:14 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 25 Dec 2019 15:33:58 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 25 Dec 2019 15:34:13 +0800
Message-ID: <1577259276.13056.54.camel@mtkswgap22>
Subject: Re: [PATCH v2 1/2 RESEND] soc: mediatek: add header for SiP service
 interface
From: Stanley Chu <stanley.chu@mediatek.com>
To: Alim Akhtar <alim.akhtar@gmail.com>
Date: Wed, 25 Dec 2019 15:34:36 +0800
In-Reply-To: <1576804540.13056.22.camel@mtkswgap22>
References: <1576468137-17220-1-git-send-email-stanley.chu@mediatek.com>
 <1576468137-17220-2-git-send-email-stanley.chu@mediatek.com>
 <CAGOxZ50RKYAEw=HwYMH=Jm7cagUV12C-fwhauJhJqx6HscAmFA@mail.gmail.com>
 <1576804540.13056.22.camel@mtkswgap22>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2EF099EE7E0791DEE4F5F3D3D0CACF2D26DB662205C351BEF72A3A062DA5475D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191224_233442_705586_C546F845 
X-CRM114-Status: GOOD (  12.85  )
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
Cc: "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "Martin K.
 Petersen" <martin.petersen@oracle.com>,
 Leon Chen =?UTF-8?Q?=28=E9=99=B3=E6=96=87=E9=8F=98=29?=
 <Leon.Chen@mediatek.com>, "Andy
 Teng \($B{}G!9\(\(B\)" <Andy.Teng@mediatek.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Chun-Hung Wu =?UTF-8?Q?=28=E5=B7=AB=E9=A7=BF=E5=AE=8F=29?=
 <Chun-hung.Wu@mediatek.com>,
 Kuohong Wang =?UTF-8?Q?=28=E7=8E=8B=E5=9C=8B=E9=B4=BB=29?=
 <kuohong.wang@mediatek.com>, open list <linux-kernel@vger.kernel.org>, Avri
 Altman <avri.altman@wdc.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Peter Wang =?UTF-8?Q?=28=E7=8E=8B=E4=BF=A1=E5=8F=8B=29?=
 <peter.wang@mediatek.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pedro Sousa <pedrom.sousa@synopsys.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Bean Huo \(beanhuo\)" <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Alim,

Would you think below explanation is OK to you?

BTW, FYI, this series was combined to the new series "scsi: ufs: add
MediaTek vendor implementations" with this same patch in it.

Thanks,
Stanley


On Fri, 2019-12-20 at 09:15 +0800, Stanley Chu wrote:
> Hi Alim,
> 
> On Fri, 2019-12-20 at 02:00 +0800, Alim Akhtar wrote:
> > > +/* UFS related SMC call */
> > > +#define MTK_SIP_UFS_CONTROL \
> > > +       MTK_SIP_SMC_CMD(0x276)
> > > +
> > How about moving UFS specific stuff to MTK UFS driver and include this
> > header in driver file?
> > Rest looks fine.
> 
> Thanks so much for your review.
> 
> Our intention is to collect all SMC call command types in MediaTek
> Chipsets here for easier management.
> 
> This is the first time we show this header thus only UFS related stuff
> is present here.
> 
> > > +#endif
> > > --
> > > 2.18.0
> > 
> > 
> 
> Thanks,
> Stanley
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
