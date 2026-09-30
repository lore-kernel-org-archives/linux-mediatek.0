Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDABCA5FC1
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2026 09:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LLtGDvHzD6CrNoA94RNqXZ25K72u4Lfc7xmaaJ1VbZc=; b=sXZRdfg19XZkFI9VD5923A9Kb7
	S/DEMnm7waxu4DZR1zEkPQ1lRuP3t6hKagsMc1OF9RdZHTDUUbWNfwTyAYLFkc0oyiEZHWYMDWllV
	Mx5rZTvMZWdSjGZYMZmCRy/ZmGWGoMYwa/3whiv7kCnVQyyWTtfMHyjRm48YCQEXC6E1idlJpG6CW
	3Z0CExHBZBBhjv/maTQOhzK4546oEV3YBUzCZqwMv6fUflUrzeWQrHUzL9kH3xY/wCDhUzm7rSvzn
	oWuIrmLolUU1SsoKRcScPfBSMCY+3JrJGKq40Eet0bviHsIlK9IQ0IF+IyYxMMJkKLrjrcgE6ZYxx
	c9RHq7hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqxR-00000005cEJ-2gb4;
	Wed, 30 Sep 2026 09:50:37 +0000
Received: from mail-dy2-x0f.google.com ([2607:f8b0:4864:36::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqxP-00000005cD3-0pPo
	for linux-mediatek@lists.infradead.org;
	Wed, 30 Sep 2026 09:50:36 +0000
Received: by mail-dy2-x0f.google.com with SMTP id 5a478bee46e88-33e46a15703so4918716eec.0
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Sep 2026 02:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790761834; x=1791366634; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LLtGDvHzD6CrNoA94RNqXZ25K72u4Lfc7xmaaJ1VbZc=;
        b=KBa2t1+YU6ypLbcj0+u6n2ZHHNs4td4xj90hc+41QBIRg3AgwlLQFB776vXXvGUWO6
         R0tqmK3kKRK9u8plRkm3qOENnIZMXu+JetAjlM9vMD8xFSNKEowkmhpHC8ChkYjeKs6M
         jQDErIZSYlWHNoGVcnh5n7oQ3thQMSEhHiwVUYN1OX7shI7ghyIDPU8ntFj77+OGWD8c
         oNSXFb9eJzDkn0QxgEzRTRWawk9ilPBWD8+H7vY6SNom9R7MVvjvy//TWkURXD1GUkJO
         IFyI/+ulKd5bfrz6AgJRX+rLOABcHgkCwfYg7zoSKhaogKYcDtwnOPJ33VGudJLlfBVs
         UgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790761834; x=1791366634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LLtGDvHzD6CrNoA94RNqXZ25K72u4Lfc7xmaaJ1VbZc=;
        b=rc4LmPSPKcw11k7ss3sSZ9zMsEXWlG6//MWYz62efw3/lQupTiz+zZyg0tWnoFiYyH
         ijpqYlYLBmWw49GEdXfjlbOUFeMBfLuiyUzzLd2hB2JGKTM23hbfKhoPC1wB6RMc1R8z
         2SBdfyxweYcJ1yMVuO/OXif6dxdPA0en8AExgXO419UjA1P8nLvmpNt4VK1RSyWcimiz
         /7nXqB2zt4DhXT9qch4636SPWH+OCNAJJNHDZ8WCAG/bcVxrF28tXAXeOgqzJHdLsonY
         dKTCwyju4sAcGR8Sx/C+uh3c06tyaIsyzNYSfh/9l4RWswG9CufAnQoJc4HI8flhxjtk
         E4dg==
X-Forwarded-Encrypted: i=1; AKwUvBwo9hJ4W3eLkfxFiZBEqL+HHm/8cOF+UCGCIqFD5F4FHYdl8A02yhTPeCHEmHV4tHFLJWMGrsLVxASzLIaOkQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYLQJChxMhkRLhSXd9c7wAeB1PcS4QTK/DKrb5crz+bFsPnMvcZO
	uTh+omXjsQ/m0EQ5oHnNSW3iZFjCOaQ/jnml4X58x2i9E4p9D+qCOenH
X-Gm-Gg: AYBFou1bWg44zJuGkn2YwGWFIelOgF9IRTMe+p+iEALsx9yQ/nzPso+6RL7M/5enDyi
	zyYjE39ApW+SQEErOYjtVwOqRMNZ3QNA0122Oo1KQhbCoON7cuetgoxyzOn5eiMqP+xx1s/HRFK
	rLt7KQJIzKUQjOOB4Ag39zCCrJB0r22d0TKuIqf0DpAQkUkKsrlE+Dcg8nmKOZM+rGRNQ6vFWsi
	WKqdur4Vn37dz2oNLV45zwR5QaxZ1b/dt4jlcwZoSGPH23QAJy8PLb6OQDnHtgdZeefgxsFnaVx
	klthpfh+EPp5026f1JV4UQw0zpN1xVd1rRZjgYzlWuuRAKPznIrravONmlExijXPkIFElNQFHvK
	7Ni7HrUJqhjnheuon7hLoSXQy4ulJxhEwTylU1xJjLxsSIwiwgI6yam7czPZBLB4BsEhsAmwGI1
	5hHcuSf1uV+gBcVMbURUEbof62CdwCaUgg0jluGmkPKHJljUh6wi34YbAwo8MQ0hluQ6LRx/Nhi
	HTBlStp7j64SQev5FQH
X-Received: by 2002:a05:7300:fa07:b0:33c:3134:f45 with SMTP id 5a478bee46e88-34cd907665bmr1266990eec.5.1790761833122;
        Wed, 30 Sep 2026 02:50:33 -0700 (PDT)
Received: from localhost.localdomain ([103.178.205.97])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf50553f8sm4934658eec.14.2026.09.30.02.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 02:50:32 -0700 (PDT)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C3=85=E2=80=9Eski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] PCI: mediatek: Fix integer truncation in fls() for resource size
Date: Wed, 30 Sep 2026 09:49:12 +0000
Message-ID: <20260930094912.3069-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_025035_266526_7E77C63B 
X-CRM114-Status: GOOD (  12.43  )
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

resource_size() returns a resource_size_t, which is 64-bit on 64-bit
architectures or 32-bit systems with LPAE/PAE enabled. Passing this
directly to fls(), which accepts an unsigned int, implicitly truncates
the upper 32 bits.

If a memory resource window of 4 GiB or larger is passed, the size
truncates to 0, resulting in invalid AHB-to-PCIe translation window
sizes.

Fix this by using fls64() to safely handle 64-bit resource sizes.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 drivers/pci/controller/pcie-mediatek.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index a60d1ae076f8..61591d0176bc 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/bitops.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/errno.h>
@@ -754,7 +755,7 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
 
 	/* Set AHB to PCIe translation windows */
 	val = lower_32_bits(mem->start) |
-	      AHB2PCIE_SIZE(fls(resource_size(mem)));
+	      AHB2PCIE_SIZE(fls64(resource_size(mem)));
 	writel(val, port->base + PCIE_AHB_TRANS_BASE0_L);
 
 	val = upper_32_bits(mem->start);
@@ -830,7 +831,7 @@ static int mtk_pcie_startup_port_en7528(struct mtk_pcie_port *port)
 
 	/* Set AHB to PCIe translation windows */
 	val = lower_32_bits(mem->start) |
-	      AHB2PCIE_SIZE(fls(resource_size(mem)));
+	      AHB2PCIE_SIZE(fls64(resource_size(mem)));
 	writel(val, port->base + PCIE_AHB_TRANS_BASE0_L);
 
 	val = upper_32_bits(mem->start);
-- 
2.55.0


