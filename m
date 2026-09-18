Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADA5C982D8
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2026 17:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1OQlNCcXAkK+hbxqoynuSjH/ynOWBUHLK9W984JsgL8=; b=sRH/ZfoonHhCxyKlx94MdFS72A
	5YaBZQI1RQlSJAAO+WrhZvR4OQlAmlqKKuTlDLNUu/QTsNf1MBr4MVmrl2dYC/v8ametc5IOBdTrm
	9prKytufiL8OMkcne3STvHxurZS6wmRDt9SxxN+gIEhPOKPEbvrTC8Vws7+slYw7Qv41xxvH8cCUh
	mwVzd9ru0Ve0bJIRJ5Oh5RS/tZ1D/JpNvDSTDu/NXz4ZpfNrHFxR2df+6EISI480AVdiCoLd0dfVd
	wH52EoKqC3gFO0DmL0n1GzvE8UjNeTFxK2wwyOdS+QWARJEu9R80CeeERAdJePQYNiabmbYEvAz89
	EpEgFQMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7cqP-0000000FEW0-0X8i;
	Fri, 18 Sep 2026 17:57:53 +0000
Received: from mail-wr2-x12.google.com ([2a00:1450:4864:30::12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7cqL-0000000FESS-2hlk
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Sep 2026 17:57:51 +0000
Received: by mail-wr2-x12.google.com with SMTP id ffacd0b85a97d-482f6356f6bso835412f8f.2
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Sep 2026 10:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789754268; x=1790359068; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1OQlNCcXAkK+hbxqoynuSjH/ynOWBUHLK9W984JsgL8=;
        b=PABagdAyzPQFZ/Oa/dYuNcM6tV5V7kdRbKgXgaCFZr1X4FSlsqBLt2K55z3snu/8YM
         YCt1SiXV8M0+HXCMFCNcXx3T2EK42Pcez7oFeU5BBHJxubgeIeBnYTEkATnHyhZGMQVy
         lCTfXmiWpPKJFVuY0/747R/GnwGRabA/BJiEIsBDfVKAC57H74T77n1hkIkkEObkkEZw
         gmCZuAGNH8osnHg5+sTWjbhaCmFBc7War4FWouVKs29ZoxDQkr5nH5KUt9E0BmCIVEre
         oxpl4nWAan91O3S9j3OuTOsDgd9pVovGQgABOpsFRgg/hesg1BGpGbZpNuHnm1Sl2Ak1
         cG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789754268; x=1790359068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1OQlNCcXAkK+hbxqoynuSjH/ynOWBUHLK9W984JsgL8=;
        b=sd916AxlVxN9wT+KAEDALNuqSfi6sqwt/wDFkvMk7Bpyw90YB1ZILcCFgNsZO9xQyS
         WNR4M+dhRywUHkgnrp0dyX4qg81OhOMKC0yyNS3xSEIijt2ojorY+S0udK+w32zlTyWR
         7lDeiQ7VXZRtdnCZEztzQsXZIZ5Tb8c+G6mDj5g7gOpax9Y8W+B5UHZaTCdY0JNgQ66k
         aWqotx9J4GK78nhwhgB1KbAWaQ51fVs0BVibTRzk+vT64H6hyy5O+hb1MQ/J6rCF5AYu
         av6yZas+p4eKHJRju27Lt7FBhm9We8KP6W17kBwoLZYVfn6O3Vx3NMW0yk+nJd0hYs7J
         yGsQ==
X-Gm-Message-State: AFuF++lZBlkSCmUt2laxw+r6yPMPhLtnr1+C1xa5ib9mprGmLKyA+T+b
	SkWTamLA6p68uWqvGvTCS6WhOoD6lq+qm7P+LcR40F3ued+Z22fQ6C6HFWvEBygl
X-Gm-Gg: AYBFou08G3JNHzxmd7sWjP/wqrIRaaaB3Esx07wOs/L/ewa8yVwJUNJ2Ier7pnRlqR0
	ne/JEljTyia6vRpVftz0M1Pi2gzeT3WK6qGiFFTvjPz6aa1TwzFQWZcMqykG/R85TmD0NxTxlK5
	MwzvE6vDBCyGUr1AppToVhIHlY+fxh95y3NOi5Ws1kbWTuZ4Q3bxRFMtVKm0Xbib5FKqNK7D5WL
	cd7nrrrpz0PwcP7em/Qj/b+p1EKcNRUkAVq1FllUmiFCH3kBjxh38hYTor5kIe9ppseyF5oKAJr
	h5eSzF+znXaju3UJWVFkTRPAJM1gYuFPYl6aN1HyTNnvblou0muln04SboemZIMCUQBQhsYBSRM
	v7qqZC8GZjZszHhwolLh8+O2CPwquolk6gOViNfgMnqEwdjv7/xhT6XoSIiNhK6NqDuOx/GD/o0
	JiRCbF4fTyEM2D+dRK9sX+fUB84q135stJgazGw4M6IZMtmzg3kFEZLRgHP0aqgQqXCvY=
X-Received: by 2002:a05:6000:1785:b0:486:f282:e66b with SMTP id ffacd0b85a97d-4871e20f97amr7779772f8f.2.1789754267647;
        Fri, 18 Sep 2026 10:57:47 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724562aebsm268461f8f.14.2026.09.18.10.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:57:47 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Jitao shi <jitao.shi@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/4] dt-bindings: display: mediatek: dpi: Add compatible for mt8167
Date: Fri, 18 Sep 2026 19:55:25 +0200
Message-ID: <20260918175736.355305-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918175736.355305-1-l.scorcia@gmail.com>
References: <20260918175736.355305-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_105749_699430_F376D7F2 
X-CRM114-Status: GOOD (  11.13  )
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

MediaTek mt8167 SoC has two Digital Parallel Interface (DPI) blocks,
one can be routed to a DPI display while the other is wired to the HDMI
block. They are not compatible with any other device, so add a new
compatible to describe them in the device tree.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index eb4f276e8dc4..6cd96a5cd4ae 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -21,6 +21,7 @@ properties:
       - enum:
           - mediatek,mt2701-dpi
           - mediatek,mt7623-dpi
+          - mediatek,mt8167-dpi
           - mediatek,mt8173-dpi
           - mediatek,mt8183-dpi
           - mediatek,mt8186-dpi
-- 
2.43.0


