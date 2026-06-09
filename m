Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B53CD8CB9
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2026 13:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BvgE76byBkrnG87M5GQBzCx6Gesq1V6QYXCaC3lyE7g=; b=fuul1cA86kINTDK/z0TbEj2HFQ
	sNt3MOyI66N058tmYnOfqs+NVof5RVSzdmqLMgI33H4VwRwe6ySHT7TVvmk+Tb22qDhGlVIrQcNuZ
	gLrXbcfyeHSDPH3EX/dfHRrVAPQaI93noLZ/7wyhlJaJPbQ9Y/vvBu9EODHhfMzl6T2znvZvzAo9v
	UCnoblBNDoRpaM7wm4OHdYX2Q+aZhf/EmEaWqqhbX37n2+MtC3oaRjtACcRHBYyTVZjcKEXa6UNLn
	WP4YH1CCdJwTCU56h/5b6fCAIJvD753YmOovjiB1RX80+veimioTZNwVP9XWyq7bv12fVXjIuiAte
	hm8jEIUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwmU-00000005hKL-3wBD;
	Tue, 09 Jun 2026 13:46:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwmQ-00000005hIJ-1FDk
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Jun 2026 13:46:12 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClMXH2249677
	for <linux-mediatek@lists.infradead.org>; Tue, 9 Jun 2026 13:46:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BvgE76byBkrnG87M5GQBzCx6Gesq1V6QYXCaC3lyE7g=; b=Bpvsj4Aq+hkB8ev8
	qS6V/ThclFQ3bGiM/zhmvfP1JnwDvp5OTRRNPWDWQIb/MzuMT87JhlKABvlMp3fh
	MGiTqfaSZS8MZxSlg5VqbWXMILDaBSOn/YTeV/dz+yizmy2Jollw59kpX+azu0Zj
	6N98UocmW1+IIAUAQ3vlVvAMEa3tQ5Gbk6CJOayZ08e4G2GFUMNQV5LMrjsFDKAD
	ovPn7ixC8dR/eNap4G79Brm9XBBks0js5eyB9FjOfpE+UsQ3xy906aWZgzanyEih
	11RsMpE6Tn975TMFt573T5AhmQ5t4aoNDpACJZxu4EbrEfFC9rPIjRoJsPAtX7r8
	7/dCQA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3wh39u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 09 Jun 2026 13:46:09 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36bbdcf36f0so4921251a91.0
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Jun 2026 06:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781012769; x=1781617569; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BvgE76byBkrnG87M5GQBzCx6Gesq1V6QYXCaC3lyE7g=;
        b=Jl5zxZxLtAtZHEPivDKuuKB+7CTndaWxljZmoNQxc5YKp0NazG8d0eMjxHIQdb8S+d
         JjUphSl06j9YjyVfghTOV+Wyt9+0dtzh7M8342sMxo0edL1O4vbVYHoVi8bmcgfWxHJK
         qyanoj4jQAfLqnKPQ1WVjO8AHB/LlefhrN4V4cCygtUjGVRUvQDnc43g+O4PlJv9iEpx
         VYjjlJnFTkAlMKT3TnBYJPy4xfsczdwEmDYemOOMp7wVXzc+WYk/88WH7NntdkVq8cDU
         xS1RXkIQWuOgayL7vIswk81fTkjUcEpZuf00kBL5h8+T5UhsXq6BbKP8/HUAjseLrWxJ
         40tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781012769; x=1781617569;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BvgE76byBkrnG87M5GQBzCx6Gesq1V6QYXCaC3lyE7g=;
        b=gxn6X9aJFF+0XEQ1MCongVJD+Sjo86c/HHrGuI8BQDqiKCQUe9YgX8l2w3OQzEIzNm
         RqTcz606p0+K86YFQErKJ0rgYCk/PcSuiom4KN7ybD612WaCX+w6LTwHEGX//Jzv1GpN
         yGMVMcHgUDcmChZaVMZQXRYAn+V8P7tssPzw9jAK6nmx9v2YwBVDhy2NOXMe6Ip3/S3Y
         2Z2415zum1yOZ0FmkVI24w6xfofpduVN29MVjcsM4be0jASwskQCqgdfbqMExEqAuIp/
         chUVhvjigGD1zsm5Tw/VVvrS1NdJR/WAPVK9cdD2MeKIVuAGQ231bAJWCYDMmSbkXy9p
         1SBg==
X-Forwarded-Encrypted: i=1; AFNElJ9MU5pc8Ut4kFCNEVZIZLd3vmLHSVDhFuT8WaLd4CVZHRlxKkoZycevBX4Z8n4k9TobBCijE+mSmW8FNwTjDg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxP12faBLEjsBs6xbVfLX7/wRhaJYoUTnnwWfk7IQx/MHWLfk+4
	DV3Xrc2Na3mOUh3z5V4nQqi58yKQymdKk/KXVDDCXylIorGSBglHXexK8hZDspCRLJUQNemdATn
	HnadoVY9iwmLPxGik15yQgtljgop8E5jbC6GR0pZljaE3HaQoSr9Pwe3KvQ4y3IC3cBg8sUEBTA
	c=
