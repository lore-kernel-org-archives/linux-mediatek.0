Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7747C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 11:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nlb+nlwXJYnwXMseiknTuDyM0GtuPUN7aC3h6suwFJQ=; b=nb/tQluFp//4Bz
	SB7k8/u9GHRZA5blBbsXXIZ3wdXBPsAh8hOzpUZ0W30EdSas8RJPQi25qwUhdaJO8mSqHv7pbiX5y
	Cbl2WCFSqJSqxYQcd9w3es9NIKr5rZus6e3LW3HblBYB0YyOPfCuP6V0ATH0jrITukdGXMTUgF/o/
	pB3UYrYblgo4j/Aq68PZxDpnRDB11gCAwQQPd72KlS+Ohvuy0Bsjs6NdAg9xR3LUX3nHGfgKH0mEs
	8+jpEvhXbiODTFM4BeGcqdjMBaHP3qloY/jUss6pk3a4MRxalTFeEDh5NWi2EEAu6kh9l2pqHGOlo
	cR9Pva8hhtGueLE/IVfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7FGR-00G0yB-PW; Tue, 11 Jan 2022 11:24:31 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7FF1-00G0FC-Vd
 for linux-mediatek@lists.infradead.org; Tue, 11 Jan 2022 11:23:05 +0000
Received: by mail-pj1-x102f.google.com with SMTP id o3so6401369pjs.1
 for <linux-mediatek@lists.infradead.org>; Tue, 11 Jan 2022 03:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XJMwdxQLK+Yc5aZgEkEqO4a/X5AXx9F4PfWhov8Hxs8=;
 b=bEhZlvmkQ32PtcvKm5aAqYIL6LQ9DPmV5HnMEm5KaCHP09pskGIZ4Kvr0nb6z6FMHf
 cHIEn4cz5BsFmf0iYpCnBNZDrE/Jx8xEoSHjtdpuQpB9sNxUZBUPx0x1uPiAH2SSvrJy
 q3WDPxuNcQ/0/BSgL/CJzOP2BE/Zvpgmk3hhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XJMwdxQLK+Yc5aZgEkEqO4a/X5AXx9F4PfWhov8Hxs8=;
 b=Cus7Z8zXvYFBOQBK+2fhYoD6CxGHSphzvDYXvsuUmep8NTmYNHVKijBQnl2kYA7bGq
 82lMVN0C52ow+XRMmF0/36o2RCplrCMSR86nISkZNNproqJLBQG5q5aAJwpYymS3pflR
 qX+0Di//r1wHj3zyzV0+uhIPPgvPfOElNBOQ0plwG7NEJvgdU/phQGSI8ClaW1iTALY/
 owyFMzYbtm+QB9NaEzVxUSLYceLHHP7qplpyF64mVGFK/xLribTe7d7OpWFwbX6g2R2Q
 2TZxP2RD4JmPFPz3FMD1zddW/ksfuGuhJVWILeslUAart1m48Xm/zAQf+K7bIEz+D/WS
 xjpg==
X-Gm-Message-State: AOAM5316rvgml7JncuXI5sRI3uGNmXWLZnFIDrDrkdBS48SIzCGwhUUY
 W0k+lCzOtV09ZU9GfpUs5hlLVg==
X-Google-Smtp-Source: ABdhPJwgUUs7J/x2q3ewoDI+20IVqHL13sU6jp2n1RvR1TuH3+R1TaGSPO//aJ658I0TcJ6ZRcLkyw==
X-Received: by 2002:a62:8784:0:b0:4bd:b012:5299 with SMTP id
 i126-20020a628784000000b004bdb0125299mr4049283pfe.37.1641900183579; 
 Tue, 11 Jan 2022 03:23:03 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:e7ee:1824:8575:bc5c])
 by smtp.gmail.com with ESMTPSA id f9sm2053845pjh.18.2022.01.11.03.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 03:23:03 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Guodong Liu <guodong.liu@mediatek.com>
Subject: [PATCH 6/7] pinctrl: mediatek: paris: Skip custom extra pin config
 dump for vrtual GPIOs
Date: Tue, 11 Jan 2022 19:22:43 +0800
Message-Id: <20220111112244.1483783-7-wenst@chromium.org>
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
In-Reply-To: <20220111112244.1483783-1-wenst@chromium.org>
References: <20220111112244.1483783-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_032304_487677_8E82761F 
X-CRM114-Status: GOOD (  10.32  )
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

Virtual GPIOs do not have any hardware state associated with them. Any
attempt to read back hardware state for these pins result in error
codes.

Skip dumping extra pin config information for these virtual GPIOs.

Fixes: 184d8e13f9b1 ("pinctrl: mediatek: Add support for pin configuration dump via debugfs.")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 1bacabfbc183..678c8aa33012 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -585,6 +585,9 @@ ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
 	if (gpio >= hw->soc->npins)
 		return -EINVAL;
 
+	if (mtk_is_virt_gpio(hw, gpio))
+		return -EINVAL;
+
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
 	pinmux = mtk_pctrl_get_pinmux(hw, gpio);
 	if (pinmux >= hw->soc->nfuncs)
-- 
2.34.1.575.g55b058a8bb-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
