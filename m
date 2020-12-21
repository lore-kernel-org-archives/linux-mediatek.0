Return-Path: <SRS0=ptZs=FZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA651C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Dec 2020 06:11:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B53022CE3
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Dec 2020 06:11:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B53022CE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O5XuCShxiyqNEhZFWAqH2vtWnxk+ztazyqaGjuAOdnE=; b=LSUw9T8x8t5pM+m+bAYoIKTcj
	AxfoDMAzIrWbnkRyTj241K+UtBwfzuoU5pOR2I77T9EAdZu7B4E0BFY8CuN94ligoqQLgYfgN2CeY
	sxC2AEQf01LgAXnkR8JHbrWUjhRNlxo+R7ss/JQPrPbeo5Lr5s/OSDTO6lDCb/wvn+vrdoLFLEtTS
	HaDOmh5UEfc4RqC+oGfqr3vIkxkiHmR1QxTNdam2k462wWR7hYjS+zWwE7bOAuDqGK7yIDMzJk64y
	9NX2V/9b3z/Yw+gcnH7hl0Fx/CLaFeR4s1J7EVhxyFRCT+3/7bmlVzUiOgIyyKtDY25SD0hin4Cnu
	atL12k/tA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krEQ1-00076a-2M; Mon, 21 Dec 2020 06:11:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krEPr-00073x-U2; Mon, 21 Dec 2020 06:11:32 +0000
X-UUID: 3723ccb778a940dfa669bd7272ffdbf5-20201220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=+1r/8xsl5qgZNiy0Q4CNMBIVE7oAvvkaD+ZmsuNNkqk=; 
 b=TluhPnI4kvKfyUS+LZrenWexjkYGyAW4ejjFHl8sC+JUm+JTA2+lwrhR1i1j/HNDoauYvpX+4meu1tpJmiIEVreL+iHXgzmlJSsIpR3FTCbs9J4uLnotYQZQQOwJWqtrvFrC/lq5jgUsRlZBtgrU9xwpHK1khxsvCLxlWfEfmWI=;
X-UUID: 3723ccb778a940dfa669bd7272ffdbf5-20201220
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yz.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 370886823; Sun, 20 Dec 2020 22:11:27 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Dec 2020 22:11:11 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Dec 2020 14:11:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 21 Dec 2020 14:11:08 +0800
From: <Yz.Wu@mediatek.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3 2/2] arm64: dts: mt8192: add eFuse support for MT8192 SoC
Date: Mon, 21 Dec 2020 14:10:21 +0800
Message-ID: <20201221061018.18503-3-Yz.Wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201221061018.18503-1-Yz.Wu@mediatek.com>
References: <20201221061018.18503-1-Yz.Wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_011132_112252_B2135A3D 
X-CRM114-Status: GOOD (  13.09  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Seiya Wang <seiya.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 Ryan Wu <Yz.Wu@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Ryan Wu <Yz.Wu@mediatek.com>

Add eFuse node to read Mediatek eFuse

Signed-off-by: Ryan Wu <Yz.Wu@mediatek.com>
---
This patch dependents on "arm64: dts: Add Mediatek SoC MT8192 and evaluation board dts and Makefile"[1]

mt8192.dtsi file is needed for this patch.
Please also accept this patch together with [1].

[1]http://lists.infradead.org/pipermail/linux-mediatek/2020-November/019378.html
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 69d45c7b31f1..4a0d941aec30 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -422,6 +422,11 @@
 			#clock-cells = <1>;
 		};
 
+		efuse: efuse@11c10000 {
+			compatible = "mediatek,mt8192-efuse",
+				     "mediatek,efuse";
+		};
+
 		i2c3: i2c3@11cb0000 {
 			compatible = "mediatek,mt8192-i2c";
 			reg = <0 0x11cb0000 0 0x1000>,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
