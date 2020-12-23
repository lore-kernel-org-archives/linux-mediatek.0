Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A653AC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 08:45:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DC1220674
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 08:45:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DC1220674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KViAi4G5ZxQgqfaeF3duQ2ers5ToNY5N949l2Ea6Z7w=; b=NKCdjycWSH6uh8JAhqmGJgryp
	+BFk3wIhSdBSvOiTsGnRNkeopzV3itZZOrVjpIu4XrXDkTXIFUIdnIZmc5m10XKfgQHBwN11Of+WI
	2EaK1OO8w4SVewt3YsWcBM0eXrRARim7y5yH91ntmSkb76OAFy2Ih+M6ujM5ZZFlg23FvJ0DjElYX
	gKmsmA1nen+Kj8BJFoTOd+ecJoMM4L5BjGSZJUwTtaEfqZK24N94lZ2u2U3WcQ86brYnzZwxBT+J0
	bK3gGvQK9uAYFRj3i8TRbotsfc5MGcEJKKYTPH2tB0rR5rTmsarXUWc48m2Nsm93sseHOaSefgCTz
	qXL7nS+XQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krzm9-0007kR-82; Wed, 23 Dec 2020 08:45:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krzlg-0007YQ-CV; Wed, 23 Dec 2020 08:45:13 +0000
X-UUID: 2e8bc8d798bc4675976187282c939a37-20201223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=fjWGgS+2AF1kFLAtywy0jVIrBB1/AyU1nyrTcL6FAi4=; 
 b=dTzi2bwjNxUY17zLHg6AU7st2wEVc14LV2Z7genlv+I4KsuPiIexy9gcJjLR/0wdOXMq7lze+ExMHZc6UZ7ZyV8xV6cJg3QFBsjLDTM5tnSwVxfNEr54XUaDOs2JzXRHjdeRDQQhOvRRF6YtjaDJ5oFW2A3ieTnnUjUZXu/8qR8=;
X-UUID: 2e8bc8d798bc4675976187282c939a37-20201223
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1812085843; Wed, 23 Dec 2020 00:45:05 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Dec 2020 00:45:01 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Dec 2020 16:44:58 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 23 Dec 2020 16:44:59 +0800
From: Neal Liu <neal.liu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>
Subject: [PATCH v1 2/2] arm64: configs: Support DEVAPC on MediaTek platforms
Date: Wed, 23 Dec 2020 16:44:52 +0800
Message-ID: <1608713092-26952-3-git-send-email-neal.liu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1608713092-26952-1-git-send-email-neal.liu@mediatek.com>
References: <1608713092-26952-1-git-send-email-neal.liu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: B3CE75607B5BE7C66F125DCA8B8924F0596D453F48C50A29BFD93D2914F3AF312000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_034512_605639_759A2B17 
X-CRM114-Status: GOOD (  10.08  )
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
 Hanks Chen <Hanks.Chen@mediatek.com>, lkml <linux-kernel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Neal Liu <neal.liu@mediatek.com>,
 Jackson-kt Chang <Jackson-kt.Chang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Support DEVAPC on MediaTek platforms by enabling CONFIG_MTK_DEVAPC.

Signed-off-by: Neal Liu <neal.liu@mediatek.com>
---
 arch/arm64/configs/defconfig |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 17a2df6..a373776 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -257,6 +257,7 @@ CONFIG_MTD_NAND_MARVELL=y
 CONFIG_MTD_NAND_FSL_IFC=y
 CONFIG_MTD_NAND_QCOM=y
 CONFIG_MTD_SPI_NOR=y
+CONFIG_MTK_DEVAPC=m
 CONFIG_SPI_CADENCE_QUADSPI=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_NBD=m
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
