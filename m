Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C661BFA3744
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jan 2026 12:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uANIKOB+RK7h0H66+H3re3NKPwe1VSy909BUs6pWqv0=; b=FiKgm+jiimVr8IzjwS3ICvdntn
	vnZ9g4KtTk3VNDuA2cQbRiii+70CKjI1ZIOEjZzUXq9Fk20ddLrUezu3Gp2v4VzarpRnHSxXrYyaH
	OP6feX1vSCvmI4+vdwbhLrjNcH7QeIXPUiusUk4IjAoWIWH0xJzIwRCopoNFv7laMelhrhcdZuKfZ
	KkoV7IbxbPn+7/P5NkQBKfH/jshO/QCE09kV2AS5unfSgGI1HK0xfY5i5ug1FDdgWcQco8gewUydf
	tykHrkRVjJuknQEdCyeZ2w3sN0e4xXEBxQ2qL6agctablW8DJ9kSZYboX1M+viFpJrf2Y1ety6ETA
	wZ8wY5tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbea4-00000008DVC-1YrU;
	Fri, 02 Jan 2026 12:48:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbea2-00000008DTL-1WQs
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Jan 2026 12:48:35 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029WIvi427479
	for <linux-mediatek@lists.infradead.org>; Fri, 2 Jan 2026 12:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uANIKOB+RK7h0H66+H3re3NKPwe1VSy909B
	Us6pWqv0=; b=c+5gwj02MDHXrCpqkQRmgfGdCJaGC8nB/fUDmeXrB4SD2s4kDIZ
	H82LJY67s4R/UPd8VBNaUGEQBhmYwX+YskLKjt8VgcLGgPrVjCljvJ1/743Wqkwv
	Ym9+/lwYYGO+4rrLNPfqriDvWUm4EmAQUN+oARmXwA/7RESNfDfBBXXdFPbR6eq7
	XMpvbZkaGMxe4Iq2PjQilXvfbUv9fEwQ9zbASfy0AfuvJgg5m1pDxLPBIkTBFffl
	mvjlDVApUmnbEWDSdit1fwYAwKVaNDKobd0tcgqP0o9h/ULe+vBHxqPySlsLvdeO
	Id90ABfS/PlpSU1nkb0AJlZukBRysjgLozQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4be6fjrxmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 02 Jan 2026 12:48:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1d26abbd8so368197341cf.1
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Jan 2026 04:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358112; x=1767962912; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uANIKOB+RK7h0H66+H3re3NKPwe1VSy909BUs6pWqv0=;
        b=FWnBWJTmP/TOESBeDK/Ur0Fb22ys3ZL8mPIFDrPS8c8YM4lh4RReFTknKU2Po0dDL2
         EmvjNp7n+BmNvX3cgvcjeGevKqeIz725dWKj6l7XeOGmLBJOFycR20SBAjbuFtWt2lfs
         AYXAJQXugmuISVtydPGtR+WLEIdGvch4aUygaIpbfQNgc6R3Y55eBGMZjAuHSMwC4NZc
         EltoWZ9jPZatkO4Ly0yN8CDew+8z3kxst/q8JgAe80Hemnpxtkvt2GQ1YjanXbyJQhpV
         L5huWHtBa2GwkN2h2VGeIRbWvDC6sNRXyFjldnEWR0NiKYTlNiQeS6jLBlByazGCPKNW
         rMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358112; x=1767962912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uANIKOB+RK7h0H66+H3re3NKPwe1VSy909BUs6pWqv0=;
        b=Fo55iv06zHQYpJQoRQO6c1yqLizA5vEKg6pklBlag8g+vZuwXhWG7aIiaBeHpUgPfO
         MBNPa+Fb2Ofe1YmtLbdpwB0TYq6tEY1maasJefHln/zGxJllFbfwGd9fHsZEZXJKljbs
         NFuKd6uUKtpGymSyznYQZtysnZpGp4xD8UEzwUfHaUQglsvwoap+TZNkKbpzCOxsT5fZ
         4q3KfMXLcbOvLL06stlduIob5QHFn8U2oeYP4/6lBolwEwP2NndIYTuSVoXfLTvSIwWX
         KiXJfNLLI9gkyKzdeFFBIj13pSW5tY+PNEo3hyPfl/Wm+Fu+iS6dVeNLGjenf9cyJAIR
         +cuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvUkp7EydMZCsgxD7H5LwYFlPty+eahrdsPaG6B4Q+fOrq3GHG2xnNvOFY7zVu4nm5zLjo/lhwLDI2XM6RfA==@lists.infradead.org
