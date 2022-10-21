Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F4FC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 08:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8M+2HNwl7XWGItcQCTiwBk4Uc5IZqpHpGl3TOzAlGns=; b=cfVEZ0JsveLOXD2qhVo82FfSCl
	gqUEbKUrUQ469HzMUSv3JwDfPYSl5+bbDci748hsvA5Okur/j91KLOTPz6HwRLJBIKJCz+EHmrzyr
	ne/7lDxFzW0snlW3oAxbJGYW1Y0MRdHdvsV9DD07vMhPdVcSt49qO4zG2iP/f7a563g991Wu2GWsi
	aa3khZoTmvBOnbYSuNefg6rcPySnZjaWbuKnQzcd5cxwUulYMTB49HTeTTw/Bj6osbizddzf7sYE0
	U95Og50iXLkPjQhFZmN2m/I+SfOpU7ZI4i8k0QhbyI+uHa1PZy0ZPglyMXAz7qavTHuIvv+7nrMh2
	0TaIOG4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olnhg-006VbP-Ip; Fri, 21 Oct 2022 08:48:32 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olnhA-006VKX-9J
	for linux-mediatek@lists.infradead.org; Fri, 21 Oct 2022 08:48:04 +0000
Received: by mail-wm1-x32c.google.com with SMTP id r8-20020a1c4408000000b003c47d5fd475so4508800wma.3
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Oct 2022 01:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8M+2HNwl7XWGItcQCTiwBk4Uc5IZqpHpGl3TOzAlGns=;
        b=c6b8NGePdJZgI5zUn5CGAcV7JSaPVOUZ5eGZIO32zysb2gg4Gq2jYEA4/0zJAIq/xA
         caON2UGCcujNP4oVN/7GnoNUHxfLnjYiTUANOrfbRL32OvhjvV9Hz059fZbvMvnkAfe4
         pIUCjwBUyhGknBLtKXXK+UhsiwA3bBXkei0uw+y1x1n+8wex2FimMYlStj0HVgwf0qHP
         Y7h/DbhbmJtIJMbEHSrnEX82UnoRRvRQGpkycEcodeuCM7W8RGt/t2AsiZaUVckaBwKf
         pMjzNNjvALGEea705fgPe1uqEFAfYcPgWW9QqvNTEaPdqdZUHNCbvNiumPs00tsfma3j
         LuxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8M+2HNwl7XWGItcQCTiwBk4Uc5IZqpHpGl3TOzAlGns=;
        b=dUPdWQXGZOhU8SfjJtByHU0I4aNvPNGcKCccBHtTJ/hqi1oqgjxkTQPv015M2gqCLd
         1JSK5mZrJ6S+z7DXGooeFUd+kMLggVqEq8j23weR5d0RmKqW+t2fotKBrN8rZUSp/Wp/
         j1lEATllUsxXcQihN9GgIywSFW6lpLgWvVFVc0Vj7y/RFq9KulyC0tMTwkUHoDUHOiqf
         1OdbTxvVhHw4FPTHNA10FgHHe1wRKFpxWFMWTEJsfYEZzLgtZkQGVAtFQyU5+qDxhaeh
         MA9t9RvviSQN+GVnsuDYsqTy1Md2BaxOeQ52mIvZQIh90cZWFZiLLE/2v7+ct3Otep2o
         lM3Q==
X-Gm-Message-State: ACrzQf0xf3trR4eVcpBaECMf9U7d9xIE88Qxvda1NK0UN1pqgINui8nm
	t//UtnPdzcJeCQ8En+EI/yzjCg==
X-Google-Smtp-Source: AMsMyM4HSa3Zf2uqrt5mLvlsW1iSF834rjWiLDz0FCPhMsK555F9yMiVW5PDWzaMbU/lTMgeMLnvsg==
X-Received: by 2002:a1c:f20e:0:b0:3c2:5062:4017 with SMTP id s14-20020a1cf20e000000b003c250624017mr32194144wmc.175.1666342076033;
        Fri, 21 Oct 2022 01:47:56 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-657-1-248-155.w90-24.abo.wanadoo.fr. [90.24.137.155])
        by smtp.gmail.com with ESMTPSA id k5-20020a05600c0b4500b003c41144b3cfsm2040233wmr.20.2022.10.21.01.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 01:47:55 -0700 (PDT)
From: bchihi@baylibre.com
To: sean.wang@kernel.org,
	linus.walleij@linaro.org,
	matthias.bgg@gmail.com
Cc: linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [v2, 0/2] Fix broken SET/CLR mode of a certain number of pins for MediaTek MT8385 SoC
Date: Fri, 21 Oct 2022 10:47:06 +0200
Message-Id: <20221021084708.1109986-1-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_014800_362786_4FA44FD1 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Balsam CHIHI <bchihi@baylibre.com>

On MT8365, the SET/CLR of the mode is broken and some pins won't set or clear the modes correctly.
To fix this issue, we add a specific callback mt8365_set_clr_mode() for this specific SoC.
This callback uses the main R/W register to read/update/write the modes instead of using the SET/CLR register.

This is the original patch series proposed by Fabien Parent <fparent@baylibre.com>.
"https://lore.kernel.org/linux-arm-kernel/20220530123425.689459-1-fparent@baylibre.com/"

Changelog:
Changes in v2 :
        - Rebase on top of 6.1.0-rc1-next-20221020
        - Delete MTK_PINCTRL_MODE_SET_CLR_BROKEN quirk
        - Add mt8365_set_clr_mode() callback

Changes in v1 :
        - "https://lore.kernel.org/linux-arm-kernel/20220530123425.689459-1-fparent@baylibre.com/"

Balsam CHIHI (2):
  pinctrl: mediatek: common: add mt8365_set_clr_mode() callback for
    broken SET/CLR modes
  pinctrl: mediatek: mt8365: use mt8365_set_clr_mode() callback

 drivers/pinctrl/mediatek/pinctrl-mt8365.c     | 18 ++++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 15 +++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common.h |  8 +++++++-
 3 files changed, 40 insertions(+), 1 deletion(-)

-- 
2.34.1


