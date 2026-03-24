Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45727F532E5
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2026 07:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2cyJ+xo5J5uXO5RSDiJtrPj/qdCmHyoKNI/w9qldPyo=; b=4Z5a28zIcfTKHR3MUGHq+0a6b8
	gTuSc5mZxFb5+HFrlIoNCOQxBsfTuezcJ2yZozhSdjAWfngWFL6DOXMIFdexSfbPqrh+6DP3RfEuK
	ChnL3Q/ze1XBZoxgJCSlokK2R8p9ZheV936sH12tq2stsBt2VKPl8jgfiE1QAozUbGN/tsHzfmWyH
	Qkjlzjj3G/R9cGYX29TjIzOyEFC5H+Nq+Y5Qr0IV6A/Ooc6ydd7q2Y9OHdbcnxbNKdmHH0+3Nm0cL
	DrIYsUXS4poebtvmV5e4IztDCkGE937Kw6zz3VFBRBLFh39zJNO0WOJNUDZdyhrWQqipAdxrAEvp9
	rH0hwyOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wW1-00000000vMS-1Snp;
	Tue, 24 Mar 2026 07:49:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wVy-00000000vLu-2qxL
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Mar 2026 07:49:27 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O3XCX9362514
	for <linux-mediatek@lists.infradead.org>; Tue, 24 Mar 2026 07:49:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2cyJ+xo5J5uXO5RSDiJtrPj/qdCmHyoKNI/w9qldPyo=; b=bQ7/gJ65rZpY/3zQ
	bm4iOWvzXNgKPrvlm5mlRzozCdqYJ989reLMknoDBwQBvVb+RYl0RQm0EbiOZVg+
	EQf/mHoFAOx0A9DJREHr6A9q96N5AGUtSRseLwqwwwuNSb5XxBJeroxTGI9g9DSd
	3i4JhIcgoc8aazFcPyfc4P3M//AKR+r8VnS2HdQ2xvoOdVSjlcNWQmQYbf0fSKkS
	VlPS/89tuzsHevKKQptthWtupN3moOB2wYADRexohxFkm7yhfZL85QtPtMbTWSpJ
	r84SlYLdAemxzz8N36Q3K/J1K6OvgPlwHyNr5jKxYv5QHBnMC/gRVwaDp0pe88EI
	8P3BVg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d33k34575-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 24 Mar 2026 07:49:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35641c14663so6589377a91.2
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Mar 2026 00:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774338564; x=1774943364; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cyJ+xo5J5uXO5RSDiJtrPj/qdCmHyoKNI/w9qldPyo=;
        b=fyrgnT01AtymqD01t8AiUYxoIEQSBiTDThPYOkduMQ3MXJe1m3Wt4h4GmN0RExpaLu
         EKdYNGkeWCOLefutRc5vEy826grE9hW9wB2dbyJeBwPxfGZkG7lKb1V3YQJrhRcPRI8r
         aShsVp5bDvcJy9XUVfouBavVxZHQf1ZLguITZ/z1kO1MI3BrTomL7TS6lXMOdV0cKdXT
         AMmhAgscbMZ8kYmJZpWYWuAApn/yck9/aaIRJCZqeVmGuC76ew4sHgYvEAiOtMSh2cvv
         YSDOisFzDSEBaaQfcEAMd1D9KSKdNhM2HAUrR8jCn7DjTmsGKxFDjtUkBOvuAohFqOyI
         flfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774338564; x=1774943364;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2cyJ+xo5J5uXO5RSDiJtrPj/qdCmHyoKNI/w9qldPyo=;
        b=SVpvHH3VQHbtqsOuP3QeEg3KbBpV9n1v+yG/Ab5/0X8lZKSZlZ63+OYpHrSHMcnV5G
         ppLaeK7R1487UP4ypvqu9w8cjbzLwu/gowMuJvFwS9YgxvYb9e8DQ91q6ZOe2egX7L82
         Ic4g2qj3IYUT5WYJsqbGsS4RWYk7NDWogTWnP84BlNHF9AtMJZmZKE1zMQ9Z2yX9YbH2
         QW7m5QVzGxW1Usl8vYAde/bG1ZsGInRlFpD9TOvu0pfqbyOwF2vvYM/prfwacMXQXCYU
         PE9A3CEpnUkqe2pBTDM+oiu7e6P/+iRFt1ViaFcbNqDZxHgJXxXUgvULqQV2vo7TQ3RG
         6NcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhIvB/F4wJ/Y8oKbF34KOEgvJqCsPA7MjeUMMJVYpGXINrUyI8YxBpIcXvueLx1na9eK+N15O6qFLVgUvB3g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyEbIvm9yKXkzhiVkrG+ZDgo2wGOIRt9kDP1GaCR5xf4sJfT3S6
	2Gf+0J7oJeVW5UjoWR39bRk/kP4SnKKDTcCUsfXtZMMTSkxaQ1g0fQ1k3SQme2Q33/V6+/eYM4m
	vojZuTDjkxm3I/oHQp918viOPYw3qs+7N/MX0RY+flERSeK8/hmr29jhi1WRziJoXmVb6kc9wd7
	g=
