Return-Path: <SRS0=Strr=JL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C0AC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 13:35:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D97D1611CC
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 13:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D97D1611CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yR40xjGK8QTaxuY1uJT/ofa71KckBG2rO7CDrYXk3fw=; b=fIVkDbC4NsWoIxAAkzfjtXjQs
	i3ZXyygefp2ay/B79MwT4oE9hUmhFk8Jx8dGWsrriWC8192gxHJA4XA2/eRstQHmmIWXPFgBXn1qQ
	icjDcP51d1kKsk28oB8Q1uX7x2IkNkURxqBMS+8Gwhd9np2lxurPMDT80dg0Zq3kNfn5GQzocegQX
	ZPxT0Dp8/36XJ4skbWcKxm7Y6ILE8O4X3FQyoIts5PrZphKXHcbYqbqVyMq/k2tXfMd1rXGmKckSn
	R2b+LXWem18YaerhpC8EJ3hgWleqJ30r2ooxZjdbIxk9T9rs1piQZzcCqQEwj4JFOnqvUoQPE1vOO
	RXTAQhBMA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWfgC-00ClKX-Fk; Wed, 14 Apr 2021 13:35:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWfg6-00ClJJ-PO; Wed, 14 Apr 2021 13:35:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=SlW0FCOuxOyq9omBprMYmcRhND7JEwg0wsAQP8sC8vU=; b=myCWQn7H5JwYrWWZb5V30i8cga
 +VaJGzzj882ioWC2QLacFsY17e15oE7J4is1fcPMdQzENdwX5umFPtyHMF5rgg3wvknqLimYCW7Qp
 XCF+m4pKcoQQuRShswM6JYVGxiDQScRndYmUi2Q+pzL7YXrtAu5n6b3Glvb50hlpLErmRDlc5ZW6b
 S3h7zOpyBjvvf5JNSFS2RhLWPFcIPdLoyJaxf3CVJ3PaVkTfJqPLCYQQVk7ffXU5ukKWYogwxZMRH
 /8g1isVlm8PvOM04hk2SwF2SdjSUkCOWp9QNmJSRL/zapyrsYaRgityp2lQQrEUagCsjKfxFR8bzl
 kVLwUQ2g==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWfg4-007nZO-Ba; Wed, 14 Apr 2021 13:35:33 +0000
X-UUID: 42f8296cf933474cb3af75f6c3c3575e-20210414
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=SlW0FCOuxOyq9omBprMYmcRhND7JEwg0wsAQP8sC8vU=; 
 b=kFnCnCMT18hnKb36PwKkIaHwouP3CwONIY5b11ARlFJMTvdu9nRmD3NXQCM+2A2CD2dvjIz5nSsDbTvIKPM4m1gN639nZdj8BZZNDQNmNQXu/133VVVih96DketjvPiDKFktMPpZIr7Ce52SmrXitcAxcgUpA6IMIC0wvgyAU2M=;
X-UUID: 42f8296cf933474cb3af75f6c3c3575e-20210414
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 177847625; Wed, 14 Apr 2021 06:35:24 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Apr 2021 06:35:24 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Apr 2021 21:35:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 14 Apr 2021 21:35:22 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>
Subject: [v2,
 PATCH 2/3] drm/mediatek: config mt8183 driver data to support dual
 edge sample
Date: Wed, 14 Apr 2021 21:35:15 +0800
Message-ID: <1618407316-10042-3-git-send-email-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1618407316-10042-1-git-send-email-rex-bc.chen@mediatek.com>
References: <1618407316-10042-1-git-send-email-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_063532_419067_BC9055B0 
X-CRM114-Status: GOOD (  10.03  )
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
index 21a3a7b78835..76431fe849b8 100644
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