X-Gm-Message-State: AOJu0YywOgBR1M0W8EPUkGOJwXFcqBARiFrt9lt/UQy4SeEdJjnlro6j
	bekwe1Nb1YjzJ/L2MxiTJRpxUt7ZdrQF9d4tQkEhb82zPgPmEb0VSb+m0qnzI/qonH9xzKon9NV
	AXSjcF7E9e974yFc35jNIrnDRDJ31GIXxJ5aPWKsb2msK2HybXtHdHJh2AS+HY/QdwQ4l9OznGJ
	Q=
X-Gm-Gg: AY/fxX5AC2h6CmwMpPs8S7KR4LCEesKoHZSYwcbE+/lnef1O20HMWybFY/XJpmNT2e3
	Ai6IjxqHs77gv8HgM7xcl/GEqCtxYJUOW9m6xj0kEwWFujK/4v1oL32eqIwUAkWKvyTkX3BG05W
	emREaTlqvc+hG2mNjnsrbAW3uZc/0W2DJxfoVC1HGm12wPYQY8KCZCwKxK+X5gjpnZkmsRAdvQ3
	IExHRWeg0oqfqOI00QC0UJWDI5UE4XZGs8k62QAMnrutfr/BRXFIqD1URgDvVMpJMDF4rjN0x/d
	aIh30bC3/Cg6MNpGYB4E4oCvfUo9PIPXDVfFORMh9ba48O0gtpj4Kqs8lAGTj6OQKLiVvKdkTrK
	eWm41qk4yKl7m/eFaUjLP1yHB7Q==
X-Received: by 2002:a05:622a:1aaa:b0:4dd:ca89:8d7d with SMTP id d75a77b69052e-4f4abda9b1cmr610424721cf.56.1767358112374;
        Fri, 02 Jan 2026 04:48:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvshfH6YpqD2T9Jiaku9k+FmB6y1mx6ndyOz7J57ibttgf7Rz/Y34vvy5uZeYBR7krdFoVfQ==
X-Received: by 2002:a05:622a:1aaa:b0:4dd:ca89:8d7d with SMTP id d75a77b69052e-4f4abda9b1cmr610424411cf.56.1767358111904;
        Fri, 02 Jan 2026 04:48:31 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be27b0d5asm802892105e9.13.2026.01.02.04.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:48:31 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] remoteproc: mtk_scp: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:48:28 +0100
