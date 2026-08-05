Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6D1C55822
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2026 08:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Su6pUumKgpP8taWCBv6778NBns5sO908kIeSqx2hTLE=; b=3hqCtW+Ad/R1v0KzEBCin7gP4A
	SY4mHMOkThgd0OBEv6vfz6G0CbIuu7cgGB//qWcKP1d2pPqnzd+YpQsjpTO7HNwW2pdWu5oqftlkd
	V6TdUc8HSspFzB9e16HdBKszADxv0E0WEc8rQtnP4sPdsFcnBEw3R37QYqfpSEWdZHD0/Qq7elr1y
	ycnATL7uhUrejssp1/pdJXLpUOwUZO14uqetR+NdO+raz65dOscHTrMCanN16TBa+xlap8dKwImGc
	/snS6IbEL3cVph6ZimP8Tz8qWs6J09p/YhLNuDFKF2eV/Acpu61IMg7k5L+nBpVT25nFfp5WUhm5g
	tQD1q67w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrXO6-00000003Z4a-1LcG;
	Wed, 05 Aug 2026 08:54:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrXO4-00000003Z3d-25qC
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Aug 2026 08:54:09 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6758dCR52132431
	for <linux-mediatek@lists.infradead.org>; Wed, 5 Aug 2026 08:54:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Su6pUumKgpP8taWCBv6778
	NBns5sO908kIeSqx2hTLE=; b=DGYpQORbLV3qXFfNsqspPQqIkAFOt00/0xAP9d
	agsIb914lZk1Hj3166ybKWN/ikTZKrM1bX9SyuiKA5OXwMsBhyrRvHyv3RTMmzFM
	ejSfW+jnxJ7gGv/atQabfzZEzF9J6CB7QTcuTYypGbEYGWPcCGCFD+kWyhoYkNNj
	mJax7/F2D6eXfSUKB+yRcX0CRzO7IYNFDgidL/82IHT+r+Ysfx//AbWCUam6mPIj
	1pOlPsYzOu26mx4kpvQ3R5AZ3GbuyIya2+aB2dzqtO9Zzec5K1zjjhG00c/j6+X/
	Al2RIwMwc2Dyv8WRuEnKLWkbwSRWVcYUIk4IcposEvs9joNA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum56bneg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 05 Aug 2026 08:54:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52ce64c41efso12029321cf.3
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Aug 2026 01:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785920047; x=1786524847; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Su6pUumKgpP8taWCBv6778NBns5sO908kIeSqx2hTLE=;
        b=R5aL4rGzhDtJTOM1IW68geSYT+6zVYV8C/jZfe2QpSdDlkQhd1zs+B00CpTlkjuwcv
         2Npkt9ux9qW2Y41JAhXmSm6UaoJExdqR5OxVjJV87SfRmyIgAXEybJswH2AGe02TrI68
         nhZQcyaVEqHePhF0maRYSx/t5bK1VOMPlOyeG4rgPluSqbX648esA5Lic3148ZpCtpK1
         /Vu4ZFo8h8jd9EXuhzJumT4VCfkipKjYxy9tWUMkSEvxK5bri9Yfzs0M17h7C2Lu+yQ/
         KGp0Vjv3mjwzUsYWsJSFTe4G2XpTllxoEawPMxza6ajLGL8llvHyET8c2h0PzRr83sZL
         cjEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785920047; x=1786524847;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Su6pUumKgpP8taWCBv6778NBns5sO908kIeSqx2hTLE=;
        b=rOXBr0jKDKjZPrQMT8JyPUhB7EhsK6KPp3B6R9iPjI6903mD2n3nMKJ1oKTaAyGJGP
         uoX1dsOUKLYypQdKfCRrLtSIq8psJD0N/MDLRn8XdYwgH/NaWyJy5QCh0uJgDX/h9iJU
         S8gFZYG3Gd2DklIpDlErLyJrSreQzQjyVYM+3RJsHYHP97nAY2le/vWKNPDXAXEca//3
         j5mFNwhhVs78SBgyqcjgcJhoZGIcYPcML4ssSzrcA1aMaN46VSFn5YCPZP7y2FTP7w09
         tcGmajTpoBTbGJme2N0/CyfV+UVuEi+7+cHKttd/aoJp+fRjpRwJlvJ9mYNSwPeBEoBx
         Myrg==
