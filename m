Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346B4C5478C
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Mar 2024 11:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xxqbj/ocA3XTw0PwIH6SKfo971zCPHh+xqWvl5TLr3Y=; b=rKZrCpK37NUocGk6olrUCobLxl
	d7RjXjEkDqfinuhaPDSDcipcxr8YqNWT3f50qAFAUx3vt5Sa1Wj0hY7AxWSis4qowPuciT6LI3sjM
	ycXhaq5QTanhI7xzvnWRe0kG1tl/y1I0+gO68W366B8or3rNkEVKSBWxID+0ACpOL0OjaT7eb44r7
	wu8Hz8wxZiunNQ4TeSz60e50P0/NyHnJdcBhusS15TmG3ywIpdJWYrpCUPba2L8tBHRlQwUAvPJT4
	EIOsYOmxEWHVV+qnCexani2e2aH/42LuYc/MK3n9NxGozLmMeqyGBOoSBPeX4rJLtyCvq7ys0A2cz
	SlbXtLQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg1Aw-000000001Ig-27iV;
	Fri, 01 Mar 2024 11:35:38 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg1Ai-00000000173-3QqO;
	Fri, 01 Mar 2024 11:35:26 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a43fc42e697so284984066b.1;
        Fri, 01 Mar 2024 03:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709292921; x=1709897721; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xxqbj/ocA3XTw0PwIH6SKfo971zCPHh+xqWvl5TLr3Y=;
        b=J5d/TS+cKyjrE7TYgCHQseP6xKAZ2D+W2P7UkmvPLGI5QItHWe77XruX6L1FqrHUrl
         aUae8Tx24Cl7L1J8fb3TTKEdyXARU3Zd3wtGOAXw5dRdKN744bi6kVvuXhNfmy4Ugxf9
         VdvNbTdLpE63rFmxuS14UOq/ox0mrV0kMoQnOhJTeBMC843UO0mFI4FBUdTLr+XZkYiI
         nLiHu87VmTSRIe55v9sk2TBPa2Gm2M65l6pzzjGKpf8C+AmnjrO+QNatieXRM9OoipoJ
         BGibWLT7KbpEb7Uh3SURc1/jnXTdDN6UMHC1rSgqC3JNcjrALywg/ZW+EeOK7MUNxxb6
         ZqBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709292921; x=1709897721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xxqbj/ocA3XTw0PwIH6SKfo971zCPHh+xqWvl5TLr3Y=;
        b=aUur7aeRBNEx5ZEpwrUqVi2aOXC53rWPOxSJ17UfMOxJoupNotL5zIfesI8Al7XKSe
         9E7D1WHBUBDcPqvazd5aQsHMECfLk9UNWQfyVpwvf0qBtmkW6wetSKyWm31bvKM/bY9R
         OIWS1urVcHIntYz7300MFlOcvJhqJBfl1SsfzhBHFsLCsQB+RYlvUsk3KEMqRucNsSOm
         cpPwS5ID2mj78O5RC34NGyZk6uja3FGoN2dHQVnU+v2G2j9DVKKdkChjh2sRDdmvxCPi
         Av0JlXq9sOnBKds7AzA4zlw6ZZSzRylUIN/toAvVgfSZd2R0trd8YomxAWMHxuBflJus
         GPMA==
X-Forwarded-Encrypted: i=1; AJvYcCUd23enQvhTCZD2vcsYcsdVI1QcqgRmvHNpaeV6uL6iKhXK/5/14cjkowVLI9sELiLY1JUz32bV1AslSOX0aeS1r3T85RhMK4gkdSzCWDhZmDD06HxdveqnwMU76fRDrgcBBAnJPZfGcXWyDxFBHoB9kbM1boxebKQ=
X-Gm-Message-State: AOJu0YzPNd9WQxLFNAVg2YMPF2wjL+mwEDtyq1h7oLqVugjtseDY1xmC
	qeosVPZ5B25nSHhvtg2oXLpRpaRDvrJ32po0AwCB8A7syG7DBJwa
X-Google-Smtp-Source: AGHT+IEusKw5AANSYydo35dgANjE1ZmVrxajIOk5xAKaQw6gjEeQtPFnEVp1cHheO6ADgKYdNu6tPQ==
X-Received: by 2002:a17:906:2313:b0:a43:fe92:f9b7 with SMTP id l19-20020a170906231300b00a43fe92f9b7mr1121278eja.3.1709292920767;
        Fri, 01 Mar 2024 03:35:20 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id st11-20020a170907c08b00b00a3f5c39bf2asm1618457ejc.0.2024.03.01.03.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 03:35:20 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 4/4] arm64: dts: mediatek: mt7622: drop "reset-names" from thermal block
Date: Fri,  1 Mar 2024 12:35:06 +0100
Message-Id: <20240301113506.22944-5-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240301113506.22944-1-zajec5@gmail.com>
References: <20240301113506.22944-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_033524_955354_25FB81EF 
X-CRM114-Status: GOOD (  11.54  )
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

From: Rafał Miłecki <rafal@milecki.pl>

Binding doesn't specify "reset-names" property and Linux driver also
doesn't use it.

Fix following validation error:
arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: thermal@1100b000: Unevaluated properties are not allowed ('reset-names' was unexpected)
        from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index 7da4ac273a15..9d19dd8ee524 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -513,7 +513,6 @@ thermal: thermal@1100b000 {
 			 <&pericfg CLK_PERI_AUXADC_PD>;
 		clock-names = "therm", "auxadc";
 		resets = <&pericfg MT7622_PERI_THERM_SW_RST>;
-		reset-names = "therm";
 		mediatek,auxadc = <&auxadc>;
 		mediatek,apmixedsys = <&apmixedsys>;
 		nvmem-cells = <&thermal_calibration>;
-- 
2.35.3


