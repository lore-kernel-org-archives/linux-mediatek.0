Return-Path: <SRS0=SpBb=PH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E68A9C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 01:39:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2AFC61057
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 01:39:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B2AFC61057
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vzFFHp2mkXBTRJjcNViVG79mBnnFEaDL7/xune+QCGM=; b=Msbazo97vd/mBF
	aU6mwt95Qo8bRagqKwLIH/80dbYOtY6AM+fevS8IFDZWTEmjM9P8q69qFvOODNv+ktL9Uguj9IDok
	pz50igiM0BVst1O3l/Ww80eULvri0Gzh53eiKiB4ghqv4Clo8NnN1Rg3FEeElkWeZ3BZCSsXm2bMh
	4a1mcY4yfPmfAghGJgdCjudxMSzAk03heFinw7XuVt5DlGJ7d9caIixeaV2ToaGmscOXXpiW8UdmH
	fr9lKfGqt46lhi7nuKn8IIDsGZqmYn1k4szhj/4+T6rLGxeW9MmIdRwoLp8/isF2j5EI91+6zVhvC
	nMuyk7IbNasvecLeRjiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mce5g-00HWpp-Jm; Tue, 19 Oct 2021 01:38:56 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mce5U-00HWoa-Ff; Tue, 19 Oct 2021 01:38:45 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 qe4-20020a17090b4f8400b0019f663cfcd1so797242pjb.1; 
 Mon, 18 Oct 2021 18:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CaPcF3lLntgPi4dtmIgmORhsMIR+dCPTrmx/7W3scZs=;
 b=gaS9hJyuilcF5+JKjLFe8um9uxdmcEPQEj276Rpl1z99TTJ1xSi3qSdkS7u9WdEN2G
 /69cd2OVP1xQNkDgmiVmHkNvLM9poNJnhRnoRNxIMAmDs89Mu2GYws8oagVjNC50QMA9
 1AMbuT3AhQDHg/le8tD9rKMLJIoIc9XRIHuLPN02A4L7Jgyo95aGZ24UoAcfZXBIuhR+
 rnIj4/b3R5xvZ6tCuNgNOljEmhcMABeB2urGNFCGFgdSRFDbp4py4AcYuBx+CXm1PF8/
 8M6Purtsg2PM9tVSHYWqq3dexwNwrgzXqDayW6ljPltxrAqjBrx6y9A7WN8/IDTJ75q3
 Bp0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CaPcF3lLntgPi4dtmIgmORhsMIR+dCPTrmx/7W3scZs=;
 b=tikDYZvsJXHtvKyX/aXBbLe0f706Zi294oRgJQLNstAnRA7bhsdkxkMpqAgsf4RvO+
 /w+T1815vwXVGBlZtCsBxJPV34VULZgA+x872rlfHHvY7LUWrD5tOYiB8ck4iOqQYu7Y
 NXgw29gzVlvn9odhG15PodNS9XgB0Mi9wVG7Kgl3Zwdm93funLg9pNrtWt83Peng1DYK
 EOR9mX/3TQ1CaOKXa/zpK3PSdjAw28yqGBuOGBsbt/gCnHxYXDxC4NRqw2ndkpvocLib
 cuJuc1yXyDu4tX6VPd8ZIHQq/72ul3d43tMRC8FdACR1BmwtYJG/HuHZxq8vVgAzjZDu
 VVzw==
X-Gm-Message-State: AOAM532VX5ZGPlvurwDlfTT8TCuVrZimfMPTPSmckaThca6Xg8aCQTgf
 Gol88QnhZI2PtSW4yCLJKrJqg+ULTik=
X-Google-Smtp-Source: ABdhPJyHCs6f10hqJrvEiziHyRg9yorV3VFk0caNl/+VA1adXRXrroKqi1IQvEWZJyezciCO42MWgQ==
X-Received: by 2002:a17:902:70cb:b0:13e:91f3:641a with SMTP id
 l11-20020a17090270cb00b0013e91f3641amr30226304plt.13.1634607523184; 
 Mon, 18 Oct 2021 18:38:43 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id t3sm13660314pgu.87.2021.10.18.18.38.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 18:38:42 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ran.jianping@zte.com.cn
To: mturquette@baylibre.com
Cc: sboyd@kernel.org, matthias.bgg@gmail.com, chun-jie.chen@mediatek.com,
 ran.jianping@zte.com.cn, wenst@chromium.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH clk:mediatek] clk:mediatek: remove duplicate include in
 clk-mt8195-imp_iic_wrap.c
Date: Tue, 19 Oct 2021 01:37:59 +0000
Message-Id: <20211019013759.970600-1-ran.jianping@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_183844_582010_E45128C2 
X-CRM114-Status: GOOD (  11.01  )
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

From: Ran Jianping <ran.jianping@zte.com.cn>

'dt-bindings/clock/mt8195-clk.h' included in
'/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c' is duplicated.It is
also included on the 13 line.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Ran Jianping <ran.jianping@zte.com.cn>
---
 drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c b/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c
index 0e2ac0a30aa0..1aa5afc05929 100644
--- a/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c
+++ b/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c
@@ -10,7 +10,7 @@
 #include <linux/clk-provider.h>
 #include <linux/platform_device.h>
 
-#include <dt-bindings/clock/mt8195-clk.h>
+
 
 static const struct mtk_gate_regs imp_iic_wrap_cg_regs = {
 	.set_ofs = 0xe08,
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
