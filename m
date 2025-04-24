Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4D2C369AB
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Apr 2025 11:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kPI27XPPYRRK0xWqV54WIVswQxSYJsBtgx975xO40PU=; b=c8L8/UpWpJ6HwLvElA4gqJtj+c
	UuUzuGo+PQkCvn0fp/V5VktrKgngUGT4e1qMnlT83w6yUEIYXTvGtEu+HqtwYDYWLRVeidSHaD8CV
	AvLiJK/PmuOPzHxcTFPH8Y+SNlSeb/JGF0j2S8+Lcz0DjE7GLWaE9kaq8G/349dCrgAMPdm11ObTX
	S8zzO1fz+/2KSxmzlYmeDXOHveFOvzoi9GFycUDbb3btZppCaV+q0HRakLbEblovjBa5gNovXv9RO
	nHBygo4ycf6pWnuvMAW6aUxXY0KJs1c62ZhWPrPlgKbqQ1qIjocXXjERYSsxHOcjwe7gzsN1bM4C6
	Vl3fs+Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7uuA-0000000DtCY-1sF3;
	Thu, 24 Apr 2025 11:38:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tm0-0000000DfU8-1aB0
	for linux-mediatek@bombadil.infradead.org;
	Thu, 24 Apr 2025 10:25:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=kPI27XPPYRRK0xWqV54WIVswQxSYJsBtgx975xO40PU=; b=n0L4Mb7GplxEQWMdzbHdujy2Ts
	eRt9w5PrCOo89TOuJArKAPiNNeRI+klcDrVhDL6zu7PJ9if+84LLfjtTxGhmvCXYmUJGWTZP5m6fE
	GhNH1cVKasiy+eXPsQ9uMIvr3MzcFGJbAk1bRtD6V9qsZ+vHEmL4pMssgjj5TSb6JGqhmPSkYq+Vt
	4aYXgxo8b1pWUGyYouAA+ycK+QWXWGQ9aaedKoV1VWO1qhNWU4iRbuviD6fsy38xV7O1nAPSsVP8I
	EGXC8buN5WCsXJWu09xcZ7gaUbRx079FQ6DOxfQW7RyzYEdMSWUo4DEQHZSgsLm8a1Rm5B1SfWF5/
	CAjX2mwQ==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7tlx-0000000BjWM-2NhU
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Apr 2025 10:25:39 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-223fb0f619dso8695535ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Apr 2025 03:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745490336; x=1746095136; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kPI27XPPYRRK0xWqV54WIVswQxSYJsBtgx975xO40PU=;
        b=m9lzWOrWXlGdV9nf0IzreDTFqD/MHM85zYEqVqZ+gYsEo5SvJpI/eIASsXc+Db/55g
         VtsQJ5ft7W1YpucXIL6rXXBJ9mJH9NClD9fSicV0wHmMMLL3RdFLO0NbzF8y5y5bn/uH
         JQKv0N1BWAX811sJ+l7PKo3MSxchVggPbxSIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490336; x=1746095136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kPI27XPPYRRK0xWqV54WIVswQxSYJsBtgx975xO40PU=;
        b=P28lpMokBZ3nP2KphnbmFIvVXZBX338E0zNP19sZU+6YZSybp/jzdQUWJrI9hZMbES
         BoEI252hHoC9ZCEuWTl/n3YGxA01J8ClZ8rQYVavNeXVy6RAjgSuTP/ajKQPwcaJrLwR
         +OLv+e73WwcaHAD6t30UMccBdwB4zhcmwQmqlNTbQ5/jkeND11j3UJyQM0qKL2ECy6SH
         VPMeDFmwvl5WfcghpAG9jrzFL6MponkJrFVqdCiqg+2CSbN0tC/QF8tXRZb4Jb8174pr
         CjcRxoKtO5G5m2eWhte+swykLuQAESokV33+87ZGMpMfodmgwC0Z1b4BGZUOShQMwhsp
         nrlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtcmLHsBb0ytenm0EMvY98LyHKwxs1bGZnuYBs52/7ZhXWMqp9KRRyvCuVJ0pdqOlZZFt/VAe717ELG14Apw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0nGEiStpxqglFbn0HUB/lkBn7Azhm7HRMKuP7HaUwgfnjM37L
	1wXLPGfqO+oRxnUbQ9vdxYiIKa+pSGlwWDwcrO+pOGBv6PQn3bMGxxYuRkPDow==
X-Gm-Gg: ASbGncvF+7sylcELsrz7DsfjzMeiZz6coO1gvbyYkAvPeLFLn+7u7T1oHQ4b2gBATEl
	P5/oOT/7jGm0Zf2wmB/HpDupJygE8TjecB3Gvudyy0Wb89tCC5JFsBROGXyFnnP0MXLMOON8/Lc
	NLInMAQPlSQ2OF1jvCODqfow90xfTQ4eilhE+OCtuMQYt9E46pJw9heEYGnZ/NJgl1NibQvw4zJ
	60lXdeYUGJfVA0RSah0gPJK+BQVpqrHLde4cjV1VUwz9fv9Yr3fBMx3saEzci0zxvOvX4XyMcSC
	kBUubSNyDgAfAgjrMP8CSbEeY3grgN3lVJK6JE+O+oGCU4GeQTO7hoRUug==
X-Google-Smtp-Source: AGHT+IFl3f1jhKy5TreVsC3n6Tp6f11IsZEiWWY1AzKzoKnuU1FfQGTVtrsgZqmOG5uoeu4Ajq1oKw==
X-Received: by 2002:a17:903:28c:b0:224:76f:9e4a with SMTP id d9443c01a7336-22db3c0c147mr26537035ad.14.1745490335985;
        Thu, 24 Apr 2025 03:25:35 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fa13:e633:684b:257])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dda40fsm9680305ad.104.2025.04.24.03.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:25:35 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/13] ASoC: dt-bindings: mt8192-afe-pcm: Allow specifying reserved memory region
Date: Thu, 24 Apr 2025 18:24:59 +0800
Message-ID: <20250424102509.1083185-6-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250424102509.1083185-1-wenst@chromium.org>
References: <20250424102509.1083185-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_112537_755880_DE59923A 
X-CRM114-Status: GOOD (  10.90  )
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

It is desirable to reserve memory for the audio frontend.

Allow the "memory-region" property, to be used to point to a reserved
memory region.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
index 064ef172bef4..8ddf49b0040d 100644
--- a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
@@ -23,6 +23,10 @@ properties:
   reset-names:
     const: audiosys
 
+  memory-region:
+    description: memory region for audio DMA buffers
+    maxItems: 1
+
   mediatek,apmixedsys:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of the mediatek apmixedsys controller
@@ -95,6 +99,7 @@ examples:
                       "aud_dac_predis_clk",
                       "aud_infra_clk",
                       "aud_infra_26m_clk";
+        memory-region = <&afe_dma_mem>;
     };
 
 ...
-- 
2.49.0.805.g082f7c87e0-goog


