Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17579C54E58
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Mar 2024 11:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=al0RWiU4gJElSS4Z7Unyt/qe+1B4tsgOmYSta+HjBpc=; b=yUZDy8oaJVpgGJyB3/M9U8PC+i
	RpPERhaa4Mikc8PE7E+TCD/hlfTrZIQEVspXPVgPYZRVJd11OBGiO713/8wGdZu+VsKqCownRxM4O
	yZl3a9LvRP0Oc75PnfQ22sFGWuvAwIzDxeeb/iAkTFihkLAjUM1GawT0e6WRWKnCap2R1tTEV3yGX
	uaxDPgOYdzcuql+VK4yJd9Ov9N5jVUnKLZooqACyzo7+9zkE5i5OJ/gJacDzb9uP4CcjA6cYkSIja
	xx3NwuuNJLnWzn4PV3f0Qy8BNxt1hREY03tpIuFIxrDQc1zjGiGF5UTYI7ZtpX+mhuy+ncDTxS5ba
	GW3G9YbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl5YM-0000000HaWo-1ttN;
	Fri, 15 Mar 2024 11:16:46 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl5YC-0000000HaPA-2asc
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Mar 2024 11:16:38 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6e6f4ad4c57so850314b3a.2
        for <linux-mediatek@lists.infradead.org>; Fri, 15 Mar 2024 04:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710501395; x=1711106195; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=al0RWiU4gJElSS4Z7Unyt/qe+1B4tsgOmYSta+HjBpc=;
        b=SvnOj6Wvf1yYvJFmCQpugdR3lLiieqWWItK+gye24/Q6Zs16z5Lh4zXuaJ2mm3kj6z
         8jGX22N2nNTLafTQkrZ0rNggfssbLx900PTycpr8LvEELohefa/eSxE4oLDcnDsld2jb
         p4lbL+LjJXknUbIfY/QU/AKJUe9nuLsu81nI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710501395; x=1711106195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=al0RWiU4gJElSS4Z7Unyt/qe+1B4tsgOmYSta+HjBpc=;
        b=p+sQ0OqW3CfADlufm09MTHGOs2BW5gm/yCGVrdIi+sxo7oKwwBOiKlNALkiv5GZbxa
         QB4YusuEXmG/XBuWXvtpzLAZqNFzNLEida0uJXefNWVWo6KYBKoeNPlsa67d5HLU8JQs
         DbHoTjkZxav5jXLXfktEbQruqYFCuoqNE5n+uR+x8yz3WpXq8W1ER0crQl5mUXA16LK1
         crymDXAMNs+iImDAM19ns1ou6IcKxUlAa1+3/ru/7P7HjAYHU9kvot0c08RaaDLFqKmd
         RlMOEvFoJPt1P868FF1O0RdzJlTl78P5CIxaztmRhaLZUJjs7MHIxzl9OhqrZZ0FMQk7
         kplw==
X-Forwarded-Encrypted: i=1; AJvYcCVg/oFAIuUAijFjln4c7QijjPiakEkVtIaHjyUJ5kRyGxhblTmV1HVwkWM9INpFVnHn4LvIsUjnCVjO9AqfYvFZaz9A3gId6D7Xqm7rMAgXyG0K
X-Gm-Message-State: AOJu0YwRJEKLiDWTYwc2MXFUwLAmsjhHu/3nUDOeW4FL+6Y/QXFhcGEH
	KMkzNmyOmGXPurFzJJxduuW/ipIVudWa75JB5nYy3JrxXAUEALSoTah0M+qXXA==
X-Google-Smtp-Source: AGHT+IEAdPZ814mOPF422g9xOunYnTCRZxGPQITS45msqmivfaAABFu1iB7POKJ4pYGf6WbFacC8iQ==
X-Received: by 2002:a05:6a00:2389:b0:6e6:5374:411a with SMTP id f9-20020a056a00238900b006e65374411amr4806672pfc.18.1710501395445;
        Fri, 15 Mar 2024 04:16:35 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:2f9c:c00a:bf1f:e53c])
        by smtp.gmail.com with ESMTPSA id c11-20020a62e80b000000b006e6aee6807dsm3122683pfi.22.2024.03.15.04.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 04:16:35 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH v2 4/4] arm64: dts: mediatek: mt8186-corsola: Update min voltage constraint for Vgpu
Date: Fri, 15 Mar 2024 19:16:05 +0800
Message-ID: <20240315111621.2263159-5-treapking@chromium.org>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
In-Reply-To: <20240315111621.2263159-1-treapking@chromium.org>
References: <20240315111621.2263159-1-treapking@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_041636_741781_61309471 
X-CRM114-Status: GOOD (  11.57  )
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

The requested voltage could be lower than the minimum voltage on the
GPU OPP table when the MTK Smart Voltage Scaling (SVS) driver is
enabled, so update the minimum voltage constraint from 600000 uV to
500000 uV as listed on the mt6366 datasheet.

Fixes: 8855d01fb81f ("arm64: dts: mediatek: Add MT8186 Krabby platform based Tentacruel / Tentacool")
Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

Changes in v2:
- New in v2

 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
index 3dea28f1d806..1807e9d6cb0e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
@@ -1296,7 +1296,7 @@ mt6366_vgpu_reg: vgpu {
 				 * regulator coupling requirements.
 				 */
 				regulator-name = "ppvar_dvdd_vgpu";
-				regulator-min-microvolt = <600000>;
+				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <950000>;
 				regulator-ramp-delay = <6250>;
 				regulator-enable-ramp-delay = <200>;
-- 
2.44.0.291.gc1ea87d7ee-goog


