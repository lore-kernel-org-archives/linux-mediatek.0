Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF0ACFD621
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jan 2026 12:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bC0wC25dWX1u9h804y9npqlSPE9Pd9D9e+NxLaj/2I4=; b=P6B4lhaOwSitE+/7nahPXoI6+d
	Kxm/zTtCAxUsPFvYn5++Xtbtms2MM5M3hpn6cqHCFvIlwnK2ZbElRm00e/R1IjhxZbUme2yXwGgcw
	UOn/XsC09YTV6oasBiSEpecgORDVqjY9Yp94sNGPUecLHuaAEHBMMbEJmHP2WvfV33rKpedsjF/NT
	G9Spyd95wZafR72QG0eLzTHp/x9wSkZgAh/LGP/yxsRYBJe+of7eD0O8NTBdq4miEWYIx+SaAnbnP
	TnGuOKxjHTBeXSq1mKLpHzmtPHPYyPqH9+8w2l8d1u2FB0Py+T2A/3Ytwdm7FDUd2MBHjGm0OG9ZC
	FxQaytiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdSlM-0000000EukM-2iqA;
	Wed, 07 Jan 2026 12:35:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdSlK-0000000Euj3-1EfW
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Jan 2026 12:35:43 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607BMgDK3152993
	for <linux-mediatek@lists.infradead.org>; Wed, 7 Jan 2026 12:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bC0wC25dWX1u9h804y9npqlSPE9Pd9D9e+NxLaj/2I4=; b=mclLOmd+Va5hvkJq
	I73xotDuEPUPz/8m5HsSnCU2taxUQmDmbgWwX2kQiNnHkhINHy4wAu/OF8+lAHj6
	us43TEwIv7ZhVpfrB1Se+qnRMlQZl1iCbUaZR/3eHNGfAsFuqqpSUUS96cDuuUx+
	ZLlHwR0Brvrg+1PbspBuw8bdVWa/DHSW32cuEz8IGNlqzF4XHbJqoPX1SJXRRUXz
	Fjy0QqYySQOnlI2zDl6f1WCC9W4NtsUTogulzaqgBP6xP24vdlN5szN2LZZieHAj
	/muaIpc5NfmykX6B/YGgwvXn/3ST1QLhP6EFkIX0vw2Y573ssJ+AhZ0QWCs3/Olv
	PGFzGw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhpjar5qe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 07 Jan 2026 12:35:40 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7ba9c366057so4240166b3a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Jan 2026 04:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767789340; x=1768394140; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bC0wC25dWX1u9h804y9npqlSPE9Pd9D9e+NxLaj/2I4=;
        b=YN89/+FLXYufB7Hi/a9VlmIp5Uf0bfOL0BTHi4E2IJ3X11iDCu79gKVYad69+I6I6g
         g7slxzXm52+lNRZHzwlulUuAhRd6McmWmsbxn17S0SoeWwhcs1ULzujRNMFPgce8sjDR
         mP/VAT+vgMZZrJx0QiygJS3bHJdSr74OM+hAUHCGDZR3yA5zdDUdvXXdm5fRLfYm+EvW
         U93O4OzEOz47IU4A9X3V3i3elae/Dl+ScU9mUDf8+NS/Wx0zD6FJ00kmfeKXNSrIn+L2
         hPsYBLiD8F+I/Tkyl1Xn3XRmiBRUb1h3G/EAYGvdgpneNChV449RWX48k1tH5ukmr9/m
         ga7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767789340; x=1768394140;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bC0wC25dWX1u9h804y9npqlSPE9Pd9D9e+NxLaj/2I4=;
        b=cE3hVKUCNGICrL7Rod4938c9Kbd0+BCPwwtKEnFQAmVxs9OODG9E/wtHqyl+y+ih9V
         E76pMR7NH9Zu6aaShXVT4q6KXVUPMH7O7UkN5yeVsG5ZwHehEOobcdIQf/brPegoN84C
         2KacC06ik7rF3rQ93n7+9UG58ClIgYplOzAmnpo3FnLiYT6HvikMOIXr1LIN8CQU59SU
         jGN3od/zjs8fuYKso3xwd5qL/ah9FsCORFO/iCPhk3qH5aIptnvA96A54tJyJ4OUGxSx
         9LmSqmmmUn7CuhUDOtaUiL56NB2BU7v1BKfyyQ1jn8gjmBLX17VvvTtXl3z6YVos13yU
         TylQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9USmX5WeJJwuw78rI/isUT/NVuKb88iLNoThk351DGoUZi/uww8MuIxKlii8po4h8YmnfXQSy173Z4MX34Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzWr4ojbv+SpbvOp0kkvNXfK6yuJjCbppAr4f+C0zXUkE5bA78s
	o2Ii6G08POhcoCKymD6Dcgy006rBsxHVy0XvsuMCxlywQFg5Bh8mvC+svGyb33/Y/wyiJV5LljK
	707HUJ334slT8OU84SjAA52NJOQYlFh5MMiPUZDaFKDEhICT+ydxwYnCrgvwNKsZoR1h6tohCLh
	8=
X-Gm-Gg: AY/fxX5e8InJw9erHk4cIlM+aixQsi1olnzahmINAGaV4kRu5cSvj6MOriOWBF74mKU
	3ICId7Jc3GdoKe8wTLgIOHLYuNhwH3S0Lrt0PJqICZ1ZHD2ZaE6xiUIF+33a/prZDxyHeDiEdyx
	5cG21wnfQXzXGn0YXY6xi8pGtRqGp7EwmcFSDCCtX48K02tKqLxfObyXCFcJJBCkf/6typqGjeU
	72dkN8WyVolgZUABkDV5xQblaCEwWJn1ggU5AYascdZiSPEHJ8gNhPCEOpSGrpNGCFyKTufa0Bx
	S3uE8S8vWke2zfkIo40VDyqnYtEB5yTLFBr5ZotgkA/IaxXmIMouJSGww7Im6EymoJ0hCOuqnSr
	FnZn74rE=
