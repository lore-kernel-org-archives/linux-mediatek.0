Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DFFC7EE23
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jun 2023 09:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1oMUOQweNkFHrLBYGCRkYWKHPdRqVZlt9YUEgkC1xGo=; b=ZfFBclKFpYKeZVO77n5aaoHykZ
	hTulaq7N0QGxyXGk3N3+FSOhPQjvyxmB/wjUSv1U3cHm8nM2GFx5RtRrfy0gskA1Y/xoo72kxBGDn
	7Faroj/5607BoDlTiNoyvohyqGLtIrcW5fB00Lyx3r+vfdQWXokn2FkYZv7is6pS3rwdRXyg043UU
	oNUx1qIEw/mULlLVJEWbpnWqrVK1iyIxo8AEs7mYKlA4PzctpTuYtkFDIB0FZHj4ZQU3m4bwOqvl4
	o89LbE+yjUq4JdGxH8xbjj/rZXEyc+bjA2lDQnRZovo9QqEqZCfAK51Zfl05P2AMumsB8Mcl8cOsP
	EMD0Soaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6p8L-005ADx-24;
	Wed, 07 Jun 2023 09:07:13 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6p8G-005A9k-2Y
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Jun 2023 09:07:10 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6b2a8e0306eso169050a34.2
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Jun 2023 02:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686128826; x=1688720826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1oMUOQweNkFHrLBYGCRkYWKHPdRqVZlt9YUEgkC1xGo=;
        b=YzqZuJikN44AANBQIeQ24Hb3eDg0RnpxZA4TvXJJ3RzBfTYK6A+PmLH0jhuLpe0ktZ
         x43yz46wMbqMdNlPqd6hfhCbBphIlT1+Vk/gAtT9cdkjnjcmrbmPv0DDFFyW7UZlObUR
         BAds9fl8sjNg9eA6uuzo4Fm+coqH38JBWnlzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686128826; x=1688720826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1oMUOQweNkFHrLBYGCRkYWKHPdRqVZlt9YUEgkC1xGo=;
        b=Ocf3OEvr2ytI/9TiOAfhf/Cb9HoiH7wTNZ55mWIJ1WDuPZT1EKi6bryRAgBbsfgMAU
         N86Sw8FKXD+gh4Djme8Qt9/q8jwiiwfkY8lu9db61mQDsv6xBVipF6ouTiqgj9c1YpcO
         zv6LXe9l2olvt/fZn98RB9xXazwF/M6wbNKZoRqb7yeTVWwzCBRrGPq5Mg9jGNQvmimt
         pFYn8jw7WFYERzQpC/8C59Z8hl9hkhbhTmpe4jeucYTZbcYTYbBDyEzJoJMpxCxyc0nO
         KvtCOkPitLk6GxlV4NrNhIE6mTyN2Z3B/eGqbdjDWN09KiBxlXlXWO9bIkDbh1xpI9Hi
         i5RQ==
X-Gm-Message-State: AC+VfDxsp7+YKjPDB/usVP8WTIHboo4mkrxbHwdqzf9J4IE8tURRgMxF
	qqqL2JGIx0DYTOqxnIWODvv5ug==
X-Google-Smtp-Source: ACHHUZ5ibECzd/kZUl2bbXqDpahU54iioKVNky/2QpxDRw4sHqajO7VAsic8EWY+GLNDHBLHKRubEg==
X-Received: by 2002:aca:240a:0:b0:39b:f558:8cbf with SMTP id n10-20020aca240a000000b0039bf5588cbfmr4422662oic.12.1686128826597;
        Wed, 07 Jun 2023 02:07:06 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:443b:29bb:b677:185d])
        by smtp.gmail.com with ESMTPSA id b38-20020a631b66000000b0051eff0a70d7sm8505732pgm.94.2023.06.07.02.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 02:07:06 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 3/4] arm64: dts: mediatek: mt8186: Add GPU speed bin NVMEM cells
Date: Wed,  7 Jun 2023 17:06:51 +0800
Message-ID: <20230607090653.2468317-4-wenst@chromium.org>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
In-Reply-To: <20230607090653.2468317-1-wenst@chromium.org>
References: <20230607090653.2468317-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_020708_826998_03493165 
X-CRM114-Status: GOOD (  11.40  )
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

On the MT8186, the chip is binned for different GPU voltages at the
highest OPPs. The binning value is stored in the efuse.

Add the NVMEM cell, and tie it to the GPU.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index 6735c1feb26d..c58d7eb87b1d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -1567,6 +1567,11 @@ efuse: efuse@11cb0000 {
 			reg = <0 0x11cb0000 0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			gpu_speedbin: gpu-speed-bin@59c {
+				reg = <0x59c 0x4>;
+				bits = <0 3>;
+			};
 		};
 
 		mipi_tx0: dsi-phy@11cc0000 {
@@ -1599,6 +1604,8 @@ gpu: gpu@13040000 {
 					<&spm MT8186_POWER_DOMAIN_MFG3>;
 			power-domain-names = "core0", "core1";
 			#cooling-cells = <2>;
+			nvmem-cells = <&gpu_speedbin>;
+			nvmem-cell-names = "speed-bin";
 			status = "disabled";
 		};
 
-- 
2.41.0.rc0.172.g3f132b7071-goog


