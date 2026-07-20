Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755B8C44515
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2026 08:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VFpLun3aTRlN5AWiLiGZ73OhLT8cMhNwsTldXssx/wk=; b=0PfrMm4I1G+N8SI5InnOMm0vQq
	9MZBTdRQYmBjgMvSWPZ6gr4DW6HIaz6/7O/rIP3H6xJxDZNHwXsfcg9MP+WvFk6lBsh63ZNSU/Xxm
	IrmrDm5Gx+IP+ykvcmueOORzd4T3ipuCTQC1wyH1WiI105H9KUsFmKMWiRwhAgd+Eq8FmXBNoJqqt
	lKKrBsEvZLq1SyuAoRDVzXnkw7uj4bv8aNMfKHXhCiT4SbTarASGzLOzOOu6hAVk88Eh3tg8fM3Ss
	RCksoeqoPRmvQO9BCtjiVIHNwc1m2FI7Q70d63/akqIkxOTWx3yNb5Cc4WjDMIRnXmJmDRiX1B11G
	ssqay5vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wljpN-00000006Foz-0dMb;
	Mon, 20 Jul 2026 08:58:21 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wljpK-00000006FoL-3AsI
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Jul 2026 08:58:19 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-84a2dcec51cso8864525b3a.3
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Jul 2026 01:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784537897; x=1785142697; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VFpLun3aTRlN5AWiLiGZ73OhLT8cMhNwsTldXssx/wk=;
        b=BwDc+Szn2lweApjqh3FPs1zd/kOHERPgs9H311opgp1vC1sOAdS8M8e43pHoyRF78G
         eUOKjUow5mmbY9uGLXFdz9mrkeivLtlbd9UYyJRV6jHNijgwXutbTbF4XldDN9a96pns
         YhzXm3Z81WzvYwJwBexDE3L0myIDffYDPEksQUXPlKtCTpGxQldovMQnFbvP39CCL1+h
         8aYqJiplZ3j3syCSOX35Wj17Rg7NH51MKosq6AQX2PwyHqvWtfyoXBCKSN465iK7hp/m
         BORb4X8Wx0Kg0uuOCcTIEQdMLwPetCixuZ5Og8cmZbbkxCuH0yKg8DHdoIoAnQGBGcBa
         brgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784537897; x=1785142697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VFpLun3aTRlN5AWiLiGZ73OhLT8cMhNwsTldXssx/wk=;
        b=rtHWcmiGH9AUFybYmwi4b8/IqyN9UCUeLrLGq0iqHdw6ixR6HM4qo2ztZLGMq8GQGt
         JUoWAyL9pjDbaK/H6qxbKbEFY8q7ql9rDOSlrgbwWv3wjCbMhe20qmbpplnLQBgqtwSJ
         k0OqQGKH3ys1fInaPLJGU0FCBOSqpagfygLLavDurguNlz++DRomuqdfvaTwP3eoBIN0
         nb5Qoe+FYEJUNJ3/nUQ8NlYSoMmxhkq4cgRbKSouyF41Tz3DNl01w9cVOnjBFUmD7poN
         9kG0Lbsi/fNnNxOe7WJDoPx1epanImuFF6YEqxtlqtKfdrXa+fjPR0e9KaOlfx+lYYI3
         Kmmg==
X-Forwarded-Encrypted: i=1; AHgh+RpxJvCVNJertdB21BZvKmHv6eHj/5lapOUhrIpHZQ9TLTrbrIoUAkEB3p0J++X0Y0DNPPiwfiUl4NdEOFPrOw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6WR9lL9vXcEajBbAExWWb0inZXp3Ck7RUHkUnlX8vXL0dPIkS
	FgA+ihyGnLc90O9IQrvS7FKgQCGYDT9y/J52N9ewKrZoM9cLnOz+eUvj
X-Gm-Gg: AfdE7cl86AOo7v7LRgKyUySA4e41+mId2LVzernHB0/BhoghkXdUDZGrhFQYvTuJj4/
	304A089Qg2gHb9QlS3F1/FNuzly/kUm3pz/v9O1RaSyL/5a7zrVtysOiYcRwyF+N6H1FE8ABBOV
	2oxa4JBKQIJ7fGYeMWYdwvpofMusVb9loyx95fJxa8FmW+lzDdi2N6Bcr2d85UKCaYOSoi5c+Qh
	uhfvZwCZvM3bjMx2WBuh9nq0gzqsOSAO6YWTWuCMga5RNjzGXfrM2jE+5vwtLfZ/q5RbEbgQD06
	YTdaaMmJ0nf2GE9Vcp5OAp/5Ovo/nvPnDRKMKhHu8UUJRbvTw6cJYAPBbyDfGYdXHMcogTzPVUy
	dPLV00Ej7gp3C6iqwdxHPlb47Aq4kDt+2nX0HG7JPrTjJ78mvmMzsA6jgWMoCEZ3621E=
X-Received: by 2002:a05:6a00:a96:b0:848:64fc:510d with SMTP id d2e1a72fcca58-84c294892d9mr12402258b3a.45.1784537897395;
        Mon, 20 Jul 2026 01:58:17 -0700 (PDT)
Received: from lgs.. ([118.193.39.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adcc78asm5247901b3a.23.2026.07.20.01.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:58:16 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Fei Shao <fshao@chromium.org>,
	Tomasz Figa <tfiga@chromium.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Haoxiang Li <haoxiang_li2024@163.com>,
	Eizan Miyamoto <eizan@chromium.org>,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/3] media: mediatek: unregister VPU watchdog handlers
Date: Mon, 20 Jul 2026 16:57:53 +0800
Message-ID: <20260720085756.465667-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_015818_821364_E2738238 
X-CRM114-Status: UNSURE (   9.68  )
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

The Mediatek vcodec and MDP drivers register watchdog reset handlers
with the VPU driver and pass driver-owned objects as private data.

These handlers can remain registered after an initialization failure or
device removal. A later VPU watchdog reset can therefore invoke a
handler with stale private data and potentially dereference freed
memory.

This series adds a common helper for unregistering VPU watchdog
handlers, then uses it in the vcodec and MDP cleanup paths before their
VPU device references are released.

The series is organized as follows:

1. Add vpu_wdt_unreg_handler() to the VPU driver.
2. Unregister the vcodec watchdog handler during initialization
   failure and firmware release.
3. Unregister the MDP watchdog handler during probe failure and
   device removal.

v2:

  - Split the changes into three patches as requested by Nicolas.
  - Fix the extra blank line reported by checkpatch.
  - Carry Nicolas' Reviewed-by tag on the MDP patch.

Guangshuo Li (3):
media: mediatek: vpu: add watchdog handler unregister helper
media: mediatek: vcodec: unregister VPU watchdog handler
media: mtk-mdp: unregister VPU watchdog handler

drivers/media/platform/mediatek/mdp/mtk_mdp_core.c |  2 ++
.../mediatek/vcodec/common/mtk_vcodec_fw_vpu.c     |  6 ++++++
drivers/media/platform/mediatek/vpu/mtk_vpu.c      | 14 ++++++++++++++
drivers/media/platform/mediatek/vpu/mtk_vpu.h      |  2 ++
4 files changed, 24 insertions(+)

--
2.43.0

