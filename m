Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57343FA3741
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jan 2026 12:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cAff9gnFS+dOPd2X7i6ToqeFlIFtjLLYTuLf3JuMu84=; b=LtdVRF2DL5IN6R8iEZ8uk1/UnJ
	nplnD4RfjCcBhIusmsCQp0KalTJIpPO8pqDJHIjvzCNzWbaYHH6pOWPe+aU9y8fhgEmoBi+fuvwZn
	nYU9LEUGqRAOadK+PlhHht+Tf75YTIIvNxCBmONTjrlV+9YT/tgycMxujMP8OrCECxeIloebog1p8
	j0lmEHnErJMO2WECnOSSJmEo5AM36J+MxhYnQhZtRIZ6q2ecMhWq03CJAh25PXmOHDpNsj7zFr0ph
	FA16iJX5UpOVVn/NfpKXsnBap9AH1o1lSgNynKkBVA06CuG2osgBSfX4rsg5o8EgqQe5FiOZ0EFvE
	TBvQpeFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbea6-00000008DWj-1zsD;
	Fri, 02 Jan 2026 12:48:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbea3-00000008DUC-13ur
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Jan 2026 12:48:36 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029Vwbr2310156
	for <linux-mediatek@lists.infradead.org>; Fri, 2 Jan 2026 12:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cAff9gnFS+d
	OPd2X7i6ToqeFlIFtjLLYTuLf3JuMu84=; b=arGyuKGmW9q4VINX3ZhQ/GjdfuE
	ZGLuvDa57qe9W1z0oYoe8mnHnIM6ucOLc/HqS74TODNt6TiBn10ciTBxeo4m4sKR
	Reo1FvhI1pzRiQGFnRs1aVmrUZCr+ZthcKthdAlf4fFl6xHMb4uH2BHL4dFCPlgd
	C54IHjopQhFpBvdX0gIM59AcRnsNDJ9iX31aTpkqr4R6VBQQlt0N7CS7rORCwvE2
	EIQzQg4b0eWkUYOaAY/Uj9QTXf979UGPCciqunc48HUkqrYxSHyYy1/E+aEMI+s+
	XIxi1Bl910ieMWus2NuDGHjnHcTTTu922Pi6l+swCOFFZLadx+dFgFXj2Pw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bdsc9t1nv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 02 Jan 2026 12:48:34 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a3356a310so335315116d6.3
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Jan 2026 04:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358114; x=1767962914; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cAff9gnFS+dOPd2X7i6ToqeFlIFtjLLYTuLf3JuMu84=;
        b=XdhoswUKONsjbo7musuKMz69tIvVDQLpxiMVQW6FQtcyPui207orHm0BpT7Q2h4PW3
         1gGiKgDOmB1z+NDPoXkL7fLuswiriMwt6H1IYdq9ZgzaXgD2UI9fcV/8lZF3D03h5iZ9
         Ck9eV3vDWs5qMWQ2rGaDl0iT29F8O+1/GQROe+Z+PsQhdwHYBBqkVcUQn32nCOpx8nFC
         fPyKKYL2AOZGJKk6XMTMg3u0W+URiahwi/Feq5sDleru0UuaABktnf7jbl9ULhPpbXEw
         wqlVxD+eX2ojslzESpDQ1dsvcF9Av9gBBFGzzEFPSkM/YwrxUMlDe5RvT6RztT+973Oy
         Tzeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358114; x=1767962914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cAff9gnFS+dOPd2X7i6ToqeFlIFtjLLYTuLf3JuMu84=;
        b=ElkR5mXJgtnMEdG8K6UtbdeZgfN8CbHUg0V5b7yOK8Jgth6vmP9+/rzZrQoOaqZXC+
         CgmKrCbqHJVgwcdw7oYHV7iC6b2WXrml/PiWSOd6lQQku8PFk5D3oWaP5c+1xxB8TV/9
         +qM3EZDMvy9frIJGjar1+Dh8KZ865dCzxENzEyZl0Ekt0NbsFhLFvfy4vIYpua4C/zMM
         hFbSujeGpB68hIL7/UCr4GixUJDd89y7m9TqmbyAmWI3EOXibqIgtBhFFkZfhB4OHuhe
         t4Z8+Lu85n62kzuBlEpHwHdsc04cAuSHI+vOZmapPIsQS7M1coJjabJrpg1jT7m9lZvE
         tdnw==
