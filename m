Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90590C4451C
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 06:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sQp7omiTY5SOBB7FKn02TfxdkP6lfbDEMgiOmcuIGzo=; b=M3Nj5PBh9ExzUWPuJZL4rI9OXF
	+qBQCKzxJLPmOQKHzD2lcsUji/WHYou6mv2i0b+tcagx+LJEN0+mdcaQt5tEDV5hCn5+rwRK2+zLM
	YRjNcOSt7hgX4mIcP/GivFUjdUGdzTkaLl/8DCIJ581KIzDP/oZaAsMei5AjEyz/Cp7bGQAoBJDpN
	QTkflyVx15bSL+Hv0DfOscnAnAybq+28klEtsqqNPmF5zD0sZhkaDPD0Y0bhrrgU22bK7ps4PvNNl
	ulCBegC2bImwR4KV4uy2WPipMnhBDY0hUsrxXfTHTYh3YvWzUfcFnKsaesz3XgSLVLqfyiG+RShR0
	qD9AHq1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4R3-00000008c1m-1X9D;
	Tue, 21 Jul 2026 06:58:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4R1-00000008c1M-0Thi
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 06:58:36 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L656oQ933355
	for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 06:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sQp7omiTY5SOBB7FKn02Tfxd
	kP6lfbDEMgiOmcuIGzo=; b=Df2rqP5xKfuFqKwOBSbr9giW2PM6l/UIXVd4IDmz
	UczNwYD+az4/008yhjX68UBNgFdEPaU5YXgk00/3C6ZOzNf91R/CXnWNy/khLKpl
	N4B1qu1O+bIFCAdoMaJqo/ixHA8LiwVt10E7moqlljjKFcaceoK915BJg9IMJWzO
	vvbl2J4XgLqlu0G6ktmklcrgaiSVdBcTMVyjCqWXPy0yRQpAVQQKLvf6hNcSaoZ6
	ZPfLhtPLxz1YuIkYR0MvyTk+mhcql+5mZ0qRk7uTViRdcObVxlKTXo1ziy8VdTwj
	S2e1dnyOeELREpPbJKlcrfrpmYRzwc4eTukwyTGoPjHaEQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv5ttwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 06:58:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cefa1a2be6so90729125ad.0
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Jul 2026 23:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784617113; x=1785221913; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sQp7omiTY5SOBB7FKn02TfxdkP6lfbDEMgiOmcuIGzo=;
        b=NSqhfhxtbe2utrxBfsOXHq1dKn1t0+47iNF2RnxN2HfhrQE8UkjNuZi1YIvqyU6z/p
         Agrn/nuB+QKY6E7BDqwg+pFsSmpU/vTbSOjOSVD+krDDGVuYsZqh1qTh288UJkWQRueF
         tMFRlPgEJEihlaY4C2rDamhTWf5TdyMhgjLpqOE4VAQpENNWh9QAGAZUKnIqdFgpCLUj
         /ZfxcrPFJlXzjysdtN10JUJYNm0tev8tnyIf5X1uL1h+JGzKnSbuAD5Rjf92hEGKEnSo
         FgSMxdCCJPTYFJUjReAHTwaKP7scZj5eNA6369gtVRGAWedaPK/2/QmfdA3cl8tugVG9
         DcGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784617113; x=1785221913;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sQp7omiTY5SOBB7FKn02TfxdkP6lfbDEMgiOmcuIGzo=;
        b=TqdyQtCpxzYHoyAOPN4qOiIXpblxW55BToqkSenVdzNkEKTMKcBlOEyIJEUhWdOgX7
         Je2Tp5nZOOTEEbezmKnq6gTD0Hc8JJThkoZEma3sPC1eSCOOGIrSvgWU23/d3nZLnIQK
         6AnNrA3dixmHWILQCH7r+KL1uXJkRHebUJcjFKXTFRR7iM5I9J+rm5yGJHVENSsaDmR+
         oUUBH66g0jTDcaj73fMYVtLwBZr8wU3c401vrK5D0S3YrTYW2etYRnNCDT+Gujb31dxT
         rVKv/wM4Z9FY/SSBuz1DcZdm5zfPEsMQMwO3V9GNhR6kmlrHfmeoMoLD/7bDTQ7Emnw1
         P5KQ==
