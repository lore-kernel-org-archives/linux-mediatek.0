Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B568CEB64D9
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jun 2023 21:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U/1728/8lz7c18NWge1qSqmZxN9V+tKYzr5/NRHcY1A=; b=ZdCODF9CeghtOOSLq4MpFeAvCc
	vb3sfTHSsyz5cSg+hbYJ39KMFqPhCsNa/DvtguPMa+3+JtLadeoDkxkVComsDJz1gT6B2apK2Xotj
	0FxOvKq8AhjsrLa8FstH9lslOb7xdmPyhzC9i87/rz8+gBraNylMA1eGM0Evp0qoPidZLsvD1N98f
	gPqb0MzdfnlfpYcAdC+yk6d5DLYuy4gNIvTbIh+DBw7PeJYRPge7+PdFF/Crqtw6mZ+hP/Jqo7gjf
	3i6p/SBlGABlHn/1Ujw2cLyYs3p1n8uvjlEqqSz/WH2KalU1JanlXln0UlQ9WwRJrBjNfMth9JL7q
	lIY9ORow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEGWP-00EEml-1d;
	Tue, 27 Jun 2023 21:46:49 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEGW5-00EEZn-2A;
	Tue, 27 Jun 2023 21:46:30 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2B29A660716C;
	Tue, 27 Jun 2023 22:46:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1687902388;
	bh=9a46aNnESj501/E03oYlm9sAjEXaazXllJOV13stIS8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oJZYJJHlniKS48gum0sgefsmbP8xR8Oa/MOZCbnM02KPe/5T9EJyWJr1G00Xj7kmG
	 oXP0mPaRlV/gUGtbzvXWB5Rwjf4jDWxTjh6kA3u7cb1w5NQ2Z2+042i4tSmRiv+msf
	 8Fhc/oRhY4vpUYckZukQOQlWoSpuOvYMyUeBxBU6DRJKFmyRpxMVtEXMYPdf6uH7VF
	 X2RW78Ua55vZSEaHEjG6PvTOp39EEWQVE8N7A2TeHvizyWTBi/qmC9OvNwsZrujzjO
	 e13JzXrZTVwrdwxD9nsE8N6QaY2JTP7Vyw4DcN78NoGKfJoy3db5Ku25x6hqS/97fh
	 LjJOChpCdgz0w==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 2/7] media: dt-bindings: mediatek,vcodec: Don't require assigned-clocks
Date: Tue, 27 Jun 2023 17:45:52 -0400
Message-ID: <20230627214615.1503901-3-nfraprado@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230627214615.1503901-1-nfraprado@collabora.com>
References: <20230627214615.1503901-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_144629_847309_17B610C4 
X-CRM114-Status: UNSURE (   9.03  )
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

On MT8183 it's not necessary to configure the parent for the clocks.
Remove the assigned-clocks and assigned-clock-parents from the required
list.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

(no changes since v1)

 .../devicetree/bindings/media/mediatek,vcodec-decoder.yaml      | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
index 1506d2693f7d..1e56ece44aee 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
@@ -67,8 +67,6 @@ required:
   - clocks
   - clock-names
   - iommus
-  - assigned-clocks
-  - assigned-clock-parents
 
 allOf:
   - if:
-- 
2.41.0


