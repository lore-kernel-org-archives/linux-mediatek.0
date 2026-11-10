Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCF1606A325
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 13:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N8LwMNty;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=La2A6gWF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Km80HaDa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=G1amRx89cS3ZlVbqVl1dHUbx8H+yk0rGJ3ceJbcLO00=; b=N8LwMNtygb7thR3jCIV3O7AczY
	soto6974VZmUKxZfDTb0nlY1hAqertUoQMM1V0mxxRMCtmdRqq8DZcT4HlMBJMNQfsfuzlouMURna
	TRZ854GEaHziMstY2W+BRj5tkfM7SMYcB6TIRmQx1ED/Y1EwY9bGn00Bp5tSywgidf33IJM4DUvMq
	pAUC7u3iMhhD7TotFbhwYd8NUfesp2AQ/x1Xk5yfHUoHD2mlN5VXM6imUnSLf4WdonrQ5zu0/1Sxx
	tj4ODfyOIxLI/4AeRNiTp07jiSLfASeGor8oMtiVT7ApCkbyGA1d+Cb3rFPx6btTazLWQELmrfeVu
	838Fv92A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQmMj-000000048ei-3iHN;
	Tue, 10 Nov 2026 13:58:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQmMg-000000048cj-2LnC
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 13:58:24 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABA5lx3216958
	for <linux-mediatek@lists.infradead.org>; Tue, 10 Nov 2026 13:58:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=G1amRx89cS3ZlVbqVl1dHUbx8H+yk0rGJ3c
	eJbcLO00=; b=La2A6gWFhdCuJohKUxu+KrmPeXacK9C/vRy52ddkzfQArdz3LkV
	MlP1tC3xCNUYgT0Quw84SY0o7eLeh8bemfL6wHXeAZpUaWQleiMGFU1pZvgkjjr6
	Sq4OrmyZsd9lhdxXCbuUh4XIQaeI13M7Fz7GtMOApmWStgnKvP36D47x2Idgfr9E
	o5TGRkq6Nv4ln3KY+9rn43RNZVbir11dQuqk9wkW0t1lC83LxKYV4UgVCYeCyPCN
	t2gjCXnsDFeP1TSMVcVajpPxBzD20eoUMBKbPJVF08qaCbV1n/mgDDwXxh/r7N3i
	vAUmWqzG+ISQ2ouVPFusHlm+Zt0H7yHIZ0A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huvtd9x6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 10 Nov 2026 13:58:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0f667a666so2938450a91.2
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Nov 2026 05:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794319100; x=1794923900; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G1amRx89cS3ZlVbqVl1dHUbx8H+yk0rGJ3ceJbcLO00=;
        b=Km80HaDaxrj53kTgMfZJmFQnCdDqE9vU89moWPXzd/HcARhR9/chSMUwmyndvNQUcj
         vNhuetZlvDGi3RpDLcgSiA1EEG6xE2ePYXCoF25xifEvF/XYVlVuyZRY9KqjdGoEcpfv
         tN7wEHGxSmSNDUX0nbP3AcLDMNneoebRE4TGKsu3ROWhrrmimQRiAGVXe+4pK8GfXcb3
         oQ1v7knFPt6/6qQ1wX9+0ot2kv54+9ND4Y1PfWyZJfu6nW5EgQQzsKadBGR0s1c1VyeD
         iZ3vkckkFrhgJxwIiLG/n6k0G0N6zgt95x96NHbCxOBnmMlk2xDQUjRM8wM7ynkAI+EW
         BA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794319100; x=1794923900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G1amRx89cS3ZlVbqVl1dHUbx8H+yk0rGJ3ceJbcLO00=;
        b=RhT8IHsFks+F1oyyd4bSBtjLBBB7hi/X5AFjis0pA7XfAABuYOHwjTnI6RQwo8ynrU
         s+p2TbzzYOwGYbAXsVzerYC+FYDfLStNO8Z3+7TXboHhSdMS9LqqAZK05/Sd8lZZKpuX
         pDN4LNwGWOLSecyFJycqi/8YVOo8WHxzJe+omO/qal25dYZh6SLMcCF0aAjgsyEbOeXh
         pwDFd5NohAlzQV5fYgs8nN/pqnyKX6PRDSq4CvesbjopiZ4ZiG61Wl3jG861LzpkS2eR
         UwM2x27eMW1Oo6uzoYgE6zP3xSisfPAcnoU4eOer516WvI9ZxPNBb+dc9uKTcI9jwVdm
         Pn1g==