X-Forwarded-Encrypted: i=1; AJvYcCV5Q0tljDMfCfTyXNLhtdJT9nDitImp82C0oPd2M++mx/tEyni49S+n/T3hKIcRuk9JSi3zsCzLEw6EfwHc2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxrpkEhtDWWsJe0eP+AXSmk6gSOUwOebjF0SH0zQ+bgeq8lUj4i
	rG9dnMMjJxHehV48JhYLTsB98elcvFZc3E+CUkzE0nhSwOI0OGqidmJNV8vmnFmydrn1vZKCals
	Gxat0+RfEcmqm4xao/ymduwU6Y4WSGtNy+dRlxwLdfy0SUT33TCH2DkFEbu0knuhJhYWNVwaZyt
	g=
X-Gm-Gg: AY/fxX41atXjR2WoIA0cIahYVDvYJraCYSALVPzL8iYQ+JbpBnHSEKcclFqxayz6Sjr
	Sd1oVtkcypXrzskO77gVEE+u+jIvRtOXeosgcrRsvdtxxxY7hc4YUpH3bxuALB5bBCo5cZ/BTdr
	olabW0G3KVKBhpqUwxG99F25X6ymDU8xkDKKoqqSmVrJWOzP15Hj75H0GJt6L8anJkMjQYk7XGK
	KUNYbq0VT0XwH/ogzB2IzV91Re+Lfge9C42LArJvWC9+xHMUBZ1EVSp6x98RCerhFbD7xu+BW+d
	V/D0YSKWrtyhaxvcKmxlG/g9sFTlH99zqmpVV5ZmryPNlkFfP5WCZg51hucI1u3w7+Uopmmok4h
	R1bT7znU4GgPxBO6foRV0b7JS6A==
X-Received: by 2002:a05:622a:2513:b0:4ee:7ee:df72 with SMTP id d75a77b69052e-4f4abd05fa6mr593342611cf.28.1767358113816;
        Fri, 02 Jan 2026 04:48:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHK2STp8WLJC5Hle+lF4ZdajxaBdRXfQ51qO9YgGmzuFliirENLuJlLIuKhEehVcC03kPN+Jw==
X-Received: by 2002:a05:622a:2513:b0:4ee:7ee:df72 with SMTP id d75a77b69052e-4f4abd05fa6mr593342361cf.28.1767358113417;
        Fri, 02 Jan 2026 04:48:33 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be27b0d5asm802892105e9.13.2026.01.02.04.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:48:32 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] remoteproc: xlnx_r5: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:48:29 +0100
