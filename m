Return-Path: <SRS0=+h50=Z6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21BD0C43603
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Dec 2019 05:47:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E82B020637
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Dec 2019 05:47:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KiDa5Zfa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Wx4Tj8Sk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E82B020637
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NBAil1O/QSXeKuiWGZqBy4lIlbRwYyeQpeCl77MigQQ=; b=KiDa5ZfacvYOeM
	wdfxFIpj8OZ2jYOxD1q1bSn6krnCwQi6Z2yYN8sVFnrhlePW4Md2IrQEjD8fvNsZ9f54QnucsOvND
	mseyYjxw1yV71zNtzGFbf0nYcKQ3anDaSBUdvt1H4wfk9rjo50J0NTxH/2otOHe2PBBAfDLgrAX7E
	76bkpsvsROWaIXdPLjWS/8UCx45YIjj66Kqnltdk/J3YVj6Br6Z9NUCfFCnaNKFtYCsFlQnnFkmO3
	pj9ORqdGBYln2c6DptEZg4FVfgLAZeZUKiSxknIRo/EzSjLs25h5/sq1N4LJT3SXJRXeEA9hWFvQ9
	CrSilj94JnWwqLQSB11w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1idpPx-0007bj-Ak; Sun, 08 Dec 2019 05:47:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1idpPo-0007V8-VY; Sun, 08 Dec 2019 05:47:34 +0000
X-UUID: e95f7419130c4ddc8fcbfbd97754565c-20191207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=JnqPU30kEl4+RpNJnlGsN4JNwgLzMQ4oKfpMLvPeckU=; 
 b=Wx4Tj8SkDAmVgSADeTZy0I0iQMYfQUfD4ImYPfqwkxZId2c/djEFQMadPwSIHoHW/s5p3n92jMT4jml6TZGekZSeo5753Zminh/jgJuFvIP3GpDBYLp6/MJFwXetqWxAIejdQkEtNakgQn5z2FxgWKxVIyMmVzenZLSdYG1BLOI=;
X-UUID: e95f7419130c4ddc8fcbfbd97754565c-20191207
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 277587663; Sat, 07 Dec 2019 21:47:27 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 7 Dec 2019 21:38:18 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 8 Dec 2019 13:37:00 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sun, 8 Dec 2019 13:36:37 +0800
Message-ID: <1575783443.12066.1.camel@mtkswgap22>
Subject: Re: [PATCH v1 1/2] soc: mediatek: add header for SiP service interface
From: Stanley Chu <stanley.chu@mediatek.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Date: Sun, 8 Dec 2019 13:37:23 +0800
In-Reply-To: <b3c568f1-d57b-f3f3-b1da-4b312c595fc8@gmail.com>
References: <1575700748-28191-1-git-send-email-stanley.chu@mediatek.com>
 <1575700748-28191-2-git-send-email-stanley.chu@mediatek.com>
 <b3c568f1-d57b-f3f3-b1da-4b312c595fc8@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: ABB0BF249B6939E6F146B64C56060BDB722E71EF5051679CF21468003F6AF5F42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191207_214733_022767_4AD8782C 
X-CRM114-Status: UNSURE (   9.10  )
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
 Leon Chen =?UTF-8?Q?=28=E9=99=B3=E6=96=87=E9=8F=98=29?=
 <Leon.Chen@mediatek.com>, "Andy
 Teng \($B{}G!9\(\(B\)" <Andy.Teng@mediatek.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 Chun-Hung Wu =?UTF-8?Q?=28=E5=B7=AB=E9=A7=BF=E5=AE=8F=29?=
 <Chun-hung.Wu@mediatek.com>,
 Kuohong Wang =?UTF-8?Q?=28=E7=8E=8B=E5=9C=8B=E9=B4=BB=29?=
 <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Peter Wang =?UTF-8?Q?=28=E7=8E=8B=E4=BF=A1=E5=8F=8B=29?=
 <peter.wang@mediatek.com>, "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "pedrom.sousa@synopsys.com" <pedrom.sousa@synopsys.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "beanhuo@micron.com" <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Florian,

On Sun, 2019-12-08 at 01:40 +0800, Florian Fainelli wrote:

> > +#ifdef CONFIG_ARM64
> > +#define MTK_SIP_SMC_AARCH_BIT           0x40000000
> > +#else
> > +#define MTK_SIP_SMC_AARCH_BIT           0x00000000
> > +#endif
> 
> Cannot you use the definitions from include/linux/arm-smccc.h and use
> ARM_SMCCC_CALL_CONV_SHIFT here and associated helpers?
> 
> > +
> > +/* UFS related SMC call */
> > +#define MTK_SIP_UFS_CONTROL \
> > +	(0x82000276 | MTK_SIP_SMC_AARCH_BIT)
> 
> Does bit 31 map to the fast vs. slow call of the ARM SMCCC convention or
> does it have a different meaning (should not). Likewise bit 25 would be
> ARM_SMMCCC_OWNER_SIP no?
> 
> That would leave us with only 0x276 which is a valid function number.

Thanks so much for these comments.
I'll try to use suitable definitions instead in next version.

Stanley

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
