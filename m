Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94784C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 11:00:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1EE8233FC
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 11:00:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1EE8233FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tjKwKzA7MSdKi1FNnbQ3h60yxXxnWL2GBlxRpE6MzcY=; b=1/1AL8bvJE92LVodOvmDaGuuu
	ccMvX6BF8dHoZBX5dqGg8uZGpst58wcgkrAYNFavghOE4smlWQeg1A927L95us7WRQk9hLn2TLlQJ
	I2r72qc/0mu3pLPLln+lmUyckRhKaIh2R2aGPVfzvopRtZ8OZOas7igdIUOqI8eNGOJSxVswRmBvB
	aNtxvd2Ug0nf18hdXCSmt/GAn9jXPS2GkKum14+z/7WM6ks/OIX4YlSsZ5dKa3lRZpzuohFIePnNI
	XyMfkHde/Bpz8yOjRzzUnO4xtL357Bt2ap2FemUG6GlFs7F/n4M9UGcuEJPDE61lFqTXYZk0oiGny
	r28+CWYoA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzdsS-0003hB-RJ; Wed, 13 Jan 2021 10:59:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzdsC-0003U5-2v; Wed, 13 Jan 2021 10:59:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3914823443;
 Wed, 13 Jan 2021 10:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610535570;
 bh=02hqnGTUS5YhTP2z/VCY76S2cwZbqzkUNrtVW3wWscw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bp76ErEzNtCVNA+AIn8Z5iSWYV2oQEYfmmQxRzFhjkznZtI6dq9SDiA+kDekUSB1h
 V1yRM6pIcQu6161UiruJwjsd55ACNbY85D+lP2P3LLOnAprb9dPlIHoewlm7ZspwPd
 6pBJnfeMWAGMncgrEv9bMjcpawP07RsG6MEdiRUu/arWspnrrHunBE3z2ajn+34ePg
 oSwl0dYGuB2roaecBwIQeX4DSFtmFHdtjy7n2DaTYNpcEMTZGqdb3B0t7iOL14Cj8V
 yyDHv84cIxlY+Z5WhkbwR9CrjL+ZNDKbHKUOdMUkvrh0HEwmMClB/4dKq6zHfkr6UM
 /xVKFJu+YmU5A==
Received: by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1kzds7-00DpGn-RR; Wed, 13 Jan 2021 11:59:27 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 21/24] dt-bindings: display: mediatek: update mediatek,
 dpi.yaml reference
Date: Wed, 13 Jan 2021 11:59:22 +0100
Message-Id: <3bf906f39b797d18800abd387187cce71296e5eb.1610535350.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610535349.git.mchehab+huawei@kernel.org>
References: <cover.1610535349.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_055932_519440_227784F3 
X-CRM114-Status: GOOD (  11.88  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Changeset 9273cf7d3942 ("dt-bindings: display: mediatek: convert the dpi bindings to yaml")
renamed: Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
to: Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml.

Update its cross-reference accordingly.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../devicetree/bindings/display/mediatek/mediatek,disp.txt      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
index 33977e15bebd..865e1e1b88ac 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
@@ -23,7 +23,7 @@ connected to.
 
 For a description of the display interface sink function blocks, see
 Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt and
-Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt.
+Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml.
 
 Required properties (all function blocks):
 - compatible: "mediatek,<chip>-disp-<function>", one of
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