X-Forwarded-Encrypted: i=1; AHgh+RpNWdCnZCmc3r9YeQhWBcnT/aoQG2EZjTAR2jiCfhQp77BjCdwjQYCZTPE+E+P6oOYWIzpH4Lb5/H9c+GYFJg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4sjpOvfRVxNSjPIZBG6nG+vYTUl9HvCT2oOdHdplcKB5rkcFF
	58kSGGo/bWWq6i70/R0agt33/EuLGfNRPcEJhSr8MxvV51UBRxVNkBSMRf8TrBOTRmHIwAh8Qz/
	GNp9v9dj69nmpYtGr2xP9xpC0GxWl71dqkG/HKUNU5IUrill4BYhf8mjUa/ndfBuvrTi9ElEFId
	A=
X-Gm-Gg: AR+sD12wqCuoxICA4oE5Hb3qfvZb8UyD6x9qiUIbz2itWrAOUH2/cIAMuDE29kazDxx
	Ox6jWD5SSMqx83ldVWYsSPfjkdue3DmGauov2JLx4KLijYfbUMp3rZhFvT9+Bpe/onLBTDPb186
	mPKDzWkddar2bxnzd30xESyYlXMMV5yogHyDzy7wD3ChQHlgmaZo55KcmA1IG+C8U7veKYNq1q1
	pwd4J1P0kRL2VUPyZMovX8WGACzmlfmMRx14rirbXaoUzJff68dGwbCYizwbDSrHB8urE+NaRdK
	jlbrF5+RNqak6Jc/swCj46R4OBpZ/RpuESe9+4G4VBvYgKz1Ndp9w51dOD+kqFl/DqpkfnH42Nz
	AQKE+5DLUkrUMcv4=
X-Received: by 2002:a05:622a:5c07:b0:51c:1a46:9148 with SMTP id d75a77b69052e-52ce61934eamr55890351cf.34.1785920046797;
        Wed, 05 Aug 2026 01:54:06 -0700 (PDT)
X-Received: by 2002:a05:622a:5c07:b0:51c:1a46:9148 with SMTP id d75a77b69052e-52ce61934eamr55890001cf.34.1785920046322;
        Wed, 05 Aug 2026 01:54:06 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994dfda556sm82948865e9.5.2026.08.05.01.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 01:54:05 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Wed, 05 Aug 2026 10:53:09 +0200
Subject: [PATCH nf-next] net: pass net_device_path_ctx to
 dev_fill_forward_path()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-dev_fill_forward_path-ctx-arg-v1-1-f2873d941755@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDMBAAwK/InruQGk2lXykSotnogkTZBBsQ/
 97Q41zmgkTClODdXCB0cuI9VjwfDcyriwsh+2poVWvUoHr0dNrA22bDLl8n3h4urzjngk4WfGl
 tjO560tMA9TiEApf//4EYMFLJMN73D1GnxCN4AAAA
