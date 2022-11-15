Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB877C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 03:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lfd5vFsn4ORTC9eQFrAgBokxgVjsUt5YFyR8S2MDEt4=; b=a7TG3TLN01+KWAgnTjBHUHDcYF
	1ezFdrKxIGBJEtQP79DWJ3FwtGh9FqWt+YKSJWqV3RwBewtFrmh0oDXbgax0FXe4A24b7hROSwSmR
	jeUUJUwjlI4UWZW7PQg9ts5mkNZmgrU32sH+TfMhyiiMTbbh538h2Bp2u+eN2HWB5V1E+o4I0Gx19
	e+y07F9J9zrJhrS+SZn6LUPIwOGiJd4ebvQ4xDbAXyWNiNmoPYSUw+8euiiQM/vSug/EpTbMNPY4G
	Qa/2jFYVlK5fG592gALTYKDJQVoH+TFHWEtjWMz+CbqtMmwlL8eQFPooHGqTShlaZfKVqkYtBdVem
	4LYJjQpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oumd4-007BVB-SO; Tue, 15 Nov 2022 03:28:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oumcs-007BHK-5Y
	for linux-mediatek@bombadil.infradead.org; Tue, 15 Nov 2022 03:28:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Lfd5vFsn4ORTC9eQFrAgBokxgVjsUt5YFyR8S2MDEt4=; b=foJKFgzKNV+EKR/sj51SqgT7/l
	08Lkt12gnEU9zs2/CyCRBIGs6uaXHs3pQGPYWgjsgjWnk3L4AhQraT0gLLKkSYqVTv9LaVkwBxRT3
	NrMXqVNpd7wAc+22NZykjIeVW/fM74vkm2+Yrf2/+kWOFMXtey1mkA2NYxrCkkqQFUYqa9V6rCAsD
	AeIG8IFc8QcnnJ79n8wtnnlhUbFL2zAsOuxyU9n2QZLDIqgRy5mHhjmx3iM7APU30UajyqeAfeSRT
	9evRMxwLOtCGKxJN4sobP9JU/S1ALjNbDNS4j2yuC4sYvTyrG2ZxeANL4EW0zU3Kv1V6/FVsWhrYi
	fmtiDW2Q==;
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oum5y-000wve-RB
	for linux-mediatek@lists.infradead.org; Tue, 15 Nov 2022 02:54:51 +0000
Received: by mail-ed1-x52b.google.com with SMTP id v27so20065319eda.1
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Nov 2022 18:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lfd5vFsn4ORTC9eQFrAgBokxgVjsUt5YFyR8S2MDEt4=;
        b=QKdeWglrDTyEbJvkPFXGD+5eCNiWbpvzs2ceej/LNVabuapwd3NQGQhQnXCA3ip0Ut
         F+NiOgJdylxj0xjXeiVQ76JAXUe2mwhuth9aiUqFYafb1DE/wkFBNlSsn6mCWY2Ji5rz
         X8dr1s/lZZUkZWwsm6wgYl5vKs6wPgzgMUwHUl2kcrVvr6LUG/FfuWfzoOVLW6n1vg4t
         df31np77res+5W1068tJskWLzwjDvSQtaAd0gh5D/H9MmQEDA63lJwaE9x4buGRP0Goz
         4S/dfF4yF2bxSj8f994ah0werg4sZLFwlynSjuOD9cFm7KbDTuHZjZOAa4pJDzlVpgRx
         zzAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lfd5vFsn4ORTC9eQFrAgBokxgVjsUt5YFyR8S2MDEt4=;
        b=Ply3NQs1VHeeIQ2UZvOs8dSKSeq3PBO024jfyjCliBc7naEDQKd2En9rkNFGt4hK0s
         m85FiWSG+DrBWFSDWgRNdrvvHNwEQgv+x9Mr3NDwDqseg2WPjhshJ8gGLxLC16z0+fCI
         H4ZGoElSkAdfad7xYKjN2TWoJ6BQD7PLBJCEtUGXMzOGFhiBr0D67zjFl2Ji3DffVi/2
         QibN3+TAa57fL/EjFhJ8Ac+4sDNO99oca0pRjzRj0HhaEmeOA9OzqT6YSN8iCjHH5cha
         PcnC6Zc0qiAVCyI+TlB1syGnKzXkRu6EXECClxMCMpa8zCB0qfMASDMerWctbpAcsGnc
         So6w==
X-Gm-Message-State: ANoB5pmeTCTM17IChHOtVE5huVtfKRSSTCsRVtApyZRixbex1D1zlBm/
	2Yf2FrcvZluXzbHLb2kVfFOBnKB1d3Xo4UCX
X-Google-Smtp-Source: AA0mqf5yQwaFvSFd7YodrHhzpc49zT/4qGfOuHwOk8z6QV3S4fPap7lUmRBe/7UwDZmsEnmTMZTEEw==
X-Received: by 2002:a05:6402:40d:b0:461:de5e:ba52 with SMTP id q13-20020a056402040d00b00461de5eba52mr12972295edv.177.1668480878767;
        Mon, 14 Nov 2022 18:54:38 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id l9-20020a1709063d2900b0073d9a0d0cbcsm4861177ejf.72.2022.11.14.18.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 18:54:38 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com
Subject: [PATCH v2 12/15] dt-bindings: soc: mediatek: pwrap: add compatible for mt8365
Date: Tue, 15 Nov 2022 03:54:18 +0100
Message-Id: <20221115025421.59847-13-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221115025421.59847-1-bero@baylibre.com>
References: <20221107211001.257393-1-bero@baylibre.com>
 <20221115025421.59847-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_025443_827322_E24486A3 
X-CRM114-Status: UNSURE (   8.23  )
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

Add dt-binding documentation of pwrap for Mediatek MT8365

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
---
 Documentation/devicetree/bindings/soc/mediatek/pwrap.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
index d24e2bc444be3..eb6379487c910 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
+++ b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
@@ -31,6 +31,7 @@ Required properties in pwrap device node.
 	"mediatek,mt8188-pwrap", "mediatek,mt8195-pwrap" for MT8188 SoCs
 	"mediatek,mt8195-pwrap" for MT8195 SoCs
 	"mediatek,mt8516-pwrap" for MT8516 SoCs
+	"mediatek,mt8365-pwrap" for MT8365 SoCs
 - interrupts: IRQ for pwrap in SOC
 - reg-names: "pwrap" is required; "pwrap-bridge" is optional.
   "pwrap": Main registers base
-- 
2.38.1


