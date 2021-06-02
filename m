Return-Path: <SRS0=eP1B=K4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC63FC4708F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 11:26:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9462C613D2
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 11:26:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9462C613D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ehz1fxf/SzJAw2AmOTCI2jKdcdXbjm/ct7e60QQ6DMk=; b=wj2iAvdBahhitM
	6NbCpJU5qaapbCdIwlaOH9Ch0FEecapODUwmnDhQ0UB14gETn/fIyY5rvaazjthesXddWxo+oM43e
	xX25X+NjRG1gsO/NWd7hwtzETPsQHoaW3cZtYk1K/XBWThdv9GxTu+9TMxDuYf4hwpIs+KhnC8i99
	NtHQrHQ9mia9Bcxprf5td2BjMyfaU3Wg9kczikdaJB5c5ITXmMtG63E0Dm0IRT1YgRbYkSNtNoyfW
	G18wD4JY6wpr9uQ/M1+fMFYfBtS7d/Puas2W9UBTlTXM5xqJYC/2Tjw1Drs/QtJswFWTqUPB5eT3e
	BwUjvsFwiVOJXMoBJfuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loP0c-003j8n-JD; Wed, 02 Jun 2021 11:26:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loOvo-003hS8-1X; Wed, 02 Jun 2021 11:21:10 +0000
X-UUID: 0a8fe1a0cc4e4551ae554d786d293c48-20210602
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=PnsI2mR41W+XcpgjjqBWIOxEpTojkTlBQ3wb41Vqboc=; 
 b=N5fL/3cBNcOXGW4S1pOj8XV1UKgd00Jpab61LZw+PImoTxJkK78IQ+IhUBClVKEEjvRKrv0TAeVFmfHQMZeDogI3vfvgc4S7LXmjmQx87Fw2VzbDrYQrtdZz95XZ1lZGKJl64crgM8wDxb1h+6+7SVCpucpWckJD51KSNd+XJ6w=;
X-UUID: 0a8fe1a0cc4e4551ae554d786d293c48-20210602
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <james.lo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1033912138; Wed, 02 Jun 2021 04:21:02 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Jun 2021 04:21:01 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Jun 2021 19:20:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 2 Jun 2021 19:20:53 +0800
From: James Lo <james.lo@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: Sascha Hauer <s.hauer@pengutronix.de>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Subject: Add PMIC wrapper support for Mediatek MT8195 SoC IC
Date: Wed, 2 Jun 2021 19:20:48 +0800
Message-ID: <20210602112050.12338-1-james.lo@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_042104_119220_B7B6AA86 
X-CRM114-Status: UNSURE (   8.53  )
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

This series adds support for new SoC MT8195 to the pmic-wrap driver.

Henry Chen (2):
  dt-bindings: mediatek: add compatible for MT8195 pwrap
  soc: mediatek: pwrap: add pwrap driver for MT8195 SoC

 .../bindings/soc/mediatek/pwrap.txt           |  1 +
 drivers/soc/mediatek/mtk-pmic-wrap.c          | 35 +++++++++++++++++++
 2 files changed, 36 insertions(+)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
