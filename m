Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C7CC54EBD
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Jan 2023 15:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uqegivo06ni2uw8aCUgMRe2pmSyBI28Ht6YBxVVOckk=; b=x2B3SqPUMpQ7Sivs1ecLam54JO
	YsUryWpaD2zxFCCV8KWu8yeWDeiuvolNUJ8kcZGLuf3Wvmin0E7be0LWXb4Sm09IDjkiEMdh0r6vV
	6TR2ofqmq+gSWe4lfgJXXj2DuKYBS788EGf11Aw6rOKR0xE1Ou2F01+AOWvxeGcMTX7OzNYwuCezC
	O8YiQ4jmAuI8aw9D1cZZ39aiK3tBCI4x/+PUYLh8I3YJoBiMGntOU3+TXSF4QhE7DGZSYkNQzc9i2
	706eEFgMdK1atu5Ll2F7SMgRRJbm7U1qjqlPLNvllDYHctuMgvRcKHoPRQqgeOJlBba13DphfZsBi
	Or2+pKYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFzX1-00Femx-Sv; Thu, 12 Jan 2023 15:30:19 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFzWi-00FebL-5C
	for linux-mediatek@lists.infradead.org; Thu, 12 Jan 2023 15:30:02 +0000
Received: by mail-wr1-x433.google.com with SMTP id w1so18454352wrt.8
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Jan 2023 07:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uqegivo06ni2uw8aCUgMRe2pmSyBI28Ht6YBxVVOckk=;
        b=IRAFQCNtHY/UvGlzxoyB13GflYu7GWMy5iKQE0dPIHmEFVdLre8sY5yc5AyuxnmXML
         EvxiThKaM9NnLePX289opg8ijNnokMNMrnVfDLeedkehG163Lzq1lHb7WszuRZbS6l1P
         Qz8emFJJ/Uvr2hm108nUV1PpZuGJkH4sn7GhTuK7Az2l4qAFPv8yaIKpGjPRVQQxMIy1
         Nli5ttNg+ck+zZ+h2J+iETYhjtzKRiKm7KhYJGIJ96yWiZHnEXfWOLo6hFRJ0wcB5YLa
         8Os7EmawAlRpNivq9fvwO15HlmrdjZaLuTnseGgJmmHZ16ZcVJzTmIastJaMXWfMO7XZ
         jk7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uqegivo06ni2uw8aCUgMRe2pmSyBI28Ht6YBxVVOckk=;
        b=HQSVRAl4To7NcfGQ7Ev4B89xfN32H+tfzIgf3AKYWnC0CEONdSAGpkib2Fjk7HB6PL
         qJr0+zmOW1S3OFdsjww14f6Dng9fstizU89fRnP74n1KnfqLl3LWvMrxffgCA93J3K+1
         lHv5EQaIPPFoo0AlHvO/kgrHoiv4hAmWopa22cBWLBQrzncVPmrTW6O/varAuzLyl2/L
         llqrdrdZEVd6l3PrfBaNY5GBeWsTrsdWcHX1xjRDODbP+GMGTTMfSWLvNjfsTxbf4MXa
         iMSsi8AfLzGpK2kesGxclhr0/HDP8J3JXmLRjAM5j5wzkL/fs37yzZhtxtOwrIK/lOJX
         LAkg==
X-Gm-Message-State: AFqh2ko/Yoi28riiZtsQrOUZsl5UzKkc44vjGSemv4JsaR8cJNnqkvKM
	QU9q+qXs2iFywBc6j3HZbZ61LQ==
X-Google-Smtp-Source: AMrXdXvrv25II5DU9O9FfCGJOwCGvgerXAk0j62cqG3N+/NSvc0qssMR2zDta0ueNbMu8xG2JDx5SA==
X-Received: by 2002:adf:e987:0:b0:2bb:e891:1829 with SMTP id h7-20020adfe987000000b002bbe8911829mr11869254wrm.4.1673537395581;
        Thu, 12 Jan 2023 07:29:55 -0800 (PST)
Received: from t480-bl003.civfrance.com (58.188.158.77.rev.sfr.net. [77.158.188.58])
        by smtp.gmail.com with ESMTPSA id l24-20020a1ced18000000b003d99da8d30asm26395909wmh.46.2023.01.12.07.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 07:29:55 -0800 (PST)
From: bchihi@baylibre.com
To: daniel.lezcano@linaro.org,
	rafael@kernel.org,
	amitk@kernel.org,
	rui.zhang@intel.com
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	khilman@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	james.lo@mediatek.com,
	rex-bc.chen@mediatek.com
Subject: [PATCH v10 3/6] arm64/dts/mt8195: Add efuse node to mt8195
Date: Thu, 12 Jan 2023 16:28:52 +0100
Message-Id: <20230112152855.216072-4-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230112152855.216072-1-bchihi@baylibre.com>
References: <20230112152855.216072-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_073000_281684_018A51E9 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Balsam CHIHI <bchihi@baylibre.com>

Add efuse node.
This will be required by the thermal driver to get the calibration data.

Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 5d31536f4c48..09df105f4606 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1380,6 +1380,12 @@ pciephy_glb_intr: pciephy-glb-intr@193 {
 			dp_calibration: dp-data@1ac {
 				reg = <0x1ac 0x10>;
 			};
+			lvts_efuse_data1: lvts1-calib@1bc {
+				reg = <0x1bc 0x14>;
+			};
+			lvts_efuse_data2: lvts2-calib@1d0 {
+				reg = <0x1d0 0x38>;
+			};
 		};
 
 		u3phy2: t-phy@11c40000 {
-- 
2.34.1


