Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C9CC36002
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Apr 2025 18:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3tN8Xg2pRwFhKBUhJyoFYaiPiYIFv7y7hpbU+APvsA=; b=TE2Cgkv6DQyKEV+VyRs3q5YOvc
	YZZA4ODvnN/lHcjMNcRb5qVfja6Py5hBHSHCnWPUXwbVuHZe0wbjLgJiiqWrRJj7QGkNl0n4hl6BA
	kEk2qSyCWJzd2DOY2K0YS8scGJ8WBOlVK3pfh7YkOhIE5EN0crdC2cd7akGXjhmRFfLEWrd+dpsAl
	8VmD3fDgXahNU/XJZJHk//xgyf57N+pKVV68T+QaczJH3OIyCiBKVMRlEmUQFEy0qrPNFjx2QydK3
	Zs2b/DhXdfeo9eD0nJ7EMtpE+cJrXHzxmO3A+FezbNIUGNbSSDEy5dtUf29wdTSc/FeJpPG82/fFs
	B2czXg3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2aGx-00000008Bvv-0V5s;
	Wed, 09 Apr 2025 18:35:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2aGu-00000008Bub-49tE
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Apr 2025 18:35:38 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HG2mt017095
	for <linux-mediatek@lists.infradead.org>; Wed, 9 Apr 2025 18:35:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h3tN8Xg2pRwFhKBUhJyoFYaiPiYIFv7y7hpbU+APvsA=; b=BEcxr57EUiJY5Zym
	kVNSxVwdl1/G+WnKZuK+rrrBokydGO/Oh3UpLZWk4kL3VGv2SmZR3i/K6wuf2YOI
	MpodShpD7Ukn+eqF+kTxaEAW5tLuv0RTNDEG9lR31fCxF4wwsbIh54Tb+rDBzvkY
	R02dOpwLQyR09UacSpshxRb/Aa1t9Sa0cqYNVnm+UUMJN9lkCsaHQecEQDnqKyfr
	M9Tj2Ei9EZY3qDpuDSHjXEdH5VGK/kupDdwYPBVBtsL4/Cr+/793ixrAqiOXu9ea
	C2RawlFXomCZxJWIpKE0WahyzSIVh5Ehs76kZRSWUp/xi6CvdT3uLQ6bdG2ibQCP
	I2IDfQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbumev0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 09 Apr 2025 18:35:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c54734292aso75485a.2
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Apr 2025 11:35:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744223734; x=1744828534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h3tN8Xg2pRwFhKBUhJyoFYaiPiYIFv7y7hpbU+APvsA=;
        b=V0fRU+kst1bfSTGn1fVwRlnRfUCawzaJsjIpxFQJMOp50eK7qsJFUoA0OmZkwXAKwH
         7uaRptNDLSJPnK+hmag2L+s+rYWumpYMdpt7BUHA8DZFpQBYyqiXAZv/drBm1jnkJbkH
         NaN42lJwZqG/MBOrQtNuqgzveU/4/h9Fh0iu/etCZWQPFcJvOEp7JG9c4CdGHqtC41t5
         CBwLpdRu4Briv9Pu3UGpF/Q9Guw4Q3GRTSuYHZJPT+e2RcoTcw5eMyRmA7jdXCx47SBB
         c5wyK4n9y6ow9kKVsCwogRoVxA9nBTnGKyRbLsrbY88cKKJHsMyfv9D952wWDbz4strU
         P2Fw==
X-Forwarded-Encrypted: i=1; AJvYcCVYSPc8hPcdbHav75cH/4JRkDuSk29LpTropTvawLl3jUTolA89Z/aMMdkDZ/IN/9uGgv68LP3mDZfC7ats7Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxy9G/ulq3DXQa5F/Uimp69rMhxpX1lwEzGzd6bYvmkHTFxVHQo
	9aJrsqb7agHMwYNIevSXxibMxzKnBjuo3rdHOan7fGP9Z9+HaVUxIIRgveStSdr+mBArA09DZOt
	rMgcl2cnT6XHeQVFpwfRQpE8tVtUPOYIde6KuEZTuwCqrk37tHFEwVJW6BPGtS0IljgUep+o=
