Return-Path: <SRS0=weZ6=CE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F466C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 10:49:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D73C206EB
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 10:49:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e+BSZofz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LllienEV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D73C206EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jDEZROQBeuCGkFGyNAJYQp3HBFeSPALNi4tQsRYf7z0=; b=e+BSZofzv2LBdNZntxIYx5LBvj
	cwt/j5FKBGdi9MfGsuHW1an8A0mQGkx1wbvvlMV70sCvKs4KfjQFbI9se4MXZW4DnE9Kkb2H9MSNx
	lJEWscftU2GILphNwUIQ9Syl7rmvkTR0W6KQxIRNyoFUfwY1X1edJ2YcURV6I5T5jYcqxvOI6zbWN
	qReCjMjsbdCYFPaDGJ8/BqeUrQJteUIetbYcjTvi9fGKqiJw29VBhnrQrogqTD0VMOgdkxpyzDmfF
	LVoFeovdwGRQasErctkCvVMupBuBB9suZtTisKV4A1DzXi3y0CX5k1qF17L9axp2sc1D3LIGOpzh4
	UoGvP6TA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAszu-0008GU-Kn; Wed, 26 Aug 2020 10:49:42 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAszp-0008En-Pv; Wed, 26 Aug 2020 10:49:38 +0000
Received: by mail-pg1-x544.google.com with SMTP id v15so840939pgh.6;
 Wed, 26 Aug 2020 03:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ZdoBCKVRuvYYbqZgZKgMCJZ6Rhom1CCtkDlusoa4B08=;
 b=LllienEVsS0/YjEfXtvj5rzxdou1vCQqakXHq/OJq1M43/7W6Tuce2RiG3zpoyoenK
 xvZU1CKhfVuAvYMO1FUfFmxq/9zXDnkRUSsMVUEkO9k57kIvlvQM4a+za/PYjNyyNt84
 DvS4G2CHiG57/KJqI1BiaW0cUZ/LizVqlduxg8n36+2sxP7B0lN/dhN/RE74bWwscmMx
 ZyeiqtzgqcuIWazjMhtO3y4fmjHYkdQ+QEipKr/Tx6BFfJswaLNhq8DkEuRooKGcrj0Q
 5v7Ifi+xwuIIW9thT/QhR8ozQwp8yLuUODd1+Zhf7TLOXwklQD3NnsTEr5+dR3JpX43Z
 3uDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ZdoBCKVRuvYYbqZgZKgMCJZ6Rhom1CCtkDlusoa4B08=;
 b=eXOz46OJeUePqP5iZYviK3ZiVHDawpS9LV99wdz3fTWJukQRuQQc2mdxlI4OBS6H8y
 GFnB8J95H434N5rOK44udauzS+dWAKrbBHTgN/JnNdP09IYtAldSOMIPL5DGiCw1ckn2
 BnjgRtUaXambWQm/7+pKcC+2Ex5D4slA7kGLRZmkhf17k3nrSKVch2zQIZIxMbluhyJR
 /+SmzSk8M4ahMPM+fJVk5sYrpKjDIgd0eIinMp0mfXYjr4uTKC9h8D8wSFGF05f0xhha
 vbV0/SwZ07ZaLUASBS7axixNjMiL7zrHQQ1A/bOXMXrVG9gEMLqyaCitJkDy1c4k9SC9
 qJwQ==
X-Gm-Message-State: AOAM532In3N9/o2K73lOVKpCmvGWP98TIKxkJ8qRN7DNDNeG7owwBAh1
 LW++ItoItiDIGh/JWGo2rrf0NBag+Q/AmA==
X-Google-Smtp-Source: ABdhPJxwc1Phv6qBxJ2Uh381P86SiHzLD+oSSBz+RODYM2sy8PuJJw64PLZ/dXz5PJcQKd5fcw1f8A==
X-Received: by 2002:a63:c30e:: with SMTP id c14mr9908486pgd.225.1598438974128; 
 Wed, 26 Aug 2020 03:49:34 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:56a:2197:d2eb:7e49:dfa1:a882])
 by smtp.gmail.com with ESMTPSA id d127sm2540349pfc.175.2020.08.26.03.49.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Aug 2020 03:49:33 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: matthias.bgg@gmail.com,
	robh+dt@kernel.org
Subject: [PATCH v4 0/2] regulator: mt6360: Add support for MT6360 regulator
Date: Wed, 26 Aug 2020 18:49:16 +0800
Message-Id: <1598438958-26802-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_064937_901946_BFEEAB74 
X-CRM114-Status: UNSURE (   9.46  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, Wilma.Wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch series add MT6360 regulator support contains driver and binding document

Gene Chen (2)
  regulator: mt6360: Add support for MT6360 regulator
  dt-bindings: regulator: mt6360: Add DT binding

 Documentation/devicetree/bindings/regulator/mt6360-regulator.yaml |  113 ++
 drivers/regulator/Kconfig                                         |    9 
 drivers/regulator/Makefile                                        |    1 
 drivers/regulator/mt6360-regulator.c                              |  459 ++++++++++
 include/dt-bindings/regulator/mediatek,mt6360-regulator.h         |   16 
 5 files changed, 598 insertions(+)

changelogs between v1 & v2
 - regulator: merge regmap to mfd driver for r/w with crc

changelogs between v2 & v3
 - Move regmap define to MFD parent driver
 - Add bindings document

changelogs between v3 & v4
 - replace of_node binding table by platform_id_table
 - set regulator_desc.regulators_node find dt


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
