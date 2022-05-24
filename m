Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68139C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 May 2022 15:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MbHwoDLwlV0AsELZZZqeDu84g89H1RSo5gJkMWwxoao=; b=r9N67bn0EZgSpW
	+EOXrCS4Q4xHGhaPi0ODrycn1G7sbvk5pzjKaFBjMOYff5JC8EGKTI0pfuLvyrxHUi6W0lBQo5W8r
	djurmlgJAE0TkcYpUNvl6IS2R/GOXPgiMeuHrZYTxidSt27lFZcJR+DJlxkU0OuSVYlP+827oZ206
	gLJAOeg5PmrvbG0wZRHMfp07CbCOivOJrCSvdf65VPFDhz50y8XDf2+FJ/u0hYfG+PJrZVBYtXXLc
	8w2Cmht+VhYd9K+cLXYizYHDMB+t9IJx4ZrZx8eb8HI8HtyWE4btSHQE/CGOiehB4ybTGQ2q7GSgz
	0XxXvMoQ5RaU62rv1akA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntWFv-008OQG-8m; Tue, 24 May 2022 15:15:31 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntWFj-008OMC-By; Tue, 24 May 2022 15:15:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 828A31F42456
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653405317;
 bh=Iy3W7rUkg3Wow+MZYHzeedJhzvCA8F8HfCiBIaNRcSg=;
 h=From:To:Cc:Subject:Date:From;
 b=LzoGjsp25sHcTcIYJViMp7m2j6vnZuvi4sm3nrlS35epZfkDtMwnny6NOI/sxz9dz
 NOcYDskKVd19p0bCZKDqjOdtrEXjbXKy/4kajTDsE+CsJ4Gc3PLEpEgTeqfE9Wu3Zc
 hLdCRghmeF6cM/JekAX5BRAONvqraYEunuKK5KDTEFrfPnavCZXRShLk+pNE8bquTc
 k8vyCX4ucyaKw6b72Mds2yaZAQ+bTULriIO07qtpy0XLJAsL7Rmh0CYTuQ+lFvMvte
 YE+8fHnkAsmW45qLEDGWflkXTQR07JdFTpl1YgE7IoqeGH8wdr6e5Iw5OgH5BiN7tV
 68OTzC0AaAIYA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: jassisinghbrar@gmail.com
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, houlong.wei@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 0/2] MediaTek GCE json-schema and multi-gce clocks
Date: Tue, 24 May 2022 17:15:10 +0200
Message-Id: <20220524151512.247435-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_081519_580183_51B4627F 
X-CRM114-Status: GOOD (  11.52  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

v1 of "dt-bindings: mailbox: mtk-gce: Convert txt to json-schema"
exposed some readability issues for the mtk-cmdq-mailbox driver but,
upon further inspection, I've found that there is a shorter way to
achieve the Multi-GCE support as it's limited to simply managing two
clocks instead of one.

This series converts the mtk-gce freeform documentation to json-schema
and adds a second clock for the dual-gce (multi-gce) case, as to stop
looking for aliases in the entire devicetree to get clocks from the
secondary GCE node: declaring both clocks on both nodes is simply the
right thing to do, as operating one GCE Mailbox requires both clocks
to be enabled, since there may be interop between the two GCEs.

For now, the only Dual-GCE SoC is MT8195, for which no devicetree is
upstream yet.

AngeloGioacchino Del Regno (2):
  dt-bindings: mailbox: mtk-gce: Convert txt to json-schema
  mailbox: mtk-cmdq-mailbox: Simplify getting multi-gce clocks

 .../bindings/mailbox/mediatek,gce-mbox.yaml   | 124 ++++++++++++++++++
 .../devicetree/bindings/mailbox/mtk-gce.txt   |  82 ------------
 drivers/mailbox/mtk-cmdq-mailbox.c            |  32 +----
 3 files changed, 131 insertions(+), 107 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,gce-mbox.yaml
 delete mode 100644 Documentation/devicetree/bindings/mailbox/mtk-gce.txt

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
