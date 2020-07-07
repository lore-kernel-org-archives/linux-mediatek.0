Return-Path: <SRS0=cZv3=AS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03897C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 10:31:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9B3A20702
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 10:31:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iNeWiMUv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DYVMc/rv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9B3A20702
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PLbA/QCSOdeMgotviWox1gXeI7+nJmmhMiSnWpTASA0=; b=iNeWiMUv0IZJs665BkgEAAt8ZS
	92YEzvZXtGZ4AJbx70TuwKOxe8RheCgUvfDY7gVir38fLZiOg17gpG5LG7AuqYGG4t6sryfMK8xmR
	/IT5pW/AssqRpPxd9B5kEKTqYy1eVAkn6nIZACk0OHyB9Gx2FmlG/oUb2+NGcimlpBlkMFIlZwXCS
	i8zAG/TPOuUpEM/623MaoI4nhonZMn7o03Xv0gO9uFIc76wywETkWNPYbPXk2GmD8v2z7qzbn70vY
	Z23uu7dEErQ7O0Jg1sYvqg3Pcq2T+kGZ84/80ldwHGVSVI31nelS5667um1rk63m8LNbfm4BW0/7Q
	xceqaAaA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsksc-0003A4-Ua; Tue, 07 Jul 2020 10:31:14 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsksX-00037z-Ie; Tue, 07 Jul 2020 10:31:10 +0000
Received: by mail-pl1-x644.google.com with SMTP id x9so2924289plr.2;
 Tue, 07 Jul 2020 03:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=zxuPhyQPrCkY8RwKHf/iDbaI7cQGRWG/m4jeg+A9cWM=;
 b=DYVMc/rvsWjerLh9VJFN6BzYe22rkBMpf7ZdmAztCeUNLETBwUYxFzGO6xCpkvxrOa
 O8OhThpyu/Ir/ldtsTqi0kyc++7tgODibrHl1wxW2WEnNcSoCUzw1Tx5FhmF/0poNuYt
 62D/iekrlWzhHQmWKzE57RYSjQ5fvidbYlIxuP5wwDP+z7m0DSUfS+hzVcT46CKUeJaA
 SwkxUreVzJAJpd7OqbQt4g+GKCkRHk+YzVTR9IG4n8TXOlzhD5fIggL5j9f25SyLOSkJ
 kHtpPgJha1ykSnOka38RSIXpp6pDbO81goPYQkpOo6D1rXt4Yf8UJq+2xCvLUpW3StFp
 kcHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=zxuPhyQPrCkY8RwKHf/iDbaI7cQGRWG/m4jeg+A9cWM=;
 b=Sj1Ykjx/j2WJm6zlBl0YXV7QTG/+Xb3YFk3RGvPejuhSlpoxsTwEJ1czrGwxWwD8Ea
 GhSN0OBhkVEleoH4KPXPZmbkQHUpPIFRhnC0KputSgAVw4sl3nm+IeBT93pO/f9QPlVt
 m1YcRYblaV8GNWcNXNTqwr4WtvLG9fozKqFLsEJQh97rggQPbXqDEF30NhQcLWoTLudk
 t4op2pIHdQJ3sGaWXBliLH1//rfv++BWHMoAMFz32lzjNcz/1iPrJHp5JvVnwWA6rQnW
 bvCGw3c+WO95C+ll75LZc/JicIrxt7nMgn7KSHanPC7RrVy/Ui+JLu/k2F8KIGOFhtxY
 616A==
X-Gm-Message-State: AOAM533Vvm/DdLn+xanLkcJLnLiASbevaLmCZsKHb6Kz9PROSVkxntgI
 sMneGFcYo34vyMht7DZG79k=
X-Google-Smtp-Source: ABdhPJzv/iLusFv6xB1Tt1gxb/Ilgghzb4kN3WHzskvQ60oL02q24bqSXYCsHoneyioFcIeX4VyMug==
X-Received: by 2002:a17:90a:c290:: with SMTP id
 f16mr3676405pjt.143.1594117865675; 
 Tue, 07 Jul 2020 03:31:05 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:549:1a30:cc80:8285:be58:d37a])
 by smtp.gmail.com with ESMTPSA id io3sm2159014pjb.22.2020.07.07.03.31.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Jul 2020 03:31:05 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: lee.jones@linaro.org,
	matthias.bgg@gmail.com
Subject: [PATCH 0/4] mfd: mt6360: Merge different sub-devices i2c read/write
Date: Tue,  7 Jul 2020 18:30:52 +0800
Message-Id: <1594117856-14343-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_063109_624191_F8F567B3 
X-CRM114-Status: UNSURE (   6.41  )
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
Cc: gene_chen@richtek.com, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In-Reply-To: 

Gene Chen (4)
  mfd: mt6360: Refactor and fix code style
  mfd: mt6360: Remove handle_post_irq callback function
  mfd: mt6360: Fix flow which is used to check ic exist
  mfd: mt6360: Merge different sub-devices i2c read/write

 b/drivers/mfd/Kconfig       |    1 
 b/drivers/mfd/mt6360-core.c |  541 ++++++++++++++++++++++++++++----------------
 include/linux/mfd/mt6360.h  |  240 -------------------
 3 files changed, 357 insertions(+), 425 deletions(-)


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
