Return-Path: <SRS0=lxeM=EJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 258C6C388F2
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 06:08:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C39F522277
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 06:08:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zlaWMfj3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ORxsZIWa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C39F522277
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O1GWVArbDPDyKwSn4hyQFQ7iNfJd+wYwDmG+LWs44O4=; b=zlaWMfj3NqxMHBmRHjGQ2ooevy
	7fD+kiZ2ZtwrrJDcWRBva6+BWDUCxuuddSVueUG5ucXRKR0YaP5XaaLBPgkJlW0qD9HupFlxsN/IL
	zu/I2cUf0Gkeyb6T/q8uNnZHqtpl17gyROsNe3rNGs9LFykRUea5GybIsgbVYN8ViOJVwx/k9dQJo
	a83uUjDewRWhCKVMqjoiODMC8pPFLktZqGWKNB0z6CIUvycqixiWXNtk6rg5cHotuJaVkatxS5oEe
	DIONwRUK9KsGbBruiPRJyVhC6QfZ2uYEap/UtXvr6HagLVgjVWLClGut77Ax6c/g+TJYjrrjN+vgA
	FtYmHpeQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZpU2-0002zW-RK; Tue, 03 Nov 2020 06:07:54 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZpTy-0002yL-Lj; Tue, 03 Nov 2020 06:07:51 +0000
Received: by mail-ej1-x643.google.com with SMTP id o21so15425905ejb.3;
 Mon, 02 Nov 2020 22:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=wZzzP42oR1wFOjbR/obXzKPXtaESFvyqabAu+OtZP9c=;
 b=ORxsZIWa28SAoCoDem+FxE1zCcXRCU998CQABTj9MmvAD58e8Cgp4vIzXDwLq5de9l
 RXAnRYLQVMN0d5oazb7ocAE/O09/Jbyh/XTmc6vWh6NOVd/FltYTX4AxRCRsMzn57uod
 7B2EQWbuJ96bf3m1DVAG//kKVrBnzGq0141czX3ZZ58IlU0CkOc9Fz06WILLHkfjJP+3
 +WSy2fzWnT8ynnPOc55vw7rHl1NEnvY/5o8ZWaZKKvjEx0l08ID0Gb33ane01c9Bnhs+
 iEguvoYIvjz+ft/GPM0SZbLLY/P9TRKZTNzR9z3mBzI6sSefEFtS/YVnMSNbwcktRSvK
 FYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=wZzzP42oR1wFOjbR/obXzKPXtaESFvyqabAu+OtZP9c=;
 b=GgC6rRKOUXKZKXtG4mIA054sgIZAtS1bBULzRJozRPmkrfsaN6T/+uYip+0J+S23d2
 ssIQ5qsexy+UIT2AGpEdqrDY5AL6/1ENw7xpgUW6QyY04ELBM6iE5eywFvU6WV4AZTF/
 QC99W+uzsh7i9FX2cWqVtoIYU+74icohEX1cIdGdgVO34IfcHSb6I6EBL8DqkLE5DaJZ
 EDMEaLEOjwgyvBdDcbQUTvBD9eq2gQ9jHbkWv9ufVThc0/ZXwxvMmaOWbPDDf7prPbIJ
 bAG8E75hEz4D1pHcW1VQmw/ePrJ79wNHeEK/2OWUF0nKpQD8Nc7nTi5Yosy5X9rJBQQc
 L5fQ==
X-Gm-Message-State: AOAM530tDaH3xUC9tFRYHPraer3bebnXhws2rnESLk8UOT/E1uDkkvDG
 PBsqyqfD60wPCPD5Xa4ewJA=
X-Google-Smtp-Source: ABdhPJzOiWqr2Yv/cL1jcFKDWfQYoYaT/YVgEF+7QuQOl8M7DHQFeGynUF+PNxlme7kY2EB7BuXQ0g==
X-Received: by 2002:a17:906:f296:: with SMTP id
 gu22mr13176896ejb.475.1604383668551; 
 Mon, 02 Nov 2020 22:07:48 -0800 (PST)
Received: from felia.fritz.box ([2001:16b8:2dfb:4300:898f:a1f0:a069:8253])
 by smtp.gmail.com with ESMTPSA id f16sm4491478edw.15.2020.11.02.22.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 22:07:47 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] MAINTAINERS: assign mediatek headers to Mediatek SoC support
Date: Tue,  3 Nov 2020 07:07:33 +0100
Message-Id: <20201103060733.25729-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_010750_758353_6EEFC177 
X-CRM114-Status: GOOD (  12.43  )
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
Cc: kernel-janitors@vger.kernel.org,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, linux-kernel@vger.kernel.org,
 Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Pia Eichinger <pia.eichinger@st.oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

./include/soc/mediatek/smi.h and ./include/linux/soc/mediatek/infracfg.h
are currently not assigned to a specific section in MAINTAINERS.

./include/soc/mediatek/smi.h is the header file for definitions in
./drivers/memory/mtk-smi.c, which is assigned to the section ARM/Mediatek
SoC support in MAINTAINERS.

./include/linux/soc/mediatek/infracfg.h is the header file for definitions
in ./drivers/soc/mediatek/mtk-infracfg.c, which is assigned to the section
ARM/Mediatek SoC support in MAINTAINERS.

Hence, assign those header files to ARM/Mediatek SoC support as well.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Matthias, please pick this minor non-urgent cleanup patch.

This patch is part of an initial experiment to assign all files to
specific sections in MAINTAINERS. At the moment, about 3200 files are
currently not assigned to specific sections and maintainers.

If you think these cleanup patch cause more churn than value, please let
me know. Thanks.

 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b4197e9da495..1703c7d2e146 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2066,6 +2066,8 @@ F:	arch/arm/boot/dts/mt8*
 F:	arch/arm/mach-mediatek/
 F:	arch/arm64/boot/dts/mediatek/
 F:	drivers/soc/mediatek/
+F:	include/linux/soc/mediatek/infracfg.h
+F:	include/soc/mediatek/smi.h
 N:	mtk
 N:	mt[678]
 K:	mediatek
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
