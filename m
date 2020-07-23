Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D81C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 08:43:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 732C12080D
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 08:43:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="elH3YdHw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WaaUETI7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 732C12080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UPOUnSKIPxfeYjkIJh0j5ZCWL/UuGxIFlKZ2k+y2oTQ=; b=elH3YdHwkSAMpKXKQ54+E21CSD
	JhslecrNYjV+tpCtCPvNCbzZ7nWd+PEcfclTIonY/GOgilud9+juf+hAJnLq/1ri7ME7J+9xDxI8d
	D7ezo8waOyuMrXbLNrIKNRefpzRxYrtNioTcYIhecSjZrq13M57g2BxwwnCsiiHSwxRb/G2H60Z66
	TZA7Xn7GWBNLs9NQpDbFMXnlcx9gtqTuVcudh7fLBGuH5hES/EvZT+xuu7WAkNleRpWOul6w1C7/P
	V7wwRkcTIJZR0yJPXmkv888INhgk3P7dSLiJUrKkg55yj5cX+dc+1XfT17nvPJUB7sF3P6DmCsU8c
	8nTpwREA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyWoZ-0005pl-F8; Thu, 23 Jul 2020 08:42:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyWoW-0005ou-1u; Thu, 23 Jul 2020 08:42:53 +0000
X-UUID: 9565cba6acc14cb6aed926b3cdc6a4f6-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=FvbPiqMUKPIekt5igyb/5p25Qo6j9u44sXtE5an3ghM=; 
 b=WaaUETI7QDYF4sk8AOHMwoOhqN6ZCckoe+O4KCftjkVJOlobOVTkQzrEKphTGrnNuXYnert/Cldqne6lwjPRROi2/KPFmFKqmD1THtiO+bieU8kXUALWpiruz8cUgh72n0CCviwlmOXgY2SJ03mrUgO/xHEJsVMSm47uKjjPbg8=;
X-UUID: 9565cba6acc14cb6aed926b3cdc6a4f6-20200723
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <wendell.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1128473647; Thu, 23 Jul 2020 00:42:46 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 01:32:45 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 16:32:37 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 23 Jul 2020 16:32:37 +0800
From: Wendell Lin <wendell.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH 1/1] clk: Export clk_register_composite
Date: Thu, 23 Jul 2020 16:32:06 +0800
Message-ID: <1595493126-21611-1-git-send-email-wendell.lin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_044252_302300_E03DB6C6 
X-CRM114-Status: GOOD (  10.73  )
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
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Wendell Lin <wendell.lin@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

clk_register_composite() will be used in mediatek's
clock kernel module, so export it to GPL modules.

Signed-off-by: Wendell Lin <wendell.lin@mediatek.com>
---
 drivers/clk/clk-composite.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
index 7376f57..7c609c2 100644
--- a/drivers/clk/clk-composite.c
+++ b/drivers/clk/clk-composite.c
@@ -360,6 +360,7 @@ struct clk *clk_register_composite(struct device *dev, const char *name,
 		return ERR_CAST(hw);
 	return hw->clk;
 }
+EXPORT_SYMBOL_GPL(clk_register_composite);
 
 struct clk *clk_register_composite_pdata(struct device *dev, const char *name,
 			const struct clk_parent_data *parent_data,
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
