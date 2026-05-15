Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDDDCD343F
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2026 17:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7J3thL3GCbBboipeCsQGXuYdZX1osalYVS/liyYpuX0=; b=olhZ7pipG4pCCDeVV382REeHNB
	Olq3ikMGpFt3e3WIMQkDTPHOve37JWPm5zPXTEqBkV0XTYioQZbhj+5bCQtf8BErcWSwWUth7pJQH
	w0sJO3zfvCGLpdxc6hkI6RyXBp4lee2ptk5dFy2lkBOp+31J411+zv4NWcQWFPRk8xtkKt32djJ9+
	fmJLfqsexRzSLT3txrZNjyjHMv4YQFIan2+6jyY1RxUGK8q9rvSJo9zTep82uNZZUVREWqQ7xgfTc
	OPLTy6uoZZ3UbhihRGRXkYvJZrkTuTuJA0EmA9VRf3LepLvwz+Ykm9gaHhRSuCht3uaG+LAV7uphd
	LkMTp+7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNw3s-00000008xGc-1e4H;
	Fri, 15 May 2026 17:10:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNw3n-00000008xFg-36z9
	for linux-mediatek@lists.infradead.org;
	Fri, 15 May 2026 17:10:53 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBGKwL3512832
	for <linux-mediatek@lists.infradead.org>; Fri, 15 May 2026 17:10:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7J3thL3GCbBboipeCsQGXuYdZX1osalYVS/liyYpuX0=; b=Vt/W4/ZEBO4rtbth
	qWohdHMfN0rnbYTHu21stt0jb0kA0IfY8QKPwKx56++woTM1LZzwhmeVm9NZ531U
	uwqbn58PBl67Vt6mXcW3x4ev+rAL9PoLjln6ih80bSV6LFfFW24aJtK8vi8SZfxy
	vxiiDYB7+9zld/t67cFGuiLxPtYYpLiRfUpBMFSXMIZ8fvyZlOFv+V5Ah4IJlqFJ
	fpIapO38VaHrryghBJMCBsRse2kjib5FAzTYTAvpzj3AwrnOGDnoo6Pzw3dhuWEU
	GAmOhOeHq9xORYRBRSDFnWIFze5dL/nNG4aoNfAy+VKImrJTRwaJJJzLlG2FtujR
	nXjyjQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vc67x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 15 May 2026 17:10:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2baedd2fd43so1021935ad.1
        for <linux-mediatek@lists.infradead.org>; Fri, 15 May 2026 10:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778865049; x=1779469849; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7J3thL3GCbBboipeCsQGXuYdZX1osalYVS/liyYpuX0=;
        b=JTg6D6+68x40OFnps1nH49gYY1+dHCKhnHe6mj5dZTyYbq7LxtSzzD6Q29ZTIqn8sE
         a6jOl8GKm97ZjeH3yCiEAPpR828l7L2pceTEOJ1IWqRXmFz6tWPJqnLRlPBOHGt2sIkA
         cRglJBl6u8B9nf6HuT3kAytAWUlFZ/xTDWPgzFp+1eQLwOz/wiDiOys30ZsSXwpFjt7C
         Hzwj5PMxuMsyQN5EkyxHw1ugdkgVRbEZYscGRRWgOvP5eE5Iwx0GZsbT8W3am3XZEdwc
         Rszzacj7LX9zYNMyRbexIn1x2WjgZXFN1klrH7g5PAk8ILTVZAB8LatOIYAKJwdd5Qs7
         ai5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778865049; x=1779469849;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7J3thL3GCbBboipeCsQGXuYdZX1osalYVS/liyYpuX0=;
        b=b5usZDq0PABwmo7IDS8YoeNGDFIZlGItcndOMbIYamMig1ocdBQ2X8TnNumj8EvK1m
         Kv4lzXg8q+G+WYvVFudQheVuuYBLhZ6vgy9OP3g7CgjJYqIjQZnpbhkCsAFGKM05/Ldh
         4JgNMuYj6QZQfLMNNVHCQEf6zgkIJDpVjTOfNT5uh+oIm0Y0u5nSgtyDQWAhCwK+OeEv
         Tl7PPCkj7nRmOy8TMZqV853G10mwXGV7BJfolV5gotQH7FIsuVyPtB+kSZx8aaD3HT6E
         z+nBsprmnm6ro7Ew5UDK454hktTwdym5zP6Z8kXXgCknlFG2rTjWUkbTRTfnWRaIdBI7
         CSZA==