X-Gm-Gg: ASbGncta+ovnGJtzLQScTU2fEaP1F1PTEHYAuURH7DN+nfztzFCeqwQqT0pqLLCgF6o
	jFeQLS+5ZR8Q9V7PmMqBoF6Xw9w+JTUzzjN3FWezskRR9NOZPbtiTObBekMmHSNZEB675mnsOWQ
	82GrkFK8R7CN9KGyXh9ba5Ki4UXwyIeuZY1TnKmIUyVtMn6ULqguPAm7feay6hfp4B2quHF51Z7
	gl5BDG4NXEyj52xnNRiidOH7zEhAmAY+kCSkc1QEB0kbzsFUDa8Nb/rUinX1AuIhFiBIXpz1bva
	JVNZCI9hkaXKqP8MdZ0INLjDzvX9dLd+3tf1Q8Cxtvn+aIaKlpz3ZvXBOwgB2MbBkQ==
X-Received: by 2002:a05:620a:319f:b0:7c3:c4ba:d8a6 with SMTP id af79cd13be357-7c79cc4fb3amr237221885a.14.1744223734646;
        Wed, 09 Apr 2025 11:35:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFP4Nhv309/CRScfglwzxDlYjCREIsnQLZ9iN6mVMw3ZcNyjL93Zpdnb8GcZSJKHfk6DuunWg==
X-Received: by 2002:a05:620a:319f:b0:7c3:c4ba:d8a6 with SMTP id af79cd13be357-7c79cc4fb3amr237218585a.14.1744223734222;
        Wed, 09 Apr 2025 11:35:34 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1bb3167sm134011966b.21.2025.04.09.11.35.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 11:35:33 -0700 (PDT)
Message-ID: <66f8d957-f7a5-4aec-b8e7-5bcc7ff7f569@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 20:35:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/19] arm: dts: qcom: sdx55/sdx65: Fix CPU
 power-domain-names
To: Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com,
        Conor Dooley <conor@kernel.org>,
        Nicolas Ferre
 <nicolas.ferre@microchip.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-mips@vger.kernel.org, imx@lists.linux.dev,
        linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-9-076be7171a85@kernel.org>
 <03011a33-174b-4027-bdd2-043aa685380b@oss.qualcomm.com>
 <CAPDyKFoZ7NfN+pkCPnusvTOEaxbQhr=1FJqzdDGrLcKAzBpGyQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAPDyKFoZ7NfN+pkCPnusvTOEaxbQhr=1FJqzdDGrLcKAzBpGyQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: c6LdsiCsIt8QO2K4fl1FsyAstweRZW0s
X-Proofpoint-ORIG-GUID: c6LdsiCsIt8QO2K4fl1FsyAstweRZW0s
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f6bdf7 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=OWbFrMhi_jq_UiG4ISsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=832 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504090122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_113537_041690_39632CDC 
X-CRM114-Status: GOOD (  17.29  )
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

On 4/7/25 6:27 PM, Ulf Hansson wrote:
> On Fri, 4 Apr 2025 at 22:41, Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 4/4/25 4:59 AM, Rob Herring (Arm) wrote:
>>> "rpmhpd" is not documented nor used anywhere. As the enable-method is
>>> "psci" use "psci" for the power-domain name.
>>>
>>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>>> ---
>>
>> "psci" is what we want here, but these platforms require some more
>> massaging..
> 
> So this isn't for CPU performance scaling?

Nope!

> 
>>
>> These SoCs don't seem to have any PSCI idle states (deeper than WFI)
>> described, which is no bueno, as they support some..
> 
> If PSCI PC mode is the only supported CPU suspend mode, we don't need
> the power-domain topology to be described in DT as it's optional to
> use.
> 
> Is this a PC or OSI based platform?
Unfortunately it seems like only PC mode is implemented.

Konrad