X-Change-ID: 20260805-dev_fill_forward_path-ctx-arg-73366345e3b8
To: Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Felix Fietkau <nbd@nbd.name>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Simon Horman <horms@kernel.org>,
        Pablo Neira Ayuso <pablo@netfilter.org>,
        Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
        netdev@vger.kernel.org, netfilter-devel@vger.kernel.org,
        coreteam@netfilter.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA2OSBTYWx0ZWRfX4/0FxlujGYvP
 NBOUaDwl50cdSOLtPBet17EsdGRokrjv8HRhnZomHfwrMYHquWq3B1kxiuiGP4xf4cxc1XLSObi
 tXrQNvNDNQWj8uX3jOxDJn6puuN4PgX98lZRtyVSYehXarnIMBqO4yeGSIdDx9nUBQ23pMxFRzf
 hC59PUOt+bSUfJDt2W6KN37TMyCp1xB+NGTfV3UKH7ylJ3jyQ49S/3c7pYLKmRAiY36KQB1OvPr
 gGta4Qjisjj6OZC7mKoMdHncLGWCyjSUKQcXqZR9RhbJ3+DiYN22hjXCv9tmPkEPkZTC4uGCa6Y
 iSIFydI59c2SehG0mCFHq28CnIqRjD/7HxbA5xZk+Dc6qmI9JnxFyloWpxKSPp6uZHJTRMevyUu
 rT9FMi362I57P2pWCKNzAHkP2AFEYLMYdwRWiDzlUb5gWV/hPbsWWcq1ShGD7kifLw3Y1oA3jLa
 uuHbmTSrgaSCSGt5ipg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA2OSBTYWx0ZWRfXyYlstft5KdBy
 ojZbCWeRAqDWSfbGC40qwxriQos0/2k7zbgquBl5RF9iQoyT56+JEpYEu/GYt2UKuJwloruUVlG
 BHlb4WTknXnTbb3bKwiXRPSL5QURT7k=
