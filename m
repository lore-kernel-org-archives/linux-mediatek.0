Return-Path: <SRS0=7tkd=FN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E9B0C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 11:47:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02D0723B5D
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 11:47:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02D0723B5D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kP3jxcQJc6lfcRM5D35EDjUZZb9Ttjqx3vAKEWz0xwc=; b=j6gkEJ9V6ptqP91pX5l99eW/rl
	aaMDHNbt6LjCicpMPO0mLO19ID4gIQv0QjWfop7zbC6CkDsxFYC0aC2kqqYmCj9GBs0a20Iai2OY0
	bSqzoyXfY+SPSmLC4JMkAM1up6tdpFbxPEYVH5Dl6+X4BVaItXfVlDPYV6vVstxo8VpzqO6xN3xL/
	yem7AmXStRAbgi7aEhkEFGPGTgR4CtOhjtGPXfOsKRDvfLTmggYiWI3LSBt2Lawf1uW8DYh4+pJXa
	8GChh9vj9gVDHmWgrkhpSJ9KuG74R1HEb/9aoqcC6n5svgozeXbYnK4fsh4e8qn1Rem8Aq84DwRWw
	tGFSR57w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmxwd-0001SZ-Hv; Wed, 09 Dec 2020 11:47:43 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmxwb-0001RV-Ns
 for linux-mediatek@lists.infradead.org; Wed, 09 Dec 2020 11:47:42 +0000
Received: by mail-ej1-x643.google.com with SMTP id m19so1650647ejj.11
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Dec 2020 03:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rs3z5HiZz52Q+PqaHhfTF1Q+uRexoKTRYXUuslD9bJA=;
 b=d3T36ZkNR/AUgVDsWMcv+epjmknEjkr1S4/hA5BmOBbmMp3QPmqbQ5+T5urLbZsaZm
 yddM22Ca/MjmaZ65L9Ziy8Eis/rNNRh6ZWV33tysfBDK99xgKIFsPiG/pLxOIGV2msux
 3VZ4X/R76YQSx/b/gtQiCbkElRc8FjmqEJZ9snzxdIWHO32LjhfnKFPVl2brKq/cbdPl
 zpDqtSxW6OC+2JHBCUwRoKYHHWYHCx4jqiOhBquIjUJ4tNKpJzn/IlzziXa4/3PKi8pE
 aTb57hm0IUn94GQTHu2NhsmG7apvTb2fEUQ2K5isvTgowQlyZ+eEA7pRISQ75ZxcifFr
 j0UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rs3z5HiZz52Q+PqaHhfTF1Q+uRexoKTRYXUuslD9bJA=;
 b=nbdrf3BNQaBY96R+zXCr07hu1iUThp6tuGgigih28V3gImtAz4d1ao3jyIw7kS6aD7
 qBsT7S/sXTpNcl0uSU0FCdOjJo4Y9N2LhXIzO5Fx67m4x1TmsSNJVKHEEpR6kb5R+uCs
 9sXkFdhWJitpS828dHLD2B+6NRw6GUkEpbapsRkzUzOtEjS+3aATaFy6777zCE1BZJdR
 sEGjfYTl+lnYmmNyaHy5qnlaPe94A6fztDwGFueH+PVI3rWqjKrlVkIGQNx2A4mdeAxv
 wYpZNj34h81+Oy98907/SO68cl9emIKcNt2+6EjTbHU3n8ouAbazQe9Q8FlPkzTuT2w3
 rVuQ==
X-Gm-Message-State: AOAM5300gn+Pc4mfhpTNH1wnXyoPd2N2zyMGqRWNs+QT2CQLwwcJIos/
 nnJPLNveMwGy4QsjdTCjzvSlFg==
X-Google-Smtp-Source: ABdhPJz4K0kLaWeuPBop0IAkjqejJVnYvx1By/KhxM6pBUYlU2Hn4uST4po7Bl+o5xWrlrVSPgRe1g==
X-Received: by 2002:a17:906:98d4:: with SMTP id
 zd20mr1710918ejb.532.1607514460504; 
 Wed, 09 Dec 2020 03:47:40 -0800 (PST)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id k23sm1244877ejs.100.2020.12.09.03.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 03:47:39 -0800 (PST)
From: Fabien Parent <fparent@baylibre.com>
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: dma: mtk-apdma: add bindings for MT8516
 SOC
Date: Wed,  9 Dec 2020 12:47:35 +0100
Message-Id: <20201209114736.70625-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_064741_824478_212E6D79 
X-CRM114-Status: GOOD (  10.49  )
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 linux-mediatek@lists.infradead.org, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add bindings to APDMA for MT8516 SoC. MT8516 is compatible with MT6577.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---

V3: remove unicode symbol that slips into patch summary
V2: no change

 Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt b/Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt
index 2117db0ce4f2..fef9c1eeb264 100644
--- a/Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt
+++ b/Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt
@@ -4,6 +4,7 @@ Required properties:
 - compatible should contain:
   * "mediatek,mt2712-uart-dma" for MT2712 compatible APDMA
   * "mediatek,mt6577-uart-dma" for MT6577 and all of the above
+  * "mediatek,mt8516-uart-dma", "mediatek,mt6577" for MT8516 SoC
 
 - reg: The base address of the APDMA register bank.
 
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
