Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3033CD4F3A
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2026 11:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NJbIF9+SuZ3GL14xJaxGIOFdDBHJdVFEIgFFkSn2788=; b=qwLbpLpQLuDrg6EJ7Q3/kYTg2h
	Dm0rKPCMYRdz1+qriKW5lL3tfERJm2T2p0qQyZAsTsxjUzGs9HkTTuS0opkhDiCSVfqVUf9RMWXwX
	K2FrrPH7bIJL08SZjI+Om/boOALIkrcG+0B8ATDZNyu5Yw1/Tu7/iBqSQEY1ntvR9xPqIhWw9y3BO
	v+qAd/iPmr5Zn66yw3GoNsQZhCI/nrUsF0equSjmJnIeG3kSS6rtbLS9p/X1RdS+jg3AV5fGKS+ch
	WuCGXuX36fYIDh5nb8Abw+DZGSyF3/TtBlRhmg0KavYbQKqenbpK5vQPppvtoy3X/fOvadpg0W3ew
	sxc16hcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMl9x-0000000GXl9-29ER;
	Tue, 12 May 2026 11:20:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMl9u-0000000GXkL-29hy
	for linux-mediatek@lists.infradead.org;
	Tue, 12 May 2026 11:20:19 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CABdUj2172952
	for <linux-mediatek@lists.infradead.org>; Tue, 12 May 2026 11:20:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NJbIF9+SuZ3GL14xJaxGIOFdDBHJdVFEIgFFkSn2788=; b=gmMXd897x1jIorbf
	dUHWp6M/MMuyaT0uJJxCsKmpuLRhP3qjnFVafvpSsCILY13VJYzkwQC5KNuTeQnT
	akDeIAFXULAVeC3Nry9CsKT080tbZxEJoDPNgepxQRd3AxSZfKUQ4pXutor9iGog
	IDXF7oGDY/tCvWI5B6Kcy8c8cAFFNudwBQVa3b9qlx9r60qt+jiUM+DNG+JmteDz
	rMSKLrUI52HCUknO1TNsC6WWjNxcjUsTOCi6rqCbzO5AqWmt6ufqf9PaIQDgDGA/
	i4AufnT6xOY6zA4sWuB+1YVgrvqr7Joxz4LUwIAmkcDVlsef13ZNZds3vYVRAL3G
	iJfwfA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nvjb1vn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 12 May 2026 11:20:17 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-83536dc3be5so5740764b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 12 May 2026 04:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778584816; x=1779189616; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NJbIF9+SuZ3GL14xJaxGIOFdDBHJdVFEIgFFkSn2788=;
        b=dJ9x49pgX4IkhBACUH5aNBnCyk8W8nhPWgVV5i3KdVbRGMX3B92Iz9/BSxxPqQyck6
         py8QXk7OmF94M9H1Ly1lGX3r9gpdAZfeunBIscsuzaLDZwUlSvBZpZb4rGNzOF/51fAh
         fkSZr6TwNeTQknGxtCHQcPTX7fhRnDPqWNi4+JVxlToMH/lxIUyvs1xj5UGAEwbCeEU9
         AmzXfX31CQenhaE19riy5xdmE6gX4n0oxSamzT61aR78HC6tNrEkoSKrOCHQmPq9UDuf
         4EtYWekpk/GQUuLRJ2IzQkGdqsUJBy4hjNWGnbqDnjA0oyHBdC1QBfDRUnENSiqWakSI
         TtZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778584816; x=1779189616;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NJbIF9+SuZ3GL14xJaxGIOFdDBHJdVFEIgFFkSn2788=;
        b=hXw9DpAxYAz7dGThKdhA/yYgID01I46jPGDQrJUc1LfwNiPVUsP5CYzg2DfkUnnkS5
         c2EY5H9vi/I0GP+3PRfb23cThF/UfY1d61ZJaGnMAoTimbSQYj5uPos0QiWA95Q4CWS0
         r2vP7dOmhY9gQO6/GpDj5bSPJb6K3BJGPMED3+6erWmKL7GDbcOb2IQ4+3tRkxTWzXe0
         lVNDIrhfyFxfrwF2XBvq1JR+pZgu7D+MekhTXv0gAYKWd2ZJcl3rq7OfKaCpT7El1Yl3
         Rmnbo2pA+E1mEbdAWxc2wgRejVLpe+dasU38ghMiXS+EHAdunGUUhXb44SN1JJrbZI5y
         9Efw==
X-Forwarded-Encrypted: i=1; AFNElJ8vqXgthrct6gjHzCekKKEXhU3HyJ+Olkgy/n8GhRR3E9b/jTod/lS1anjD/YHNVUxDH/R1+aJ8HO9vMGeqxw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzrExILFaRF1+tqCjEG+8pJ/2xZjxHSbVal6jkBODV1DKnSW4IU
	HQDzmRscpaouDxoM/u3FXFHzyNRlfCxaL2NH9+16Pzi+zp3Mo8DeGD1EduYu6IB5GzupqZdwrU6
	739Lk2Bw5bDpyVHfkUz/E5Z6El5WvWmBo+qgthMqCczO8/N95aeMbXNqwLTpjsuF3YoWTynxPVn
	Q=
