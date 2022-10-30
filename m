Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A96C38A02
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Oct 2022 17:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V80UGbFaefodELDsnmOH1hIVX1sH5nHYnUjMRM/2dyE=; b=3k/Ul29E+w31Z7yvv37zk/RR6k
	J2/QPT1DMNscl8C8dtEJaA34eYKX4lb7wXppNVyaODHPV92AJLs/mTp3X115oaXGDEHV0IrOvlBaB
	YJrEAi9lQMK2jb/DvXuGbSjDcnRTlhVAgBaMaji/zz4VvBjMoQy84GWwOghD80TuRzav6ORIRLW7S
	+6DPst6eohdfkFlPK+xG7iAhGAt512RJyROFoVR/Z0ThemdK7Xl6otvNj8chpf7C1i9y67ULqQjEI
	x3ZXFfbgtl3vQcffsWZaF10EWUFz8QgwnLP1bDbWnC366FO7aP2gwZWJdfUSEnjoOHqaD3TjEprS+
	CYbaz4AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opC57-00180z-8L; Sun, 30 Oct 2022 17:26:45 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opC4o-0017pW-Kv
	for linux-mediatek@lists.infradead.org; Sun, 30 Oct 2022 17:26:28 +0000
Received: by mail-pl1-x62d.google.com with SMTP id g24so8929482plq.3
        for <linux-mediatek@lists.infradead.org>; Sun, 30 Oct 2022 10:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=compal-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V80UGbFaefodELDsnmOH1hIVX1sH5nHYnUjMRM/2dyE=;
        b=kI23bVMawUnZtojoj3JoYjTDdj1zCB29PnaZvUCvkDgWTFM0e/8pS8IQ7gf5LOUtAR
         Kz/4KtGCybjZqoi5H47WeXDYuuSoALQvrZSy8vXJDW7zaCtAoV2Il7X9pDLvrEwEmAom
         NYEXK7xOJSpiaE7IWbVgljDRknEejMatudlRlfo6E2ElpqIhIecpDd3+CACp54gc8S22
         Dsa3AeZVTvKqAXAD5Rq+nIK/0Yr9lh0UfzT1anQv1v8I38voK7KO+tC8lChtPsRmu+GV
         r/evczQqJVEVs/yk0olvUpxv0gNAX5oaKUz0+rvImnDTAkefCdqGs8qbWhK04fS4KF6o
         2ISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V80UGbFaefodELDsnmOH1hIVX1sH5nHYnUjMRM/2dyE=;
        b=MxQvg421NXPy6BGGF24z1A2nImqI/WX7tO22hkTZoTIKTZpe6pInGvJn662IiLpyWT
         rx0NzxOLibt922TxL+74MKT7A3v7Rze2isfAP6jJZ4s1jOYabpR2TmtvoixOvKFgMP7z
         0jUmUW0g2S3U7lRa310azuwnG5FUP8mE/n3VSJAyqwHiZ2cKmq134WLvgh/19R/xJhVZ
         QH8lRA6ETaiLS8Py/fqFQ8Gist8bHAJAp530DLWAneJ+9NBaggBrWfjJBVjfYYl/cGrF
         ZZAD2h3aXo+DeYXq0eAz4aKa30Ob1lLLfdojHUOgZhOznjED3OhnhZ93LK/pmqD6W+D/
         ZIGw==
X-Gm-Message-State: ACrzQf357b9ec7jF585PCnkCX/8lf8gjKHikN7xOm5A/p6CEFII5HxuB
	Kmd0VYll+bIltQJfFVp+oDsYgw==
X-Google-Smtp-Source: AMsMyM5mLUixD4AFeMv/fO9d/F4MvRCyMhpZRQgxNtDO833SzZnEAml0bZqv/D126e+xIFxmrHAMkQ==
X-Received: by 2002:a17:903:4d4:b0:17f:7ecc:88e3 with SMTP id jm20-20020a17090304d400b0017f7ecc88e3mr9668808plb.169.1667150785495;
        Sun, 30 Oct 2022 10:26:25 -0700 (PDT)
Received: from localhost.localdomain (118-167-185-125.dynamic-ip.hinet.net. [118.167.185.125])
        by smtp.gmail.com with ESMTPSA id q14-20020a170902a3ce00b00186c6d2e7e3sm2933881plb.26.2022.10.30.10.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 10:26:25 -0700 (PDT)
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	linux-mediatek@lists.infradead.org,
	"chunxu . li" <chunxu.li@mediatek.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH v4 1/2] ASoC: mediatek: dt-bindings: modify machine bindings for two MICs case
Date: Mon, 31 Oct 2022 01:26:08 +0800
Message-Id: <20221030172609.1635096-2-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221030172609.1635096-1-ajye_huang@compal.corp-partner.google.com>
References: <20221030172609.1635096-1-ajye_huang@compal.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221030_102626_714037_99AB849A 
X-CRM114-Status: GOOD (  11.01  )
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

Add a property "dmic-gpios" for switching between two MICs.

Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Change-Id: I5b59ac23e761fdc078a2227da14fe170c8df6388
---
 .../sound/mt8186-mt6366-rt1019-rt5682s.yaml         | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
index 4fc5b045d3cf..8c24cd1f1906 100644
--- a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
@@ -21,6 +21,13 @@ properties:
     $ref: "/schemas/types.yaml#/definitions/phandle"
     description: The phandle of MT8186 ASoC platform.
 
+  dmic-gpios:
+    maxItems: 1
+    description:
+      dmic-gpios optional prop for switching between two DMICs.
+      Ex, the GPIO can control a MUX HW component to select
+      dmic clk and data form a Front or Rear dmic.
+
   headset-codec:
     type: object
     additionalProperties: false
@@ -68,9 +75,13 @@ examples:
         compatible = "mediatek,mt8186-mt6366-rt1019-rt5682s-sound";
         mediatek,platform = <&afe>;
         pinctrl-names = "aud_clk_mosi_off",
-                        "aud_clk_mosi_on";
+                        "aud_clk_mosi_on",
+                        "aud_gpio_dmic_sec";
         pinctrl-0 = <&aud_clk_mosi_off>;
         pinctrl-1 = <&aud_clk_mosi_on>;
+        pinctrl-2 = <&aud_gpio_dmic_sec>;
+
+        dmic-gpios = <&pio 23 0>;
 
         headset-codec {
             sound-dai = <&rt5682s>;
-- 
2.25.1


