Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E851BC43602
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2026 15:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7SSWQg6HrEbpp/1xgGT38ar/90z2MxrGW6oImpnAmb0=; b=Ag3Ykwm/EjvroRF+6a1a19Uuxb
	csEpvjjlKrsjYENj9GD0ern08/M4A4lqcxpm6Atv/ZPMba3zr9GVL60GJmNpytQm3LVe0PnaVrPrG
	iVnmEEGQQC/nwwCeMzP+yfVfXaUEvWeIvnyjscYf5Qy7cc2sXnlZECO+a/pRolKg2hfoTJa4bYIco
	JQUaRiKeNT7IABGh0Dk53K+3dL59l5SIbkTbFMo4/UJJK4gniRc+tBpKpWFQ8Lwn/6AZVpCpqbvMR
	5tiWg92di3F7eH71OdgLs0O8XLNrfu8LgothD7jTbgyoyglObaySk7o5fBr4KXKmKDHarrGSWVKKa
	+oP4nDOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7Mk-0000000FFGi-07JR;
	Tue, 07 Jul 2026 15:05:42 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7Me-0000000FFEC-14Jv
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Jul 2026 15:05:39 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2cad4170e8eso51732275ad.3
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jul 2026 08:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783436736; x=1784041536; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7SSWQg6HrEbpp/1xgGT38ar/90z2MxrGW6oImpnAmb0=;
        b=pxV6ZV120m1PsMPpaxl1fWqKeJHZRu11CCJRfThXUFwuq5KSgTtjsI/R3n92/23eWz
         iNAr6Ru4+oObseSJnHhu8l3aIrP5wx1H4E0PLgnBTyGHvp3lptTnIvZTRulGzd+lMmFN
         SGuSC+OCaaxTenczr/xrkK0P3+46jru62E2ilT3sCP+4YBG8p+c3+OqN+n3OPKyZjrbv
         rSRKvQ/1KjV3jcXl8YW6TYknbUeakY1+T06Jb7WHE0/luZxo+HnkneoexbBYviysiiMM
         ir98g/8KzBYqmTDIaXLieHKRJWDvGOJCyrmBp2AMtLgyGGSi4w4B/SSSnNJBUPwcHU/n
         3ArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783436736; x=1784041536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7SSWQg6HrEbpp/1xgGT38ar/90z2MxrGW6oImpnAmb0=;
        b=EXZBsuiax+l5B5ZOPExSdkGW7q8b5ZTFLljzNKuf8K4fQDi6mbdosEsoz/6zlSCn4u
         bSRtN27XFXdGsaTs/rf6nHFejX/WutTgwSthRiB7uRe4ZGpAhHIC4SvVytdsI/8Aqn1z
         C4LkgLxGvMDrUw7oCixwoP8n/Zl3ySzH92QmcwAWLS5Gm4aOKiLRlRv96BjBLw2IgtVm
         ipsl4TMDqwA0AoaPuDtbCjEjSeygJ2n5zM+lfofsIYvEpZqSNpjM/rNPzYeXQGthZmqH
         xzNMpwG9HuyqPfNbdhYFDoohwFHTEOnXcfgTdkqvLEwJ7AB33O1I4yioLJWGy5S2cUH6
         Y2iw==
X-Forwarded-Encrypted: i=1; AHgh+Rp2K9lLq4bYYz80zOGjp8m6c6n11TRZbmAilDGN4hmWkn75lNoFp0x6ipuud61Uyk6Oc66gWUhv++TveQ2SQw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwxwP2ft6/BXJeKKVARk96R3CtaO3DbQbCU0oxYDaJF5OKAvCWW
	DtIhIlFvkV/Sn/SL01hFh4UETGZ9Wco81fqniKSU1taOlk2vIr6y3Z3l
X-Gm-Gg: AfdE7clG4Rp2LIRd2k3BRGmsmTKX3FzBDkeMnfm37lynHJqnpcvDyF7RAIaESNTNRit
	C7HJ5jUS/ii9UIu+0bSsd/W8DUBhbcHyIt+XNZkpqry6B2ESjNNewIOP3EzwXOQ/8k2tQ9A6Uur
	Y1opWDNKgak+/h9O3VdtsAT8A87TkiEEKd/Dmt60JZ+N86LPuXiyA8N95iuGj8hlWYY1eC4vNnx
	bFKJrT5J3cn1r1SD/fjps0//WfhTZ/Ftg+/NLlgqIxg7AUzNp74VCbSaZsmH075b4zei5V9Oj2H
	N2pw0Mfmc4hg4QhXFCjfNLzQ4PQvN+bfalOB4w6LYht5AqCfEK8XX6D1KWWdDLXgt8e4PEBTb+m
	K7xBrUOoGmxewcVh48Jux6ChqtdrRbHBJq5hAx4/YrNOckwKovEFZTjTBOPFDG7O+9i3A3EWvcM
	oWjvmSrymHrbFAP5i+5jkH7fDtGhovKli3
X-Received: by 2002:a17:90b:4f48:b0:387:e0bb:57f6 with SMTP id 98e67ed59e1d1-387e0bb5c07mr2778290a91.39.1783436735574;
        Tue, 07 Jul 2026 08:05:35 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:239e:a31b:1d0d:374f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d229a20csm1284197a91.16.2026.07.07.08.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 08:05:34 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] drm/mediatek: Check CRTC state before freeing
Date: Tue,  7 Jul 2026 23:05:28 +0800
Message-ID: <20260707150528.2270739-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_080536_291855_F21DD22A 
X-CRM114-Status: GOOD (  12.38  )
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

mtk_crtc_reset() destroys the current CRTC state only when crtc->state
is non-NULL, but it always converts crtc->state to struct mtk_crtc_state
and passes the result to kfree().

When reset is called without an existing state, container_of(NULL, ...)
does not produce NULL. Keep the mtk state free in the same crtc->state
guard as the helper state destruction.

This issue was found by a static analysis checker and confirmed by
manual source review.

Fixes: 2d267b81898e ("drm/mtk: Use __drm_atomic_helper_crtc_reset")
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 8e552cdc3b53b..97e3ff412e6ee 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -154,10 +154,10 @@ static void mtk_crtc_reset(struct drm_crtc *crtc)
 {
 	struct mtk_crtc_state *state;
 
-	if (crtc->state)
+	if (crtc->state) {
 		__drm_atomic_helper_crtc_destroy_state(crtc->state);
-
-	kfree(to_mtk_crtc_state(crtc->state));
+		kfree(to_mtk_crtc_state(crtc->state));
+	}
 	crtc->state = NULL;
 
 	state = kzalloc_obj(*state);
-- 
2.51.0


