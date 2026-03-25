Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF62FEA82F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Mar 2026 08:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0By6fBzQ2yRvQq975okmifMkL0lBEKR0CyIculVAKRk=; b=hjWwRco10BhoSg
	m/p8FkJQB6EYtVeBn0Myzd4Al2UIK9CjrZFaAfmnOEBwBIiOlUhA3X28UwUxguNlNLk0BerahST61
	5CiFafmBWmf+2McWa1k2orzJL9fdtgiI7LbMcd58Qa4mJrctwH5u3TSHlnhl9Qgg243lvI8Ho7ydj
	EyS8FRVz4kLZPOXW4mqjtw9y+RDeC0T9IGV9PW1KPNsXnxg/HAKSp9FLuPt5piUP7WKTe/8XU9NL6
	bd0FFdvf6mLz0BdOJTkF3JVDSD1jukPcF51XHwI0VGPU5k+eTPzt93/gMtYlqZRlbqK6M7gSfeOjc
	5yuiEyQEvEXuFD9AJ+LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5JZ9-00000002whU-2v7w;
	Wed, 25 Mar 2026 08:26:15 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5JZ4-00000002wg8-3pGM;
	Wed, 25 Mar 2026 08:26:13 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.202])
	by APP-05 (Coremail) with SMTP id zQCowAA3zRAMnMNpPvpuCw--.51434S2;
	Wed, 25 Mar 2026 16:25:49 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: mediatek: add mt8173-hana rev2
Date: Wed, 25 Mar 2026 16:25:45 +0800
Message-ID: <20260325082546.1572405-1-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAA3zRAMnMNpPvpuCw--.51434S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtFWxJF4fWr13Xw1DWF4rXwb_yoWDtFc_Ca
	97u3Wqgr1kJa4S9F4qyF4kAF1UXw4rGFZ7Arn8JF45ta47CrWUWayvq3sxCryUWF4xur13
	ZFs5CFZrXFsrCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb38FF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
	1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
	42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
	evJa73UjIFyTuYvjTRNJ5oDUUUU
X-Originating-IP: [112.94.102.202]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_012611_325056_822D23B4 
X-CRM114-Status: UNSURE (   8.98  )
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
Cc: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>, Gary Bisson <bisson.gary@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Max Shevchenko <wctrl@proton.me>, Cristian Cozzolino <cristian_ci@protonmail.com>, Icenowy Zheng <uwu@icenowy.me>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, Icenowy Zheng <zhengxingda@iscas.ac.cn>, Mateusz Koza <mateusz.koza@grinn-global.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

My Lenovo Flex 11 Chromebook contains a board with revision ID 2.

Add rev2 to the compatible list of base hana DTB to allow depthcharge to
match the DTB.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v2:
- Added Conor's A-b.
- Changed mailbox to ISCAS one.

 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 382d0eb4d0af6..2894c8a16c78c 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -148,6 +148,7 @@ properties:
           - const: google,hana-rev5
           - const: google,hana-rev4
           - const: google,hana-rev3
+          - const: google,hana-rev2
           - const: google,hana
           - const: mediatek,mt8173
       - description: Google Hana rev7 (Poin2 Chromebook 11C)
-- 
2.52.0


