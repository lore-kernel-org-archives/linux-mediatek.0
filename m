Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C43C6E7716D
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Dec 2024 23:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hDM2q65oM4YLDXWJcAglElygDvBE623ME+4jZY+qegE=; b=uhAgUKPtrHaJQYhlqMh83007jP
	3yuO9pmsWiwb9dHwnCD9CC+QPQv6PAI+fizq8Wzoqk3Dk2lq/2ypbWfE9S6valjzvtC5btpo50jkx
	z2SAqBtRcZzcb5SsI71/eVvbbDOlLFUlICcTyKdKa9yFE1U25yX+bLTSZJbBrJJwRzYE0VWvUlzCO
	u57cSr9ohSqetrODnZszFSCklMFSxBvig25UGEl5A3aLc/5/K7uw53k1UzE6HPdBtzsZ0+4mSnEUI
	Hq8tu9vZp1IL9JRCbAyKtFR4qXXwqT7IvBih0RVsmMQ/fE2isZRiB+K3sCSHCQUaGqy4X93kak6gX
	IhqhaHEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIz1f-0000000EDaE-3y0m;
	Wed, 04 Dec 2024 23:43:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIypA-0000000EA3G-3EKQ;
	Wed, 04 Dec 2024 23:30:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 54BC35C54D8;
	Wed,  4 Dec 2024 23:29:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5CCAC4CED2;
	Wed,  4 Dec 2024 23:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733355027;
	bh=Avd25BoX7Gc9a/fkGmYV/04s9u9/tOaOaYTRyptRfHA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C+DrpRkOuMMgicGX8kn768s+V45rwDN1ZskI9KoKZ2z5NvPWIrxhgM3lcp0P16Ae6
	 tjr/Fs//x8+Bnp95nvfn6KCXSLoKV2deXDucaIrnxGe4zHIkqnPXg1tRbgJMasQ8Tm
	 qM2fI4GNyXSB4FRt3h3xqHGKCz//jivD0yWHMHMmasvsJpgT3zWPpq7zE1OYZ0zorI
	 +fKxBeQkqbq198hRJ0tykUWZzkdwVD5gOomfu4MBkkI1ZDhJ4mv+6xwx1YeR8I4f/K
	 0uYCj0Xiud4B1dvG9bmIPjoxX1fN+FkOzm8en6aVSeJd9bt84rw49TfoY4Q5CGKAOa
	 u9ntJ7TyGkV0g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Saravana Kannan <saravanak@google.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Thierry Reding <treding@nvidia.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	matthias.bgg@gmail.com,
	sumit.garg@linaro.org,
	ricardo@marliere.net,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.1 4/8] drm: display: Set fwnode for aux bus devices
Date: Wed,  4 Dec 2024 17:18:46 -0500
Message-ID: <20241204221859.2248634-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204221859.2248634-1-sashal@kernel.org>
References: <20241204221859.2248634-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.119
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_153028_851281_A4B6E663 
X-CRM114-Status: GOOD (  11.46  )
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

From: Saravana Kannan <saravanak@google.com>

[ Upstream commit fe2e59aa5d7077c5c564d55b7e2997e83710c314 ]

fwnode needs to be set for a device for fw_devlink to be able to
track/enforce its dependencies correctly. Without this, you'll see error
messages like this when the supplier has probed and tries to make sure
all its fwnode consumers are linked to it using device links:

mediatek-drm-dp 1c500000.edp-tx: Failed to create device link (0x180) with backlight-lcd0

Reported-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Closes: https://lore.kernel.org/all/7b995947-4540-4b17-872e-e107adca4598@notapiano/
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: Saravana Kannan <saravanak@google.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Thierry Reding <treding@nvidia.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Link: https://lore.kernel.org/r/20241024061347.1771063-2-saravanak@google.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/display/drm_dp_aux_bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_aux_bus.c b/drivers/gpu/drm/display/drm_dp_aux_bus.c
index f5741b45ca077..951170e1d5d14 100644
--- a/drivers/gpu/drm/display/drm_dp_aux_bus.c
+++ b/drivers/gpu/drm/display/drm_dp_aux_bus.c
@@ -287,7 +287,7 @@ int of_dp_aux_populate_bus(struct drm_dp_aux *aux,
 	aux_ep->dev.parent = aux->dev;
 	aux_ep->dev.bus = &dp_aux_bus_type;
 	aux_ep->dev.type = &dp_aux_device_type_type;
-	aux_ep->dev.of_node = of_node_get(np);
+	device_set_node(&aux_ep->dev, of_fwnode_handle(of_node_get(np)));
 	dev_set_name(&aux_ep->dev, "aux-%s", dev_name(aux->dev));
 
 	ret = device_register(&aux_ep->dev);
-- 
2.43.0


