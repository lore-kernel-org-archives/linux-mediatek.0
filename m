Return-Path: <SRS0=BCEy=NX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D5D9C432BE
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 05:46:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 527A460F3A
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 05:46:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 527A460F3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IumD0JFFgtO3z+yuVq4IPBfG9e561vVXKntuRatbxt0=; b=UhoRDg8OTzJrL3
	qlSrugTRQHvB5d2JIrc1RHW/dsbMLTWlHy3JtVH3NPY2/TVn+Z0yqwZdKsaL81I6GFTvlE5UwPfHn
	9FLrEm3NLifv2Qsmqfjxw3e3J+9kg++fUauT4RVpSBHwCkRRFB8P/cylcPWEaa615kcphPci3hmoi
	91oD47XQ04N/BxSdjWuB1eboctjuFaOPRhgPLr/s/Smz4W1uITOCeJRC8sdN4VdwQTAY5QZDjBza7
	p/XakWlg59Vm4z7iUk9EdTUYIJsTwHq2eeG4honSnCwXA7hF2oN5MFGoNV4tMuGcG4KRYM35csPDb
	iWVmbl1tEQPH81eVApJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLJ55-003xwN-3e; Wed, 01 Sep 2021 05:46:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLJ4X-003xge-6H
 for linux-mediatek@lists.infradead.org; Wed, 01 Sep 2021 05:46:09 +0000
X-UUID: 1e4a7bafe3bd4c739a81b99d97a6944b-20210831
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=AVKDGESxkUIqb5eW1b30pL9AL/33KNaxVIvLODxrvmc=; 
 b=J2Ljz3KD6vmCZ9Ioi1tKBtPS/7HfGegkQdmDHJbbD76mPMMn7v4ocmSvdqCCEg6TSaRCsO4nR758vZjjXzNg+vIeDcPkqqAGqVA0BpahFxVjuJdJs7Ds0CY4A86ItQffqlFtsU56+1DHUaeJlLlSExHx4i+ifENkiSRoxrk9Blc=;
X-UUID: 1e4a7bafe3bd4c739a81b99d97a6944b-20210831
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <peter.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1546506378; Tue, 31 Aug 2021 22:46:00 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 31 Aug 2021 22:45:59 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Sep 2021 13:45:57 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 1 Sep 2021 13:45:57 +0800
Message-ID: <7ab5239c6d8c7fc2d883bec6ccc6268021afba76.camel@mediatek.com>
Subject: Re: [PATCH v1] scsi: ufs: ufs-mediatek: Change dbg select by check
 hw version
From: Peter Wang <peter.wang@mediatek.com>
To: Bart Van Assche <bvanassche@acm.org>, <stanley.chu@mediatek.com>,
 <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <chun-hung.wu@mediatek.com>, <alice.chao@mediatek.com>,
 <cc.chou@mediatek.com>, <chaotian.jing@mediatek.com>,
 <jiajie.hao@mediatek.com>, <powen.kao@mediatek.com>,
 <jonathan.hsu@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>
Date: Wed, 1 Sep 2021 13:45:57 +0800
In-Reply-To: <e3f14336-2cc6-3985-fd52-ead795737417@acm.org>
References: <1630325486-11741-1-git-send-email-peter.wang@mediatek.com>
 <dda8eb67-fe56-8bc0-5ce8-a62bd4e6b995@acm.org>
 <da0ebaf6bb6e556eeb2f6fe4037d891bafc79ecd.camel@mediatek.com>
 <e3f14336-2cc6-3985-fd52-ead795737417@acm.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_224605_302255_D65C1DE4 
X-CRM114-Status: GOOD (  14.60  )
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

Hi Bart,

Really appreciate your reminder.
We will upload new patch to bypss KCSAN.
Thank you very much.

Peter 


On Tue, 2021-08-31 at 19:55 -0700, Bart Van Assche wrote:
> On 8/31/21 19:29, Peter Wang wrote:
> > REG_UFS_MTK_HW_VER is a read only mediatek dedicated register.
> > So, hw_ver will get a const value for mediatek to decide how to use
> > debug select. It only need read once, no need multi-threads
> > protected.
> 
> Hi Peter,
> 
> The above can be concluded easily by a human but not by software. If 
> this code is analyzed with KCSAN then KCSAN will probably complain.
> See 
> also Documentation/dev-tools/kcsan.rst.
> 
> Anyway, I'm fine with this patch.
> 
> Thanks,
> 
> Bart.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