X-Forwarded-Encrypted: i=1; AHgh+RqxhoMYP+rDxIZ+oAFI3utDkPKlqwkAetD+kktxHFM2A9d/Mkm6ABsMlIXRzNYF9JQmZwliI4NIYwncqwAaow==@lists.infradead.org
X-Gm-Message-State: AOJu0YyLXxzhYW/0TF06piYTreMKnef2XALFgoOf9hG3oJnh2upZUhZX
	IaR6Ljl8oe1s3gV1B4LKFbs5SVJ3CGR/hePq00gz5xd8s0eR4N8HC0dgkA9UwKif06hpR4AjRoB
	DQjta/dYCdQE2e6Zea0YbKt0AL71alqSFlLVxXE/rfcbDVXbBhTokEIY3eVIFqLlMF7j+TlSZv2
	U=
X-Gm-Gg: AR+sD13JkkyphZR+RLiNZKWri06t3JGl2G8RgzXfMkq2zM83/Zz6H+50kLz6MEkhFUh
	4GYFD2PErLk0GKishoAGg/FddSPi/U8adraoV/4HGv7rrWV/Q8jP6lnnsJCMfRqSMyf00cMsMAu
	2WR3jWh24xmgfXIrupzrzi2JXBdUGQX1hSY9BzI1+A3HjhmMBAHthylPOJu8WMIhpWkpda8e1/K
	s85HourSoxBEaijmxxqsztiYAnxl99sUTn2A4wU5TJEWaArU2Dwi3t2NpVFhJ+MbmL0dh8nQNAH
	dFLCBmk+alZVyfG+JUeJFqq5ED4N4R1ATIfZgRaV8uMqg2nbYx+hv75fpPrF30mhb4WkIJu2PIv
	oqhhSc0jEvWV5WwhFhyjT3gYiKmfnBmdLGwGeDkefyrA=
X-Received: by 2002:a17:903:186:b0:2ce:e747:c5d4 with SMTP id d9443c01a7336-2cf34a34131mr191962035ad.46.1784617113570;
        Mon, 20 Jul 2026 23:58:33 -0700 (PDT)
X-Received: by 2002:a17:903:186:b0:2ce:e747:c5d4 with SMTP id d9443c01a7336-2cf34a34131mr191961725ad.46.1784617113103;
        Mon, 20 Jul 2026 23:58:33 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf347a6308sm69415505ad.82.2026.07.20.23.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:58:32 -0700 (PDT)
Date: Tue, 21 Jul 2026 14:58:25 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: peter.wang@mediatek.com
Cc: linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
        avri.altman@wdc.com, alim.akhtar@samsung.com, jejb@linux.ibm.com,
        wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
        chun-hung.wu@mediatek.com, alice.chao@mediatek.com,
        cc.chou@mediatek.com, chaotian.jing@mediatek.com,
        tun-yu.yu@mediatek.com, eddie.huang@mediatek.com,
        naomi.chu@mediatek.com, ed.tsai@mediatek.com, bvanassche@acm.org
Subject: Re: [PATCH v1] ufs: core: Remove unnecessary block I/O quiesce for
 clock scaling
