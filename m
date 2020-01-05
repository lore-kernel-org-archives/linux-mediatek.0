Return-Path: <SRS0=jjMD=22=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31032C33C8C
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jan 2020 11:01:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0730721582
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jan 2020 11:01:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pfnep60O";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="BYLWjnuJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0730721582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0SBKFAm3/6U5GW7sn/cyNRTnDjzmR4n29fyBej98xOk=; b=Pfnep60Oxh7gn6
	cEZiO4uFjhWHgQzXgPvnxIkT634Yt8txZt0HlX54kJCavz+6YvDunEXbFsLoPr4hrG4kzt8nXRRsR
	PtipZ3mEJfDDgf8W3Fwzyg3QwXwnaGVmFXnGMlnuNvFA+7dOVCZLGjglBsnFZP2WdErUQQhDXA6/a
	M80My8UrTs2CKL7bJIDYu6DyY8ewjx3F9VrnLk+F0l+iGvOrWZqgGvlEqDWkNrSlLFblb42PeWgNP
	W0OU5zW7wcaq51/phzLmxqfc8TcCzP5YpcLir5JeZK5lMi/54HhbSTEzs9PiJ2F1bzXhmGRIptSDh
	rK4DdXENt+jejsXuqw6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1io3fF-0001Ki-Sk; Sun, 05 Jan 2020 11:01:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1io3ae-0004Ib-UP; Sun, 05 Jan 2020 10:57:02 +0000
X-UUID: b5070473adad47f2a4d81e28298e7950-20200105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=gy4tHLXRv2FvAOvp3/caFYhMAq0QdVmLmvhz6NoN0hg=; 
 b=BYLWjnuJV/rEHMX7Ah+BpXa0Sd16aaPayySghcGxZWsZKJ31j1PAehfyNJckNp30/XAcJgEBi9BEq9QdPn1PzGrMgBslUH0IPHnw7gBr9cgIeLGgZi2JfZ3Or8nf35p8FaX12UWs8mW23UlzTJINV8PEbCboOxWi6PgtZfTgEd8=;
X-UUID: b5070473adad47f2a4d81e28298e7950-20200105
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 8063208; Sun, 05 Jan 2020 02:56:57 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 5 Jan 2020 02:47:13 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 5 Jan 2020 18:46:45 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sun, 5 Jan 2020 18:45:42 +0800
From: Chao Hao <chao.hao@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>
Subject: [PATCH v2 15/19] iommu/mediatek: Remove the usage of m4u_dom variable
Date: Sun, 5 Jan 2020 18:45:19 +0800
Message-ID: <20200105104523.31006-16-chao.hao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200105104523.31006-1-chao.hao@mediatek.com>
References: <20200105104523.31006-1-chao.hao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200105_025701_013879_4F1951EA 
X-CRM114-Status: GOOD (  12.59  )
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
Cc: Anan Sun <anan.sun@mediatek.com>, devicetree@vger.kernel.org,
 Jun Yan <jun.yan@mediatek.com>, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, Chao Hao <chao.hao@mediatek.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Yong Wu <yong.wu@mediatek.com>, Cui Zhang <zhang.cui@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch will remove the usage of the m4u_dom variable.

We have already redefined mtk_iommu_domain structure and it
includes iommu_domain, so m4u_dom variable will not be used.

Signed-off-by: Chao Hao <chao.hao@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index b1ce0a2df583..bfb1831afae9 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -107,6 +107,7 @@
  * Get the local arbiter ID and the portid within the larb arbiter
  * from mtk_m4u_id which is defined by MTK_M4U_ID.
  */
+#define MTK_M4U_ID(larb, port)		(((larb) << 5) | (port))
 #define MTK_M4U_TO_LARB(id)		(((id) >> 5) & 0xf)
 #define MTK_M4U_TO_PORT(id)		((id) & 0x1f)
 
@@ -199,6 +200,22 @@ static u32 mtk_iommu_get_domain_id(struct device *dev)
 	return get_domain_id(data, portid);
 }
 
+static struct iommu_domain *_get_mtk_domain(struct mtk_iommu_data *data,
+					    u32 larbid, u32 portid)
+{
+	u32 domain_id;
+	u32 port_mask = MTK_M4U_ID(larbid, portid);
+	struct mtk_iommu_domain *dom;
+
+	domain_id = get_domain_id(data, port_mask);
+
+	list_for_each_entry(dom, &data->pgtable->m4u_dom_v2, list) {
+		if (dom->id == domain_id)
+			return &dom->domain;
+	}
+	return NULL;
+}
+
 static struct mtk_iommu_domain *get_mtk_domain(struct device *dev)
 {
 	struct mtk_iommu_data *data = dev->iommu_fwspec->iommu_priv;
@@ -301,7 +318,7 @@ static const struct iommu_flush_ops mtk_iommu_flush_ops = {
 static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 {
 	struct mtk_iommu_data *data = dev_id;
-	struct mtk_iommu_domain *dom = data->m4u_dom;
+	struct iommu_domain *domain;
 	u32 int_state, regval, fault_iova, fault_pa;
 	unsigned int fault_larb, fault_port, sub_comm = 0;
 	bool layer, write;
@@ -336,7 +353,8 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 
 	fault_larb = data->plat_data->larbid_remap[data->m4u_id][fault_larb];
 
-	if (report_iommu_fault(&dom->domain, data->dev, fault_iova,
+	domain = _get_mtk_domain(data, fault_larb, fault_port);
+	if (report_iommu_fault(domain, data->dev, fault_iova,
 			       write ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ)) {
 		dev_err_ratelimited(
 			data->dev,
@@ -506,16 +524,11 @@ static void mtk_iommu_domain_free(struct iommu_domain *domain)
 static int mtk_iommu_attach_device(struct iommu_domain *domain,
 				   struct device *dev)
 {
-	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
 	struct mtk_iommu_data *data = dev_iommu_fwspec_get(dev)->iommu_priv;
 
 	if (!data)
 		return -ENODEV;
 
-	/* Update the pgtable base address register of the M4U HW */
-	if (!data->m4u_dom)
-		data->m4u_dom = dom;
-
 	mtk_iommu_config(data, dev, true);
 	return 0;
 }
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
