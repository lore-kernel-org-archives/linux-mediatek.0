Return-Path: <SRS0=eP1B=K4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08815C4708F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 13:35:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CACE7613B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 13:35:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CACE7613B4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aY8fE9gnZ81F4DrVUpCwJ5DXPPJOAuz2IeYIUvR21bw=; b=qIBVDrDYpqlmHR
	5D32AMvGblbn9IUeXmLKoRKUEKNmzr4V1jbQE934qJ7eqlUFmZes/CHe0THm2OJRq0djEOVynEDHD
	Ebsf6MI1HF5+NiBUzAlp66ByWxrSxKEG8ApFqfvIu7wCab27w130TIvTmU7uAkExVB8TnwbeNSFgT
	zcNMkFIygBQvuDb8MHm+4hD+AxNJO0pHs+zdUTbmVwJMB1q6LBrB/x/tD5e+h+jVMQZ7+/p/3whuE
	oOYErDT3exzAHkM6makq43Jf17nuAF/7cfX9mZFXbxXpGxRcGvXTaIxHEzW/gaXqaYRwpPwnLYTPB
	VDVxOeQJQqUJMOxhsHuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loR1J-004NZR-2I; Wed, 02 Jun 2021 13:34:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loR1D-004NYY-U1
 for linux-mediatek@lists.infradead.org; Wed, 02 Jun 2021 13:34:51 +0000
X-UUID: 96d81b74cfad41bbb25b6eaceeed7a87-20210602
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=9hbb8O6BI5gt7CFoq95S1grGDY1B6J6/8izewqh8RFM=; 
 b=onQmnGUO9CoceiO9EHA9t88NxUyoZNWq50lqqotgw31Iqt35gPxcJ4w4yf5i/KaIl36BmpjhMOJr4UJe0gCdUxuDwNd64ihiFV1ZVWYkA09pYGnQmGES1a0mntqqGexxazg8qYZjzTDZ2rqbLpCL+d80TsjFvP4ozUvdlJfd9oI=;
X-UUID: 96d81b74cfad41bbb25b6eaceeed7a87-20210602
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 850790027; Wed, 02 Jun 2021 06:34:43 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Jun 2021 06:34:42 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Jun 2021 21:34:34 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 2 Jun 2021 21:34:34 +0800
Message-ID: <1622640874.7096.3.camel@mtkswgap22>
Subject: Re: [PATCH v2] scsi: ufs-mediatek: create device link of reset control
From: Stanley Chu <stanley.chu@mediatek.com>
To: <peter.wang@mediatek.com>
CC: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <chun-hung.wu@mediatek.com>, <alice.chao@mediatek.com>,
 <cc.chou@mediatek.com>, <chaotian.jing@mediatek.com>,
 <jiajie.hao@mediatek.com>
Date: Wed, 2 Jun 2021 21:34:34 +0800
In-Reply-To: <1622601720-22466-1-git-send-email-peter.wang@mediatek.com>
References: <1622601720-22466-1-git-send-email-peter.wang@mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_063447_991593_035092AC 
X-CRM114-Status: UNSURE (   8.11  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Peter,

On Wed, 2021-06-02 at 10:42 +0800, peter.wang@mediatek.com wrote:
> From: Peter Wang <peter.wang@mediatek.com>
> 
> Mediatek UFS reset function is relied on Reset Control provided
> by reset-ti-syscon. To make Reset Control work properly, select
> reset-ti-syscon to ensure it being built with ufs-mediatek together.
> In addition, establish device link to wait until reset-ti-syscon
> initialization is done during UFS probing flow.
> 
> Signed-off-by: Peter Wang <peter.wang@mediatek.com>

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
