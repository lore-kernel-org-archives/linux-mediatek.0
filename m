Return-Path: <SRS0=j7dB=GK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB9EC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 10:49:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C7922312F
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 10:49:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C7922312F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zVj/SQFRKet7Jfss8QCy+pGYc7WJrVX/cHzrruwf0yU=; b=QMJZPVq9kMxEnQymRHKo7isI4M
	NkQxG4acKGlUHYZ6AdShrMpBb1JLCAIcREN9jtjduoltWHzTrIYEXtMCiuaKRYAuu3riH6RBV2L/8
	ys9kdKZSDaf4CdQriRIhSnQzWoYWjEO9labYBUGLF5NakipeAhFHvSeJWsEfK+paDC5Cv/FE3SwRY
	HQUteygkfvLVeFVRw+k7G0m7XHK3qpBOZyF/ouVnkUklRZjfluIDjhuEl9Rx5VBdqMIcgWlay5D2C
	WQj/pHGPMFNLYMKqu4wN/SihzQYoQJOSL/vl6hlBcK/OkcXP75VQRslf3ZkwpXBcy7FulIVij4ezk
	PNhsIANg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxSrC-0005W8-NZ; Thu, 07 Jan 2021 10:49:30 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxSr9-0005UB-IM
 for linux-mediatek@lists.infradead.org; Thu, 07 Jan 2021 10:49:28 +0000
Received: by mail-pg1-x531.google.com with SMTP id z21so4580612pgj.4
 for <linux-mediatek@lists.infradead.org>; Thu, 07 Jan 2021 02:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fHuzJX3AXMDyR6q3I0Hp62ensb6x58xwS1/Acc8orx4=;
 b=ixT3pGH/0DXIroqi6tiSTr5sWzG5Iei4XLapjaZ+piLGLPbsnkkOIFu4h1K/bDrWw4
 1BD70hpC7J7IMlAQQlgAFucYkfptwu84CbbdQ62bth3y9ceK0oYxOF2s0XCLwp2FbIB5
 sPrsVrz183b0a8zzev0uZO8x/gHlvTbfYT66Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fHuzJX3AXMDyR6q3I0Hp62ensb6x58xwS1/Acc8orx4=;
 b=L8nQ+lqprsG//+ENon9vDEWqyXe3+apadwIl5/FbEJJF310B0gNqAYilztNOyAOySp
 nOBJmYHlkDoABE7eeh2wKqbuDZ5S2AvNTQfGfwi9pRQTcHfey65X1hCrAqxSCMP9alrp
 PYDTa4DAovxVMaUlmMTphsEe+jY31nE7kQUlewof2VhAENGCmgAmwOOPL0Mpin7SK5sq
 z4VosZG9s6UfLK8rrOkkq9J/T+l6J+X1FPSBKvggz/XvZiUbBNivCEEVNtB6jyzS+vEw
 6zi8vL9OJXd5htaPYNlrnRWVrdIgOTVrOh+yH3F+ntTcpJE+pXsAXh1+dSn+Von8voq2
 erZw==
X-Gm-Message-State: AOAM531UtLgjfXmHxRm6FYYduVCXRVSKBBotpEk6FkVZbF9FsNrn4OZW
 VHr3o/e5h2vda9KOHgQP1O+P5Q==
X-Google-Smtp-Source: ABdhPJx7bXQ1sTDWZrRM55QgfTlZnWkr93l8D9TzllVk/mmwNj/Wmaw0FUNbVpOLrfiWKTlbg+EWMw==
X-Received: by 2002:a63:f111:: with SMTP id f17mr1255707pgi.287.1610016563437; 
 Thu, 07 Jan 2021 02:49:23 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:1a60:24ff:fe89:3e93])
 by smtp.gmail.com with ESMTPSA id n10sm5381974pfu.176.2021.01.07.02.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 02:49:22 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] Add domain supply for mtk power domains
Date: Thu,  7 Jan 2021 18:49:12 +0800
Message-Id: <20210107104915.2888408-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_054927_709831_297E8E5C 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some power domains (eg. mfg on mt8183) needs to turn on its domain
power supply before power on.

Otherwise readx_poll_timeout() in scpsys_power_on() would timeout.

Hsin-Yi Wang (3):
  dt-bindings: power: Add domain regulator supply
  soc: mediatek: pm-domains: Add domain regulator supply
  arm64: dts: mediatek: mt8183: Add domain supply for mfg

 .../power/mediatek,power-controller.yaml      |  9 +++++
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |  4 +++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  2 +-
 drivers/soc/mediatek/mt8183-pm-domains.h      |  1 +
 drivers/soc/mediatek/mtk-pm-domains.c         | 36 ++++++++++++++++++-
 drivers/soc/mediatek/mtk-pm-domains.h         |  1 +
 6 files changed, 51 insertions(+), 2 deletions(-)

-- 
2.29.2.729.g45daf8777d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