Message-ID: <al8YkXydXJQZrl_Y@QCOM-aGQu4IUr3Y>
References: <20260604133503.2049288-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604133503.2049288-1-peter.wang@mediatek.com>
X-Proofpoint-GUID: FwLfIy5blxQVhCFVssKob_4MvXbLTmFc
X-Proofpoint-ORIG-GUID: FwLfIy5blxQVhCFVssKob_4MvXbLTmFc
X-Authority-Analysis: v=2.4 cv=e+U2j6p/ c=1 sm=1 tr=0 ts=6a5f189a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=mpaa-ttXAAAA:8 a=dEaLZe4p02KBFegDHk4A:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA3MSBTYWx0ZWRfX9AbR/HrpShO2
 45A3SAYFfxuUi4P8Tf46BS7DEEYfgNZ8iQKCDfzuIUcZJWf/d2kNUVSVxaSmBQEJT3A/EtZrxos
 7b8SiSk9iCYRyE/0UK4UuKq8mSQVhl8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA3MSBTYWx0ZWRfX8mRGx7pPF/Ao
 L4DNxph7japT8jrTU7zjmXiIzlSclhP6RA5UR+XZHO3ba1IMee/PxEhuYQQRjqeWd9ThgeuIkOq
 D8oJEMu40k9b4aBMsJDRltYPlCA6fvkGVT1zU4AXfKjBjSlT7wr0MPqf4e9z9lB4WhkrQAxpIq5
 FHP3/OfioW0PBceOWDivg3sDzXu1P1RauU0CPRFe8EjXcHJPl/r4Z0FzIDW1CkqDbnNeBLzZF9V
 PHJn2/BI0GNEPLaW5U/u59qzjj+adAnOdIDGUpqbR0vBw0fCeTKukrMUShn7ugqVgdWjgbQxlUC
 gePrCRV34UPqXgCdItJJfW00HFU5VLMMUBxmwlocSqbAbnFb+QRbxkkQ2AO1gU5fpVDbaPMdZdT
 XiGDWyr5nc8TK6Lp597X+G5OCmHs/84B7Shpp1Do2qqP7Jnluw2iKOvefHFXUbnViwwPuw10V9u
 4uTD37Gzvp6C//UmzqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1011 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_235835_166068_93CC84B7 
X-CRM114-Status: GOOD (  18.82  )
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

On Thu, Jun 04, 2026 at 09:33:58PM +0800, peter.wang@mediatek.com wrote:
> From: Peter Wang <peter.wang@mediatek.com>
> 
> According to the MIPI UniPro Specification v2.0:
> 
> 5.3.2.3 PA_DL_PAUSE.ind
> This primitive informs the PA Service User, the DL Layer in
> this case, that the PA Layer was requested to execute a
> operation that requires the usage of the Link, e.g. Power
> Mode change or PACP frame transmission.
> 
> 5.3.2.4 PA_DL_PAUSE.rsp_L
> This primitive informs the Service Provider that the PA
> Service User, the DL Layer in this case, has reached
> a state where the Link may be used by the PA Layer.
> 
> 5.3.2.5 PA_DL_RESUME.ind
> This primitive informs the PA Service User, the DL Layer
> in this case, that the PA Layer has completed its operation
> and the DL Layer may continue to use the Link.
> 
> The detailed flow can be found in Figure 52:
> Power Mode Change Using PACP_PWR_req and PACP_PWR_cnf.
> 
> In short, when the PA layer do power mode change:
> 1. The DL layer receives PA_DL_PAUSE.ind.
> 2. The DL layer stops and responds to the PA layer with PA_DL_PAUSE.rsp_L.
> 3. Waits until the PA layer has completed its work.
> 4. The PA layer then informs the DL layer with PA_DL_RESUME.ind.
> 
> Hence, it is not necessary to stop I/O during a power mode change,
> and this step can be removed.
> 
> Signed-off-by: Peter Wang <peter.wang@mediatek.com>

I'm testing linux-next on a Qualcomm platform. UFS worked fine on
next-20260713 and got a regression on next-20260720 like:

