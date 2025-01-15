Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0523FC02180
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jan 2025 21:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RygItKIJJDoEUCzJbxmAIl9MdlXUeeZINpK9kjgMTmo=; b=NbmiwGXWF/fEn1EvPQ/yPN5Te8
	p/5voHFWYFVXZtLySsEZ3PH8sVcBRiObiF/pzC4fBqtFlNmYS6hXqAhUVQUFMeIwgD+kpnrMWZg09
	MW4qx2Yw676qd1wyKj6ajVKEeyjwtHiDHaqqLyx5RV5QhuHVw0hTsW1s/8PiSpcbfjjhfoxfjT9B5
	RVvO0Nj3TKuagQmKJruIplY2LK7ASdWarbNKFvxiFcr7E0qXCNh0jcROxfNhdp4ytYrtY8WqBIvi6
	fmxzdgxgVK5v65flngcVYxfEYVNuzf4Pa2ezYQqsKB9EBBxzlgzFSM37Oz+1VRjsGrgOfrqbAi6xv
	wp9AibyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYAqx-0000000D9Gt-24nO;
	Wed, 15 Jan 2025 21:23:07 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYAm5-0000000D8R9-3ZjS
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Jan 2025 21:18:06 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-436203f1203so112535e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jan 2025 13:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736975884; x=1737580684; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RygItKIJJDoEUCzJbxmAIl9MdlXUeeZINpK9kjgMTmo=;
        b=XOqV/MVZ3yxQD8sRBgB+Ls2gRJoP1Xveqs8IRnUVznlAiVKQh3bTsG2nmdZg46gN+J
         q32nuPM3fWdOG0M4aA3WwMMzMB/qMvJixAguSKNJnOLTnQ25DlHAZFGUQilMSfQtbCIe
         vBf2SYBZsBn9TB9OSg3BotlRP5LPGzzziqeX1vjl/qkapUwI2hEASO9G3I6+uIp/la8Z
         2admhy6WSxFYAWky4Z+M9cTF3+56LNpymY2/oc9r2Ohk9iEW9uPVHgHJRXcZchDX+Sex
         b9dRH/DpJwDhJLe35pz6bzKoynnIy0EOfBBt28bzZlJQXWpJLvdV5vAc4DIAvs7u9U5X
         5dOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736975884; x=1737580684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RygItKIJJDoEUCzJbxmAIl9MdlXUeeZINpK9kjgMTmo=;
        b=oCutwTEFihEWsoQt0ybzqmZQeMpBIyhQ4HxKTkWMN7MCJiCL1yttH7ueWN+ZEFZIP3
         jJ6X8zOmy/qhcewQKt5n84n5bFos8ag4+XLVzBOKOLpGBVMzrJIvk/Nmg5q7yMqyQ4ux
         fa3VbqZUCIur86i7fIjLWTTaJ53UNmxbdlRB4yCq5iDCgbKrGTkpTFRS+XB822clM4DL
         LmN9ua6DK4RPJR8P5JWa0lgZBDe1B8EKzyfvj3UtqtDuX6pEbX0oMnRKUJn0n/q+m/PC
         OSXPSWnxnABfJQoiISit3+SmXCqcQgevbnH9amBSwkrbYYSXtNfelNNI07M06Ji0vAHq
         gI8A==
X-Forwarded-Encrypted: i=1; AJvYcCUlqmedeaaTM7/w8MYlS76+s0rKpVbaNEYis2dlnwvgtNsj2BOEV1ZXZ5CL1zPPT6OQ8geRpaHbYO6JVDrk0w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwfhUXE3gPbSSG8BIumYSa0xaXLmCt8pbw+zKbgz8tfV5tE20li
	KqeW3SrNp51pyTZnLEYSQduTeqQHcD/KCPsBamF5+ytIeYqBlde6eVgCpLQk+Dk=
X-Gm-Gg: ASbGncvrrcso7Wj2zJ5r/tIOn3q9WU0bZkOWWyeHizZEjACzVRDMOC2GBE+a3eoaOo4
	mlOXMjl5dL4nsA5tmZUJ4OVDTPm0tHhHrZltGJgIL+rKiFTHTAjlye8WX+1lClOOFeTMggLXRGY
	HxCo5Wo9AyE3pQXgiU2TBHyEhpQ5g4KBVuIPTIBTyi7lJemLEeCEXqYVZ9iUWGQkt0IlEqE9qvg
	ze1wS/8bc11sycBOqGNEw/mzZu5YfXZloRiA8Lo12J5tooITJCAxtuzsLDpELQJBAxtjgQ=
X-Google-Smtp-Source: AGHT+IGsfOhRu6D0LOsuqf3Qj2pk13pONLIyJ5OgpWh66yJEuII6b5Hg8jLGZocLy0vupG9WNXgWuw==
X-Received: by 2002:a5d:64cd:0:b0:374:ca43:ac00 with SMTP id ffacd0b85a97d-38a872e15f2mr11170817f8f.4.1736975884220;
        Wed, 15 Jan 2025 13:18:04 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38efeesm18992607f8f.62.2025.01.15.13.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 13:18:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: mediatek: mt7622: Align GPIO hog name with bindings
Date: Wed, 15 Jan 2025 22:18:01 +0100
Message-ID: <20250115211801.194247-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_131805_883226_8215144D 
X-CRM114-Status: GOOD (  11.20  )
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

Bindings expect GPIO hog names to end with 'hog' suffix, so correct it
to fix dtbs_check warning:

  mt7622-bananapi-bpi-r64.dtb: asm_sel: $nodename:0: 'asm_sel' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
index d12eac9b3eeb..9f100b18a676 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
@@ -320,7 +320,7 @@ &pio {
 	/* Attention: GPIO 90 is used to switch between PCIe@1,0 and
 	 * SATA functions. i.e. output-high: PCIe, output-low: SATA
 	 */
-	asm_sel {
+	asm-sel-hog {
 		gpio-hog;
 		gpios = <90 GPIO_ACTIVE_HIGH>;
 		output-high;
-- 
2.43.0


