Return-Path: <SRS0=Kazo=DH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F08BC2D0A8
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 07:30:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84399206A4
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 07:30:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JOpWCYBf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IJjmJYa5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84399206A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YJF7AMaXz3p6Rb3A19tyMF5nBUagAVnNCnar8zHRJ8Q=; b=JOpWCYBfgQbiMeskg0s0S0lyh
	G4ly6AUu2ZtV2km11zBvYEHoVdMMEe03uwMi7/SmoMcE3nIU6AEXSYwKM58H1SSySCYkQKtL35JFc
	9oF5YaBGIZcZi7OSK5ThkkF5OTZJt7PoMUe+5EJGn6gtdLpsKpQefy0bT3IYIvk0K/mxhQKCymtFW
	2FC1nGdRFS8yI3l2xnURiWXQw5tS0AhIbkWHBipxc36RFljkNogMq99TaghwJAJ9K7QhllOcyCuHV
	oD6+L2Fpqw1/A+zoup5XKArEmSm0zpidXjVpDf2L6em8mC2qL4bbzZddSAXL+5b2qiXJJSkQdYkhB
	DvOC7uJ0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNWZ2-0007u0-Tp; Wed, 30 Sep 2020 07:30:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNWSt-0004S3-7E; Wed, 30 Sep 2020 07:23:54 +0000
X-UUID: a2e6cd64826b436f8163706195582ab7-20200929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=sNcH4x4lnYgToeUd+jBjU/sTj/7ms1xPJ3DnTKAMxb0=; 
 b=IJjmJYa54QMzOQ4aIJE1Kqqymid1LeFZFuHde+2ZBHWOv1E/mV9T+ht3ZbasLuB3NYvPpcLoJzYJdezEcVOAtdrZU644oyIOg0K6tJSG9uugzXX01oy8PRPU2WntM2GIexVhU5rCznx9Kvmq/Kk25KHzzAVk20xaje5ICmzqvGQ=;
X-UUID: a2e6cd64826b436f8163706195582ab7-20200929
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 632652911; Tue, 29 Sep 2020 23:17:23 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Sep 2020 00:10:09 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Sep 2020 15:10:08 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Sep 2020 15:10:09 +0800
Message-ID: <1601449808.7564.2.camel@mtkswgap22>
Subject: Re: [PATCH v7] Add MediaTek MT6779 devapc driver
From: Neal Liu <neal.liu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Wed, 30 Sep 2020 15:10:08 +0800
In-Reply-To: <1600758789.19001.4.camel@mtkswgap22>
References: <1598497593-15781-1-git-send-email-neal.liu@mediatek.com>
 <1599028813.32069.1.camel@mtkswgap22> <1599640627.6370.3.camel@mtkswgap22>
 <1600246737.14155.3.camel@mtkswgap22> <1600758789.19001.4.camel@mtkswgap22>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: E6C5B16061FD81EDFCF10D81456BBBA9DCB241534B9CF99787AEE3C8644984D12000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_032351_758390_CDDE3A26 
X-CRM114-Status: GOOD (  27.25  )
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

Hi Matt,

Hope this mail could find you well.
Is everything okay?
It would be glad if you could reply me no matter the review status.

Thanks

-Neal

On Tue, 2020-09-22 at 15:13 +0800, Neal Liu wrote:
> Hi Matthias,
> 
> We need this driver supported on main-line.
> Could you save your time for us to review it?
> Thanks
> 
> -Neal
> 
> On Wed, 2020-09-16 at 16:58 +0800, Neal Liu wrote:
> > Hi Rob, Matthias, Chun-Kuang,
> > 
> > Sorry for pushing you so hard.
> > May I know is this patch set is comfortable to apply on latest kernel?
> > Thanks
> > 
> > -Neal
> > 
> > On Wed, 2020-09-09 at 16:37 +0800, Neal Liu wrote:
> > > Hi Rob, Matthias, Chun-Kuang,
> > > 
> > > Please kindly let me know your comments about this patch set.
> > > Thanks
> > > 
> > > -Neal
> > > 
> > > On Wed, 2020-09-02 at 14:40 +0800, Neal Liu wrote:
> > > > Hi Rob, Matthias, Chun-Kuang,
> > > > 
> > > > Gentle ping for this patch set.
> > > > Thanks
> > > > 
> > > > -Neal
> > > > 
> > > > On Thu, 2020-08-27 at 11:06 +0800, Neal Liu wrote:
> > > > > These patch series introduce a MediaTek MT6779 devapc driver.
> > > > > 
> > > > > MediaTek bus fabric provides TrustZone security support and data protection to prevent slaves from being accessed by unexpected masters.
> > > > > The security violation is logged and sent to the processor for further analysis or countermeasures.
> > > > > 
> > > > > Any occurrence of security violation would raise an interrupt, and it will be handled by mtk-devapc driver.
> > > > > The violation information is printed in order to find the murderer.
> > > > > 
> > > > > changes since v6:
> > > > > - remove unnecessary mask/unmask module irq during ISR.
> > > > > 
> > > > > changes since v5:
> > > > > - remove redundant write reg operation.
> > > > > - use static variable of vio_dbgs instead.
> > > > > - add stop_devapc() if driver is removed.
> > > > > 
> > > > > changes since v4:
> > > > > - refactor data structure.
> > > > > - merge two simple functions into one.
> > > > > - refactor register setting to prevent too many function call overhead.
> > > > > 
> > > > > changes since v3:
> > > > > - revise violation handling flow to make it more easily to understand
> > > > >   hardware behavior.
> > > > > - add more comments to understand how hardware works.
> > > > > 
> > > > > changes since v2:
> > > > > - pass platform info through DT data.
> > > > > - remove unnecessary function.
> > > > > - remove slave_type because it always equals to 1 in current support SoC.
> > > > > - use vio_idx_num instread of list all devices' index.
> > > > > - add more comments to describe hardware behavior.
> > > > > 
> > > > > changes since v1:
> > > > > - move SoC specific part to DT data.
> > > > > - remove unnecessary boundary check.
> > > > > - remove unnecessary data type declaration.
> > > > > - use read_poll_timeout() instread of for loop polling.
> > > > > - revise coding style elegantly.
> > > > > 
> > > > > 
> > > > > *** BLURB HERE ***
> > > > > 
> > > > > Neal Liu (2):
> > > > >   dt-bindings: devapc: add bindings for mtk-devapc
> > > > >   soc: mediatek: add mt6779 devapc driver
> > > > > 
> > > > >  .../bindings/soc/mediatek/devapc.yaml         |  58 ++++
> > > > >  drivers/soc/mediatek/Kconfig                  |   9 +
> > > > >  drivers/soc/mediatek/Makefile                 |   1 +
> > > > >  drivers/soc/mediatek/mtk-devapc.c             | 305 ++++++++++++++++++
> > > > >  4 files changed, 373 insertions(+)
> > > > >  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
> > > > >  create mode 100644 drivers/soc/mediatek/mtk-devapc.c
> > > > > 
> > > > 
> > > > 
> > > 
> > > 
> > 
> > 
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