[   36.243001] ufshcd-qcom 1d44000.ufshc: ufshcd_abort: Device abort task at tag 48
[   36.250616] sd 0:0:0:5: [sdf] tag#48 CDB: opcode=0x28 28 00 00 02 5f 32 00 00 10 00
[   36.258521] host_regs: 00000000: d5c7033f 20e0071f 00000400 00000000
[   36.265065] host_regs: 00000010: 01000000 00010217 00000c96 00000000
[   36.271607] host_regs: 00000020: 00000000 00371af5 00000000 00000000
[   36.278146] host_regs: 00000030: 0000010f 00000003 00000000 00000000
[   36.284688] host_regs: 00000040: 00000000 00000000 00000000 00000000
[   36.291229] host_regs: 00000050: fffdf000 0000000f 00000000 00000000
[   36.297775] host_regs: 00000060: 00000001 00000000 00000000 00000000
[   36.304317] host_regs: 00000070: fffde000 0000000f 00000000 00000000
[   36.310860] host_regs: 00000080: 00000001 00000000 00000000 00000000
[   36.317403] host_regs: 00000090: 00000002 15710000 00000000 00000004
[   36.323939] ufshcd-qcom 1d44000.ufshc: No record of pa_err
[   36.329595] ufshcd-qcom 1d44000.ufshc: No record of dl_err
[   36.335237] ufshcd-qcom 1d44000.ufshc: No record of nl_err
[   36.340878] ufshcd-qcom 1d44000.ufshc: No record of tl_err
[   36.346523] ufshcd-qcom 1d44000.ufshc: No record of dme_err
[   36.352252] ufshcd-qcom 1d44000.ufshc: No record of auto_hibern8_err
[   36.358790] ufshcd-qcom 1d44000.ufshc: No record of fatal_err
[   36.364701] ufshcd-qcom 1d44000.ufshc: No record of link_startup_fail
[   36.371332] ufshcd-qcom 1d44000.ufshc: No record of resume_fail
[   36.377428] ufshcd-qcom 1d44000.ufshc: No record of suspend_fail
[   36.383603] ufshcd-qcom 1d44000.ufshc: No record of wlun resume_fail
[   36.390142] ufshcd-qcom 1d44000.ufshc: No record of wlun suspend_fail
[   36.396769] ufshcd-qcom 1d44000.ufshc: dev_reset[0] = 0x0 at 3853838 us
[   36.403575] ufshcd-qcom 1d44000.ufshc: dev_reset: total cnt=1
[   36.409482] ufshcd-qcom 1d44000.ufshc: No record of host_reset
[   36.415478] ufshcd-qcom 1d44000.ufshc: task_abort[0] = 0x30 at 36258488 us
[   36.422546] ufshcd-qcom 1d44000.ufshc: task_abort: total cnt=1
[   36.428550] ufshcd-qcom 1d44000.ufshc: HW_H8_ENTER_CNT=2
[   36.434015] ufshcd-qcom 1d44000.ufshc: HW_H8_EXIT_CNT=1
[   36.439393] ufshcd-qcom 1d44000.ufshc: SW_H8_ENTER_CNT=3
[   36.444861] ufshcd-qcom 1d44000.ufshc: SW_H8_EXIT_CNT=4
[   36.450239] ufshcd-qcom 1d44000.ufshc: SW_AFTER_HW_H8_ENTER_CNT=1
[   36.456526] HCI Vendor Specific Registers 00000000: 00000193 00000000 00000000 00000000
[   36.464758] HCI Vendor Specific Registers 00000010: 002aaa52 00000000 00000001 1c00052c
[   36.472987] HCI Vendor Specific Registers 00000020: 1b0113ff 60020000 00000000 00000000
[   36.481216] HCI Vendor Specific Registers 00000030: 00000000 00000000 00000000 0000183c
[   36.489481] UFS_UFS_DBG_RD_REG_OCSC 00000000: 00000000 00000000 00000000 00000000
[   36.497175] UFS_UFS_DBG_RD_REG_OCSC 00000010: 00000000 00000000 00000000 00000000
[   36.504867] UFS_UFS_DBG_RD_REG_OCSC 00000020: 00000000 00000000 00000000 00000000
[   36.512558] UFS_UFS_DBG_RD_REG_OCSC 00000030: 00000000 00000013 00000000 00000000
...

A revert of commit 85b2b9662854 ("scsi: ufs: core: Remove unnecessary
block I/O quiesce for clock scaling") fixes the regression for me.

Shawn

