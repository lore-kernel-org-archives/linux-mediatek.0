Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5667FE75448
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Dec 2025 11:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rKB0ZHnkwf6Y2wczw/UUFqJ7E2A7G7owFdcy+1c9S4Q=; b=Io9vwGQCaFAem8pjUFci8+eJsv
	+p1JAbBR12VCq9yKd9fvtQMmatnVaqOnciWglxd+R7tf9XUwTl09T3Z0oADzlKiheHdWNvw0k/Qnn
	gYi4tDwORcsmekHsydHE+dbAQjEaOzFw4Vdcwlf2Dc7glvT3lX2ACxVlKLo26g55F+O4eRainE5yk
	s2h0DKKX5r6PeohMTCTjdIUVIJaBnz0zauF0o5JGLHoBjny9qVDIdEwZ34Ds62jgmzomxLTtf/yCK
	/mzETnV53o1Ey5fQqjvTWH99lu1WD9Yc6EZOp7WRulP389w0XnstJJfFOsCZQfKSggi13pRSrTrCQ
	FVUeJgsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYNIc-0000000GlEU-06p4;
	Wed, 24 Dec 2025 11:45:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYNIa-0000000GlCy-11kM
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Dec 2025 11:45:01 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO43QNq4134150
	for <linux-mediatek@lists.infradead.org>; Wed, 24 Dec 2025 11:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rKB0ZHnkwf6Y2wczw/UUFqJ7E2A7G7owFdc
	y+1c9S4Q=; b=E8CA4D1UuhOuoHQ+cNdwvXszaBEN68lTundhrOddPFLnopjfYB0
	7Gp0pGmqHIWZMoUV4Ok3iqcDYXrisNQqQof1d9CrHXL/MUfnRUQuClNRUa2QYEid
	M2UvgQLLZkWyCeOvePBoOSZ6A7blE7eREVvKwrwHdUhznWHglYAKsDKpJdd/MxjB
	4giNt/aF/s9p9A9MCiANRsLq+OXXk2m5Yk2qZvt4dk/hTBkJmjOopS77XBLVVNG0
	Wcc7gYuu19fzBvptyH/RyN7rpgJhCaZc1Ze3xaTMaIQoVcux6jfEDDTJwwYjZlxk
	uH7Zfze6fKaVXBfA6iWqvqrYh8VAzjobNzw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7x46txgg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 24 Dec 2025 11:44:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee416413a8so63925281cf.1
        for <linux-mediatek@lists.infradead.org>; Wed, 24 Dec 2025 03:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766576698; x=1767181498; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rKB0ZHnkwf6Y2wczw/UUFqJ7E2A7G7owFdcy+1c9S4Q=;
        b=eElAwYrLiRY59vTpXuI19fey8wg+6+ofrRqKfC0A2YoZcD6V2TEjB3obHHK8kv/l0A
         PzCqQqNrzoUJIr1sEulJRusILH66z4PXi5dzzCM7CH3AOTlsA3CoDSjwpRa25dNCrto0
         TwOgGTQbe49a/6D3Tv1n9KzbLE7SFfOh8PgB+L2qGWD2V2hO45zmVA0R4hX+e46jAteO
         KAGijSZ9zT2RuFep1fIWmTXp9AarqoWmQr7O9j4qJ9BDzZ5RMV7SYzTCJpL6OJCkq95m
         8KWOLb2zQqd8jMfDIN9Pu9iRla8QKpU0m5zo3/UObE0AVGgq8pwPFNRUE6qlPNQXEeVd
         Uh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766576698; x=1767181498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rKB0ZHnkwf6Y2wczw/UUFqJ7E2A7G7owFdcy+1c9S4Q=;
        b=DiDbVBmxKmBbJc1PAME5EYGQvS6cVPNvsSC7ATIfPVtoPnqeGcOVjYyCAZi8IiO/xP
         PAGnZ0NG0AFSYA/MF5pLSB16Slx59JJtq3sNCKnbS+zylrsXRWLjJNPp0KDESxLds2Wh
         3ujFIz5WOFnN8iz6mxp0MmbEbPELnB4oa89TbLvnXYxgkHEpTSF00BuyAzSdV8tGQcFg
         ZSFFnBadTvIgs4FIkxSQnZAJYrfTC3GEXDGi1/tGWNBmpvCabw/EoDqBwd0AoJvWUbCH
         TuyjxKXfhQjeyghdWiHP/mcOgbm+QlgfxxJfZaR1UhiOfVeeUD0RXvnRRv4A19lRjZac
         F7xw==
