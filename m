Return-Path: <SRS0=1w4W=BI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 993DDC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 07:40:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 682B122B3F
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 07:40:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d6BblC0V";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tenwb6XX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 682B122B3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=582c3QOKqt1RC5l9NPd8DgcUxa/AXN0HWtmEH9C8Ojc=; b=d6BblC0V1i022DKJQDrVuFsbi
	lFoOc7rK0hy+lg9j4eY0PIK8a8+OidyUkDA8xNqYeBCYQZeHjmUyfvxaV69IjEJ/nHXzGxxeWv/Ta
	SqKWAA64erjkwgSV1eFDREpy6KV9MSLf9LTsLakxKgZLOpNo+peArCBiZD7xSnBOQ4P/Cfx4XIaHJ
	qT3/2f8yD0DNbMe8gNssVJYv+vcUKZ7XxhrYZwxE7tmsFPWGTSQuFhoV4G/sD+AFP7/j+6bQWVl+c
	98Sv01ju0R+eb/9+8jas010JgFdMVffOKc0b7NSi7p2R1ZZE0+XZ70gn41tSznFcU6t/wT0Ys8nPX
	/ZdUdyUrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0ggy-0001Pu-00; Wed, 29 Jul 2020 07:40:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0ggp-0001NH-RC; Wed, 29 Jul 2020 07:39:53 +0000
X-UUID: e1944ea9ec0749ac9550d4b676f92a79-20200728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=eB2IJ17uvfo0FspQJXyn1660hDC5oR6MCu06ojCR9Co=; 
 b=tenwb6XXXywbH+ZU6VIkZ50W+yKXUO6OdJi6K2fH0yAuhCyXVfJpeAYuLjs1DHyA1xJhYHuKJIb7osToWZ0H1SO3MMIkNVKFQrwW+3jKXPhIvCrGPJQVYHSjoFiiKnW8IZugZ5w6ewRPEUK7zLqDIZLWOkf3vNgVpclbudHkVo8=;
X-UUID: e1944ea9ec0749ac9550d4b676f92a79-20200728
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 778777536; Tue, 28 Jul 2020 23:39:47 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jul 2020 00:39:47 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jul 2020 15:39:44 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Jul 2020 15:39:45 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: <p.zabel@pengutronix.de>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
Subject: [PATCH 1/2] reset-controller: ti: adjust the reset assert and
 deassert interface
Date: Wed, 29 Jul 2020 15:39:16 +0800
Message-ID: <1596008357-11213-2-git-send-email-crystal.guo@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1596008357-11213-1-git-send-email-crystal.guo@mediatek.com>
References: <1596008357-11213-1-git-send-email-crystal.guo@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_033952_020692_FFCC0AEC 
X-CRM114-Status: GOOD (  15.56  )
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
 seiya.wang@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Crystal Guo <crystal.guo@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add ti_syscon_reset() to integrate assert and deassert together,
and change return value of the reset assert and deassert interface
from regmap_update_bits to regmap_write_bits.

when clear bit is already 1, regmap_update_bits can not write 1 to it again.
Some IC has the feature that, when set bit is 1, the clear bit change
to 1 together. It will truly clear bit to 0 by write 1 to the clear bit

Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
---
 drivers/reset/reset-ti-syscon.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-ti-syscon.c b/drivers/reset/reset-ti-syscon.c
index a2635c2..5a8ec8f 100644
--- a/drivers/reset/reset-ti-syscon.c
+++ b/drivers/reset/reset-ti-syscon.c
@@ -89,7 +89,7 @@ static int ti_syscon_reset_assert(struct reset_controller_dev *rcdev,
 	mask = BIT(control->assert_bit);
 	value = (control->flags & ASSERT_SET) ? mask : 0x0;
 
-	return regmap_update_bits(data->regmap, control->assert_offset, mask, value);
+	return regmap_write_bits(data->regmap, control->assert_offset, mask, value);
 }
 
 /**
@@ -120,7 +120,7 @@ static int ti_syscon_reset_deassert(struct reset_controller_dev *rcdev,
 	mask = BIT(control->deassert_bit);
 	value = (control->flags & DEASSERT_SET) ? mask : 0x0;
 
-	return regmap_update_bits(data->regmap, control->deassert_offset, mask, value);
+	return regmap_write_bits(data->regmap, control->deassert_offset, mask, value);
 }
 
 /**
@@ -158,10 +158,19 @@ static int ti_syscon_reset_status(struct reset_controller_dev *rcdev,
 		!(control->flags & STATUS_SET);
 }
 
+static int ti_syscon_reset(struct reset_controller_dev *rcdev,
+			   unsigned long id)
+{
+	ti_syscon_reset_assert(rcdev, id);
+
+	return ti_syscon_reset_deassert(rcdev, id);
+}
+
 static const struct reset_control_ops ti_syscon_reset_ops = {
 	.assert		= ti_syscon_reset_assert,
 	.deassert	= ti_syscon_reset_deassert,
 	.status		= ti_syscon_reset_status,
+	.reset		= ti_syscon_reset,
 };
 
 static int ti_syscon_reset_probe(struct platform_device *pdev)
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
