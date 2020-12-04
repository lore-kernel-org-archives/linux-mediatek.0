Return-Path: <SRS0=yJvo=FI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3558C4361A
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 09:40:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CAC7227BF
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 09:40:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CAC7227BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dnONxoi8Cr6zTEycrDi/wDGNLx389+Th1OkNCuW8cDM=; b=h7L376mOqpsFQjKKw3+n8eytv
	uzWHOSXTxs8Rlu9iOWeyJNdxqAi4XkEaaLdsdTLfGWYo32pmRIAOiUIRCMk8E17w3DIGJ2cYIwz4H
	4GKUJCZApZhIhrS1Q9AwC9vM3D2oBx/eX0aCO/fSisJ80M6ZaBhQnktTiqD7nsYyu1abzaPhSoIk3
	HZkPw5dYYVkxw+gN8tkNgdJMgYX11Pz8zJQL9OYknO/umYm279ixYfrWTSDrF8OLuxy6G6Uk2ANkB
	zMQ1Tyjz3wtSCSJs7LxTb04JD0ZZ5ZuiLMkfYlzdvShKIjjivDSA7t/+xSsa7FV/whtFoHwjVwHpu
	jvuB58XdQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kl7Zi-000827-7A; Fri, 04 Dec 2020 09:40:26 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kl7ZJ-0007mE-C7; Fri, 04 Dec 2020 09:40:05 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CnSMy2GThz78RS;
 Fri,  4 Dec 2020 17:39:26 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.9) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Fri, 4 Dec 2020 17:39:44 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Karol Gugala
 <kgugala@antmicro.com>, Mateusz Holenko <mholenko@antmicro.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Pawel Czarnecki
 <pczarnecki@internships.antmicro.com>, Stafford Horne <shorne@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-media <linux-media@vger.kernel.org>, linux-serial
 <linux-serial@vger.kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, devicetree
 <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/5] dt-bindings: serial: add the required property
 'additionalProperties'
Date: Fri, 4 Dec 2020 17:38:10 +0800
Message-ID: <20201204093813.1275-3-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20201204093813.1275-1-thunder.leizhen@huawei.com>
References: <20201204093813.1275-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.174.177.9]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_044001_783678_4CB54CBB 
X-CRM114-Status: UNSURE (   8.93  )
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
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

When I do dt_binding_check for any YAML file, below wanring is always
reported:

xxx/serial/litex,liteuart.yaml: 'additionalProperties' is a required property
xxx/serial/litex,liteuart.yaml: ignoring, error in schema:
warning: no schema found in file: xxx/serial/litex,liteuart.yaml

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 Documentation/devicetree/bindings/serial/litex,liteuart.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/litex,liteuart.yaml b/Documentation/devicetree/bindings/serial/litex,liteuart.yaml
index bc79b3cca542437..c4f1f489dc2d091 100644
--- a/Documentation/devicetree/bindings/serial/litex,liteuart.yaml
+++ b/Documentation/devicetree/bindings/serial/litex,liteuart.yaml
@@ -29,6 +29,8 @@ required:
   - compatible
   - reg
 
+additionalProperties: false
+
 examples:
   - |
     uart0: serial@e0001800 {
-- 
1.8.3



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
