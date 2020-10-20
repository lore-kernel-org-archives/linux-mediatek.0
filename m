Return-Path: <SRS0=YCpt=D3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 400B0C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 09:58:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3B2E22242
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 09:58:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0Fb1jVpG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="e7eIlj+4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3B2E22242
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iMDlx7m/XWNnv0PaOwDogWAixYP2OTcbGzedhsBwJBM=; b=0Fb1jVpG4BCU3743h+BZbVaVO
	qDzzLhBW8lBdnAE2s3bGcz3DPgHUaLssr8s/u8LmwxEgPY672XBX3wItxByz4ZXeTudEtdBFN8Fa9
	a5P0/5bVbI5d6YDMvs6NCvLQ0ELKqncgMbHk2889mPKx1Q+kguzaEKApUQJxHo+mxmi7i0HLSMizp
	g2jAnJ2eRNcyfzFeJe09k1xIoaxcMeFo3FWQ2aMSOSl+LaIARNWqRaUK5Hk8ZnAHwHBk6j0kuw4rd
	QQ/5/y1ujdCcCjxjBxeimwfrcRIIPg7XN7an7ZLfJFf8/Fp9QkFlKyslca4EIUH4Bk1GDqGxlOeV2
	Hq4xd90Ow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUoOr-0004co-9V; Tue, 20 Oct 2020 09:57:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUoOk-0004al-W8; Tue, 20 Oct 2020 09:57:45 +0000
X-UUID: 5adcbfc81c9d471abda7dc1c9bf64fea-20201020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=F8WnTljv3hNTWcc1qMKTEyBohllp3UNYpl8swfbVRfI=; 
 b=e7eIlj+47OlOKd6PSAJmp1bNttpTMYb9rN2fRMPzrQgiZf7+W3KDmCZMx5QtTuN7NfFS3pbpZ7hmPoyK841IAZNbm4pyo7lZmQ8bmOWi16Wn868iznG+jc1flevk6ikDhEE+8+uGzz4SUdriq6DXswXUFGn6n80OCzDrhR+6JzY=;
X-UUID: 5adcbfc81c9d471abda7dc1c9bf64fea-20201020
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1713787690; Tue, 20 Oct 2020 01:57:28 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 20 Oct 2020 02:57:26 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 20 Oct 2020 17:57:24 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 20 Oct 2020 17:57:25 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v2 1/3] spmi: Add driver shutdown support
Date: Tue, 20 Oct 2020 17:56:48 +0800
Message-ID: <1603187810-30481-2-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1603187810-30481-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1603187810-30481-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_055743_155389_970DFAF7 
X-CRM114-Status: GOOD (  15.98  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Hsin-Hsiung
 Wang <hsin-hsiung.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add new shutdown() method.  Use it in the standard driver model style.

Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
---
 drivers/spmi/spmi.c  | 9 +++++++++
 include/linux/spmi.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/spmi/spmi.c b/drivers/spmi/spmi.c
index c16b60f645a4..161a48ca4acc 100644
--- a/drivers/spmi/spmi.c
+++ b/drivers/spmi/spmi.c
@@ -357,6 +357,14 @@ static int spmi_drv_remove(struct device *dev)
 	return 0;
 }
 
+static void spmi_drv_shutdown(struct device *dev)
+{
+	const struct spmi_driver *sdrv = to_spmi_driver(dev->driver);
+
+	if (sdrv && sdrv->shutdown)
+		sdrv->shutdown(to_spmi_device(dev));
+}
+
 static int spmi_drv_uevent(struct device *dev, struct kobj_uevent_env *env)
 {
 	int ret;
@@ -373,6 +381,7 @@ static struct bus_type spmi_bus_type = {
 	.match		= spmi_device_match,
 	.probe		= spmi_drv_probe,
 	.remove		= spmi_drv_remove,
+	.shutdown	= spmi_drv_shutdown,
 	.uevent		= spmi_drv_uevent,
 };
 
diff --git a/include/linux/spmi.h b/include/linux/spmi.h
index 394a3f68bad5..729bcbf9f5ad 100644
--- a/include/linux/spmi.h
+++ b/include/linux/spmi.h
@@ -138,6 +138,7 @@ struct spmi_driver {
 	struct device_driver driver;
 	int	(*probe)(struct spmi_device *sdev);
 	void	(*remove)(struct spmi_device *sdev);
+	void	(*shutdown)(struct spmi_device *sdev);
 };
 
 static inline struct spmi_driver *to_spmi_driver(struct device_driver *d)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
