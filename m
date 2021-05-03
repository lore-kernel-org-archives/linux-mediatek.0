Return-Path: <SRS0=onLQ=J6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 942D5C43460
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 May 2021 05:06:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04189613AC
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 May 2021 05:06:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04189613AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CAOvHW4vNuaL/HjaKa2+yhRKCi1sm+oAWpInAT349Bw=; b=MMg/urrFiPFr0n
	I3LJF7Wq9cRhxZMFwWVzPq88XCISsQrZRPeoWQCbFkNwGuRfNReRBVDJ/0wJQkhm7AhOyfa3F61SM
	B9tcgjuSj0AsXdf+OuPaVeNRbLneOIfsnLQp1fjerMEyXM6vpfxzuAhJIeTuzINTtW8cTXiwq3si5
	aqBcVoZduNocjwPeHh6etlQbQQmG9OciGht7SmO1QabaiLBuRUpEsfQYI5uPPS9G1t5SJUl7/2/Ya
	06DJjdUhVimXbJ3ICtJdvf2VQTJpBu1z3xwPSK8OhBA2F6HZ+tk9UP/XEQantdWPuS3e92gfwFdTA
	Rh/z7C5CVbNAIZC9Yv1g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldQml-00DCC1-BF; Mon, 03 May 2021 05:06:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldQlz-00DBzm-Jg
 for linux-mediatek@desiato.infradead.org; Mon, 03 May 2021 05:05:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=g3OaSiVF5MtL/VroYDmXFrkkWbMJTL0iUxMjRnNHvBY=; b=WSrD+7Uj/fTfEx2vf3/SdzPMjL
 Q7jN0G2DSmy3HcqrBJGUZVpc0jul0GcEv8OnMe41f4SCfEUm7d62jDFIEPEKh8vGkPnki/0p97yEw
 cxMVK9SHMU0ug84Hn5vvyZ3Zhus2LRiiuAjcxW4DKx/leuwrVUpfT8bRseI7BRvcg2+aqgeQPa/2D
 XVf5kNYcEIdZjUQfcdqGEpxykHHB+ze/ttg+L/rstV8s78N0B6r5JkMfVpMwSqIlPAJ+oCroLDcr3
 jMLR1ZWTexB26TS4EI1po76BQ4wSdLxv233Schlj/YaaflCFkQRnp3K4AOy67dq75WJh5uTdqyzjS
 OxFpaOAQ==;
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldQlu-002pXs-Q5
 for linux-mediatek@lists.infradead.org; Mon, 03 May 2021 05:05:34 +0000
Received: by mail-pg1-x52b.google.com with SMTP id y30so2843922pgl.7
 for <linux-mediatek@lists.infradead.org>; Sun, 02 May 2021 22:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g3OaSiVF5MtL/VroYDmXFrkkWbMJTL0iUxMjRnNHvBY=;
 b=nKzE6s5knmvNp/Hcd0vBxdVoIJLOGEBAopHSc/8Lo1xuaFCkOeckBx31XO1SdCzYqr
 c3Lp+RYIf1YodVE9jGMYF7pKrcMH4QdKWUljPofNhlCd62P2uTzbyPryq3vDcN4kleYm
 TQD11xqkA88SZXJ/v70iuhVXZQaFFO9rnwBgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g3OaSiVF5MtL/VroYDmXFrkkWbMJTL0iUxMjRnNHvBY=;
 b=D34btnGDgbZbunmLI2+aQmX5pXxfZcG2Z/ds0rtpRJyUyBHcZQ7qmH+PYjk5wX/rMd
 MJRrjgWi/pHiSo+BDYGSgGSyMXvpaNdNNtW/HA8llavaW9I6MOB3lkOdc0sl4lKJ30cB
 aXdPTzHBUf1pHEzsC4c73keuObZtMDZfammKajtDRXpYovt/AHHx2QKGjoBXxW8EwIvx
 axTEyiAVJngdx3/MIpMqHQYkcQ7RQ4ZCx3U5WV9qKYBlu9J0zCISno+6vPYx3V+feNmv
 4PmatBIWx53YDx9v1Bt4sQipUsC51NFDO3NXimVQBUUVy3iRhhkLpjKp+mhwjCxHNhjl
 27Pg==
X-Gm-Message-State: AOAM532VveWrXFlNSH9H/Q8Ok56cUO9WSp253MISfsrfT2FP6fjXsgey
 FUryoYRf/1+HneZKivcwLQJoEQ==
X-Google-Smtp-Source: ABdhPJzzaCXBMXMoEGL5WtdSc8NmhA2rO2kQhgEa8DyTFoirOLa/q/qV8pUGOT20LBAYUdQMVgk+iQ==
X-Received: by 2002:a62:6142:0:b029:28e:b072:6b7 with SMTP id
 v63-20020a6261420000b029028eb07206b7mr710806pfb.65.1620018327485; 
 Sun, 02 May 2021 22:05:27 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:63a0:c726:475a:ace5])
 by smtp.gmail.com with ESMTPSA id 14sm7854600pfi.145.2021.05.02.22.05.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 22:05:27 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 devicetree@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] arm64: dts: mt8183: add mediatek,gce-events in mutex
Date: Mon,  3 May 2021 13:05:22 +0800
Message-Id: <20210503050523.2571758-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210502_220530_853119_43A6CBC6 
X-CRM114-Status: UNSURE (   8.82  )
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

mediatek,gce-events is read by mutex node.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index c5e822b6b77a..cf22d71161e5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1250,6 +1250,8 @@ mutex: mutex@14016000 {
 			reg = <0 0x14016000 0 0x1000>;
 			interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_LOW>;
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+			mediatek,gce-events = <CMDQ_EVENT_MUTEX_STREAM_DONE0>,
+					      <CMDQ_EVENT_MUTEX_STREAM_DONE1>;
 		};
 
 		larb0: larb@14017000 {
-- 
2.31.1.527.g47e6f16901-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
