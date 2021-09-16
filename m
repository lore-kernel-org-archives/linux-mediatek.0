Return-Path: <SRS0=M/W3=OG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75463C43219
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Sep 2021 09:15:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 476756120F
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Sep 2021 09:15:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 476756120F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sxkzGrAM8FuJnBVo9eXLniZgREPBXqZizv2FC/Z79R0=; b=ohra+hq7Wg34de
	uc72xzpp5GR4sbjtlnyNKTO6pI5S7xJkQ35SS+nrxJGY9Gty0U6A9JDvot9KpuYVU3PMtYP6O8cYr
	wZQS0b11iKi3zPyVfNmm1NszhkLEjb8AVdHSMHYurRWixP+h0+NRzGre1Ne/Mn9DYL9+HBkONkko/
	0zfMqeqheDFRP0g2Zi6py7L7NnQ4Btd61ly+YtZ1oERn2d35H7Pd1n/xA9vXhR9nNClkGvVOwmPKa
	7+i9KaZzfpeFv5zayH2BwaP5cfHkckM5lQc6EJeS210wBn8GlIG6WpFDXulQ2ouYSZcqo0Z3m+0SA
	d5V3EG8UF+b9zuiueYNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQnTm-00AeOJ-9z; Thu, 16 Sep 2021 09:14:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQnTK-00Ae9Q-Br; Thu, 16 Sep 2021 09:14:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 586046120D;
 Thu, 16 Sep 2021 09:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631783661;
 bh=zDcDBX6eE0bO8UITevPPoTLTO8JLB4xPsBz8UuRXPe4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SW94wrufH0ymeTLjIxMXsrNQywYPu2F5h7OPgdyLx5p3fCIiQnWFFoj4Dgl7Df5Qz
 +mcqNn09FcxUOqS193pMmO2A5T0h3ZJtclN2Bp365tj6JtcJMwqE5oA+T1xxpEwo5D
 tCOZ0a31CZnfNhiSN2Ou3n91ziZvnfB3eVUNkq29YV5fLwEcXpMBjTzcOtM8J1TTQ1
 QWS68rz5YA/GZNPqgSM2NiThXXTkFt642x464IEtqQgNhx33MfmyDNd5J2y3/SwtFu
 kwxZ88RYIy4gKmfCJZVI0wq+q4wixxPGaoHh2grxOCryPxZtY/UrOtKJKVPMLtOKFb
 8OiDsL7h4NAug==
Received: by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1mQnTH-001sKk-Bo; Thu, 16 Sep 2021 11:14:19 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Fabien Parent <fparent@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH 03/24] dt-bindings: arm: mediatek: mmsys: update mediatek,
 mmsys.yaml reference
Date: Thu, 16 Sep 2021 11:13:56 +0200
Message-Id: <59ed57747db9ce9ee1875488245512050de85057.1631783482.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631783482.git.mchehab+huawei@kernel.org>
References: <cover.1631783482.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210916_021422_467359_7DD18B6C 
X-CRM114-Status: GOOD (  11.72  )
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

Changeset cba3c40d1f97 ("dt-bindings: arm: mediatek: mmsys: convert to YAML format")
renamed: Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
to: Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml.

Update its cross-reference accordingly.

Fixes: cba3c40d1f97 ("dt-bindings: arm: mediatek: mmsys: convert to YAML format")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../devicetree/bindings/display/mediatek/mediatek,disp.txt      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
index fbb59c9ddda6..78044c340e20 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
@@ -9,7 +9,7 @@ function block.
 
 All DISP device tree nodes must be siblings to the central MMSYS_CONFIG node.
 For a description of the MMSYS_CONFIG binding, see
-Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt.
+Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml.
 
 DISP function blocks
 ====================
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
