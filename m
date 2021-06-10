Return-Path: <SRS0=J0kT=LE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E8C8C48BD1
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jun 2021 21:50:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4269F613E9
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jun 2021 21:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4269F613E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PCPkHPI1p+oH0bUUywM9qVKwsPw+ylo3gpIcbq38JFQ=; b=Pssd2D+zaUmYr+
	v/x2LX1Lv/ieUCVn0s5M4ui0UtZuFQM290bRyhnoadxWzOzFl3rO6tbSTBGOCy1IcPjoqy8jzPuAQ
	4oYYPqZBgSddO7Xadj8XmDG7Vfo/8gtvAmhRxu0N/PYpJf35zD98gSkFwsS4/JY0HUdWwken7r9tX
	hdngHhmjCpyESTvjD4fckQ8tse6LcUYFkVCQ6vIJrAOqvtoYXBf/nvZ8LaUhZJxh6grwVahI+H6AK
	73t5SgbJU6vPEblM6ysCtyAk6ITyFs1lsTsfbWxG/Ec0Qb/0JQgsHNBdBnF/pr1J6TIPnvQ0HK+NN
	DPotTyt9ba7yk13E4Xrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrSYr-002c5L-0M; Thu, 10 Jun 2021 21:50:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrSUa-002aEK-9s
 for linux-mediatek@lists.infradead.org; Thu, 10 Jun 2021 21:45:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623361535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TSv9PvVn6D8P1hr2HASl5EPE56aRrWalXa3WhtLcjzQ=;
 b=BwdGSCykFX7BNGGRI+2eQDMzNvVx1I6+MlfzKSE+liF7cGLzYfuMpcYqOY2qFJMBerh3RF
 RPKCNGgmcO576LKRG4VmLdzs4xyv18D3IggyWUXvfzmI0GoQXEzDRCfUdAdE6WdeQy23DX
 2HWWt4VlRtVgxxUK8YCfyBApa9FGS8g=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-_w0jqc0DPAu3BlOfleOuGQ-1; Thu, 10 Jun 2021 17:45:32 -0400
X-MC-Unique: _w0jqc0DPAu3BlOfleOuGQ-1
Received: by mail-oi1-f198.google.com with SMTP id
 j20-20020aca17140000b02901f3ef48ce7dso1894260oii.12
 for <linux-mediatek@lists.infradead.org>; Thu, 10 Jun 2021 14:45:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TSv9PvVn6D8P1hr2HASl5EPE56aRrWalXa3WhtLcjzQ=;
 b=qxtdvaFiWUyUzALWd8EXXXg94sYB7ROUbEmL7BQfUNI1OWSx0rPGLF8toogsA7gT7R
 90EVCXJCcFfTpKXVAoB5BCQjRN9db7XW1KIHhfJz1+q94K/01YH7G4oWG3k5biocfpLh
 LjO8jcKN0pqXVmppiEYsx7aTxpUKez3+yzgq18frA9tagWsN/NDbfori0JgEgXyY7G/y
 3nuTTwOAVQZRn0o1cTmlxtG3R1i6/dSud5pU1KE7TsP/nsSvV6wiVJ4DpqW1XNeMz4nH
 A9DOBm1mVQbVVBldiANg0wOsABAN9moIDbWhvQ+DaOmc5y6pJIMvfwmlgwxjUAbx5KCd
 qBbw==
X-Gm-Message-State: AOAM532dKycxeXy5sNLUK28ro6R+Utz50oPt2NBCmkuF5SSXZqlNGrjF
 UE+N7uPr70ajz2FGvJvZKLxG7dJfty9VWq7hJ+qZ3ASw70H17sLiZT58H29/hQVN7kvv18d7jLr
 0mVdzjYgpF4YLdi3Hh6ema6tlpO78yuDq
X-Received: by 2002:aca:b506:: with SMTP id e6mr361768oif.178.1623361531507;
 Thu, 10 Jun 2021 14:45:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLkOYqEPHROAavZ+GqUoBa88evwWu8hew7OzFYwlCFApTMasrs2l9HZneVNx3WKlokSV6LKQ==
X-Received: by 2002:aca:b506:: with SMTP id e6mr361752oif.178.1623361531370;
 Thu, 10 Jun 2021 14:45:31 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id i15sm881839ots.39.2021.06.10.14.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 14:45:31 -0700 (PDT)
From: trix@redhat.com
To: robh+dt@kernel.org, tsbogend@alpha.franken.de, jic23@kernel.org,
 lars@metafoo.de, tomas.winkler@intel.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, nbd@nbd.name, lorenzo.bianconi83@gmail.com,
 ryder.lee@mediatek.com, kvalo@codeaurora.org, davem@davemloft.net,
 kuba@kernel.org, matthias.bgg@gmail.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, apw@canonical.com, joe@perches.com,
 dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, chenhuacai@kernel.org,
 jiaxun.yang@flygoat.com, zhangqing@loongson.cn, jbhayana@google.com,
 sean.wang@mediatek.com, shayne.chen@mediatek.com, Soul.Huang@mediatek.com,
 shorne@gmail.com, gsomlo@gmail.com, pczarnecki@internships.antmicro.com,
 mholenko@antmicro.com, davidgow@google.com
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Tom Rix <trix@redhat.com>
Subject: [PATCH 2/7] mei: hdcp: SPDX tag should be the first line
Date: Thu, 10 Jun 2021 14:44:33 -0700
Message-Id: <20210610214438.3161140-4-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210610214438.3161140-1-trix@redhat.com>
References: <20210610214438.3161140-1-trix@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_144536_440817_1124357E 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
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

From: Tom Rix <trix@redhat.com>

checkpatch looks for the tag on the first line.
So delete empty first line

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/misc/mei/hdcp/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/misc/mei/hdcp/Kconfig b/drivers/misc/mei/hdcp/Kconfig
index 95b2d6d37f102..54e1c95269096 100644
--- a/drivers/misc/mei/hdcp/Kconfig
+++ b/drivers/misc/mei/hdcp/Kconfig
@@ -1,4 +1,3 @@
-
 # SPDX-License-Identifier: GPL-2.0
 # Copyright (c) 2019, Intel Corporation. All rights reserved.
 #
-- 
2.26.3


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
