Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A37EDCD8CB9
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2026 16:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4APQVPv5UexJleRwUKeTyD/FNVUJhVermq4vMsM+NpE=; b=lpuUna+z2rmsSw1XjumUMi5WVE
	T1aDI8a0CFN64mbhDbK0DH1drM47Rq0pdxk+xQKpWwVLyUAuaqjPF3j6bRxTXWkrfu80fywcOBseT
	lTxU5NhIkM0wlNQKKx2XPCi5Td/bfXoXObGzDEOp3MC4DzzM78faawkLYUexx7LfW2wvaqi1z1xK2
	inTU/ZMBMxeyZHZ7ZQvFiXKcHEQJI2gnmhHWPBnA3mkrjPX9ibMuuowr4WWPbwHcSXNoIg9uJCj/O
	DZYwVYDKMuHV3lbveFAIlYVptzli0goSq3znguZLOY3i+acq5+d5WBga8PuvBr8WW82+N6a0L2LwQ
	xdWoXoJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWzew-000000065e7-0kkC;
	Tue, 09 Jun 2026 16:50:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWzet-000000065dg-0FBW
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Jun 2026 16:50:36 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659GOTxU3196820
	for <linux-mediatek@lists.infradead.org>; Tue, 9 Jun 2026 16:50:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4APQVPv5UexJleRwUKeTyD/FNVUJhVermq4vMsM+NpE=; b=OpWHOwprrxOj/oee
	8Qtn8B4DU1eBMJYuAEIiW7HH1wyUIRFdyOaNO/gikX2O72Pa7EjGWJ/2uQKy0OF3
	+NbwjZMvptK04gRgGNXa5YvQKBfHdi/cufxLt5yn/8MvjA9M6ij1tckjo/k9Ljn0
	qylcGNBetW6FOErjXMEfz8XrPOJUsdoXvHLocUKd5Yp3NtRHnZ2JRVfZFhXg/0kr
	pE/YihJ6NVN9v9oP79Vp5dMJPreioHYv/4RYSvIKQ2binsYtzbSBNtd01A8lKaF2
	xXVIrzm80qFNEhqn2QAxjYHVpDWVydRF3FZdHnCVRzCxRx6HXxHKJYUmp8U18dgh
	AhhwIQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3v26pe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 09 Jun 2026 16:50:33 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85a2cde332so2908794a12.3
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Jun 2026 09:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781023832; x=1781628632; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4APQVPv5UexJleRwUKeTyD/FNVUJhVermq4vMsM+NpE=;
        b=dDylMOAtDjUv395qL4NtYRtnqkaitapfL9Z1TJP+Py2sEy7DxQTeX0S5mCBxUey4Wd
         6hnbCyklirh7gjL/WOz/8EGn+DKVq5HG2k/28La2ECOdOkyEzaNr9NOcsKP47LV7C06C
         EuDWDKvyFnfMPNcDOYZ68QtTdqyO3YjGP0a97ZTb8Xjahk6PH9Lb4BWj1y5z56sS0qO4
         3iLFBa9bkbdxlpkW3tznxZI37sdoMGy5CgTKrOcfCC4KXbMWYP9xP8v+3f7v7pKL1ocE
         KuwPnA/UkH/wgesQZSjYU3FXBW8/krpuHmKlA5oTJmBnt6ttcUOWs3sU/1d1xvO+7G5j
         BGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781023832; x=1781628632;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4APQVPv5UexJleRwUKeTyD/FNVUJhVermq4vMsM+NpE=;
        b=STKm9663EOYIlBIs9Q5sCKa+10WTKrMSI+TZI+KCLHvQKukjBvYF38Hicez0YkYOoe
         M/mf6cWeP/194Yrj+BrUQOSDv69oYzLDqouaGky+NlNEb5ol1rogmK7f2gAeVEtI0RU2
         vv0f0Ak/kZL/rpzxogCBmhurF95b8GF6gCanj5joiiPK2gNbZK22rPJr08zqm4dzgofd
         b4bWbu0ZzCQh+mygTyPy5gKfHZkVVwn2yxopvmznh3PvXU/vQRfZyc8T5FcgUnWXt5kY
         EOolkAzgeevfIoDXmhZe2MP3tHKci9KVwhQbi7GpycNG0VLG3oYODAHhs2thDv9nIASZ
         t6UA==
X-Forwarded-Encrypted: i=1; AFNElJ8IE2Ti3Q4nHRcSB66pLPCMy/BrMdrroauNDEJ300lFGUq01K2KaCAkUB+ETKwyByz8B5DoVnR6NiPhEsX2fA==@lists.infradead.org
X-Gm-Message-State: AOJu0YynlGnK60T+toEd+mCZKF2wZXpHagxfICc25VcImqaTqViy2h0t
	1c/hz7T2MX/sjeei6wSRu+WvjXc0JsnhtW1TKKgUgTGZfKzXZ3QprHWrobHs6Jdtk02kyVIsYwB
	12ZUiYz/OmGbzP9m3RYWNW7eYd1lzIzJXenuEFoh7qQLAkYOu6eY9LFQX6WD385sdo5nVJVchEZ
	Y=
