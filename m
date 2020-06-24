Return-Path: <SRS0=bzTf=AF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA371C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2020 07:46:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB6CD20C09
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2020 07:46:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GyNxzQZp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="aSJxMgcM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB6CD20C09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jrFqkASF409hB3Y9ISyvMYbaOEe29IdQt9++ZkQMqFE=; b=GyNxzQZp9pZCPbKKW0zJ/SOst
	Q3Sz0F1DNPGBHcE2qCJ62Q3UhetslI5GKd9vaI3XVs8FB4hBWfgnY3vfikTshpnZnlFcpFGwq9DYx
	1u+F8YaFX97zcKs20h/eXAs6fJhtzZPPyWgGVZV4+v2+AyjinSo0gw5mhV8lMGcgU9CMRLzaW/tQ5
	Ta9G71Uj1anR0/nm2LOqLLtSqAMuLCjzxRHxTqrfpiNz0MBeLlP/yfQ38Mmdjrq05Ws/vanW5tb4S
	Ro097d26mfwsYBS/oPAye7tlpuj3lx3iJxV4DSaXA0IbVWr6baXs7RQyqEQk1kcS9psO5WyFIiTDD
	nm9tN7WOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jo06b-0001PQ-9K; Wed, 24 Jun 2020 07:46:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jo06W-0001Mh-4k; Wed, 24 Jun 2020 07:45:57 +0000
X-UUID: 894882f94d784ef3b0b17a246f6dc94c-20200623
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=SPetk4kZUoYNJi6rJL6mv4fVDX9vdX+a9jDyyxj20yw=; 
 b=aSJxMgcMtN8F8I+4arR4F7BvEYd4C2BgczA9tYtDqBdfozggctRSh30qH8JshLIBSf6m/iX6Cn/y27CrkHl1Z18YUJsuRlvlJnjV9ZQawwwTkyQVOGzFiZt87zGQkXb0ffizOyP25f7i4Uz5nMWl3N5jGO54YisPrCvqbz4wkuw=;
X-UUID: 894882f94d784ef3b0b17a246f6dc94c-20200623
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2122801335; Tue, 23 Jun 2020 23:45:47 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 24 Jun 2020 00:45:46 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 24 Jun 2020 15:45:45 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 24 Jun 2020 15:45:45 +0800
Message-ID: <1592984747.3278.3.camel@mtkswgap22>
Subject: RE: [PATCH v1] scsi: ufs: Disable WriteBooster capability in
 non-supported UFS device
From: Stanley Chu <stanley.chu@mediatek.com>
To: Avri Altman <Avri.Altman@wdc.com>
Date: Wed, 24 Jun 2020 15:45:47 +0800
In-Reply-To: <SN6PR04MB4640974695F782566A83F2EFFC950@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <20200624025119.6509-1-stanley.chu@mediatek.com>
 <SN6PR04MB4640974695F782566A83F2EFFC950@SN6PR04MB4640.namprd04.prod.outlook.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 890E395327D2A2AB1231F6866800CD93D5D3E8BD799D6CB9814E4EB784F355C92000:8
X-MTK: N
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
 "beanhuo@micron.com" <beanhuo@micron.com>,
 "chaotian.jing@mediatek.com" <chaotian.jing@mediatek.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Avri,

On Wed, 2020-06-24 at 07:26 +0000, Avri Altman wrote:
> > 
> > 
> > If UFS device is not qualified to enter the detection of WriteBooster
> > probing by disallowed UFS version or device quirks, then WriteBooster
> > capability in host shall be disabled to prevent any WriteBooster
> > operations in the future.
> 
> Fixes: ?

I'll add it in v2, thanks!

Stanley Chu


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
