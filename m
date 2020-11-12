Return-Path: <SRS0=Fc+n=ES=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCEB4C55ABD
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 10:40:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42EC422201
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 10:40:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UaVbEVZY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L/lRn3vS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42EC422201
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=utyqnFq9RKksEuzfkX5Djincp5Gf6oJNdipsAJR+keI=; b=UaVbEVZYVxrmBtFdrcJzQtuYcT
	kq+bL1PCPB1dQbE4uHKa6YfsSaqvYqbeFmWyXenIVWyjRho372pByQ4ZZiu0LbOp1VsG6UlPrFTJK
	744XrX73KHPpBDiqsQfuKficmZr4iNp6/tf4eBI98j4fgQMzP6SEEHzOTQc5n9YYM3o9Y0y/c+eNV
	5ClusFSoRZjNBmgQ+1R9YCvIjNXjN64FptvBAXFmFFnTlEvXOOiMXW0OdDGe6cLip4FHmKkpxSTj7
	kpPvH9s2IhOrG6abl88FE8+Y00bqopmDf2LKuznzwy8VoMIFMDO/vOFWaIdtlmVrmc5F6J0NzTe6e
	iJyhRkCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdA1Y-0004Rz-Ol; Thu, 12 Nov 2020 10:40:16 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdA1Q-0004P1-Qc; Thu, 12 Nov 2020 10:40:09 +0000
Received: by mail-pl1-x642.google.com with SMTP id u2so2568188pls.10;
 Thu, 12 Nov 2020 02:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=A1kCd9kxhtGVEoKnBufAkxHSe9byym5wk2cdTksfgzQ=;
 b=L/lRn3vST0A4TsCZYBx4L94+MANXkREvNi7cTkcKw8nwivywBn0AEUBpwGya/5ADOT
 PgiTCFJDdr0KiuFAKuGMQIeHXRMf+g8LIvaO/IyEvlPjDJr9TTbzJvBOu9lw6st/W+LO
 qZlbIvOl8+EbPlXcrIeF2iZZm4jc+ElNufRAX/H1Pf6MQOO9YS59RQyimPoGkvL815Kp
 J7hbXrbfcqsPfR94DVUUo+glMvdnygKyxx4wSNktxs4fmTU7jxo/McAT8jiK9Pid+S1l
 sCvam8jL8FWqcvTHzuFTGidZ/55u2VdTEtWtoT0PkCLWWcQb/fVdl0+OmeQ2nE6Dhg4r
 kM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=A1kCd9kxhtGVEoKnBufAkxHSe9byym5wk2cdTksfgzQ=;
 b=fbWxlm40uAMlj1dRgquVDafaDAq/uWCzlHx2H1+TLSzCULByf0GXqKEuR3NMvBZrCh
 bLpZUcJ55z9lC19gsxqHmvl0eFffBZs8NfKmHbziiHTfleFhT7a7usbE9yklFHWzRfHx
 tAzxtcDWIu2JZSljkgO7825kDjXvfu9S9ZmzAoE7FSMEoCI2Y1+tuuwLywVyksUYkGNI
 T3OJrBnT5ThlClRBixCV7vkfr7sAcBLXIQnhBH1s3AdVJ/pru0Cwrm6Kq6y99HGolVIJ
 q1zZyGwu/debdvpCRdzW9AdeQ5VkkvWfPR1WOu/9CQ4oQsBhL9cp1s5OLqyIyA3DwwOs
 I+qQ==
X-Gm-Message-State: AOAM5333U/Q6nyoGyhgGbsbXJBDjgW+3ykbmT/1QZnM5bjDJV18UhU51
 5oD2jrc0rPyb8B232QMiOK8=
X-Google-Smtp-Source: ABdhPJznNX8YVTi2I1uQjTgJCiLAWfcJFHeM4bA36FXxplxx7vsm7XgOnX7IIfTnOOeMxg+0bP7zCQ==
X-Received: by 2002:a17:902:eaca:b029:d6:807e:95b8 with SMTP id
 p10-20020a170902eacab02900d6807e95b8mr23007860pld.33.1605177605556; 
 Thu, 12 Nov 2020 02:40:05 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:47a:a27:cf8e:7817:51df:a883])
 by smtp.gmail.com with ESMTPSA id
 mp16sm6414094pjb.13.2020.11.12.02.40.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Nov 2020 02:40:05 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: sre@kernel.org,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org
Subject: [PATCH v7 0/11] mfd: mt6360: Merge different sub-devices I2C
 read/write
Date: Thu, 12 Nov 2020 18:39:47 +0800
Message-Id: <1605177598-23501-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_054008_907909_9BF60A4C 
X-CRM114-Status: UNSURE (   9.58  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, Wilma.Wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch series merge different sub-device I2C read/write into one Regmap and
fix coding style for well-organized.

Gene Chen (11)
  mfd: mt6360: Rearrange include file
  mfd: mt6360: Remove redundant brackets around raw numbers
  mfd: mt6360: Indicate sub-dev compatible name by using
  mfd: mt6360: Combine mt6360 pmic/ldo resources into mt6360
  mfd: mt6360: Rename mt6360_pmu_data by mt6360_ddata
  mfd: mt6360: Rename mt6360_pmu by mt6360
  mfd: mt6360: Remove handle_post_irq callback function
  mfd: mt6360: Fix flow which is used to check ic exist
  mfd: mt6360: Merge header file into driver and remove unuse register define
  mfd: mt6360: Merge different sub-devices I2C read/write
  mfd: mt6360: Remove MT6360 regulator of_compatible

 b/drivers/mfd/Kconfig       |    1 
 b/drivers/mfd/mt6360-core.c |  554 +++++++++++++++++++++++++++++---------------
 include/linux/mfd/mt6360.h  |  240 -------------------
 3 files changed, 376 insertions(+), 419 deletions(-)

changelogs between v2 & v3
- Replace mt6360_data to mt6360_ddata
- Split I2C read/write to regmap driver

changelogs between v3 & v4
- Merge back mt6360 regmap driver to MFD driver

changelogs between v4 & v5
- use devm_regmap_init
- define crc calculation magic number

changelogs between v5 & v6
- Remove unrelated change
- Remove regulator device of_compatible

changelogs between v6 & v7
- Replace OF_MFD_CELL by MFD_CELL_RES


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