X-Forwarded-Encrypted: i=1; AL+hErE+ato/DKlH46OjLXgw0yvDrpPCIRy5Bx+HUwKPdw18OE6PXsO5dVvvf5Zxy29DA/GXNwb7BdOXYT1k1Ywo3g==@lists.infradead.org
X-Gm-Message-State: APuU4Z9ikOpV5GMinKbvSlIogFyLibRAgemSHEnQ1/yvUXNwv8hMfNOa
	Fqx75GLzTjzdRCGJFM+tfUkJV571dvjkQqsGqeEojYLGKg30U3Eif7YXD8d737C462+veI+X+GS
	FvRBj435b0vqj7oJ88FT+u3hMgFIz5dSfFn68lhLLi814Q8S6i7cikfSW0vW2gUi1MzU31kA4rx
	s=
X-Gm-Gg: AYBFou3yI9pa6kFutF1rVw2mC3yx37XLwuvevLsk9tQpS9whfe5jd0a2SXQ3pEgCHG6
	qYtpyq8yc1HVN9f5gv2ODDkdQOGA7idkwNdSuu/pDPjMOOmPjQerrdLOhnEeQ3IbV7Sef21rHd+
	kobVu/yqreRUBXKMQfig2DXFLIwHj6GJfkkt1uLlF1rhQIIAvOhLaSZcF1VhQ9jOtUMZ1Nog8xW
	gU+5DLJErguZUizSU5zd48oHxq+TrJFC276/3nYaAJQoI6YorEi/7Nt9ybkP+CY3AHCasLsoc1P
	SJxIXubj/RF9piDPrlQITnZvceCOpCwCsmjKbJ8o9UhR1kRZMiXhUToRXIcsxhKZSu5hOSNw38N
	dtpTHj5Uz/Q3OshvDKHipXF4/ISZp0MK2OZeDRMMLKecUg69yLxeqUOso25bhwVUQr1PuZAHDl/
	HWJru987F8w9xhXlWSN49PS7eUG39LaxTYV6Ue7z8=
X-Received: by 2002:a17:90b:3ec5:b0:3a0:9c9d:eb18 with SMTP id 98e67ed59e1d1-3b166fd294emr2603122a91.54.1794319099767;
        Tue, 10 Nov 2026 05:58:19 -0800 (PST)
X-Received: by 2002:a17:90b:3ec5:b0:3a0:9c9d:eb18 with SMTP id 98e67ed59e1d1-3b166fd294emr2603098a91.54.1794319099224;
        Tue, 10 Nov 2026 05:58:19 -0800 (PST)
Received: from zhonhan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17da5c970sm36744a91.2.2026.11.10.05.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:58:18 -0800 (PST)
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
To: rafael@kernel.org, viresh.kumar@linaro.org
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        andrew-sh.cheng@mediatek.com, rex-bc.chen@mediatek.com,
        jia-wei.chang@mediatek.com, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, zhongqiu.han@oss.qualcomm.com,
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: [PATCH] cpufreq: Skip inactive policies in cpufreq_driver_target()
Date: Tue, 10 Nov 2026 21:58:14 +0800
Message-ID: <20261110135814.621355-1-zhongqiu.han@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 98-zIYxXu1QK6f9CNT9keQwm5TigGjRO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1NSBTYWx0ZWRfX1DPBg6LBx7a7
 2tgGYo707o0ayyejtpKLCwO4F5CnFeQfIN+9djov839xrlFkOdIOqcs+dlHtsGDXewh1wB/0EhR
 L2sO44HkFK2tunUKvhPomThuFmoROsk=
