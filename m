Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E530C624DA
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2026 19:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9YC6YErE41l8W35ksQZbtiaD52ARA7MPQK738ggjJaM=; b=tpCTav1JWDeQuDdaire0kQ3vH5
	68MfZjwRC6u1+egwxrN5xvQJvsZTvHs77DBVSt+LxbOzkxUXS1CZTyGAFHCXdraxCs9mnpG20dz4T
	8Sl6hzVn7nqdHmuHTsjnbMvmWVj123y/bO1aC2ZVYXXI21YdZiDJYJq5PoLSs4kULK6N0egS/nWjZ
	IW6gru2H+g4RBOEgadete/pN2JI42fDPKvYzHuTTmmY/OgHK/aQ5RAK9DYUjXT7DnIqBezADl4ywT
	Pg2+YE7pP8tCwXvKv0DZByROV6zT+19A282rlvajccGgvf/+Hve0h8vmYfchL/mCMBbtdq0BQPoX8
	tSb1LLig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qiW-0000000FiTt-3w1Y;
	Wed, 02 Sep 2026 19:33:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qiO-0000000FiMB-2qVk
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Sep 2026 19:33:46 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hr8JP2105094
	for <linux-mediatek@lists.infradead.org>; Wed, 2 Sep 2026 19:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9YC6YErE41l
	8W35ksQZbtiaD52ARA7MPQK738ggjJaM=; b=OX4JQ/1cNTWEywLeOT9AktduM0d
	Pcj7mQhhCAiB1R60vhTbqpbcZP3xNDeRyBzV8y+VDoIiabCtck7KBOmtq9gb0rmj
	jzPRkPY+IDp2XTnOcQ/9EbSxLcMNg6a53uqOaIm6pVe9/Bu4M604WtzEiO6Mwfnl
	jNlO+QQtoib6crXTgjSzwQMj6YJsZuD89OdoaPnRjeYmuYg4Ga0edOT8d68XQS4J
	1k3fXYW9S6PpiNtiYGmwo8CxPQTOKDrqNd2iX0NKCDrkS/oyzrdOtEGk18k2UvYe
	FQwwJGXpHzwKM+sDFGJT3eYmL1dVU5vYU2hoLV7CnXqSnyzs2uRXFunoICQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdsa16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 19:33:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cee1ec30f2so18630335ad.3
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 12:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788377623; x=1788982423; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9YC6YErE41l8W35ksQZbtiaD52ARA7MPQK738ggjJaM=;
        b=BCi0ZPKHFjkR0wYIS6QZ/clrsARCDhUrZeIg+iXeOJxXXSty/RP6nZKYRg1+BHXWkL
         J3fNPgLPeaTvco8QnCOkVd3TmZ3fUyAKo2bcLZDXrgQlzZmSL6kc9p7/yjdu+JrhaZ+T
         8Rfe1Ey7EHP2j4mcPviDwbqn1f4HWwfIamuXU9IBiO4IC7QDl1nTKOqFqWgy/ci770l2
         yO/CQTob0mXO+y6SGMf5gJ6Z0O5NQNYWAJbHv/BHkkqg9xX9RcQs6aMQnlwWhDkcZhp6
         ql4yo26tqtCGCoaMbXsUHWUaF0ZYlBxeqwbUO0mOR6bdGiCzRyXW+CClJKK6l4cyNFaA
         b1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377623; x=1788982423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9YC6YErE41l8W35ksQZbtiaD52ARA7MPQK738ggjJaM=;
        b=TWN5I4eXWzfYW8KLLpRclKWd1oZGRB/k40QdNgnEHljqp5WgGTpP0Z4i158yNTmyyM
         MWfyGtUJ2BHMoU3v1VEJJHn5jIKLQ/a1rgKgWqMWzhH1L3fl2/ap5lnTZDatQo27M9gs
         fgys8j7yw66zSJ4IrkXWvpNqITeh4JiYEV24ojC4TV0Y1gEWJSJSNgBN8rzFYCLce2Vt
         DHkCpZPeBZ0MFYaacEd6BwQaDdG9EGNNMY3ahpT9S+c1/fn9h3qjhJWxaJ/MMaYYGFhx
         zKR9z/3fqA45E0x0HBfcp7mlJ2om0VxFZ6B9JZrGTKA2zU5Z5m7Xd9bPx4Qf1g5GPKml
         Tkbg==
X-Forwarded-Encrypted: i=1; AKwUvByRJArN/sNMkHeJmqbBFbsvDcDLgfZllS/8DR7EfQ9WiK/r2YeN5qqs/ludl1eifkKEQ6Ph41EmfqzjTGq1GQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mCUseWT1nu3HtHPlzJO4hdtnCG7JUWRWSV06JQbefmBs+iKEqD
	FJSxGwBKlvrKSwnr9axYNpegcn+fofxkyN6uOj3s//EtOPQEmyFwLY/44JXth+w6wCG0/IkaaRR
	pyHaJVzBFI7RTsYvN+WN1+rAEQ4Truz+mdvD+w7CrfD5npwGtZXtb4GM1irxMepXzSB18BGPjnh
	w=
