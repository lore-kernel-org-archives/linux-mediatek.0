Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 526A7D68BED
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Dec 2025 08:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0PRJSZMhYjIrNXAJQcqmzs0QiGuEw9weuKeOmqDlpz0=; b=09z4F5CZXQSA1zZ8RlCgRwk1c1
	9b6Ijq6BA3ZqlDs2hAkHh7nuzaqN+DovHb+JriD1Af26RduuF/QCktE4S0YGVBP+UmsE57Akxc8bF
	CEw7sM2KrbpOVEHJ72aQjHG8xvrMRsM/JT7UhuQVgd9/MXFQ69/4oXLS3/uw9HchMufwTKprRBE5d
	HxBJG99U9nBYnvrRl4EC5hnIQXA82SPExX1nBKbe3z1DUssDFk/xv5GK0wd8dmGjcNGnLWJHYqVw1
	8IcFnErBW0kUGyOLuwDkU/x0R7F3FaOMpoGAefJj4JYr/dvUa2CoiiwUdR6vkECwx4WNfArnpp+cr
	uU2Bnumg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW95C-000000080i0-2ZDU;
	Thu, 18 Dec 2025 08:09:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW959-000000080hh-3kpw
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Dec 2025 08:09:57 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1YZw0813774
	for <linux-mediatek@lists.infradead.org>; Thu, 18 Dec 2025 08:09:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0PRJSZMhYjIrNXAJQcqmzs0QiGuEw9weuKeOmqDlpz0=; b=M+PjNPIPNp7lk+vS
	Q+fDoqhgvjHbentJfBf3yeRNqQdmMkBniYLrMuYRMGDqOKntk5wHVTMQ8KzizstY
	n1zq78trk69FnGhbLEhJgl3T25clS7ZCkpikxddGIJ0pQgcdplhYoJaJcCcXh1nz
	Hrn03sq48B1hX2Ffc2+cQo+y4b1JkucKMJ+EVa8E+iVM2jmN3Hz5VF0/sWrHzdxn
	0rG5eiz5+tfIni4NzuDB3saRmOsmUDFhNvqIEd/8jbAolBapI986pcYib3ecYCXj
	4+uV7E/B1TMmT4chTYKS//6g9ec/KQx8rJAkUefGVg77je6qG3hNZjKs0jI4F+rY
	qrdCxA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b40v7a5q6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 18 Dec 2025 08:09:54 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7baaf371585so912133b3a.0
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Dec 2025 00:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766045394; x=1766650194; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0PRJSZMhYjIrNXAJQcqmzs0QiGuEw9weuKeOmqDlpz0=;
        b=JVybeCRufPArbZvHxELRTH7LGadhhzoFr1Rspb8JV/VTtZxcbj2qs7eqXRublhooOD
         46De9cRy30BnYshrSkLrlqZ2tzMatR2mfqugj0zUQx+/vIrGvrbyCXS4h/fgBFx5TDFy
         Na1GnU35u1O2D9323zQebNDDWD74Fbkcq+Ni9egB30akvqZO5jtK6cZJXCcFWPbrkIo4
         tQrOI5c+l5sRT6BhkgzjiMr/lxKEuMrXJslwTK2Gy4FDWb2CNi730CT3AAOxT7qRHkDy
         q6Z2NBsGVNwTOkyonX4F+yBbQiR3lpadwAWwMX/hcOBvFPaZLELzH+3GaNjlJh7M8920
         J/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766045394; x=1766650194;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0PRJSZMhYjIrNXAJQcqmzs0QiGuEw9weuKeOmqDlpz0=;
        b=VwLoHNCqt8BaZzb7/hO6hsYeuTonXzxkk5SCwK7jLST2Qs5/wTXImxk80zBm1P2jNm
         3gGfhX5kN9X94q+oE7Ma3k9urE1RM9j+I5aDR7BBSsYdrncE3bm3GcjWcfAHv0wG9bG/
         iQ+wILhSmXmluHQx7StFNlXIDpRDJa/YAj9YlIvgXlIB+8csLOB0PTlsB7lwkDif2QSX
         6s71XarnnZJ/SiTRPCcmV88ZnymJBtMZEWMH/RoI0CC7yI60W8mEpDIytJNp39vwmkV5
         bgHCLJKcGozU+oHl6c/1rLpALiCra4i44MRlsjbqcSN/HfWBTW6V6gRLp4u4I5MA2agS
         XajQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsDYDr0q4HrlIcIgMOTPzXK9ytVw9PU1VRMvTESrlTKWY5p9anDsSoij879d1IKnUDy13v1hfzjtRk0xLJTA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzoeV93QMF8j/vCXfPvqjkOusm3HEJpn/jFKCcMJiHhDtM5dfOd
	cGck6y1J24YkGaiV6EZEILadNOKOQKTaIgSO31S1xC0BWCRjfg1rVT2SVn0fhg6Mi7IepVGBe+2
	XHgaq4GDSRFokcatVi1XePo/W+RwgUp+X3y2gx7Apst4zg07C5KkRQHxREtfb6KSS8dVg+6cBdA
	g=
