Return-Path: <SRS0=lmF9=MN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65684C07E9B
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Jul 2021 02:43:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 291E46121F
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Jul 2021 02:43:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 291E46121F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nhfhp1eb2ctuNiNDJtR01c8PiVvguYJPL+sET7i3QBc=; b=WfHHX8eu7NFo6D
	UhylpAnBI9aRjA5vb7o0ZctGUOP0BnVZEDxkO11O2P3taueWSxiM51cayDtGqbyvFWCeoSAHUTl8t
	4eJC1xcJuKVplvp9iH2IqsSt31vclEvQ6P+CEaFZoJS1DhJ7AslcPsimXTAABwbGMQcQtTRPij8qc
	DaBRUUuQ8wf34fPk0uvDB3E2ARse5qj5dTBzx8EtdnKFcgMvXUkUjP3p+BVTIfnQxfy60gxSa2Adr
	SV9RfGBGco9OjN/dlr9XKryczwrEUmye8FJrPwTvKY4LWc4X/tJ4NHYUDIQ9qbRYyXmWufbgGP0dr
	F/uJm06Pk8cGEyH7ta8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m62Cn-00EKK4-GX; Wed, 21 Jul 2021 02:43:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m62Ca-00EKIh-I0; Wed, 21 Jul 2021 02:43:17 +0000
X-UUID: 42a0e700e1794ca49a4fc99fe80302de-20210720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ey8cJk5ISuGc+g3NenQXgcyYJsjp0WhBllLkNYonH2I=; 
 b=QQ3WnJMf+lWMt6ZoEN6HF6svU8oFXHBhA1F2S5QJ5td94AR6Qgg1ZG7e99CdJ+c0ctwQQO5byNyf9UhtRZfCEqN7OkdquS2JrNMZ9JfRoR7K+qFeYNgxuME39jX4x311SDIB08I/h28DfSP6gPvzJKayCGT1vLb0aqX+U3unD5c=;
X-UUID: 42a0e700e1794ca49a4fc99fe80302de-20210720
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 455825476; Tue, 20 Jul 2021 19:43:13 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 20 Jul 2021 19:34:44 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 21 Jul 2021 10:34:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 21 Jul 2021 10:34:42 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jassi Brar
 <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <hsinyi@google.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>
Subject: [PATCH v4 4/5] mailbox: cmdq: add mediatek mailbox support for mt8195
Date: Wed, 21 Jul 2021 10:34:39 +0800
Message-ID: <20210721023440.29630-5-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210721023440.29630-1-jason-jh.lin@mediatek.com>
References: <20210721023440.29630-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_194316_642295_C2E3AF70 
X-CRM114-Status: GOOD (  10.56  )
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

Add mt8195 compatible name in the driver data of cmdq mailbox driver.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 5665b6ea8119..fc67888a677c 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -606,6 +606,7 @@ static const struct of_device_id cmdq_of_ids[] = {
 	{.compatible = "mediatek,mt8173-gce", .data = (void *)&gce_plat_v2},
 	{.compatible = "mediatek,mt8183-gce", .data = (void *)&gce_plat_v3},
 	{.compatible = "mediatek,mt6779-gce", .data = (void *)&gce_plat_v4},
+	{.compatible = "mediatek,mt8195-gce", .data = (void *)&gce_plat_v4},
 	{}
 };
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
