Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A6CC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 10:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KI4LF+Ptx/cyjiFraEl6pLFTBUuMayDsOaHhlxSX18A=; b=QHpz7WIEmRMpmI
	kSBzDSokkxVUVMlgI3d8EQgVznqV6lZaEbdUIbu397u7tYdoN0OTCQ3jXNuoG4FSSuc2cWTJWtE4P
	rPCLDosLHMLEr6HQasd7hD6IYEjgiOrg+DvrZNHio50cbtap+wMGDMPqlEZ6+cp3SbflAiNEDNWs0
	aNTl2CD7Fg6yHLXbO0rGWOvfy7R8sU8Mg91rTiSuCQl85utnPWzh8amm4iYC8cn3ytyxHGiM+sLGL
	agxKznAbrD4gbhuDiHubr2T7tEKVssqkhTFkeB/UMlGUQoSnuNhlEykYykWxLBDaKV4LhRsBpwbL3
	VWMsfT0YwjlqUdIcBYRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRWui-003n47-9T; Tue, 08 Mar 2022 10:17:56 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRWnA-003k3F-5k
 for linux-mediatek@lists.infradead.org; Tue, 08 Mar 2022 10:10:10 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 fs4-20020a17090af28400b001bf5624c0aaso1998809pjb.0
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Mar 2022 02:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5/KGSiDUR6Oh1qS3ls1eTa+dOJRLWEHzu5UF9HK4Si4=;
 b=eDoPTw7FlfuMrMk7TZW4fd7c4dDPzW6nXHDmrXSbtsRK6vVG9dhIQ6WrXKOKLXV7aq
 pz9p+6TzCc1cAGkq3MxA4HyZXLYlRrprzCIS02q3HivJhzYBshHAXuBmUwnDRmScWVih
 7AG4tW3YbthMaljSEsRgDx70cRXDSte2hvmI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5/KGSiDUR6Oh1qS3ls1eTa+dOJRLWEHzu5UF9HK4Si4=;
 b=Y98QoEj8l6euzlSEVrtp++8wuXSqyeXM6x1g7yxXFfo43UDwTXO9XhVm0rH6f8MB5y
 TDnw+IoXHbQbB3FGlGi4W80VfIy7Sj5x1x2PIZccpwAJ0EQ5Tr3vENCAmRydo8C41cDz
 Y9ZhN7JvF59HjecLwp/01TCXyGoCMDwyL10h4FpktYVBi42WS9Q/vCngNsTXb4TThm7T
 v4JcFz9y/yzOX81ME7bfxp44dE2Ks+VqBbZ7VchYzH4eHwB5OWU/u0XpzdV/LshW62mC
 lmMs6eOsmz50vTQ9+v6x86t8VeHicQNa3n5UmehPVJdRiWfOkF7MctT0lpl5nqDBR7aB
 WP7w==
X-Gm-Message-State: AOAM5333FxFdfQixApJuPNxZHQ9ddKC4KHbnfnLB9YOx2b+SnbrvRm87
 DrQArZ46yyKx7OrkBfowo7w7kZ49E71EJg==
X-Google-Smtp-Source: ABdhPJxDGvhKYqfJXVj5tcUF1DdM4k4BYagm/EBulkoRUtJ1T6TWbFFUrKL/Ekqds5KSkBCbsoWkLw==
X-Received: by 2002:a17:90a:4289:b0:1bc:275b:8986 with SMTP id
 p9-20020a17090a428900b001bc275b8986mr3758766pjg.153.1646734207017; 
 Tue, 08 Mar 2022 02:10:07 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:73f8:5e3f:6894:8f44])
 by smtp.gmail.com with ESMTPSA id
 k19-20020a056a00135300b004f734327960sm1707553pfu.106.2022.03.08.02.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 02:10:06 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 01/11] pinctrl: pinconf-generic: Print arguments for
 bias-pull-*
Date: Tue,  8 Mar 2022 18:09:46 +0800
Message-Id: <20220308100956.2750295-2-wenst@chromium.org>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
In-Reply-To: <20220308100956.2750295-1-wenst@chromium.org>
References: <20220308100956.2750295-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_021008_255319_ABCCDFD4 
X-CRM114-Status: GOOD (  10.92  )
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

The bias-pull-* properties, or PIN_CONFIG_BIAS_PULL_* pin config
parameters, accept optional arguments in ohms denoting the strength of
the pin bias.

Print these values out in debugfs as well.

Fixes: eec450713e5c ("pinctrl: pinconf-generic: Add flag to print arguments")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pinctrl/pinconf-generic.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index f8edcc88ac01..415d1df8f46a 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -30,10 +30,10 @@ static const struct pin_config_item conf_items[] = {
 	PCONFDUMP(PIN_CONFIG_BIAS_BUS_HOLD, "input bias bus hold", NULL, false),
 	PCONFDUMP(PIN_CONFIG_BIAS_DISABLE, "input bias disabled", NULL, false),
 	PCONFDUMP(PIN_CONFIG_BIAS_HIGH_IMPEDANCE, "input bias high impedance", NULL, false),
-	PCONFDUMP(PIN_CONFIG_BIAS_PULL_DOWN, "input bias pull down", NULL, false),
+	PCONFDUMP(PIN_CONFIG_BIAS_PULL_DOWN, "input bias pull down", "ohms", true),
 	PCONFDUMP(PIN_CONFIG_BIAS_PULL_PIN_DEFAULT,
-				"input bias pull to pin specific state", NULL, false),
-	PCONFDUMP(PIN_CONFIG_BIAS_PULL_UP, "input bias pull up", NULL, false),
+				"input bias pull to pin specific state", "ohms", true),
+	PCONFDUMP(PIN_CONFIG_BIAS_PULL_UP, "input bias pull up", "ohms", true),
 	PCONFDUMP(PIN_CONFIG_DRIVE_OPEN_DRAIN, "output drive open drain", NULL, false),
 	PCONFDUMP(PIN_CONFIG_DRIVE_OPEN_SOURCE, "output drive open source", NULL, false),
 	PCONFDUMP(PIN_CONFIG_DRIVE_PUSH_PULL, "output drive push pull", NULL, false),
-- 
2.35.1.616.g0bdcbb4464-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
