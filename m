Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39480CCD195
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Oct 2025 14:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ud6VA7VquzlTC3LLgGhzv6mpv++7QFWZ9FCn3m61rpg=; b=PnQhustPEuwSw0
	8y+Zh7VITWPQrLWPvgZMQYHrgoKh1/GuAy7sBuRAtlUMeRJ9tjMRVlRIYpgCCsjksH/FKrVUdPa6m
	DM7To5WTfrmHeYnleC8QOnAnUXra9ZsZfI+chZ7CfJz3spIBdpaJasnsaFP+yAKJr1XHCy0YZfKhz
	1Ht62Rz6RyuYOXNdMeNkgd0GXjz2pJMnmoZpXxv3lItl6qK7arsAmKvb3zDVySC8YCDezlfhEY4Fy
	znPb0NXNt4D5AC+VBqx5J9EBOGoOmcoICBABhD5kq/Up4K6kFSndLScD0a5s70SYh6zH4+9yexfTk
	+5XFz3DJ/sAHx0m0oW+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Oss-00000004yv1-0oc4;
	Thu, 16 Oct 2025 14:23:14 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Osa-00000004yXT-0N93;
	Thu, 16 Oct 2025 14:22:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760624573;
	bh=/Trh+v1W/uhiBFTYoqQXEekxqHsqS7bTdkGqVrRYRBk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aVNVNztiHaDJ0c9NLhWPwbjZhsvWW8Zr/b4eqAt5QGaoNsJn0Z6AC3HqzYYD13Lt4
	 /axQTpMlyei9J2PFKmBPQKos3F41LEApQ++DW0nMJk+oixKiuSR7VbtPtPPx6yAEvc
	 7h6VWqyfGMdXPu2EDJlc7tedWdghXJDPgJo52ziMw9k0LbHJsBBYTe1nUMguwxkrMu
	 U4agrD0lL+8dq1trQ2zOE+yFr4nN1x0aJqhTfhiB0mrLuJ7HW3Zhsu4+s7xiYqT88o
	 fp7DlSq9wbQ4iduXlp4aBlTV6JAk5zqcBTFhgIHVEBny6SYdf3vwBYXj8a6vaqsyXi
	 cq3sIcvc66/XA==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:655a:5eaa:d2ad:4ee4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2DBE617E10C8;
	Thu, 16 Oct 2025 16:22:52 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: srini@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Subject: [PATCH RESEND v3 9/9] dt-bindings: nvmem: mediatek: efuse: Add support for MT8196
Date: Thu, 16 Oct 2025 16:21:58 +0200
Message-Id: <20251016142158.740242-10-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251016142158.740242-1-laura.nao@collabora.com>
References: <20251016142158.740242-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_072256_310459_392F52C3 
X-CRM114-Status: UNSURE (   9.48  )
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
Cc: andrew-ct.chen@mediatek.com, lala.lin@mediatek.com, arnd@arndb.de, linux-pm@vger.kernel.org, Laura Nao <laura.nao@collabora.com>, linux-kernel@vger.kernel.org, nfraprado@collabora.com, devicetree@vger.kernel.org, u.kleine-koenig@baylibre.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, kernel@collabora.com, colin.i.king@gmail.com, bchihi@baylibre.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The MT8196 eFuse layout is compatible with MT8186 and shares the same
decoding scheme for the gpu-speedbin cell.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
index 4dc0d42df3e6..c90b026e40bd 100644
--- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
@@ -25,7 +25,9 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: mediatek,mt8188-efuse
+          - enum:
+              - mediatek,mt8196-efuse
+              - mediatek,mt8188-efuse
           - const: mediatek,mt8186-efuse
       - const: mediatek,mt8186-efuse
 
-- 
2.39.5


