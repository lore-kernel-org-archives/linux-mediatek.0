Return-Path: <SRS0=eFaK=B7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30BFFC433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 09:41:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01E4D207BB
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 09:41:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wPVUKb6v";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="d3HdPs75"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01E4D207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ajQTp9qupTEutTLTdMKWO57KnSIEK3C+PaZyCr5hBX0=; b=wPVUKb6v63tsu5TZLf20nxHekb
	Mb/mTx5Dd0QBPlg1L2dD/inV5+0bXDFEGwzFEknJ3zVw9ASPGIR5w0ZLgNJJoeIqQdJ2nsofTPVpa
	q6BZSmuPFEPtRKtfr+jVcoJZakzUlk+vClhRy0NldyblQBoCrl+orApqQrB/exS0CMnJuskw7aNHT
	QZgsUrFSAxqOdMqpdgUjNAMl83cznULTOq5wufkUFpxyKA5ZckII4yLMuYSRuyUmx9hRG1kekS5VM
	O2R2wCKyBOmoIpQiw9zwppEpvQVysi3YsNQoyXbnNJJR7EG6gniqUEfZn1Gl565/VVW/K1kpVMtrb
	5hTjq1mA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k93Xz-00025E-G9; Fri, 21 Aug 2020 09:41:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k93Xv-00022i-4S; Fri, 21 Aug 2020 09:41:16 +0000
X-UUID: 6c65cdf315de4af2a50c59de04899f21-20200821
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=SAJZUx4zLi2MX2DElRX0q99dr5GWJ9MVZVXGhpyhDh4=; 
 b=d3HdPs75+1bnNVjF58ScLFubO7g+Ydqum2tHHUgMzs4YpUuzCfcGolwEvuJWn6xJqXNhAhcQfhHJ7NUZeU7t61KPeFQ9+3KK5zScErjuYDFl9pdcoSttPRCCI2ZnQrJBCwQDsNc9ej3Rouh+5CGX2k9zYsqAOI87ndowdvs8eJk=;
X-UUID: 6c65cdf315de4af2a50c59de04899f21-20200821
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 670276005; Fri, 21 Aug 2020 01:41:06 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 21 Aug 2020 02:31:04 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 21 Aug 2020 17:31:01 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 21 Aug 2020 17:31:01 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 0/2] Add SPMI support for Mediatek MT6873/8192 SoC IC
Date: Fri, 21 Aug 2020 17:30:58 +0800
Message-ID: <1598002260-12724-1-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_054115_395448_06EDBC9A 
X-CRM114-Status: GOOD (  13.04  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series adds support for new SoC MT6873/8192 to the spmi driver.

Hsin-Hsiung Wang (2):
  dt-bindings: spmi: document binding for the Mediatek SPMI controller
  spmi: mediatek: Add support for MT6873/8192

 .../devicetree/bindings/spmi/spmi-mtk-pmif.txt     |  33 ++
 drivers/spmi/Kconfig                               |   9 +
 drivers/spmi/Makefile                              |   1 +
 drivers/spmi/spmi-mtk-pmif.c                       | 479 +++++++++++++++++++++
 4 files changed, 522 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spmi/spmi-mtk-pmif.txt
 create mode 100644 drivers/spmi/spmi-mtk-pmif.c

-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