X-Forwarded-Encrypted: i=1; AFNElJ+5q9Hv4N2UA328Bx2YMbuwMT5oa+v2jg6ekqya03GUsMeQf7NQiERutL5HRM1VjK6W7xel6mc1vKP5Ja1kpg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzCJABWEsYdUSIRs8lwz755p+XcGlJGS4ZQFXTwbHI0CnnFRyAs
	VsgEY8X6BhxeE0KXuXVhPqVyoANAq5v0yZo1tAlF0mMCGyFzP7bU/caAxWr+AmFdZbPO3+HZGt+
	KGAiPyCEjFNODVyjZSY5QTEHBJG/6M6a58CJm+EwuG3NSGaYc9OxEaknpw+2mj4F2IN42HOX2I9
	4=
X-Gm-Gg: Acq92OGXwNRAZJgccSQ2nFmIenT0Shabws9PglFAXTyTEJ8+zYadNSXblHh6Q68EVTL
	yMxoVSjXm/BT/uMHK70Y7oVLs5G78LzNLyNKmE3JQo18V7/BqusGnrYf4b78qJEqwb8jiT5octw
	3dpfgfsrL9YxejaFKOgzL9LELUI3d07eu99RON7iG8UfihtMh3Q3eiLw3T9qXnhIZhW5z6Ufp59
	vI//MzRNCWMF+zHUZrDrFA0Yp4SBHiZIpiWbIcM6fqKxi916jg9g1I2WOO1ZTe3UVLuMuS4lR21
	AJhlfHLLnkT0GhwlnwfSnDYacdRTV9nYYduHz/PhOg44bT3iYhYRL/HvMh4gMvuyB45ZkRi28Dj
	eGAFMghl/d8nmkpWK/uN/
X-Received: by 2002:a17:903:13c8:b0:2bd:8395:feca with SMTP id d9443c01a7336-2bd839605e4mr45821885ad.23.1778865049258;
        Fri, 15 May 2026 10:10:49 -0700 (PDT)
X-Received: by 2002:a17:903:13c8:b0:2bd:8395:feca with SMTP id d9443c01a7336-2bd839605e4mr45821425ad.23.1778865048670;
        Fri, 15 May 2026 10:10:48 -0700 (PDT)
Received: from [192.168.1.11] ([120.60.141.122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d234540sm64176835ad.79.2026.05.15.10.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 10:10:47 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260505105918.1823170-1-wenst@chromium.org>
References: <20260505105918.1823170-1-wenst@chromium.org>
Subject: Re: [PATCH] PCI: mediatek-gen3: Do full device power down on
 removal
Message-Id: <177886504429.10117.12525954278575161298.b4-ty@kernel.org>
Date: Fri, 15 May 2026 22:40:44 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDE3NSBTYWx0ZWRfX0n1G+Bp0XVNx
 wRant2m5PPLMReIgi66fR6Kx3qyGX8AZUZqrYbtstsfDPb72IyzlK1t5A1D+X5Cnp19aZL6khr2
 ORBO7LwiB8GHywqm4Ovxgyr358wcbb4YadfRyuom5ehCQiD8ut7HABEr0tZ+xCholwOtJTSdGOq
 6bBs59nACyzQrywhgWc2UWNNuRaqObW6CkuTfHYvSgLmeyh0rk58eEG5cbHwd0OT92LXQa4p52/
 WSbM5vNPiVq8btDpNW4loPvlblWf3z+4itlRJlX10DMg0gG5ADtAIIiRI3y6FJv70PN02ihk11v
 txCvGoKQyiA9tLKU9q7eiRoCKG9H8yX9zBbHvXG12qPP2LB5GSiebR8RHBwQSUdscYUFFJSuonn
 bWI1xDXW+BbWy4F8J546vda/Jw5RQ+ocOTA3w5UVDPielv3J3MawR5BDgjd0FPNEXRix3QycuyY
 gAEFvq+Fnp8YXjISWdw==
X-Proofpoint-GUID: YF3LknQJ3AWw8bPOcRIRUAV_-UD_F5Ql
X-Proofpoint-ORIG-GUID: YF3LknQJ3AWw8bPOcRIRUAV_-UD_F5Ql
X-Authority-Analysis: v=2.4 cv=BvqtB4X5 c=1 sm=1 tr=0 ts=6a07539a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=8TBCxnFsifAbGBbxUCxq8g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=Gg1cva48JAy7FFupKUQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1011 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_101051_905341_055C2252 
X-CRM114-Status: GOOD (  10.85  )
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


On Tue, 05 May 2026 18:59:16 +0800, Chen-Yu Tsai wrote:
> When power control for downstream devices was introduced in the
> mediatek-gen3 PCIe controller driver, only the power to the downstream
> devices was cut when the controller driver is removed. This matched
> existing behavior, but in hindsight a proper power down sequence should
> have been followed.
> 
> Call mtk_pcie_devices_power_down() on driver removal so that in addition
> to removing power from the downstream devices, PERST# is asserted.
> 
> [...]

Applied, thanks!

[1/1] PCI: mediatek-gen3: Do full device power down on removal
      commit: 2b16d6b9de2f00fd8ecc433b15205c18f8276b3e

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