Message-ID: <20260102124827.64355-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102124827.64355-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124827.64355-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1914; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=QahWHckkIWS/P48btoPy5/mXnEzZmMEtu+GtZ6JhcPQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV76ce0/L5LUrLoAxRfFA7ZnpbXrAEmNsseTBa
 iz5XUAWaBeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+nAAKCRDBN2bmhouD
 1yLHD/9mE24y+JYa3Q0sp01pz5zpq8USEciHpgx2fo03B2s4dO+aQPgc2VfsMZ6cxScJFcr8LXO
 ZoS1j1uiyihJBu0YPiwUnP06uS8/1FT9EjX08Kvjixbup6OM1k9P00yWR3caaltKsKL3b4t20h8
 I9akD5xr0sqDFtTMSYfDFHf4xfp0g88GNKdYPYjkIfVF7nOp8KiDPnI2s7CsTuZkd7EEY81tPSi
 g2t6283gz1dLRKjJxIu1ixz9Jv8rEU3uNoPytqETerJCg3Rit4Qq0SGQk6S6fbnczQ6IZhvcABA
 iyS3/mjJ0iG3LMXJnL47viO4/Yc/5dNRcSQaYwvjYjNMgcEPhdEZRr9sRxO565g6gkEfJ++HyI4
 JHhkCyGMCvbWyOwJ+qIO3kZMbj3XGY72OWLUb+zIePvZqVRRDaccrfAjHP9K2U6sujsLTL8NnUL
 zskfoSFb+vt3E/LmyEV/519GXcqpjeS7y4p6J5tu+WMDsTFkWktxNpP4S2NWNXp3EoTfFmQCgvq
 YV2xjBZRHA4PSKIN/cdA9pNO1kL7BiKbvJhEO6cI8J3+vDH/oyssuOaS/jW0Rux69D7ys8JIyvP
 d00iB8RDkBm7lA8UjUzK6Wz6qs8gQX0FfEJMqWjKwQnLw+x/8oVuscZGC8M9hxeo783A8wFYEyW AWIcIZckiZ6u6Fw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: djVkV8ut5nwPe5Vdx-fRCGCPR7KQ491e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfX6w0W+1s0NbjQ
 5IR8rzOxoNl793D2qMj6z80ZsU2HFmoEybiq3hJJvLqBIv5kLWh5VD0KuQVpOvB5EBsywJhyNjK
 Y2nzADBoWI+r4cgbs8POsTGWiLovLTwDH3cUJwmt2BLl6IYMd0ZlkSkbZjU/bYTikobCaQHsc2V
 Kk0E9f089/mDLXaAMinLYvu9m1g0mOIDsY8J6Qwn6fH4b+H8vTW1fZ/CR0/Y1DPd5lhgs1PnOPD
 WMMCbZcpNPZVAUCCRkS63bZS6bU2uSpVktWRhatOl+g0PpbTMtV3c4obguZrMUoIxuhrqv7H+bd
 C9RT5ks1agPMg5/Xfl9DAIEaLNYH105EnZWVosvdohb/ZWiNgaHgqpxTEf5gGyz6D465Nq87RCo
 +PIrNvC/0Zx2hauWMykeKAskKioFXJqpYOmhaDi9SgaBi4NG7lfFr36s0d/qVKazti7vi7Lnguy
 5ANjy5Z6SltLv8An1lQ==
X-Proofpoint-GUID: djVkV8ut5nwPe5Vdx-fRCGCPR7KQ491e
X-Authority-Analysis: v=2.4 cv=Hq972kTS c=1 sm=1 tr=0 ts=6957bea2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=A_p-vGNwsLgjMV31XeQA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_044835_293437_98710A43 
X-CRM114-Status: GOOD (  15.01  )
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
 drivers/remoteproc/xlnx_r5_remoteproc.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index a7b75235f53e..bd619a6c42aa 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -1271,7 +1271,6 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
 	struct zynqmp_r5_core **r5_cores;
 	enum rpu_oper_mode fw_reg_val;
 	struct device **child_devs;
-	struct device_node *child;
 	enum rpu_tcm_comb tcm_mode;
 	int core_count, ret, i;
 	struct mbox_info *ipi;
@@ -1350,10 +1349,9 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
 	}
 
 	i = 0;
-	for_each_available_child_of_node(dev_node, child) {
+	for_each_available_child_of_node_scoped(dev_node, child) {
 		child_pdev = of_find_device_by_node(child);
 		if (!child_pdev) {
-			of_node_put(child);
 			ret = -ENODEV;
 			goto release_r5_cores;
 		}
@@ -1363,7 +1361,6 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
 		/* create and add remoteproc instance of type struct rproc */
 		r5_cores[i] = zynqmp_r5_add_rproc_core(&child_pdev->dev);
 		if (IS_ERR(r5_cores[i])) {
-			of_node_put(child);
 			ret = PTR_ERR(r5_cores[i]);
 			r5_cores[i] = NULL;
 			goto release_r5_cores;
@@ -1383,10 +1380,8 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
 		 * If two child nodes are available in dts in lockstep mode,
 		 * then ignore second child node.
 		 */
-		if (cluster_mode == LOCKSTEP_MODE) {
-			of_node_put(child);
+		if (cluster_mode == LOCKSTEP_MODE)
 			break;
-		}
 
 		i++;
 	}
-- 
2.51.0


