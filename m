Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D439CD11DD
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Mar 2024 08:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gDp2D9scNMMlwfsQ/PQjXgT61q5jrRPqVd3sWj+u5E4=; b=KMCRpYO8zKVeUjQXpIX34N5K2M
	bvWwXxS1hQLCKF5qAZIquNdJK2g4rZxS864J4fgaHnbyO64cS3v+mlkPaHrWIs8hz0xla71PKE6mc
	DiTEvUF65fUBsFpItp65AxQNx99mQUa6HWZaNVIsqJIZw8EHvtD2blX+1y0O3rPzXOAp+bQFF/2+P
	OwknDwN2a0emZiykubF41KOqAq3s0GWtnUPLflIP0wbQaOmrRIqAMfuEJMz7daZ6GtL2ZRqLzXVMP
	lxrek4UHPI+37vw0PO8KR1/J48KcPS0NedyWe8sTGiPvNZB5LqI2POveExjYSOS23oJcdFb6e/NHD
	VcSZJR5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnE4O-00000002N5p-2bUD;
	Thu, 21 Mar 2024 08:46:40 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnE4I-00000002N27-3FOj;
	Thu, 21 Mar 2024 08:46:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711010793;
	bh=jle9wMiDny+kxaOKZOmL2FIJ6vWyfkstyQhgaqAXszI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G9kLjqC+Z1Ox2AHUeOc1P1V361SzTc0eAb1d9ikwoX2FSIHLxZM85G3Ic6oBKsIio
	 T0+x8pxeKEE9SqryU9yqj8ELIlJ6GQ8+OJxxQD3O5HFzki7u/e9oGCXCixDxlhqK0e
	 5ajkBPRllQd1cGjJ67F588DWgopV920Ha7qAP0VbOSpJO0VraGOkrbdm3PYj7gZsYT
	 SNv1g63cRleafGYEDABs4AW2fcGKE+rIxRDNYvs5fhcDWlo7Rc1jnRxyExqmLhHxpG
	 s67saseBC/QDK+pcgskH/4o0wRB4vm2VXhwz/TVJPB5+kXQp71a9K+enbqA3qMpWO5
	 LWMy36n0OV56Q==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B34DD3782114;
	Thu, 21 Mar 2024 08:46:32 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mathieu.poirier@linaro.org
Cc: andersson@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	tzungbi@kernel.org,
	tinghan.shen@mediatek.com,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org,
	kernel@collabora.com
Subject: [PATCH 2/2] remoteproc: mediatek: Don't parse extraneous subnodes for multi-core
Date: Thu, 21 Mar 2024 09:46:14 +0100
Message-ID: <20240321084614.45253-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240321084614.45253-1-angelogioacchino.delregno@collabora.com>
References: <20240321084614.45253-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_014634_972851_56C0FD8A 
X-CRM114-Status: UNSURE (   9.78  )
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

When probing multi-core SCP, this driver is parsing all sub-nodes of
the scp-cluster node, but one of those could be not an actual SCP core
and that would make the entire SCP cluster to fail probing for no good
reason.

To fix that, in scp_add_multi_core() treat a subnode as a SCP Core by
parsing only available subnodes having compatible "mediatek,scp-core".

Fixes: 1fdbf0cdde98 ("remoteproc: mediatek: Probe SCP cluster on multi-core SCP")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/remoteproc/mtk_scp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 67518291a8ad..fbe1c232dae7 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1096,6 +1096,9 @@ static int scp_add_multi_core(struct platform_device *pdev,
 	cluster_of_data = (const struct mtk_scp_of_data **)of_device_get_match_data(dev);
 
 	for_each_available_child_of_node(np, child) {
+		if (!of_device_is_compatible(child, "mediatek,scp-core"))
+			continue;
+
 		if (!cluster_of_data[core_id]) {
 			ret = -EINVAL;
 			dev_err(dev, "Not support core %d\n", core_id);
-- 
2.44.0


