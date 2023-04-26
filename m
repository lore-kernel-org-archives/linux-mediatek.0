Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E2BC77B78
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Apr 2023 09:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uvPQ+p6p7LPXccnkrXRgDzY3F78Ex853x9Swf3yMEqY=; b=FzY73mRvgWV459
	ohVP/g0ApOdk5yVRjYaU0pPIUrhqNjVtnlrEhA16b5R9+kBKCYM8AuFM3uer6h+H4sUWG3dktUL7z
	bfrXs/DdiH79ZJFsbdwpzfb7tTzy9i30Usa2mhazAQQEN4ahlm2oVZmg/A9IN4JUT2HYj6ZfEFDTR
	HoW/I1wohC7iqvonGl9BEq5bvbsz08msKWGWUaEqf3oYnAi50J/X0hB2HbqHbYy6C5zSfbgq6uM7M
	scLxav+2apdKbPoCrbpZQ+xi/a60Jp5E+d+rqkJP92zoqkCK9Y0wytGGY3rxwFGQYn6CO67PItOWC
	Q2C5bLuTWnEr+Ga2RA6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prbWv-003K5k-1A;
	Wed, 26 Apr 2023 09:33:41 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prbWs-003K3s-31
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Apr 2023 09:33:40 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-517bb01bac9so4929182a12.0
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Apr 2023 02:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682501618; x=1685093618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uvPQ+p6p7LPXccnkrXRgDzY3F78Ex853x9Swf3yMEqY=;
        b=UN9smnlgDaW5ESWDJZoeDD7OlyBxrsIf28fmOhRxgm4lMwF6p8cR8ZIYRXZbuDIspr
         YybIhG7VpOorRriLB+GvVyUHM/p1Hb6FjJ+OLjzchNz19jZmWkbZgywjgs17uqCMeIlf
         fA4mCMYzACCi0X1GaK4qaVvMvfnlCYLoP87mI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682501618; x=1685093618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uvPQ+p6p7LPXccnkrXRgDzY3F78Ex853x9Swf3yMEqY=;
        b=NXcduKlRHvbOaeaYicvUaPTXmPi18vxEJFkcGq2k+i/O8ZuLrQbAIJs/dhWlV2BTJR
         /2wwe5nSm4RHAB6zH75NGhL9Mo8rlUT1P4cOwVPj2bQDEa41ErrIZBWKvRKMsV2i46aM
         k5wwlAoXrbvvAMstuWgS8Kub0EHHP7T1Djehrv6aIW1n+mJH/luOkdLSC9u6UArO/OQ7
         IiIDGOUsxpsS8bPECqW4I7lzTE2ujDT+7gil+niA7wAdvU/yh8X1SXdKPbDMMOazkJWI
         xeVCG3H+vYxZiKSb0KbPeT4rEDNHmrMUNYQyz7nEwV59kL2bH/48dCv2FRsvNfGJcpCD
         ykvw==
X-Gm-Message-State: AAQBX9dinehoqjeI5Q+1NvhwbpGbi1KsivsO3QEG0jD15Dh7tJTax0ag
	Q72VPaE12yX5sz3F5oyieG8cSaOT+ZFScTMGkcs=
X-Google-Smtp-Source: AKy350YjtwjO/wAtSJ0FYazTCI27tdYfzjYulYfZEnuLWJzP+p7+c5W5QWYGIc03oOV+EW2KT9YN/g==
X-Received: by 2002:a05:6a20:7350:b0:f2:745a:b87e with SMTP id v16-20020a056a20735000b000f2745ab87emr22849547pzc.12.1682501617975;
        Wed, 26 Apr 2023 02:33:37 -0700 (PDT)
Received: from fshao-glinux.tpe.corp.google.com ([2401:fa00:1:10:dcf6:797f:140d:6d])
        by smtp.gmail.com with ESMTPSA id g1-20020a056a00078100b005810c4286d6sm10730075pfu.0.2023.04.26.02.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 02:33:37 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Jeff LaBundy <jeff@labundy.com>,
	Douglas Anderson <dianders@chromium.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: input: goodix: Add "goodix,no-reset-during-suspend" property
Date: Wed, 26 Apr 2023 17:32:29 +0800
Message-ID: <20230426093231.1466984-2-fshao@chromium.org>
X-Mailer: git-send-email 2.40.1.495.gc816e09b53d-goog
In-Reply-To: <20230426093231.1466984-1-fshao@chromium.org>
References: <20230426093231.1466984-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_023338_973189_AEB89DF5 
X-CRM114-Status: GOOD (  12.77  )
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


