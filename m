Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE85EC10DC1
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Dec 2023 07:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wu4WrQC62p9kUCUz6OnbUntEhdQYwvAf3l0CssAK7JA=; b=faREmj0qyZV0ROXMQ2tVpbNxHt
	bTs1BdEXzOHeVVeHhtq4cVXZxKdMPwdqAeQ/43exFF32NSHZ1daiPbb/P58B2eWjkCCvwgBVQHrTG
	YlfBsSg5c7YSzb9iAbKgfVR1+vFJL6CRTRhodq+zH1tpqkfC9/KTils9OvhbmN3H0nNasQuUGyecw
	xCiFW0FmNTWxWgo2qroik8g4PWVTpb0v9j8njJG2r9lhDqFuQF9Zn2ru6eKb8wzFi3+pSscwcrhbT
	iM2xuL1yNgaOcXN+AXfYUWWQA7AsrDFdFxKb3YGI8a6CVKegWLWHJbjtq+D4ZTgZjG/IAPxO8j5qb
	kkV9y76g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8xd4-00Cqe4-27;
	Fri, 01 Dec 2023 07:08:02 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8xcl-00CqRx-2h
	for linux-mediatek@lists.infradead.org;
	Fri, 01 Dec 2023 07:07:45 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-5c63bbbd21dso158017a12.2
        for <linux-mediatek@lists.infradead.org>; Thu, 30 Nov 2023 23:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701414463; x=1702019263; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wu4WrQC62p9kUCUz6OnbUntEhdQYwvAf3l0CssAK7JA=;
        b=CaqyUCVjW3pcRF++QaPxjm0VMIXbnPPDlNUkR3vBr6zdDSwCvRpRzyvTlrsHcjkxul
         E8C3livCpfU8eYpBMH7Mirt3TPHg5hbbxg+l1N2DutskovzEoS7lPlpYLzSMex2gPvkT
         s28RbEjrEYqIAXWaM7H15V6P/XfNsG9UF/ABw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701414463; x=1702019263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wu4WrQC62p9kUCUz6OnbUntEhdQYwvAf3l0CssAK7JA=;
        b=j/VD/D+FWJ4xuo3NuhVUHoclEuIw4F/B6Hm/YjqYqBZbvjGOTuoaKI1PLrr+tnaqaK
         dDUHWIvJUjPlCjNVJJT6oXRZBQuwU0C+H993nlnIOUTy6NkG5EGB6BeWQ8/wLGUK5AhZ
         f28D0EBrtDudk5gNpXcjojJYhnOgCqKr5DiM909mmnF7G01jQyJEJtetRTXn8aQQoRHY
         Nh61aXCxGpVLKqJcDXY/gWAihkEdZbMGFHyT9I0XV3uyxO5jnC+ernLGIg1krqwimyw0
         yPzhEYn4ReY4tYDFTUX9NZfSQ1BCTAvtWIut333oOD1G246lVU5Dso5+nZNdsmhdYVZ6
         90YQ==
X-Gm-Message-State: AOJu0YxXzZbab3lFtzI8Ci/vukIu5FVvoreA7leqr4xZQ6IIzlmzj0jf
	kr0nzvrJfvXrbLpHIRHreGBOzQ==
X-Google-Smtp-Source: AGHT+IHuC2XOMcvUa6guDnbfMxkbtrmd0uvpo69WLURwN+EEHQyuU3bS/3XZkBo3D08ftm4E7KpHWw==
X-Received: by 2002:a17:90b:1644:b0:285:8a70:b557 with SMTP id il4-20020a17090b164400b002858a70b557mr24011996pjb.31.1701414462795;
        Thu, 30 Nov 2023 23:07:42 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:720a:d435:c253:2402])
        by smtp.gmail.com with ESMTPSA id y10-20020a1709027c8a00b001cfa0c04553sm2558684pll.116.2023.11.30.23.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 23:07:42 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/9] dt-bindings: arm: mediatek: Add MT8186 Steelix Chromebook
Date: Fri,  1 Dec 2023 15:07:07 +0800
Message-ID: <20231201070719.1229447-4-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231201070719.1229447-1-wenst@chromium.org>
References: <20231201070719.1229447-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_230743_875984_5929253E 
X-CRM114-Status: UNSURE (   8.80  )
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

Add an entry for the MT8186 based Steelix Chromebook, also known as the
Lenovo 300e Yoga Chromebook Gen 4.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- none

 Documentation/devicetree/bindings/arm/mediatek.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 709a1292bca7..95d2b430ab17 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -206,6 +206,13 @@ properties:
           - enum:
               - mediatek,mt8183-pumpkin
           - const: mediatek,mt8183
+      - description: Google Steelix (Lenovo 300e Yoga Chromebook Gen 4)
+        items:
+          - enum:
+              - google,steelix-sku131072
+              - google,steelix-sku131073
+          - const: google,steelix
+          - const: mediatek,mt8186
       - description: Google Tentacruel (ASUS Chromebook CM14 Flip CM1402F)
         items:
           - const: google,tentacruel-sku262147
-- 
2.43.0.rc2.451.g8631bc7472-goog


