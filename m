Return-Path: <SRS0=zPgu=IK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07194C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 14:56:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DBC064FDD
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 14:56:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DBC064FDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IQYENnOcX6AhHZZ8JdIhR9aYMZReePPi4B9f7V1Y6hc=; b=gTbKkvFBaCupIskK14QjDn0M8O
	dOQ544iOwkfKYz7U6gKXXTaFiAGsM64HCFooD+Ns2+D2fN/G8JolYmce/JCTWrp4i3YIaGvD2x5be
	jJMwx9AStuxOvy7ogyy47YLspWUkwH365Ca4d0cxFdcKppJ2d+1fpb/o7709IgCLATlFqml5s4aOp
	O8mcaD1kja9kYdFpwdNF5+yoJ3LCXRyz+DrEn9Lhv0kkBu4NX4E2B2DnOWjvk9udNi/TWWWO5VEnb
	oq7Mlu/WKEByFSeBjmnVhj63LSpHqsys3rZY+1LzxXkYXV16FCNY+iTyBH1uYUmfY24dvHvEZL4mN
	q9pgroVw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKjDM-00Bgje-IM; Fri, 12 Mar 2021 14:56:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKjCy-00BgeX-VU; Fri, 12 Mar 2021 14:56:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7754864FE2;
 Fri, 12 Mar 2021 14:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615560963;
 bh=dxhHQ4+Tj25cN9LD5py5bcCli70KK9AazUdZGS4VzAQ=;
 h=From:To:Cc:Subject:Date:From;
 b=BAMTp2ZwbkOUL+l7vDFjopGEW97mrBAo0hIf+MsUuLykpkFns1zI7Q1Vb7r/zGRJa
 t3agooFlZdJ/rx7cBckFj1vMGDG8lEuV85QzTq2Y0tmNBD/iXRMdnwgUB2/LkjFJZe
 kSouoo2BQ65GjT363HHRvtcDcDssx2Wmzu1rU6hdjF2VgWeR3e+djcKj7CJ3SCNthd
 q9Zom7r8/Imi00MQgs5s4Nc76rYTaPCEAH4KIiiB+z0vHPlXltaGArYF+qVgsJqm0I
 WAAe6X17qcyDREI4uk2Gmm1Mp/SxnrKkPL5ZbZ6kQ+M+v+PgdH4spgoQno4ziguhF/
 4GShn/t/uW1uw==
From: matthias.bgg@kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, matthias.bgg@gmail.com,
 lgirdwood@gmail.com, broonie@kernel.org
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH 1/7] dt-bindings: mfd: mediatek: Fix regulator description
Date: Fri, 12 Mar 2021 15:55:39 +0100
Message-Id: <20210312145545.26050-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_145609_578488_ED1DE976 
X-CRM114-Status: UNSURE (   6.73  )
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

From: Matthias Brugger <mbrugger@suse.com>

Having a separate compatible for the regulator node is redundant and not
needed. Delete the corresponding requierement.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
---

 Documentation/devicetree/bindings/mfd/mt6397.txt | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
index 2661775a38251..28a69728e6fe2 100644
--- a/Documentation/devicetree/bindings/mfd/mt6397.txt
+++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
@@ -33,11 +33,8 @@ Optional subnodes:
 	For details, see ../rtc/rtc-mt6397.txt
 - regulators
 	Required properties:
-		- compatible: "mediatek,mt6323-regulator"
 	see ../regulator/mt6323-regulator.txt
-		- compatible: "mediatek,mt6358-regulator"
 	see ../regulator/mt6358-regulator.txt
-		- compatible: "mediatek,mt6397-regulator"
 	see ../regulator/mt6397-regulator.txt
 - codec
 	Required properties:
-- 
2.30.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
