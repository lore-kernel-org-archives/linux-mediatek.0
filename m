Return-Path: <SRS0=ZvcN=NH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F932C432BE
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 10:01:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29E0261BB4
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 10:01:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 29E0261BB4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mT6X0JAQaccRgRvarhsFWLBAQCnJwekkkvvaYRKXvBA=; b=B0rELoH2LEHyLl
	rGAZRMGL/p5JMZ2q7nt0KIZu0x53JdXE8fWf8PKamTshaiBwzgdJ0NYsd8c+TuAz/poAjfziDtKcB
	AB05Atpk1nSuVmenWHiA7zYG3elEfHyX6q7ERk/VS1Fyd86ud3C1plhSWk01SMJydly6u6zdheFpQ
	SZi5edSO7BcwciiDnHVrhJuoMSHaSVMkmKYPmrVL+AtATKFRoznIacIl+sxVzue/7mNPz7ikVHLjf
	BjWpq9+IkVDDl19y5pgv9bneIxInhDn90XgZDjvGDZogxi+fegs5quTtWjM8QNGTTwJUFfO1QOYJq
	5VGxUWORuQztDJVUccuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFZQk-00GeWN-GD; Mon, 16 Aug 2021 10:01:18 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFZPr-00GeCk-Kv
 for linux-mediatek@lists.infradead.org; Mon, 16 Aug 2021 10:00:28 +0000
Received: by mail-wr1-x42c.google.com with SMTP id r7so22810328wrs.0
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Aug 2021 03:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tBoxvVvKIO10DrkILesFRlS9T4rPMo1Wo6Rp+HkgNL8=;
 b=mwgWYYs3jhmzNTP1frncbH6jlYFn9yJQQpdyFyVM8aZ0f2G7n5pp4gSLBu7LmbXMAQ
 3ixzhmwfkj2iqmwBLT+o4/5zI4u3u3ovhgHymcpssfM2FXx0gXlIHvDfLVj2eHu/hmwk
 a2dC4qaiCqF0Xn/iTSro0LnJ8WzaWff+BrNB/is7hg50sU237irbHGHwWGpGn1TG7i1n
 /a05fMWkl/yAgpEHhMw/j2U1LK3NtTiR1iaOXd3nqgmO9t3b68wkW6PRY8PM7zjibzrn
 s7yteN36gusb23G9BcxERhrmJmB/nv/D3BGoqLy0WX2pgVg2k8rT5BbmniGqCkE/Ge9U
 wcKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tBoxvVvKIO10DrkILesFRlS9T4rPMo1Wo6Rp+HkgNL8=;
 b=eoFFNzio9j+jPhbpRsdN26BfMAbGY0mPXj5KVZ66Yn2gdy/8/tlXLOlvFsyuvpOG4j
 Rc3o1WomSvIDI/6o2NtwEp9+dqazIKaUuCfKcxWEK++8pEBolXjX+G4quL9/qblTh2Y7
 WC9JddQJkj/O0nU1l0UDohWDKD7HsalT8TZNjZxx7wyyMldvMl7ZWIaYFwFGVWI2K0+Y
 L1p+g+O/hqIuxmsk7pUD/h8PEvvD3yo5OxCgXaLueOcPhOYYSEeU4HD2YVSsj6aeKc/r
 v3oSuKCmzxBiQyzJr46TyzFfUR6Wrf3pUMikl54gD5tKlRLDdbqklgYqgfkoRznO0EC3
 wudQ==
X-Gm-Message-State: AOAM531jAL/LTCleKctg70siOpPCeWB5eVtejZMdlSVIzhwRXZHL2RKA
 km3zGEA7ynD8cDtlcTVtoE5v8w==
X-Google-Smtp-Source: ABdhPJyYrhUAaACuFODtSBZtIZlyvpK9x1xyyBxkLAEbEhAK4IaQ2YxU2/fK0vVgFlBvSAk9ahkggQ==
X-Received: by 2002:adf:db07:: with SMTP id s7mr18139499wri.106.1629108018662; 
 Mon, 16 Aug 2021 03:00:18 -0700 (PDT)
Received: from groot.home ([2a01:cb19:826e:8e00:92b1:d3c2:1204:85e2])
 by smtp.gmail.com with ESMTPSA id u10sm1916645wrt.14.2021.08.16.03.00.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 03:00:18 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Fabien Parent <fparent@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Rob Herring <robh@kernel.org>
Subject: [PATCH RESEND v3 2/4] dt-bindings: input: mtk-pmic-keys: add MT6358
 binding definition
Date: Mon, 16 Aug 2021 12:00:11 +0200
Message-Id: <20210816100013.100412-3-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210816100013.100412-1-mkorpershoek@baylibre.com>
References: <20210816100013.100412-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_030023_711034_371AAC1A 
X-CRM114-Status: GOOD (  11.72  )
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

Add the binding documentation of the mtk-pmic-keys for the MT6358 PMICs.

MT6358 is a little different since it used separate IRQs for the
release key (_r) event

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/input/mtk-pmic-keys.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
index 535d92885372..9d00f2a8e13a 100644
--- a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
+++ b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
@@ -9,7 +9,10 @@ For MT6397/MT6323 MFD bindings see:
 Documentation/devicetree/bindings/mfd/mt6397.txt
 
 Required properties:
-- compatible: "mediatek,mt6397-keys" or "mediatek,mt6323-keys"
+- compatible: Should be one of:
+	- "mediatek,mt6397-keys"
+	- "mediatek,mt6323-keys"
+	- "mediatek,mt6358-keys"
 - linux,keycodes: See Documentation/devicetree/bindings/input/input.yaml
 
 Optional Properties:
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
