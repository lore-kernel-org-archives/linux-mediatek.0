Return-Path: <SRS0=lG5C=36=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43820C352A4
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Feb 2020 06:37:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E48720661
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Feb 2020 06:37:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZmmpiuKp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nIERl2yu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E48720661
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pVas509EcnFOo0l3TF1w3J4WMH61mPWRbFGb5YxcUXY=; b=ZmmpiuKpz1wUdl
	oGV+J88ENtWX4y0ByH3fdC0tNCnPJJyCA22q8zNcVJa8bKl1CisFhbIpk8z+L9fSSAT10lP+8zmKD
	Kjt4Gb+eHdo6d3U2ZJ+cPtpHmN4OpuXLnJDFezwG3vvKvoRdV8IA5GBj/gs4oWkok57oV0tLMSN+i
	ckOG+4G9BbVHrCawoTDAk5tmSfQFC6UtNSbZ/TnvmbLF8J2X6GgAUuILuRO/nLOQFyGpGCJYrp+Ir
	zWLtiGhZCOGsXjZB8U9lScfbfUm4UwrusZQRQPIrExyWQ1lPh6o6QapIHEQXmovwmZZ595D6uO0ZJ
	kIkWn9Y7/u/4be7YcyOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j12gc-0001Y7-Hj; Mon, 10 Feb 2020 06:36:50 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j12gF-00017a-Ao
 for linux-mediatek@lists.infradead.org; Mon, 10 Feb 2020 06:36:28 +0000
Received: by mail-pl1-x642.google.com with SMTP id c23so2420540plz.4
 for <linux-mediatek@lists.infradead.org>; Sun, 09 Feb 2020 22:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8M/+JKdLoe27r1QkgI6hunqV9+SJ7vAk/tNBmFTl07w=;
 b=nIERl2yuhbzfok1YLM6oHhmpJYGu5YzjLocGeIhR2aXGpa0Rzpm2/6PhHvWz5i39zN
 Nf3rkaul93gk4B4Pg34rzr0xC0GvJuPsC0o3imF5nlMLYDU3Rp6+dRa1Ot/kj6pEvNd3
 6vCTh//IQi/I4sv72O3ZB5bWxCFwuw161MP8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8M/+JKdLoe27r1QkgI6hunqV9+SJ7vAk/tNBmFTl07w=;
 b=uWSlcvj+1IsK7LHN60PV+ryoR6/Bf0zRDKEfpU76le0V1XIfDHCmbNEhthO639f5U+
 j4mDAXARp7jJx3hs9rNiyP+xGNKNXGENLTz8QEEf+hnYNMnNVU/gd6vT6Se5F9xOkaEv
 G7Lp0mbL4+zi5IJxazYe/cgB6Xg8ScD5fnIc5kcfaDA6w90xR3RLQ7QUd0hmnMDWjhtV
 2ZbrjlDtrR2/LDbCHXqzHq4QEqCC5yNdXsnEwX8wlJM8/Oz7Hu/enFrTqGe8v+DtnOC1
 6mmagW7sDMn+UuQwTpMk63YRwiAbRYhlF5ZluxBkS/AAI1u6rlj8zGbF6c6C/sl7d1bK
 aZSQ==
X-Gm-Message-State: APjAAAW6fprT/fznaViWdAUuSTMr6hBkSye4hOepq4SNWkRC2pLywUhs
 juhTkx7MO7eSGksZgPoYAcbs/g==
X-Google-Smtp-Source: APXvYqzeU6ktZruV6307EOPnFu0S/auGICxWezFUqXXV4L/USf6GdEp0kwPmRlzuszsyR45ZVgnnrQ==
X-Received: by 2002:a17:902:7797:: with SMTP id
 o23mr10818758pll.298.1581316586487; 
 Sun, 09 Feb 2020 22:36:26 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id f15sm11070041pgj.30.2020.02.09.22.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Feb 2020 22:36:26 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 2/5] arm64: dts: mt8173: add uart aliases
Date: Mon, 10 Feb 2020 14:35:21 +0800
Message-Id: <20200210063523.133333-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.25.0.225.g125e21ebc7-goog
In-Reply-To: <20200210063523.133333-1-hsinyi@chromium.org>
References: <20200210063523.133333-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200209_223627_397713_02CCDC8F 
X-CRM114-Status: UNSURE (   8.06  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, linux-kernel@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add serial as uart aliases in mt8173.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 8b4e806d5119..790cd64aa447 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -50,6 +50,10 @@ aliases {
 		mdp_wdma0 = &mdp_wdma0;
 		mdp_wrot0 = &mdp_wrot0;
 		mdp_wrot1 = &mdp_wrot1;
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
 	};
 
 	cluster0_opp: opp_table0 {
-- 
2.25.0.225.g125e21ebc7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
