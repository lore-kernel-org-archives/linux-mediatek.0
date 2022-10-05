Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738ECC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Oct 2022 17:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=37hxz4e7MZTSus9DgCYcgdpnTvx3nmTcodX/mKNlM0U=; b=hQmQR+MTOXRsz651LDmHxS8AXR
	LwBe4MP9KnVguqgAeQhDB4qccsBo6CMKTayuBW71zoxQeaD5HSLbPJY6xDmz19yn0Tr9NMNhMlxl6
	/amxuq1Qc7szyic5lzlx6oiobwM7PSxEZD+rFF7Aby5uOCMp+3DCfm/ssoqaA2R8hfH0b416zYP1L
	YEStrM+UQMQBKrYUNbkfu2H3FXQNNx4IiOPn2KnD6TMtJ1+XhuFXlWivUSo5cnPx9lHJCR/ASHxfg
	RDrS0Np103SKsercgTCiDNBUFWVlRwWl60Vxmp4AMcQVYAkOO7C9voWWYhSQHUes4LiHcGqCWDln9
	iiE1vwdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og8Rk-00FS5Q-T6; Wed, 05 Oct 2022 17:44:40 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og8RR-00FRuT-H9; Wed, 05 Oct 2022 17:44:22 +0000
Received: by mail-wm1-x336.google.com with SMTP id o5so11258900wms.1;
        Wed, 05 Oct 2022 10:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=37hxz4e7MZTSus9DgCYcgdpnTvx3nmTcodX/mKNlM0U=;
        b=gJgcSlgc9UD7DCckOxia+yPqEKqLXHTyIXduivBZ0+CjGOBbDsNbTC9rrDhn5nJZ09
         t9jKCOba2V7nDw+B7pssKvHQmwhW4WrplzVQbPHKk+O7wINCniLHhglE72B2fWamCAMq
         LTAZfJPFqvUETC5EehzXjbjOBIFHPly7OqwU/Vye1gjQbVAAC4guhpIOVWeU1+J2fRzz
         wVtRsWa2yDa3QsKojXjiWFd3Y+78H6hiOUkbJKC26/lyV0YAaUvjcjjwxQGYkAVm/u72
         pgorn7YJtvKtUc2tmDlDoKiuIHqXwIydOATH3wkF7bCDdZS7igCCxD2PI6/9xf0c6t1B
         CPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=37hxz4e7MZTSus9DgCYcgdpnTvx3nmTcodX/mKNlM0U=;
        b=gPKqjMQEFERoSqo1GY8lBKmcoTMz/PBUhwSiDmCDceKxBnoAPXtTpjyFz/1qvz1Ksj
         kbkOl6rRcgKVmwnPHZSYY+HJQcbtJ2esU/ahBHeqkVzRlG8qq/WQJ6DMzJ6SAw8UnrGE
         gFAXafSIKsFaU7+mQnEsvMn/axc5AQO0Gs/MLo6CSft81x7IYSoSP6HX5yAlrYGLCz0p
         g08XchlXqFiz9gRB0RDjgIWsHJSGNuXENPSQSgPM/NQA+Mb84wrSYbc0Jo2e5K3WJhJS
         CMAFjmtM7aC4+s9gBue6EY0f/DpSAJKCrpg0oRPEJAUTEswJjS4MvUbi7xyhFuaxvUTO
         Ub8Q==
X-Gm-Message-State: ACrzQf152cWh3O7CslILEUrtXonil3aQ9jYDlReOGDOyY+qb5HJLawsk
	yZNDbEDkLWWO8dDG5r3NYv4=
X-Google-Smtp-Source: AMsMyM7Zu9Qhq56CkvYbcjimwNpc6IeE5Q0+iaHY4uiTqFUh8hTy2KFZeo9ruEIIOAWerocVKz6kSQ==
X-Received: by 2002:a05:600c:4e94:b0:3b4:baf8:cf18 with SMTP id f20-20020a05600c4e9400b003b4baf8cf18mr4208439wmq.170.1664991858108;
        Wed, 05 Oct 2022 10:44:18 -0700 (PDT)
Received: from localhost.localdomain ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id c6-20020a5d4146000000b0022a403954c3sm16075491wrq.42.2022.10.05.10.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 10:44:17 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Andy Teng <andy.teng@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/10] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Improve description
Date: Wed,  5 Oct 2022 20:43:35 +0300
Message-Id: <20221005174343.24240-3-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221005174343.24240-1-y.oudjana@protonmail.com>
References: <20221005174343.24240-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_104421_598699_A24BA97B 
X-CRM114-Status: GOOD (  13.22  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

The current description mentions having to put the pin controller
node under a syscon node, but this is not the case in the current
MT6779 device tree. It seems that this is not actually needed, so
replace the current description with something more generic that
describes the use of the hardware block.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml          | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index 8c79fcef7c52..c6290bcdded6 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -9,10 +9,9 @@ title: Mediatek MT6779 Pin Controller
 maintainers:
   - Andy Teng <andy.teng@mediatek.com>
 
-description: |+
-  The pin controller node should be the child of a syscon node with the
-  required property:
-  - compatible: "syscon"
+description:
+  The MediaTek pin controller on MT6779 is used to control pin
+  functions, pull up/down resistance and drive strength options.
 
 properties:
   compatible:
-- 
2.38.0


