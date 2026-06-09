Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC9F3CD8CAA
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2026 10:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oGapPqde/L8XcWbgwW8R8fZSYz2OachDKg2LbyV/LTA=; b=ME07UWrQMFbmW7FWNdfGzodJIk
	ZvWeG2PGRyDrW4n1ELDbIzAv/z7CiFZskhwPo/TbMflDjUG4ig9h0xROs8zzI1dcpx6Yj1oXBDnX+
	1YrylcKvEUNXdiHj6AMrdmLZn38rm6OW7SAzJdwTpNQHdoRLOB+n1nNzF0gUSxUsHejuDWoaMSYP1
	KiKMZxzfD0S2N+/0ZCXFhK9Swl6+oSwraSE+RuBSWZIPAWYRdOtobh9LHKJ+/inI1RriKv0Do+jS5
	ijY70uKXoDjfyifOYM7BxCB1PREZz7MJmIrnvRmEKtrqzdu5z6L5q3YhNc2Ouv6Srj9uLJv5ANE5o
	OpVcxXCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtbw-00000005LL0-28gd;
	Tue, 09 Jun 2026 10:23:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtbt-00000005LJZ-3JQh
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Jun 2026 10:23:06 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599wsdl2311513
	for <linux-mediatek@lists.infradead.org>; Tue, 9 Jun 2026 10:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oGapPqde/L8XcWbgwW8R8f
	ZSYz2OachDKg2LbyV/LTA=; b=oK1vEgCwMRWmWTdRU+YtNKprw5kl2WGsT2ZTwe
	5ysNuCmaARcWHlq04CnAsMhVuqEuScYuJIgau+RL6AS6T1/SNrn/O/UyGAMfOJDR
	li+aozatQnJUL1PC6/geZtl5VcqjrevGJgGaHFSP/4oWmJuOS8J/RZ9LcLmx0gBi
	153WJkDPROS5loJgNSnGBWA0pg14sY4Wm9XWcG3DkG/RTRFfRGewubj8wakRuAOd
	EGskiursJ4hUYqAFDAh7LYn5LAdx8OtLJld36oiQXlmXBBg5mRUv6nqxrdAAgoMA
	Za/KXn36Oai48YwPHXJ2oShYa9iZwIVkHNj/C6YI/WbFVrng==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3v07p7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 09 Jun 2026 10:23:03 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0d0516ad7so56066025ad.0
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Jun 2026 03:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781000583; x=1781605383; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oGapPqde/L8XcWbgwW8R8fZSYz2OachDKg2LbyV/LTA=;
        b=Txb+Lgn+U5wHhrjNLQx79qNDlOyyOKzC6U6aMZGSWbP0dLArHqQRCdAZjQoc/xxyW5
         ad2qi9NvACaOnyiPUTcrXOd6HXlR9FZSfYPQXwFdm54hJcDHYl5QHhls1/PtY7JnLP0u
         ONamuaPj1lKPiwvPBI6qXa8+NUikzCAMySEt8MPsBBedN742NLW/JW2pfJtzYFPUq/hJ
         02iRI+ABcfO/iH9ZSzBqiB5bWInbiNiiNqNp/L+vpatrv+MA4at8eZsR4OFA7Diu9rR+
         C49+bT2b986OQ8q9Vdt+yuogm9hpgEVbcdLMWYXHMhkvGOi06zddMGDJe+mQTy5ESz8v
         Qpbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781000583; x=1781605383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGapPqde/L8XcWbgwW8R8fZSYz2OachDKg2LbyV/LTA=;
        b=sFvq9Rrxh2QmZm7y4kTyMEs9/ARExhqBWAobdWkeYFzuhyc3eFv2vy+RboU+4h11pj
         GN3hdKftzL4sSNaSPeJnlMkpsmXlX1UqV9DzcQRwiG7U61oGlRjXC36zTs2Vl69qKCq0
         UteFV7idM3FEWMqS9XbkNqyokr0xeAtLJNifMbrZeK2Dh6lpGvefHaORVZnz+Ijxyqnd
         7mh41JdDHBBtdLrQXUtM78kZ61xTIIgiQlAvkj73jOjMrN6M+cVRyhvHhLT7XJnAskel
         n1bB2RA7+eBb/fsj3UTBv8pvqg3yJOrxu5+qOr89MmHrELHaulpKDLaiIgKtQ6aq49Qq
         cPyA==
X-Forwarded-Encrypted: i=1; AFNElJ9mguSlikE/DomHBTO+ijKweKid8UaRCv62cPTLN/mkccgB+AVXtTkJT3k8q+jVr3lPSNt/p7zpQOzYrjnG+A==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywl8rLAdZYPbCl2erqVjtDHc8t3ltas3QthDVRFIh2oL+FW1OIU
	77ZMraXMOyRBt07O8t/cz4+8/Heq+nsAmyZYwa0qIhi5vmoBpwTByX16fhkr7YmslchWHo2/YFV
	ofhGCT8nFcfQeRuMUqdkm54aDX6jzZCYNvPRDXrOy1rtH/h1EQENVfofbNE8zq+bdWp5BCxh0IV
	Y=