X-Proofpoint-GUID: o1TgBNjauZkPOxNyC26K51Mb5AqFadcq
X-Proofpoint-ORIG-GUID: o1TgBNjauZkPOxNyC26K51Mb5AqFadcq
X-Authority-Analysis: v=2.4 cv=GL441ONK c=1 sm=1 tr=0 ts=6a72fa2f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=xc6HxeBLMKpXFN7qBEQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1011 bulkscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_015408_652481_12A88888 
X-CRM114-Status: GOOD (  20.29  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Refactor dev_fill_forward_path() to take a struct net_device_path_ctx
pointer instead of a (dev, daddr) pair, so the caller can build and
populate the context up front and keep it after the forward path walk.

This allows additional fields (e.g. vlan and ether_type) to be carried
in the context and shared with ndo_fill_forward_path implementations,
instead of being reconstructed on the stack inside the core helper.

Update the mtk_ppe_offload, airoha_ppe and nf_flow_table_path callers to
allocate and fill the context before invoking dev_fill_forward_path().
The network topology resolution behaviour is unchanged.

This is a preliminary patch to enable HW flowtable offload for IPv4
over IPv6 tunnels.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/airoha/airoha_ppe.c        |  7 ++++++-
 drivers/net/ethernet/mediatek/mtk_ppe_offload.c |  7 ++++++-
 include/linux/netdevice.h                       |  2 +-
 net/core/dev.c                                  | 18 +++++++-----------
 net/netfilter/nf_flow_table_path.c              |  7 ++++++-
 5 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 33ddf0d07855..53183a132100 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -283,14 +283,19 @@ static int airoha_ppe_get_wdma_info(struct net_device *dev, const u8 *addr,
 				    struct airoha_wdma_info *info)
 {
 	struct net_device_path_stack stack;
+	struct net_device_path_ctx ctx = {
+		.dev = dev,
+	};
 	struct net_device_path *path;
 	int err;
 
 	if (!dev)
 		return -ENODEV;
 
+	ether_addr_copy(ctx.daddr, addr);
+
 	rcu_read_lock();
-	err = dev_fill_forward_path(dev, addr, &stack);
+	err = dev_fill_forward_path(&ctx, &stack);
 	rcu_read_unlock();
 	if (err)
 		return err;
diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
index cc8c4ef8038f..1ec46784f018 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
@@ -92,6 +92,9 @@ static int
 mtk_flow_get_wdma_info(struct net_device *dev, const u8 *addr, struct mtk_wdma_info *info)
 {
 	struct net_device_path_stack stack;
+	struct net_device_path_ctx ctx = {
+		.dev = dev,
+	};
 	struct net_device_path *path;
 	int err;
 
@@ -101,8 +104,10 @@ mtk_flow_get_wdma_info(struct net_device *dev, const u8 *addr, struct mtk_wdma_i
 	if (!IS_ENABLED(CONFIG_NET_MEDIATEK_SOC_WED))
 		return -1;
 
+	ether_addr_copy(ctx.daddr, addr);
+
 	rcu_read_lock();
-	err = dev_fill_forward_path(dev, addr, &stack);
+	err = dev_fill_forward_path(&ctx, &stack);
 	rcu_read_unlock();
 	if (err)
 		return err;
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 8db25b79573e..d2f545016f7f 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -3425,7 +3425,7 @@ void dev_remove_offload(struct packet_offload *po);
 
 int dev_get_iflink(const struct net_device *dev);
 int dev_fill_metadata_dst(struct net_device *dev, struct sk_buff *skb);
-int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
+int dev_fill_forward_path(struct net_device_path_ctx *ctx,
 			  struct net_device_path_stack *stack);
 struct net_device *dev_get_by_name(struct net *net, const char *name);
 struct net_device *dev_get_by_name_rcu(struct net *net, const char *name);
diff --git a/net/core/dev.c b/net/core/dev.c
index c1c1be1a6962..e2c9fe3f7a7b 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -750,41 +750,37 @@ static struct net_device_path *dev_fwd_path(struct net_device_path_stack *stack)
 	return &stack->path[k];
 }
 
-int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
+int dev_fill_forward_path(struct net_device_path_ctx *ctx,
 			  struct net_device_path_stack *stack)
 {
 	const struct net_device *last_dev;
-	struct net_device_path_ctx ctx = {
-		.dev	= dev,
-	};
 	struct net_device_path *path;
 	int ret = 0;
 
-	memcpy(ctx.daddr, daddr, sizeof(ctx.daddr));
 	stack->num_paths = 0;
-	while (ctx.dev && ctx.dev->netdev_ops->ndo_fill_forward_path) {
-		last_dev = ctx.dev;
+	while (ctx->dev && ctx->dev->netdev_ops->ndo_fill_forward_path) {
+		last_dev = ctx->dev;
 		path = dev_fwd_path(stack);
 		if (!path)
 			return -1;
 
 		memset(path, 0, sizeof(struct net_device_path));
-		ret = ctx.dev->netdev_ops->ndo_fill_forward_path(&ctx, path);
+		ret = ctx->dev->netdev_ops->ndo_fill_forward_path(ctx, path);
 		if (ret < 0)
 			return -1;
 
-		if (WARN_ON_ONCE(last_dev == ctx.dev))
+		if (WARN_ON_ONCE(last_dev == ctx->dev))
 			return -1;
 	}
 
-	if (!ctx.dev)
+	if (!ctx->dev)
 		return ret;
 
 	path = dev_fwd_path(stack);
 	if (!path)
 		return -1;
 	path->type = DEV_PATH_ETHERNET;
-	path->dev = ctx.dev;
+	path->dev = ctx->dev;
 
 	return ret;
 }
diff --git a/net/netfilter/nf_flow_table_path.c b/net/netfilter/nf_flow_table_path.c
index 98c03b487f52..b9df7453f762 100644
--- a/net/netfilter/nf_flow_table_path.c
+++ b/net/netfilter/nf_flow_table_path.c
@@ -50,6 +50,9 @@ static int nft_dev_fill_forward_path(const struct nf_flow_route *route,
 {
 	const void *daddr = &ct->tuplehash[!dir].tuple.src.u3;
 	struct net_device *dev = dst_cache->dev;
+	struct net_device_path_ctx ctx = {
+		.dev = dev,
+	};
 	struct neighbour *n;
 	u8 nud_state;
 
@@ -72,7 +75,9 @@ static int nft_dev_fill_forward_path(const struct nf_flow_route *route,
 		return -1;
 
 out:
-	return dev_fill_forward_path(dev, ha, stack);
+	ether_addr_copy(ctx.daddr, ha);
+
+	return dev_fill_forward_path(&ctx, stack);
 }
 
 struct nft_forward_info {

---
base-commit: a23b36233d4103def55dc8cf65698106d0bd1e62
change-id: 20260805-dev_fill_forward_path-ctx-arg-73366345e3b8

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


