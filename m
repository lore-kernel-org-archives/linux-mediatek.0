Return-Path: <SRS0=9HTA=M7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72871C4338F
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Aug 2021 12:40:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 268A060FF2
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Aug 2021 12:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 268A060FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gorani.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DTZ+y8XWHdmpa9fJ0B/AGE8x2CENPo4RvcL/sji2fvk=; b=EJuF0vN97hkVkY
	JO27RcHoFSvbE2Wbw3wVYcnwoppWU4v2HU0oSJRp2av3qX0R6107dypFSwdfOgVBP1wYQTJNFw0s0
	cHYCA3wnZjVZkj21oqszdZUSmJgOYrlYijl9/5cMVKS+cKWbF53TSE3IefQ1XLR4kycjLHZ9czDMX
	n7nGJket+SR2T8Ybbvtq8Eck3G9c+hn+RPWaaTs1gJbeYFiZut9tNj+bO8yZeKrs1F84AV8H7T4Rj
	jlIyKNaqciP3UE7ipM4cBT8iYziXUFqcSP34hh1P+DX2e++ZReztIYruAvxvgBJ6lgtrUksPrJuUZ
	8m/KULX6S+aCzWDp0TgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCi64-00Fov9-55; Sun, 08 Aug 2021 12:40:08 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCi5j-00Fopu-3k; Sun, 08 Aug 2021 12:39:48 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4GjJh12yzGzQk21;
 Sun,  8 Aug 2021 14:39:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gorani.run; s=MBO0001; 
 t=1628426383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vSXYURrU3J7OncJl8RWnabghsuEIsLwm4iQPOfAaK6M=;
 b=SymtR4QvMovDV0m1yXQIi7vVmjljQEmTnS2GYPqk7fcuZ+Sj1bpBUDKH1ECxLrFSUtACsW
 quEINsmIjVgSOENUd9Vg32JGGDWQrK9Ys3ZnEKJFVZB01xd67Ac8ZTo4od6kOkgjAzdgOM
 kXVFx6+eOh1OK+SK9ZPS3Zkan+dG2Q3qn5gfZDFKRZ72ETTabgI2iAqN+7Kr/nui98wZgt
 dChaTTEozzJU9zno6/j8V2t+NklVw5sejJee9XxuTmsPefDntzNNFBk8No6MxVhbX6/gTd
 x2uyCXJpm2tBSbVH3RtyPDS1pItiJJwT528w/slibjILK0GT9xwcXns68sIbqw==
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de
 [80.241.56.117]) (amavisd-new, port 10030)
 with ESMTP id VZg91b7EB8Ws; Sun,  8 Aug 2021 14:39:42 +0200 (CEST)
From: Sungbo Eo <mans0n@gorani.run>
To: linux-mediatek@lists.infradead.org
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Min Guo <min.guo@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Sungbo Eo <mans0n@gorani.run>
Subject: [PATCH v2 1/2] dt-bindings: usb: mtk-musb: add MT7623 compatible
Date: Sun,  8 Aug 2021 21:38:39 +0900
Message-Id: <20210808123840.176738-2-mans0n@gorani.run>
In-Reply-To: <20210808123840.176738-1-mans0n@gorani.run>
References: <20210803151320.71531-1-mans0n@gorani.run>
 <20210808123840.176738-1-mans0n@gorani.run>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 72E40189C
X-Rspamd-UID: 07e247
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210808_053947_352448_A75FAE95 
X-CRM114-Status: UNSURE (   7.64  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Document MT7623 compatible for mtk-musb.

Signed-off-by: Sungbo Eo <mans0n@gorani.run>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
v2:
* add reviewed by Matthias
---
 Documentation/devicetree/bindings/usb/mediatek,musb.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,musb.yaml b/Documentation/devicetree/bindings/usb/mediatek,musb.yaml
index 84ddacfdbe9b..03d62d60ce5f 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,musb.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,musb.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - mediatek,mt8516-musb
           - mediatek,mt2701-musb
+          - mediatek,mt7623-musb
       - const: mediatek,mtk-musb
 
   reg:
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
