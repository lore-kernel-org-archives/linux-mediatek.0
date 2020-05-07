Return-Path: <SRS0=F/ID=6V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC0B2C38A24
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 10:24:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EE7F2075E
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 10:24:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AspHO5cG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="msVYVtXb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EE7F2075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3Kg+98ZFDNQ6kwTQ+G55TikAvIcrV57zDgazPiADQoI=; b=AspHO5cGpNYiyv
	m/01RrVb01ytg0bc+Uedj9d+WMWLf7IULbyax0Zt7OcQ5I/r6BBkcVk7TgcFLtXn+uo2VFUaUXwSF
	7SQ4jhqizRjQIDb479H2aTCU/5ZNN4JyARJRV6MmBV3dYWOeuTbfkrlLQfVW3PyhZ2+PhA8t1NgF9
	UkmYSxGLG67umfpbR/ifo4sLLjLy/NXTx+72hWG6V/LZ38qCAFAueD7SkgWKY7x53USTyWl14Z7/K
	Lk2icMB8IvR/BuPcD+hu5oi9I7a4yLylddfloqodYBN46SLkdKXI7m740YSIqOEQN1UHJ1yIlNTfx
	cwwpwxGog5NxXD1JjEFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWdhN-0007Yo-36; Thu, 07 May 2020 10:24:13 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWdhC-0007Pl-Tz
 for linux-mediatek@lists.infradead.org; Thu, 07 May 2020 10:24:04 +0000
Received: by mail-pg1-x542.google.com with SMTP id l12so2320833pgr.10
 for <linux-mediatek@lists.infradead.org>; Thu, 07 May 2020 03:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U3adop0qZHoN5+fe1H4HdGFUSAzpEKX4OuXet5VsNhk=;
 b=msVYVtXbC1rDLmlHB0A5OMuw6LsY6yof/OQbghdzmC8mQ+pR4tv1wSmxhZk/KvRE6d
 c2GPXGyyr1qqebFYtA8Q9gy95GufDlZuB0bUHy13z9lIMGTV1RCYE9kvrFNSLQZP99E9
 z190vOnTwXc6wcneboX0FzxIOCQ6KX/9YAl6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U3adop0qZHoN5+fe1H4HdGFUSAzpEKX4OuXet5VsNhk=;
 b=Jnmj0zVMUhMOIskVONOwiEF+sC99G+4bgslJCKYUZJVu24Yl6JRV+TPWgKsQBPS+ky
 up5zh8uFxlZvcuDpuHcLYiRK4S9HRPyGciOowDTW/Hd0db+A/KH2Kid7im4TL8VltCOu
 V0c+F5O6uoGxojgeWeK5ItfjDwwpFCRFc8AxpJnMGvRo706M5mBFMCcK7xYw9omlwquT
 YFvZlw3Rp2mlUmjzD1IZxrTEPLbz7WncE+ZUjvOEHxtOFrXBwcqjrSMEBC8ERDaC8Ie/
 EP9iW/m96w+wlIff8PZy/Vj0mw6ajl6cduk//OgnTm/DFPhPBEz/HtzQlRvEvAR69Kif
 X8iQ==
X-Gm-Message-State: AGi0PubKMXCWr3Zz9k4BnlaDLdwwrpv5MNLEGqXwGHpGcdwC1kSj0XJf
 Aibe1QH2cnaUPPagN52FjD+GLA==
X-Google-Smtp-Source: APiQypIJANgSss8r4jrDFwpt2FRxJF0v5BBqD8mhWuxiK45XDvceGeJ0E8SQWciZ2KIF8EhjAyoH+Q==
X-Received: by 2002:a63:f54d:: with SMTP id e13mr11526261pgk.325.1588847041657; 
 Thu, 07 May 2020 03:24:01 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:a92f:c47d:76a8:b09e])
 by smtp.gmail.com with ESMTPSA id m7sm4639156pfb.48.2020.05.07.03.23.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2020 03:24:01 -0700 (PDT)
From: Eizan Miyamoto <eizan@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/5] MTK MDP driver cleanups to prep for futher work
Date: Thu,  7 May 2020 20:23:40 +1000
Message-Id: <20200507102345.81849-1-eizan@chromium.org>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_032402_992168_D7DA70C1 
X-CRM114-Status: UNSURE (   8.32  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>, Eizan Miyamoto <eizan@chromium.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


It most notably converts an array of MDP components to a list instead,
but also removes some unused fields.

This series of patches does some cleanup in preparation for futher work
so that hardware video decode works on 4.19 and later kernels. We are
planning on adding a dummy driver for the relevant MDP components that
will be bound together using the component framework, which will enable
calls to set up IOMMUs and LARBs, and make calls into pm_runtime.

Note: these changes depend on 757570f11fa4b0ce5472a6583de6f06e996a8527
to apply cleanly.

Changes in v3:
- Removed extra Signed-off-by: tag from commit messages.
- Removed extra line break in mtk_mdp_core.c
- Update cover letter with dependent commit

Changes in v2:
- remove unnecessary error handling labels in favor of err_m2m_register
- remove unnecessary error handling labels in favor of err_m2m_register
- rebase onto linux-next/master to pick up
  757570f11fa4b0ce5472a6583de6f06e996a8527

Eizan Miyamoto (5):
  [media] mtk-mdp: remove mtk_mdp_comp.regs from mtk_mdp_comp.h
  [media] mtk-mdp: handle vb2_dma_contig_set_max_seg_size errors during
    probe
  [media] mtk-mdp: handle vpu_wdt_reg_handler() errors during probe
  [media] mtk-mdp: convert mtk_mdp_dev.comp array to list
  [media] mtk-mdp: Remove mtk_mdp_comp.id and supporting functionality

 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 60 ++--------------
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h | 23 ++-----
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 69 ++++++++++++-------
 drivers/media/platform/mtk-mdp/mtk_mdp_core.h | 10 ++-
 4 files changed, 63 insertions(+), 99 deletions(-)

-- 
2.26.2.526.g744177e7f7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
