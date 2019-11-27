Return-Path: <SRS0=L+xn=ZT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8518EC432C0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Nov 2019 14:23:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55193206F0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Nov 2019 14:23:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LhkpzHFN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="FWsISVEZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55193206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QAIvfptGbJOjgsgdHL+XBnHGWdCJ2Fe5E5RsNUCKHLU=; b=LhkpzHFNG9oBsz
	fb3i6zarGRQ23xEo8FQAOUN2Wg11IbnRYoVew+RtF4PWrvDyyIUmqBIiRNNDctSV2lmEfs4Pito42
	4JWgbFywED8DW8wSEIrr4jFiNh7TfOGz83W+vkx4+3XLoIF0puWYJhWmFR9wbF5UXiQd3nwvnqVEO
	zgk8dpoRfwFDC1MkOQFqXG0wfMdPDdeMBcXssBC3Ub1MOVpKack7jhtsRFwjYIlCzqAAtWABErk2N
	/xY+GYFVyQGl0VsjCO2viimI3YLSJo2cVuLRhjByIkEeKHGjMq9l0Uv1ZpmsLGrbeJ8A0ZVqUwiF1
	3yF2yf4GRvVjLWsD3V7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZyDw-0007H7-Rr; Wed, 27 Nov 2019 14:23:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZyDt-0007Dp-1u; Wed, 27 Nov 2019 14:23:18 +0000
X-UUID: 9e0ffb7abcdf4597948b1d497af4b96e-20191127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=NhBME09v3vIkyV7lPjd2SdpUbwvFpe5cLCJrE0AJDLc=; 
 b=FWsISVEZgeGOrx7RXH9FxrOyHQF+Ac8LeyYh2C13e8uq3ZmAk8eg2FTdbOHaSGG3faatGbkdjQXY4E0IzcsVByRjLJ5A1vZEKir+qrSkexiQ35jDj941Engs3WRrO39yBt78a8CdBfHRSeDHNoXOsIUbASgX7PJoDGuXE828psY=;
X-UUID: 9e0ffb7abcdf4597948b1d497af4b96e-20191127
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1540663985; Wed, 27 Nov 2019 06:23:07 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 27 Nov 2019 06:23:41 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 27 Nov 2019 22:22:59 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Wed, 27 Nov 2019 22:23:03 +0800
From: Neal Liu <neal.liu@mediatek.com>
To: Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>
Subject: [PATCH v5 0/3] MediaTek Security random number generator support
Date: Wed, 27 Nov 2019 22:22:55 +0800
Message-ID: <1574864578-467-1-git-send-email-neal.liu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191127_062317_096417_1954041D 
X-CRM114-Status: GOOD (  10.44  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, Crystal Guo <Crystal.Guo@mediatek.com>,
 linux-crypto@vger.kernel.org, Neal Liu <neal.liu@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

These patch series introduce a generic rng driver for Trustzone
based kernel driver which would like to communicate with ATF
SIP services.

Patch #1 initials SMC fid table for Mediatek SIP interfaces and
adds HWRNG related SMC call.

Patch #2..3 adds mtk-sec-rng kernel driver for Trustzone based SoCs.
For MediaTek SoCs on ARMv8 with TrustZone enabled, peripherals like
entropy sources is not accessible from normal world (linux) and
rather accessible from secure world (ATF/TEE) only.
This driver aims to provide a generic interface to ATF rng service.


changes since v1:
- rename mt67xx-rng to mtk-sec-rng since all MediaTek ARMv8 SoCs can reuse
  this driver.
- refine coding style and unnecessary check.

changes since v2:
- remove unused comments.
- remove redundant variable.

changes since v3:
- add dt-bindings for MediaTek rng with TrustZone enabled.
- revise HWRNG SMC call fid.

changes since v4:
- move bindings to the arm/firmware directory.
- revise driver init flow to check more property.


Neal Liu (3):
  soc: mediatek: add SMC fid table for SIP interface
  dt-bindings: rng: add bindings for MediaTek ARMv8 SoCs
  hwrng: add mtk-sec-rng driver

 .../arm/firmware/mediatek,mtk-sec-rng.txt     |  18 +++
 drivers/char/hw_random/Kconfig                |  16 +++
 drivers/char/hw_random/Makefile               |   1 +
 drivers/char/hw_random/mtk-sec-rng.c          | 103 ++++++++++++++++++
 include/linux/soc/mediatek/mtk_sip_svc.h      |  33 ++++++
 5 files changed, 171 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/firmware/mediatek,mtk-sec-rng.txt
 create mode 100644 drivers/char/hw_random/mtk-sec-rng.c
 create mode 100644 include/linux/soc/mediatek/mtk_sip_svc.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
