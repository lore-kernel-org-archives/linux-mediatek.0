Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9740AC5B561
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2026 10:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OJ24BqAEJPwzbl6qff074FZZsCu3Ipow58eas1iNjro=; b=OEZnESuyvIxlCfCtjXZO3tVrDI
	mGlR1FLD/RsaH4GOubJJ8szQJM8vGwT2Ozqffk+E/gRkwxuDwMS1YJc0QMInaBkdLF27ITQe8YYs/
	lKa6YYnnlU7HLkC1EX63JfLV22Z3etPiJ4noZhxd0a/Eo8oiCKNpxNu9lTgCEEttPr7yeE1JXf0px
	y5hwyaaT2AUYm5oH9fx/lQDEklw+eNb1zjGh8cIphtqPZ1/Mxsg6AvJzkbfhmnuPd7sArYD6v+MhR
	Fu79xmRE70DMvCWbxTnIKsHuFwjI+Qc8xdWcFs5HP5XvLauNB37Bj78PRappYB++p2d64Wt7/7xSP
	HcNZexTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtNfX-0000000BYZr-3PWA;
	Mon, 10 Aug 2026 10:55:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtNfV-0000000BYXQ-1D1n
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Aug 2026 10:55:46 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AA07SV009800
	for <linux-mediatek@lists.infradead.org>; Mon, 10 Aug 2026 10:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OJ24BqAEJPwzbl6qff074FZZsCu3Ipow58eas1iNjro=; b=AgdRiiberGOg55TN
	bPt69zq6B8zegVZPLUoLLcCMzJ11uypxFljHA/ObNfcKDg12Duhm7J9DINSktu2W
	QoQIRENx/PSgRcfz3+pxdTRVYEcR+uS9FmAFaTcbrV12TIqTL9UoiZRst8CvpPXV
	bxT+MvmHJZ/voLcXoVboAxLUV9mL1ybQPKC4mW2l/DBC5W25ht++Z7dRhC7xxHgn
	Ao+t1DEZ5k7G8o8Vc6TE5Z4PZSVU63bF+U9WoR500KWpbVWFEKe03muGCEg9jhgt
	Kq3nNrkrBV7ufy08V4RDFUnxi9wZU/KokRbLiP1HqNrjrSRmU7SiF8W6itZamYun
	xJcfsw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fycger6hj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 10 Aug 2026 10:55:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52b4f6ac06aso31168731cf.1
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Aug 2026 03:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786359343; x=1786964143; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OJ24BqAEJPwzbl6qff074FZZsCu3Ipow58eas1iNjro=;
        b=KE1PEaTX5q2lgasfqTHqNuthTQWgt6ik23jn1SlrRY/r8YWwpeLAOpyvBKS5AjeqBo
         UbcvL1oO//DRXeSRjDxQYuhT6rJ45QPZutO0+GCR1qGS8WQCtP3ONiA+N5kRP6nlHQog
         JA0MDj8l7yTCw4a7hXRpHPShsXKdDo2OLc++fcLzG2TgEmOUkQfB+VIkOlOCjKBKNn3b
         wEk8+117wn6pwc15DYjvjSuH9Um8HKWgGImxbebl2mToDEw/Ddo+4kokROX4bfAizbBU
         wMxqqolJgck9oPSNCAnO1qfMraR4BnxsF64S8H9vg9tJ7xM4VAvjOZGEvk6Y3SBviMQW
         tm9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786359343; x=1786964143;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJ24BqAEJPwzbl6qff074FZZsCu3Ipow58eas1iNjro=;
        b=nWcGvGez7rPy52/cGIqkbS6bT7HNvQKe+yqXFrDXd4FACqseobISKogR8LzMibW9+Q
         Cxzu6GwiQFPUX6il0CaaKeXMVya/1i/4qmcg/5+eBfxrS+bNoH/PWMjRsFdVbF/ULDJ4
         cgiq6uTWqdvuqd8Cjo+34Lm61awFQOz1139wi01IT0l1HjuMedOQaRT9h/KaIekl4fJt
         TnpNa8azCI2AJTs/SKgatGnoeqa00SHtE2/1lX/qGxgt12EHlovNm7crWOEatyrbsZMd
         5CSZk/ocaLN3A1WpabgVDJhP4Rbsii6Vko77TzVcsNMvnZqE5vFbX5tDXw2mHTDyWxcg
         g7bA==
X-Forwarded-Encrypted: i=1; AHgh+Ro57TL5vdhsSe2McIDckHOsGWz3EdHfgl5z1jRPc7viyUnpwZn+wo1mbMOCDNezk++rbEFqa7CYCEq1brVm5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDZeIrsVaFaiVzdBCEn7v5RXnqhoLqOLNQLdZ2HK36E1QzO46Q
	Uy+F93/PqfKhA/mB9lt4kn3swutbQsH9B4hjy/oUBVOx4KFh3M/dhFJgmyLdTr8cJ2YmFfgvwwQ
	ZZVUQ+i/lvz35KFsq6PbykvEYdRVGqlFVz3msa2ihWNEG3/Tz6S4KfiooZTd0zRSMSfc0EcgzxX
	I=
