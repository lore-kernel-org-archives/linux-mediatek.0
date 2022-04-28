Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 880FDC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 09:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KEx9wqjbnDYQHuY7ak/iGr8X9u+82iru1ohY47VU4lY=; b=VB+CcJfKsb4rkk
	W78vyGoS7Im+OKOwF3jIjIdFsR64o9UVF868Muw/35s/UeTwruM85tzDoUAy/HmVcY8/DrhHBogGb
	GkpEHtGSAgLeb9nfanhwymZ6CVidMoWNsMya8II2s0Jugs9UuFkJdYKDAaYBdzOuWBvlxBqvJf6Pk
	5EXh9UOvDee5GlCxXuqNmLYbmeugZFQhSySZb1SUX3OMAqdXMSgh/oFW1XdHXL5qYQvIvAqnjFQJ7
	h65p6VqNY18O7CT2DV/XgNu7d85LPXlc7p8gVOg8u7iCVMND3x66scUeePBe4HmjNl2RoqHY5K/f7
	ZZgzjW3c2BIAPSMy1kLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk0We-005k2I-BC; Thu, 28 Apr 2022 09:33:28 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk0WP-005jwR-Db; Thu, 28 Apr 2022 09:33:14 +0000
Received: by mail-pl1-x629.google.com with SMTP id c23so3889867plo.0;
 Thu, 28 Apr 2022 02:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=kWZe+4U90sxTKToEseK0+oAihI7ZBnHaalcQvB+4Uuo=;
 b=E7jjJrp33n0Qj5If3vLLYwfakVJG/T4INawvqftLhNW9eEe+YbX0OSrjv6IS0PtyMe
 diT0FntjAzNAvTpLcC8J54wT9I008ZvsoEbauH0HMYGKJW1JMoIyJ5M04Fk3A6/RhB06
 QzKacey6Y3Ri7k7+gX+bab14OldiWlQcuVcXNRLmnccATw/D1AXIGcIODkY5Q1Sy/FkP
 Fc6NQb8b1fjEjRDZlYsU3KHgoaXk22AXFIApM81ss9XL5KltYVelBJFUP+hQmz9gTAlZ
 ZUUwyQjtPh8Vopq7OGLBmQqsindaYGYKiCfjyPLYHdWTW6j92UzfeovurHhagnenCpK4
 9X9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=kWZe+4U90sxTKToEseK0+oAihI7ZBnHaalcQvB+4Uuo=;
 b=SF43mjuDFL15Fncm/9rUBgxxdsZqugoZ/T7ptYmmWVh7FhFQ2Tw308cK0JpF6GuzP7
 4fe5DsUi5YjTS0Jjo9zSGbvOtRj9Qv2+2MrAToOhoZRdy/vMjnQiLkF3aoTFWi+ZQsfn
 aDyU4ZVMiPb9bXn3AClcMDxgbqMb4pPtKdVuHruDoGM+kleC4entzaPIufqotI1zMSQl
 clXgkQp+nDbfE6OxfMOZEkym1pnYYSpu6JbYHcTAm+787++H04DqPDJoVrvBNZmzRa4L
 J9uAXnbtxtvbQXOLM6xVpg43I9bnbCyCjDQVXZM355FfmRzZ5p67le0VrXwZHmS+joxa
 Q4cw==
X-Gm-Message-State: AOAM531+mivPasgzti4nSTQUAfTvB/b4gLMKH8Oc8PPU/nqaX41PUs+u
 TfyBluwijYdgziuoPFtn+mk=
X-Google-Smtp-Source: ABdhPJwNXGBHj42NXx7t+qclCk9irVzgFj4UXrWz3vDqXdZOADcX0g9YJUbTB3xz2kMM91Xt+Vf7NA==
X-Received: by 2002:a17:90a:c402:b0:1d9:a003:3f8a with SMTP id
 i2-20020a17090ac40200b001d9a0033f8amr17168273pjt.18.1651138388661; 
 Thu, 28 Apr 2022 02:33:08 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:569:2b1f:d169:337e:6359:8ff7])
 by smtp.gmail.com with ESMTPSA id
 i66-20020a628745000000b0050d36a5fe70sm15457932pfe.127.2022.04.28.02.33.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Apr 2022 02:33:07 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: pavel@ucw.cz,
	matthias.bgg@gmail.com
Cc: cy_huang@richtek.com, jacek.anaszewski@gmail.com, gene_chen@richtek.com,
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] leds: flash: mt6360: Apply the fixes and hardware features
Date: Thu, 28 Apr 2022 17:32:41 +0800
Message-Id: <1651138365-17362-1-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_023313_494762_88A339D2 
X-CRM114-Status: UNSURE (   8.15  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: ChiYuan Huang <cy_huang@richtek.com>

This patch series includes some fixes and add supproted ISNK hardware features.
From MT6360, ISNK can support three modes (CC, PWM, and Breath). The previous
one can only support CC mode.

ChiYuan Huang (4):
  leds: flash: mt6360: Fix the wrong enable_reg in multicolor brightness
    set
  leds: flash: mt6360: Remove unused dependency in Kconfig
  leds: flash: mt6360: Add mt6360 isnk channel hardware timer dimming
    mode support
  leds: flash: mt6360: Add mt6360 isnk channel hardwre breath mode
    support

 drivers/leds/flash/Kconfig       |   4 +-
 drivers/leds/flash/leds-mt6360.c | 413 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 410 insertions(+), 7 deletions(-)

-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