X-Gm-Gg: Acq92OFZI0ZWMpw1IxmYS+GKyMU5KUVtdP9d/OzpwMB2VS6M5aQMxqUccK2cEn/bAcs
	x5eomY+P4DgrF3zsUnR39z+Q1qpOCPVucPmzYx9HA9TqTLvG9pERj8+Dki7QaRBeqmNVhjFySqx
	K5q3lY6yiolJIXKDCd33++nAAxLLXHpjSrTKQojbowUek0CFvdUPqMgLHW01Rso/95ZHHmQ7orE
	Ywc5mj5I2xiO88MoW7PojK2mWW1WqyPA+C0djshYK6xKNWTgjKJq/BuhU+dyIiR3YpwTY4io/yD
	a/1fSF88YOYwxLK9qrsyfX7VT5axMsL0gQP/EHuGDuMP0SUjb3LTZedt+P43CVdKGyQUa0XHvFQ
	dNSgBeKze67Gz7LnV9wjo
X-Received: by 2002:a05:6a00:2e87:b0:82f:5034:77a4 with SMTP id d2e1a72fcca58-83a5c4be2eemr28652207b3a.21.1778584816307;
        Tue, 12 May 2026 04:20:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e87:b0:82f:5034:77a4 with SMTP id d2e1a72fcca58-83a5c4be2eemr28652147b3a.21.1778584815690;
        Tue, 12 May 2026 04:20:15 -0700 (PDT)
Received: from [192.168.1.102] ([120.56.206.29])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965b333f2sm28587654b3a.20.2026.05.12.04.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 04:20:15 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Jian Yang <jian.yang@mediatek.com>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        chuanjia.liu@mediatek.com, yonglong.wu@mediatek.com
In-Reply-To: <20260413071401.1151-1-jian.yang@mediatek.com>
References: <20260413071401.1151-1-jian.yang@mediatek.com>
Subject: Re: [PATCH 0/2] PCI: mediatek-gen3: Fix the control timing of
 PERST#
Message-Id: <177858481069.17084.1434409769087889023.b4-ty@b4>
Date: Tue, 12 May 2026 16:50:10 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Proofpoint-ORIG-GUID: jGZF-ghENWmSh-N6oR1QusjFmx5lJjhM
X-Proofpoint-GUID: jGZF-ghENWmSh-N6oR1QusjFmx5lJjhM
X-Authority-Analysis: v=2.4 cv=H8brBeYi c=1 sm=1 tr=0 ts=6a030cf1 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=QuRtzvr4xB5J0le8HPcEzQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=bPlxViFAvYB88tiJ6gEA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDExNyBTYWx0ZWRfX9ebWzuKNxrki
 9OqzPNpqP15rmC5jsv/CTneJr51xBI6os8Y52oiVLsnh+KjmEAEnMWcbtobtFyCzQ5ih/UQcGW5
 xLHLIpSJeYTwJtolvjVIGbywXHLYOzJx1e9IJOgPgr+hVwZr5v6YbJkifW7ZvimbATQ5onO6teA
 ZsfUSdcaCgzjSHwDGuVC9/7oltVfuCvWqcDXDxqEerUZvyU0TH9a9NcZ7N7fJerNZ+7CF8mr6KV
 3NBG1rl6JcZtoaZmhBQUS0QrCMwl/i2pGXEEI1M+n7OdY56DsH5tpBe+ZQMvpKyh/x+3bCNTy7U
 AgfWHFwnDa0uk7b528VMmNUQlhooLdIN/iP3kGsSgnhPy3oJ4u3QXj0wm2njwd6nx6i59Kac937
 W609XBUQsFZOqfez3nK0wYH2FZoS3TWjKRfDTUNbTPGNHXXieKnvKkYFKbXVObo2q56/tn/SEm0
 ISDtGLCNb6ruzLHHsuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_042018_669564_CBBA94B0 
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


On Mon, 13 Apr 2026 15:13:54 +0800, Jian Yang wrote:
> The purpose of this patch series is to fix the PERST# control timing
> in the MediaTek PCIe Gen3 controller driver so that it complies with
> the PCIe CEM specification.
> 
> In the current MediaTek PCIe Gen3 controller driver, there are two
> issues with PERST# timing:
> 1. During the power-up phase (i.e., before PCIe link-up), on some
> MediaTek SoCs PERST# is de-asserted before the REFCLK becomes stable;
> 2. During system shutdown, PERST# is not asserted before power is
> removed.
> 
> [...]

Applied, thanks!

[1/2] PCI: mediatek-gen3: Fix PERST# control timing during system startup
      commit: bcc32882066156029e1e9ea16a3c3b8f3100cc3d
[2/2] PCI: mediatek-gen3: Add a shutdown callback to cotnrol PERST# signal
      commit: c019c3ad821ec38ee158cda4be5ab8e39d2d5c6b

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


