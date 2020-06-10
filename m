Return-Path: <SRS0=3/N7=7X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B4AC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2020 14:44:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30CEF20734
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2020 14:44:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OciLU42H";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="a4C80QRy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30CEF20734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xYUoGy8zQXv0cG+8DU1coZa50MQyHPwvHpUDxESbnWE=; b=OciLU42HrF2UvH
	ZXtqZ2E4oztD8NJ70Uv/jFCKkOuOVKViT9ElWjuoCI0L4T/z1lZStONFh0sR9LKS/WP3gy+OEO15k
	10J3PTJCU3PVUZ2l1B3rCWpAvZOP3K2ALmoMOxp214OCb0QA2CPawpNHpS448KXuart3fwBnrYlof
	SR0Paivh3FVuO9n3K8nHVF0lWP8OLmgLiWokWjX6s93nRZTiNocLxBV+cFlyX0+awKr9HOmorKJJY
	RcUoDbRlPbf1jFOeZuFmWdTATfnTnl8cGgRs0YUMsTlV2tz44nWraff4btDddF2pgTI4JTdpJ4Ilz
	4ZAQ/LJF1Q+UAcFW0Wxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jj1xc-0008Ia-M7; Wed, 10 Jun 2020 14:44:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jj1xU-00087E-4n; Wed, 10 Jun 2020 14:44:05 +0000
X-UUID: 0baecf4b91924f43a2ee2887a06c0e7e-20200610
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=07Z7MmVgrHfi2H+JSAP6qzcbOEwmhFuc4sUjT1yUldQ=; 
 b=a4C80QRyYVf8lwiZ9/bGl9Z5GO7GlatD+Kpbays0OnXwm3PvCwBTHv5AH+LZ3JTfRhb3ZOKWxhYpVE9cYbftc85h+s8zedtYMBTDY44M+/IAMqXRP5OhblGtVfm+TpLxwljm5h+KlzySFyhGYN7AovdIMG1xnsBn9Tj3NbZQ2qk=;
X-UUID: 0baecf4b91924f43a2ee2887a06c0e7e-20200610
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1446799660; Wed, 10 Jun 2020 06:43:46 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Jun 2020 07:43:56 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Jun 2020 22:43:55 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 10 Jun 2020 22:43:55 +0800
Message-ID: <1591800237.25636.33.camel@mtkswgap22>
Subject: RE: [PATCH v2] scsi: ufs: Fix imprecise time in devfreq window
From: Stanley Chu <stanley.chu@mediatek.com>
To: Avri Altman <Avri.Altman@wdc.com>
Date: Wed, 10 Jun 2020 22:43:57 +0800
In-Reply-To: <SN6PR04MB46404C13248B105082BFE8E3FC830@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <20200609154035.1950-1-stanley.chu@mediatek.com>
 <SN6PR04MB46404C13248B105082BFE8E3FC830@SN6PR04MB4640.namprd04.prod.outlook.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200610_074404_192835_2CF8B5EF 
X-CRM114-Status: UNSURE (   7.67  )
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

On Wed, 2020-06-10 at 11:43 +0000, Avri Altman wrote:
> Hi Stanley,
> 
> > 
> > 
> > Promise precision of devfreq windows by
> Promise -> guarantee / assure / verify that the?
> Can you please also elaborate why the current window isn't accurate enough?
> And add a fixes tag?

OK! I will fix all of them in next version.

Thanks,
Stanley Chu
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
