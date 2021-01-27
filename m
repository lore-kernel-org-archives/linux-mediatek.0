Return-Path: <SRS0=2T+p=G6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1555C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 08:33:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79FBE20644
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 08:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79FBE20644
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z9ij5mBGeTjLXJ74Sn4z1WYhF1/qoQuOyEYFEIg+zOo=; b=khlsiSYSj4twlkhh0x4k2VfWB
	iFKhE5/v29dQ/v30XJOmTftIvhE4yjFulv2w0QNCDelKbrIS8x8WepjRrE+JQK6GgQhgrquw1Hv6h
	vwc4zhSVr42eEO5sL91jkaRTeowZVthk4Fr+x8sP94Gmz1sbvuVO9k7fQU+itltYRqOiqcPL2JmOh
	kgA2wK2JjACIC//umnTCcXhObjfNNIxTKTHEUe8tpSkMMtFi9xs+wn6e+MghEUYuoo5SNm3QRyNwU
	GmP+dtuAWGZBpr/KGyHbGmCJ1usyD82gwBZmbRMd0+PHTRrAwmAO/kSDYwI8GCaEuVIt0sfZuQAnt
	4lc5iFmzA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4gFn-0005qJ-Gq; Wed, 27 Jan 2021 08:32:43 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4gFk-0005oz-Mr
 for linux-mediatek@lists.infradead.org; Wed, 27 Jan 2021 08:32:41 +0000
Received: by mail-pg1-x549.google.com with SMTP id 18so1053891pgp.22
 for <linux-mediatek@lists.infradead.org>; Wed, 27 Jan 2021 00:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=LGZTxpAXqFWtECT4mU7eGwfUfjYEwbaGaOmL3s+WPHY=;
 b=Mk8UO9d9k5Z55wJIilDYOJbDVrADuEvo1RU1iq6uOFWQ2fpZhKzOBeUq40bTXbRUhW
 H9Nd9XfdYWaApv8HgACBsOSQIMZ9Q/3vTbecNY/Qps4GTc5lhFlAGQWsX9ovK/wsGDh5
 0UWExHtK6vDsOFjf/kVISrSdNxBzzWdmNJmnZmUd5HnK+Ek75aatKN7s4buu1pQ/uCKo
 TdxneGiJN2fv9e7ZRAi9kYTlCnRSyFrrcjcJNtBR7kUjRwvWFO3mHbo/bMHOMRnk86tx
 oMIO8+9hrYWPcva2sgwg+r4M/1tpmOF1ANT3UzZ0ZwtgXaNrcJQ1mn2bTF3FO74hBpHO
 dGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=LGZTxpAXqFWtECT4mU7eGwfUfjYEwbaGaOmL3s+WPHY=;
 b=fWcOYmfk28S9yCpmvdcTLhVpFwqii48x7Kt5V+GDjCgfgzRrIwul2SOP7VVUe3T6pr
 0Mj2/jILmrndiwJIKhHtxwEVOyQtCyi1GHq9pVOvrbj+Dz53lj4hAXydJo7A33zt+wHO
 uCfRE1A31rWqjpRQdxbRjEvP3ZiHOTWdlzqav0OWjPA5ldYBhoafCRwFCYO9FsnjMYsc
 ZdrP5aC7bR9sisNdMAok6RUzd7ccd4myno+PEKz1yK3FxQ41ATptbMVlDSSXmDEqiwh1
 WcvEAvS9CcRGHJRm0iXAKBTVfq/A/twjIXZS31PExyScorh3vPFC7yMw1Sqx552/Z+Xv
 LR5w==
X-Gm-Message-State: AOAM531uywCUAQMI8hNU2YHDMsfQvNyXAPFBW/bfGdyKa9lJCfjNFLBT
 oGXW766rc1loDLOz2/+Yk213IjtS8wTz
X-Google-Smtp-Source: ABdhPJy8uOr6FzvmT069kx+Pz1AfQycAO6RoKVfv9FAjkZesiSjZw9ppOmVHAroDlr7jOix3x2+itbb2+XU4
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:d17d:c7bb:69a2:7e2f])
 (user=tzungbi job=sendgmr) by 2002:a62:ce8b:0:b029:1bc:39bd:13ad with SMTP id
 y133-20020a62ce8b0000b02901bc39bd13admr9563175pfg.24.1611736356753; Wed, 27
 Jan 2021 00:32:36 -0800 (PST)
Date: Wed, 27 Jan 2021 16:31:35 +0800
In-Reply-To: <20210127083136.3745652-1-tzungbi@google.com>
Message-Id: <20210127083136.3745652-4-tzungbi@google.com>
Mime-Version: 1.0
References: <20210127083136.3745652-1-tzungbi@google.com>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
Subject: [PATCH v3 3/4] dt-bindings: remoteproc: mediatek: add L1TCM memory
 region
From: Tzung-Bi Shih <tzungbi@google.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_033240_759921_F67586D3 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, mathieu.poirier@linaro.org,
 Rob Herring <robh@kernel.org>, linux-remoteproc@vger.kernel.org,
 tzungbi@google.com, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Adds L1TCM memory region.  The reg-name is "l1tcm".

Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 Documentation/devicetree/bindings/remoteproc/mtk,scp.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt b/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
index 3ba668bab14b..3f5f78764b60 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
@@ -6,10 +6,10 @@ Mediatek SoCs.
 
 Required properties:
 - compatible		Should be "mediatek,mt8183-scp"
-- reg			Should contain the address ranges for the two memory
-			regions, SRAM and CFG.
-- reg-names		Contains the corresponding names for the two memory
-			regions. These should be named "sram" & "cfg".
+- reg			Should contain the address ranges for memory regions:
+			SRAM, CFG, and L1TCM.
+- reg-names		Contains the corresponding names for the memory regions:
+			"sram", "cfg", and "l1tcm".
 - clocks		Clock for co-processor (See: ../clock/clock-bindings.txt)
 - clock-names		Contains the corresponding name for the clock. This
 			should be named "main".
-- 
2.30.0.280.ga3ce27912f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
