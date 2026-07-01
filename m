Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404AFC43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2026 15:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S/D01f1lxznSla805qWXMa0NsEd+89/1YqBpgfP7e7c=; b=xqWQQ/HitA++ywNyH7qLzZqFOh
	/PbEKKywVeKJdvj1jLqGoY9Ag0Edxax5AhBgx0dHrs0+OpIuedz6D2STiRnMolit6g/x9+y36M9Wr
	BiXVGmoG7uFYhbYuMCjRYqHuep1JGRWDOkzx7lTLKygRpyxe5j8pcV76tdCPoyTBpBD7qDUVhQX0U
	Jw9nq/HLIsIrMEAAS2HgvSEIxb5rkB7kD3I4RHgiwIsNxGiOkjOrmYrZXryN6QiN4+Xq9imQFLtGD
	zTRmNKCoVreNKxQNpoWsnFDkOE20wiYp7aNY/Ixwnb8NHIl2bNNLATBuK6F+bu6DtToDd7Cl3UJ7o
	ZEBXc9iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wewdv-00000002NYs-0oSi;
	Wed, 01 Jul 2026 15:14:27 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wewds-00000002NXX-1rIq;
	Wed, 01 Jul 2026 15:14:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782918861;
	bh=RtmejQkvm77nZpvuKQD7/tDw888Rv3+bfUSpMvP01H4=;
	h=From:Date:Subject:To:Cc:From;
	b=mAYEfh87h39cWihtQLd4t5D0dkhlKEiPSZvVZWkm8e9+C6YKdLg9ifNsNNp/7I5GY
	 rIuvr3tIZGjtM7P/pSn695/T8bLMZskI84dri9DUKh7jDIFbGiY2rdhpsUsWlUnvKF
	 UbPhsuGswyrpKaBbnWQeQc/QqYed5VVxZFkVteck5qtQSEYES2yj8xwgFhK+qZIYhr
	 F1kz2ioysxxnleMfu7sAiuzyFnZ3xAfFh3lG+7yzQgNqvlaVDEln/aevogxGw69O6G
	 17Xnc6kSnKiil0KiTEnccsT+njtH+5KhEnM4VAMrAWqTPc7wUbVnbeBvP/Hv615BAs
	 SobxzqKJHx2Vw==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0596C17E0432;
	Wed,  1 Jul 2026 17:14:20 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 01 Jul 2026 17:14:06 +0200
Subject: [PATCH] dt-bindings: mfd: mediatek,mt8195-scpsys: Add support for
 MT8189 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-mt8189-dt-bindings-scpsys-v1-1-2c04f0fda1b7@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNQQ6CMBBFr0Jm7SRtjRW4imFR2hFn0YKdajCEu
 9vA8v3kv7eBUGYS6JsNMn1ZeE4V9KUB/3JpIuRQGYwyVt2Vxlha3XYYCo6cAqdJUPwiP0GlfWe
 1ct7fDNT/kunJ6+F+DCdnen9qopwjjE4I/Rwjl75JtBY8MvaqYNj3PzO62gOcAAAA
X-Change-ID: 20260701-mt8189-dt-bindings-scpsys-01c9610acc52
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782918860; l=1288;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=RtmejQkvm77nZpvuKQD7/tDw888Rv3+bfUSpMvP01H4=;
 b=iaoJytQ5vltimAwnK0uYMl0TOHTHipFnUZtH8mPRD7vkkzeBXWB4ZnjSEd3CEDggAodHHZ96F
 XyR6eIIUbrpCh+xO1SsD2gRuM2GeQMyHEdeIrTcvbsLEiGNwYP72Ye7
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_081424_645683_17AD50F9 
X-CRM114-Status: GOOD (  10.40  )
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

Add a compatible string for the scpsys block found in the MediaTek
MT8189 SoC.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
The patch is based on linux-next tree (tag: next-20260630) and has
been tested on Mediatek Genio 520-EVK (MT8371) and 720-EVK (MT8391)
boards with board hardware enablement patch series.
---
 Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
index 4cafa381979b..9f073d0c28ef 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
@@ -26,6 +26,7 @@ properties:
           - mediatek,mt8183-scpsys
           - mediatek,mt8186-scpsys
           - mediatek,mt8188-scpsys
+          - mediatek,mt8189-scpsys
           - mediatek,mt8192-scpsys
           - mediatek,mt8195-scpsys
           - mediatek,mt8365-scpsys

---
base-commit: ba7c57499e5999aeae8dd4f954eb2600589d80aa
change-id: 20260701-mt8189-dt-bindings-scpsys-01c9610acc52

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


