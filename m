Return-Path: <SRS0=M/W3=OG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 676BEC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Sep 2021 09:55:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37DB761185
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Sep 2021 09:55:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 37DB761185
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sxkzGrAM8FuJnBVo9eXLniZgREPBXqZizv2FC/Z79R0=; b=4UNWQkGEWHleqm
	DdsFeeoy1StB7Zghbn/a1RRVhhaL4dCIsCkcZT8yBzBOgq6+imnOf6pTCWJL7Q2kcAWkazZjYrQXC
	WGPQOG2sRMyfxa7RdBm3wIbFIQpW1FFEuB9v1BRsWDDNcwXMfLMClHqsjmU2pt8ZdMlGoRsl2meTj
	4j7GQQ8SxrSLJJu8+YlTLJnYoLMWCnMa1ra39WcfmkpKG/dOCmFXO+qdjuu8qGvvLIwu7Vi8oqoKR
	2YQ3g0mr2CIVkMzYjjsG1EgnhZFlD1kffuGnaDeDn8JMoGJcewMp1K1tSQef028CVGQxQq81+dgjZ
	PY7/FRam4Xn8LPvUrGKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQo7L-00Amz7-O2; Thu, 16 Sep 2021 09:55:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQo74-00AmnH-TA; Thu, 16 Sep 2021 09:55:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2886261209;
 Thu, 16 Sep 2021 09:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631786126;
 bh=zDcDBX6eE0bO8UITevPPoTLTO8JLB4xPsBz8UuRXPe4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=feSKElMW4rq1yHiIKDtA7h/hVpjTffl1JyFKYr8M677T2LwZkphh8+2XQYBfWyRUk
 /Xx+OwBX7NvghS7UMziBtE89z6YJJWIOFrIu5eN9jcnoX82V/6DETnKT3//g1gfBah
 Z7bW2rkuNC9GSxyGgsoveSWI5P2Hnor6G9ggR7QJ2YrRBRK0dTkUpjyowh8TGxrdhj
 g6sGPRhWb7pHyMD5Ntytop1pHu+T/onq4TIhrQXwicW3iZknRN1KrxRvc+0o06Kcb8
 3WnXG3WA9McHjg69CLBCRRGhMkRWwsZOaUdFPpwNqTAt9jyC+UXbX+Yq1YLjrldZuz
 Q570TEWpcloFA==
Received: by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1mQo72-001vTT-7I; Thu, 16 Sep 2021 11:55:24 +0200
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
Subject: [PATCH v2 03/23] dt-bindings: arm: mediatek: mmsys: update mediatek,
 mmsys.yaml reference
Date: Thu, 16 Sep 2021 11:55:02 +0200
Message-Id: <a87eb079a73e8ab41cdf6e40e80b1d1f868da6bd.1631785820.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631785820.git.mchehab+huawei@kernel.org>
References: <cover.1631785820.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210916_025527_014752_C007AA3D 
X-CRM114-Status: GOOD (  11.86  )
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
