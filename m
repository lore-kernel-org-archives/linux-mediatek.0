Return-Path: <SRS0=f9HX=7P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7442C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jun 2020 08:25:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6799620674
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jun 2020 08:25:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HXZY4c7P";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="juOEJE4Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6799620674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Pn+OkcwV2ebxX06VYTRK8aSxcXiEjjfAoxKTXVYISys=; b=HXZY4c7P1m2RX2
	dqCgFy9UvE0kotrqtA+iGyTWUy3mThxE8oCpaOMPYRln4Os6gh2HW1vWZqjjxG2tdVdF9vx9W6vfQ
	ZZoJ605UUFug6EmuunpxsdNvlEGL/hE7n5rNR2vyKJWkpb1IyocXgKrxJjhmr58ICgrHjDc62H+Mv
	KdbnQik0WFeYIWFWrF37tAClpLQTGA3SihH8QJZMkZbWY4gmlX7NfCczOM63U/5XcpiYHUmJX6XTw
	yOwOQlkOM9zr2HTBRi8uz6n1/rRm1+gC+rv1paSgSSMbI5hK/7Gi7GpFMYTAo7OLgFADfB87SZwwx
	mTc3k7HKB51AU8FmujTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jg2Eb-0004zV-4C; Tue, 02 Jun 2020 08:25:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jg2EX-0004yN-Rd; Tue, 02 Jun 2020 08:25:19 +0000
X-UUID: 5a959a0cd4d64fe1ba78d4874ab525f7-20200602
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=KYrBaNtif/3VCFCQAyrN/XFfbiRCsls3LdboJ24kUjg=; 
 b=juOEJE4Qtr7VKR/aVy3s1kn/1VNq/I3Adeoc9nU+V9GAZAh9O0Mss+7phmRlvfDmzs96Ak8Q6VDcjykrdXQMT1UEyFrJ6jvODM3xwlfE6MHVFnirP7Y7iCgdKZ3QkOaQ/7DzVZuoafdK3zcfs6AqwzDKYfiBUcSSAEgRhRVmPJM=;
X-UUID: 5a959a0cd4d64fe1ba78d4874ab525f7-20200602
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1610587597; Tue, 02 Jun 2020 00:25:16 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Jun 2020 01:15:11 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Jun 2020 16:14:58 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 2 Jun 2020 16:14:58 +0800
From: Neal Liu <neal.liu@mediatek.com>
To: Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: Security Random Number Generator support
Date: Tue, 2 Jun 2020 16:14:36 +0800
Message-ID: <1591085678-22764-1-git-send-email-neal.liu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: 94F4E944B9EF29E1123C6BE1784E0CFC99BCFFF856242D1AE2433041B1BDFE682000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_012517_899170_1A2DF627 
X-CRM114-Status: UNSURE (   9.06  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 lkml <linux-kernel@vger.kernel.org>, Crystal Guo <Crystal.Guo@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-crypto@vger.kernel.org,
 Neal Liu <neal.liu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

These patch series introduce a security random number generator
which provides a generic interface to get hardware rnd from Secure
state. The Secure state can be Arm Trusted Firmware(ATF), Trusted
Execution Environment(TEE), or even EL2 hypervisor.

Patch #1..2 adds sec-rng kernel driver for Trustzone based SoCs.
For security awareness SoCs on ARMv8 with TrustZone enabled,
peripherals like entropy sources is not accessible from normal world
(linux) and rather accessible from secure world (HYP/ATF/TEE) only.
This driver aims to provide a generic interface to Arm Trusted
Firmware or Hypervisor rng service.


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

  changes since v5:
  - refactor to more generic security rng driver which
    is not platform specific.

*** BLURB HERE ***

Neal Liu (2):
  dt-bindings: rng: add bindings for sec-rng
  hwrng: add sec-rng driver

 .../devicetree/bindings/rng/sec-rng.yaml      |  53 ++++++
 drivers/char/hw_random/Kconfig                |  13 ++
 drivers/char/hw_random/Makefile               |   1 +
 drivers/char/hw_random/sec-rng.c              | 155 ++++++++++++++++++
 4 files changed, 222 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rng/sec-rng.yaml
 create mode 100644 drivers/char/hw_random/sec-rng.c

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
