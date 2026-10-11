Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB6ACA9ECA
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Oct 2026 00:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w/oAaJptKR3nQekIsHSFFz9kgi+8N/4Ku6bTVc5nJSg=; b=LN8vNmWo5X3EtWwTxhKPF8rkke
	jn/nv31r65tVqbMMCW6SsSDinwLIRWzRU1NKBWcUire/zVaiWu9xIRfVeOvII8b3IckLIe/k3UgZR
	HB5xHAlxuHWcZv0C6XHR+eidc8o1XH+0ni92j1+cs5sgDjomVM0KFbO0sYxc9VxwmO9v0brbU7Zga
	uQzIX70XJUHezthl2OJZXwZcvRPKK40T5udH0jYDTaTOQ/mfVtCq/MqXOJbnL2LHzicjNJ/V/uOZZ
	2CpcghG+Cig1IAw9t/leAs5fl1Tfaew2kynnQPXLJBcRxOa2Jps5cP3MuTBnTa+Yqsh3AJ34Wckzg
	wJ+y2o+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFhey-00000008abA-1Rlc;
	Sun, 11 Oct 2026 00:43:28 +0000
Received: from mail-qk2-x0a.google.com ([2607:f8b0:4864:34::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFhec-00000008aXd-0WUo
	for linux-mediatek@lists.infradead.org;
	Sun, 11 Oct 2026 00:43:14 +0000
Received: by mail-qk2-x0a.google.com with SMTP id af79cd13be357-930f59d1dc6so59594485a.1
        for <linux-mediatek@lists.infradead.org>; Sat, 10 Oct 2026 17:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791679385; x=1792284185; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w/oAaJptKR3nQekIsHSFFz9kgi+8N/4Ku6bTVc5nJSg=;
        b=doVQMTAKEcjZ+pUa1VoYFyBAPQz8fMiKlLuRuPnXHB9CVsJ7ZQmrt9h7Fku7Lja81Q
         GXVujIg0WWMHA6dQ9shuH1vW5YcnQ2uoxqb+XWfwsERYKdf3XY1/jcdCWw810iaOUghY
         LTS5fsU791gjadH1r0aT33ddkZ4yMqQdtsd6pzGROV82jfutJKMTN/QbWhxWyiCHhYjh
         L3BB3uY13VxtVTZGIwF2bgPK20J3wjKzj0EZ3HCLzLLT0T/kDjpE2j3vs+49QpW8HWdj
         U6aI83OAZy/1lW6EgQBejPvuSI+OxkfOGKivTCxzsCi0uOiN+0TExQVtY2bSv1DlOuhH
         nI2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791679385; x=1792284185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w/oAaJptKR3nQekIsHSFFz9kgi+8N/4Ku6bTVc5nJSg=;
        b=mRyjnue01gPnN16NNRElBfiWbTJDeUH1YMkNtXFWt6J2ZUJY6dGhfgL+wIN2YaeGrF
         7CG/bc2YRStfMMmQntnZEKnRKar3+uFtXAmZREWNfT21hkF324qzZt5ExRVOzH2f02S1
         aYL9cZzd3y68JcALXDiLRAXJbRcW1JlfwJ/O2Fz83py2Xi1f0MRL0ziIGvAdrKS7ImnK
         Vk7WojlqIb9NNVVRpiG+GR+CQFpV5tqhgMH0jwXt9C9W2nxCpS3tHh8WhwxgIqdiN2Q5
         55V9fT942szL0eErN9+zbjgeKlCdrW2ae62UCOtlAluZ0sMCiYnul4iMt7jqF0j23FmG
         Jekw==
X-Forwarded-Encrypted: i=1; AKwUvBwy/ddrNy1IcPhxKOu8ozNsqFCyeJkZvQqopQ1WpiO1kCCLQMR4fP8SSM9ZXJqtCp/8YoeZhgD+eCo4h/vqNg==@lists.infradead.org
X-Gm-Message-State: AFq9FYI0N3oMS/DkBpi5IO0FhCg2LImrgZR6nAndSxg4Ih9IjoJouYZK
	QbueFi1SHueJxVb1r8O1bq8uXUh0i57zT/5hq9dCZlmXCp9qn0x4VvCz
X-Gm-Gg: AYBFou014aCSw5JpohLLQ7DeyY32xjFlhVC9XCVviGgs5RFYuBpTyjJ399mbjCFs0XV
	lcE5IHzY/bYxDUEYu7M54CpgllASiTMxUMc75QfYe6Lx75VSGfknsw2o2VKMeamCVyfc6z7dWMn
	PBG3JYvoeBrNwerIheubd7Vwty0ovN+oeaac04/6lfUzNa1w1bZfzlGsFBQaLQ9lyeJUF5+kg4/
	dnuVG2oDwFWTJ16U7IVivEbXWnUqebRWAG4WEC3KJWUXbjL833puOmh1HW4qIJOrXA7htWhN+DN
	IWbditpH66PvCh+n6wsz0tadhz4cvw+PEoeegiWdtrlDXPkPG3wpl5wSu+w8WKdAMGCZhS1iRh1
	rr4bKoSD4lHUBifQPbIS4CCwKLnR4TVOnL4n0uXleaJ5HSIRY9f6iDH0s052xDqGhhx8yuq3VrW
	DM0xY+w9OwUPB4ytxAXrBll4mRAOOO/CX8Kso2iLkK3xhd0JxuUDEGGOMNnwFH0hr1yQqG3FDrU
	02UPw==
X-Received: by 2002:a05:620a:c53:b0:93c:677c:778d with SMTP id af79cd13be357-93ebd29275cmr999021285a.59.1791679384961;
        Sat, 10 Oct 2026 17:43:04 -0700 (PDT)
Received: from omarchy ([2601:804:8780:3df1:6ff:277e:31c7:ac13])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb9848702sm532320085a.12.2026.10.10.17.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 17:43:04 -0700 (PDT)
From: zoan37 <agentzoan@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jason-JH Lin <jason-jh.lin@mediatek.com>,
	CK Hu <ck.hu@mediatek.com>,
	Nancy Lin <nancy.lin@mediatek.com>,
	Nathan Lu <nathan.lu@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] drm/mediatek: mtk_crtc: Skip the empty connector route slot in destroy
Date: Sat, 10 Oct 2026 20:42:47 -0400
Message-ID: <20261011004248.1117649-3-agentzoan@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261011004248.1117649-1-agentzoan@gmail.com>
References: <20261011004248.1117649-1-agentzoan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_174313_622028_9AC9684F 
X-CRM114-Status: GOOD (  11.41  )
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

A CRTC created with connector routes gets one extra ddp_comp[] slot for
its output component, and ddp_comp_nr counts it, but the slot stays
NULL until mtk_crtc_update_output() fills it in the first atomic
enable.

mtk_crtc_destroy() walks all ddp_comp_nr slots and passes each one to
mtk_ddp_comp_unregister_vblank_cb(), which dereferences it. Tearing
down a CRTC that was never enabled therefore dereferences NULL: unbinding
or removing mediatek-drm while that display path was never used, or
an error in mtk_drm_kms_init() after the CRTC was created.

Skip the empty slot. Nothing was registered for it anyway: the routed
components (DSI, DPI, DP_INTF, ...) have no vblank callback.

Fixes: 01389b324c97 ("drm/mediatek: Add connector dynamic selection capability")
Assisted-by: LLM
Signed-off-by: zoan37 <agentzoan@gmail.com>
---

Notes:
    Testing: found by reading the code; not reproduced. The same check runs
    on the MT8189 Chromebook described in patch 1 (boot, HDMI/DP hotplug,
    suspend/resume), but that does not exercise the destroy path (the
    driver is built in and was not unbound). Compile-tested (W=1) on
    next-20261008.

 drivers/gpu/drm/mediatek/mtk_crtc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index b54f8565d2fa..704931b369b6 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -145,6 +145,10 @@ static void mtk_crtc_destroy(struct drm_crtc *crtc)
 		struct mtk_ddp_comp *comp;
 
 		comp = mtk_crtc->ddp_comp[i];
+		/* The connector route slot is empty until the first enable */
+		if (!comp)
+			continue;
+
 		mtk_ddp_comp_unregister_vblank_cb(comp);
 	}
 
-- 
2.43.0


