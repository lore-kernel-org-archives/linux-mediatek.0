Return-Path: <SRS0=inF0=5E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1337C4332B
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Mar 2020 00:11:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72E122076E
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Mar 2020 00:11:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RIAIIxnM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="VSmWT2xk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72E122076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GPw6a8ao3aZTHBtA1SKK0yv4NMKdRa3Rmz4bajHj3Uc=; b=RIAIIxnMt+imlm
	nr+7ZDaLfJdGlKOgB38ghGv8QGp9QlFWkTNwB8f4X2P962cM6/G+aeas1HPg9Ha26wPr6aWYnWyZy
	nEQKKBhFOCu61E7XVVRUX5e+3L46jWwLjNGxcpD7uWmrZC5adGHUH9f6AovqtbVnSnja5R4lmq66m
	mmGKSxaE6Kc5avslCyfN8mPZzUJapkyVPBEGRc1qQf35ZTN0BwY3cF+zFYK0PWNKiEoJ3ZRaM7FOA
	B2uV6Yv3j8SywEEr8uJmtwSHZdhLEX/+QGhZPEv0tmEAuqGxbj700jk0FGUv49M63sW1tSq2rwnVr
	9A3GsVnHHMhHVJ7novPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEilu-00085i-Sw; Thu, 19 Mar 2020 00:10:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEill-0007y9-2n; Thu, 19 Mar 2020 00:10:42 +0000
X-UUID: e0b328a22bc2409b8a2dbf978794d9ea-20200318
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=sraA/18wg1ANfXAVlyaQ+1II+H594amOEvAI6LBOxx4=; 
 b=VSmWT2xknC6i0fRW6FMoRlcDkCf0L89fo9L5RqvQWKV79UUboi36chXgI5uZX2rALQO2i2N91/yKoVHPN/kIkFBNN4p0ZhNat450Y04nhj14A6sEZwhC7ez5fFK7IsVRitgfER9H77ijQ8FVY4z3qNcJchjW8NMLmxwGfHQrVn8=;
X-UUID: e0b328a22bc2409b8a2dbf978794d9ea-20200318
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2047728987; Wed, 18 Mar 2020 16:10:38 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 18 Mar 2020 17:11:10 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 19 Mar 2020 08:08:17 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 19 Mar 2020 08:11:11 +0800
Message-ID: <1584576635.14250.63.camel@mtksdccf07>
Subject: RE: [EXT] [PATCH v7 3/7] scsi: ufs: introduce common and flexible
 delay function
From: Stanley Chu <stanley.chu@mediatek.com>
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>
Date: Thu, 19 Mar 2020 08:10:35 +0800
In-Reply-To: <BN7PR08MB5684DA8C4FB4304CDAE39440DBF70@BN7PR08MB5684.namprd08.prod.outlook.com>
References: <20200318104016.28049-1-stanley.chu@mediatek.com>
 <20200318104016.28049-4-stanley.chu@mediatek.com>
 <BN7PR08MB5684DA8C4FB4304CDAE39440DBF70@BN7PR08MB5684.namprd08.prod.outlook.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200318_171041_131124_BE94161D 
X-CRM114-Status: GOOD (  10.41  )
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
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "andy.teng@mediatek.com" <andy.teng@mediatek.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>,
 "kuohong.wang@mediatek.com" <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "martin.peter~sen@oracle.com" <martin.peter~sen@oracle.com>,
 "cang@codeaurora.org" <cang@codeaurora.org>,
 "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Bean,

On Wed, 2020-03-18 at 22:10 +0000, Bean Huo (beanhuo) wrote:
> Hi, Stanley
> > 
> > diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c index
> > 314e808b0d4e..a42a84164dec 100644
> > --- a/drivers/scsi/ufs/ufshcd.c
> > +++ b/drivers/scsi/ufs/ufshcd.c
> > @@ -597,6 +597,18 @@ static void ufshcd_print_pwr_info(struct ufs_hba *hba)
> >  		 hba->pwr_info.hs_rate);
> >  }
> > 
> > +void ufshcd_delay_us(unsigned long us, unsigned long tolerance) {
> > +	if (!us)
> > +		return;
> > +
> > +	if (us < 10)
> > +		udelay(us);
> > +	else
> > +		usleep_range(us, us + tolerance);
> > +}
> > +EXPORT_SYMBOL_GPL(ufshcd_delay_us);
> > +
> In this way, the callers of ufshcd_delay_us(), can directly call udelay() or usleep_range(), what is exist meaning of ufshcd_delay_us()?

Sure, the callers always can directly call udelay() or usleep_range().

The customizable delay (either by hosts or devices) value in UFS driver
is becoming more and more, like "reference clock gating delay" and
introduced "hce_enable_delay". The customized delay time could be 0, <
10 us, or >= 10 us in real cases. Hence this function can help driver
simplify the driver and user's decision of "just passed without any
delay" or "choosing a suitable delay function according to the delay
time".

Thanks,
Stanley Chu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
