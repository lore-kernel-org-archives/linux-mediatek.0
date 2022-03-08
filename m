Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E601C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 10:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CUamSlpFN1Ha/P7y/oIaDtSsyGjYrVYYeT6aCUtHOPw=; b=WCdpqXz+AGZYT0
	2V3tv2P6cA2/cho2C+Tq1RqihAYQfhoxu11iYlR/qL46j+fJ9CIZwpvJRWJhq5BMee26m9Zjqw2Qv
	mTZvE61IWmo2ed86TxMEMICgiVlbJeFxGRIBH/ZEekf7RKNeRIQun9VwUfCjyyYUxvjTYAPuqD/oQ
	OS37NLHcjsie5pXcarwR/IK66lQXyoTzID+K94vxwM3Bbv97N86k37mkaDwDPsdjZeB918rMrWd0e
	vEbBzU6tsPdWRTwrHfnDXUHPa0ZFLsU5j2F56BitvspVHV/gfz5fTarbjuk0klXNrPf74FDXHk1uI
	HPV+1hPsC8AhoQOgnWpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRWyb-003oqV-Ej; Tue, 08 Mar 2022 10:21:57 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRWnK-003k9E-Ad
 for linux-mediatek@lists.infradead.org; Tue, 08 Mar 2022 10:10:20 +0000
Received: by mail-pj1-x1035.google.com with SMTP id k92so7588886pjh.5
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Mar 2022 02:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YCEYLzINbSJ27Mxc1gQH0RSj42l80KVWvId+vHnO050=;
 b=VFlI3NcvOJtijZK9dnSyiiARFam7LJ8qmOTLKNc6BwqUaKaUlKU4+8f3icJASzdiix
 OthB+gk44a6lieASchFK+lLJcJ+pUaxnkcomxmj4/ef/plXlIWS42RAYtXU1/9+aRBkL
 h4lX3waAzusF3Hgh0IGsk99Q5//h4ggK0BCFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YCEYLzINbSJ27Mxc1gQH0RSj42l80KVWvId+vHnO050=;
 b=qkAJm9laQL4oyV4Afea3eAZtWHCvUD5j2SSAG4ggHfOi/fzLrSAGE7czeOWubihdGt
 PceAz0pFRnh/UUvLt/OBsgzmHqEQN24ne4dzklzCikbi1+tlH//2wzGSRAS+R7bpHf4d
 vlDGriOXy0c5c9uDmaMU9sNez7YdwN9rWmSxYOIMsXwuTyIzJ7o+UVXal/QejJKioUmG
 ugIahINgAS8NFY0bCgfsmF1kvZEK//19yLrLWpP+3T3AT6kvueLG5BuOW00tTxPXbrZN
 K7J6tmptJeNDmFu2S5Yyop9Ubbv5H7wmSX1BXNGl7JlwhGe1ZaqZyyKolomxVbSe1Pjq
 c1HQ==
X-Gm-Message-State: AOAM530vJgNvFLfYsqEemdxq0WtjKzTl71vLge4U815ZDf+4tKBfi4py
 f0NVWAXEXiOmWsadJrwsMg971w==
X-Google-Smtp-Source: ABdhPJxvlMwg053TxzUU1yh1e9ywYI4FTa148KhAT6lQrsDtI61chzmA/3TvSGQDlNZ1lmoCT8ZRig==
X-Received: by 2002:a17:902:ef4d:b0:14f:e82b:25fd with SMTP id
 e13-20020a170902ef4d00b0014fe82b25fdmr16531295plx.80.1646734216854; 
 Tue, 08 Mar 2022 02:10:16 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:73f8:5e3f:6894:8f44])
 by smtp.gmail.com with ESMTPSA id
 k19-20020a056a00135300b004f734327960sm1707553pfu.106.2022.03.08.02.10.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 02:10:16 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 06/11] pinctrl: mediatek: paris: Skip custom extra pin
 config dump for virtual GPIOs
Date: Tue,  8 Mar 2022 18:09:51 +0800
Message-Id: <20220308100956.2750295-7-wenst@chromium.org>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
In-Reply-To: <20220308100956.2750295-1-wenst@chromium.org>
References: <20220308100956.2750295-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_021018_437080_753FF409 
X-CRM114-Status: GOOD (  10.57  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 38a00a906daf..39487e0c2726 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -581,6 +581,9 @@ ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
 	if (gpio >= hw->soc->npins)
 		return -EINVAL;
 
+	if (mtk_is_virt_gpio(hw, gpio))
+		return -EINVAL;
+
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
 	pinmux = mtk_pctrl_get_pinmux(hw, gpio);
 	if (pinmux >= hw->soc->nfuncs)
-- 
2.35.1.616.g0bdcbb4464-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