X-Gm-Gg: Acq92OEe2MRKFvL5ggZzneNF23fXw0ALa01xgCBcXfn+PLfz1+F2JXXDO2hVbN4W8G9
	O60+2Ob+BOK6yZx/xMBVoJxSli3mi7d7AeviZwiJ7BAfWqQ4hP08iHiD11bUYSsNH7hvlxQVLes
	FiO3NxgVYwb4KPppBBdXJn2yKD5R7KivEd9o2WfgEEk5lQdP50vpepormlYXaCN1rWkqBml2EKE
	RsqUaRHe9G/8rx5TOmOM/Res3ts3Cc8ED5BOY+Gq8Szj0GzKSQfb5MKlxFdOJ5X8KG2U2BMFfAo
	dnPQLpoXWkL6z3A8966HrJLTUwJtVJjFcwNno1B9G4hixVBeuqmF8E6dPQ6KyHoauckZ3TZRkeP
	//i3qJ4z5796HNvidOj9GBOWgWAsez/o=
X-Received: by 2002:a05:6a00:1ad1:b0:842:4387:34c0 with SMTP id d2e1a72fcca58-842b0f1e8abmr22235201b3a.5.1781023831664;
        Tue, 09 Jun 2026 09:50:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:1ad1:b0:842:4387:34c0 with SMTP id d2e1a72fcca58-842b0f1e8abmr22235170b3a.5.1781023831127;
        Tue, 09 Jun 2026 09:50:31 -0700 (PDT)
Received: from [192.168.1.11] ([120.56.203.186])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282882156sm21310593b3a.33.2026.06.09.09.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:50:30 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: ryder.lee@mediatek.com, jianjun.wang@mediatek.com, lpieralisi@kernel.org,
        kwilczynski@kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: robh@kernel.org, bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260521174617.17692-1-mani@kernel.org>
References: <20260521174617.17692-1-mani@kernel.org>
Subject: Re: [PATCH v2] PCI: mediatek: Fix IRQ domain leak when port fails
 to enable
Message-Id: <178102382633.15301.10190757934266235538.b4-ty@kernel.org>
Date: Tue, 09 Jun 2026 22:20:26 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=St6gLvO0 c=1 sm=1 tr=0 ts=6a28445a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=eDurORsI8St+1bJHqsJewQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=mJkhQync_lts4CGhekwA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: qaU_sIo4uPmyShU039fUyRcMXllEKAU8
X-Proofpoint-GUID: qaU_sIo4uPmyShU039fUyRcMXllEKAU8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE1OSBTYWx0ZWRfXxfYe422poBeQ
 uJxTfET51BhAbd45G/fVg+m69QQ8KI9enLbQ9Zp+OgzFbkm3z8s+SR8s3WKn9iqc9vgacpUUNiB
 aO+oMg+zjamOL473YQsZkJXn0M40UoiclwQSvZ9WF7uG0wwD9e1YwgoPiMUX25rv898RS04pKA7
 30/Vx+zR/KLVL6wgGSBUQDLxuL+DiXUi/gpDLgQ6lxnG2K+7M+fRYEmkzTYcPzHuE90vBOf+Owp
 Nj2K8RIFu+VmNlQNkHsvDEaRSDe8LhtXOJiEzbImljpQnsvAToPwZZZf7XJqCDLx5dcgG1QzL2c
 4Pu/DwpyvnOLo5FbAQHpisQq/RVH54BqLbkCWtGaOlfKoh+CCa4mUvtwprGJMcgrxxOahTHG8xr
 V/krPXVDFlA9bPBaN5u4tYRI0+rJ1u5T9Umdt7caEhCqW7VTZf/XdqvM811NRRJtRnoG+krMQ6G
 Yqacy8CypO437kblabw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_095035_249389_D1437481 
X-CRM114-Status: GOOD (  11.90  )
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


On Thu, 21 May 2026 23:16:17 +0530, Manivannan Sadhasivam wrote:
> When mtk_pcie_enable_port() fails, mtk_pcie_port_free() removes the port
> from pcie->ports and frees the port structure. However, the IRQ domains set
> up earlier by mtk_pcie_init_irq_domain() are never freed.
> 
> Fix this by refactoring mtk_pcie_irq_teardown() into a per-port helper,
> mtk_pcie_irq_teardown_port(), and calling it from mtk_pcie_setup() when
> mtk_pcie_enable_port() fails. Since the IRQ teardown must only happen in
> the probe error path (during resume, child devices may have active MSI
> mappings and the NOIRQ context prohibits sleeping locks),
> mtk_pcie_enable_port() is changed to return an error code so callers can
> distinguish the two paths and act accordingly.
> 
> [...]

Applied, thanks!

[1/1] PCI: mediatek: Fix IRQ domain leak when port fails to enable
      commit: f865a57896bd92d7662eb2818d8f48872e2cbbc7

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


