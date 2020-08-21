Return-Path: <SRS0=eFaK=B7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9498C433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 10:36:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAA4A20738
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 10:36:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rVB3Xs1a";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Iy0MSgFu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAA4A20738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=U63XrN+RVU8KoALX/bZ9W4vjcmIJBfk9vk1B5UHwJA0=; b=rVB3Xs1a3386SdOI+09rA4zW9
	N8h73ImQtsTqhXdlQO+rGXrw5xAxY0Mtfgc2/VLlGEmaRwwlmlJWmOGqIeUMIgHupyOB/kCnm4guW
	y9LKvnugSZkva/v8TylLnxCYCXBLhAwejhk98MO1w9v8Vdi5g2Xmx1ldoja41Z/FYBUFeaqzCFni0
	R+XtqIwryVrSzZK1S1wS0m0mjd14N+KDfR5uy0TzePDHS6a5G+s9MiqUTmEE+Ww+E3LPvx1ZbqJoX
	EUrjxH2LAlsBSh3TWf43owvvqBab2SKpBFLYSbQrDOe1loH8fCcHd0xikjbh5UP9+wAuExyIDAu24
	dk15W3mdA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k94Pc-00022a-EZ; Fri, 21 Aug 2020 10:36:44 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k94PZ-00020v-J7
 for linux-mediatek@lists.infradead.org; Fri, 21 Aug 2020 10:36:42 +0000
Received: by mail-pg1-x544.google.com with SMTP id h12so806603pgm.7
 for <linux-mediatek@lists.infradead.org>; Fri, 21 Aug 2020 03:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BLvzm19F3zl+eOkSMMbBhpyNYB39d0d4Z4gVhRAGhhs=;
 b=Iy0MSgFux7Cev845jWcIk5W1d+GN1ssj/IaGgeXfk+ZI3C12DLDxSPaO9eKgh9hnP3
 kT63iPNAmRFK/qG+QwJ9fVto0ueIRlNan+MrfK2pKRbA6FOuGijR4Lz3+a51FJXgod/N
 xWkJM0z8MGUmSv3M/0mwWg/4UdGwNgUAPw6Uw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BLvzm19F3zl+eOkSMMbBhpyNYB39d0d4Z4gVhRAGhhs=;
 b=e4Q7GDZFlzy4QIYDu6zmrAELoIod95JBJzcJiaSZV2SjCUlrMYwp/cKw3ahgweyLjl
 6eIjt++v/US9Av84Z7SG1bC+3dfqQYkU/N6n7NdGPS31BFw0zNIrqNf3+d0mUbNK5npx
 elUX7vdAxhJylN9TSIJCoBfcqmp2pmYVcWKReqSopbbBRJwlGngSAEn2dsAkDgHUHTnX
 Z1QqU6QFeORxlA/aG1Fu56FrPvoIPqjZXvxC/yO/K3wyfB3kO9diA4PldCj4N5//wxSi
 xoh5R1NACDrPj0IAInDsR9mNgUaaL0uzXR1mRjxGL9CRYdM3Yei7HBOwDTbDlK38q+qs
 fRRQ==
X-Gm-Message-State: AOAM53312AVUC9aWZPjDtIAHRcnn0kKuidicKj9Oygc7zcFra1HkSNr+
 hVg3blj/SAf8Ojz02sHfgAgmKA==
X-Google-Smtp-Source: ABdhPJxmj3MQvemdJuy54bQsLgg/tFf4axVuPDthLbNbX2Xeb4x6zKwMnT75o31enJ+GCmphNZcZNg==
X-Received: by 2002:aa7:96db:: with SMTP id h27mr2009391pfq.26.1598006199528; 
 Fri, 21 Aug 2020 03:36:39 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
 by smtp.gmail.com with ESMTPSA id y20sm2081525pfn.183.2020.08.21.03.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 03:36:38 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 02/17] dt-bindings: media: mtk-vcodec: document SCP node
Date: Fri, 21 Aug 2020 19:35:53 +0900
Message-Id: <20200821103608.2310097-3-acourbot@chromium.org>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
In-Reply-To: <20200821103608.2310097-1-acourbot@chromium.org>
References: <20200821103608.2310097-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_063641_658991_9EAA264E 
X-CRM114-Status: GOOD (  11.04  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The mediatek codecs can use either the VPU or the SCP as their interface
to firmware. Reflect this in the DT bindings.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
---
 Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
index b6b5dde6abd8..99214faede90 100644
--- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
@@ -19,7 +19,9 @@ Required properties:
 - iommus : should point to the respective IOMMU block with master port as
   argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
   for details.
-- mediatek,vpu : the node of video processor unit
+One of the two following nodes:
+- mediatek,vpu : the node of the video processor unit, if using VPU.
+- mediatek,scp : the node of the SCP unit, if using SCP.
 
 
 Example:
-- 
2.28.0.297.g1956fa8f8d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