X-Gm-Gg: Acq92OEc1ZEb6+6bW3BYzgcyJMu4qduoJP/SVDgTSLJ9l22UfXXyDqdkWoJWWEbLYGO
	vG06T9PrkoxFy69M6R+Y6wYXDdzjXGZHipP07rqy8UfwaquGwk6eYpNXznxeOKr3lKH7CU0Ktym
	7tMC+JmVzbI22WlHZknaRGdNOSHAhCj0SLr0dCndyx6YKlEBiRSq8DATy8ESMOzpszxqAiYN872
	x6mFwiRlPN2aQ5sWYYDqicUqIc48bjruUHvBEN4n/WnPgDMhfZ2sWXP64GiRz1k9vSvV3k1a8oW
	r3NsKBIeqrEk4j6uPVCRcKTX1Zrwb4W6C25UZSI95yYXggUGTx8qSc8uTIQQMk4hhnwDhIiVWhY
	RTI1VCRCIS04B4qFj4o0muvj5Km0lv2I=
X-Received: by 2002:a17:90b:582b:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-3713029bfb8mr16531448a91.4.1781012768692;
        Tue, 09 Jun 2026 06:46:08 -0700 (PDT)
X-Received: by 2002:a17:90b:582b:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-3713029bfb8mr16531402a91.4.1781012768027;
        Tue, 09 Jun 2026 06:46:08 -0700 (PDT)
Received: from [192.168.1.11] ([120.60.129.221])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3712fcb3a9fsm9454149a91.0.2026.06.09.06.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 06:46:06 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>,
        Jianjun Wang <jianjun.wang@mediatek.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        lirongqing <lirongqing@baidu.com>
In-Reply-To: <20260515005552.2343-1-lirongqing@baidu.com>
References: <20260515005552.2343-1-lirongqing@baidu.com>
Subject: Re: [PATCH] PCI: mediatek: Fix operator precedence in
 PCIE_FTS_NUM_L0 macro
Message-Id: <178101276196.5924.6945802406808403415.b4-ty@kernel.org>
Date: Tue, 09 Jun 2026 19:16:01 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEzMSBTYWx0ZWRfX2Bsr7/xEKJ42
 77OQRPccRxbiZoLnF9Q03yDCxcvwXxN8FLB7LVtWhSlsbj9pRJW3ZkGUNf8wIJ4gvfW7/F2ZrYY
 Z5h0FLXceTD6pdl13rEqenYwovmLCd+pKe+Cghf2cw5RrqVO81m/NT8HlJZk+zisGDBU3FetIQ2
 ZP0Sl2v+hJtxJQHY3IPAwMHhszBWM5OrbAd9y56OwFA6nzbpHx1IDjIB6jLpIiOE/WXUW8Styj8
 3OnFCFFvUaHL8vh5lyzApyTTGYbKMYbrppmysgaoBnDOA9HBE0LozSsoHy/ivXdeSz5hgGwUuVA
 C4EhrYvXTU1LTS0J8NDzfTrSMXoys11n/ePudEZRPoFQ8YukSWbhR+Ck7e0amS9YuAzZrDx/7H/
 HGlEqR5wWRVqI2dxNbL/9frvVxS4NSXFzVkgLAK8AnzO0yKSXMzxS1HVS1CQJtdV/Bl68qZotWq
 /KNA4VQUOSaoAMs4hcw==
X-Authority-Analysis: v=2.4 cv=csWrVV4i c=1 sm=1 tr=0 ts=6a281921 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=4E6x9rGNEmwsBi5Sc5cS6Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=z5-zIPkyTPHoBrqrsb8A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 16rgeSMWR-sdzUhQm4ajiNitIZdu8Eqb
X-Proofpoint-ORIG-GUID: 16rgeSMWR-sdzUhQm4ajiNitIZdu8Eqb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_064610_424355_F0712EFF 
X-CRM114-Status: UNSURE (   9.53  )
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


On Thu, 14 May 2026 20:55:52 -0400, lirongqing wrote:
> The original PCIE_FTS_NUM_L0(x) macro was buggy due to improper operator
> precedence, where ((x) & 0xff << 8) was evaluated as ((x) & 0xff00).
> 
> Instead of just fixing the parentheses, use the standard FIELD_PREP()
> macro. This makes the code more robust by automatically handling masks
> and shifts, while also adding compile-time type and range checking to
> ensure the value fits within PCIE_FTS_NUM_MASK.
> 
> [...]

Applied, thanks!

[1/1] PCI: mediatek: Fix operator precedence in PCIE_FTS_NUM_L0 macro
      commit: 282305d7e9c0e27fd8b4df34b7cd5506a1eccdd6

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