X-Gm-Gg: AR+sD10BCXPREBup3w826kn6n8yjP19reAU9xHgmU/LQ2qi0UFbTiYVPxuR4zOBI2ph
	QZRAIEwcEaW3dTNrtuYsfrxzJ6Z6Ud0oatysGlZ6gprSje6HRgB0YLC+TXP3GyUTRwgy+McmDs6
	QVq1k82px0JwvoLURHVAbjhYzggioNKFiCrAPQgkzOEQI2QejGlkUFfwiWCfXO+y6cY9mJZyE1f
	ZhcgXuftjBiFGo/OYmkMyCosNytnkXWo9601ILHtN+lekb4tYAJ3CEmTt0z/egmD577r6Rjc0Du
	UUTdtgPsF6fa5fm/X0ptwMa0BFnZDUtYQw3/dRsL2mxpBy+vSJ+IsPGo9d0hSpAu3o03ELgf5Gv
	cqgXpggYW8ntI0pxC/bfEJk132f5G
X-Received: by 2002:a05:622a:17c4:b0:51c:1fa1:80da with SMTP id d75a77b69052e-52d0b298380mr320953901cf.40.1786359343496;
        Mon, 10 Aug 2026 03:55:43 -0700 (PDT)
X-Received: by 2002:a05:622a:17c4:b0:51c:1fa1:80da with SMTP id d75a77b69052e-52d0b298380mr320953581cf.40.1786359343166;
        Mon, 10 Aug 2026 03:55:43 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:dfa2:33ac:2282:82ef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995bdbe02esm196322575e9.1.2026.08.10.03.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 03:55:42 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Keerthy <j-keerthy@ti.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
        linux-omap@vger.kernel.org, linux-unisoc@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] gpio: Use IRQ trigger mask helpers
Date: Mon, 10 Aug 2026 12:55:39 +0200
Message-ID: <178635933666.24478.15558797954868182509.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260802-b4b4-irq-trigger-mask-gpio-v1-1-948973636c84@oss.qualcomm.com>
References: <20260802-b4b4-irq-trigger-mask-gpio-v1-1-948973636c84@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nDCaV3wT3HLvjt4ygDHGmc6zVRcvIVp9
X-Authority-Analysis: v=2.4 cv=R4cz39RX c=1 sm=1 tr=0 ts=6a79ae30 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=qRw7KHR_QVJorHy5iXwA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: nDCaV3wT3HLvjt4ygDHGmc6zVRcvIVp9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA5NSBTYWx0ZWRfXwzQ0X19erTVH
 SMiNEzK5nWo149fCjB7o8NcjLnYR+VtCTbM9LChqMjjru4dtf4K9aANi1rC6wVTImpnfR/kTObz
 YeRD2xFYP5asjmOve5WGVrPfAXrt2Vo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA5NSBTYWx0ZWRfXwyqycjbWVZzM
 w4GI3ybxhaYQIUB/G9AYfaRbCjJx2DdXko6LqCULG+l8UExfSx8ploweGRW52Pqbvpk4tUgpREF
 8lSQ6xQzoodn9JNopAWZiBCgndrrXwi6hw4xi2Vly0qASHjo1zxC6C1/EjpOoaM1Q6g869UREvH
 Df9mowIswTzJTJA4Qx2+rgbXaqEhyaXlC4b4wjLzo+5SiVbxFdWUZj94QKjosrL44eHz+y3UhiK
 SlUtFYIt86QJfKRlECtAa83rPjBKTCIhTe6zLZXwdhOKs+l/ufidwLIuT5/4IhkaLPMGv2V8vuY
 Gv1dyAzzZERWhnMd85BNBU/jeO67m4tr8rI/Gt+8AAmlqjTrMMxtW18iU9npokMWnh+kCE1i+od
 6cJy7ChFv6P8XKZft586bRdfpe4c7NUhufcGT2C9t6re6kIbSmIQChtZH9eD/YIhoEXKcWAjlq8
 vOiGnFVS2GD96NDyV5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_035545_452076_4F55C496 
X-CRM114-Status: UNSURE (   9.32  )
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


On Sun, 02 Aug 2026 19:40:35 +0530, Maulik Shah wrote:
> Use IRQ_TYPE_LEVEL_MASK and IRQ_TYPE_EDGE_BOTH instead of open-coded
> trigger type combinations in irqchip callbacks.
> 
> No functional change intended.
> 
> 

Applied, thanks!

[1/1] gpio: Use IRQ trigger mask helpers
      https://git.kernel.org/brgl/c/338c551bcd62ff4f97ff02359baf9d6f7f1f9fda

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

