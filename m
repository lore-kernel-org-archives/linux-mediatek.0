Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9223C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 09:31:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A67F64E30
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 09:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A67F64E30
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bdk7UzU2puhYjdYgpDQyJcOHhwdT8bhkP9twcnMBsyQ=; b=bs080Ilzkm73AJVoZs6sk05dZK
	p0NfE1CNv+wLfYxP/pOXtLYp4I9wKgPblsXvLdqWBt8SDfOc83g1J6qptMMLE14MkRak0nusPhXw8
	fslpdOZF99EVidb6IuSlBgnbMwXqnKCX5GZRpfqbjig+o7Spn1sWMr+6xc+q2qgr9SyoB0zeTiJzx
	BKpjtt+9NXSMvS9Ds0J0yLHm/CsVdVrQv+skP9Fk3W8cMCv5kiIY80OsiRab7PW6BWXd0udOvHbbx
	xR82TG03Ozg4X9QhcdTP1hhegFWzBIJ95zn03In/LOHK5sE0fiEZvcGX9SBbRwK5C6rrtaDREFrRx
	SNfiG2iQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6VXw-0007MW-Fp; Mon, 01 Feb 2021 09:31:00 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6VXt-0007La-Lm
 for linux-mediatek@lists.infradead.org; Mon, 01 Feb 2021 09:30:58 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d13so9649806plg.0
 for <linux-mediatek@lists.infradead.org>; Mon, 01 Feb 2021 01:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SZcY/cTYAV9gOjki0HAFY3HZKWSO9Da4wkrASt2n+fg=;
 b=aec/wnh2CcGmv5nxwMrpLOQBmerb5Fu3IzWR/PpXxLjrGgRryiPQ/qlWm5/DCprmfu
 7C/Ll7kJF2q2g4UaNgqNJZzHZF0RFj+UvN8AJKgh+K+OVxE97o75UAAAtCeekWQWglYH
 4kc8SSSFUN0g42mVhohVV9JXga//uR8CqY+6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SZcY/cTYAV9gOjki0HAFY3HZKWSO9Da4wkrASt2n+fg=;
 b=fo7cWPQJg682uoQ30AR239gMj6edD9eUM/t0LXDuEPRf7NXoivdJh1DOvh/UF/OeE2
 MTfw5cqUaitUd1XC/8xxUHh2hODDumpr7Ioo/ct6RsuWHt6Zbmb+yu+DTh6D5W8nUqA3
 IwbvJlDS0tmWjGNf8E3Djgd/3Sp4FUqOuGj+KrFd9AAv5p0W6SEj+zZ12l+JWpdXrAqh
 6r09izak//Ad3boNpS4BR15AZL8o0XjEiVRTRLedNh8yexMEEtY4Ya/Y/f6/UjJ5EAPy
 Xkylmy7Ml8joxSxWYDjtIBCCMJAGGQEVAES+WRHn6E0ll/dtg8Xmg/XkMWdhtTk149zd
 5W0A==
X-Gm-Message-State: AOAM530THcUVPixNu+R/TdtVRiToAQVLNdF2vz5Nnv5ygba5fCYZuaj2
 M7jc9/MJGlqvMdZ2NobRrBRl/A==
X-Google-Smtp-Source: ABdhPJxlY5GAiR+f+jEr0JLHTYBTgvbf08NYkoVhdvX4Ghl+NlkGXIzxnkudGQXWytfw9ulrOzgvKw==
X-Received: by 2002:a17:90a:5410:: with SMTP id
 z16mr16139042pjh.110.1612171855027; 
 Mon, 01 Feb 2021 01:30:55 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:a0cd:1b84:6d56:68e1])
 by smtp.gmail.com with ESMTPSA id md7sm14890795pjb.52.2021.02.01.01.30.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 01:30:54 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] arm64: dts: mediatek: mt8183: evb: Add domain supply for mfg
Date: Mon,  1 Feb 2021 17:30:49 +0800
Message-Id: <20210201093049.87285-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_043057_790473_B448882D 
X-CRM114-Status: UNSURE (   9.40  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add domain supply node for mt8183-evb

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
index 3249c959f76fc..edff1e03e6fee 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
@@ -352,6 +352,10 @@ pins_pwm {
 	};
 };
 
+&mfg {
+	domain-supply = <&mt6358_vgpu_reg>;
+};
+
 &spi0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&spi_pins_0>;
-- 
2.30.0.365.g02bc693789-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
