Return-Path: <SRS0=uKpE=IH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C370AC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Mar 2021 13:46:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 436A964F69
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Mar 2021 13:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 436A964F69
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dqgojwFMMq4UOOpQbnXuG5+2gVlQ1vxqXn0EEeCSgWE=; b=bihtc2hUxVuNhs9N5Ynn8aNvm
	mQWIZST9VGmSKtbhzu+wy5j/7SOTyHLT8jGnX5ETD48qKv7auhzM/GD4xWr7kCkkHqAWP/d1DLFiu
	HFvOi1zOzGh/NgrclWZvrfQow1vasV0Mj5biKEhEqNpPOTXvfsYAV0ceK7rb2F/aOmANn+Ci9lYyX
	S+l/rj4UN7yNiZiE6D/Q3Tf99TY9IBCld5dJaKAM7a/MSgB9BsAhhOY1QIXbFBO1eHp5pauHP8KJc
	cN0rWGaqB4P1KO72JJOYvn96d+H7oAPvmP/0ZBOjzMDuZ/THhQR86FxTlllwraSlPfvQ0LM1p0pFh
	8dSmor/Mg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJcgl-004jeJ-H3; Tue, 09 Mar 2021 13:46:21 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJcSd-004eS6-G8
 for linux-mediatek@lists.infradead.org; Tue, 09 Mar 2021 13:31:51 +0000
Received: by mail-pf1-x436.google.com with SMTP id t29so9356890pfg.11
 for <linux-mediatek@lists.infradead.org>; Tue, 09 Mar 2021 05:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1GtGC4SBuQ2ZFpLAGRU3Pq+Y262ZpPGaqfYEkH6Dyyw=;
 b=nF84KLAK6EzWsXH1yHWAfrQcJnhC4o8yyumHI0TBbY+I1ON60qF45+BdPznldjo8f3
 d8aoGI31x/rInG8GXv3w9dGS5jD6HzfVDPuDbsWBn96lgcqnRCPK0Vv7XAAGoW0EoBAC
 KExrBtd2dUdmxFxYPidcuWBVbzJoeFLovTG5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1GtGC4SBuQ2ZFpLAGRU3Pq+Y262ZpPGaqfYEkH6Dyyw=;
 b=orbOhXwwDHHqXlQusle2HQm7rFLynq6UboDkNbf3b3iXWoIn9Gr4eLGqvMMWfNuUR1
 NkyI69wUuf+FGx3WXq42vjlChlUk+aub52HEDyGWL6jEGD3ShvAC0NWvQpKGXwwiFQVY
 W/PwCJcDhqfazz6G/3b2XxdU+RjV1fX8KNwKjS3Kt66TPdhaXQZBbrs39REI52VwibeZ
 7iKwybqnO9q6Pj5AG4mY6RDlG9Ir7gHY4UMoGshE15Zdg4Cty7cBAfgoz2GCPHhE+LpP
 wWVnG9K4+DprQ+NRu0Fy1VjnPVk4lxoENB68aXQRXDQsE8oN2RYKNr/tvDm5YmBAntkd
 0ULw==
X-Gm-Message-State: AOAM533J84uHobAbQEWGqpUReseoHv2JSx0UXp9hc2A9T2Tk8zpDeU7o
 I4p1Q3CNCu/5OFGt+CWv0MFjpQ==
X-Google-Smtp-Source: ABdhPJwPHn0LnuTNkj++gu3E8wnandxNGTpU86svGpOCxuksTcoujIetoFYAWLu2SylpmgP8eNF68Q==
X-Received: by 2002:a63:5b52:: with SMTP id l18mr25527277pgm.304.1615296702060; 
 Tue, 09 Mar 2021 05:31:42 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:f936:57e5:154d:e0d9])
 by smtp.gmail.com with ESMTPSA id 138sm13678649pfv.192.2021.03.09.05.31.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 05:31:41 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Wolfram Sang <wsa@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-i2c@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v17 2/3] dt-binding: i2c: mt65xx: add vbus-supply property
Date: Tue,  9 Mar 2021 21:31:30 +0800
Message-Id: <20210309133131.1585838-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210309133131.1585838-1-hsinyi@chromium.org>
References: <20210309133131.1585838-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210309_133143_893542_9E412835 
X-CRM114-Status: UNSURE (   9.72  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add vbus-supply property for mt65xx. The regulator can be passed into
core and turned off during suspend/sleep to reduce power consumption.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
index 7f0194fdd0cc..2c45647e9f0b 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
@@ -32,6 +32,7 @@ Optional properties:
   - mediatek,have-pmic: platform can control i2c form special pmic side.
     Only mt6589 and mt8135 support this feature.
   - mediatek,use-push-pull: IO config use push-pull mode.
+  - vbus-supply: phandle to the regulator that provides power to SCL/SDA.
 
 Example:
 
-- 
2.30.1.766.gb4fecdf3b7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
