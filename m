Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ECC110A88FD
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2026 18:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mhld1R/N1HGh4ArMHTWbMovB6Y0to3d0n9zJbwkChvE=; b=SZO/gquFe/k2slRZBtu5CKdjAQ
	BmBSM6VbmjHDjVc/OMVC8ep5Xh6SQXQ/2k/x15fsWJYta6gxU6AJ7tP9s/QyWdl07bZePUEqTq+d6
	DIa7rUxkdwbt0CHdKki20P4ZV56qd5F0V8GSkVuTiSQ5P1K92ujdpqdcWroSpwlPDMgDuP2TdoSz2
	1nPaM0/5r82Fzt9aJlszIjjRjfWxC1xa8vwvsoBaf2nWc8Ztax+iaNbkt9rWZ0TZWGPGTBldoH8yq
	Sl9vKYJMYtvZjGiLkkIv/Kwby23o+NTqSARV7++0YkEK95TjnVUN3uQwHtuKTovIQpUu32AKoAr3g
	/yrEXCZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5pSS-000000062Fd-3WGn;
	Thu, 26 Mar 2026 18:29:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5pSP-000000062Eo-0tuq
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Mar 2026 18:29:26 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QF9goT334269
	for <linux-mediatek@lists.infradead.org>; Thu, 26 Mar 2026 18:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mhld1R/N1HGh4ArMHTWbMovB6Y0to3d0n9zJbwkChvE=; b=ENRwTg0wQgzSXmjb
	Mfte1+W3mldM2W+BFRwd5RobDOHcS6s8+faGOe2/GKEJD9WDyst+D6RhEif5zxkB
	f07S0mjqTvx+yjrj1RV22kPs2lTRdBsFTG8Bm6Flb9AIB6BxNP4kZeg7Mr4CeZiH
	r4AN05B/ZgCQNZqrsF40onb9wXoeab19z7+GnYtCUeQ3/EpHuqsyPDLIY1OTOPwj
	BpPfmU9Z0JNE9EFMybPlewCnDrMBcv008XOVT5vhTlktjiHVgD0LP49Omsr9vvQx
	3060uUgJI8cqVgNyDUGp9xoPwxoOzWirQICEKpKbwV6laGntEqoPrjAQGofLKPqP
	6chb/g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d527ysx63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 26 Mar 2026 18:29:23 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c738bebd53fso2196813a12.3
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Mar 2026 11:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774549763; x=1775154563; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mhld1R/N1HGh4ArMHTWbMovB6Y0to3d0n9zJbwkChvE=;
        b=d9qQ8D1EMjtzcw5lzSFzAGJZ1k4Jm/k5bWP0s6vnOiMwui7tm9E57t0dqcEMWNYLlH
         STd1NrLDdQ5E8r3djnwNi+qZk52Z2Kj8/7wlyoHkaINnpqhLitTJk1CTZiPxEmnnot8r
         NniLgtX6AmoRyTHTLdxWNjPDG4s331YFCwoJ7C7GVhCMK2PGynPleB77cNl406KkiZyH
         XzyfAWovtDGNBQL+DSWsYmDrRgEshroB7a5vheAR3dHKt5kfs4ra9Sry6m5u1JMnTV0D
         Yr77ggCTqm8IjgVvAF5Ac5g+9Kj1Re8xGvEUoyPZ6uKWVzXNH/UGXCmXva7ecLVukBFu
         K09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774549763; x=1775154563;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mhld1R/N1HGh4ArMHTWbMovB6Y0to3d0n9zJbwkChvE=;
        b=EmEn4juR4xR1twc8wkL4inl80kG070AEoxbBMoiPxjmEn73r6yaPB70cVVJIElxzHd
         cUJMfEI1YUQWvjOvpZgusJMy8zhO+z7mcf/jddYAJz0ZpvP3EI/6wW9aKyMmz4ySzZtd
         yYg6RqCCpIzBOwXX+YzBjCErgFCYygqRfhSpxC0n+mlnyYkkNJcuWZxQm6GR95UAydhB
         xogZ5Xrg06MORiPzEoEcoAjq5kbThuikdvgzCNMTDKgCkFuDAqS3kX2CTzer+McgO9bY
         yMwNpyPGs/u71YiLcHn74FZDt7m8mn/TPPAsIP2SYWH/RKvn7741ZqXQtr/Q/a0qNias
         RtyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDN9JFnuvhFjlsSnSfHdqNfExnFYAtzW9GnsOtEjWIANB5OyFfCxd+vkifXST47P4m5NdHrOjvmaCZynmIHg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzl8LGkbIU0m4h/AEeZ3mudohfvLOdJyv/15RmkO67ERa1AG0GU
	J+/ZTMbwGuMoWSDcLxYVkHu5cNLJfGP7abXe6aVDtrT6z8Xj3HXyTBMuoQA2uTdwRuMAK29JFWb
	SfYay05Q8PUPnZ71uuaTtUoF6ZjKgLO0Uq56m4bNOP1QQalcf5timcJuU8ENUSmZZaNOedsvyCH
	M=
