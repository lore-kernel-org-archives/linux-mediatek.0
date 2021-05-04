Return-Path: <SRS0=osr7=J7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED77C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 May 2021 05:47:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E599C613AA
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 May 2021 05:47:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E599C613AA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SP7+QlDRsGKmy9cAq0HdN+cAJ0+hJXNtCDn2bBCN5/8=; b=i37JTquz+tZQ3sj3r3oa7VkDX
	5qUS5uGZ+1BqgPnLOCY+LPVSHbW7dzLvaVqWltCu6ZWDCwoZZbdx/MKbJfAOW9OnkzH/ZaXBTgR9r
	gL65ftqmn1gkUcWm4HHNaE6fxlAMWLRs4iIWRP6AJaUPSruYY3Hb3fsUJkz3GG7QfbUsWTN1lduAL
	DGMnTehlEQ2ku+JP0BB2kKtNV/WZdtbOh/fyq0yzJC0YrSGNfsEQYx9VyXZCL5LBbys6CTTVnaJY6
	wkYknEDxVn/atF/KMwFQjifkCnvZj+OujhfPZ1Z32wZwuJLmvE5irelZKdExdhII88qkJ6pL9lRn2
	TSEo9vG2A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldntO-00FViD-U7; Tue, 04 May 2021 05:46:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldnt0-00FVeM-F3
 for linux-mediatek@desiato.infradead.org; Tue, 04 May 2021 05:46:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:
 Reply-To:Cc:Content-Type:Content-ID:Content-Description;
 bh=ruzjnf97rqp8KZrHv4F0HwnQ25ygJYhQmfYotCDw800=; b=X60d3yeAXqjJ95XjzjVzNr2ZNC
 3FcEq+nh89zOlz7Q7wfzkq6ZlekqS3PnBZJ/mComnjZE5N8javEblPDzYiX5oMeUi9zwZ3uow/bXg
 r/eEIcB3bRAbSF1gtJEP66Iop6QDGa+VUy/qaLGpXz8c0No7Ytj31OEDjk+MghKxyZ97NRiUMdXx0
 jP6ieN21a/udUAYbH9HeVU+mF8yS9u7hDK8IoQpi/ANjD3Fa4jyDucJG0bX093f81f1OdnkRpv10Z
 /gDtW3dYqtxKuBvAz2G66qieJGu+rzue/qlVc1obZuZRw7G2h9OQKILYqArGrczU9EJ1FP6Z/1qkI
 nVMxin6A==;
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldnsx-003i4v-TQ
 for linux-mediatek@lists.infradead.org; Tue, 04 May 2021 05:46:21 +0000
Received: by mail-pg1-x52d.google.com with SMTP id m124so436130pgm.13
 for <linux-mediatek@lists.infradead.org>; Mon, 03 May 2021 22:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ruzjnf97rqp8KZrHv4F0HwnQ25ygJYhQmfYotCDw800=;
 b=RV0bNxTPJA/hy2w78z4w63S+IFbVsSNYUn7W9ZD/se4+3z4wzd4yyh1Csg3OnhecoI
 SbIvixQuG+Fotr+Jqb4u2/qKqgRLk0CiCekaQAelR6sjn12TkArbW1Kdxa/0MvUobvq0
 i3xqxU89ZBTqN+MIu4slf3C77ghAykJCoeuOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ruzjnf97rqp8KZrHv4F0HwnQ25ygJYhQmfYotCDw800=;
 b=YOso1Hpsq+kbDmSDLAZQ/ARbvWc3mMOQQdyv3drV79BDX/TOqVYi+CkV5bTNAe5etz
 Qt8unAgtVszBcD9MNt3sdptnasnAIsv6QXRm0i1pAkZjpJ/xCTlsP3j37/ZhNf1uklEW
 pFcX8/s5ng/UQiiBQ+V9yyViGKCtB9mYUNANwyz7LEhV5J3FdEGWZQBDJXsc7MTMamKV
 PM/YlJutZPn+3G/L3gImKhUpjffGdv8rG0M7AYBv5y7Mah7di+SyK2jPWWo1+kI19vOx
 Q5/RLRDnThRCf/g4p0E3TsSHDsaoK/3WNqgRKkg1/nVe3BpPzjS9eSJPE4JwQi28Ha7d
 nSlw==
X-Gm-Message-State: AOAM5331oJ1q0mmC4AYUQfMxoCb9QQ9ZVbsB15b/wzSQojjDnnDA5pkO
 +4uaRNYJ+fkdLzaxQz+qHcUgsg==
X-Google-Smtp-Source: ABdhPJx+2dVGuDJktztYOT1pSp69Cf/jvHP/glbQJyGuPOb9zOkXg0tWU8k2nMVL1lNBqjDmjTOlnA==
X-Received: by 2002:a63:a847:: with SMTP id i7mr21492145pgp.203.1620107179141; 
 Mon, 03 May 2021 22:46:19 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:bf4e:921c:69e1:5d86])
 by smtp.gmail.com with ESMTPSA id g21sm11512515pjl.28.2021.05.03.22.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 22:46:18 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 devicetree@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] dt-bindings: mediatek: Add optional mediatek,
 gce-events property
Date: Tue,  4 May 2021 13:46:12 +0800
Message-Id: <20210504054612.3585017-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
In-Reply-To: <20210504054612.3585017-1-hsinyi@chromium.org>
References: <20210504054612.3585017-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_224619_974709_C989EE3D 
X-CRM114-Status: GOOD (  10.15  )
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

This property is used by gce clients.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
v2->v3: move definition to Documentation/devicetree/bindings/mailbox/mtk-gce.txt
---
 .../devicetree/bindings/mailbox/mtk-gce.txt       | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
index 7771ecaac586..2ef7ff67cb2b 100644
--- a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
+++ b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
@@ -35,6 +35,10 @@ Optional properties for a client device:
   start_offset: the start offset of register address that GCE can access.
   size: the total size of register address that GCE can access.
 
+Optional properties for a client mutex node:
+- mediatek,gce-events: GCE events used by clients. The event numbers are
+  defined in 'dt-bindings/gce/<chip>-gce.h'.
+
 Some vaules of properties are defined in 'dt-bindings/gce/mt8173-gce.h',
 'dt-binding/gce/mt8183-gce.h' or 'dt-bindings/gce/mt6779-gce.h'. Such as
 sub-system ids, thread priority, event ids.
@@ -62,3 +66,14 @@ Example for a client device:
 					  <&gce SUBSYS_1401XXXX 0x2000 0x100>;
 		...
 	};
+
+Example for a client mutex node:
+	mutex: mutex@14020000 {
+		compatible = "mediatek,mt8173-disp-mutex";
+		reg = <0 0x14020000 0 0x1000>;
+		interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_LOW>;
+		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+		clocks = <&mmsys CLK_MM_MUTEX_32K>;
+		mediatek,gce-events = <CMDQ_EVENT_MUTEX0_STREAM_EOF>,
+				      <CMDQ_EVENT_MUTEX1_STREAM_EOF>;
+	};
-- 
2.31.1.527.g47e6f16901-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
