Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79FCEC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Dec 2021 16:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iqDO2yKaWKiUqlkHUEBCad3ew5PiGrgHDUAlhEphrow=; b=nkreJaEpzVvFk/
	gISbjLg6gRwK1PTgMgIKkthLKwQXzRlg512McUtCi4ZyL7oVOxR6YN6vTAbnt31oSYE8sMQs0jKQ+
	ZSKqVJf4/yt0EqMCtV/5iVjr3qosYQbubYL/1lYkLxFIwx9CwPnMX95vMYt60hloTiwsZFPgFcw3k
	J+opQXvIhhnR1E0we9ldRRypZQCv8bETkIoVlSzLMp6QqpizsxfIhlKnMrw32uCUZJEQnqrp/V4CJ
	owy8MTo3Yu9nPSxpeHdeFlADeTmU0Owcmp+9fLyNhTYBuI0BF9sMeoie9cGT50TPoXOeETYq6fozx
	MVd0vDvJZfljh2HAvFwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwoF4-00AcNN-4L; Mon, 13 Dec 2021 16:31:58 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwoCH-00Ab1L-5t
 for linux-mediatek@lists.infradead.org; Mon, 13 Dec 2021 16:29:06 +0000
Received: by mail-pj1-x102d.google.com with SMTP id
 cq22-20020a17090af99600b001a9550a17a5so15037764pjb.2
 for <linux-mediatek@lists.infradead.org>; Mon, 13 Dec 2021 08:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PHDKjEXSmqoSIP+TB1gPedSyi6ETK7cM1nPYeOviVPg=;
 b=EQAL2svOqRuf+zxv1dtfNQpVATmX4LvJABaaH6nUaqH4o7Y/8OZ98vtyTXbksNyosX
 fXP6V85IhR6iuR9Xr/EbWsPCfKTkXPg/Ol15Z0Gzaj5iiWZVK0t2KmoGhYvs1OJERxhK
 Arh1UB83YQSTSDjEhMioiq5l6ZbEbBO9JbBzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PHDKjEXSmqoSIP+TB1gPedSyi6ETK7cM1nPYeOviVPg=;
 b=OvpZCpUhpGj0LR77wiyydVBpbuv2fTMsYiU/tFba9igdwGz8M1AUYwhXBcPbEuwIpG
 1yjyb8ozxS5daj2wwgv76two9tM2Qh75HNxBaOKU6k7BNqRDuG33awoqrcCn5TX6lXWh
 l52XhRspcRH/RHEgxF6ietwJRjiq65LHoN07y4dEf4kscaamSp11s6XzU7vdi0sHOifX
 Ns3EHpPJnBKt4PjUkTqrxjVmfSHaTY3bEPMN1mAH4deqzo6WhB+95jlzI7RuxPWphrhB
 yAYKlw3G0CKUdCsMCEt6p6Ye0aMYzhw1zZwl4ANx58PbV7Xd4ZdqGN7vDRwG5vRvPmj/
 P8EA==
X-Gm-Message-State: AOAM530Qx3OZZ3wrZDcCaz2QaSR5nbqppqSAEiU91bLYl7PcJnSZ8s9T
 SXegdGiTQLsM+7cYNt5exg1TbA==
X-Google-Smtp-Source: ABdhPJx2ld4vBsWFYDkWoQWK3Tn1x1+xO/FN+YYtifgE6j87eHBM9RajAJ4+aWYkEHW6TxBDymzzyg==
X-Received: by 2002:a17:902:c407:b0:142:28fe:668e with SMTP id
 k7-20020a170902c40700b0014228fe668emr96615217plk.31.1639412943778; 
 Mon, 13 Dec 2021 08:29:03 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:9447:edff:ad23:1bfc])
 by smtp.gmail.com with ESMTPSA id mh1sm7803802pjb.6.2021.12.13.08.29.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 08:29:03 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-katsu
Date: Tue, 14 Dec 2021 00:28:55 +0800
Message-Id: <20211213162856.235130-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
In-Reply-To: <20211213162856.235130-1-hsinyi@chromium.org>
References: <20211213162856.235130-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_082905_279289_3DCF7F04 
X-CRM114-Status: UNSURE (   8.14  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Katsu is known as ASUS Chromebook Detachable CZ1.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 723810cffce2e7..75bb06d1802a08 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -175,6 +175,13 @@ properties:
         items:
           - const: google,kappa
           - const: mediatek,mt8183
+      - description: Google Katsu (ASUS Chromebook Detachable CZ1)
+        items:
+          - enum:
+              - google,katsu-sku32
+              - google,katsu-sku38
+          - const: google,katsu
+          - const: mediatek,mt8183
       - description: Google Kodama (Lenovo 10e Chromebook Tablet)
         items:
           - enum:
-- 
2.34.1.173.g76aa8bc2d0-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
