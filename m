Return-Path: <SRS0=6DyL=5M=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C617C43331
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Mar 2020 09:55:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E7F920578
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Mar 2020 09:55:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M1BxYNcY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="CC4qD8sa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E7F920578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j5PD+t5fMI+tWUWo92hRh/Vh1UtD6YNUYHWoCmvx7/k=; b=M1BxYNcYCQJTDW
	EOSyZ5m0Ov9jhQj6Sc60q7e/hnFmTTUASkASNa6xhcPXRKsujpBl8AtaIzaH9Z7nmoMxz+UhYGLjp
	MOWbQ8ZOLYH96C/j+rRfHRb73dV6C+CvXDB1gYcoBR9Yj0d2Ia+FFtkGxtre10IyLgEob87+B++tx
	4xHpR7/fN/uEW2lUyozICHfXGItIHQEqPumj1F1yej29+rrxWlmXmUakr4s3F2bZGhPg9DAdL9FZd
	vz7sHeM+BfUWVnzku1gcRuCRNTEpH5pduv68PcLYTj2gkevbe/3vQMIjeCZ8abTa3PJxuD3U3AJSr
	ASQWm7QukmVuDZTRKVRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHlhy-0006DJ-AO; Fri, 27 Mar 2020 09:55:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHlhn-000648-9S; Fri, 27 Mar 2020 09:55:13 +0000
X-UUID: b27bc94ba8cf4a4e8ac2bfbb379b4b3b-20200327
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=mhldOisu3DDCyVpCIZOg4fKzpce7E3Pq+4ZmOlXaB40=; 
 b=CC4qD8saT8cbcbSn6N+UrR+xOk3+pZ2+zXlyH63nEL132KY4vOmq8eXoD3BZDf0GblQgRoRG7Na30a3AP8GQxy6+RNzckyTuiXCSrx4IVbr533UHnCF6u9w56yf9QdN63+78jxZk8In1cUkGtibwpLWLQU7rPAJ+K75Tf7nwYrQ=;
X-UUID: b27bc94ba8cf4a4e8ac2bfbb379b4b3b-20200327
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1291488049; Fri, 27 Mar 2020 01:55:07 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 27 Mar 2020 02:55:05 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 27 Mar 2020 17:54:55 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 27 Mar 2020 17:54:55 +0800
Message-ID: <1585302896.4609.2.camel@mtksdccf07>
Subject: RE: [PATCH v2 2/2] scsi: ufs-mediatek: add error recovery for
 suspend and resume
From: Stanley Chu <stanley.chu@mediatek.com>
To: Avri Altman <Avri.Altman@wdc.com>
Date: Fri, 27 Mar 2020 17:54:56 +0800
In-Reply-To: <SN6PR04MB4640191B1F648C3D43BD9AF8FCCC0@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <20200326150747.11426-1-stanley.chu@mediatek.com>
 <20200326150747.11426-3-stanley.chu@mediatek.com>
 <SN6PR04MB4640191B1F648C3D43BD9AF8FCCC0@SN6PR04MB4640.namprd04.prod.outlook.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B2902B3FD719266556EA2DD3FDCC2597BFDE148D1E39AB67CAC55E4472BE7D1A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_025511_340083_4EB2EF57 
X-CRM114-Status: GOOD (  10.71  )
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
 "beanhuo@micron.com" <beanhuo@micron.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Avri,

On Fri, 2020-03-27 at 09:23 +0000, Avri Altman wrote:
> > 
> > Once fail happens during suspend and resume flow if the desired low
> > power link state is H8, link recovery is required for MediaTek UFS
> > controller.
> > 
> > For resume flow, since power and clocks are already enabled before
> > invoking vendor's resume callback, simply using ufshcd_link_recovery()
> > inside callback is fine.
> > 
> > For suspend flow, the device power enters low power mode or is disabled
> > before suspend callback, thus ufshcd_link_recovery() can not be directly
> > used in callback. To leverage host reset flow during ufshcd_suspend(),
> > set link as off state enforcedly 
> Not sure this is a proper English, but I'm not sure.
> 
> to let ufshcd_host_reset_and_restore()
> > be executed by ufshcd_suspend().

Thanks for your review! I will fix this sentence in next version.

Stanley Chu
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
