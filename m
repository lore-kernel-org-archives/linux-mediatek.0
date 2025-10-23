Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F7CCCF9E3
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Oct 2025 10:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pREIdwueva8p5IEZP/Uv7Y/EwB32i8sMr7jZSfnH9es=; b=IthqXTS9GrW9/lWEHE8ulw42yf
	7Vf814QqCfzIEGSONJPf2v1mqQ7KsPUyCAXn2+NUQ/weLe0N3ZZrOo/HbL1sDeFxcxONRU3088hFb
	SWCiGkYNJq0NZESSj/qEyobgmtYmlnJ27Sjja3YBeYugFiTtS3+0QhOumn1L6GY1dldFABW1BPAOL
	pezoRcXHFBNt5TTyjUF/CCRfwTw9hXZCy1dLaLf4nAeeKiBU2GNWNjM8AYHRpSmmKI+KJuCbCpt2q
	i8wvocnamUA91R3/O6cRjumhiPyVqmTdMFxlcpUzdxfC5JbAzwYGmtSrg0y4pPlBrrXxEJJSkDsjq
	AeV9GdmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBsd0-00000005uBl-2BK7;
	Thu, 23 Oct 2025 10:33:06 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBscj-00000005tlU-0rZy;
	Thu, 23 Oct 2025 10:32:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761215566;
	bh=pshY6UD8UkjtnkzdR6DQu8EZEgj8tUqCQiyiG5CEPC0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=e+UDP96wsXrRefn9+r4v66E5EEWev8+78TXxxGBkWC91zFwEwMXoO46du0PRXrCtT
	 Z1KpnNE2SuzchyAmauc0wkW72SQIlDJGnYjBByOtfYZpIne+qjyqc/Hoy2ordEkX1m
	 DuEXoHBZcnd53nkNYB5+atAIccUZTFagsh8VGqkaMS0VxX873HgUiZPmi7lWwLXwg/
	 UQayhlv75ZQOQxsmCTsJZB5BHfhwdIgdDPBq80HrqMqnPDOlm4wGYHQQBBK9SS+4bG
	 ffm36TLa9J8BZu0LLyT6zgUU22y+gBO+Suqk1cqxOg+LReL0FYZQlGvXrRq8e0HkSu
	 OKMd61yuB5QSA==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 06BD517E130E;
	Thu, 23 Oct 2025 12:32:45 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 23 Oct 2025 12:32:37 +0200
Subject: [PATCH v11 11/11] drm/mediatek: mtk_hdmi_common: Defer probe when
 ddc i2c bus isn't available yet
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-mediatek-drm-hdmi-v2-v11-11-7873ec4a1edf@collabora.com>
References: <20251023-mediatek-drm-hdmi-v2-v11-0-7873ec4a1edf@collabora.com>
In-Reply-To: <20251023-mediatek-drm-hdmi-v2-v11-0-7873ec4a1edf@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 CK Hu <ck.hu@mediatek.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Sjoerd Simons <sjoerd@collabora.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761215558; l=1178;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=XsbE4tQJMGMBoAPaEfkaTGz6CyRspYxpULZRAhEc9HA=;
 b=jHM0DXftZ9YMARvOzCYpGBWDuH2Gl+WcZOe8zgOOBXZj0LbZwiNoPP8jG7o0e7V6ye5TA6qQj
 Wu0IGEORKtODCLQe9XLRzDcChlVB5986WcjTgjzDojSzICaeSxWYlmv
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_033249_419307_980AA89C 
X-CRM114-Status: GOOD (  11.65  )
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

From: Sjoerd Simons <sjoerd@collabora.com>

The i2c adapter for ddc might not be available yet due to e.g. its
module not yet being loaded. To handle that defer probing rather then
returning a fatal error when probing.

Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index 9cd7add3dd949e2920c876f7bcf990350c42d215..73b1c012aaa8a27168867c515e1d006c88dfff54 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -319,7 +319,7 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi, struct platform_device
 	hdmi->ddc_adpt = of_find_i2c_adapter_by_node(i2c_np);
 	of_node_put(i2c_np);
 	if (!hdmi->ddc_adpt)
-		return dev_err_probe(dev, -EINVAL, "Failed to get ddc i2c adapter by node\n");
+		return dev_err_probe(dev, -EPROBE_DEFER, "Failed to get ddc i2c adapter by node\n");
 
 	ret = mtk_hdmi_get_cec_dev(hdmi, dev, np);
 	if (ret == -ENOTSUPP)

-- 
2.51.0


