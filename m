Return-Path: <SRS0=Kazo=DH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD729C4727C
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 02:22:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33A3B20773
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 02:22:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GQDdCtA9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="lV7AHAk4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33A3B20773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nDhfumHEeXSopVIzw0P6uZFvwHxpAwB5FpNtMpWT0Mc=; b=GQDdCtA9MRpnOfm0WQUDcS5sK
	c3qDQM8u2qcXxqULbbr/xYc91VpXqAHDGCBxs6xuYw/P/5UeIN48hu3Bgl8TIckmCQzrioyZyyfun
	5XfzXOuEpXoRo1ZBogucRU21sh7FBjD3VnQFWBKtx/vkWDC6jPYoaKEAGWjcmLzVY99YadXZWnPf1
	Xr3GutIpjsn6X3ZmzF3UoA9A1X5CGKvbYmR+Y39uQGIyyEEo8TmOW0kIdHGhtwEbGK9zGBP5fGBuW
	0IYlgyo15CBCLBIVaeMgk3UIka/W1+k5O2kul+e0RIktPx5BtBykoArCvlOOT7UuDObKwmPgm/dvD
	fgg4X3Uuw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNRl6-0007TL-Tl; Wed, 30 Sep 2020 02:22:20 +0000
Received: from [216.200.240.185] (helo=mailgw02.mediatek.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNRl2-0007Qx-9l; Wed, 30 Sep 2020 02:22:17 +0000
X-UUID: 720f8f95ce2a47e49c05d785883e4e95-20200929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=/ODE+lHaGlrQfgAiLYh/aPpeTyv6wYIwW1Yqa7xY6kI=; 
 b=lV7AHAk4nVzmE2RzlrakofFDpJ/HeFbk3tHqXQKMBvAI22S4wGgf4h3yCvPY0hKNtAb7YCoq1g/9BOn2GAbF/UlvA85/oompbTCG7jq3Hln1bwu+3GynX2SeegE163KR/MAnzN3b35pOT9n5mYNkjdvoOpyDz6VzeTEc0/ZLH4Y=;
X-UUID: 720f8f95ce2a47e49c05d785883e4e95-20200929
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1156638677; Tue, 29 Sep 2020 18:22:08 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Sep 2020 19:22:06 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Sep 2020 10:22:00 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Sep 2020 10:22:04 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: <p.zabel@pengutronix.de>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
Subject: [v6,
 3/3] reset-controller: ti: force the write operation when assert or
 deassert
Date: Wed, 30 Sep 2020 10:21:59 +0800
Message-ID: <20200930022159.5559-4-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200930022159.5559-1-crystal.guo@mediatek.com>
References: <20200930022159.5559-1-crystal.guo@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: BA75B31640D9C6D0159B7662252A7C2BDC31A2ACBB88105A60464EEC1CA8992A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_222216_484927_080F4024 
X-CRM114-Status: GOOD (  11.51  )
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
Cc: devicetree@vger.kernel.org, yong.liang@mediatek.com,
 stanley.chu@mediatek.com, srv_heupstream@mediatek.com, seiya.wang@mediatek.com,
 linux-kernel@vger.kernel.org, fan.chen@mediatek.com,
 Crystal Guo <crystal.guo@mediatek.com>, linux-mediatek@lists.infradead.org,
 yingjoe.chen@mediatek.com, s-anna@ti.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Force the write operation in case the read already happens
to return the correct value.

Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
---
 drivers/reset/reset-ti-syscon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-ti-syscon.c b/drivers/reset/reset-ti-syscon.c
index 5d1f8306cd4f..c34394f1e9e2 100644
--- a/drivers/reset/reset-ti-syscon.c
+++ b/drivers/reset/reset-ti-syscon.c
@@ -97,7 +97,7 @@ static int ti_syscon_reset_assert(struct reset_controller_dev *rcdev,
 	mask = BIT(control->assert_bit);
 	value = (control->flags & ASSERT_SET) ? mask : 0x0;
 
-	return regmap_update_bits(data->regmap, control->assert_offset, mask, value);
+	return regmap_write_bits(data->regmap, control->assert_offset, mask, value);
 }
 
 /**
@@ -128,7 +128,7 @@ static int ti_syscon_reset_deassert(struct reset_controller_dev *rcdev,
 	mask = BIT(control->deassert_bit);
 	value = (control->flags & DEASSERT_SET) ? mask : 0x0;
 
-	return regmap_update_bits(data->regmap, control->deassert_offset, mask, value);
+	return regmap_write_bits(data->regmap, control->deassert_offset, mask, value);
 }
 
 /**
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
