Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5E4CD54AB
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 09:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LZLdI6dkjeHHplXqrlvuHGae09apfDuKsS5lypxvYAs=; b=qvUwtM3tvsfJC/NJgZnsd5s42K
	K/rFYqSru0B2olneBTAzAn/vrnBt4hE6eQ9Lgj0YB71zsRLdFeMMpvZjDIqmAZGsZx2uJFfUPOwmV
	M2GV4GVm10/PuqFzDXYDr55MpF0o8ciMsALJWGcDqMioEgkoSpopYxB/23B5/xN+lbYmMVIk6S0yg
	cvUUwB/WE7gXGanGkiH2VeL6sYfYXJ7QPfs5Ukzd1kB8IchAklpzGaVLn+S3I+Bdi6Nb59Ld1pYCF
	R+fKJG6WQQRI1RF/x/BDsdptNSmEBkRDgPUHhN7H40ZCvht0tskTH4QK6PImSqo8v64G3aAnj6Oyu
	JWPbX/Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiXWK-00HZde-02;
	Tue, 19 Sep 2023 09:59:52 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiXWF-00HZb8-0M;
	Tue, 19 Sep 2023 09:59:48 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6F1056607079;
	Tue, 19 Sep 2023 10:59:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695117584;
	bh=diaOf6EmUGm6l+mxt6/O1nJ6UjZ2yPHfhRpfvuoUEnU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mC4nCTkI8xE1emA5TZ+ruqLSdx6SsDSZr/hQPbMf+x8/LojiaCNdOZAE/lJtkbGiS
	 CNUHOzPfB2+drbHy5k2qndZVUq/8y07M3DbtEL3thwEVA6pVILz7Gv9qk4d8uMibqc
	 P9R4xgpHISMt0jYQwNcn21lsyBuc5QmMTK5uOdUPOJF7wvN9TYV/Fh387v3WBNXhr1
	 IuhiQoYvqpaq4KLeJ6ezOOOIiQeHMhpZyFWOgx8rsMeFuGpfWFuHHB6xt7ub4fkM/o
	 mmyNVEf97IhPEOPC1xJyfmRCBtxBCPPegaiSC2Fp70rJ87l82J6/hyHedHpXhEWWG6
	 SfSeuGQc0x5EA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mchehab@kernel.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	moudy.ho@mediatek.com,
	hverkuil-cisco@xs4all.nl,
	sakari.ailus@linux.intel.com,
	u.kleine-koenig@pengutronix.de,
	linqiheng@huawei.com,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org
Subject: [PATCH 1/2] media: dt-bindings: mediatek: Add phandle to mediatek,scp on MDP3 RDMA
Date: Tue, 19 Sep 2023 11:59:37 +0200
Message-ID: <20230919095938.70679-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230919095938.70679-1-angelogioacchino.delregno@collabora.com>
References: <20230919095938.70679-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_025947_341657_00DF5859 
X-CRM114-Status: UNSURE (   8.76  )
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

The MDP3 RDMA needs to communicate with the SCP remote processor: allow
specifying a phandle to a SCP core.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/media/mediatek,mdp3-rdma.yaml       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
index d639a1461143..0e5ce2e77e99 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
@@ -46,6 +46,11 @@ properties:
       include/dt-bindings/gce/<chip>-gce.h of each chips.
     $ref: /schemas/types.yaml#/definitions/uint32-array
 
+  mediatek,scp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the System Control Processor (SCP) node
+
   power-domains:
     oneOf:
       - items:
@@ -98,6 +103,7 @@ examples:
         mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x1000 0x1000>;
         mediatek,gce-events = <CMDQ_EVENT_MDP_RDMA0_SOF>,
                               <CMDQ_EVENT_MDP_RDMA0_EOF>;
+        mediatek,scp = <&scp>;
         power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
         clocks = <&mmsys CLK_MM_MDP_RDMA0>,
                  <&mmsys CLK_MM_MDP_RSZ1>;
-- 
2.42.0


