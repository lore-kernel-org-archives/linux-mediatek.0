Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A0A9FEA831
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Mar 2026 07:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WqEMkNh7cnEi3XsvgS5g5ei3L+mxqRTbNamH2sCwDdU=; b=xvP6eK7cjmBFixqvrYJGTqrlOa
	DQA01jED6RSN4Rx+RgqYAMJxzxTCUuDSOAENMQ9qXDeVJY2rxBeQrmBdmjGufA2FRSL3L17MkhBjr
	jL7KxnVNT1pqQ7R+hgcz5sKHI4Tw1NTDN9tTlvuRmfe+3TrzbhvavFG5p3hLFkJIpGbgoUXrvUdif
	g6EDmKmh384+xogZyw2Q9ayNs/3KTL7JruBAJCZRFxKAl8BFxJlFY/lGOK9iHISA6NtzAtKr8lhIq
	VwnsWb0NMjBECfaswU8DZm31++4Jc/SfAHxMwvfuOGWrO97OEmQLxgpJfhoNdbfKp5AlnqexrYwM+
	+zNTxCPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5J8T-00000002t7t-1LBt;
	Wed, 25 Mar 2026 07:58:41 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5J8N-00000002t3H-2IIV
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Mar 2026 07:58:36 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2b0603ee486so15131735ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Mar 2026 00:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774425514; x=1775030314; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WqEMkNh7cnEi3XsvgS5g5ei3L+mxqRTbNamH2sCwDdU=;
        b=EV2Pmegup/WNwInGCXO8NsdWdRaJ0S+LWcLX7NzweXqj1OlTrRZPwGrTOkYjtno5c2
         o2/WEuqaI8h6T0h20elYz/eg3sWPNpJjaELAL7jLpnHFf7X+0f+hoqSa7ktmG2W02ryg
         ZmhCjKyLuR3lHD/Wjog12q1Z1d+h2CvekmVRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774425514; x=1775030314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WqEMkNh7cnEi3XsvgS5g5ei3L+mxqRTbNamH2sCwDdU=;
        b=WVptR5SOWrMsaDp33bZV7+lVJ0ckp4hLmZLCRj0T4A+zp2nYQyu5O+PctoCUoisklA
         GhRSgOd7QzC1fhHbOkWbi9wlSEMIIJB+7DGxjhMHEEWZsZ5GnC8H5JyL3kGUM2yIKRXa
         YVDtHgVvKYsoKIntZpMuhBqbdqkTp/m+qg2RFi6VOtb2T1DGOiixKGgMAR4I4frtJxC1
         +Spn+z5JmFf7dEVa/eg4uWvqrxCUC/yzNKsqVXup5Hq2xIOj78IdcXmCVnI3or8XV8hJ
         watDiFF0yrjJVj89PxxKGbnv5B7WiZcFei7kPA4TyraeS30aq9sKHVedgS2gOxVJsgJg
         Y/ug==
X-Forwarded-Encrypted: i=1; AJvYcCV2T5Z6uBNYNq2XqVTSIFzrEVnnSI6wX5zt19ssjcgrdKlJhjyVWOLZ+s+UXQ57h1DTRvf+UgwLEcVaOoximg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxrkVZ29XpG5BBs66lO8bVUlqPFRDT3fC34OoIZwOqFhWfscYm2
	0B1MDUB5BcuGvSCszFBsexVyDcw3Jz0CMM1XVjvzC9kBLoTu96Bib6H2/2vaOf7Wog==
X-Gm-Gg: ATEYQzxQcD5ZXA/fzqfn1l7Ld0YxX9KH8/18JntoKGnYFBjdpHzVw9NcaT1Polu7aXq
	cd/62B8/A5DrKOYfTOSnq7rHDYOm9J5x229KSMF9dL9vQffshif/etYmmSkV7c/MFI6Hy9vMFCJ
	z2ZPO64CDDae4TaIocISR8+NDVp2+8ZKohyZLCUX16amo3QIWKTbECSLmjG2uDbqWQno5qJkHOI
	s7QD90TekEZsN7HRIVXrqJm8zfbaTZSgnU5uFYokldaCGvYYStsayJA6h5Vds0cPNeHEamdITtC
	jX4OzMR0au6pVUD8qkR9LmL5sO7a3wE1toTN/EWFR27M/SNuVY78WsXkmBJgKpF7smUOm9boIR5
	7H6ErsA2NCGwoovEvcH0RMGbAcfyXx9GBsQ2j9NWH37HPcybmvdgsordsl+YRmRTzmU0cyP3Emq
	ogsOdcLby4JFl82zKv/8bGXW4063boY28j7AxegAormPH9/8nLRvTTxW6nwZjkdrFRQKagc07n4
	OJQyUs=
X-Received: by 2002:a17:903:904:b0:2ae:c5fc:b2ef with SMTP id d9443c01a7336-2b0b0ab4cdbmr26299735ad.30.1774425514658;
        Wed, 25 Mar 2026 00:58:34 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7ff0:bee3:7d45:eab])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366c3f7sm219682465ad.60.2026.03.25.00.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:58:34 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Icenowy Zheng <icenowy@aosc.io>,
	Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 3/5] dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173 GPU
Date: Wed, 25 Mar 2026 15:19:47 +0800
Message-ID: <20260325071951.544031-4-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
In-Reply-To: <20260325071951.544031-1-wenst@chromium.org>
References: <20260325071951.544031-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_005835_582754_5A347949 
X-CRM114-Status: UNSURE (   9.06  )
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

The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is one
of the Series6XT GPUs, another sub-family of the Rogue family.

This was part of the very first few versions of the PowerVR submission,
but was later dropped.

[1] https://lore.kernel.org/dri-devel/6eeccb26e09aad67fb30ffcd523c793a43c79c2a.camel@imgtec.com/

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes since v1:
- Adapted to recent changes, now only adds SoC-specific compatible string
---
 Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index a1f54dbae3f3..53131cd4cc2a 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -15,6 +15,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - mediatek,mt8173-gpu
               - renesas,r8a7796-gpu
               - renesas,r8a77961-gpu
           - const: img,img-gx6250
-- 
2.53.0.1018.g2bb0e51243-goog


