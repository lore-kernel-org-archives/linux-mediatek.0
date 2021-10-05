Return-Path: <SRS0=zM/7=OZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14E0CC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Oct 2021 20:29:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABD3060E94
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Oct 2021 20:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ABD3060E94
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=z3ntu.xyz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RxLDdmpKxd9WEOsqaRYoj19dBSGmhtR5bz5JrXeamUI=; b=oq1Mr5xOEM1P6H
	rn2++L6Sx1GLupVvAr7zHu4kbkoZ9EMFtExaV+w5A/kmhYqSTkGW3iAKdFXtinNIJLbtKqf6MulBK
	6nDa/ZCUGgoudVlAtaPDtGs57n/xBIj9GYvFWsDsW6YTuc5RvlWgRGGzarGqjTfhS8tc92sj/UXVG
	SjKuPqzUvDMNxeCMpN3Nu4RpiH24PpuwqPh8wjzMip+fhq2a0LPwrKQujYgZh7dlxxQti8wJD899u
	qCJdSrQH7hAYS+7GkdVYPoOn8Fbji82Y+yJNpX8e59qVKY7/yOkALieITLffFMyhfRgbUg8dDyrtp
	ORiEUx/DLktwUQOe4fPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXr4C-00BpTe-Df; Tue, 05 Oct 2021 20:29:36 +0000
Received: from mail.z3ntu.xyz ([128.199.32.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXr3x-00BpNd-HF; Tue, 05 Oct 2021 20:29:22 +0000
Received: from localhost.localdomain (ip-213-127-63-121.ip.prioritytelecom.net
 [213.127.63.121])
 by mail.z3ntu.xyz (Postfix) with ESMTPSA id B15B8C9158;
 Tue,  5 Oct 2021 20:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
 t=1633465757; bh=frxoBNTsUZRbITBdNSe5aGy6uhU1HOv6AQ3q+VXoaXA=;
 h=From:To:Cc:Subject:Date;
 b=X0ujESeE0xHg0RTUID+yhgBnuvIcoCWFv5zHu3Ga9cnC9+IrR8fe/7NIxT/qlysZ1
 /a5cS2myucCbWz3BV7KZ+TNYVm/1NmlJ4XszrKcbFultyujpeeTM6sQryoKME1NjNW
 z2hLdL3vIpj7x8Nv0/La3dMbBIHDTYLcRdkJin0s=
From: Luca Weiss <luca@z3ntu.xyz>
To: linux-mediatek@lists.infradead.org
List-Id: <soc.lore.kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, Arnd Bergmann <arnd@arndb.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Luca Weiss <luca@z3ntu.xyz>, Matthias Brugger <matthias.bgg@gmail.com>,
 Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, soc@kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: Add MT6589 Fairphone 1
Date: Tue,  5 Oct 2021 22:28:30 +0200
Message-Id: <20211005202833.96526-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_132921_727473_3A762C1A 
X-CRM114-Status: UNSURE (   8.73  )
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

Add the compatible for Fairphone 1 smartphone with MT6589 SoC.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 80a05f6fee85..0fa55497b96f 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -32,6 +32,7 @@ properties:
           - const: mediatek,mt6580
       - items:
           - enum:
+              - fairphone,fp1
               - mundoreader,bq-aquaris5
           - const: mediatek,mt6589
       - items:
-- 
2.33.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
