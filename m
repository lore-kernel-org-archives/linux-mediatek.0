Return-Path: <SRS0=vtlS=EI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D48C3C00A89
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2020 07:24:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7047321556
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2020 07:24:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UKSAAML8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="OG22lScN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7047321556
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=I5Z8q5e544/b4efCVGSI6VNwUoXhhuVHwU8Nhcd88mU=; b=UKSAAML8lguu1Ro40SQ5VKTuy
	ml+3OpHIHnRxEbuFpgjbDGzrF3hgzW8T4Q9KyczvHE5P39WhOlzBYwY6Jx6HhkCuK/NhW1210k0mD
	E1M7w2vxg8o6xEmc3mqdGdCGsue77pZNP2aTEtNl9PxGkKPsMJQlb7gOZ/kzCVo7OE67TKPIkUwbv
	AgUpe1yI4Kir9Cam41Rm3zRirfKyf8PZefDAxTYPFPhSZAnxDKI0J+BfgC/8lrnmoOQMfLG70r1NA
	QQkqGfibJfcoJlE4mvfWVxA/1/JupYoJx9bsp1l9/+rZY981x2jg7dbp+u731KT0UjkEav/zTJ4Y6
	uHa+olBIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZUCb-0006Kd-3o; Mon, 02 Nov 2020 07:24:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZUCW-0006Je-L3; Mon, 02 Nov 2020 07:24:25 +0000
X-UUID: ffbcc969b70047f28d1354d14f18eb4a-20201101
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=q4bvGdMGyh2E0MZ8xSG66t4ZOKnXaBEU1VOFr3jNnss=; 
 b=OG22lScNGiPMvdumuMg8CmHY5oKU0aClJMdYIm69ocu3fDe5kUu2aQFJ5fw3xXoQ+LIoMNSF0nivq9Vww4ksOMg4uR9LkKNSq/eWi3eUXWPB4Exjq6/vcDlCzz2BpWTpT/yVhl30YwDmcJEkffoiglnxxfHUcIrpz6HlMtIuDtw=;
X-UUID: ffbcc969b70047f28d1354d14f18eb4a-20201101
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1650832920; Sun, 01 Nov 2020 23:24:19 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 1 Nov 2020 23:24:17 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 2 Nov 2020 15:24:16 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 2 Nov 2020 15:24:16 +0800
Message-ID: <1604301856.804.0.camel@mtkswgap22>
Subject: Re: [PATCH v8] Add MediaTek MT6779 devapc driver
From: Neal Liu <neal.liu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Mon, 2 Nov 2020 15:24:16 +0800
In-Reply-To: <1602732276.13734.1.camel@mtkswgap22>
References: <1602732039-12179-1-git-send-email-neal.liu@mediatek.com>
 <1602732276.13734.1.camel@mtkswgap22>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_022424_956488_DE4801A1 
X-CRM114-Status: GOOD (  19.62  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Neal Liu <neal.liu@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Gentle ping for these patch series.
Thanks !

On Thu, 2020-10-15 at 11:24 +0800, Neal Liu wrote:
> add subject
> 
> On Thu, 2020-10-15 at 11:20 +0800, Neal Liu wrote:
> > These patch series introduce a MediaTek MT6779 devapc driver.
> > 
> > MediaTek bus fabric provides TrustZone security support and data protection to prevent slaves from being accessed by unexpected masters.
> > The security violation is logged and sent to the processor for further analysis or countermeasures.
> > 
> > Any occurrence of security violation would raise an interrupt, and it will be handled by mtk-devapc driver.
> > The violation information is printed in order to find the murderer.
> > 
> > changes since v7:
> > - fix VIO_MOD_TO_REG_IND calculation wrong problem.
> > - revise parameter type of ISR.
> > 
> > changes since v6:
> > - remove unnecessary mask/unmask module irq during ISR.
> > 
> > changes since v5:
> > - remove redundant write reg operation.
> > - use static variable of vio_dbgs instead.
> > - add stop_devapc() if driver is removed.
> > 
> > changes since v4:
> > - refactor data structure.
> > - merge two simple functions into one.
> > - refactor register setting to prevent too many function call overhead.
> > 
> > changes since v3:
> > - revise violation handling flow to make it more easily to understand
> >   hardware behavior.
> > - add more comments to understand how hardware works.
> > 
> > changes since v2:
> > - pass platform info through DT data.
> > - remove unnecessary function.
> > - remove slave_type because it always equals to 1 in current support SoC.
> > - use vio_idx_num instread of list all devices' index.
> > - add more comments to describe hardware behavior.
> > 
> > changes since v1:
> > - move SoC specific part to DT data.
> > - remove unnecessary boundary check.
> > - remove unnecessary data type declaration.
> > - use read_poll_timeout() instread of for loop polling.
> > - revise coding style elegantly.
> > 
> > 
> > *** BLURB HERE ***
> > 
> > Neal Liu (2):
> >   dt-bindings: devapc: add bindings for mtk-devapc
> >   soc: mediatek: add mt6779 devapc driver
> > 
> >  .../bindings/soc/mediatek/devapc.yaml         |  58 ++++
> >  drivers/soc/mediatek/Kconfig                  |   9 +
> >  drivers/soc/mediatek/Makefile                 |   1 +
> >  drivers/soc/mediatek/mtk-devapc.c             | 308 ++++++++++++++++++
> >  4 files changed, 376 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
> >  create mode 100644 drivers/soc/mediatek/mtk-devapc.c
> > 
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
