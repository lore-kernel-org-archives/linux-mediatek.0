Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F2AC36010
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Apr 2025 09:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SdbE/DxPDX7mmNIDt0tfMeaCACq/2F5Z7OVDEZCEKFI=; b=0MFyiEiRngJRW7B4IF16woGesi
	SdsG72hms/vPMGtdiq6tmaUzWnD0jRByWYy5MMyqRTb/X1nNSprKaMAU7QH1y+13cg+txJdb7Y8JJ
	M82YVCDShKXcg0UATPwxJh6B7QuP4yJEW9IANH5hNFxxD6W0ZH9vFI/IrtJbECSlL/jYgLwYrO2Gr
	DM0ZuOFYQPrNQRrj5LBQNoNSFeFlPRVnor+CQajP6vGhrNkcN/FlSgabgsZx9Apx3bpCz1JNp3P/m
	eJoKEV+C2sgoROebygnSHOqzpbpX59RKc2gTQ8BvhX20I4/k/A/lTWQg+QY808ra0fuDqn+/nWA+w
	q4QntL3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3AUY-0000000DA7V-43LO;
	Fri, 11 Apr 2025 09:16:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3AUW-0000000DA5r-3iSC
	for linux-mediatek@lists.infradead.org;
	Fri, 11 Apr 2025 09:16:06 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B1ZI0b006870
	for <linux-mediatek@lists.infradead.org>; Fri, 11 Apr 2025 09:16:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SdbE/DxPDX7mmNIDt0tfMeaCACq/2F5Z7OVDEZCEKFI=; b=CaBRntvbdhZ+mLK+
	32w3o9t6//xksqnuukljgPuRd7Hq+WALFw/v5QZG5GddIFAhyBhORz3cozSk7+H/
	Mk7Z+K4RMDSnWXxpPUbMnYjPNsYUSJpPTQctEPWdd8Pk5ph2c2j6Du4s/VBxtavM
	veEDpkd2Zx5eNPaDorHFNXTWfJsdkrfGIxOj7FsErkptHEPU0y0/wGjPf23WuxPL
	mHCM5CPWie6RqW9Y9j6ZYzI9+IL0NBjEJvCJLVRZzKCBoULFNZIEbxLHzR06SWlr
	rv1LM9yqps4Z1nPCWdYbu0LlFB7366avWO8WAyMph4z2uOmWQRlM0LXz3zBj5h5N
	HG5GQQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45xeh3jw3c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 11 Apr 2025 09:16:03 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6ece15fd50fso2912716d6.0
        for <linux-mediatek@lists.infradead.org>; Fri, 11 Apr 2025 02:16:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744362962; x=1744967762;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SdbE/DxPDX7mmNIDt0tfMeaCACq/2F5Z7OVDEZCEKFI=;
        b=UURXR1fT70eyblsBmJPLCNmqdlmH+I1J6KQDlC+kpxB2kKBkC52K7L1FgRbYRpZnSr
         mFbKCSXX09gUvW5WwaauV2CwI+ZVSD0XD9gQLKCNwcyeP+GAnibtcOn5cUyl9e+zKZrD
         H1741FM0GIgfThhOYejIX3DhP3m3l4JkSnvSBJd/N7jQeLEobXmtqCHITGimwpjktDDI
         jSzO5jg4MEdoe4kcFPbk8NpjEUJ8bTELfkJkmHiUuIW18cFSqrYjptEMz/bimA1DWUjm
         87u6E925bkZxHk1X9vG26T/3IX1iS03eSkBLvohpsceM7irLlsEHWGWyqPwjFes+Plx0
         4C8w==
X-Forwarded-Encrypted: i=1; AJvYcCW4+9TnipfCcO+Chat2tjT507tRSqi+Hnigak6KeOtT42Y/LcwppRxBTLTQPjniUx2IMZRB2t3fWZykbMuDCA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxOG+QPBnj7urNSXLZLIXFq7ha2+dYKvZKUa/e+AM5LvOv9PZ38
	anFukRwbNBKEF6D9DJIF6lVfNElpqnQB4FQ2dVm1275IvKRlHgvyPTMuaZ9sNRYjUVac9bStsSD
	QfSvzAhr7lzt+qFfR2cAJ1Lvx2mHZUTA1fXPUl46z1riaHS/e/9F7K8ChXsUoPBWu9gO+2K4=
X-Gm-Gg: ASbGncun+oeqGei5I8aYkzWTV/l3Te8huXFXEh8ziC73hd1m4dVC81eGqeWPKgyHelB
	HOnag4r6tY5Op6c9vEnjpiWw4a/4vzIREJuHFtwntr81xh4ZOlpRguKcmDVi9BB0bOar+NHeRk8
	ux7hSdfZiDLAcx7GeH2wnD3T3dDBlUhQzEAaOt6Y8p4nSkMWPuqYsrsx7gmaYmuydSxWD0MUnzV
	t0UkQxnPcU6qCKZ0mlWjbfYlTGcalx7X8+J16eRIVoDgm0ovjYvKqGyppMijsgEJhUEJLzMLyBk
	g3xsHHMEWgxhoos9FLQOMGLseO4Snusy5MmmzCiMAqDuda3n7XJPcU1cOd0NcefUMA==
X-Received: by 2002:a05:6214:21a7:b0:6e8:fa58:85fc with SMTP id 6a1803df08f44-6f283b06981mr4226016d6.3.1744362962483;
        Fri, 11 Apr 2025 02:16:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1S3Lj2+VP6zkrr/KAvVwoc07b2Dhiowu/+1L4K8SRDlWx9F5wmlXB5hv0kwshKe1D92mPDw==
X-Received: by 2002:a05:6214:21a7:b0:6e8:fa58:85fc with SMTP id 6a1803df08f44-6f283b06981mr4225926d6.3.1744362962091;
        Fri, 11 Apr 2025 02:16:02 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccd2c4sm406829166b.129.2025.04.11.02.15.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 02:16:01 -0700 (PDT)
Message-ID: <088891de-cff9-4cbe-81d4-f94bf09df61d@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 11:15:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/17] arm64: dts: qcom: msm8939: Fix CPU node
 "enable-method" property dependencies
To: "Rob Herring (Arm)" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Conor Dooley <conor@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20250410-dt-cpu-schema-v2-0-63d7dc9ddd0a@kernel.org>
 <20250410-dt-cpu-schema-v2-5-63d7dc9ddd0a@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250410-dt-cpu-schema-v2-5-63d7dc9ddd0a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VbH3PEp9 c=1 sm=1 tr=0 ts=67f8ddd3 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Rt0Z8iD2R8SC1h9hphoA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: gWv_yFX2E8xv6D3F3_IPdeo3_0fIoNoj
X-Proofpoint-ORIG-GUID: gWv_yFX2E8xv6D3F3_IPdeo3_0fIoNoj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 mlxlogscore=769 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_021605_052250_018F1985 
X-CRM114-Status: UNSURE (   9.26  )
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

On 4/10/25 5:47 PM, Rob Herring (Arm) wrote:
> The "spin-table" enable-method requires "cpu-release-addr" property,
> so add a dummy entry. It is assumed the bootloader will fill in the
> correct values.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