X-Forwarded-Encrypted: i=1; AJvYcCWgV3ioBagYyWJBo4vqi32H5zyGOuBllxRgkas/ZDjXqOTVUlgSvshL6G2ft53lGjTla9jrxqnyrzoc22+x+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx05ARxGVjGU8zG+eD1VWvE/iatQwzTFpKra3kA6NvyotiLuWTA
	6eeAFK0Ra3HTU65HH9JuQtVc+SZISpO6cIszcV2D8bTaE7yb1tBc2HFRAdtF4VkIGv4VVQw+7H9
	dtBAkCDqTa7NHoNneAmrAXYgsde2jcMxkeb7ToixxcsqjOu3PbZq3euKqxnqtQBOLT0XSYbP6g9
	A=
X-Gm-Gg: AY/fxX6U28t+4/6fBEuUKSlm1qfRuj0qw/7SITDRNTIkJDn/3kd1SeeijDcwUUe2Wh7
	fWGtY/kBeMN/D0CZMQi8MIkKapr6Wl7+NfBg6Tfcs5jcra2ensWwFsyOxHL+kuYNdmMlduK+zJA
	q14gXOjd+z8VCiH2cMzmIhfsNYC3t2tYZWYFSK3w4OjHpiYTot/O/RpiTX96M7JLsQyAaWtxlDM
	htV6uMHXU+1RnQQ98TM3TPvvtcmduGcYbIfgrC9LCRV649soq45yo4vkCelMItY/4wN597TyUmH
	CDXzmatae/EdCM5hYTxBXXqS8dshJmXoDLjUm6+sKz52lXT6juH1DxjcsdqgfkIq+e9h3AaEOXS
	evRi9jQVxedpGGjrkoopc/KuZP+p/q4f7T+5DNzIIe0tPth70ETHm6XaoicbfbVd2gLVJBw==
X-Received: by 2002:a05:622a:1a8d:b0:4ec:f477:60e9 with SMTP id d75a77b69052e-4f4abdc5da8mr238513231cf.76.1766576698417;
        Wed, 24 Dec 2025 03:44:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEhTkGm55A/nE6si6wdCjN6fCoRIzPuA/cZwt/40Pm/zBYW0k1P28/mQ+1m7WUxVlIoVPKyJA==
X-Received: by 2002:a05:622a:1a8d:b0:4ec:f477:60e9 with SMTP id d75a77b69052e-4f4abdc5da8mr238513011cf.76.1766576697995;
        Wed, 24 Dec 2025 03:44:57 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ad83dasm1799758266b.25.2025.12.24.03.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 03:44:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] mailbox: mtk-cmdq: Simplify with scoped for each OF child loop
Date: Wed, 24 Dec 2025 12:44:53 +0100
Message-ID: <20251224114452.141689-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1843; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=AdDQ0+wWEZ3WCutSHsj0Ow/SsvG34dRLviYC7A3U/ws=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS9I0MTNMq7Mg5nwcRKlf6XuMuaViMmE2fnsuD
 ppG8htTZ8mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvSNAAKCRDBN2bmhouD
 1/MAD/sF1zenvMrBTSPRNFkzXZu2JFUQR9YslQUYwpTP2dX+U37MoUPtrHgxvycnmXIrHl62l0/
 l8AvVUNPWoSdNHCS/mjI1xGwhB2vX7Ntianb25b4x6mFyFccGEz1o8nc1ox9St4vrkatnDGS8pb
 Yyz5RGDiAZeW8b311XlmeyDXFY1ZwFPH5C+tHHLwqNLktIUxwWdY0gE8svcsk1VnuhiO4isdes4
 xbcgigXLmf5CDP149G2lG0xrKLRwq+nhsr5xADl9KK5oy5PP2l+0oeBlW0A6mtmTNAXrscP/BKg
 WUHhtwlb7SAY5tzq2JOMREel012Dfcpi+nGX8kaQuHzJL0EKDqx2Lyc+XfP8aKHorr6bmjqSowf
 kDfyGsd4GVKMas/s2UJq7Y0LUmiFughyslWgU3uw18wlDavbq9LgPgtx7+YLPzuwbJjMjkxiz1a
 cQPIm5aVAYlQG1jIFrNy1XphNHyV5gXKJTxpL8MSlYjBuOzAAdbIn6aUyzB+f2/dUj5olFS0huH
 S48X1TBn/LaScsQIAQz3GaaMbd6gKmA6fPUDt7HTIcVMfU2fEGvUGO92E2C1x1yx07aV++6FYRg
 WxO2nT4+78TMLNaz6f4SeD1fCdRH9ZrlMhyPEkjoVFHvubT7RIJxCOhnaRb52nVsPbBHws+ziuz AzMNV221ATopF9Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: KzLwMuINE8NVI5d_hRKhXWmL7gMJ5Efb
