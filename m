Return-Path: <SRS0=pCB/=ZN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98BEBC43215
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Nov 2019 09:13:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BD36208C0
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Nov 2019 09:13:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fAo47W5J";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Kz4ZqHVD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BD36208C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/JN3bKl547bMjGtoF7Ro7BoJQMQYmucTl45v1L2kCcw=; b=fAo47W5JzKelk/
	8fQCWmZ5S+fCVHMwPwsVXTYDdA1l95CpksdKxRNwSxjyr3nx5iviEzPuoy4gr00j0rQrx3voXz7vw
	L2cdGWW5VIY1I1KWRgEqZRKwVUg0pZ2clj7DYzwOtFSnVoEZIlg5KEz6WxxCUCfTvIjd/776ZRNqD
	1UOtqgPCZQWlyxR3o7yo7wxtZvEUi8mz3Pia8mDF6J/c4Q0YnB9LgINIYRvr0ryxeNdhpAuxk52QO
	crGXSsAzl7xuIhZ3entcmbFeZZax3Xmm1nLggzEMzlxS+BI2an9WgZaSDpK6nfogdA0bVe+eoqR1k
	V3Q2Uf+uYuVLoqjazbog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXiWq-0001Su-1S; Thu, 21 Nov 2019 09:13:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXiWo-0001RZ-6m; Thu, 21 Nov 2019 09:13:31 +0000
X-UUID: 82c07964102d404989e33e0fc078c2b6-20191121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=bFJxZH0AXm81N1vk9AvWXrEq/g3qKxp104WObxKx0SM=; 
 b=Kz4ZqHVDnNxE0d6MXDwos+tlqrmmRLxqau6UmGS9DLXxbckvROlu1Rkq9jpbcHrKSxdvsGN83yU+wFp6IIMKg+YdbaZbIRMoA0VLcc/RtrP6TNOJCVKQ2qH/JpJUOb0fiqwkoMPzmipJi8jgSytHu10XTT0XElJHcLosbeYZU10=;
X-UUID: 82c07964102d404989e33e0fc078c2b6-20191121
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 332807170; Thu, 21 Nov 2019 01:13:27 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 21 Nov 2019 01:13:45 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 21 Nov 2019 17:13:21 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Thu, 21 Nov 2019 17:13:28 +0800
From: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jassi Brar <jassisinghbrar@gmail.com>
Subject: support gce on mt6779 platform
Date: Thu, 21 Nov 2019 17:12:20 +0800
Message-ID: <1574327552-11806-1-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191121_011330_255062_284E56A3 
X-CRM114-Status: UNSURE (   6.44  )
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
 linux-kernel@vger.kernel.org, Houlong Wei <houlong.wei@mediatek.com>,
 linux-mediatek@lists.infradead.org, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Support gce function on mt6779 platform.
	dt-binding: gce: add gce header file for mt6779
	mailbox: cmdq: variablize address shift in platform
	mailbox: cmdq: support mt6779 gce platform
	arm64: dts: add gce node for mt6779

Refine driver to support stop hardware with safe callback.
	mailbox: mediatek: cmdq: clear task in channel

Inorder to support mt6779 client requirement, add new helper functions to
enable more hardware capability.
	soc: mediatek: cmdq: add assign function
	soc: mediatek: cmdq: add write_s function
	soc: mediatek: cmdq: add read_s function
	soc: mediatek: cmdq: add mem move function
	soc: mediatek: cmdq: add loop function
	soc: mediatek: cmdq: add wait no clear event
	soc: mediatek: cmdq: add set event function



Dennis YC Hsieh (12):
  dt-binding: gce: add gce header file for mt6779
  mailbox: cmdq: variablize address shift in platform
  mailbox: cmdq: support mt6779 gce platform definition
  mailbox: mediatek: cmdq: clear task in channel before shutdown
  arm64: dts: add gce node for mt6779
  soc: mediatek: cmdq: add assign function
  soc: mediatek: cmdq: add write_s function
  soc: mediatek: cmdq: add read_s function
  soc: mediatek: cmdq: add mem move function
  soc: mediatek: cmdq: add loop function
  soc: mediatek: cmdq: add wait no clear event function
  soc: mediatek: cmdq: add set event function

 .../devicetree/bindings/mailbox/mtk-gce.txt   |   8 +-
 arch/arm64/boot/dts/mediatek/mt6779.dtsi      |  10 +
 drivers/mailbox/mtk-cmdq-mailbox.c            |  85 ++++++-
 drivers/soc/mediatek/mtk-cmdq-helper.c        | 182 +++++++++++++-
 include/dt-bindings/gce/mt6779-gce.h          | 222 ++++++++++++++++++
 include/linux/mailbox/mtk-cmdq-mailbox.h      |   7 +
 include/linux/soc/mediatek/mtk-cmdq.h         |  77 ++++++
 7 files changed, 573 insertions(+), 18 deletions(-)
 create mode 100644 include/dt-bindings/gce/mt6779-gce.h
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
