Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB5BC2BD09
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 21:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RIa+aJRcDB/lSB+RXV/D7cIv4nHnpwQbzyFdj+EPL+A=; b=wwGEnqzvGWurHBFeSwLMhQoK/Q
	u2dj1I4sYTNoyugFLgNCqKyDQK7V/Idz1KJ8oRShaGpgztojLMe6RCtE/jGgI1rmQah1VxUoiDGnZ
	XBM0u8I4PXe0my8TKb7dugDU20sus9cE1PLfggPnNSKw11VzwExyQftGEBfypBmPqVivhg97oXqmw
	wupusYNBWo184kLIQO06woAuS2VlsKkdDGLgGPZcIYqgLLeQYrH5aA75mVbjBOc8du0GWF7boTXPL
	VNVNqa85d3l33x/kwNvhQ2qpNYGwVLXMahU6CdbSs33ADYC/W82RpFoR/08nY9//buPm8rixurBrj
	gVl6aTtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMwYX-0000000Bl7w-2Mnl;
	Thu, 27 Jun 2024 21:21:25 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMwYM-0000000Bl2S-2ijL;
	Thu, 27 Jun 2024 21:21:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719523271;
	bh=oPhkDYQXCx//X/Z4DKIUsznCbtVc9AiR1dwOMJXLIUE=;
	h=From:Date:Subject:To:Cc:From;
	b=zcTCIwb5xnJif2Hm6LD7kEzYYkn0J5CieE/Pfo0jc81/Ef419D1ddUMhnM6UcXRzA
	 7sspie/Zf78zFjhkxsXDwKPyqj8SYN6ck00NGQla5G7KC8vxIVi6ERshgXSF6834OL
	 o2HFwuJ08LM0CEaHiG5z5kl0eqKgv9jR8tXyctBrhNcy4kHiOVQmQ5NS4tJAInLy2P
	 xbHY9FP30mPUO3Ji3LCtqaTNXc7O4RwwsPjYPRIUip8z5eeEjBlS/QajlMyZt56Amx
	 1Td40Q5uhO5sI0keHes5Avt5h4YQFSaiS2JM8e5QTt89Mm17uE2fZAVTPkycHq0VYD
	 PY19N2ux/EAeQ==
Received: from [192.168.1.166] (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 82B5C37821D3;
	Thu, 27 Jun 2024 21:21:09 +0000 (UTC)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Thu, 27 Jun 2024 17:20:55 -0400
Subject: [PATCH] remoteproc: mediatek: Don't attempt to remap l1tcm memory
 if missing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240627-scp-invalid-resource-l1tcm-v1-1-7d221e6c495a@collabora.com>
X-B4-Tracking: v=1; b=H4sIALbXfWYC/x3MwQqDMAwA0F+RnA20xVm2XxkeJKYzoFWSKYL03
 1d2fJd3g7EKG7yaG5RPMdlyhW8boHnMH0aZqiG40Lk+RDTaUfI5LjKhsm2HEuPiv7TiM0VK3YN
 85B5qsCsnuf75eyjlB3u5aeFsAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Tzung-Bi Shih <tzungbi@kernel.org>
Cc: kernel@collabora.com, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_142114_850946_48F94A7F 
X-CRM114-Status: GOOD (  12.44  )
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

The current code doesn't check whether platform_get_resource_byname()
succeeded to get the l1tcm memory, which is optional, before attempting
to map it. This results in the following error message when it is
missing:

  mtk-scp 10500000.scp: error -EINVAL: invalid resource (null)

Add a check so that the remapping is only attempted if the memory region
exists. This also allows to simplify the logic handling failure to
remap, since a failure then is always a failure.

Fixes: ca23ecfdbd44 ("remoteproc/mediatek: support L1TCM")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/remoteproc/mtk_scp.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index b885a9a041e4..b17757900cd7 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1344,14 +1344,12 @@ static int scp_probe(struct platform_device *pdev)
 
 	/* l1tcm is an optional memory region */
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "l1tcm");
-	scp_cluster->l1tcm_base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(scp_cluster->l1tcm_base)) {
-		ret = PTR_ERR(scp_cluster->l1tcm_base);
-		if (ret != -EINVAL)
-			return dev_err_probe(dev, ret, "Failed to map l1tcm memory\n");
+	if (res) {
+		scp_cluster->l1tcm_base = devm_ioremap_resource(dev, res);
+		if (IS_ERR(scp_cluster->l1tcm_base))
+			return dev_err_probe(dev, PTR_ERR(scp_cluster->l1tcm_base),
+					     "Failed to map l1tcm memory\n");
 
-		scp_cluster->l1tcm_base = NULL;
-	} else {
 		scp_cluster->l1tcm_size = resource_size(res);
 		scp_cluster->l1tcm_phys = res->start;
 	}

---
base-commit: 0fc4bfab2cd45f9acb86c4f04b5191e114e901ed
change-id: 20240627-scp-invalid-resource-l1tcm-9f7cf45c17e6

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


