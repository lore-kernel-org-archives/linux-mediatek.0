Return-Path: <SRS0=aDjs=G5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2D62C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 13:26:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CEAA20729
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 13:26:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CEAA20729
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oLn49In5Xin2tQId5tHsOABEyVOqPWY0NDJtVmbBdTE=; b=2C9SW5YtwH3VupQgdQQG0sXvoC
	s0lVxIQACkF+GUbFfo3uHb371Fmo2VpBq7ch+0oDVRcT5dwvzyY/fMoyg/IyQ8pJZ6zFJ4Zuw0C0D
	+jRbIv8p1VCkQ6y7lt5YQNwAWKnFRk0hkFwZ2/GxLRiZ0llSWv8RQKetAPCN3PSW8S2cZHqUEqzTC
	tZVj4a1+JFZ6h4TRLPb1JiFjQLJ1ofiVb8FYU0P1USU/bXlsSsbm8fXqETkU+ufR3kaoLntYHeKpL
	d2PfUpPLhlOpnmHMBTSX2myW0NMyj1yGdr0nTk+lOTeL6dTKx0t+K2/z3/cgTvfLwgd+MMjP1bIYy
	Awg6qoww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4OMS-00086l-RJ; Tue, 26 Jan 2021 13:26:24 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4OMO-00083l-8k
 for linux-mediatek@lists.infradead.org; Tue, 26 Jan 2021 13:26:21 +0000
Received: by mail-ed1-x535.google.com with SMTP id s11so19728574edd.5
 for <linux-mediatek@lists.infradead.org>; Tue, 26 Jan 2021 05:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g1bWSW2j2AzUWAFhSJZFlC66uupPeLjnhszVJrACnuw=;
 b=hlqR1UTITl2IrZgG52KTylgq694xBqCbP2uOK7UZErWX5UjUpEj26bNjp5I2ASQBcy
 NrcqZa4u3g3cCNc8N7TLmoBGqiGH1+bGVporc+AfMztQJ2p1PPcDWUiv4yVhdV71ynt9
 zhO8mtfBn0jWkMcGdvAqEUX+KRg6J9KBy1ZSV3aMTJP5RVUM6LWrbv2CAqkDK7igHTDp
 idIAgBkeXHS44OaKJttLbc8GPjeNt/E5oIbJIOcphXtf9MVQIccRPRnvfI+7Y2FzJtkg
 jpkaaIpJ+ImQuaKCAhoaxVAO8rv1G/1pXNAo8p5YkzVm1v5vv6lH49uXzdSUhLIgMh8Q
 G9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g1bWSW2j2AzUWAFhSJZFlC66uupPeLjnhszVJrACnuw=;
 b=oQHV4uqprKXDlzxsql/lHXEl9qWKyOwdhSeW9Doc5KvuhrCV7hr5RWgR+XeaXpOh4W
 Nhk8T31zmvhU98NrahVzN0rsye7f5qywJ1nkR4BFJ6mHPaKMltywcI5epywj8hA2VM0x
 je2fx46dNA5E16DR9sreoGho7o1R9qKsiECCnMz2nrHJKSImpjMA/AxDnAdtbacipEv6
 g9IZeq4sN/6HObYSLVJq0dWsY/1bDcej5oSOnhDHA+65cYfNVQ+mFxHBxvntw2K7/5/J
 j2HNt1fC4s8mirGJptnGbv9qIOZx/89p/o6Xoa/J5ZtIZChSHYzRv5SoSRUIxR0Rn+Vx
 /n7w==
X-Gm-Message-State: AOAM531uGTfQEQ1/VMKrPF3YIuGcZk0N2bbI6M5NULh9RePwYqIKxpgz
 WLBoyqT9dQARnEpp6GzSrDuqcQ==
X-Google-Smtp-Source: ABdhPJxYoOhqu0uVmrPjAm/2q9G4E+XPc6EQ2qooE1FG/uuK4u7WYvLoeIqvmMnqRM5oH2BRxbWCfg==
X-Received: by 2002:aa7:c981:: with SMTP id c1mr4786033edt.90.1611667576505;
 Tue, 26 Jan 2021 05:26:16 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:65c9:91eb:731f:f2c8])
 by smtp.gmail.com with ESMTPSA id dh14sm12236010edb.11.2021.01.26.05.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 05:26:15 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: linus.walleij@linaro.org, robh+dt@kernel.org, lars.povlsen@microchip.com,
 Steen.Hegelund@microchip.com, UNGLinuxDriver@microchip.com,
 lgirdwood@gmail.com, broonie@kernel.org, matthias.bgg@gmail.com,
 jiaxin.yu@mediatek.com, shane.chien@mediatek.com,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v1 1/2] dt-bindings: pinctrl: pinctrl-microchip-sgpio: Fix
 dt_binding_check warning
Date: Tue, 26 Jan 2021 14:25:30 +0100
Message-Id: <20210126132531.2084711-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_082620_339263_64CABAD2 
X-CRM114-Status: GOOD (  11.33  )
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
Cc: Robert Foss <robert.foss@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Silence indentation level warning reported by dt_binding_check in
order to reduce noise during routine checks.

$ make dt_binding_check
mt8192-mt6359-rt1015-rt5682.yaml:10:4: [warning] wrong indentation:
expected 2 but found 3 (indentation)

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 .../devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
index df0c83cb1c6e..4fe35e650909 100644
--- a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
@@ -99,8 +99,8 @@ patternProperties:
 
       '#interrupt-cells':
         description:
-         Specifies the pin (port and bit) and flags, as defined in
-         defined in include/dt-bindings/interrupt-controller/irq.h
+          Specifies the pin (port and bit) and flags, as defined in
+          defined in include/dt-bindings/interrupt-controller/irq.h
         const: 3
 
       ngpios:
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