X-Gm-Gg: AYBFou2BfEAO6aGoQD1botbs3/muh2tecQZhHJG97JibDSl7p7LtfkqrNnhyLWJsD/P
	t/RfyESFn9RNf2B51NrxgYwxTOTDYhthq06/i/lppjRSlxgU46hh+TundLdMe1Op/LsIZKe4Kjt
	3/pYRjCpmJ81WpZFin7KvnXE4b0cSpJXGyaLUTBUJnLU4e1z7edUYYBz2OqgZZirkaQXVJsz9Ug
	BD6Ike+tb0kpFIsXl+bR0Ke3oaQGDAJ0sciZGmNdPOzKYyV917HV4AkuoTrMPG0ObKdXJwVpiW6
	WR6G9VOtgsFyfPzocNzwG3ZtDrXUgJe4VqbL4gDgqquYsU+yvB5SEDq23apynstky9MOIty7xse
	kH0cQNHQRuN9TwILxOLdecjYoAsc=
X-Received: by 2002:a17:902:d4ce:b0:2ca:2079:91cc with SMTP id d9443c01a7336-2daec60cb14mr93566775ad.5.1788377622605;
        Wed, 02 Sep 2026 12:33:42 -0700 (PDT)
X-Received: by 2002:a17:902:d4ce:b0:2ca:2079:91cc with SMTP id d9443c01a7336-2daec60cb14mr93566355ad.5.1788377622059;
        Wed, 02 Sep 2026 12:33:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-332501e5447sm518103eec.0.2026.09.02.12.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:33:41 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 3/5] remoteproc: omap: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:03:16 +0530
Message-ID: <20260902193318.1996827-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902193318.1996827-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902193318.1996827-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a987a17 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=NeIE-sOIGFWZl2hhsKQA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 9QknHo13kGEf-d0ywchFgsDvOaQQ_sMy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfX9VbGs52NKFJi
 upkF6jfAMMBjIAAho4Xwz6u+IlNjFfd6M8ZX90YgLSzy/1NMq+IaYLu/wqAao7uTVUhvwKzMsJB
 8yMN3mR+L3ll4BhhVXXpEtoWTN8NPFWao9oKf1mT1AfekRi97VX0pMKN8MtlaBi9XbHiXJLJAp/
 XoYkO+0NQs6Dvqzdt4GAvrM5pctQxItjN+wala6iM/pAMeFfj8hAJobEMJnoKnK/p5lcVloRm6s
 tNSxLJS8qgZooDSbU6qArmrUn+FCqxPCDyaehzZp/4R5JTbSKUvnc8fv6AOsb09UCFs11HF8rxJ
 QFmq2KPEGnRuO9HdGq4OjQ+EGlis80bDihn4Hib0pJTs3z3iLjWihPAcFzTDWyB4bBmU29uCnlY
 ZDytmYapCJnHvvcFjEQFk8lnDSk+duq/M6dL7p6ZuO1abHb9NkIC7bXlqKPVPKoR6u/bCNYpaMf
 LWtsuRAn4JYkiHHheog==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfXyD//nEMv4hjw
 JuEN9qXa7K/qtf5ewP/uMnknIIL7RuMTp3rem94zPoQ1tavyXvfEB5fAEMV39ZuJdBObaUHlaSJ
 0ZPNVWd8RS1EaC6B9Fu5mtr0ix1iRDA=
X-Proofpoint-ORIG-GUID: 9QknHo13kGEf-d0ywchFgsDvOaQQ_sMy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_123344_865639_3DD21232 
X-CRM114-Status: GOOD (  16.29  )
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

Replace the hand-rolled omap_rproc_mem_release() devres action with
devm_of_reserved_mem_device_init(), which handles the cleanup
automatically. This removes both the wrapper function and the
devm_add_action_or_reset() call.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/omap_remoteproc.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index 6ed0f28edac9..74262f873d40 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -1276,13 +1276,6 @@ static int omap_rproc_of_get_timers(struct platform_device *pdev,
 	return 0;
 }
 
-static void omap_rproc_mem_release(void *data)
-{
-	struct device *dev = data;
-
-	of_reserved_mem_device_release(dev);
-}
-
 static int omap_rproc_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -1359,15 +1352,11 @@ static int omap_rproc_probe(struct platform_device *pdev)
 	if (IS_ERR(oproc->fck))
 		return PTR_ERR(oproc->fck);
 
-	ret = of_reserved_mem_device_init(&pdev->dev);
-	if (ret) {
+	if (devm_of_reserved_mem_device_init(&pdev->dev)) {
 		dev_warn(&pdev->dev, "device does not have specific CMA pool.\n");
 		dev_warn(&pdev->dev, "Typically this should be provided,\n");
 		dev_warn(&pdev->dev, "only omit if you know what you are doing.\n");
 	}
-	ret = devm_add_action_or_reset(&pdev->dev, omap_rproc_mem_release, &pdev->dev);
-	if (ret)
-		return ret;
 
 	platform_set_drvdata(pdev, rproc);
 
-- 
2.55.0