Message-ID: <20260102124827.64355-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1968; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=dzGr49X7pVPoasOJF2oYtnntvKo8ogEdwOOo7jST2g0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV76beJpfHm+9A/PvJoGz+yVfq6jzxeF8622ek
 DqLv6WXyLKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+mwAKCRDBN2bmhouD
 10y4D/9vRkVBemHeQz46eCPcRk84lgBw2ITsDBkNHR7kwph4QhVsT9nPx8YRV8m+2Mx3VMqoA1Q
 pOji/yCcX02+tnM4jCjBezVrNReilXqh/2gIGQnsha+LRvA97jLZ7MZMutXc3HObG70IHX9xpPM
 ig4k6NAVVbtCoBBHXhTeq1xCaCv/F+h6J7mfjBIIyZL4YeqsHGJjUickS3tbCRzO6LF32QpJiWN
 KDeOUF3fqmvkekD8uNj/Spqqvg2A73t9tki6VA0HXfrgVKhnFsXGRsJ6XReQz08ceOaS4Y0RWtC
 ZtyMeCNMSYlUbUrUoSy3o0UR8K8Fpil+f9ju0Fo+QShOsk/4RdFrI7XauzkW08LQQzTKR7+1F5y
 DdJMnYPOxwBuBTM5OxuSt7eYzAzRQF16dNl3Pz/BHboKn8HAsWPJfIOaOHBHcJxlPaRso2dHIkK
 4tRaSApCctpxk6fLBIhDH40zdbk+0HiNIlmKVrcXe7L/+dw7Ic7ADZFlyP87QJVy1iq/H0xUKTl
 C1qbmRwhFhv92XReNhzdOUydd2bvCiEW5cGeVeGF8cdI7YXL5wi4gbpt+25glLZ3Cg3Jv0ua3f3
 RftOmvvva2KlhLsQWWRSI+r9JUHkgq5ZEv1B5E8Kc0//xzrviNsNcZ1P9F9FGc9MKBrda/fqh1N DQumYlLepdJsyXQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Av7jHe9P c=1 sm=1 tr=0 ts=6957bea1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3Ptd9em2v2g2-VwuqrUA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: akeQZeeH5pOKxqZx6xrcXaOrCJ7z-0tI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfX8euANyDSNc9H
 YUFH6KQNqJLsAGVdqu0zuUGg1zQ/IlE1cTbjGENLvEcLsgchJWl+7gECt4Gluxz12x5silQMOBm
 TOAhfmr7ZUaMJ5rk5U4ibw1913XYjqetKZf+KVsxv6k68PSWPTvAsji+CmMXYPDqJVPEwF5TZ3y
 ZCKwsymztu8NLKzzbs1BQDR6pL/fvh+Yovp41dnMjovqyGVmAYXy3MIgPqTzwLPk1wrmKHl8m8g
 AxloP8PB//SkJSp+VIymU6SAxhGhO0JXhJl5XEfe7jjUJ300dqEtOAsdQkuEQY6VXOQrMHdujTZ
 TzhnJo8vbx6Y8feHobR9Ul198mJaD6sByn2gl1Nx3hz0agUN4fz89Ib/uriKpBkyw0bphKs4BCH
 6F2aseMw4Rz63piHMbl6uMOjKDj1MQjMst0Y7wY9dzILiLWo3F9doQtjkidi6FiRuwyFSIjy1uY
 Zp3jCXTLAIjW4HUzdEw==
X-Proofpoint-GUID: akeQZeeH5pOKxqZx6xrcXaOrCJ7z-0tI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_044834_404166_BEEFD915 
X-CRM114-Status: GOOD (  14.38  )
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

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/remoteproc/mtk_scp.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index db8fd045468d..328541e62158 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1287,7 +1287,6 @@ static int scp_add_multi_core(struct platform_device *pdev,
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev_of_node(dev);
 	struct platform_device *cpdev;
-	struct device_node *child;
 	struct list_head *scp_list = &scp_cluster->mtk_scp_list;
 	const struct mtk_scp_of_data **cluster_of_data;
 	struct mtk_scp *scp, *temp;
@@ -1296,11 +1295,10 @@ static int scp_add_multi_core(struct platform_device *pdev,
 
 	cluster_of_data = (const struct mtk_scp_of_data **)of_device_get_match_data(dev);
 
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		if (!cluster_of_data[core_id]) {
 			ret = -EINVAL;
 			dev_err(dev, "Not support core %d\n", core_id);
-			of_node_put(child);
 			goto init_fail;
 		}
 
@@ -1308,7 +1306,6 @@ static int scp_add_multi_core(struct platform_device *pdev,
 		if (!cpdev) {
 			ret = -ENODEV;
 			dev_err(dev, "Not found platform device for core %d\n", core_id);
-			of_node_put(child);
 			goto init_fail;
 		}
 
@@ -1317,14 +1314,12 @@ static int scp_add_multi_core(struct platform_device *pdev,
 		if (IS_ERR(scp)) {
 			ret = PTR_ERR(scp);
 			dev_err(dev, "Failed to initialize core %d rproc\n", core_id);
-			of_node_put(child);
 			goto init_fail;
 		}
 
 		ret = rproc_add(scp->rproc);
 		if (ret) {
 			dev_err(dev, "Failed to add rproc of core %d\n", core_id);
-			of_node_put(child);
 			scp_free(scp);
 			goto init_fail;
 		}
-- 
2.51.0


