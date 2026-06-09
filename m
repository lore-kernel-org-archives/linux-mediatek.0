Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F1BCD8CAA
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2026 10:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dhkZeVLQqF+ONSXF+cRa8H02HY1dCnDBy0f3fSDbGfM=; b=j7LLSjeTRQ14PGZr6HY5Bh8+hr
	VrP5URjTltB2Gd3B05o+kC42Ehn7LW3p6Z82ES0SKm9l5wxRsBaTu5E8+DOThQGlEXWN0gmFbc5XE
	IlqieeY9jN3dWdJCAj3Tz23eImbGFfTvcbsAfCBsJElCU+Bj7ib+MxJvt1GbPFVGo8BWJAM5Br5wd
	ssFmHchiBvrAocDltXyXvdv4nYzNzcOHSgJSoqiiDZOFsZl3VNg2uZ7WE4WROZzxW2vFyN9WITFfq
	TgUdaltow5wSmcI8DJEFCXOfWIu9IWGyF2DZx9IvTP7uaDonTnffYB6XI4YsVinNwYxNLdZ7JDvSN
	ctjfai0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtcG-00000005LY9-03iS;
	Tue, 09 Jun 2026 10:23:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtcB-00000005LTb-1sHo
	for linux-mediatek@bombadil.infradead.org;
	Tue, 09 Jun 2026 10:23:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=dhkZeVLQqF+ONSXF+cRa8H02HY1dCnDBy0f3fSDbGfM=; b=kvnM4w+0G+lWdFGYbx1LteIyHR
	lR9R5cPwtOBBpJMBMkOv+vgl6f0AgLn7yE3CycRFil1TLllS50kXRYgPODxRXUo9cVq5FCvekmOHN
	TIrjDlCKlhUYBBbVE8tHWZ4Jy9Pw/MEl20siHEB4HTHQvc7OqiHQ45OYqHQLZD7i05d0c7/mhlbZC
	WJlq8RZNjSX4dXn6NPLNLdMG/1mlrXf+dX32XBd1Kt+R5HNsqoFZeEKPs0kQHLW0G8fms5BmD9zhJ
	nNY7KFBcjQzRmJW3DlJL4ou/yBZgyLZDKalyIsKvRabrWqraaJRIB1u4xW/n7ZEa4WARtS4kX22/2
	1Rkmp5gw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWtc7-00000002JaA-49pS
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Jun 2026 10:23:22 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599vEpk1800509
	for <linux-mediatek@lists.infradead.org>; Tue, 9 Jun 2026 10:23:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dhkZeVLQqF+
	ONSXF+cRa8H02HY1dCnDBy0f3fSDbGfM=; b=OeRapUd9EzSWMLpzlpNY5I36rc4
	aZbI65x6bZGyAyQqODhG4McT2gUUUP5CnNbEY7ylj3Mrftm1kJ8eP8OP/7Dw8eCc
	Qx032MGBwDMFS+bueFpLaz6utnJtuwzaJ/ZvFeGiJaVt2fd29dxBZ5pMIBkdA98i
	fNVUWJQIUc3n/tgWOeb+CBkXkJbezUyy09O2tM2wFAMr2tLibjj94vIh5U4p9rto
	eUEXLn/cPbps1s10YY+/tjKfEtjoKzBoui/iI+nadZQGY26ssBQ5PuWirVwmRO5o
	+X3pDIm88yz/Ob5+mbs8vDHwHIoH4+HT39GkYhdf4adjhkoD/vh4QheKUnw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epenr8n44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 09 Jun 2026 10:23:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2beff6b6e74so54527365ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Jun 2026 03:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781000595; x=1781605395; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dhkZeVLQqF+ONSXF+cRa8H02HY1dCnDBy0f3fSDbGfM=;
        b=SEdLlO2d6adlE9xIqQX5xx46KyHMz6CKnrw3eJ+zr6qpZPt+HXPPK0mmzFV3o1M22P
         MaJDUw8Ffn4pPQNScH+Mxlzj3DNbWZjVvblLM1BOO6ULH5oc0X/OO1X+xdLaGvmi+Pp6
         OIGVAl+NEHsUG4Df6lmIPtnIZYJavHZI0jmCwpmu7GW5spJKMZnoCZS6UkmoiKko10mY
         h/TYndVsXEFEFEVfK/V2cQLPr4iTOZXR7X4Cad/xJ6nDlJXAazcTmRn5A10nj1s9Aaf8
         mr5FiRrDMCck1FzKMYkwZKq9/Aomjli+0OdBe3i8LGA+76/BKK+oUuZ9oh5KmWVyVG/T
         3CWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781000595; x=1781605395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dhkZeVLQqF+ONSXF+cRa8H02HY1dCnDBy0f3fSDbGfM=;
        b=k7nxCN76LTslynM2nMJEfrkAHYBBA2Ai/MbwfbEFfrFHJj7/DmZgEk1Kl0x0/X+jY6
         cORWwbxoKSGuqwOHBEetWxA8T233GYe45bJSL4ESGH9NDATFjSFLReHrNhovsEk2QBI6
         mFFW7RTjjZXtYfKt46gJJUT/CkUQ1AckjT0sY08H7bBVTO7dW0u57CuqbloffCOzz4To
         a3SibpCwBpDmcTzmVyaOBtBbGQnLvf4m16AGVDQCUGmh1N/RLwaO3bYWuYLnsij84lg5
         1dVxsBgAyBAUQ770fFglXcE8sHC1LEqNTMMXpFh+TprPeFZEsC30DoxhwFfsuMRGwpAF
         bucw==