X-Gm-Gg: ATEYQzx5bl3t1V5SBDx+v146L3vBvxzTMHGS0He+xHm0jYjmiECT8JpWW+U33ol0QPv
	kyoSxTehN4A3D+lFrI9Zn4EzYxr95jZauBAExPwHDxbExKFHg8tickU3x893m8w7g3CBge7q0bA
	HQxdlluNnvXcqPAJKEhn+SdhrFFzFcilLRxz3ln6Wbp5jQtFkFHTGFAbX1FNEifym/aNaf/7Hzi
	r0LUvQpqoD9vnto3UAVt15VTfnLnxBs+tbc+CijmCygJxxNDq/f1cJxnDGAg6ZEGgSIgH/MeblU
	QT4z58rtvgDzh2dMqwTv/phL0+7XCz56wyH/WQhx/RERoWNK2LaBA+HX9OMoCK3MR8MTKyFRQwf
	xD0+DYYmHigP1843vEYbAPns=
X-Received: by 2002:a05:6a00:430b:b0:82a:786f:e39c with SMTP id d2e1a72fcca58-82c6e0da77fmr8829078b3a.47.1774549762466;
        Thu, 26 Mar 2026 11:29:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:430b:b0:82a:786f:e39c with SMTP id d2e1a72fcca58-82c6e0da77fmr8829059b3a.47.1774549761916;
        Thu, 26 Mar 2026 11:29:21 -0700 (PDT)
Received: from [192.168.1.102] ([117.213.101.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d21777asm3568532b3a.18.2026.03.26.11.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 11:29:21 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: lpieralisi@kernel.org, jingoohan1@gmail.com, kwilczynski@kernel.org,
        bhelgaas@google.com, helgaas@kernel.org, florian.fainelli@broadcom.com,
        jim2101024@gmail.com, Hans Zhang <18255117159@163.com>
Cc: robh@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, claudiu.beznea.uj@bp.renesas.com,
        linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-omap@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        shawn.lin@rock-chips.com
In-Reply-To: <20260313165522.123518-1-18255117159@163.com>
References: <20260313165522.123518-1-18255117159@163.com>
Subject: Re: [PATCH v9 0/5] PCI: of: Remove max-link-speed generation
 validation
Message-Id: <177454975543.471319.11131195385745201008.b4-ty@b4>
Date: Thu, 26 Mar 2026 23:59:15 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Authority-Analysis: v=2.4 cv=dLurWeZb c=1 sm=1 tr=0 ts=69c57b03 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=pjPfvbXasfe8cMZvnaMi6g==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=YByT1-VEI5v2HgF6YmoA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: l5lq34bwUjPY72o68CynUbuIlNc-dztn
X-Proofpoint-GUID: l5lq34bwUjPY72o68CynUbuIlNc-dztn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDEzMiBTYWx0ZWRfX53ftM+cljdVY
 ZRO6kAhqbQdH3/ZseGcbwxfdCRsDs5zXTJ4pcBPyqzjoqUsGF9NBr+deZXxytFQNKEHfIPFdAOE
 71M5+g8Mo58CI2StJ3dewevMNUqEj7RPg2xoqYPZMRwtNUiVLPUTVQF9ttYcR++t8a1G22xkjpa
 h1CTXuLreL6VIbNiADP6EGhPDjThj3AZMuZodtbR40KA+68Tqxrhje+iXTLYh5fG+G3/KFlgXzQ
 G79c7rBHRITNjAuFmHqh9IkGpetXZ0quifBSZzcwiNbsT1BFGjhRcHBs8Epli75xfp0AyMqQQm9
 vm6SeUTlKEvcvG9TI4BuY2XXZEFwg0mjzOsF5wQuXNbTHyEQ4bnqebWY2H5H+71JWbs+NiUT2uB
 HoTSBqHiK/dD9BGPvvgtdMydgBU/c80NZwhZJHnrxwH6NWmV6nniu+sFtCQ3XehPxMqRK5PXBga
 hlJjEhzK9DY4KUX/hSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_112925_376793_2C57E7EC 
X-CRM114-Status: UNSURE (   9.46  )
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


On Sat, 14 Mar 2026 00:55:17 +0800, Hans Zhang wrote:
> This series moves the validation from the common OF function to the
> individual PCIe controller drivers.  To protect against out-of-bounds
> accesses to the pcie_link_speed[] array, we first introduce a helper
> function pcie_get_link_speed() that safely returns the speed value
> (or PCI_SPEED_UNKNOWN) for a given generation number.
> 
> Then all direct uses of pcie_link_speed[] as an array are converted to
> use the new helper, ensuring that even if an invalid generation number
> reaches those code paths, no out-of-bounds access occurs.
> 
> [...]

Applied, thanks!

[1/5] PCI: Add pcie_get_link_speed() helper for safe array access
      commit: df61f4732adf9de5ad1f5e71b7670710c1597d18
[2/5] PCI: dwc: Use pcie_get_link_speed() helper for safe array access
      commit: d884b0e51459175f17ddc52759ea4533bb752130
[3/5] PCI: j721e: Validate max-link-speed from DT
      commit: 1542ac6d83d0b5706f45e2937de7b4f7b8c4831d
[4/5] PCI: controller: Validate max-link-speed
      commit: d0cc5918a1d539344190cbb19fa3ae0e7b0dca1e
[5/5] PCI: of: Remove max-link-speed generation validation
      commit: 15217c7015c0e1804925693c55d721aad8987e32

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


