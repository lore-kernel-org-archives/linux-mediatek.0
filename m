Return-Path: <SRS0=DDi+=L7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A3F1C07E95
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 07:34:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0C2761CAA
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 07:34:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0C2761CAA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rGEO5xD5itAgoBZTezk4LqIz+W6dMNIBVKh5TqkzZ7Y=; b=J/0Nxs2d0oDLnZ
	TsCm2SQcqsD2Q37/WlxnZZjg2+VK2jX7pRVKOG1Oe2+qCcnTAY667HUaEYjzC5iVvJwnTLlNjSz84
	sWd+0rdPiS/SDY1uur/q4Ii6eotTDFDxDbQv3008sQ5/swldKsayScIxdriF0pO45+4W2jlf4QA//
	rSUUKVo1x62l793N9i/lsgeqwesHEMbTz20bTd0AnyI6SoBVUCCWIpCHfAnJBK3DTGHAART1/Os++
	RjY+qxEDGbGPsaKaGNpr74G9zhSIfcVRcYXGGYUZz6uJX9dqnEfTZLuCGAIL8dtbAOmubyRpifemL
	MyMdhEbgqjjKPFobasOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m124z-00DqV4-JL; Wed, 07 Jul 2021 07:34:45 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m124m-00DqS7-Vb
 for linux-mediatek@lists.infradead.org; Wed, 07 Jul 2021 07:34:35 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 b14-20020a17090a7aceb029017261c7d206so3145024pjl.5
 for <linux-mediatek@lists.infradead.org>; Wed, 07 Jul 2021 00:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OJlTGwQarQCwpYvNcauR++9WrrW2NSvtHc/ue7RodJg=;
 b=AuazIt6wRB7ZeBAjhK9ytxJTkucjF6k5BsVeoltdwkePA7cS/fKxHnORZSh77uRfoS
 RgvulmIxxv889zhp87tFqJBjuxeVPZJ18OHG6HJoMlygPw7p00n6oQWrzWneR/2SNMez
 9Lu/mVfByWJ4LmChRXj+IIwAOjqqeAWemaTUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OJlTGwQarQCwpYvNcauR++9WrrW2NSvtHc/ue7RodJg=;
 b=pw8I/immzI4KGxH83Br9bKS8gk/EqhBDxTZGT4K6+X12k5GzpSZcH6ovBN/69QgMYV
 gnUriRqh9EbrgRonMPGuwNRYmfMXbcKH3q97zacJf1XLyGkQabpnuITD250D8PhSPy1S
 oaHRGrtxvClXW0odJBROiGfqLMfKc+R4cdcsX8+cZ/m7Jf0ksdeXyTAoqaHeApZdX/QV
 rUQHFDRsS3oItICM5A82M+TTgAeKexEo3GVBBgGlCKbnm5Yrk6esJ37ndmarccIwJ1zP
 iJ4xDdeM6k67Vt1DYxIVIDuNJdzP+r1iYJl4mr+hJYnhkxl8sYhha4JZk5YX0KrJ0rwq
 6PqA==
X-Gm-Message-State: AOAM5308LR5lBbcAL0otrFLwUdsUzAtIcnjhXd3UwuSmicfJXOoNDmgp
 OFMG7/XzWM8DabZ73MPv27MQLw==
X-Google-Smtp-Source: ABdhPJwbaSWuRfpIWfTMNQ/mnZEWXookdqAFX4f4ckRHmLTlGK82ywmPRaOOcJSazu0oxBqgsxhN3w==
X-Received: by 2002:a17:90a:b28a:: with SMTP id
 c10mr4537829pjr.59.1625643271395; 
 Wed, 07 Jul 2021 00:34:31 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:ccb9:d95f:4dac:dbc4])
 by smtp.gmail.com with UTF8SMTPSA id f4sm21323341pgm.20.2021.07.07.00.34.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 00:34:31 -0700 (PDT)
From: Eizan Miyamoto <eizan@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: houlong.wei@mediatek.com, enric.balletbo@collabora.com, wenst@chromium.org,
 yong.wu@mediatek.com, chunkuang.hu@kernel.org,
 Eizan Miyamoto <eizan@chromium.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v4 0/8] Refactor MTK MDP driver into core/components
Date: Wed,  7 Jul 2021 17:34:02 +1000
Message-Id: <20210707073410.999625-1-eizan@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210707_003433_047788_19B7E24A 
X-CRM114-Status: GOOD (  13.33  )
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


This is an update to
https://patchwork.kernel.org/project/linux-mediatek/list/?series=283075
To address some comments and fixes.

This series has been verified to work on 5.13.

Changes in v4:
- rebase and test on 5.13
- don't depend on https://patchwork.kernel.org/project/linux-mediatek/list/?series=464873

Changes in v3:
- get mdp master from aliases instead of strcmp against of_node->name

Changes in v2:
- rebased onto Linux 5.12
- 100 char line length allowance was utilized in a few places
- Removal of a redundant dev_err() print at the end of
  mtk_mdp_comp_init()
- Instead of printing errors and ignoring them, I've added a patch to
  correctly propagate them.
- Use of C style comments.
- Three additional patches were added to eliminate dependency on the
  mediatek,vpu property inside the mdp_rdma0 device node.

Eizan Miyamoto (8):
  mtk-mdp: add driver to probe mdp components
  mtk-mdp: use pm_runtime in MDP component driver
  media: mtk-mdp: don't pm_run_time_get/put for master comp in clock_on
  mtk-mdp: soc: mediatek: register mdp from mmsys
  media: mtk-mdp: search for vpu node instead of linking it to a
    property
  media: mtk-mdp: propagate errors better in pm_suspend/resume
  media: mtk-mdp: use mdp-rdma0 alias to point to MDP master
  dts: mtk-mdp: remove mediatek,vpu property from primary MDP device

 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |   1 -
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 258 ++++++++++++++--
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  34 +--
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 281 ++++++++++++------
 drivers/media/platform/mtk-mdp/mtk_mdp_core.h |   3 +
 drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c  |   4 +-
 drivers/soc/mediatek/mtk-mmsys.c              |  20 +-
 7 files changed, 466 insertions(+), 135 deletions(-)

-- 
2.32.0.93.g670b81a890-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