X-Gm-Gg: ATEYQzx4UeYezQHq2VrCC7gcpmQuBm0kLM6DHktBdj9W8Vc1+X1IzBsDUY7V156t69b
	NQXiw2jBJU0QlmmyRNsnJP8cs+VW3l7KKUgOtxxMzMkTKRP4Cugwobrn4dDSkk7lNJZfqUU6T2O
	mN34BmwnWbLd5fp54s6bLWE2e4zmlsPek2q9hOxw4ZxzpTIS4DEl6RSgimyE08mWptJe1SLmBsm
	NzVihC3hx30s3V7jgZYVc+q0SUR8kZmysgr+XaXp69V0PrFyzey7lzdeoUvA2cQFpXsTRApejTu
	zoISmwrj/HfDHS9/rt7vEb+HMUPBOfXvReF48u4KB2jE6ZG+v+HUizFwE7vxDnqm83lUD8pxKsg
	J8xy35LeK3MU8YGGmIx5XKr0=
X-Received: by 2002:a17:90a:6c82:b0:35b:e51b:1936 with SMTP id 98e67ed59e1d1-35be51b1952mr5318996a91.16.1774338564261;
        Tue, 24 Mar 2026 00:49:24 -0700 (PDT)
X-Received: by 2002:a17:90a:6c82:b0:35b:e51b:1936 with SMTP id 98e67ed59e1d1-35be51b1952mr5318965a91.16.1774338563741;
        Tue, 24 Mar 2026 00:49:23 -0700 (PDT)
Received: from [192.168.1.102] ([117.193.214.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c03206dcfsm1441552a91.13.2026.03.24.00.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 00:49:23 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-pci@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260324052002.4072430-1-wenst@chromium.org>
References: <20260324052002.4072430-1-wenst@chromium.org>
Subject: Re: [PATCH v6 0/7] PCI: mediatek-gen3: add power control support
Message-Id: <177433855940.26248.5285712170276296674.b4-ty@b4>
Date: Tue, 24 Mar 2026 13:19:19 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Authority-Analysis: v=2.4 cv=CYYFJbrl c=1 sm=1 tr=0 ts=69c24205 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=13ILl30Z8QjaXWZz8Pan+w==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=kFJ3RX7tyYxcrSALf5wA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA2MiBTYWx0ZWRfXyuFvfCbrHvXY
 6nOpbIPFQ6h4T5wMj7i/5BfQ5QHhsO1wHCZwUtszXFMn4oryBdnv+iZACdb4bBWyfokOEfM4Twe
 l04ijH0w1eD1aqiVXyHdNKVIWiooR/aPz17ZnjCDqJ3xdvlUGRdB4MXtq0q98GW/DC0Ez2daAfN
 uyEibdV1L08YqKBwsgsfc0BzR3sQ5rtJhlH2bxpIW0UvckvcI2l0JEOalmGrzPR3+aQwAYKpTOm
 kF565W+rcuWfxHd8tTmyUW8AJfJ/1A7uK8Sv4jPkLqoY+PceW4FU2LLsEUIL/7Y/cw/hDLq8glX
 URddv9+Iu1CMcOM4oVHvohrySC6RylNizzFaeRhXYyT2IgfwOl14w+U10+vjcEihJn2Zfg3w+NU
 Jfd4++8H4D7/E592lPExYcvfr640qzH2CPV7BfYH4dPgh9Bpga60cVqpiSOLlZJaXOMULod6gv8
 1pd8FJKHwjTaFSXfDAA==
X-Proofpoint-GUID: tx2MOcvC2swnlJ4F4FUqlDRoZmLxDUB-
X-Proofpoint-ORIG-GUID: tx2MOcvC2swnlJ4F4FUqlDRoZmLxDUB-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_004926_857750_DE9DCFAA 
X-CRM114-Status: GOOD (  12.43  )
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


On Tue, 24 Mar 2026 13:19:52 +0800, Chen-Yu Tsai wrote:
> This is v6 of my MediaTek PCIe gen3 controller driver power control
> support series. This series is based on next-20260323, with the
> commit a2b2ca0c2477 ("Merge branch 'pci/controller/mediatek-gen3'")
> reverted to drop the older version.
> 
> This series is ready to be merged. Please drop the older version and use
> this one instead.
> 
> [...]

Applied, thanks!

[1/7] PCI: mediatek-gen3: Clean up mtk_pcie_parse_port() with dev_err_probe()
      commit: 71f526831e9d7db53a7b01717bfb725759b1d06f
[2/7] PCI: mediatek-gen3: Move mtk_pcie_setup_irq() out of mtk_pcie_setup()
      commit: 0c7398cbd5d0c0d9952b6bcf1fb738e252ea0f50
[3/7] PCI: mediatek-gen3: Move controller setup steps before PERST# control
      commit: 67b1ff043b0ddd88e0a6af6c4c3590a54b60eb93
[4/7] PCI: mediatek-gen3: Add error path for resume driver callbacks
      commit: 76190e45623aefd6a84450af5c84e793f4f6a796
[5/7] PCI: mediatek-gen3: Split out device power helpers
      commit: b8cbed2f4d783f4d9f3edc5dc6d2aac848de3709
[6/7] PCI: mediatek-gen3: Disable device if further setup fails
      commit: fded9d718161f1c8da7a8464b87a028292ad5573
[7/7] PCI: mediatek-gen3: Integrate new pwrctrl API
      commit: edb2f4b495fbf1b148df0deee147ea5c320f56a3

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


