Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6683EC43458
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jul 2026 19:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VVldA6NTRnpwPp0U9xX7eE/7+mcCmlhnYAOTkmKf4Os=; b=voKIfVDfOtDciZNLZGHCOhYBty
	e7hafhXK38H/sX6goJXqFyN51oVtVJUqDPwGavO4szp/C9oqEM9g7k5fs81VxOkK+ehQ0vN0yHVSJ
	mw85dw4o1VggmtLVwLsYAQJe4zCqgR1jvolj6uXpCNvCyYobegLikJzn6I6R+g/SrOtOAaVUo98dI
	ZrubLqg46rVuOrB7Gb85EYcXQJuiFtxtVD5LSgBkOWYXfsJXpdqcYioXqMCwnqvKTfAwBXzP7P4RT
	ZqyNtAOQXOsrKrjiuUNEepgC7Clh3FlIh/96vFu2y6ezgzOmp7aiA6Hel9kffN1KTC/VdTcxGHwka
	B1W7mgjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSiQ-00000009e2k-2i62;
	Sun, 05 Jul 2026 19:41:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSiN-00000009dyI-0K8Y
	for linux-mediatek@lists.infradead.org;
	Sun, 05 Jul 2026 19:41:21 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665JBLKp2520800
	for <linux-mediatek@lists.infradead.org>; Sun, 5 Jul 2026 19:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VVldA6NTRnp
	wPp0U9xX7eE/7+mcCmlhnYAOTkmKf4Os=; b=PVhvB4arTRaJVhF2SofLv+u1aVD
	jK8zIqELdsOTMECr0irbXF13Py7AAvUWwCcgloBqNe5sydVgobN3ykdNbR62SDhl
	xSdi8gXykZAYDggG/l29V+pDv8vxNl/8bfs3RsFDtihqoBwh9TvV8ccwG6jurLqz
	hXyA3tzVzG/9j/LFOunKeib03MEp2rrcHiuWykXLV2BW7biJwWZULRxuE/380H/W
	jxvEJrmSgF/oSVLpQz6WOjtRFsfVbrSe0a7iY0325hYiJ5tqlT9bhtEQhpDaeG/2
	q5Zdnz1hGEN80AyPY0gPhol8PR+yZE2CguSboTpYR821bg4icMzfKXPz3+g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6td3ba30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sun, 05 Jul 2026 19:41:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc77a6943eso38160245ad.0
        for <linux-mediatek@lists.infradead.org>; Sun, 05 Jul 2026 12:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280478; x=1783885278; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVldA6NTRnpwPp0U9xX7eE/7+mcCmlhnYAOTkmKf4Os=;
        b=TJajqnVINmB2U+cFdLH0hPGeUw6cOlYx+HagTTNfEoC/fKG17axPkrb7yfMceOdwCu
         bWbuva7d6wxHzEkJRWsLdF3gWWAXPtdu8sbiSsKu1fURb7jRYDWFtkmgltsuc84k0LMC
         Nnh8C4VDkvuaSb2iNFGl/i5N/HAttcSXKf2QkTdJiqE2o97kPA18RvGVhwhwuHH8KYJY
         TmJa5QrLptZQYlVDteNt7qsJaV1sbwAgNPW6QBK5exk+6/SHDDn5gSdGLwvCy7ZBaMHm
         C2pVyzRDVEZjS76d6URSDPV88tKRP5QflhykbS5JBbhxbazMnIA0jct1TS8WCenUptVj
         7QLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280478; x=1783885278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VVldA6NTRnpwPp0U9xX7eE/7+mcCmlhnYAOTkmKf4Os=;
        b=ACaMPvEZu/NRv9ivru++HAd5XGkgy05wiuhLXjEdfiW0TRl25yMR9dMLEbKh410BW8
         /ToMDZrIgWpbaOCNZPAIeTsedPXjzTFuzdGhlr0m32An5foyDzWECUUVqZRsGyAeZliU
         5e8OQiJfsPePvxIN1tHQIyZvGu8VSDpfGU8y+cuI13nK7CydXgKA0JfkCmzw+5mAoKXU
         qwj38AZOrgGfuPW7D2f6igElSOUK4ziCJQGTJx1JmLGxAD8NlK5QnNHCuIqXuo9NXfl3
         V4vJHxBFbF0C49tPH1aYsDSaGAmxaxqRVHs+LFwUn++xhHa9TYoukDUcq/UQek9naZ9o
         fNug==