X-Proofpoint-ORIG-GUID: 98-zIYxXu1QK6f9CNT9keQwm5TigGjRO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1NSBTYWx0ZWRfX/VzqcSbwKF2R
 X8OgJyKi720l/0F8HlN1kyGmUbrj1fKDTjfFE2iku0SVteoVgBTWYQjfYSPaMn81NE/rF91V5al
 q0+PeqRYSHBuJIXZ5bXfJDcntqHDp+njixD9hVHKEuTZkxN5mpMyCB/X7uVBGDANjq9SJuJXuBX
 TnV356b/0Uo07/dUsqmXW6Z3xAHqZCyiBt1j53TE3h3kzDedMozXPXw5um3phLL0h6h8Z5Yz2NF
 q1TOtxdr8Zu1s+CMu0/I3Sh+W6EjCIIjv5YT6ehglrSXE4wRptGmUJojCghRDgIj9irf/HZwlWe
 tRy26/AabHiVI3ClGCI1cX2xZE7oCbX1iR8I9DVjKIESjmh0fjUh1MczGe+6geyxp1AIUOx5Dzf
 XqW8wXi+YSMuZawUsXD0oGgSkN4gQzUciyfGYpNXvDtDDuvQZydZlNnmidoRUvCvvYv1qX+0DTt
 FpcRSQJzglJsQeyG9jQ==
X-Authority-Analysis: v=2.4 cv=ArR7T+9P c=1 sm=1 tr=0 ts=6af322fc cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=NN3j_4cKtzw3BXDvlvQA:9
 a=rl5im9kqc5Lf4LNbBjHf:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_055822_711174_F2F381B7 
X-CRM114-Status: GOOD (  14.53  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A policy obtained with cpufreq_cpu_get() may become inactive before
cpufreq_driver_target() acquires its rwsem, which may lead to a NULL
pointer dereference:

  CPU X                      CPU Y (last CPU in policy)
  cpufreq_cpu_get()
                             cpufreq_offline()
                               __cpufreq_offline()
                                 ->exit()  /* frees freq_table */
                                 policy->freq_table = NULL
  cpufreq_driver_target()
    __cpufreq_driver_target()
      __target_index()
        policy->freq_table[index]  /* NULL dereference */

Before commit 2372784542cb ("cpufreq: Drop 'freq_table' argument of
__target_index()"), __cpufreq_driver_target() returned an error if
policy->freq_table was NULL. Since the offline path clears it under the
policy rwsem, which cpufreq_driver_target() also holds, that check was
sufficient to prevent the crash.

The race has been reachable in-tree since commit c210063b40ac
("cpufreq: mediatek: Add opp notification support"), which added the
first caller of cpufreq_driver_target() that can run concurrently with
CPU offline.

Address this by making cpufreq_driver_target() return -EBUSY if the
policy is inactive after acquiring its rwsem, in analogy with the checks
in cpufreq_get(), refresh_frequency_limits() and the sysfs show() and
store() callbacks.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20261104153042.3987338-1-zhongqiu.han%40oss.qualcomm.com
Fixes: 2372784542cb ("cpufreq: Drop 'freq_table' argument of __target_index()")
Fixes: c210063b40ac ("cpufreq: mediatek: Add opp notification support")
Cc: stable@vger.kernel.org # v5.19+
Signed-off-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
---
Fix the issue discussed at:
https://lore.kernel.org/all/a4b320d9-ade6-4f39-9e9a-e9a82b13152e@oss.qualcomm.com/

 drivers/cpufreq/cpufreq.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 54dde8419bdc..352ee4a1f085 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -2403,6 +2403,14 @@ int cpufreq_driver_target(struct cpufreq_policy *policy,
 {
 	guard(cpufreq_policy_write)(policy);
 
+	/*
+	 * The last CPU in the policy may have gone offline after the caller
+	 * obtained it, in which case the policy is inactive and must not be
+	 * used for changing the frequency.
+	 */
+	if (unlikely(policy_is_inactive(policy)))
+		return -EBUSY;
+
 	return __cpufreq_driver_target(policy, target_freq, relation);
 }
 EXPORT_SYMBOL_GPL(cpufreq_driver_target);
-- 
2.43.0


