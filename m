Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E397EC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 01:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xM57jD3fRmCbS1XbxyoE71rQoQKI/Y1OhUjPEqjbJaQ=; b=thOS8kbUDssC/y4av/88ugfw8J
	TblQDkqPvx1YNiXosEkO6VcqWDEhFI5O7JqDvgxSQnKLkw14DXIdMMgwzvAVrSZMHnbF0BeiIlWJ6
	76/FIAGwW77jRTXB9dSHsAQ45Gzgi9oVPE5GcW359xnvpyaJNYiPYerbN7qZyQzqgU8HEUWEVcnTv
	MngruvEg0zv5vCGcuk+c0c76zl69LaXcWVP3hxu98ssXj0rJQqdA6/MZsplSjbta0LimXCZ3KjWWd
	BPFQXBNaUAN5Dd4euUyGy4xiZ5FXaUmbn3meKztu7096ujh3KXyvt921bmf5rxa/1cKvpsNu5Vh2L
	xOhsdDSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oww29-008JmR-Qa; Mon, 21 Nov 2022 01:55:41 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oww1m-008JN9-3R
	for linux-mediatek@lists.infradead.org; Mon, 21 Nov 2022 01:55:22 +0000
Received: by mail-ej1-x630.google.com with SMTP id gv23so25378314ejb.3
        for <linux-mediatek@lists.infradead.org>; Sun, 20 Nov 2022 17:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xM57jD3fRmCbS1XbxyoE71rQoQKI/Y1OhUjPEqjbJaQ=;
        b=3rYtqJtpfY1XBXHoPLhTx3RiVugMlkxe2v0zLw+nO9vnH8cUX3asUyAhkE6D6kmyWp
         drp2dTjwucgyTm8PVVJKpZOAK4nmKSkn3I7Ce4MIMuMc7FoBHHr5ThR4SgcoTI/tcs+K
         mic2r4ZLP7zKFSiz2L82z2/h3d/+OPoq6hhfDgDRTV3PFijIaosqnfdrf3a4Hpb3U51m
         qIYnhMr+qt8OsabDdSfGTG4yn2424+HAC0jedas2Oqqxs9gxAfWHgFyBRRLSanIq2yoF
         6JqOquRZzkLbVyM43ujFG7ZLMT0dfSznja6PgL9m4+B4WiTiazbf84x3UEcMlexyEezE
         rLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xM57jD3fRmCbS1XbxyoE71rQoQKI/Y1OhUjPEqjbJaQ=;
        b=cMj86iV2n1FQxMhIq7qUwjdAdzrK+KPw3eI3S/AjeOmupeANdwA92ImNMY/MjTAjFp
         pRFu0VWGLafyO6a4wKjC/tSkmX9e/CWK6jiOKUiwRWmjt9XQWiax3GWUFQmGvTUrojcp
         nle7yNy/Epbm/d/sFRm4AErWjfX09CtCtSLpP4n3UGZI5mXQscY5QWWqn4i33iyJvbm0
         MxYddQIsAhwerhS877zCsaYPKS/LEHPdj1EOioO8bBn39W2cCGnX99z3lpGYwsbxHAKb
         ocCIr9NmfsgAYMe0UCaadVN2w2STFQ652bTBr33Wz/j96b99hLv2TBJxwetWfdfIcqfC
         czQg==
X-Gm-Message-State: ANoB5plMEuO7U+WwF7Xio1sw5R0W2k7+fHRFvXKhKihpJywUIVor/oM6
	WF5dzMukWtAirohzDgLUkw4w8w==
X-Google-Smtp-Source: AA0mqf6mpu5fXTEu5fclo9wzEMbRjLzOsiLY/jkrU0nKWzcU/tMWIGWZKzPzHzrd36r6DW0ahsh3lQ==
X-Received: by 2002:a17:907:d042:b0:78c:c893:1965 with SMTP id vb2-20020a170907d04200b0078cc8931965mr13152538ejc.247.1668995709816;
        Sun, 20 Nov 2022 17:55:09 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id g2-20020a170906538200b00782e3cf7277sm4415513ejo.120.2022.11.20.17.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 17:55:09 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski@linaro.org,
	khilman@baylibre.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	matthias.bgg@gmail.com
Subject: [PATCH 4/9] dt-bindings: pinctrl: st,stm32: Don't list pins-are-numbered as required
Date: Mon, 21 Nov 2022 02:54:46 +0100
Message-Id: <20221121015451.2471196-5-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221121015451.2471196-1-bero@baylibre.com>
References: <20221121015451.2471196-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_175518_317074_47809A26 
X-CRM114-Status: UNSURE (   8.07  )
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

Don't list the pins-are-numbered property as required

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
---
 Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index 9d59208d83c18..7c08d362132a4 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -206,7 +206,6 @@ required:
   - '#address-cells'
   - '#size-cells'
   - ranges
-  - pins-are-numbered
 
 additionalProperties: false
 
-- 
2.38.1


