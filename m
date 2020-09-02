Return-Path: <SRS0=6rwz=CL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF49FC433E2
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 06:51:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 727D72067C
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 06:51:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lXAzKy0U";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="SAeqizcr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 727D72067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iJOAZjr8VguHmAL0N4RI0sA5VGHZhNaqcM+MviG8G8s=; b=lXAzKy0URMHbBVINm4RpI9MGY
	qX7BlAk1X9ri6WehXsnZHE7q93XnS8gkQbcX+yaCULEz39PoNcDWLs5sxxxqsG0mVZp00hvZ0nmwZ
	x/Wv3z3NNr3qRvnJv5fIjNJ5kNIgm8N4veEOAtAuM+DVMJb4HtnVa/tEH1+Q+UYn3GphhQYC58uOL
	oSON40bfTRURhwReT6dZ19blAqq2MSuo+KN0jITwCmM09GBd1dSsK02eYuiH2MtKvujheNeRyJCjD
	reE+6sLYx5dYfOsMMjHpokcT6nWwmaFpz/fmp0jzJOVROyQjDE7BNqI4M/vjOSQhy0erdvJI5VSeM
	ziDz0ttHA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDMbd-0003ji-2a; Wed, 02 Sep 2020 06:50:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDMbW-0003i4-Et; Wed, 02 Sep 2020 06:50:49 +0000
X-UUID: 627b691d45a34b58a9b84c4c0986285c-20200901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=8IuUV5he8cIh84ZEbWw62FnvkLiyHdpDvFusK86GRYY=; 
 b=SAeqizcr1H4YJbaVLfk3xuKLqPkRfpNgI1aCyPe3UqPbiGRv3fC5EQrwSo8L8LX4vpLjDZBSODyfaPEBAoWTxo4SXQ95yYAnQznmkSPRXPfwnYgDwW9mhI4Pjvc+3YBkiTWwxN0NFV0vvMdXry+lvFlcgp7DH5aXkc0Nw9xhn8o=;
X-UUID: 627b691d45a34b58a9b84c4c0986285c-20200901
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1404313755; Tue, 01 Sep 2020 22:40:16 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Sep 2020 23:40:14 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Sep 2020 14:40:12 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 2 Sep 2020 14:40:12 +0800
Message-ID: <1599028813.32069.1.camel@mtkswgap22>
Subject: Re: [PATCH v7] Add MediaTek MT6779 devapc driver
From: Neal Liu <neal.liu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Date: Wed, 2 Sep 2020 14:40:13 +0800
In-Reply-To: <1598497593-15781-1-git-send-email-neal.liu@mediatek.com>
References: <1598497593-15781-1-git-send-email-neal.liu@mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_025046_708031_4A427AB5 
X-CRM114-Status: GOOD (  18.10  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 wsd_upstream <wsd_upstream@mediatek.com>, lkml <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Neal Liu <neal.liu@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Rob, Matthias, Chun-Kuang,

Gentle ping for this patch set.
Thanks

-Neal

On Thu, 2020-08-27 at 11:06 +0800, Neal Liu wrote:
> These patch series introduce a MediaTek MT6779 devapc driver.
> 
> MediaTek bus fabric provides TrustZone security support and data protection to prevent slaves from being accessed by unexpected masters.
> The security violation is logged and sent to the processor for further analysis or countermeasures.
> 
> Any occurrence of security violation would raise an interrupt, and it will be handled by mtk-devapc driver.
> The violation information is printed in order to find the murderer.
> 
> changes since v6:
> - remove unnecessary mask/unmask module irq during ISR.
> 
> changes since v5:
> - remove redundant write reg operation.
> - use static variable of vio_dbgs instead.
> - add stop_devapc() if driver is removed.
> 
> changes since v4:
> - refactor data structure.
> - merge two simple functions into one.
> - refactor register setting to prevent too many function call overhead.
> 
> changes since v3:
> - revise violation handling flow to make it more easily to understand
>   hardware behavior.
> - add more comments to understand how hardware works.
> 
> changes since v2:
> - pass platform info through DT data.
> - remove unnecessary function.
> - remove slave_type because it always equals to 1 in current support SoC.
> - use vio_idx_num instread of list all devices' index.
> - add more comments to describe hardware behavior.
> 
> changes since v1:
> - move SoC specific part to DT data.
> - remove unnecessary boundary check.
> - remove unnecessary data type declaration.
> - use read_poll_timeout() instread of for loop polling.
> - revise coding style elegantly.
> 
> 
> *** BLURB HERE ***
> 
> Neal Liu (2):
>   dt-bindings: devapc: add bindings for mtk-devapc
>   soc: mediatek: add mt6779 devapc driver
> 
>  .../bindings/soc/mediatek/devapc.yaml         |  58 ++++
>  drivers/soc/mediatek/Kconfig                  |   9 +
>  drivers/soc/mediatek/Makefile                 |   1 +
>  drivers/soc/mediatek/mtk-devapc.c             | 305 ++++++++++++++++++
>  4 files changed, 373 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
>  create mode 100644 drivers/soc/mediatek/mtk-devapc.c
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
