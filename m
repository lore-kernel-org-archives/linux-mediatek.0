Return-Path: <SRS0=+2Q0=DW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A94C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Oct 2020 03:25:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B861022243
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Oct 2020 03:25:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VtpvXZbG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="vEB+V7Yr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B861022243
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fgT7MNUy3cqVSHw5j58v2x8ert+c3bpZn+JtVH5bW4Y=; b=VtpvXZbGUBd/QofB2EOSiWnZO
	UyP0WB7+f1LVO3tQmJjcJdPFdfA593st0EwvKEXHKpnd1yLCdaCnY3tKJ68x5eOyQ9Balzp20L2lO
	gbboLtsvgM7DCTiLeNJPEgzVP/ykJ6DAGyyYNIPDtJErcPEy/6/2/kdwDzt1zYYnCPX4+5YXfEdRl
	FuoWv3cGKkN4+2SMD6lJATFkX/OG3EQB6dYd89GVLJGsHxgsgpFabkRuoxjeSnIACymHb7F/QjRzd
	FYBAPgn4ZZ3TgmcJcMOeMuafIOWMkno4a4gFowUWCjLigl6Y5yBYhwjcFxyeDQ3vkQwA7Bi3X7Yja
	yiO0jTAVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSttP-0005Vh-5T; Thu, 15 Oct 2020 03:25:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSttF-0005Rs-8w; Thu, 15 Oct 2020 03:25:20 +0000
X-UUID: 65ff8a438f5d4c4e8e204bccac3f24c6-20201014
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=pmsobvcv+HjZGQVWkOFXSSxEvgvct9280t38GO0t+XY=; 
 b=vEB+V7YrMQaCEfsArsA+Bnm2LxAL6BcL813uSLVl/Fw2sZuKkVRrgfwNUoV37uSf9tDt+N45ujd4P3fdF0n4UPl8xW68dkC5bxdRdIGRqKDpiVt70jJhOLUIKL/sixjf0sYnP5fMmmX11sWLGvPqi5SzAgIDx64qBFiFBcL5gdE=;
X-UUID: 65ff8a438f5d4c4e8e204bccac3f24c6-20201014
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1998534123; Wed, 14 Oct 2020 19:24:57 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Oct 2020 20:24:55 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Oct 2020 11:24:37 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 15 Oct 2020 11:24:36 +0800
Message-ID: <1602732276.13734.1.camel@mtkswgap22>
Subject: [PATCH v8] Add MediaTek MT6779 devapc driver
From: Neal Liu <neal.liu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Date: Thu, 15 Oct 2020 11:24:36 +0800
In-Reply-To: <1602732039-12179-1-git-send-email-neal.liu@mediatek.com>
References: <1602732039-12179-1-git-send-email-neal.liu@mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201014_232517_470449_C8DDB64D 
X-CRM114-Status: GOOD (  16.32  )
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

add subject

On Thu, 2020-10-15 at 11:20 +0800, Neal Liu wrote:
> These patch series introduce a MediaTek MT6779 devapc driver.
> 
> MediaTek bus fabric provides TrustZone security support and data protection to prevent slaves from being accessed by unexpected masters.
> The security violation is logged and sent to the processor for further analysis or countermeasures.
> 
> Any occurrence of security violation would raise an interrupt, and it will be handled by mtk-devapc driver.
> The violation information is printed in order to find the murderer.
> 
> changes since v7:
> - fix VIO_MOD_TO_REG_IND calculation wrong problem.
> - revise parameter type of ISR.
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
>  drivers/soc/mediatek/mtk-devapc.c             | 308 ++++++++++++++++++
>  4 files changed, 376 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
>  create mode 100644 drivers/soc/mediatek/mtk-devapc.c
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
