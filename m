Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B86EB8FB7
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Sep 2023 11:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3ADrDgev14r5OWCL9x3U1yc8Xe/xKR0+iOVCoQWm1qA=; b=xDijclKi14oPk/tokq8wGDNUbR
	5dGuFIoPo0u9kAJ2e0HJu3kMPbJ7cAbIEYwxHDYJhuqaLaRZVOlt3+u0dDyEP7eviP49YKn8MTSUV
	mxgE/3y70aoi2/ehvpBVshmC43zSfDlDNRs4vdWbLttL0o98n+7iyvyz4WZIrzhbnTypCw1op1iHW
	KeyjdzxkVgVnpfdO7xX7PIBiKdD4k4CrKELkTUPISex4h3pKnckVDxjKlEVbeX2EhL9bYRXu/h4z+
	t83oydElRz1F77y3jIA7O6sC7MyFbrvIBv6lpMcUKMaFe0kQnWbFgRR6ECjBWRoP8oL0qUDO82HNd
	7yzj48fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdqHF-008PfQ-0m;
	Wed, 06 Sep 2023 11:00:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdoDP-007nO0-2n;
	Wed, 06 Sep 2023 08:48:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=3ADrDgev14r5OWCL9x3U1yc8Xe/xKR0+iOVCoQWm1qA=; b=qEOhf/n5mI1bQLVkO9voS2mv3h
	YMhkU0sK0GaNwFEmMRKPKEN6n/HV1/d5yov2HmS4kjbtmB7MVPXGNjw53LLQ6zDa1WQeVQXfPILVs
	QZNAfrizn4o5kWeSB6zP3hCjh/3r336+QTOETdzhwzzc98FPBBSNZ1l00rigPDYIrjGwljf3o1uH8
	AVr+NU9K84TF33yi98UJT9/4GwXDGi8sMLyjcqsc0IVb2nhf/6XH3W7x/JWHY9divZj7n7L5/vR8C
	nAwR1lQf9HKyaKnUcqSu6BRYOKuzV3nXcsD7ZeMXWEZOypnfAzSRlxKESc0oeiFpbeq556r4BV2TF
	ke5xPW+g==;
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdoDJ-000zZX-10;
	Wed, 06 Sep 2023 08:48:46 +0000
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3868Z4nt021181;
	Wed, 6 Sep 2023 08:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2023-03-30; bh=3ADrDgev14r5OWCL9x3U1yc8Xe/xKR0+iOVCoQWm1qA=;
 b=b3ZUkFvX7upMVYvjZr9V40lhB5DjoQW3kPPZQyoumhFWhiaPt0WCCcMgOXQjlfP22bM2
 Yq1GE8Xze9Qj67MjSao3ZczReztp+M1aZmFoG49fAKsTP7ZUYow34+qsEwUwIJ9iYv+B
 k9ovCYY4E8OJDF6WTVpfWE/aqxELEPzwiFEtWZZVH1LHm8Q3dE6bt9Oje9AktzdM2x/c
 NFxxQ93BqmYRJSOWQqdjSYRcxk12lw53xIyPLq9IM7f/YKDPeDVQmOoHYJCG63hs3BJb
 RywXhcRcdl1GIS01ngXx+2QuyrOtNNjPRzEvUe+6BtWvyvUzb37Benh0z+wkNv5HKne7 wg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3sxp1mg1f6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 06 Sep 2023 08:48:25 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 3867NFA1010355;
	Wed, 6 Sep 2023 08:48:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3suugc67fd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 06 Sep 2023 08:48:24 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3868mNAh035692;
	Wed, 6 Sep 2023 08:48:23 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3suugc67er-1;
	Wed, 06 Sep 2023 08:48:23 +0000
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: Sebastian Reichel <sre@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        ChiaEn Wu <chiaen_wu@richtek.com>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
        error27@gmail.com, harshit.m.mogalapalli@oracle.com
Subject: [PATCH] power: supply: mt6370: Fix missing error code in mt6370_chg_toggle_cfo()
Date: Wed,  6 Sep 2023 01:48:15 -0700
Message-ID: <20230906084815.2827930-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-06_02,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309060073
X-Proofpoint-GUID: mBA6BaxruvbDyQa6SZnY-Fl1TQfJqhVM
X-Proofpoint-ORIG-GUID: mBA6BaxruvbDyQa6SZnY-Fl1TQfJqhVM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_094843_405157_6577C22E 
X-CRM114-Status: GOOD (  17.73  )
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

When mt6370_chg_field_get() suceeds, ret is set to zero and returning
zero when flash led is still in strobe mode looks incorrect.

Fixes: 233cb8a47d65 ("power: supply: mt6370: Add MediaTek MT6370 charger driver")
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
This is based on static analysis with smatch, only compile tested.
---
 drivers/power/supply/mt6370-charger.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/supply/mt6370-charger.c b/drivers/power/supply/mt6370-charger.c
index f27dae5043f5..a9641bd3d8cf 100644
--- a/drivers/power/supply/mt6370-charger.c
+++ b/drivers/power/supply/mt6370-charger.c
@@ -324,7 +324,7 @@ static int mt6370_chg_toggle_cfo(struct mt6370_priv *priv)
 
 	if (fl_strobe) {
 		dev_err(priv->dev, "Flash led is still in strobe mode\n");
-		return ret;
+		return -EINVAL;
 	}
 
 	/* cfo off */
-- 
2.39.3


