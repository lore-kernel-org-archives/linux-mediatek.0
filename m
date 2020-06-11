Return-Path: <SRS0=zMKO=7Y=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B4BCC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jun 2020 10:03:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FF7120835
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jun 2020 10:03:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jPiogVKq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="RaBBlggY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FF7120835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/M+FDvV/YcTJeUo+VsgYfmTHnrWLZz+XVLqK78H4agA=; b=jPiogVKqKprZ3s
	gMYhnQPHfok4EWht8a+a6FvYlH+pTGb16EIcNK1HS7oeJv1bmuMf6kSqBWasO7Dy3nz02+qygWWwC
	1J1LkkNQ+12M2VuCIWfbk77GRl1a6OL93QMNp+y4zYXxgz5zK/NIgd9TzB2+LX6oa2SK+OYI5npHw
	CsBsqv6rRXr+Qhb1DVJWR6BHRaCNzPGq+egzNgQ5bmAyq/e6YvopbRTeQX45iW5WCkgjLlcGDFd3N
	RDSRVUV9yTJvh4Jh8wKCx8KLgL+ToDBLcMrcwjFjmaWvlYnrt9rM8KN+wuxnRCI9Jcre2HByRnJK3
	x3S/4ZZ+2r+dK1rxIW1g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjK3M-0005oq-0A; Thu, 11 Jun 2020 10:03:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjK3C-0005Uk-TT; Thu, 11 Jun 2020 10:03:12 +0000
X-UUID: a3889155bcb84dffbb99c78ac896429f-20200611
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=CJcfxCu5zDRpr2vZfB1Tc+UVD9m/FFKMEZgs43bapM4=; 
 b=RaBBlggYi7uLe+U5eUAnTHjBINaRfqjWZLew/mB/kJXw6o7PQHLXsYxAbaicIOMyIy4jfjnSQgvkWeOdJ9eUXDKigTo/w+RSRnydNdRQD6tvfdax+QdbOmHBavbc/gLk5+rIkiBDJQbTdsEj0frBFSqNU+rifp9wNZqZcz88U/8=;
X-UUID: a3889155bcb84dffbb99c78ac896429f-20200611
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 666329976; Thu, 11 Jun 2020 02:02:42 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 11 Jun 2020 02:52:59 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 11 Jun 2020 17:52:50 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 11 Jun 2020 17:52:51 +0800
Message-ID: <1591869173.25636.39.camel@mtkswgap22>
Subject: RE: [PATCH v4] scsi: ufs: Fix imprecise load calculation in devfreq
 window
From: Stanley Chu <stanley.chu@mediatek.com>
To: Avri Altman <Avri.Altman@wdc.com>
Date: Thu, 11 Jun 2020 17:52:53 +0800
In-Reply-To: <SN6PR04MB46405CE4B375BA3134D64A99FC800@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <20200611052109.22700-1-stanley.chu@mediatek.com>
 <SN6PR04MB46405CE4B375BA3134D64A99FC800@SN6PR04MB4640.namprd04.prod.outlook.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7CBC375DE8EB4263FB517B24417907279B35FCD9CE7FF744E8B9862B97D052252000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200611_030310_959769_8D846B72 
X-CRM114-Status: UNSURE (   8.85  )
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
 "cc.chou@mediatek.com" <cc.chou@mediatek.com>,
 "cang@codeaurora.org" <cang@codeaurora.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>,
 "chaotian.jing@mediatek.com" <chaotian.jing@mediatek.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "beanhuo@micron.com" <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Avri,

Thanks for the review.

On Thu, 2020-06-11 at 08:03 +0000, Avri Altman wrote:
> > 
> > Fixes: a3cd5ec55f6c ("scsi: ufs: add load based scaling of UFS gear")
> > Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> Reviewed-by: Avri Altman <avri.altman@wdc.com>
> 
> Just a small nit.
> 
> > -       stat->total_time = jiffies_to_usecs((long)jiffies -
> > -                               (long)scaling->window_start_t);
> > +       stat->total_time = ktime_to_us(curr_t) - scaling->window_start_t;
> ktime_sub ?

scaling->window_start_t is already in "us" thus ktime_sub() is not
suitable here.

Another way is changing scaling->window_start_t as type "ktime_t". This
is worth to do because of a little performance gain.

I will change it in next version.

Thanks,
Stanley Chu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
