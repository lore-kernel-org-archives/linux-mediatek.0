Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F33DBC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 08:58:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C43A120719
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 08:58:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I/LZEyOj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GEKOq4tq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C43A120719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jK74/uIc8lROIPAInyT3X05GWx/2cw/0uV0tCETMibU=; b=I/LZEyOj/phsxRZYXAtX1bLDD
	gRqdwjzoDpaMDypJTqI7+0U8lk94gDxMh5j8oTNknJosHKvF3uv8OaRjylvoSx9O2pCIvsp7uB99s
	FsyvaJ3maw6XJle+vDF7rnA3WwrPLgZVdrOORt7xpoStAg9elTSNS72wZp5+kneiyEYq4ZmJv0gyD
	0Y4FfPJVtEfoDJfkXotEMQDn0Xz1NxCeo0U0yvuPABIZ3q62eBmkH62E3lpRvbtvruZJ9FWNLzM1r
	Z0ceuJOh5FkoUtSyEBCUp9zJpYXxnkS5DXNw79hrtG1GVGJ6GJADfM/qcje2tx6vmrGiabG560oWX
	gpy//2LUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2WIB-0003Oq-1Z; Mon, 03 Aug 2020 08:57:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2WI5-0003Ld-GI; Mon, 03 Aug 2020 08:57:54 +0000
X-UUID: fcfb42a2155c4891ab5cc025f81ed5a1-20200803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ERSI7lvLnv/tu/AUYaGM8CHfyvlRJpUTDWsBR5j2Xvw=; 
 b=GEKOq4tqqwW6xqawGaHXbMe+hHC8exyqRuyublY1HCUObDpmnSVWMDAd+BWB52HClfd1yKR+5/qR7vVfq11eAxXUKJcXbv8qJO0Z/kDRIWuOv3eVmD9OylJ4eWaeoslnoa9PIxffOUcorgcZMzfYjQ6+5jRaRKjfb9qq/sTHwPM=;
X-UUID: fcfb42a2155c4891ab5cc025f81ed5a1-20200803
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1860452072; Mon, 03 Aug 2020 00:57:46 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 01:57:37 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 16:57:35 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 3 Aug 2020 16:57:35 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 1/3] spmi: Add driver shutdown support
Date: Mon, 3 Aug 2020 16:57:25 +0800
Message-ID: <1596445047-2975-2-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1596445047-2975-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1596445047-2975-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_045753_705631_3CBDFE93 
X-CRM114-Status: GOOD (  16.32  )
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
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add new shutdown() method.  Use it in the standard driver model style.

Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
---
 drivers/spmi/spmi.c  | 12 ++++++++++++
 drivers/spmi/spmi.c  | 12 ++++++++++++
 include/linux/spmi.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/drivers/spmi/spmi.c b/drivers/spmi/spmi.c
index c16b60f..5fde024 100644
--- a/drivers/spmi/spmi.c
+++ b/drivers/spmi/spmi.c
@@ -357,6 +357,17 @@ static int spmi_drv_remove(struct device *dev)
 	return 0;
 }
 
+static void spmi_drv_shutdown(struct device *dev)
+{
+	const struct spmi_driver *sdrv = to_spmi_driver(dev->driver);
+
+	if (!sdrv)
+		return;
+
+
+	if (sdrv->shutdown)
+		sdrv->shutdown(to_spmi_device(dev));
+}
+}
+
 static int spmi_drv_uevent(struct device *dev, struct kobj_uevent_env *env)
 {
 	int ret;
@@ -373,6 +384,7 @@ static struct bus_type spmi_bus_type = {
@@ -373,6 +384,7 @@ static struct bus_type spmi_bus_type = {
 	.match		= spmi_device_match,
 	.probe		= spmi_drv_probe,
 	.remove		= spmi_drv_remove,
+	.shutdown	= spmi_drv_shutdown,
 	.uevent		= spmi_drv_uevent,
 };
 
diff --git a/include/linux/spmi.h b/include/linux/spmi.h
index 394a3f6..729bcbf 100644
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
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
