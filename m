Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9855C7EE24
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jun 2023 16:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZLNDM67CG69quBKpIYOsHV6NBDViR0Gmr+ZCxPjO6LQ=; b=ipXhNolhMa9xyOSFR4DsOu/i4/
	MzyOLDiYl+VtukGH2BXNYiDluDUo6q0Dy6PMBUL9NHExW8tgo2aehwdXRZhgIjmAyiR6mHhjyAMg3
	MfRebqv10jUDdgQ13BTvIWTPvBMsU3t9KhHlNq1Q7D3lce6IT3m4pNWC19Vlf+2LsUQytPXSWc5uk
	bR9aZ4tRi8u43EwtVyJa+F4XPn19uDFW4lafuXi/8gAlCldO5hkmg9gwXLFMR/EbOrHYYJA51A6zy
	6WKY+e7v2SLpUOxi24N4kq+ypeJwkN/2gGr4sDvTZq0BSbKREXrCYPMpRZKLc02WdZJUwMw3AI9uf
	BaQ/lcHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Cxb-00G6KS-2D;
	Mon, 05 Jun 2023 16:21:35 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CxV-00G6F5-1z;
	Mon, 05 Jun 2023 16:21:30 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1A5546606E75;
	Mon,  5 Jun 2023 17:21:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685982088;
	bh=hpuSfUwRgpVJ50aSOdpyF/fGgsKVyjO2zFPFVOsBbR0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BgQDAyVS5lY/HAGajbGzPNci3f/nLj+mgvCtY43vmi5C9uwzdn2auEh89rl5U8v8q
	 utcPbqNSWLqK+JOYWVOlqIjKlNv9bxM8NLsVsVvNpJz/VTXna3jpHGahFBkLC1Sg9T
	 0SWxfgZUWDlpGgs2Io83WC1quPUMN5s8Zusxmf+SK9CCKViMAPhOKeihx878HP08KF
	 2PvcDGUk0Dj9NN3jCfSxfvvg35DnM0Y9qQDtCOhYOlnQvw9Ghy2aC3U5cegPItOzk3
	 PfkX5gjsNAdq7EZHBLQr2vPp6a/Ziqilm6GsOkrXXBWwuee9x+BGu6Jtx6L625t73i
	 gjpT4MdgQ5fLg==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/6] media: dt-bindings: mediatek,vcodec: Don't require assigned-clocks
Date: Mon,  5 Jun 2023 12:20:26 -0400
Message-Id: <20230605162030.274395-3-nfraprado@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230605162030.274395-1-nfraprado@collabora.com>
References: <20230605162030.274395-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_092129_788525_7CE259CB 
X-CRM114-Status: UNSURE (   9.58  )
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

On MT8183 it's not necessary to configure the parent for the clocks.
Remove the assigned-clocks and assigned-clock-parents from the required
list.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

 .../devicetree/bindings/media/mediatek,vcodec-decoder.yaml      | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
index 57d5ca776df0..6447e6c86f29 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
@@ -67,8 +67,6 @@ required:
   - clocks
   - clock-names
   - iommus
-  - assigned-clocks
-  - assigned-clock-parents
 
 allOf:
   - if:
-- 
2.40.1