X-Forwarded-Encrypted: i=1; AHgh+Rqmfzr4hRh38gMnWL1L82gQoaGjG/v8qWM10KTu0yOiWT0p8Tr0X64M6eq/+PtAw3S9G4RiY1uIQ3UX1CIzWQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzUl6e3tDHDKXl3aoqhMD4We5Bp/++dHzQFaahSGc67rjUyxVyG
	eyALEmNV6T80u2GjgXIKuPaeq9QAKnC6LpUZV+mnhG932f5ibgQddUoPOKgK8eZkpfeSF9Pkig9
	oT61Gz86wM0ymwgzmDwf1T6Gw03GIMhgTzAMMdSKbbQts9OMWesrCvhwWyDXT5zJKRq1YAJ+wg5
	g=
X-Gm-Gg: AfdE7cm5hwhj6WzPn5nZUVi+Au1KBMBZJnDFR2slBa54bvMTPy7VY8/ol7qSD/I5Stc
	EQUQkkpQM79I5nXxIjmFnEECGULxgtI19qhmlOqC+gJvYB/p9b6lNRLhKmhvGGSqVuKyAfm3ld/
	iLGwXNIgDfDZbabBaH8jRFHRFlVfXnVZgMuPHBkz1ofYBu4ghi0vfzv61GJ5QxDAb4d466tHO4E
	z/bh3lFcgELiFjgkAyRdNuRdYnhClMMyGxJmLR3ubHHo7IWOiqhwqLPYZXImokIKyLeurTCPl4/
	NQNUPMRh0j5wz7ngDSiD9ZfvgljRG5gEdqOIKyMYgD9iCQIVku1EkRJssUfff9FDXrs/SjMibj9
	74NOGworWO7chDyUwcLYmb0iMjMVZh8FhKOUdgg==
X-Received: by 2002:a17:902:ce12:b0:2c9:c46b:1286 with SMTP id d9443c01a7336-2cbb9eba53bmr79826065ad.34.1783280478035;
        Sun, 05 Jul 2026 12:41:18 -0700 (PDT)
X-Received: by 2002:a17:902:ce12:b0:2c9:c46b:1286 with SMTP id d9443c01a7336-2cbb9eba53bmr79825855ad.34.1783280477546;
        Sun, 05 Jul 2026 12:41:17 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:41:17 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, sound-open-firmware@alsa-project.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 40/42] misc: fastrpc: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:16 +0530
Message-ID: <20260705194019.2565498-8-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX6e4a98rjEb+5
 k1sI6JPHCIffX4vOQbvBXipLm8XJ+QFQVfFLkwCjxTfFHfK8gfm/28uPsPRmsDdThdaV34EPDyu
 8+RhQr6XS1Pc8dEKZ3cKHwbPNAp9lag=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX8B/6mMkZz6oO
 zxqLnDiXEFCB+08Rk/nkBzUJWE+X1t5CYdsilCX5AAUDHA1DH9cFCIrwgd7HvtWsOvwCXcO771x
 GouhwP/jP49a1MhWlGayR0GG+hJ83RL/oqyyTCegR+jptsqmYbjjJTZVkHvTKaqivbeBR8IKCaX
 mWrz/mSMkMu2sUFQgrsap8i0FMzqOEtf8Q+rmQePTBy5HoZ9B/MuhyFIfG4wXB+VjdTrc7Z5dt4
 1+g9bfkV7cnL7pRDMudV7dOrDGkGRahIYY0L3A+AA6eVqESarPOLKfam+nFjK0dlacCoHbLcjCg
 2oYlBR+wcP+yzUk4yrnwn3OKECUnGFztcXLuKaS1ew3Ag1bboWFRJnrGUUz2HbU2oKpkVHC/vbM
 iGifWgSuWLSxEU7hDcTh//kbSkqVQZv5Lv2eKRJfAxGmHQfZrA6mOhhY+569lr6JDx/BoB8bfuz
 sjB8bJqQC0NbttcmfuA==
X-Proofpoint-GUID: ueZPFVrYK5g5f321d4clBqMWOHTu6_Sk
X-Proofpoint-ORIG-GUID: ueZPFVrYK5g5f321d4clBqMWOHTu6_Sk
X-Authority-Analysis: v=2.4 cv=b9GCJNGx c=1 sm=1 tr=0 ts=6a4ab35e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=2vM2yDDFhuSsTauGYd8A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_124119_128631_F31929DE 
X-CRM114-Status: GOOD (  12.27  )
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

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing of_reserved_mem_device_release() in fastrpc_rpmsg_remove().

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index d86e79134c68..c4e05b0db527 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2396,7 +2396,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		return -EINVAL;
 	}
 
-	if (of_reserved_mem_device_init_by_idx(rdev, rdev->of_node, 0))
+	if (devm_of_reserved_mem_device_init(rdev))
 		dev_info(rdev, "no reserved DMA memory for FASTRPC\n");
 
 	vmcount = of_property_read_variable_u32_array(rdev->of_node,
-- 
2.53.0


