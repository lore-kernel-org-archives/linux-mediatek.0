Return-Path: <SRS0=GdzH=KO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75CD3C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 14:31:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA79D6008E
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 14:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA79D6008E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C0RBUgtQATR0FM2LTm+LPfBw6rQ1qQQRgbrkIkMqFsc=; b=mo91XoSTVahCZe8b68kCzrr/e
	ns1NF5auMJVpj1/9nbUPHRJKWQNZi3PCOvboqWN7KRXmjuGjhFq8Z2N66NOCRz7DGO27OPP5e+l63
	pkh2tfD83IuXz23WWztez8YZLHpU5IKbeoMUkSSPRpvpavO/ZJuGO/hUtwWCxMLse5KeGzNyuueSD
	BBtBEVKK6q4fkeDGqFLHp6GlSmY+WfKrMTiTs5J3D+VqFNRgGjmhP472xzSZRBasLElyRoW6lF+Ba
	Ai5YeNVfWTtanX/2PkdlHWX3pQH9W7y666tqOCkxLMWAWQW/ratYTvvNCW7nS9ib6vsVIo/pnMAjw
	YxPgD6zAA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljNEM-004GsY-6k; Wed, 19 May 2021 14:31:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljNEE-004Gok-3j
 for linux-mediatek@desiato.infradead.org; Wed, 19 May 2021 14:31:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Q78A6AyR4otkcBAEkBIo9qmnIjV1Nb+H3oDCE4IqCeQ=; b=wY5JDsnvKOAPiogoHO1kFh8zoC
 xCzwiPxy4dJcou26yp/j2Mt88Nj0gf4N4/Je56tYXoDsXMn6RFhUYT6kEmuYCqqCL0PC/oL7I0UiE
 Dms4bZGptrwhaMDkNZeExj09dGcmZXfP/MUKljwLJx9DszyNQzlcJZ3Ii78BbQONTTrx5iUVdU2bd
 HHqNzhfV/Pmk6q58E4VMTXnIO+V1mB3GASGHJTZ+vXQiIfqqexz8tsNBmFU0qLZwhLxNrxSeKzJ01
 UTkINOgdmcplr1sWISJwgS3aPMwtbjRoFmUTNQnGy1uP9ij9uWeUOYTiGkF12jiZysBrrt2FY7w0F
 1i0vnHeg==;
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljNEB-00FXvV-LG
 for linux-mediatek@lists.infradead.org; Wed, 19 May 2021 14:31:16 +0000
Received: by mail-pl1-x62c.google.com with SMTP id e15so505869plh.1
 for <linux-mediatek@lists.infradead.org>; Wed, 19 May 2021 07:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q78A6AyR4otkcBAEkBIo9qmnIjV1Nb+H3oDCE4IqCeQ=;
 b=dk1ZdNXVfQKhoxoV566tbhH8A/Vm5G5muFFzInXVyLCirIpXak1AELLnVkrrMahI/a
 q6MxIrXu1qfZeZBrMwuppT1phAq5lkeDE6I6+c/1Y4nO47M8YOAf3456KRR3kVi2TCgj
 oJRGiqgCTwJNjaoVqdWeUopl53rJC2yORKK1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q78A6AyR4otkcBAEkBIo9qmnIjV1Nb+H3oDCE4IqCeQ=;
 b=kVTj8vZc5FHjm2szVfIqJkCuq0cdz7MyvieW3Xqp3gvFPNyqRygW62ZRDm5ANgiSpM
 VDhV/tf/BlLJJF+4WarZ5hXwRY8jo5+GgZUd8OseaQBPZQfwcb9PzwMLpG1osVugYbsY
 2+/nrEcZ6djiAVcF2cIvHxdflwRd33OaiyXH92yZAACFEbLBAiMrhYr+lGTrtiFc7zkX
 bzpcdmxh/ZbvIsWqBDmAGWdXH6ZY9uG/iYT1ytNAwUEMK1YbPw35Ph7cXlRO4qDJI27i
 3dZv2tFeptgQge99U80xj3P9YDD8CVw089WZFhq3sJR9rUfwi8qqiMMWwGvNiJY+Do8O
 ZGFw==
X-Gm-Message-State: AOAM530TnxeBKsMvvdFWGdkuOr9a89eeDHpMi/n9NoKBgHfB+X5/WoZL
 zU9wOsN/kXRR4UadbCNk+QHeGA==
X-Google-Smtp-Source: ABdhPJwdDn/dz5IGtknH9kB+SXI4eNzO99AciIpqZ19tsCC7zIo+J+5hsaypxdt1S8opgVpNUKirRA==
X-Received: by 2002:a17:90a:2ec6:: with SMTP id
 h6mr11572585pjs.103.1621434675194; 
 Wed, 19 May 2021 07:31:15 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:87ab:ff82:1544:697])
 by smtp.gmail.com with ESMTPSA id 3sm14337661pff.132.2021.05.19.07.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 07:31:14 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Alexandre Courbot <acourbot@chromium.org>, Rob Herring <robh@kernel.org>
Subject: [PATCH v5 13/14] dt-bindings: media: document mediatek,
 mt8183-vcodec-dec
Date: Wed, 19 May 2021 23:30:10 +0900
Message-Id: <20210519143011.1175546-14-acourbot@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
In-Reply-To: <20210519143011.1175546-1-acourbot@chromium.org>
References: <20210519143011.1175546-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_073115_712147_7D42E11A 
X-CRM114-Status: GOOD (  10.36  )
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

MT8183's decoder is instantiated similarly to MT8173's.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
index 06db6837cefd..a2a2a9e2ade3 100644
--- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
@@ -9,6 +9,7 @@ Required properties:
   "mediatek,mt8173-vcodec-enc" for mt8173 avc encoder.
   "mediatek,mt8183-vcodec-enc" for MT8183 encoder.
   "mediatek,mt8173-vcodec-dec" for MT8173 decoder.
+  "mediatek,mt8183-vcodec-dec" for MT8183 decoder.
 - reg : Physical base address of the video codec registers and length of
   memory mapped region.
 - interrupts : interrupt number to the cpu.
-- 
2.31.1.751.gd2f1c929bd-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
