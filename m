Return-Path: <SRS0=JD7o=KX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E38AC47087
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 09:22:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD6F3610FC
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 09:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD6F3610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FpH6/Dl/8hJDNMWBGdegpHoRZZtVfxbKqsjGBfmSzUY=; b=VXullLXDZCfOHL
	puSOfJzUngF8TS57ERTym4SGic6Ff7E2ZCkPqpAI59toDv6PDAdemZLWPgTqkCc0zl8UTiTth/qHa
	ho79/27UENZ5rn5i8i04+BdsXtozlBVlVdfcXZKodLqZ2xPGqQCsaeaOR/9koVj1CNHBMMf1ptcX5
	8iyzSMlqpaznF2I2jQ4yBNZ+/B4FWjWloZfsya/e4UY8KLoab02bg3OML1TjjyXkYF0VXr1IPtnC6
	64YQ8nM9GxqvauBxbXgmxXGTrcPdaDxM9+iG7Za2ykv1cAvuquiP632t4QBhScPdg6yRLQtzMBmeC
	88De4RPSayrswfp8Cn6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmYgl-00Dp2J-05; Fri, 28 May 2021 09:21:55 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmYgh-00DozS-Fx
 for linux-mediatek@lists.infradead.org; Fri, 28 May 2021 09:21:52 +0000
Received: by mail-lf1-x132.google.com with SMTP id f30so4384228lfj.1
 for <linux-mediatek@lists.infradead.org>; Fri, 28 May 2021 02:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RjwPM80jhf7QqwxBuTnbQa++n8LEjK65ba/1tBbzVfA=;
 b=wu7qxvtd9OJZMNKIdVAeANWw7VckJe0RlTmrWmCd2gVchxil2AMg1WiWdrsjttM6yO
 C2C+iWzGbdVEUTRS55wDUl7i6/zp/Z8IARku9mL8lgjcDRQ+6zp8o9QXM6qId7teZW8c
 rKKF5Ki5nHD96lPmFCUnZw1Yyw3+mVemnVzktDeWnQ5Wddqqm9nizZzAE6yU4seeb71t
 7Q3eCtYK6GlITJWa21EZkOz88WA+DkpjbV2bUvm2uQXQhzCLSLkTXiPifs9W+vAjaXW+
 9qsQBB/OzbPqsqP2Ilmw4hlc+30BHnUYzkueR/rLQeLg76PqE9mJg1HJHRJuZt/Uz0DL
 w15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RjwPM80jhf7QqwxBuTnbQa++n8LEjK65ba/1tBbzVfA=;
 b=alUMhEI/IbSOX5tBwGyMXYt26yi8wisYZ1KE8950RUnnHjy7MlpWntZUcCkf1UVI9e
 GQZ1a0kspyHGlq0maMLJL4m0qHcd+/4JNCPhiEX5mLABJ6dLYw6A1ALMh6ifO5sYQNDI
 BNqnRNnb+HELr4GOvYlBbDkIa9xkq6Z+VTfMePQykEU9a9CAH8blNEpwvkOgOG1AkxrG
 TI5ka+Wt2R3xD3bfTMwQ5EBQ8x92+LHUZokU4OAkSWU9N9sC5cXHZKq9JgTguRXAqhIa
 DV8XrdbKMKIZzi4c0cdP1gZuBGwjYhnW0enHWen1ISpLglGq4X08fJhsrXxfsyXIKgA+
 DfBw==
X-Gm-Message-State: AOAM531oJgC+aUD6GgakEQpKYo0ImIUYGXA5dmD3PC/N5Zkq4wv2n3R9
 4B/FSLq4bvv2QZ6uE6uHkIcCYg==
X-Google-Smtp-Source: ABdhPJw8PFmbP9HkmnrGbK0n1IEf8aMX6vyMKLQ4vHz2OgKqo+BvjIekuj64H9miMsvB38FKIjwU0Q==
X-Received: by 2002:ac2:43d9:: with SMTP id u25mr5322114lfl.54.1622193709676; 
 Fri, 28 May 2021 02:21:49 -0700 (PDT)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id m5sm498649ljg.118.2021.05.28.02.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 02:21:49 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Fabien Parent <fparent@baylibre.com>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 linux-mediatek@lists.infradead.org, kernel test robot <lkp@intel.com>
Subject: [PATCH] pinctrl: mediatek: move bit assignment
Date: Fri, 28 May 2021 11:19:45 +0200
Message-Id: <20210528091945.411471-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_022151_560285_5DCB375C 
X-CRM114-Status: GOOD (  12.07  )
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

The bit needs offset to be defined which happens some lines
below. Looks like a bug. The kernel test robot complains:

drivers/pinctrl/mediatek/pinctrl-mtk-common.c:137:12:
warning: variable 'offset' is uninitialized when used here [-Wuninitialized]
           bit = BIT(offset & pctl->devdata->mode_mask);
                     ^~~~~~

Fix it up by reverting to what was done before.

Cc: Fabien Parent <fparent@baylibre.com>
Cc: Sean Wang <sean.wang@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: linux-mediatek@lists.infradead.org
Fixes: 9f940d8ecf92 ("pinctrl: mediatek: don't hardcode mode encoding in common code")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 9fe91e11a877..525b1aa7f7a6 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -134,7 +134,7 @@ static int mtk_pconf_set_ies_smt(struct mtk_pinctrl *pctl, unsigned pin,
 			pin, pctl->devdata->port_align, value, arg);
 	}
 
-	bit = BIT(offset & pctl->devdata->mode_mask);
+	bit = BIT(pin & 0xf);
 
 	if (arg == PIN_CONFIG_INPUT_ENABLE)
 		offset = pctl->devdata->ies_offset;
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
