Return-Path: <SRS0=QSA9=JM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC272C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 09:36:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 430476113B
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 09:36:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 430476113B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ycBDLPd8/+D9duJ8bd97p1ZDP71k8pB1+DSqKsAidmo=; b=NiicpH879fyctGfs0I5ivQagT
	vn1AdueUmsG4IkjV+einE1IKxihai5CdGLQR+2CzSof+cX2T6K4zqUjJe0wA0m8Mo+08cn5Z8tupw
	EWfZQoTAu9MTmTEDQXiiyjUPmEEymqtTlELf97qC6kkAB391YbTvy2xOaJtidjOGKTSxRMcs/y/zF
	6Kn0LJBY/hCpZJSrJQJccNEm8Dk/iiHIHP2BPVsFBzfqpERyet+XWz7uXsaW5H3LJkZ0i5Po0Hh7Y
	aju1q0LyXMjkpUE3vKwExlovmjvn8CzZVFzuYbPnAcA+6QK+82SfyifFQobnzRWbMOi55H2+zSIQI
	gLzA9/g8Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWyPm-00FXmv-R2; Thu, 15 Apr 2021 09:35:59 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWyPL-00FXh6-5e
 for linux-mediatek@desiato.infradead.org; Thu, 15 Apr 2021 09:35:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=GpOIwB42K+ICb34QKJMXC/ca1T6tE7+UPtJ239iO6pc=; b=qiltDcbmb/R5VRRFW3as1OPMjY
 kE0I6Vvmr/JTuMvUyO1i3JZaQVFKwJ9fZveDK2ZjitmyXOFbePlfYZKTohzZttqFgs2fhErgNB4Kl
 1xP/KpbbU0cqmtl5mDAMBsWvL1S7exTFVnZKrW5Cd+LdLgLnSXtj/unSjTb5l1yoUdyESXPlWh/Lb
 AChhuE6Mi8YQpY3e/bsJGtJ9n13qrLmAYskw1ar1rz8M3QwVH5Yni4P3h0yFp3KHBH6SIKpcgzyS2
 b4nNI+NvYgI50sX7MXHLvsvNoLLZ/OYt3JG86rNcwM8GYa9tyBs5H5kanQZ+NbQVgD7fGTOmUWERR
 infJQgbg==;
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWyPI-008QiD-Pb
 for linux-mediatek@lists.infradead.org; Thu, 15 Apr 2021 09:35:29 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 q14-20020a17090a430eb02901503aaee02bso1316389pjg.3
 for <linux-mediatek@lists.infradead.org>; Thu, 15 Apr 2021 02:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GpOIwB42K+ICb34QKJMXC/ca1T6tE7+UPtJ239iO6pc=;
 b=DGMgre8U5XYVjEl3VMNY8n9k/vakOsTgxx9UAilFaEASk0ZeIXDsXLq9hcdPhvvCcc
 zMsyMixuH85ShdD5/15Nu5g4Q3E8ZauEWeVrkP85+4dHcwGdEO67baeDRY4xg24gWnNo
 Omie+dya1YE7oYzQLghRFfJVrLh2UYEmfZ1kc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GpOIwB42K+ICb34QKJMXC/ca1T6tE7+UPtJ239iO6pc=;
 b=cffUIzsLOGgjRgIDfP4TJxPQjur0TYbsiER0gfIflKsQhgYTGc/5+YMWDpI84KwZKo
 rO17SfcgG+SiHTA4Jyhd+IZFQvPLQdGsd18cR6hta99Ra0CnQ+vaM4guXpV0LhrBa5hp
 hyI1QelGDYmZQ5vrmTBqZq78Z9snpIyfFH8QX8ALKRsCIvd7bBNUJQhY9UyWZiLTbgZV
 OdwHdyErTIxS6sDntaF8KXWyhJ9HHT+Ecji+NPZWgNoHFFBbQsPK0AwssT3HTOo7qa+M
 qGr//ShAJkMBoLGgfgPGpi2YLd1+cO0h1zKSKyM04yRnBrSOb2+xH2ZtFVtddgnZ2QxZ
 cOow==
X-Gm-Message-State: AOAM53027R9HJYREywiU8uJlFqJwhIhAC6lUeXU07mBals9LSvjqHmic
 GYfN8umqnWatXjp3aiiQrGJmYA==
X-Google-Smtp-Source: ABdhPJwq+7XXYy5bKjqDWNELX/hcIJTFwRnyNQbFxJzwdAHq0mhsJ+82CTHUOOgKS7Sai/n/AvYHvA==
X-Received: by 2002:a17:902:9307:b029:ea:e588:10a with SMTP id
 bc7-20020a1709029307b02900eae588010amr2983172plb.7.1618479328206; 
 Thu, 15 Apr 2021 02:35:28 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:6432:a6cb:91d2:5e32])
 by smtp.gmail.com with ESMTPSA id a13sm1849502pgm.43.2021.04.15.02.35.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 02:35:27 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Ben Ho <Ben.Ho@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH 3/8] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-burnet
Date: Thu, 15 Apr 2021 17:35:14 +0800
Message-Id: <20210415093519.1920877-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
In-Reply-To: <20210415093519.1920877-1-hsinyi@chromium.org>
References: <20210415093519.1920877-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_023528_855104_6E60A9DB 
X-CRM114-Status: UNSURE (   9.11  )
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

Burnet is known as HP Chromebook x360 11MK G3 EE.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 96c401597bd8..0870490aa350 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -122,6 +122,10 @@ properties:
           - enum:
               - mediatek,mt8195-evb
           - const: mediatek,mt8195
+      - description: Google Burnet (HP Chromebook x360 11MK G3 EE)
+        items:
+          - const: google,burnet
+          - const: mediatek,mt8183
       - description: Google Krane (Lenovo IdeaPad Duet, 10e,...)
         items:
           - enum:
-- 
2.31.1.295.g9ea45b61b8-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
