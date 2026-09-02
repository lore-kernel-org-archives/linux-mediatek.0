Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A1BC624DA
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2026 19:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TYnvs+N+CqcW/5DzK7i0UN1RVPBedvN0sJ+WQweM6EI=; b=HBbI2fksbY8FFEFFaHT858+V16
	bqjBzA2l2iRAisv0UDnrFI3YopzHuAdM1bneOpM5BAs6cfTMMdwyGxofAdYJ25OtHD+CSCXHaY/hF
	xqxt+G7VnEkl0vCAbfN6Dnx35EDkqHlqK1EBFzWKt/SxTLD7jRuwWd2pRGFcs4uY/3RGVoAXU2GXX
	FqiSMwXrijCkc3PgFU8XrxvN97UMjEiT0KLDBLmjYWap6b6kG90NoTBYaJUAvEv83uoDmFp/cxrTm
	Qew78jb5dg/+IMQhSps2WUSSsbGoKGNCwXbNJPNAaj77HS7HvmdiBnuru47nT6kEskirSI3bMLwkl
	+jb9eI8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qiO-0000000FiMI-0t5K;
	Wed, 02 Sep 2026 19:33:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qiF-0000000FiJT-1Fsb
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Sep 2026 19:33:39 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hr0EC1071986
	for <linux-mediatek@lists.infradead.org>; Wed, 2 Sep 2026 19:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TYnvs+N+CqcW/5DzK7i0UN1RVPBedvN0sJ+
	WQweM6EI=; b=Ie4TBhiqivgoZgq4A2+TqkqiddEKzO0EVxYDvc3EcNl6frVMCeV
	SO69XNhP2XGQG9UjNuhFob4KAWMwll+a+avJECXb2hB1v9x7fAKcxE1XRasr73+x
	5JD+w/LBufHmlaHdwcV9Ngw2sP7aZBgtg/ZaxmqjhDESAUwlCZRuf7GKY+RGn3im
	DaXy1nrhYVNWfPPmqfJ3XfCZv4J1GggKXDelDr0tmTJr+hwzgRu+KLZD8EdBzkXt
	2quNT0JNV3ptRDF6GMGJxDFk81QEsaHZjEhIGFhpn75iI8DVIzdQa0raiWvY8grx
	aS3Ce7K8inSGDyWC6D+HKuZMCaEg20zo5gg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemja1ngt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 19:33:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso1735891a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 12:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788377612; x=1788982412; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TYnvs+N+CqcW/5DzK7i0UN1RVPBedvN0sJ+WQweM6EI=;
        b=Om/IkSOg4IeKfizSf8o6vD/yRRc9w0l5skQG/Au4upfO2bsD4wj3gRPw7moF1M/XtE
         DKIX1weQJ4E9jKYn8Bvyv+5fPJ/L6uhmkQVEGVfFYxSCM7V5MI9BIuIP8yrXS86FPm0A
         9qKXeHsNlLX7mBH8fNLKLZ/9yJjdM+3PlwLSQwSgwdKBsomeY69usk4DImIbbojEFXIn
         dvoHEb4W0L/p+g4O6mNlPoLQWtoVIh+ykwnh9qrdgvSwQk/vBqr4/Y6RggjWdzpUiNaa
         n5Zo2cgaY/A7D0oJeQoF/DcrLe7qeuF8S/2fKVtRVLTE3yz2xU59x9aDcQyGjk8/r11t
         sAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377612; x=1788982412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TYnvs+N+CqcW/5DzK7i0UN1RVPBedvN0sJ+WQweM6EI=;
        b=CNYjzjOnWvBhKjFVfD1Q3axCIfiKmkARBxJdVuuyQce5bDMkK7R6Ij1cHSakOOtmLP
         t8nDt5Zk/VsdnMV47UOcW2gcmUmVuQWcmaatYHxmrtaIEhk+BqEFbZR9yKExUKz68cB/
         d7Kwy0vSx9O7sndTUeT0ErOpnr5OY6Wv9sWVHPp+33tIWeE4eYLtXFAvYyvhEJ2cVIGB
         ReNZLvQKN1izCG8cBP0Nc1dRBBS5SymSQ9lnZKTFsN6Wo9eX0pFqByzlKw7CxZcdEV3R
         3pHcjUL/Tu0SSnbl5AAJRSs3FwxxzO3Mu+SfLBHOKyIYYAPdo4MrQjRlfJM1Zjs/vY6i
         Xqvg==
X-Forwarded-Encrypted: i=1; AKwUvBz8AHDvfKoa/95A11c8/S6hvHL3VIr4QTmGlhJVOBiIjrqWA2TK8FTy6PiueSWUS+s7PC8bdR8C21R1S7LbHA==@lists.infradead.org
X-Gm-Message-State: AFuF++lXvwDRi0OEnGaiXuKpMifmkdb4FuFIh54dZQnwQFXhQDxKuUBn
	4KQFL6dlJqK7U6Apt6Mbj49HiEjMtdW7S/hBKBOiMwGiHO1cozD+DlMgxQXQHx3zQxM9ojs1rJk
	us661Z7K+FazqE/8cjczVSAUV+yhyYwurU0TogMEuZLauPq2YIjG61acjbWeMKoDHWhAg7wFywy
	CvBbM4xzc=
