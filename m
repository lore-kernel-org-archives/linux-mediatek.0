Return-Path: <SRS0=IR42=AN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2538C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 06:24:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0ADB2089D
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 06:24:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UAyTmudN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="U6AY+0Ik"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0ADB2089D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TOsL1cpi/Q34hCHDz3YOKr9fR0QVO+AZL2acPcCV3Rk=; b=UAyTmudNZi1aaq78hA7yhcBa6
	hDuakZTh4VDpA8FCtpFek04df2KPom+3a6tm/rncbBVisJNMcdv5Ndu02La9jJMwb6Y2418DGexFL
	3D4kwIaHKs9WMwillzfbY2p88m7nBWI7xpldKMaFPmu63mPC0+AFP2hVZtbfKTtb5zEOBydTM2IeF
	wuk/KjI18jTHG9Y90pqdSPt7g/vzGGZfMqa++WvRClrP/aAo81IwdSQ1uDFlLE6Dv2aONNTcY5K0A
	PUhgMm4cilnD0yqmvzV5TUm9B37NrDtnUzynIJtcxteHrbOl50j2tACmD70hUBL1njkXVOqhPHS+u
	ZXesK63hA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqsdd-0003Mn-PD; Thu, 02 Jul 2020 06:24:01 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqsdZ-0003KS-Tu
 for linux-mediatek@lists.infradead.org; Thu, 02 Jul 2020 06:23:58 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id y136so7733ybe.5
 for <linux-mediatek@lists.infradead.org>; Wed, 01 Jul 2020 23:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=Capr5djsyEnhWv3S70+sKnIxhHZKvTK2BCpibA16Fik=;
 b=U6AY+0IkBOoVPB2dSzvaxlfM89ciV2yrEH7+K/7aph/MHWU0rQICZPTeIH4We4nZEM
 lQh+TmddQt/DLQW9PTHOMHjOutneoY9KxRCFcVKFZfj1QfBpGOb49wPJ3YRTUjaVJ751
 v40vf43BI2pl5zr84D0dutjVhDJTAdL/xnmpi4q0siBr09JPhiy8Hpfe0A7wI4qkwR6d
 H50JZc3Ml9AbyVUpYBWk22gKfQntqu6JMD8/vDS7DOO9RrTsbUfXzmP0Fr9ilKR4igq1
 xiLcXoZvgB3t2gtiqW1v7IsWPfbcLyLCv7oOzSL6rGnrVoJtQXsSEI1wNfTgUo3ouaIo
 C/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Capr5djsyEnhWv3S70+sKnIxhHZKvTK2BCpibA16Fik=;
 b=ovFT6hj6wJA1jB6mNC3fFJdlMG6uVBIBBgTDCRRoxhHsMcL63RjAsaryzG3CiAjSCh
 Bv754MBm+YWkowSEgbdNZOFPQOJJHl9GZdcCrN5ZTR940YkwSyc2sFnVLy+kJ9ijTGhk
 J2x8pgbkicsVnS5gSGV2+MXJWwYFiYJtpi8Qon+Vcjsfpctbkxw9/TcRflSSax2YYjvF
 YD8lQorSiaG+78aHPtxuHvq7YQ/vzgMcJf3KXsV2xSPwsYtA77OzVdNfd5o8XCMRsjrN
 V6doQYudHjKGtazFp/QvOU6+2ma2rz83WGDeUV9Dr8eRcomHvmfV7F0DKhjAhqgYt25w
 ep4g==
X-Gm-Message-State: AOAM5306wDfcppoe9iKm4kC9RU4WZw7ZU6wEyvAX82t9Uqxrffqn9fDC
 M/DWhMhbHLNvosR5fyenYrI0pmaA5yF0jGpY1SgMgwicuE0sOtiTwCipqR7yrsQ61guuJGFi8Mi
 jb/iKXCGMWrArQJLE+Nq7MuHlB9bN/21tVU3TJkM2EVyeto6B5Y+ztwqaHtQ/MhFn7habm5+92W
 NqiNU4
X-Google-Smtp-Source: ABdhPJy7W3Ner6I27HbAR57C4mAp+BrPPho3YMhBs5gzoadgRkL+9hBU76n9YuqygWflTzhiTwqEwLmhnULw
X-Received: by 2002:a25:77cb:: with SMTP id
 s194mr36730723ybc.216.1593671034543; 
 Wed, 01 Jul 2020 23:23:54 -0700 (PDT)
Date: Thu,  2 Jul 2020 16:23:18 +1000
In-Reply-To: <20200702062320.2903147-1-amistry@google.com>
Message-Id: <20200702162231.v2.2.I0a814b246cfe47f8dd1e25553ee881cbcfd0d8eb@changeid>
Mime-Version: 1.0
References: <20200702062320.2903147-1-amistry@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v2 2/4] dt-bindings: regulator: mt6397: Document valid modes
From: Anand K Mistry <amistry@google.com>
To: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_022358_013883_14F13823 
X-CRM114-Status: UNSURE (   8.34  )
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
Cc: devicetree@vger.kernel.org, drinkcat@chromium.org,
 Anand K Mistry <amistry@google.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, hsin-hsiung.wang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Document valid mode values for BUCK regulators.

Signed-off-by: Anand K Mistry <amistry@google.com>
---

Changes in v2: None

 .../devicetree/bindings/regulator/mt6397-regulator.txt         | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/mt6397-regulator.txt b/Documentation/devicetree/bindings/regulator/mt6397-regulator.txt
index 01141fb00875..c080086d3e62 100644
--- a/Documentation/devicetree/bindings/regulator/mt6397-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/mt6397-regulator.txt
@@ -16,6 +16,9 @@ LDO:
   ldo_vemc3v3, ldo_vgp1, ldo_vgp2, ldo_vgp3, ldo_vgp4, ldo_vgp5, ldo_vgp6,
   ldo_vibr
 
+BUCK regulators can set regulator-initial-mode and regulator-allowed-modes to
+values specified in dt-bindings/regulator/mediatek,mt6397-regulator.h
+
 Example:
 	pmic {
 		compatible = "mediatek,mt6397";
-- 
2.27.0.212.ge8ba1cc988-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
