Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F06C982D7
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2026 17:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SeIdKvGzh7s/Zod1za/yckFgL52L7iFEeDXKnd5/Wj4=; b=4IUCVG+figCCq8dI2BWYj/ivS2
	jHXec5z5/QbCJvtM+JKj9HlF8kIs3NSFK82d/zO6FXlxeExHlaS/VDWgkYZxs9qkhizhsugdwr3Nd
	q6ywQzWqpwvtcUifRdWqljzwYA9mfXKwtNYsUhx80IkCWJevqNRNylsyWEo40N8p1fKoo16dVjleb
	Qg20xKr+lsfDhYzqhPJfqN8+UE9JkXoNbKSb9mZpiiEWurc0oz18OhEWXe6+H2ZDxGKB77mhmFJCl
	sK0TlIPcqaU3gBD3oDST8YeEt0vbYteK1+b13P7zR7aakjLXNCCsFpFeQbZFU4t6WwzHBZIvh+Q1n
	uDtNtsnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7cqL-0000000FETV-40yV;
	Fri, 18 Sep 2026 17:57:49 +0000
Received: from mail-wr2-x11.google.com ([2a00:1450:4864:30::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7cqK-0000000FESL-1fGl
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Sep 2026 17:57:49 +0000
Received: by mail-wr2-x11.google.com with SMTP id ffacd0b85a97d-4843c3ee4cfso577772f8f.2
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Sep 2026 10:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789754266; x=1790359066; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SeIdKvGzh7s/Zod1za/yckFgL52L7iFEeDXKnd5/Wj4=;
        b=oHTEEgue0yBzTTQBfRLC8UcOgAZ0NJ8CrmP0LmTGnvehmusZXUaig42uPEZMm60gNc
         eLbvJJOlWg1F/uGcaRPVz4G7JhCC8PwZSquo7hsZHn3gdQW9PxbWBLs3eD1Rhzh7AHeH
         2eHEntkrhnX4Yv24c9YtCJ23krWuQayX4ZxiJ2SBCfr/nB386yeK7uklFgCy9glTKlG1
         rdwFEfi6sPod6g5LE3eGZtkFovsmLN3vMdq4X2Mn0wNHKZVpetoaFTbrxv/9/fDqB05d
         r5UhqchPd4ee1kshOKuLUCyYj4NjW74CdnG6IWAXmpr/XMH6w6D3g/igHf22Ix9mRunt
         Qr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789754266; x=1790359066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SeIdKvGzh7s/Zod1za/yckFgL52L7iFEeDXKnd5/Wj4=;
        b=RwL8Z/FZVQO+/uu2Z1UNsLvv+ujxmisyDfsJEtpZWlUinBrOsmIgE2rmJgFqO6pS4e
         aHtuMYLHZiwIfJtMyy4+GFQ2b/YbPf6ZjA0t6Rckp7YdrFbtpocgK9Iy5HumsVqYdA5O
         v9TvyAA5+EoixKALanQwE9c2Dg4ee6wY9yqHn5zkswlLmhLko+iNNTXNV9Vo9UH8P2EP
         OQeFKgQ/rydQ3JX/xCvvNr9bpZVtEywogr0T5bDVBSm356qmQqX6fdeLE6WperSYcg/z
         qhjP34lEzL8GUnJm2m0JD0xuciUGIDjlkKYh8ztn6LUQjJTf6XoWIM7sHtcbWUqbLg6m
         pqqw==
X-Gm-Message-State: AFuF++m7sfUn5ggq1nVGFYx4UfVRPJZSUmfzQa4pBfYiU+edaHkxlNe1
	8pYMFZz7hBSolqRghtQHGxMuGI0uSQN+nUMO29+sBpxasMeVgEk5FeuPmLfPlpSE
X-Gm-Gg: AYBFou0ZWAnzGFIWrBVbOBgVqsEKMk57Jm7zPdavVlpwBsVlWffDShMKT06ljYcJt48
	BoFkaoIYcW54XQF2AezJqBJW3K1yCwz+OUy+2zvB3KIPaKt/LWaUcxmhIEiysQG+898ISrwGVPa
	voSmGz5vFOaXLqxkfO7zNkFYITegXupxZ6Cneir1jcMii+wXYt+wUpmLJi/V+PgW+LRRfu/9EXK
	jyy0wLmKKNgHbtqXQKh3UrQkoI2XRcaxPEuKFe14So+P7u4+MigrjnrZBGaVr8eNERXmHF4kSyk
	erOX5n+8/kltGHAS743cwDAilssMitV7VWD+sehmt6SMHBWX5rzoyxL+9R8e/huf58uhl46XoUa
	CJGrTiPWoHjIi/pS3dlU4KMsJMNYiQ1VYe7uk/IPOii9Y4wZsgJBZ83M6vLggodVsLkp3yMBQ0F
	0qQQjlGmpDzwZSvqDqEJn3J+CGlIDvADbzkwChgEH05JSejkkQxD/vpq7wUXImdfZuY5s=
X-Received: by 2002:a05:6000:610:b0:487:1681:2218 with SMTP id ffacd0b85a97d-4871e36bf5amr5507663f8f.45.1789754265990;
        Fri, 18 Sep 2026 10:57:45 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724562aebsm268461f8f.14.2026.09.18.10.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:57:45 -0700 (PDT)
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
Subject: [PATCH 0/4] Add support for the mt8167 display pipeline
Date: Fri, 18 Sep 2026 19:55:24 +0200
Message-ID: <20260918175736.355305-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_105748_449564_F07CA87F 
X-CRM114-Status: GOOD (  13.78  )
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

This series adds support for (almost) all display blocks of mt8167.
This SoC supports a DSI or DPI display and has HDMI output via a second
DPI block wired to the HDMI phy.

All the hard work was already upstreamed in the past, now all that's left
is some glue. In the first two patches we add support for the DPI output
blocks. In the third one we describe all the possible combinations of the
SoC display pipeline and in the last one we add the required nodes to the
SoC dtsi.

The final outputs of the display pipeline in the SoC dtsi are
intentionally left not connected to allow board dts to specify their
own output node.

I said almost all display blocks because HDMI output is not included in
this patch. I have it tested and working at all supported resolutions, but
since it needs some fixes in clocks and a new phy driver, I will send it
in a separate series.

The series has been tested on a Lenovo Smart Clock 2 (DSI), a Xiaomi Mi
Smart Clock 2 (DSI), and a Sony Playstation Classic Mini (HDMI via DPI).
Unfortunately I couldn't find an actual device using a DPI display, but
since DPI1-HDMI works, I feel confident saying that the clocks divisors
are correct.

Luca Leonardo Scorcia (4):
  dt-bindings: display: mediatek: dpi: Add compatible for mt8167
  drm/mediatek: Add support for mt8167 Digital Parallel Interface
  soc: mediatek: mt8167-mmsys: add routes for all display paths
  arm64: dts: mediatek: mt8167: Add DRM nodes

 .../display/mediatek/mediatek,dpi.yaml        |   1 +
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      | 369 ++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dpi.c            |  23 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |   2 +
 drivers/soc/mediatek/mt8167-mmsys.h           | 183 ++++++++-
 5 files changed, 569 insertions(+), 9 deletions(-)

-- 
2.43.0


