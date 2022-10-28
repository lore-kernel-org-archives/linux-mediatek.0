Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B71C38A02
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 16:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MFMOsXdTB5Df8ggzsilthr4+D/qAdNxZr6+urTN5nT0=; b=YpYggObE9gKca9WBgtH1t4TmS8
	mkPSA9iOWl3iwmZD0OzQ/voo7H6XfAx+oHbCP9jAwMCyMlFpU6Co3KdzkOyMhQMDmZSjSgQ8sRqvm
	rB2C5tCuTddytQ4RrjXdpBi/zVtmGuY1jZBX21YtUMHlGS4ACdIO+7qO+XKT9RfOr4P0cY8IADTa/
	8yBm/dplu26oAAtqG5PFnAkYN8cXb6qK5caTo8blere0WqSkCi0mRKWWUYcyre3VWyUAj9yDx4l1C
	S0UKQqpmB+8yLD7sc5hbuXHD95v9MeSBWiQeevvs2CE21qcnOPtnsYNadtFaZ4lEl/l6Jav/a7Y2k
	KPh30YzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooRtz-000n77-Si; Fri, 28 Oct 2022 16:08:11 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooRtt-000n2D-O6
	for linux-mediatek@lists.infradead.org; Fri, 28 Oct 2022 16:08:07 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 20so5221528pgc.5
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Oct 2022 09:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=compal-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MFMOsXdTB5Df8ggzsilthr4+D/qAdNxZr6+urTN5nT0=;
        b=zZC+U/aHqGW7IFAZAT+3MMfxAOCLrwRbrJkGx9aRZlZrEK91b5LV1yRvLpqRDKms3n
         HHh3MTsvqFGJ/6gBEXzoUu4QNQm4x+M5zMZoHQSh1XrxC7dP0sP7PaqvUHScU9mHRVZj
         Pm1N6esyC8jfpG2CkBLI+W0+OkuIIGw2WISEC4Bl8RmLPYpj+fWY7axdG/qxuLgSUpqN
         tk1FQm/M6TntPVogLH8KS2suatkgPh4NfmWHdJUZvlsHMqlNK0wBiWnzB+ays6G84Dyz
         akSHt18VG5GweZWQkvuufNNZ4ndduvth9ndhCjRTuaof2qnOxK5OI5l4exDYBn3s1wbV
         ETyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MFMOsXdTB5Df8ggzsilthr4+D/qAdNxZr6+urTN5nT0=;
        b=WsuH0Pkfz8JqBtAZOL89lQEDim3jBK4WaQwaKPEeMN7oLUDRQKoFd5NQ9P2eotKVOA
         l18lebg+0SyStVV4TVVMUxTAEsBpqFCBsHTgfKkbrGjFfYTux0BXBxycoW1H5Gs36j7H
         Xwmr3rZE+rwgsu6APK6gwMje2PpyuOqPy7na0EZfLJlwyoB5vdZUPGDwSFZEf86KlT7/
         3Bn9DMMOREk+KjfBqUPlPZGjIwNzlSJIXeC1Rnob6z/i5lNXSqoNzis7KwId64iL0wBv
         5THKr+CNC6QDgL2YiShWucMxpnK4gUN6Djo+rMgLq2JJRUPZMK67XiWzFPzZvrQdVRIT
         Aaew==
X-Gm-Message-State: ACrzQf2g7XFu76r3jVESxejdD5WYX0M4IFmiI+ZqmfWG2KhWoaWvkqDl
	ncIV3bPULfdrc7yr3bPrt79XXw==
X-Google-Smtp-Source: AMsMyM7yJoeG8ckb4rHiQkGpwA6IxAzvmzG5yzqEtCKG0mybBC/dVnuYOEDRHXiy3eVt9wfYq8Dirg==
X-Received: by 2002:a65:5b0b:0:b0:462:da7a:1ded with SMTP id y11-20020a655b0b000000b00462da7a1dedmr179239pgq.605.1666973282863;
        Fri, 28 Oct 2022 09:08:02 -0700 (PDT)
Received: from localhost.localdomain (118-167-210-30.dynamic-ip.hinet.net. [118.167.210.30])
        by smtp.gmail.com with ESMTPSA id b70-20020a621b49000000b0056abfa74eddsm3112071pfb.147.2022.10.28.09.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 09:08:02 -0700 (PDT)
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
Subject: [PATCH v1 1/2] ASoC: mediatek: dt-bindings: modify machine bindings for two MICs case
Date: Sat, 29 Oct 2022 00:07:32 +0800
Message-Id: <20221028160733.1390230-2-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028160733.1390230-1-ajye_huang@compal.corp-partner.google.com>
References: <20221028160733.1390230-1-ajye_huang@compal.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_090805_813476_F213075F 
X-CRM114-Status: UNSURE (   9.81  )
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

Add a property "dmic-gpios" for switching between two MICs.

Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
---
 .../bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml        | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
index 4fc5b045d3cf..212d2982590a 100644
--- a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
@@ -21,6 +21,10 @@ properties:
     $ref: "/schemas/types.yaml#/definitions/phandle"
     description: The phandle of MT8186 ASoC platform.
 
+  dmic-gpios:
+    maxItems: 1
+    description: GPIO for switching between DMICs
+
   headset-codec:
     type: object
     additionalProperties: false
@@ -72,6 +76,8 @@ examples:
         pinctrl-0 = <&aud_clk_mosi_off>;
         pinctrl-1 = <&aud_clk_mosi_on>;
 
+        dmic-gpios = <&pio 23 0>;
+
         headset-codec {
             sound-dai = <&rt5682s>;
         };
-- 
2.25.1