X-Received: by 2002:a05:6a00:348a:b0:800:902d:9fdb with SMTP id d2e1a72fcca58-81b7d861859mr2145548b3a.5.1767789339621;
        Wed, 07 Jan 2026 04:35:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH93fKUDfasuP5q8gHkOnrMUzHklFoNL76RVcQSiBJyvyfD7E4zZeOiwuGWUMy40Gzp59Romg==
X-Received: by 2002:a05:6a00:348a:b0:800:902d:9fdb with SMTP id d2e1a72fcca58-81b7d861859mr2145512b3a.5.1767789338774;
        Wed, 07 Jan 2026 04:35:38 -0800 (PST)
Received: from [192.168.1.102] ([120.60.59.91])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59e7c16sm4940286b3a.53.2026.01.07.04.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 04:35:38 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Jianjun Wang <jianjun.wang@mediatek.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>, Lee Jones <lee@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
        Felix Fietkau <nbd@nbd.name>, Sjoerd Simons <sjoerd@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org,
        linux-phy@lists.infradead.org, netdev@vger.kernel.org,
        Daniel Golle <daniel@makrotopia.org>,
        Bryan Hinton <bryan@bryanhinton.com>,
        Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20251223-openwrt-one-network-v5-0-7d1864ea3ad5@collabora.com>
References: <20251223-openwrt-one-network-v5-0-7d1864ea3ad5@collabora.com>
Subject: Re: (subset) [PATCH v5 0/8] arm64: dts: mediatek: Add Openwrt One
 AP functionality
Message-Id: <176778933103.573787.15149542478385360900.b4-ty@kernel.org>
Date: Wed, 07 Jan 2026 18:05:31 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=efMwvrEH c=1 sm=1 tr=0 ts=695e531c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=jZ9eb5YeB6VHmQ1DXVOWBw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=QX4gbG5DAAAA:8
 a=w7wmWQyBmLUzaIw334oA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: aDvQhcvlzGvXzGyHVfnWewWxx55p13Ji
X-Proofpoint-GUID: aDvQhcvlzGvXzGyHVfnWewWxx55p13Ji
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5NiBTYWx0ZWRfXzDdKmpIu4+ml
 2QO+KpQu4i5twyitFz/qsdGLZ/oqiydaGJX/472aJR/J/ee4BTedHdQUUJw0NFu96/ubSAuI5XE
 IYTbGfmwuxu+p5vBZiatxAnOHmmlc7I2OkqG5bojIuQSX9Wmq5tBloOshXDEsM0VpjeWRGo2Q7n
 pFyAOTGQgrMB9AL/AgrQUxw7fGbLAfK0YDRx5VJgO33PuVmFpFfO6m0l+L39f38yVB8wi3rtfYm
 cffcRecxlvpR3srvBpL7JD3eu4Aooqe59LQHqN231ia9WWAR6jxmgsRpkS9BjUTFU8HxtIugpUn
 gsW4oOMlXiet4FyYbmeviaHm8SBVGAH09dKn0KjnYkdVdsHYyC11CBWgMdxll6rzorMJcHgCzfE
 +Tp0uX+vCAOX7BKFUxLWdPXbm23sFgezDerBLB4mPLyBNMT3aCmBIdZIAhQ5zHrCuSGZ6Y+9m9m
 CH/1Ix5WePtVaqkVskA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_043542_391050_AE9F0F88 
X-CRM114-Status: GOOD (  12.56  )
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


On Tue, 23 Dec 2025 13:37:50 +0100, Sjoerd Simons wrote:
> Significant changes in V5:
>   * Rebase against linux v6.19-rc2, dropping merged patches
>   * Drop note about disable pci_aspm in cover letter, not required anymore
> Significant changes in V4:
>   * Drop patches that were picked up
>   * Improve mediatek,net dt bindings:
>     - Move back to V2 version (widening global constraint, constraining
>       per compatible)
>     - Ensure all compatibles are constraint in the amount of WEDs (2 for
>       everything apart from mt7981). Specifically adding constraints for
>       mediatek,mt7622-eth and ralink,rt5350-eth
> Significant changes in V3:
>   * Drop patches that were picked up
>   * Re-order patches so changes that don't require dt binding changes
>     come first (Requested by Angelo)
>   * Specify drive power directly rather then using MTK_DRIVE_...
>   * Simply mediatek,net binding changes to avoid accidental changes to
>     other compatibles then mediatek,mt7981-eth
> Significant changes in V2:
>   * https://lore.kernel.org/lkml/20251016-openwrt-one-network-v1-0-de259719b6f2@collabora.com/
>   * Only introduce labels in mt7981b.dtsi when required
>   * Switch Airoha EN8811H phy irq to level rather then edge triggered
>   * Move uart0 pinctrl from board dts to soc dtsi
>   * Only overwrite constraints with non-default values in MT7981 bindings
>   * Make SPI NOR nvmem cell labels more meaningfull
>   * Seperate fixing and disable-by-default for the mt7981 in seperate
>     patches
> 
> [...]

Applied, thanks!

[1/8] dt-bindings: PCI: mediatek-gen3: Add MT7981 PCIe compatible
      commit: 407cc7ff3e99f6bca9b4ca2561d3f9e7192652fe

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