X-Proofpoint-GUID: KzLwMuINE8NVI5d_hRKhXWmL7gMJ5Efb
X-Authority-Analysis: v=2.4 cv=aOf9aL9m c=1 sm=1 tr=0 ts=694bd23b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=AcbTN0EqnTs5jyReABEA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEwMSBTYWx0ZWRfX295o3Bt/1MnA
 PZ34ZNYAJHM+QizeJTr4CCcCDLZ6z/NTZtNMUvg+os5EWHjVlrDczRr885Y2kdUWDoHzuB0Xv6G
 jBT78AU243NRiKXKsjXIeWQ1dXn4fqiE/B/2Nd9pmF6nC1FzeenjxS5LVcHcU5OqVPjTjnFyNAJ
 aptaHCJn2NPNSAqnleo77JceOWKCug2gefJOnmY00S6LdGfh8GBLqglLNP0M2owceY6ur30wMQe
 umxfDQszCtw1K7lS2xLbX8Ie9SKuARz02AvnXF5M+p6a2YhzxHKj52x/HOuMghxsGHDSVNeeNBw
 iPvpli7GSAiRNN+3fN8LQ7WKaRBdZ0PRsAy0sKSBfQ6Tuih0fbQ7eeF0qY54x7z8rsN54ZZS/Ns
 mANdHtz9wNDCkt9iJRMV9sQ3PdWk156M0U7apj/pJ1KWwRlP0QMfMIb0Jw7cvXL4USOh63/SJbx
 w4jlGVX23w2/5S4eIHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_034500_284508_B491F6D2 
X-CRM114-Status: GOOD (  14.05  )
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
 drivers/mailbox/mtk-cmdq-mailbox.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 1bf6984948ef..9da16b30eb41 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -636,7 +636,7 @@ static struct mbox_chan *cmdq_xlate(struct mbox_controller *mbox,
 static int cmdq_get_clocks(struct device *dev, struct cmdq *cmdq)
 {
 	static const char * const gce_name = "gce";
-	struct device_node *node, *parent = dev->of_node->parent;
+	struct device_node *parent = dev->of_node->parent;
 	struct clk_bulk_data *clks;
 
 	cmdq->clocks = devm_kcalloc(dev, cmdq->pdata->gce_num,
@@ -661,7 +661,7 @@ static int cmdq_get_clocks(struct device *dev, struct cmdq *cmdq)
 	 * as the clock of the main GCE must be enabled for additional IPs
 	 * to be reachable.
 	 */
-	for_each_child_of_node(parent, node) {
+	for_each_child_of_node_scoped(parent, node) {
 		int alias_id = of_alias_get_id(node, gce_name);
 
 		if (alias_id < 0 || alias_id >= cmdq->pdata->gce_num)
@@ -670,17 +670,13 @@ static int cmdq_get_clocks(struct device *dev, struct cmdq *cmdq)
 		clks = &cmdq->clocks[alias_id];
 
 		clks->id = devm_kasprintf(dev, GFP_KERNEL, "gce%d", alias_id);
-		if (!clks->id) {
-			of_node_put(node);
+		if (!clks->id)
 			return -ENOMEM;
-		}
 
 		clks->clk = of_clk_get(node, 0);
-		if (IS_ERR(clks->clk)) {
-			of_node_put(node);
+		if (IS_ERR(clks->clk))
 			return dev_err_probe(dev, PTR_ERR(clks->clk),
 					     "failed to get gce%d clock\n", alias_id);
-		}
 	}
 
 	return 0;
-- 
2.51.0


