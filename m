Return-Path: <SRS0=0yQJ=AZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52248C433E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 10:06:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D71B217D8
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 10:06:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HTmYWXzC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="EiBe0bVD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D71B217D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tvak5f6d1E8hK+coXkkVao571UPPZJ0kD9n53+3UuRA=; b=HTmYWXzCV4ZApZTcHaXnkN93Y
	ImAMmEcuvt5hzPQaTCXt9e3y51YLxHHfgYp5q5iv25JU/B1F/Fibw6CNtJdjUj7bYr2E7cu7SWfZR
	xwOVatoBlZqSrYpyPO4uT+vWrcvKhfqpcYyYnzwpcMyyazSzB0LCct1sAQegpUkqRDPHbwiwZCTWy
	D8TqZYA/8JkHUL/k/7BseXCHWIgmnpx/ap6c0pqZNorKubtt7B/7RDw+oLD8b8J2tv7oNmDmsqCUy
	/+CyTGmI9/Ofgx/bJEazRzVEV529Bqq5qR+FwyO6I8yP2PTCI+AePl31iMQTyzg1MjQbnZOprBlvW
	RzDICV5vw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvHpZ-0003dc-AJ; Tue, 14 Jul 2020 10:06:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvHpV-0003cF-A8; Tue, 14 Jul 2020 10:06:30 +0000
X-UUID: d10df7b5851a4ffea5ae7d104038b6f9-20200714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ysgoiQZkd6yevHeAk27WbwaWZS5sYS8VuJlnh1+Ohgc=; 
 b=EiBe0bVDnv7jLZLq4iiF2Jf9Beill+ZoiWu8CI0AAXdo4Q+9vDg3yvfnw46EmODy2IJu+AenpcWe9PGGKXa69pQ92gKPKsGO0wUstZ8rKzWX1c3XncZti/QiMNi8DXcFv9kUlcSlHJECMN3m7u3UZVwCDGHQGl1mFYXyu0xmcL4=;
X-UUID: d10df7b5851a4ffea5ae7d104038b6f9-20200714
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 241921564; Tue, 14 Jul 2020 02:06:28 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jul 2020 03:00:54 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jul 2020 18:00:40 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 14 Jul 2020 18:00:41 +0800
Message-ID: <1594720842.22878.38.camel@mtkswgap22>
Subject: RE: [PATCH v3] scsi: ufs: Cleanup completed request without
 interrupt notification
From: Stanley Chu <stanley.chu@mediatek.com>
To: Avri Altman <Avri.Altman@wdc.com>
Date: Tue, 14 Jul 2020 18:00:42 +0800
In-Reply-To: <SN6PR04MB46404C9EC8C29F75E5D1E45BFC610@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <20200706132113.21096-1-stanley.chu@mediatek.com>
 <SN6PR04MB4640BEAFE18BDC933FC7EC95FC640@SN6PR04MB4640.namprd04.prod.outlook.com>
 <1594517160.10600.33.camel@mtkswgap22>
 <SN6PR04MB4640F34CAA25B3CB58F94CABFC630@SN6PR04MB4640.namprd04.prod.outlook.com>
 <1594716527.22878.28.camel@mtkswgap22>
 <SN6PR04MB46404C9EC8C29F75E5D1E45BFC610@SN6PR04MB4640.namprd04.prod.outlook.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_060629_538407_86BF508F 
X-CRM114-Status: UNSURE (   9.84  )
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

On Tue, 2020-07-14 at 09:29 +0000, Avri Altman wrote:
> > > > > > +cleanup:
> > > > > > +       spin_lock_irqsave(host->host_lock, flags);
> > > > > > +       if (!test_bit(tag, &hba->outstanding_reqs)) {
> > > Is this needed?  it was already checked in line 6439.
> > >
> > 
> > I am worried about the case that interrupt comes very lately. 
> scsi timeout is 30sec - do you expect an interrupt to arrive after that?
> 

Yeah, I agree that a 30s delayed interrupt sounds kind of ridiculous.
This checking is just to make the cleanup flow safer.

Thanks,
Stanley Chu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
