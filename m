Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41E40C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 09:40:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7DDD61248
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 09:40:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7DDD61248
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sBoJ5/wuOHaj9/Yb78OSBcCmqeem6UTJm6IJIxDek48=; b=GMP/Q0WSDDS9WQmHAZd7QbGPlp
	9pDeAvvkOJIxMUbUAQRETn2pLleAXSGYS6EhaL2CkQcJcv8YoUsSHBYA5mN3HjEDhfpH0Ss880h9u
	HFMpwCLO3BuKiSAIAMP45ZZ98uuGmsM3lwS1e/vuv5/0UzEtQ3syBqFbq6JvkVIWZNcXbxmhUYVrI
	BXKNpBrNRSmc58CywRhAUptcBrvmsFlZliLzJaKv5hAcxOO4EpxG/E6fKJsNl0zI6goT1WzPjUZEE
	6Tu5G06WPK5mbM7GGsxxZYWd+WSnVg+4aKIdwjzb5P4NOoqqnqGYm7SMehLjIthOIbYw60k+asbae
	kCIhkAtQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVt32-006JaZ-MQ; Mon, 12 Apr 2021 09:40:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVt2g-006JWM-Ck
 for linux-mediatek@desiato.infradead.org; Mon, 12 Apr 2021 09:39:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=w1BnG+IENM4qvrGt9ztIqEmR2ezH1D5tkiZdEencp0c=; b=K+gZltqv1M7Munm97tyTg6OAWj
 Wk2fNaXah3ni4NLaMKTC2vYTQtzWNwjGopakdUhAGO6W42vWog40OX3/0kg9Q0ybhuKzHQwdKeGW7
 fClU0I+LDghPHL9vdHQfjLu3vc7araWVk3Vp2Hinq7T3tYPzl4CsGcwLaNaDE1BoyEu3pNdhmT9ww
 MGUBsAM5EePx1+Wv5c3xQCkFSYLlBl74vMSB+J8vB5Z1AWuFoWr5uLOK+O9kLdsTu7MxaYYe9HrJT
 rD+p2o5YcJ3SE/oCCzuQw3P1kVUuIuIxiEordzwy8id33rVYhuCjY/sTv/ffOCz1GatANbk1S8CvK
 mjg6YBLA==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVt2d-0064tD-2M
 for linux-mediatek@lists.infradead.org; Mon, 12 Apr 2021 09:39:37 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so8276891wmy.5
 for <linux-mediatek@lists.infradead.org>; Mon, 12 Apr 2021 02:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w1BnG+IENM4qvrGt9ztIqEmR2ezH1D5tkiZdEencp0c=;
 b=NDC4fFT+scz5EapADelZyfCl195sOOv2zwhoQ7BzUsreOAT5gl9FUXPVafJeb8KFEa
 RlPUeT5uW4WhE6OFY12guQS1IyIzcWkywAtXk4TagSimQUiX17NgHp1rBiUtlqxnuYJ+
 bHqR2fmTaAcpw9d/M7Y/8H5cvOpBhYovJnQVE0HfKiyR6zqdxEdfMZBxW1PZJAiWQQnb
 PWpqFJVji72qnuCyvG1reW8Dkob+9H8ZQsj5DbMR4lIrz93/9Qthv+I3DXrknc0J6qwD
 AECk8CYfRPH+/s0Y9AguuIG7RNv7Aq0ClpZ/jfAzLS8pqY8h14nWDfbHM5qvdT/qvE4B
 FGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w1BnG+IENM4qvrGt9ztIqEmR2ezH1D5tkiZdEencp0c=;
 b=sZN3qkdorIYrAadXX3/kemqToaATQEQEifUAdxGchDKM77mqtFfY4USbVvHpsuEVVv
 j2Pvn8t8NJYJ9fv9qadi3FnDOnJv1Dc5pyJpu8AygaDRlvjNXIQQ4Pth3L/4Z+gdI5jR
 dq90Q0SN1n5FhfTrj8p6yy+jXJXGFs/lfKYdUGLbKGlL+z5b58GvCzG6fI3755bO3185
 MMGc/+OChBIurADccmSauASizVS8VJYb8xQ8sz57ny1DMSNohkgGqJK9T1xgVH2iUYMm
 HTU6SEHcfT3YfzExcCB6XaUBn3fY9ZEDtB4GswalMBLJpOwEVYdREtGIDZ6bsSKiqZRA
 FTQA==
X-Gm-Message-State: AOAM530KV6DQiYqgDKkrXIMHH2GPZHiEcr5Q2lWVGgFFMHcc7ythzHRT
 2vLogHh7ZViISSCPYW/Df7I5qQ==
X-Google-Smtp-Source: ABdhPJzb8zquyRlhr97rmCN1MNzd5KVvMYgqyH3tT3JQ6U4D10kioViIzexWKJVu3EQa2ZFNYH9qzg==
X-Received: by 2002:a05:600c:4d91:: with SMTP id
 v17mr4377091wmp.28.1618220373362; 
 Mon, 12 Apr 2021 02:39:33 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:4c21:b00e:ff79:bf20])
 by smtp.gmail.com with ESMTPSA id
 r22sm14405902wmh.11.2021.04.12.02.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 02:39:32 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 0/5] mediatek: hdmi: add MT8167 configuration
Date: Mon, 12 Apr 2021 11:39:23 +0200
Message-Id: <20210412093928.3321194-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_023935_144689_A84A397B 
X-CRM114-Status: GOOD (  10.79  )
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

The MT8167 SoC have a hard limit on the maximal supported HDMI TMDS clock,
and is not validated and supported for HDMI modes out of HDMI CEA modes.

To achieve this:
- switch the mediatek HDMI bindings to YAML
- add the MT8167 compatible
- add a boolean to discard the non-CEA modes
- add a value to specify mac TMDS supported clock
- add a conf entry for the MT8167 compatible

Neil Armstrong (5):
  dt-bindings: display: mediatek,hdmi: Convert to use graph schema
  dt-bindings: mediatek: add mt8167 to hdmi, hdmi-ddc and cec bindings
  gpu/drm: mediatek: hdmi: add check for CEA modes only
  gpu/drm: mediatek: hdmi: add optional limit on maximal HDMI mode clock
  gpu/drm: mediatek: hdmi: add MT8167 configuration

 .../display/mediatek/mediatek,cec.yaml        |  52 +++++++
 .../display/mediatek/mediatek,hdmi-ddc.yaml   |  58 ++++++++
 .../display/mediatek/mediatek,hdmi.txt        | 136 ------------------
 .../display/mediatek/mediatek,hdmi.yaml       | 132 +++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_hdmi.c           |  17 +++
 5 files changed, 259 insertions(+), 136 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
