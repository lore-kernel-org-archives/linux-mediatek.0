Return-Path: <SRS0=2Vnt=J2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA1ECC433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 03:46:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F8C261027
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 03:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F8C261027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iVripO5RaeX6zioRg7qk/EW8ZWlFj53/xeP67tfaRhw=; b=dClag9MGedEvvdgPQwBX9PZHq
	mUqe+0csTjtsNaXBfhU2NQPxiVDn1JkdIIrhoP3CrfL6NWqilNX7kYBp3lgKiegCys7Dn8XoFgCqI
	g4XUXrrmRrtFp7jn2fiErqESfUKVoEoOu4Tr2EiTsBS6G6nCJ6VWloL7LA4HsXQrlTTg+bB/AZ78q
	GDdcuir0EBNRZseocMYYMMEKtdfyOYqGT33e+ldcz/SkxHdz3VXy3JJ9VA5oDPZknJqkqpp+qc0g4
	VbMyOdEy+pP6RZohq9uJLVKm6/7+HMZx1Xff9G7ZsNBVeycmjkbvYx9m+f6IESHGLJVKe1Od/E3Nu
	zE5Nz2Gww==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbxdK-004niV-Py; Thu, 29 Apr 2021 03:46:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbxcn-004nfO-06; Thu, 29 Apr 2021 03:46:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=gdbIqgi/2OFG3TkM7HUsvCi6RxrQlCjbtiuCLzRxmKs=; b=cZmz4EA662NNyxgQc7uXJ2nHzK
 zWI4M8caird/jr12XxdtXfiAYHQuLG9z2FfHTD75i48G8yV4fIq/WIk5w5EmY6/mKu7yobf5b5Xr0
 uJxAlPpQLibbs5Od5z3YpCq2oEwlasfWqy42j9l3slBusUJP0K8nlZ91MZDyZHWAnYPG5AHC9PGG/
 zFQPU+a0/jKACCespIoG4lUVXwyLQ3dnMAmUJ67fxBGLd7O0cEQt166byqiQEhBH03zLB3c7a55Ja
 gG/XoaYk0uVwa0OKM/gvxwmZs8k2XbJCUDKEnzdli0bqGOnowsWuRgnGBt0fHwPgsto5oLo2/PNOM
 xt9mQJOQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbxci-000LTH-4H; Thu, 29 Apr 2021 03:45:59 +0000
X-UUID: 75a5a48e51bc4bfd9e31ed3029167ce0-20210428
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=gdbIqgi/2OFG3TkM7HUsvCi6RxrQlCjbtiuCLzRxmKs=; 
 b=pDir+PYqZmrtCiXfF11MgF0RA6UFJ16hAdtVAatQpaVcQkHmm5OaV7tYmJFUDN9EsojwN+gv5lykXoNAOMjACx5lF+mWvZrAx/2VCDZJme6pivwvCIFdqO6and23equfsL+aEVa+/r1FfC10NICRPGfos2kVcIikMuL/DKp4Ng0=;
X-UUID: 75a5a48e51bc4bfd9e31ed3029167ce0-20210428
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1151401316; Wed, 28 Apr 2021 20:45:53 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Apr 2021 20:45:52 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Apr 2021 11:45:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 29 Apr 2021 11:45:50 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>
Subject: [v3,
 PATCH 2/3] drm/mediatek: config mt8183 driver data to support dual
 edge sample
Date: Thu, 29 Apr 2021 11:45:47 +0800
Message-ID: <20210429034548.28030-3-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210429034548.28030-1-rex-bc.chen@mediatek.com>
References: <20210429034548.28030-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_204557_599661_79F5C19C 
X-CRM114-Status: UNSURE (   9.76  )
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

add dual_edge value for mt8183_conf

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 79f3e83f40ef..c548780dd3a5 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -691,6 +691,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
 static const struct mtk_dpi_conf mt8183_conf = {
 	.cal_factor = mt8183_calculate_factor,
 	.reg_h_fre_con = 0xe0,
+	.dual_edge = true,
 };
 
 static int mtk_dpi_probe(struct platform_device *pdev)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
