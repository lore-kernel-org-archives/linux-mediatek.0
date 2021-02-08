Return-Path: <SRS0=Odcq=HK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE40C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 06:10:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0142C64E28
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 06:10:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0142C64E28
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N7IQyVF6KTzlnU2DmEmYZLOuc0JbIkYIp/kGcriVPMk=; b=HnBlnna7E3+WFnYDwlq+1eUcmM
	OJCQ77A9VTYOB9NguUyvhlz/G60WTKfL8dQ0wUsZxmDD4jc+4xVlQHuMp1TbvTzNv5JvROP0D/juA
	OvuSjg4TEWBFhXvNI8bGLtnVaEhD2IOdesq0DssT1GwR1jZFz8ffaD6qEwHDeRssW86mL/8mweSbB
	YgGSAsCBR5vrar+WVoLTpIGtO9II1bhjdYMIo7e/AkkYtfCh52ZXs5nVoQNIxOhvJ988auazCJCWe
	Nb+A6DAS9wJWbBovpU+bme5vB+eG/dK7KaT7E55QHIEXQ8LDCS40lkCc3GQqXfHsCLvPFOe2u8K22
	NwV0BgiQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8zkv-0004zE-DF; Mon, 08 Feb 2021 06:10:41 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8zks-0004yJ-RA
 for linux-mediatek@lists.infradead.org; Mon, 08 Feb 2021 06:10:39 +0000
Received: by mail-wr1-x42e.google.com with SMTP id a1so15718970wrq.6
 for <linux-mediatek@lists.infradead.org>; Sun, 07 Feb 2021 22:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=IzgnsVIfQ7MUr3Ild4g6lH/jjkDlQ+c5fZz2xq4Qd0M=;
 b=IFdCDqIq3K4sR7qI23+MXf/nE+MnBNzqSkyVuO4r4wN26UzDYoL07WtEvfssn0BIfo
 Mk0lfYh/dKCl/TQo/5T9QAg0rxjsFnThCnuZpRG4BRV3L6wILC9S3y+JgjP8EbL1rOv7
 pHk+NMNjFXwQK3hZzrBvcrIyM0I3vXL9eAy6rM+QacznPveyuyT80126LftBl54p4lMM
 Xh7+4g6zXfld33SAq50bSzurmCwoFo32eEGeUVboYb7FitTrO4AggnL8DEneRmGtdWTn
 HD4dmKhx9vAZcOmoS83LegWJk1KKQIO8YtWx9x28T1A+vcsazdKE3WBXOFII+cIuFard
 NIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=IzgnsVIfQ7MUr3Ild4g6lH/jjkDlQ+c5fZz2xq4Qd0M=;
 b=i48jG/1aCoPz9OeaHUCBOWtnQwwuhCnhey08ozekpfTCpAKURW3pfSW8uhK+ilsxSC
 GJrdRCtYVbZjMBtklYKxTEZ/X4fEVUJfd9cd0WOoy5cBii+LWRlYpeFodtDr+DRmolu9
 29MjOzfOqWV5biEePo5LxBBIbKxspgrZNhtffN54cgl3V6A7s3T99RtU0oGSoHvPhZ+b
 R3c3GWHNzHdE6edSdgp1u5WVCQVSpL5PQKLKYROzv++tIPQmWoEhafaBmTzDlxaJRlH3
 AVJzAz+umN/SBq9c10ViizW/Lk2nhoSQ/LawzMT/19a/ldELD1Z0nZu0EMgjhGMas/VP
 Zjcw==
X-Gm-Message-State: AOAM530tgV+ErE839F4jutyYk/ufYqZKITfXMiTmzNZMc/jPM3Wgpbep
 sNyzetwbK2AAMOv+/50EbWk=
X-Google-Smtp-Source: ABdhPJwAklcz2IhxWhplULsILsyJcC1/7jVHUHOswyE9u52R6xwuOO+plQjS+Yqkm/ETdvCcMKtJXA==
X-Received: by 2002:a5d:414c:: with SMTP id c12mr18487516wrq.251.1612764636586; 
 Sun, 07 Feb 2021 22:10:36 -0800 (PST)
Received: from felia.fritz.box ([2001:16b8:2d8e:7300:842e:a74a:35f3:bd06])
 by smtp.gmail.com with ESMTPSA id m2sm18466356wml.34.2021.02.07.22.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 22:10:35 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Yong Wu <yong.wu@mediatek.com>, linux-mediatek@lists.infradead.org,
 iommu@lists.linux-foundation.org, Will Deacon <will@kernel.org>
Subject: [PATCH] MAINTAINERS: repair file pattern in MEDIATEK IOMMU DRIVER
Date: Mon,  8 Feb 2021 07:10:25 +0100
Message-Id: <20210208061025.29198-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_011039_004656_AED5277A 
X-CRM114-Status: GOOD (  10.73  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Tomasz Figa <tfiga@chromium.org>, Joe Perches <joe@perches.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Pia Eichinger <pia.eichinger@st.oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Commit 6af4873852c4 ("MAINTAINERS: Add entry for MediaTek IOMMU") mentions
the pattern 'drivers/iommu/mtk-iommu*', but the files are actually named
with an underscore, not with a hyphen.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:

  warning: no file matches  F:    drivers/iommu/mtk-iommu*

Repair this minor typo in the file pattern.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on next-20210205

Yong, please ack.
Will, please pick this minor fixup for your iommu-next tree.

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 674f42375acf..6b507e8d7828 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11200,7 +11200,7 @@ L:	iommu@lists.linux-foundation.org
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
 F:	Documentation/devicetree/bindings/iommu/mediatek*
-F:	drivers/iommu/mtk-iommu*
+F:	drivers/iommu/mtk_iommu*
 F:	include/dt-bindings/memory/mt*-port.h
 
 MEDIATEK JPEG DRIVER
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
