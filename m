Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65BA3CA9EC5
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Oct 2026 00:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X9wwtOfFZ3dlRyxA00OaR8axrYegTwtr34ydCtqSvyE=; b=fn5PwArXsqaM/gQjMMnwekZXIy
	AaLiW2NXmRSh2VS78tTEs46XuLGip9Pc8lYnC73Yy86hgCoG9+c+w/R9YTik9tn+MymBJpBuNbe8U
	Rfvu7AXo6jWc3FZxbgDlGFplFFaHces4z7bhEnG4qDdhFto4SoEci4RCu00y8dDGE+UNpBnA5Qhyy
	oedpWEWf7uMK5g7fIGNkj4RGuUFYqsRVkqAFoKMGvpQ6uJ8BCaw7BfxgSgq1RZw/8AXN+QKfUWg2Z
	7EfAwf3xX6TyhK0iEKSc0cv0jbSU+tmhDlcHMZRlpLP5vh/QYPyzVxOz2U6AKK7UO04EWZoiByLBR
	OJTkZ+wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFhey-00000008abz-3OVI;
	Sun, 11 Oct 2026 00:43:28 +0000
Received: from mail-qk2-x09.google.com ([2607:f8b0:4864:34::9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFheZ-00000008aXY-1bjd
	for linux-mediatek@lists.infradead.org;
	Sun, 11 Oct 2026 00:43:26 +0000
Received: by mail-qk2-x09.google.com with SMTP id af79cd13be357-930f7b1eb68so90556685a.0
        for <linux-mediatek@lists.infradead.org>; Sat, 10 Oct 2026 17:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791679382; x=1792284182; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X9wwtOfFZ3dlRyxA00OaR8axrYegTwtr34ydCtqSvyE=;
        b=CQCU132RW4pX4wcVovWpupWyVetpdHuzRk+dpHS4lVpCGqhVp3NSzgto0RTDEUlljJ
         SVBQyjaQNv/HPoj6SzRGBaYIbGmUOa2scVxmBCP8D790wXID/HKQ/Tg7ZRUM6zJpBpNF
         vmHmX5xwabxBGBjhyrZMlOChCecYZpakjcyHmf+/JvlOykrqEhIX67n077DayeKMKOKy
         zhyjflcThmuYgJVaZB/oa3pqZPUdvZ4ltCF+34cJwDfajS04X1iIPGgoZxtWVToPS+lh
         H7zl9+5am81NjnJNcup/82toXMnpdJ7ofwT17jtxkn59bkjeppQE/jMLvq/HvYDStXIr
         CmRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791679382; x=1792284182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X9wwtOfFZ3dlRyxA00OaR8axrYegTwtr34ydCtqSvyE=;
        b=T2oJw031UIXg9drvNnxQTcYUVoDEIOc1p72YEkWUIQlzie57zJxJpfjyZyyLlc8TsE
         V51tVyiDJMj9RMKZHs77oa6Z1BHLNTfavdzflaHrsKcVFNbnR8VmpW60NQuh4Ns1Qne3
         DgDzpXnoRt/5RUxGppuc9/Q6ktdOZKPH2k93AF8g3Cr4hCO17GmFn5Zo1Y1Rwpm/e3P7
         0lsr9Pc0FMKUlutF5hXLcv1ViOG03map3qBRyO6/9pCr/KzC5OEY5ak4E1iQfA6k7asF
         2s9UpuvU8Qw3jJ/jLRljyeEZE3kOBY44vGPaJmpWFe3Cfl0H3FSuX7D3u+cZ9SSgjgTr
         nLMg==
X-Forwarded-Encrypted: i=1; AKwUvBz7QiR6TrFFWsOVKqRNQamEDdZUqSif8yZ/NIyRTRSnca102wX7AFQDKwV1R/B4UI4ATNtmVf0nOwmQR+sKvw==@lists.infradead.org
X-Gm-Message-State: AFq9FYKCIATrmq6llkbNJoAWzjsRHF7L8cz6/wl5sverfSaZJFOfi2iZ
	+PnD7SD5CfWBC4hjdtrJHb8Ty6uYBDNl8jzUO3EONgpLm5IJIhHLcBFH
X-Gm-Gg: AYBFou2rEx5/EJpedUkeETl2z/i/Jl6xQb+qms9t+Spfq5sOFFL73ALLEmPEeyJxq5W
	YXCjiQDJY6pIS17V0Dmudxk1OtQc4RE6mGvZYFLr0c3a0QERFZt0Y0Kk5z867ArPv/A8LIda/v1
	MNdhpDdp/TNkeLYBB29sMrwe/8BN3P8PKjyt/51nkdqhbMPq063Mcvoi4mnx6ZTm311NVbqM74t
	yvzv2l7kVe3gHQ4tUOZR1lHCfgZ8qvSDAvytOxNheRS5Fr0bnyzXEXH50Ju5DmBMRd+hzss5EdU
	kYYplrip3OFMcfmg94knrT92w6Sz7saYQ5qe4oHo3QgVMry2V6by3GlMVY6X4FCt1vg/p93xnG9
	9d5VgaDaWXPpu1UfbCSFjHhvtXDG20my7CdOqPV19DHTsKqj4+gzxCv7HgOk2RNX/3wSSQARQHM
	TRk33AKA2upG/WvgqAZ+CMCzGQjFk9QqHez4pVjKU8AiA1XqlSqN28H5h+/DI7/4GdkXA=
X-Received: by 2002:a05:620a:3194:b0:93e:942f:b8a6 with SMTP id af79cd13be357-93ebd2973f0mr1024374385a.59.1791679382152;
        Sat, 10 Oct 2026 17:43:02 -0700 (PDT)
Received: from omarchy ([2601:804:8780:3df1:6ff:277e:31c7:ac13])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb9848702sm532320085a.12.2026.10.10.17.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 17:43:01 -0700 (PDT)
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
Subject: [PATCH 0/3] drm/mediatek: mtk_crtc: Fix connector route handling
Date: Sat, 10 Oct 2026 20:42:45 -0400
Message-ID: <20261011004248.1117649-1-agentzoan@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_174313_625009_7673B256 
X-CRM114-Status: UNSURE (   8.96  )
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

Three fixes for the connector routes of mtk_crtc (the output component
picked at enable time from the encoder in use), found while bringing up
the external display path of an MT8189 Chromebook, where one CRTC
drives either an HDMI bridge on DSI0 or USB-C DisplayPort on DVO1:

1. The route components are looked up in the private data of the mmsys
   at index drm_crtc_index(), not of the CRTC's own mmsys. It only works
   by coincidence today (the only route table is on MT8188's CRTC 0);
   on MT8189 it oopsed on the first HDMI hotplug.
2. Destroying a CRTC whose route slot was never filled dereferences
   NULL.
3. The route is only picked when connectors_changed is set, so a CRTC
   whose connector was attached or swapped while it was off is enabled
   with no output (NULL dereference) or with the old one.

All three were compile-tested with W=1 on next-20261008 and run on the
MT8189 board; the per-patch notes say what was and wasn't exercised.
The MT8189 display support itself isn't upstream yet; these patches
don't depend on it.

The changes were written with the help of an AI coding assistant
(hence the Assisted-by tags).

zoan37 (3):
  drm/mediatek: mtk_crtc: Look up connector routes in the CRTC's own
    mmsys
  drm/mediatek: mtk_crtc: Skip the empty connector route slot in destroy
  drm/mediatek: mtk_crtc: Pick the connector route on every CRTC enable

 drivers/gpu/drm/mediatek/mtk_crtc.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)


base-commit: aac26bee2287c88af5be5a5ff96d783b19a28790
-- 
2.43.0


