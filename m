Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DAD5E7E650
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Sep 2023 16:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rnjnk+YYr3UHiZnQyZtcglFMhD3zdtbdeKEv4rdGxTs=; b=dVskoZ0cTF2YPmqWJSyvSzPzo8
	cilzYxO/NbX8/EXlUfY5kMz3lnJd8skvozSFwvO/2XQHguhs92ChW59dDfgLjtYBZg7oD6P2MLZ/p
	ffXKdFvGxq44wxGn1+TVP2DyductcLhZ4hnqI9jqhv+dHigTfFbr4DAQaBrHYeVNKj3THX3bPLOtb
	w8VTsmQXzKky1PJjdp8h6PFB01huT3at2i1SDfADlTplkKXOz7uRunq9krCYRthyXYqXySVSP7AvU
	mEgq8zFA2juRm6sRukNHRhnGjCrz2Pw9JwokX7Yv4d3W6B2NQW0z2W3ipMMc/LXTXYYlUNfsMxWSk
	QD2Kx3cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlBBi-00Gjpx-0H;
	Tue, 26 Sep 2023 16:45:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlBBe-00GjoZ-2A;
	Tue, 26 Sep 2023 16:45:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C855160A27;
	Tue, 26 Sep 2023 16:45:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62842C433C7;
	Tue, 26 Sep 2023 16:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695746725;
	bh=aYyNkcYVEy5iUmtkKozylsTv6tDrVJnDNQ3yWacAOpE=;
	h=From:To:Cc:Subject:Date:From;
	b=qq2tfooTqqPYFON0eSeyQI07FZu1DUcA8mcw4uBpxv1/cgJOQRnZ93YtiKi/61vKS
	 UAYcUWY/ICSiL+GOadHAG2K5n5KfxIxdfUG9ho7TLRoc33/bpFVx4qq6m+waAyh/n9
	 HpcjGSw6bDZ9LkKqz6EtET7UqIpCeML9hecUhZJ9IW0tBP9qZ91PhMoJHjO8pLe45x
	 zb1JyUuu/h1CApqiBKjopN4PmYLLQlbAA7VLLCK/veDYnoCJ4dHpkwJwoZEQTAVsPE
	 f2wL1UboIZ/WN2yO43riAsOtVxN7efRf1RP0q+Ko+gHgNyTxz6JBW3NsKHOqzLsyv3
	 wFfYrCigx4ctQ==
Received: (nullmailer pid 102369 invoked by uid 1000);
	Tue, 26 Sep 2023 16:45:22 -0000
From: Rob Herring <robh@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Tinghan Shen <tinghan.shen@mediatek.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: remoteproc: mtk,scp: Add missing additionalProperties on child node schemas
Date: Tue, 26 Sep 2023 11:45:08 -0500
Message-Id: <20230926164513.101958-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_094526_752547_EE0BB9A5 
X-CRM114-Status: UNSURE (   8.18  )
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

Just as unevaluatedProperties or additionalProperties are required at
the top level of schemas, they should (and will) also be required for
child node schemas. That ensures only documented properties are
present for any node.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index 895415772d1d..24422fd56e83 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -91,6 +91,7 @@ allOf:
 
 additionalProperties:
   type: object
+  additionalProperties: false
   description:
     Subnodes of the SCP represent rpmsg devices. The names of the devices
     are not important. The properties of these nodes are defined by the
-- 
2.40.1


