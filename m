Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D88C3DA64
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Aug 2024 00:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LC667cqqv5VL0NiIG662KXqNi+dGAmWbop/b4UKK8A4=; b=nfQtYq0IDUQZWpb2UvKJUGPjLs
	gYucVygVZFYTVVkGHxMA3MXjnXh6oTj6CQmGyXAkoq2yCqJZg/8EGGRFuKVoQKul/e1OE5ysLJYDa
	S02oXEP81T6DkvcYMNE63zclLr0LQWl9IM2Lg+ftlJVdNmuzTGrhfyuN8V2nbSOrtB5ws5xFPhWuw
	diVfyCruJ52pzYiCgy72DN/EKeDyCGmyhLGGSkYbvt7ff0FcfCQCG3er1FEyUOVtEW5Xgp7DxINEU
	NByYHMR14JlfF/trXQYm25SMDJZV1A2b+iR67LlQTrq751DgpNebMtbBYZIgwMN0pvgUfD1bKSoNO
	J/ShUFpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZJTi-00000002vkj-1p4D;
	Thu, 01 Aug 2024 00:15:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZJSt-00000002vRJ-0MA4;
	Thu, 01 Aug 2024 00:14:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 96C4261456;
	Thu,  1 Aug 2024 00:14:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4107BC32786;
	Thu,  1 Aug 2024 00:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722471282;
	bh=Bc5Taipso1fqVciO7ePiE9y5gkfK5eXG07pjnUEMhwA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IZv2f3KFRNBeDj4j/w0+aNq5NywyEiivFO1MRFkIwEtw+mrc+3GmaWNnpbsAXh3Re
	 pO+VVMIZM7ySj69/IAXJDlaDViFjdym0KZaZHFzivJLoax13d+lz+wQq59yD3/yjXp
	 wLW6JLLRu1WRk+6hI+hDoLUltLMd/UmbGrw76cGyo83SaT1mcA8DD1ZWuSXklAUk50
	 t5EHLUpn8MB5LKVVfUPcAdYHuhg7FxNIpUQkLGFWeoEhZNRNG0e8dNGqYPjsGA84di
	 NJI8F6m533aFC4UVcFs9Zo47XWkuK8LuqMozRkiZ3Lnka5MCK6w8TgMuX0CVSFcjEw
	 MV8EbhopnecFg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	andersson@kernel.org,
	matthias.bgg@gmail.com,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.10 057/121] remoteproc: mediatek: Zero out only remaining bytes of IPI buffer
Date: Wed, 31 Jul 2024 19:59:55 -0400
Message-ID: <20240801000834.3930818-57-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801000834.3930818-1-sashal@kernel.org>
References: <20240801000834.3930818-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_171443_189601_93EB76A5 
X-CRM114-Status: GOOD (  10.65  )
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

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

[ Upstream commit 9dbd9962cfe56d210be5232349851420b5f9c8f6 ]

In scp_ipi_handler(), instead of zeroing out the entire shared
buffer, which may be as large as 600 bytes, overwrite it with the
received data, then zero out only the remaining bytes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Link: https://lore.kernel.org/r/20240520112724.139945-1-angelogioacchino.delregno@collabora.com
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/remoteproc/mtk_scp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index b8498772dba17..b885a9a041e48 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -117,8 +117,8 @@ static void scp_ipi_handler(struct mtk_scp *scp)
 		return;
 	}
 
-	memset(scp->share_buf, 0, scp_sizes->ipi_share_buffer_size);
 	memcpy_fromio(scp->share_buf, &rcv_obj->share_buf, len);
+	memset(&scp->share_buf[len], 0, scp_sizes->ipi_share_buffer_size - len);
 	handler(scp->share_buf, len, ipi_desc[id].priv);
 	scp_ipi_unlock(scp, id);
 
-- 
2.43.0