X-Gm-Gg: AY/fxX44T+a1zuEkRzEjtOIUbCLnMoRLK67ASah/y2I5qOLisO1QhJyMaV+WECQw/sI
	RWS6XYJqXz1iaTSMsNQU7jOcXx/RnWEwR/jeHKBBVswg4YQlhRCzlLnb5d7gRQ7WJ68K+EB+/mS
	AmHwLkIT4GC1o6hz8qBCPGtRJqS3skkavELexss96GkLBAltOBrT9CPcqlgRO8V6oLXDjQvPV9Y
	Ya0PcTxPOJlmquYMpS+Z6hWb/54IBCEbq/Dv24VFeXbZ3xleGCSP5sjxZOYuIMLHdagck8KAtTE
	69Pao6DddH7zxQ2dGN/uiMZ0gl4MGZ1/ujcxT+LqXe9MljHjjK4w0PiLRD0g5FGg1ZE+rAEjxvk
	ZHtNc0OrNtlU=
X-Received: by 2002:a05:6300:6c07:b0:371:b0c2:4acf with SMTP id adf61e73a8af0-375526a87d4mr1612186637.7.1766045393607;
        Thu, 18 Dec 2025 00:09:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmIccgva5UfIoEzAcbWNW62aOKsmh4XGCH3pevdPzZO0B8HmmMiRvdVF+mtOme/r5SawQ5/Q==
X-Received: by 2002:a05:6300:6c07:b0:371:b0c2:4acf with SMTP id adf61e73a8af0-375526a87d4mr1612168637.7.1766045393117;
        Thu, 18 Dec 2025 00:09:53 -0800 (PST)
Received: from [192.168.1.102] ([117.193.213.102])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2d19269f0sm16396495ad.79.2025.12.18.00.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 00:09:52 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>,
        Jianjun Wang <jianjun.wang@mediatek.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>, kwilczynski@kernel.org,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Haotian Zhang <vulab@iscas.ac.cn>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20251119023308.476-1-vulab@iscas.ac.cn>
References: <20251119023308.476-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] PCI: mediatek: Fix IRQ domain leak when MSI allocation
 fails
Message-Id: <176604539000.841113.9092054369644605366.b4-ty@kernel.org>
Date: Thu, 18 Dec 2025 13:39:50 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 4bsUKpnBxvRB-wi_MZdETQ5IETZWE54y
X-Proofpoint-GUID: 4bsUKpnBxvRB-wi_MZdETQ5IETZWE54y
X-Authority-Analysis: v=2.4 cv=f8JFxeyM c=1 sm=1 tr=0 ts=6943b6d2 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=PLOdWElDzbaVVj/XHNhp9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=GFOaCdBx-FylsINtx1sA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA2NSBTYWx0ZWRfXxnBojmJDWIog
 AD4BdCGJm6EllZSZWrRgOY+lfad443War0WyK2KW2PpwdmrVB/cKVjTuDylpTBNSDNCikArqfgq
 ZdhhiS0EBXXkXsfbWHlViaDUW+Kswh+8fq/C+nh+CwcfoEo7pxQbciNv5X2+1e0jzU3wY+5s+HP
 x3o4vyvSuHckOP3VC/MqfQHfWSvv2+lj6pvpal96OeoW0mK+8Ndz9/HIhNS6e9LwAVX/SuOPqs+
 JvY8UqetMR4prUmG/U87oMwfrFywvUwcKmDE8wcK+OcBr+M8wkyRWJQhbYdt9RL34bvd0JwyE3N
 0WRZ6Ke8ulW0sJutYIny5MgKx0amMsy3wewBp7Sqk6v071cuikF74Cu6Zw+4RfWkEn3tPNVobri
 veIvViigEYNTazEsd9yODGzk2BjolA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1011 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_000956_085040_3EDC09AB 
X-CRM114-Status: UNSURE (   8.92  )
X-CRM114-Notice: Please train this message.
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


On Wed, 19 Nov 2025 10:33:08 +0800, Haotian Zhang wrote:
> In mtk_pcie_init_irq_domain(), if mtk_pcie_allocate_msi_domains()
> fails after port->irq_domain has been successfully created via
> irq_domain_create_linear(), the function returns directly without
> cleaning up the allocated IRQ domain, resulting in a resource leak.
> 
> Add irq_domain_remove() call in the error path to properly release the
> INTx IRQ domain before returning the error.
> 
> [...]

Applied, thanks!

[1/1] PCI: mediatek: Fix IRQ domain leak when MSI allocation fails
      commit: 7f0cdcddf8bef1c8c18f9be6708073fd3790a20f

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


