Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C336CDB465
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 10:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5wsY49uZ0sW2zj7EjCcx/YK/WYmzlSkW4xxNGfJP9+0=; b=S07g0BWJSZT8Q+0pBXKbPJNzSF
	Bvtf/sCQFRA5lRtlxxpdfIqGocJIsRBCFh+Z91VkSM7HX5WS1iNBuqblx5hA1KQ67L0IiYgSFPJNU
	ETXdlZnevLuNeVLF8l/0nG0NyzBPUGjVSW84l2hhMGhcW46YoCgotB4fffw4IH094FRzrTMcKXyM9
	5uWSjgYAb0vIXfde2he4qEZXhmCFVCRzlK01FqdKiM5SjWITvsM+XLKNMv5k1axoDaUtmM+uCPHdk
	YcPqJAcVThrb+/fQ53mNJYXtK/HfIGfSulZDXgRsFG/SNHoD90lghU6JMLClTVYigb0AcCCFFgKM1
	aRsNrUsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtPsU-00Gtx8-04;
	Thu, 19 Oct 2023 10:03:42 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtPsP-00Gtv8-1O
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Oct 2023 10:03:38 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-584042a01eeso81164eaf.2
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Oct 2023 03:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1697709812; x=1698314612; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5wsY49uZ0sW2zj7EjCcx/YK/WYmzlSkW4xxNGfJP9+0=;
        b=umUY+Z3Df8NBTRxH9zZuZ6wSBLr+aQOkoHwFIlL3XJzlZALblRLrAmXBjX7v/kRr+2
         l2sZ1lZljEF+hMpzWFKaxE5C8kJ9qX7uYqVYhcPxHtW/n3YFZPewzhugFvprVfIY0Xkz
         DkFcRRrc8YnjIJo4zwpGEkuxIomMNmAj8kBrz3uy+FMImCornkfdA5oA69PagvaHIBma
         CkmCCEhmxQOkI89lcaOdcWMOg3FhPonjrmVpf+vgFtq/F+MA3ft60VrfTduDb8u3f7qt
         dSMhKSA5UdZ98MAYHwgms6+QqCnYyp9cMWO/kS4m++1qegCfqgShHT3g2jRs9P+eRQlz
         M8vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697709812; x=1698314612;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5wsY49uZ0sW2zj7EjCcx/YK/WYmzlSkW4xxNGfJP9+0=;
        b=Z5587/XjbLEDUGAYeWOUFX9WXJ6feAjZVhTRp6hkPyp8XlyItliKcitXoIgiGH0IE6
         iKN2KOXsKhzsbdYZ5tHilBtAY41S4im8/7Pj+PQAcI2iYYHz8S1CDzhnKkdrs9Phutwd
         HX3wKRQnmi5D4LvQ0BhxtWOgVsBcA1NuwbpPwHhs2N0NUHqXGKkkjjvrzzmBJM83+kfQ
         BlzBiqFmPsWHv0nn2rLZqAwqaFc2gJQOQWY3rgjb2ndv5GYbch+xmc+FHdPFJs2AbEsB
         F7GU/doJtLG13KXTm5Z5tYlMz9smnIRBXwCfZbBzIvEu+z5ZuMpuKXxi16lxWMRVQ+Su
         zkhQ==
X-Gm-Message-State: AOJu0YyyXrLVr4sxIS0/C9eKpU6/n0LOgF17hMkdppXvwm/KYFAfSyhs
	W+KjzvDrkoLkCWOinQ+rpFva3Q==
X-Google-Smtp-Source: AGHT+IFRtM1aQjA9L8wQX9Kq28giIwiNpXL5LKBilDP5tSmVfdlclp57rVoPeY14GdZt2QNPKW0YwQ==
X-Received: by 2002:a05:6870:40c7:b0:1b0:3cd4:76d5 with SMTP id l7-20020a05687040c700b001b03cd476d5mr2081463oal.37.1697709812589;
        Thu, 19 Oct 2023 03:03:32 -0700 (PDT)
Received: from ubuntu.huaqin.com ([101.78.151.205])
        by smtp.gmail.com with ESMTPSA id o9-20020a655209000000b005b46e691108sm2606680pgp.68.2023.10.19.03.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 03:03:32 -0700 (PDT)
From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	perex@perex.cz,
	trevor.wu@mediatek.com,
	jiaxin.yu@mediatek.com
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [v2 1/2] ASoC: dt-bindings: mt8186-mt6366-rt1019-rt5682s: add RT5650 support
Date: Thu, 19 Oct 2023 18:03:21 +0800
Message-Id: <20231019100322.25425-2-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231019100322.25425-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20231019100322.25425-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_030337_471585_3A5884B0 
X-CRM114-Status: UNSURE (   7.16  )
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

Add new sound card "mt8186_rt5650". RT5650 comes with amp and
earphone codec.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
---
 .../devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
index d80083df03eb..bdf7b0960533 100644
--- a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - mediatek,mt8186-mt6366-rt1019-rt5682s-sound
       - mediatek,mt8186-mt6366-rt5682s-max98360-sound
+      - mediatek,mt8186-mt6366-rt5650-sound
 
   mediatek,platform:
     $ref: /schemas/types.yaml#/definitions/phandle
-- 
2.17.1


