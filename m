Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF66EEB64DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 08:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NqcAnVxpvMo7IksBTYj7fHRMjHClyEVoFOPZWnp2zrc=; b=E+zyUsursMrVjR/Lbu/eS1NiwU
	M/ldoe37twC41U5LzzXx7mj8JbPIVvl3juWJTPg+bRjhv1J7tEHXR16Ed9jw791xoo7TKb1kHL4UT
	QYTyjxaJgiRTMPvtHYnAsLdy2O2+56qZxUxMF80G5W2hzpOLHEKq7NnHHLpyzjjrnwS6OdwfIji1g
	MQF9ihyeyg2cGgt82ve7y0Q63MZWapTGSgZRYE2115Ix1iqB9FHB8r6/8rly00whL6Lw1j0UbGFCk
	A2LW79pDCOdQ7lKZUz0GpRuX63zrBelmTVUwi8Fp7EHDbQYJWtnmcUMMlC+hXrs1VIugymHaPPScg
	SoCot73A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMlW8-00DNO4-30;
	Fri, 21 Jul 2023 08:29:40 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMlVz-00DNIJ-1q
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Jul 2023 08:29:33 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3460815fde5so8317455ab.2
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Jul 2023 01:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689928170; x=1690532970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NqcAnVxpvMo7IksBTYj7fHRMjHClyEVoFOPZWnp2zrc=;
        b=hF1OzzEufhEDtjc1xGiWd3Q09tWgNep/QKfIBNhgJHpTTbdq2kKmoY/mkJdducvuFx
         e09+2Wsf9hGM4/njO7eO5dATDrHIhU95LkRhtbffp/ztBgDXWaotwYu8GK7AmSFgSlKv
         kPbrYmWW9/r+bMdm5GbJyIDwY2rym7M9bdP3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689928170; x=1690532970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NqcAnVxpvMo7IksBTYj7fHRMjHClyEVoFOPZWnp2zrc=;
        b=ORc5uujXyD8MF2c+5qRT7sftWcQSsS2n0v+V4R+KgdRrh96HtoNClH8n3oAcxMqjru
         CKKaKGVi1FPICMyhK8ICrksQQ+fJDqq+q8qjwsUi7q6GB3jsM+ZTEbTcNTA5q3pap58A
         im+AFKqHzyn1gDzb9TxyzXJqnV+adi9K1KpG4YcfRd6B9pzFblqSEiK0YHgriR7MVwID
         xa8vgK4SSsIBhX3sW+lS4gi3Y/tjqIb/Xwnq5Mn8uiO55Ac2babhw9MHpC+56sFWJmjc
         OX0MCE1o2MksE/c1j6MPiq/TrUtVLq1FmZlKu6mq9YxvZU6QKS7PG5JwcH0+TXwqrxOM
         WEWw==
X-Gm-Message-State: ABy/qLYpOf3BXCN12mdPP1Xmqxt19obQ/49QNkoVJZigPKWiVf7Fz+YG
	qD2KTSAHSGwo+FVGMhqEcsQshQ==
X-Google-Smtp-Source: APBJJlE5WyToH7m3ndabro+eq52oSmJ/JsGYQfuT01AgpnGmcl+yZvTY8UCuBx5ycfIiD0RBXTC3mg==
X-Received: by 2002:a05:6e02:164e:b0:345:d0c1:12b5 with SMTP id v14-20020a056e02164e00b00345d0c112b5mr1535037ilu.26.1689928170285;
        Fri, 21 Jul 2023 01:29:30 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6d86:d21:714:abab])
        by smtp.gmail.com with ESMTPSA id d26-20020a63991a000000b0055fe64fd3f4sm2594382pge.9.2023.07.21.01.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 01:29:29 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v2 1/7] mfd: mt6358: Add missing registers for LDO voltage calibration
Date: Fri, 21 Jul 2023 16:28:53 +0800
Message-ID: <20230721082903.2038975-2-wenst@chromium.org>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
In-Reply-To: <20230721082903.2038975-1-wenst@chromium.org>
References: <20230721082903.2038975-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_012931_610266_080FC2B3 
X-CRM114-Status: GOOD (  10.82  )
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

Most of the LDOs, except the "VSRAM_*" ones, on the MT6358 and MT6366
PMICs support a finer output voltage calibration within the range of
+0 mV to +100 mV with 10 mV step. Some of the registers for this
function are missing from the register table.

Add the missing ones for MT6358.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 include/linux/mfd/mt6358/registers.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/mfd/mt6358/registers.h b/include/linux/mfd/mt6358/registers.h
index 3d33517f178c..5ea2590be710 100644
--- a/include/linux/mfd/mt6358/registers.h
+++ b/include/linux/mfd/mt6358/registers.h
@@ -262,6 +262,12 @@
 #define MT6358_LDO_VBIF28_CON3                0x1db0
 #define MT6358_VCAMA1_ANA_CON0                0x1e08
 #define MT6358_VCAMA2_ANA_CON0                0x1e0c
+#define MT6358_VFE28_ANA_CON0                 0x1e10
+#define MT6358_VCN28_ANA_CON0                 0x1e14
+#define MT6358_VBIF28_ANA_CON0                0x1e18
+#define MT6358_VAUD28_ANA_CON0                0x1e1c
+#define MT6358_VAUX18_ANA_CON0                0x1e20
+#define MT6358_VXO22_ANA_CON0                 0x1e24
 #define MT6358_VCN33_ANA_CON0                 0x1e28
 #define MT6358_VSIM1_ANA_CON0                 0x1e2c
 #define MT6358_VSIM2_ANA_CON0                 0x1e30
-- 
2.41.0.487.g6d72f3e995-goog