X-Gm-Gg: Acq92OErWTspgFcc1w++S6zzKc5ShA+S07b4UOJU/2tBTGYFDJ/cm2vvDo4A/A2/1Dt
	Ug6rVXc0/iAGftxUL//3gixrg6BcXh0GbXd+NsHzVSzELlafWCXWu5RUwi/UVPX/X9nnChG4PTN
	MBu9DqDBtfJTzFB7av56zwPHjHmeHdDKwjAaFk+7YmQV6LBiVeaUvNHt2/X2N8I8BfPrlwOPjZb
	mZtTeFx1NJ36CbP5lJuE0JzuJI/Ja+RTjeuRaH1iO7CXViupwbP2GFoSHNz7CN4kdlS908i22xf
	Ob8eWRHjmc1aOE2G1RxJvm2zniQKSeqtiSAhnTB4JcQXdt8w8LL3inaJWOJ/9SQwBUvm3DiM24k
	m08yllNZOnc0Vltl0a8RThwa/Vs5Izgj9AcSTQ6tSb9G8PCSIcXRHpGL1XjA=
X-Received: by 2002:a17:903:1245:b0:2c0:bcb3:86f with SMTP id d9443c01a7336-2c1e78e431dmr207447035ad.6.1781000582760;
        Tue, 09 Jun 2026 03:23:02 -0700 (PDT)
X-Received: by 2002:a17:903:1245:b0:2c0:bcb3:86f with SMTP id d9443c01a7336-2c1e78e431dmr207446785ad.6.1781000582247;
        Tue, 09 Jun 2026 03:23:02 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6e86dsm213121685ad.8.2026.06.09.03.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:23:01 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 0/3] remoteproc: fix silent teardown failures and prevent SMMU faults on hung DSP
Date: Tue,  9 Jun 2026 15:52:50 +0530
Message-ID: <20260609102254.2671238-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=St6gLvO0 c=1 sm=1 tr=0 ts=6a27e987 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=oORZlF2qDzti3-ymW0gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: iwmHaRlPNL2oXtgdLiBYQ2H6zGlwKmSt
X-Proofpoint-GUID: iwmHaRlPNL2oXtgdLiBYQ2H6zGlwKmSt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5NiBTYWx0ZWRfX6AOzbE7D2D7G
 uDO7hwo/CgZgt2rX+GIckg39k5Au7IdkWh6nZZQDWSqo9ixzfssJSuCJEXwEDXmsxuhDTzTWCR8
 ClMMRmnb2pIFRepxiIV983NojPfLhOlV2gK6a94V6nWXvLhOSnZVaJtF4cAuzLUFOcDAzNNSq36
 9VAUXSyDK/vfDnf6LkVUgsAzPf9nQQQrELxvCnqs/uKuSsJ570bECnjPL1JwasqPxv947rmAs5g
 5jOHUFiFAQf2gmX/cklu37qgU8/Ai6bkTYuPhI2ejFadyhPp76W9nPYtDFkfJtD0osDLZPq7Buk
 4KzL+ItLaM64VjZJBhdcaL2XFSFPd0n7t2L9x86+lQq36R7J/UjPzfA/ummhr1+gpW/7E1Fd36R
 xooO85NSm8tAWtYG00jAKfnzbPmtWcaVKhMrfWjLGfdYYOFB3lphOTf/XMYjACGTKlarza+f4Jp
 QUZpDmc0N4lBp3ldA5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1011 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_032305_940587_3B1ECEC9 
X-CRM114-Status: GOOD (  12.37  )
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

When a DSP hangs without triggering its own crash handler, a graceful
shutdown via sysmon times out.  Before this series, two things went
wrong:

  1. The stop() and unprepare() callbacks in struct rproc_subdev were
     void.  Implementations had no way to surface failures, and callers
     discarded any internal error state silently.

  2. Even if an error had been detectable, rproc_stop_subdevices() kept
     iterating after a failed stop.  This meant glink and ssr subdevices
     were torn down regardless, causing HLOS to unregister and unmap the
     shared memory regions.  If the remote still had DMA in flight
     against those regions — as is often the case with a hung DSP — the
     result was an SMMU fault.

This series fixes both problems in three steps.

Patch 1 changes stop() and unprepare() from void to int, matching
prepare() and start().  Most implementations gain a trivial return 0;
rproc_vdev_do_stop() now surfaces the error it was already computing.
Callers warn on failure but continue iterating (best-effort).

Patch 2 changes rproc_stop_subdevices() to abort and return error on the
first failing subdev, propagating through rproc_stop() and
__rproc_detach().

Patch 3 makes sysmon_stop() return -ETIMEDOUT when the remote does not
acknowledge a graceful shutdown request.  Combined with patch 2, this
prevents glink and ssr from unmapping shared memory against a hung DSP.

Mukesh Ojha (3):
  remoteproc: check return value of subdev stop and unprepare callbacks
  remoteproc: abort subdev stop sequence on first failure
  remoteproc: qcom_sysmon: abort stop on unacknowledged shutdown

 drivers/remoteproc/qcom_common.c       | 26 ++++++++++++++-----
 drivers/remoteproc/qcom_sysmon.c       | 15 ++++++++---
 drivers/remoteproc/remoteproc_core.c   | 36 +++++++++++++++++++++-----
 drivers/remoteproc/remoteproc_virtio.c |  4 ++-
 drivers/rpmsg/mtk_rpmsg.c              |  8 ++++--
 include/linux/remoteproc.h             |  4 +--
 6 files changed, 71 insertions(+), 22 deletions(-)

-- 
2.53.0