X-Gm-Gg: AYBFou30/WDIDn6rB2FDN9rkw0QgLjpkTdF5OCsAXWkUKfs9ed+S3CH7hqfmOQug/9e
	PH4y7jqOEV/Axh4iIR6WtMSG2K1o6nnMaYf+VRkohVA7jao9bwUrGUt2sl/WlwWKLcpxn7wT9RI
	KtrK7XuAPexK+SEcnXRegje7ECzjBp7Q++uiMa3zWme9tEBmPx03lFOikAeGHZcKv1tjr1b0/K/
	1GPr8KfUMZdUoxadn604UTi1EPCQI9nFZdJpxU9EGzSGx0zoa2Tq0Xj0n4OJkO7nX9IktF/zrNn
	69PVR58CoFT1h87739FQONspoK+x7yEyV8Y+y3cZQqOEIYle7kO9//p8JJPc2U0zWXk8aqB5Oat
	mAZ6XdvTl8bJykI4RQrJQHr9ChM4=
X-Received: by 2002:a17:90a:dfcd:b0:398:ba0e:96f6 with SMTP id 98e67ed59e1d1-39aee1ad8edmr11480490a91.23.1788377612203;
        Wed, 02 Sep 2026 12:33:32 -0700 (PDT)
X-Received: by 2002:a17:90a:dfcd:b0:398:ba0e:96f6 with SMTP id 98e67ed59e1d1-39aee1ad8edmr11480435a91.23.1788377611618;
        Wed, 02 Sep 2026 12:33:31 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-332501e5447sm518103eec.0.2026.09.02.12.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:33:31 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 0/5] remoteproc: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:03:13 +0530
Message-ID: <20260902193318.1996827-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: AQLpyqXbNs40QsNJ3knylkuyAYLM7Ebh
X-Authority-Analysis: v=2.4 cv=FeAHAp+6 c=1 sm=1 tr=0 ts=6a987a0c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=prJGSMnC0dN4-z46mKEA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfXzO5efIUzH0aU
 HkpFQ/s9cwK6JTR9k2KnjeT2E97FhAAh4ZYzv7WWmbL3ahkoJaY78KYtudrz+tFNZASsrBYqFwV
 cIWSjihlnkMzGtnY05R0FhwQap+6jxM=
X-Proofpoint-ORIG-GUID: AQLpyqXbNs40QsNJ3knylkuyAYLM7Ebh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfXxNtvieDDJXFG
 rM6TLf4buks91yhU6t0CPhXhCkYMYBukpB28ZBFerBcz2dts6pXeg4ygeoiMiQ9VjD/GPvpEorm
 1GfYu1h1LEVtHBJiXPeLcOr4RS0h/8jh/Gw9z/sgEEF58gfMIvjlI4I9TNFfdoiT4OrCIhDhMNe
 O2h785HYqZaLFaNWyE6Im41NCcRR6dbVPyJSbLWtN97Wj+JnBqEu+869VVc00NhA1T3299NGCgF
 zwmGi+rqX8O68K81mBTjXnPwahP2s+aQRqbDAaSH68mDqc/i5XWnWdDHBMdAEulMwvA6sZX3mSk
 bc8x75fKJiNDdg3vqNmBszoOQgZMQU0QkosHFNzKboW+mXOeZiG/1AzM/X8X0L5Dn/udoNAhifR
 zXlmAo5tu92B6jdwsQ5fJOsuXyghgldBnlNHjgOh+sIbmkfN6MSbCuY2jJ6uytXYsvu4O2Xrwhg
 xs6rcmcQKb4WRgSmDCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_123335_414416_0D5A1083 
X-CRM114-Status: GOOD (  11.25  )
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

Several remoteproc drivers manually allocate a reserved memory region via
of_reserved_mem_device_init() and then pair it with an explicit release in
the remove path. This is error-prone: if any error path between init and
release is taken, the region is leaked for the lifetime of the driver, and
the pattern must be duplicated for every driver that needs this.

devm_of_reserved_mem_device_init() was recently introduced to handle the
cleanup automatically via the devres framework. Convert the affected
remoteproc drivers to use it, removing the manual release calls and any
wrapper devres actions that were added to work around the missing helper.

Mukesh Ojha (5):
  remoteproc: da8xx: Use devm_of_reserved_mem_device_init()
  remoteproc: keystone: Use devm_of_reserved_mem_device_init()
  remoteproc: omap: Use devm_of_reserved_mem_device_init()
  remoteproc: mtk_scp: Use devm_of_reserved_mem_device_init()
  remoteproc: ti_k3: Use devm_of_reserved_mem_device_init()

 drivers/remoteproc/da8xx_remoteproc.c   | 10 +---------
 drivers/remoteproc/keystone_remoteproc.c | 16 ++--------------
 drivers/remoteproc/omap_remoteproc.c    | 13 +------------
 drivers/remoteproc/mtk_scp.c            |  3 +--
 drivers/remoteproc/ti_k3_common.c       | 13 +------------
 drivers/remoteproc/ti_k3_common.h       |  1 -
 6 files changed, 6 insertions(+), 50 deletions(-)

--
2.34.1

