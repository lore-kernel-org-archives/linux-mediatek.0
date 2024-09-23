Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E452CF9C70
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Sep 2024 14:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ah1pOvFlUWHq7/p7TdIR1C+iDmXhaSnb5086tRuytuw=; b=VdIhK5BqGVO9mhlqMHbuzdBrnh
	WWj2ZwmqEg/BvScG9Vvdg4gL5omg0KUuniamHYpJ8uds1p4sPTzblN3Xa6VUJv2Wp2Gjq20Mb7sIs
	n7BrAXpkJjWnj31axuNoeg4z7cNv4LUj0UJzZzLuvPVC8PUkeXWRkKdM6+5YQd4JR4zn/+2ilqqr/
	a36U36Xulp3m+PJjCJWZxYKB0FNe9nsrzu4S3ytjRhlRD7RAOfCWdA6LvLhwlBkaykVzaI5b5rWlX
	WSpTi4IjSushZHrL4AWC/KnrVx5IQqUJ3EmBcyQp9wVlyd3I4a1At2QDL0vQN+8XVSLG9l8i2K1UA
	stLIC2iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sskLm-0000000HPXI-1nrS;
	Mon, 23 Sep 2024 14:47:42 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sskLj-0000000HPWd-1E7F
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Sep 2024 14:47:40 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-718d91eef2eso2815928b3a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Sep 2024 07:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=compal-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1727102858; x=1727707658; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ah1pOvFlUWHq7/p7TdIR1C+iDmXhaSnb5086tRuytuw=;
        b=fzE+nJSRWJmTWnANquoFhLe7hfFhknqe6Ut+/1IcMIDRHFKjvYr5hDZbOpKXhOTwg1
         MpJPP7JXSNxvv4HArt2DpI/sN6qeEuH2DMZdXbkBj6MVmwjbnrjMwabZz9fdpfmATYOw
         AuyLaT6AbQvgjUl/rotVYMdUIK9hvFN14AzEnhcbFW+wYJxQYlj3pJwH36jkaQAaGN8w
         3VP6sVQOrf3JQMKH8mvYlbn3mf1c6Qb2LYWTYkq8mfFi6sl18xluGBHxq4mjvuKOmD0B
         VWuQCfjWaN84VOAVncPlHm0BN8cqaowW7+bjV/hfHSkPQKHh0r1L5Scmjz6PCcoZVyQq
         PYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727102858; x=1727707658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ah1pOvFlUWHq7/p7TdIR1C+iDmXhaSnb5086tRuytuw=;
        b=wHQsYkMQ48Y0JWBmCSU33Ob+e5DkU3ZpIa1ou+bNnUjapWs4ecAq+8CKXpYuPwjX4I
         X5A8Fc5J2oM9iMXKuPXww96xpLpidi78QOVSVyi074Q6u/X4mmiIZ8FINIdurHVZmvk3
         Svr5c3IJ1MLU0hSNwBn0sjYweE+II0Sq6g8mv55xXZKo9h8dTqUiHHrxML9ipWpNinbc
         r3H9XQu18/YpBPQ/ugPtN50F8bNzMY79bQDAH+GKDb1l4EHXahWlbxhLCgaIf2yqkTij
         ytzmkR8+6mJmSdgUx9BYEM5OkTj8PlewpRARaMAI1Msdrj1df64JChYLhm6QtH7gt2KW
         aEuw==
X-Forwarded-Encrypted: i=1; AJvYcCWpH4Nh66mRlPTsWg00QUCq5oyAwBXxWlF7YCg3ac9M8cH6ojqzrv2AjHLQhxobhi3+W3JhTW8jRByyX/HtfA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxEh2rXrekMPSgNbT1p4MPjJQsI+h6xtzHtn02185s9D6q0rRT
	A27Ymp0kNXYdCf2n3eHrxtLDZ9Ht/y2MioQ/UsUAzvxqEz1uXujsAhVlEOe416c=
X-Google-Smtp-Source: AGHT+IGnzbB8vGG9Sm8T5RN6ljJ6BCzgDbeKgiBqIATXey8B3rBl6Yt3vZdISaSG9UHRAnN3Jn9N7g==
X-Received: by 2002:a05:6a00:4b0d:b0:719:24a3:2a8b with SMTP id d2e1a72fcca58-7199b14832amr16818922b3a.12.1727102858079;
        Mon, 23 Sep 2024 07:47:38 -0700 (PDT)
Received: from maxweng-Latitude-7410.. (2001-b011-6c08-d055-c470-c180-5435-2e25.dynamic-ip6.hinet.net. [2001:b011:6c08:d055:c470:c180:5435:2e25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944a974dcsm13991122b3a.32.2024.09.23.07.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 07:47:37 -0700 (PDT)
From: Max Weng <max_weng@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Cc: max_weng@compal.corp-partner.google.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2] arm64: dts: mediatek: mt8186: add FHCTL node
Date: Mon, 23 Sep 2024 22:47:28 +0800
Message-Id: <20240923144728.870285-1-max_weng@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_074739_622748_DA3947E2 
X-CRM114-Status: UNSURE (   8.42  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: max_weng <max_weng@compal.corp-partner.google.com>

add FHCTL device node for Frequency Hopping and Spread Spectrum clock function.

Change-Id: I7f9f2991978df7d5d3a6a8bc78f6f443f2f0460d
Signed-off-by: Max Weng <max_weng@compal.corp-partner.google.com>
---
 Change frome v1 to v2
 * Modify the commit description
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index 148c332018b0..d3c3c2a40adc 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -29,6 +29,13 @@ aliases {
 		rdma1 = &rdma1;
 	};
 
+	fhctl: fhctl@1000ce00 {
+		compatible = "mediatek,mt8186-fhctl";
+		clocks = <&apmixedsys CLK_APMIXED_TVDPLL>;
+		reg = <0 0x1000ce00 0 0x200>;
+		status = "disabled";
+	};
+
 	cci: cci {
 		compatible = "mediatek,mt8186-cci";
 		clocks = <&mcusys CLK_MCU_ARMPLL_BUS_SEL>,
-- 
2.34.1


