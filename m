Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8F5CC433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 16:41:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B6116115B
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 16:41:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B6116115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=t3AQYQQzQA2NtjtnByMqeeqggC/O5C4wap95tvYrERQ=; b=MnePP7j9LVNu0QEI1NVaX2ieS
	DaGvUvPBmrAkXyxCkZ53TUmcDlhamGHbybJxpQ76SVJYJTCBBXywz5LM/sJ7W/ox8V8hJk5AgeiRG
	pru+ghbfhA+RlmcSz4uLIBN+aP4ELKGIp+ItvRWsI5zibYVsPlNp0QAb7KL4ydRXRIbHMTlpOii0X
	xkO7zr2dFffk5+2oBvLGnZOCB5Q2ZdwW8gOz53XM6oufAmi+glhQvtihN0q4e+9GIFvpvNOIZ+7xG
	dzYZZjp363d0adR9BsI5T2WcaxnCZbdd+uJXzs9SD9LylUaTPSC5IDHiEUFaUM/2GozZyvcVfT+Gs
	jGIV4JDng==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXRXH-002oex-Lz; Fri, 16 Apr 2021 16:41:39 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXRWn-002oa2-GR
 for linux-mediatek@desiato.infradead.org; Fri, 16 Apr 2021 16:41:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=RjMuzngv1Iayt+yUw/uUaDmTQawSHVPlVJmmqgEa6BM=; b=R4oTdsd5rL9Q1nF32fzI8PJqmm
 sV/B0g+yCAYog41DU9PcNc3i0qI+nhQ0r1TbGO92KMpjumbwyccXeYN83RO/QMQ924apbVzrXBE/E
 8ePxgGjpFHK9bHeUjaRR+XlRJ2EKpXrvdCNnxnxZDfo3c/isvV/8TGpK0tbR7yYi8BTV6o7sgZdhw
 C+S6y7BYE9wTbiInu8tAMgiot9LelpSz/AEkCk6AmT6FmqYFto0ugy55PMZO2MDseU66VXl+vyV+H
 YSoi23gO3pP2Kl2BVh9cfouNguyd0KRgs9TWcGYrpoztD2/XRAksJL83PTIFCWZOeZPtNvw2MVmbS
 BhzcNFeQ==;
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXRWg-009Ywm-GW
 for linux-mediatek@lists.infradead.org; Fri, 16 Apr 2021 16:41:08 +0000
Received: by mail-pf1-x435.google.com with SMTP id o123so18707096pfb.4
 for <linux-mediatek@lists.infradead.org>; Fri, 16 Apr 2021 09:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RjMuzngv1Iayt+yUw/uUaDmTQawSHVPlVJmmqgEa6BM=;
 b=g/oXo7zbtAbKKtBtmjhbLUN7uOn6hmel2a9Sf2aNlp/sBskWzN9wdi9eNjek8FlKVr
 pwVm+3HWWd33igpLMA8T3WADtg7x9sWPzE9wJq7c1+/vdhPcYwMIa2NAbC4bCSU6HvSA
 vMSWh5VYPF6GoUyfVUMZEWsQjyBkqzGLwav5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RjMuzngv1Iayt+yUw/uUaDmTQawSHVPlVJmmqgEa6BM=;
 b=M1UxHpf/RP+SJQ6RAi4wWRu+deoxOfEIpYGrP+gQtJATCJk0wgjezZIBvsQUgbjL7N
 UutZy3aOAm7l1y/Bkz33joYP/p6cfXSmPiEDox9jNwvTAqgs9YjRymvPc9932gHTaThK
 kfzByAkRDwn28c2O2p8qCvKGQKfMFgQYlnIdi5TtY8PD1YVYdbYOJLq0E7vxgARL160p
 MdvsWPibrd8SyptuKASDf9LkKX4WCBx/EPqnkxeou+IIFXQ4NWzmNfunFRsYdTZVqm4d
 I8njQdhLDEWTCAU5MKyGPYzK0eZnpwnYq2FdQ4kGJOhWRTI+GoV6Mjj+5/Sai7r3AWVb
 6bvQ==
X-Gm-Message-State: AOAM533Rd8Q6ZTXScZ1vHEIyjbPUm/tvEihERAan0lyTEDzHGBSXlgvV
 JCJoskzhgR+K5qKhXSFuxFqB3g==
X-Google-Smtp-Source: ABdhPJz/U/VusSniOO1YHlXFt1wfBVXoqQ3hpmTxLqWMgCAS/0r7gTQnCSYPPaYNfi0wxzHFLJ3MtA==
X-Received: by 2002:a63:3245:: with SMTP id y66mr9115090pgy.435.1618591261315; 
 Fri, 16 Apr 2021 09:41:01 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:ccd5:218f:365:b90f])
 by smtp.gmail.com with ESMTPSA id g14sm6187186pjh.28.2021.04.16.09.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 09:41:00 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Ben Ho <Ben.Ho@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH v2 2/8] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-willow
Date: Sat, 17 Apr 2021 00:40:49 +0800
Message-Id: <20210416164055.3223088-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210416164055.3223088-1-hsinyi@chromium.org>
References: <20210416164055.3223088-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_094102_553357_B3A36157 
X-CRM114-Status: UNSURE (   8.61  )
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

Willow is known as Acer Chromebook 311 (C722/C722T).

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 81b86b189a8d..96c401597bd8 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -157,6 +157,13 @@ properties:
               - google,kodama-sku32
           - const: google,kodama
           - const: mediatek,mt8183
+      - description: Google Willow (Acer Chromebook 311 C722/C722T)
+        items:
+          - enum:
+              - google,willow-sku0
+              - google,willow-sku1
+          - const: google,willow
+          - const: mediatek,mt8183
       - items:
           - enum:
               - mediatek,mt8183-pumpkin
-- 
2.31.1.368.gbe11c130af-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
