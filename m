Return-Path: <SRS0=Strr=JL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE853C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 08:39:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 543996023B
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 08:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 543996023B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZMY4tBT4jMDL8+S4atQahzbdZD92maplrS8fp23rW2E=; b=aSqyOwNDbQGXq+NIgSzyzpNRo
	a/HoUrKqVnX+l/eWoPTlSenE7ZtkOt3RLTzMGC5tu2jxt83WUxNPgnDc2Qxf5YA0jIE1J02Rk8JvC
	WxQ8lTO8/3niYa9NNZQuBt5QSboDmAzW8lwoZDqIN8n+Exaapcf74fny5svY7xd2yzhsy395/g/NP
	HZ/0raDGLxrDvukTnYKsA3NaC6UwFE0f6DMlCVLk7VkFBXb25Ppt2fnwaLVoKMsi5dRtzg+VhpRGy
	9D/TQquufz/bJqZVYwuDWrQntiqY6+ekVqqGpKlV1zzjYspHCJn6oj3yinfwkRThkIJReOE4o/aHh
	6Rdr+BPCw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWb3g-00C0fT-Ta; Wed, 14 Apr 2021 08:39:37 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWb2Y-00C0Pl-KE
 for linux-mediatek@desiato.infradead.org; Wed, 14 Apr 2021 08:38:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=plmO0AdMl820K1E1EewPUIFFIYm0UYQ8GWMNCMfiNMs=; b=E1GWnMkqWdmCHlIwtZeAPRbagw
 d8K7iQD2VZks3bM5Qd9NdLf8tCPZiTk6jdd782JHNFxC1IDtKUI20O6BXqj5CQYa1UiFo2Iu4vbya
 QE1h2JzwL9XbkYe2AoDEOd8GPVIlXEykdA+tSWQzPMIPNQ7X2+sS58ac4jHqsMdrP90XP5bMr6RyW
 SMtH9XXEVYA+diezismnnriA2hM0wJCWOw/if1yjDg71Zg84UdrutEk3uuIH4datWm4HjMGKODlES
 F7pDQ9qvrgb3VpDB1ZzdYWWKgS4+Oa3uSobH81WRYmiIUbePfp1n/HZq4nBbyBvcNWvjwSB9kht23
 w8WTOIjg==;
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWb2V-007cML-LC
 for linux-mediatek@lists.infradead.org; Wed, 14 Apr 2021 08:38:25 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 k23-20020a17090a5917b02901043e35ad4aso12110165pji.3
 for <linux-mediatek@lists.infradead.org>; Wed, 14 Apr 2021 01:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=plmO0AdMl820K1E1EewPUIFFIYm0UYQ8GWMNCMfiNMs=;
 b=Y3NqiCd5rr7+LyVYEGOOOX4NYDJW2EOYrkF/TrtNRNqln3ctoJGKO0I0T0L0ApmQ3K
 N06EZWoCDwWvTUJ2L4ngADfH2WBuwxd73m6NYcBOtrsQQI3F9MRZMHIb1Y80f3kIAKNC
 j1j23aHDf+PkiUmZYXCsRhdPo49p+brePolV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=plmO0AdMl820K1E1EewPUIFFIYm0UYQ8GWMNCMfiNMs=;
 b=UH+mjWIHQtiKsw1fpihZAmyAG9fvrvtwnOvg4549nfUmtWQl6398YWQrjxxEPUc3w/
 HnifPsGlNaCgAoVQ9uPA5SZqBqWnaezfrGHeyZD5yapXffkia7QdgzG22zzesG075oFx
 VVBIbgJLxbv8c5rZyzPQ++3DH4ipuw0W/mAOR6B5oJiQT3W+B3bM/Sz8krJbv3VdWjG7
 FXXHWaFsIzsx6RFI/4uzwJrR+6bmkZbsp2aeYtN/7raAG+3NSCEj0hvn34AZFKUHu5AG
 JP7JIhJYYogDZ4B2SnUcKnQ2Kxrx/xaog76qJHV1UKVUKtf1uiEqlYbWhqj+qlRbNt8L
 5Y2A==
X-Gm-Message-State: AOAM5302cbyXx3M90ucbeyIl1o7RK/3ejLAYvn+IAOKeNy7RXW/1K14k
 b6NyRQ4/d3mZyZXH2g9pl+9mcA==
X-Google-Smtp-Source: ABdhPJzlShITTMJUXTCs2zEaR/hzAirHlP9c/EZQo05/1A8Fi0UiYdumG++22lWtt4vLwGQbGoVQew==
X-Received: by 2002:a17:90b:8d3:: with SMTP id
 ds19mr1590139pjb.197.1618389502547; 
 Wed, 14 Apr 2021 01:38:22 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:bae3:4af0:9792:1539])
 by smtp.gmail.com with ESMTPSA id g24sm8901582pfh.164.2021.04.14.01.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 01:38:22 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Wolfram Sang <wsa@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v18 3/5] i2c: mediatek: mt65xx: add optional vbus-supply
Date: Wed, 14 Apr 2021 16:38:07 +0800
Message-Id: <20210414083809.1932133-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
In-Reply-To: <20210414083809.1932133-1-hsinyi@chromium.org>
References: <20210414083809.1932133-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_013823_700165_B508D493 
X-CRM114-Status: GOOD (  12.55  )
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

Add vbus-supply which provides power to SCL/SDA. Pass this regulator
into core so it can be turned on/off for low power mode support.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/i2c/busses/i2c-mt65xx.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 2ffd2f354d0a..82f2b6716005 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -1215,6 +1215,13 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 	i2c->adap.quirks = i2c->dev_comp->quirks;
 	i2c->adap.timeout = 2 * HZ;
 	i2c->adap.retries = 1;
+	i2c->adap.bus_regulator = devm_regulator_get_optional(&pdev->dev, "vbus");
+	if (IS_ERR(i2c->adap.bus_regulator)) {
+		if (PTR_ERR(i2c->adap.bus_regulator) == -ENODEV)
+			i2c->adap.bus_regulator = NULL;
+		else
+			return PTR_ERR(i2c->adap.bus_regulator);
+	}
 
 	ret = mtk_i2c_parse_dt(pdev->dev.of_node, i2c);
 	if (ret)
-- 
2.31.1.295.g9ea45b61b8-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