X-Forwarded-Encrypted: i=1; AFNElJ/QYiuy4xRUjRwiK3hGcac/zhpvtxGeKknl39YP163zJ/S6PU9mURHfgVqdQhTFiYTTSSGdaIzkuROVQ1KASQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZpkfjkxloyftKE9eWV32Q9zq0suy6IxM5zyCphTmjYS6XwqOx
	Q2wC5W5IA1c72Wg62bW74IX91HDOYIX6dwHrDoZR+vmPWnJTA86K72i1QSOd/UbLrLEVhL7r2fB
	WV9+vKQHROc+ov8kKtO7iOt5NoR3Fg0MTijLpC00G5SRuUy8hWbHIBpGJQ13QrenaeqoR7r/8ek
	M=
X-Gm-Gg: Acq92OFBbR+Cxu/x98Oe4Ek3YZfWSp6UJ4UV3lSLvtGqX+PgsqHFp6h677DZtzSxno4
	3nn9rBSsOFN632Qz/jaYrjk5AlXNv7FdCi6M3oz3IlAfjaoMf9/wcUYJBu5m9ixPCzfOqoCRCuy
	+Dk5w/BUBeBoMzUbvoeQofS9s1xdPCLyq3RM32BvIb6zJ2jSqWfiRKydVn8+fztc/G/vZHg+kZO
	Aq6fHAogdnRSIzWHnNCKINHnN5ZdvfbyxLemAC+XWgre9YQKMgsASs2mHykri7Mi+OpcpvI0GZG
	jRAOuMJ1lIOeqRDby1GAxnLQyEziuOHELRb+DS48jhNOEWapumnO7DU8yZlMtRIHVKkCS1ZY079
	yT8Zwf5DnsXZ4GGTFw6AQHPB3I166Hfc4WW1m7M0xSwbOk3pjvbBsD3YZ6Sc=
X-Received: by 2002:a17:903:1a70:b0:2c2:245a:3366 with SMTP id d9443c01a7336-2c2245a35b5mr173911685ad.27.1781000594844;
        Tue, 09 Jun 2026 03:23:14 -0700 (PDT)
X-Received: by 2002:a17:903:1a70:b0:2c2:245a:3366 with SMTP id d9443c01a7336-2c2245a35b5mr173911375ad.27.1781000594271;
        Tue, 09 Jun 2026 03:23:14 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6e86dsm213121685ad.8.2026.06.09.03.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:23:13 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 3/3] remoteproc: qcom_sysmon: abort stop on unacknowledged shutdown
Date: Tue,  9 Jun 2026 15:52:53 +0530
Message-ID: <20260609102254.2671238-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609102254.2671238-1-mukesh.ojha@oss.qualcomm.com>
References: <20260609102254.2671238-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8ZcyiRERgq4mqfnGQxxb1By9y8hf0Vl4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5NyBTYWx0ZWRfX4paIpL482GcE
 iOgbYqQV7Wxty4M2jX4fVS8X2zVUACxh7S7VcA5QEJcxmwZIFJDa527gnOoeYkxxMvT6w000igx
 WfvI5UldEwyVd0spwKJW5Dt1kaBO4c77roiijYhLvI5YZgewIYvbxPEXrT5E45VJmPtk7KkWxZ3
 oxLNCbACy4p4PK1UBeygOuvTvfrl10ORhQJxBqPDvx7xB32wTd4ka8cO4UOJDggd2Ppy+OAfIkx
 X4l/D8dDg4xGMxISNK7CrvU/kV7BYWnNkIMU85GskVAD/vsIXRgJ/5k/9TERXk7xu3rmQEJXyff
 vu54jb+r3tguoEtCrx8MY2IZwCEBaKqQDy4QlDBGhs4I0DJw6UP2uX0eCMYydU3b07JEM3lq5dt
 axEnMxfi8jD6rSE6pUbrxv/ojXsX16G6FZyIbdy/vmePqrZFYwjxifX4gIb0ZuCw1ZS5I9uWWL1
 snRS2cstkiqg6Elw7MA==
X-Authority-Analysis: v=2.4 cv=NKPlPU6g c=1 sm=1 tr=0 ts=6a27e993 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=i5RmczF_S8wiUxY00XQA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 8ZcyiRERgq4mqfnGQxxb1By9y8hf0Vl4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_112320_635342_66059616 
X-CRM114-Status: GOOD (  14.70  )
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

When a DSP hangs, if a graceful shutdown is attempted during sysmon stop,
it times out but sysmon_stop() still returns 0. The stop subdevice loop
then continues and tears down the glink and ssr subdevices, which
unregisters and unmaps the memory regions attached to rpmsg device. If the
remote still has DMA in flight against those regions, the result is an
SMMU fault.

Fix sysmon_stop() to return -ETIMEDOUT when a shutdown mechanism was
tried but the remote did not acknowledge it.  With the abort-on-first-
failure behaviour already in rproc_stop_subdevices(), this prevents
glink and ssr from running their stop callbacks against an unresponsive
remote.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_sysmon.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index 44b905a7e129..a29084cf7145 100644
--- a/drivers/remoteproc/qcom_sysmon.c
+++ b/drivers/remoteproc/qcom_sysmon.c
@@ -559,6 +559,11 @@ static int sysmon_stop(struct rproc_subdev *subdev, bool crashed)
 		sysmon->shutdown_acked = ssctl_request_shutdown(sysmon);
 	else if (sysmon->ept)
 		sysmon->shutdown_acked = sysmon_request_shutdown(sysmon);
+	else
+		return 0;
+
+	if (!sysmon->shutdown_acked)
+		return -ETIMEDOUT;
 
 	return 0;
 }
-- 
2.53.0


