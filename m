Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F567C7618E
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Apr 2023 14:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LMx52XrqJI/lkSS1akmRczc5aEbg1BtnIjYD6cH52u8=; b=22piwVrOWoJjq3
	oGS2wiKgM0j1w927Wk3CeUU3OEULYd4+tufMNNVmqMBywugEcB6Hcy2SFWxfrstDHniqyO+4JB3h9
	kh7F1/s8O0qqKVRwHjrfbtghsEKIM4d1K59BRZor3i43O8/00qYI6/fAb0S1bZcO2zCkaGtE6ywpI
	7DXCpkdViRx+seUQHWZ7jZx4idy4JhlzMVHMRUI5s70JUOXZCZGCnC4y3L4IcI1zIYOXS7ONAFK8w
	0mRTsvAe7SHqi/tZoU4cXqBJWIDPXq9goFkSaMwjSwrxc9aJiJfaSmI0v8U/XJK/JrNm8NL/xtOWL
	HOxEH1zmYPMjXnBWl/MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prgNy-004EaF-1R;
	Wed, 26 Apr 2023 14:44:46 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prgNw-004EYv-0m
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Apr 2023 14:44:45 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-63b7588005fso6022601b3a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Apr 2023 07:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682520281; x=1685112281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LMx52XrqJI/lkSS1akmRczc5aEbg1BtnIjYD6cH52u8=;
        b=F91dapaZh/JVWjuQtDJodQztlL98yiEx4kYIDCxP4Mk0I/lkQ2G5L4dBr6bLELESx/
         vvHmStLQPZXLg8Ifj2mb3/SVQJ5Y/ZlwxynDVlrhes5pGa97XuaU5Lw8uQ71dccoS4YT
         SB5JXG7eTFanP0Dzp+JpYeLIwiaFta1xOhPAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682520281; x=1685112281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LMx52XrqJI/lkSS1akmRczc5aEbg1BtnIjYD6cH52u8=;
        b=Brd+awHRB0o0RmTHi4DIKLHELt+ZSEUn9EBcVuKou35xSNFUnBrSViUn1JuzwnSQfK
         ipKFQzuNt1LENqlyWYtwuqw+flKov4kHjwXEFZ6L7m90SEzP1ON+5wHxcQyWGGZ1kX2x
         2wF+B4YLAIXHnTVNUXhfPiDPa0xZ88+KP10ib6dT6OHIt0FVoE8utikge8RPQNpeQla1
         ks7mdxLYgXeTkPAIHepK/0Wm1K2FHh+zkqD8zNDVu7yr9vyr0VZzKotghRdLGK2ymrbs
         XmOvqVQLgcLMqcXLNhXbFhAehq7zAjs5tlGQjOIbWeRVbKpSGJhRJHUM3k926Xin5I7j
         7qxg==
X-Gm-Message-State: AAQBX9eeF087L2HAmRfrVtkoGKFKLAHJWJKKxDAc2qwhSXY906bZGbq3
	Ri4HnAZ4FdUiqb9Rjh5zO3GG2g==
X-Google-Smtp-Source: AKy350YHKPdB0cD+iLdEEgdjKOEmIZB2krvhGetLkbFmx30LTATpiGYRXuiXoO70s1nsDAjFe3+khA==
X-Received: by 2002:a05:6a21:6d96:b0:f4:3934:96b0 with SMTP id wl22-20020a056a216d9600b000f4393496b0mr15771936pzb.37.1682520281201;
        Wed, 26 Apr 2023 07:44:41 -0700 (PDT)
Received: from fshao-glinux.tpe.corp.google.com ([2401:fa00:1:10:dcf6:797f:140d:6d])
        by smtp.gmail.com with ESMTPSA id f17-20020a631011000000b00502f20aa4desm8750495pgl.70.2023.04.26.07.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 07:44:40 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Jeff LaBundy <jeff@labundy.com>,
	Douglas Anderson <dianders@chromium.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 1/2] dt-bindings: input: goodix: Add "goodix,no-reset-during-suspend" property
Date: Wed, 26 Apr 2023 22:44:21 +0800
Message-ID: <20230426144423.2820826-2-fshao@chromium.org>
X-Mailer: git-send-email 2.40.1.495.gc816e09b53d-goog
In-Reply-To: <20230426144423.2820826-1-fshao@chromium.org>
References: <20230426144423.2820826-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_074444_279131_CCF19AFC 
X-CRM114-Status: GOOD (  12.67  )
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
Cc: devicetree@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org, linux-mediatek <linux-mediatek@lists.infradead.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-input@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

We observed that on Chromebook device Steelix, if Goodix GT7375P
touchscreen is powered in suspend (because, for example, it connects to
an always-on regulator) and with the reset GPIO asserted, it will
introduce about 14mW power leakage.

To address that, we add this property to skip reset during suspend.
If it's set, the driver will stop asserting the reset GPIO during
power-down. Refer to the comments in the driver for details.

Signed-off-by: Fei Shao <fshao@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---

(no changes since v2)

Changes in v2:
- Use a more accurate property name and with "goodix," prefix.

 .../devicetree/bindings/input/goodix,gt7375p.yaml        | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
index ce18d7dadae2..1edad1da1196 100644
--- a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
+++ b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
@@ -43,6 +43,15 @@ properties:
       itself as long as it allows the main board to make signals compatible
       with what the touchscreen is expecting for its IO rails.
 
+  goodix,no-reset-during-suspend:
+    description:
+      Set this to true to enforce the driver to not assert the reset GPIO
+      during suspend.
+      Due to potential touchscreen hardware flaw, back-powering could happen in
+      suspend if the power supply is on and with active-low reset GPIO asserted.
+      This property is used to avoid the back-powering issue.
+    type: boolean
+
 required:
   - compatible
   - reg
-- 
2.40.1.495.gc816e09b53d-goog


