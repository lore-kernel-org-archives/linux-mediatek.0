Return-Path: <SRS0=J0kT=LE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9149AC48BDF
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jun 2021 21:55:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58EB6613F1
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jun 2021 21:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58EB6613F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tOH5UxmGWm9YcscJRUE4Xm/Ox6iTbfZ1hsnEhpKsyTc=; b=XiUGRrCkDiTKpC
	sFAgemhkeUi9ca3wFijZZfoJa7ZZnwSwSDC9ZC72GAPhlufUpPsAcyOji6QEkU482n+hd6IFcao5q
	hcvKXnqx3z2hqSgLs6752vNFUl0dddmyJVR9Z/mm2Q+Z14Uti5D9sdIaNJb3NBzN+3FLx/Qmyb6/I
	edZHSAlY5JPumEUsdKzPuOTczvVRrTaFkJdqfSWLU/tHqpUGP9ntCJPO6v6PfJbL6ff41b7bZzx3x
	SPRoFjarA8uDAMsyqZm5T7pRJv31dzMIy+NRTa9TzqJpg+GS4QCyEX7TMOAd5Ve8ieheDOayywDrJ
	Rg3TxCQw+cKa4k7xBQIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrSdT-002elI-MG; Thu, 10 Jun 2021 21:54:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrSUy-002aPF-EL
 for linux-mediatek@lists.infradead.org; Thu, 10 Jun 2021 21:46:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623361559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7i5e+OtT+7tpx8qfL0qW2Nid+sJzqzF/pZfWD+IYGk0=;
 b=ADQ0YP4TB+0KPkbXYWgJkNG02BCZRCGVPoYFnVdTbPhwduXJb8OBq3PDJrMk5hTr+GUMQN
 q5BvkRalOQBNWtP/+Jc9/Cw10MWXslWSRhkXdXcmp3PiyKihS/9bFq30kGj39H/XT9z0Ml
 zwAUvExchq6KJ0dYx3mslnZT1dvLXvY=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-0AEnh-eWPbqBeEYXPaRwMg-1; Thu, 10 Jun 2021 17:45:58 -0400
X-MC-Unique: 0AEnh-eWPbqBeEYXPaRwMg-1
Received: by mail-ot1-f69.google.com with SMTP id
 l13-20020a9d734d0000b02903db3d2b53faso676848otk.6
 for <linux-mediatek@lists.infradead.org>; Thu, 10 Jun 2021 14:45:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7i5e+OtT+7tpx8qfL0qW2Nid+sJzqzF/pZfWD+IYGk0=;
 b=EIKU5balQ0maSQyUEGgiypPquloD0DvasYgU/cAI5cCTAgomnnmNyjpC53TDPd7rct
 sZmoAF1XbD15PsBwQyuJGAobj4EDvC5AbBIhm3MeKbwLnZ4/QPm8LEbYanBsiwZdl0Bd
 tnl4EDUdfHirkVTYiUcDGE38opjt0Zj4zuH+n/tIHxT1ARaSCGFB0lzlTYMdEyTg9Sfq
 bbLhpe86vWxqrAYB/+Ulio1yS3Qy4rI3nH8BSYwtEBLgP0Hxj4emRO4/XLqIkU7mLsp7
 F+iMK6nJ0t/eQQ60QluycfAh2rWI8uiNW1L6NcDYObYkmAft345Q8YFq3MIpo2Lpqlx1
 TKeQ==
X-Gm-Message-State: AOAM533+gNYAbjb/l0N7mivXshVlEIY0xOrt8pTnH2JF+UBPqmMO2fsU
 p32boxKKFMnb0jX53jcVzhqaEwYjvtUv2ITq92R0+zqhjf7mIYTzzdE099NCr0iVS//VCAgIQGd
 iz5hTEKFxAPR+/tIS6BOsswQudgW/UWzl
X-Received: by 2002:a9d:426:: with SMTP id 35mr375808otc.162.1623361557581;
 Thu, 10 Jun 2021 14:45:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGF5LvkW/bwE5nlK1SyjpSfDezjll8ZHnP0L9H/o8fCFKmkIJKYig7nd4MMYjIcR0HYassvw==
X-Received: by 2002:a9d:426:: with SMTP id 35mr375776otc.162.1623361557405;
 Thu, 10 Jun 2021 14:45:57 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id i15sm881839ots.39.2021.06.10.14.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 14:45:57 -0700 (PDT)
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
Subject: [PATCH 5/7] iio/scmi: fix spelling of SPDX tag
Date: Thu, 10 Jun 2021 14:44:36 -0700
Message-Id: <20210610214438.3161140-7-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210610214438.3161140-1-trix@redhat.com>
References: <20210610214438.3161140-1-trix@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_144600_598624_D53EED3B 
X-CRM114-Status: GOOD (  10.25  )
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

checkpatch looks for SPDX-License-Identifier.
Remove the extra spaces.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/iio/common/scmi_sensors/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/common/scmi_sensors/Makefile b/drivers/iio/common/scmi_sensors/Makefile
index f13140a2575a4..645e0fce1a739 100644
--- a/drivers/iio/common/scmi_sensors/Makefile
+++ b/drivers/iio/common/scmi_sensors/Makefile
@@ -1,4 +1,4 @@
-# SPDX - License - Identifier : GPL - 2.0 - only
+# SPDX-License-Identifier: GPL-2.0-only
 #
 # Makefile for the IIO over SCMI
 #
-- 
2.26.3


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
