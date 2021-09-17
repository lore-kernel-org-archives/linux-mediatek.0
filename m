Return-Path: <SRS0=QZHK=OH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F96C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Sep 2021 12:59:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09AEA61130
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Sep 2021 12:59:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 09AEA61130
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8PJZZ+TAnPh5pjPf+tIRVcjWEuNXG855t5493Y1r8Fk=; b=oeq4tG4OHWCd1h
	yKeK+zzCMK7ydV1/urxXOJCSNK8x15YvFTf2JJ40/BTx9BTM239m+QufwnipJG7n22eJYYbAmRptZ
	GgSuUrWOJ8Pfov4zFWoGNk0dqszkUYspN1I0lL8A2cL9aiQ7Ssf79CU2f5NRLPOENLLjw3n+z7fIa
	czgx/n/AgX1xohQ/KTVMCLhssBG5sCIEIXNrAj3X3ZKVAcXculnw73OgzEWfKo7xWniOHuTfz3+NJ
	yJj9XbewF5+iwOWgFLIGfCHIQXipM5U12SqPpu/PhWGdtNVK0xo99jyVb1wDZrZLSLH3p8SHqA2eW
	kmsdM3XTA4Yoi6LrQ/2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mRDS8-00EDSw-SN; Fri, 17 Sep 2021 12:58:52 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mRDRK-00ED5K-3U
 for linux-mediatek@lists.infradead.org; Fri, 17 Sep 2021 12:58:05 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 b21-20020a1c8015000000b003049690d882so9886984wmd.5
 for <linux-mediatek@lists.infradead.org>; Fri, 17 Sep 2021 05:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=plrOrvIZM2TLyxiMQcIWBN+4lREuMv3pRG/Sh7a1xC8=;
 b=A1XyPdxcOquLxN0aX50A1ZFpsIYqi3fOAj7lTpkAapmpB6s0I7t5BtLQBntoT5o/gC
 LTk3U5iGqZXV00d7UWu1zJeHwNQUIaZQXm49I9GxJIR/4y18GU6Nvyoikkh2w2l4zgcp
 B3UYoAnqDqm9GVkUY9hqfwcQPouBjXs+iZX47NO/QJ/t4wb1kggMVtkvmAtzd4qzJFRW
 7nWbDttoNJXmYKodYdihre5foSUAr0yPacNcyWtLspR5zCXh9y8npouXY1dRxKM6UQcn
 WZ3a9DrYMmZAVwaW7QgPnDaW9jP4k2Ex3PG5EKtnNHZgrO8bzEd2qcrTOZ99BSIM62Lu
 8eYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=plrOrvIZM2TLyxiMQcIWBN+4lREuMv3pRG/Sh7a1xC8=;
 b=8EqqSJ48id2cLFCZ4sKTPoJSyyVuOxN4PA9flqYiqns2VrYHULZUWr+3I+fDqhgwYP
 gS+xUaGFyRksVqH63nU/zmwDpbdkN3Ny4yWu+5ylrjbBYfoE1Qjw4wqoiDuChjI1nHj+
 7HYX6F6U0kMQy5tteN+a15i43q8NChMDs+G88PhfXNA8LDb7t8Cv5O0NS6EMm2ZuxhjL
 V1qy1JCDZ1YN8E+ehDKKacABnHMeQrIJXFs+eGawXe5YveIHkPkIC1kyJo0tsXBvx2ZJ
 wdTmG9VsptoXuvgHAcFSQVHufQv5LidzpQ5mz2HD0Y8azp8pk9Rpx+4mlz/OrqWigg5d
 XNSA==
X-Gm-Message-State: AOAM532m3c/KMqesOWY7ggvddfjThXIISWg2/4PsfCUItIQviCnzD1za
 uDxEbZxlqc8j80TSCOfuUF/j8A==
X-Google-Smtp-Source: ABdhPJxTbG15Mr23ALcQTVgBRPbbO7jTynJgRBVrKM9JKm3YI/iNB4vjrE9aSV9fhOwwMUSmYbl5Hw==
X-Received: by 2002:a7b:c086:: with SMTP id r6mr10257667wmh.46.1631883480653; 
 Fri, 17 Sep 2021 05:58:00 -0700 (PDT)
Received: from localhost.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id f3sm6358636wmj.28.2021.09.17.05.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 05:58:00 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 matthias.bgg@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, ohad@wizery.com,
 bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
 sumit.semwal@linaro.org
Cc: christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, khilman@baylibre.com, gpain@baylibre.com,
 Alexandre Bailon <abailon@baylibre.com>
Subject: [RFC PATCH 4/4] ARM64: mt8183-pumpkin: Add the APU DRM device
Date: Fri, 17 Sep 2021 14:59:45 +0200
Message-Id: <20210917125945.620097-5-abailon@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210917125945.620097-1-abailon@baylibre.com>
References: <20210917125945.620097-1-abailon@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210917_055802_202141_713F3165 
X-CRM114-Status: UNSURE (   8.20  )
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

This add the APU DRM device to pumkpin.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
index 7fbed2b7bc6f8..c540dbfe30151 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
@@ -98,6 +98,12 @@ ntc {
 		pulldown-ohm = <0>;
 		io-channels = <&auxadc 0>;
 	};
+
+	apu_drm@0 {
+		compatible = "mediatek,apu-drm";
+		remoteproc = <&apu0>, <&apu1>;
+		iova = <0 0x60000000 0 0x10000000>;
+	};
 };
 
 &auxadc {
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
