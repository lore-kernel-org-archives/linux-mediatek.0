Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F376CCA490
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2026 11:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gcEYZe12IS5R8fbm0oKp4F5/idlukA88I/0oldtDxJQ=; b=elpIlvyQxIX25srFPUJ8edSBIK
	PR7S7gOXAqKI8I9J72Wy0ITyFTIZefooYvCgSm+Z1QlX6+APZ+THQ43j2WRQ1uO+5KeMhG2nlQw8V
	UbCFl6MEmAJB1Gg6vZiYYOlQywZhugBFJmi2ufs01eh/OQYiJJ7/3jebr29dto+9dhSvaDWckB9j6
	+x8PWRuBCbWE76gY5q4TG6mw9RkMwnhnUsOncjPOSOKUxVAgjXJrxqLbzA46UTIj0WyolkCoKB7bR
	WBRrkgB45BRei/Q0qDhPvOpDSYzoZrks6ZEuQqs6AO6lFCEkF3mDAP7jIdv997P+lhRj6LaynDAK4
	goVUDkpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIPVG-00000005p00-24FC;
	Sun, 18 Oct 2026 11:56:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIPVB-00000005oyw-39TJ
	for linux-mediatek@lists.infradead.org;
	Sun, 18 Oct 2026 11:56:34 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69IBt7kc772007
	for <linux-mediatek@lists.infradead.org>; Sun, 18 Oct 2026 11:56:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gcEYZe12IS5R8fbm0oKp4F5/
	idlukA88I/0oldtDxJQ=; b=QvQ9Afmzj/fGG+aeASrcA/JAaYzYGKk6IFlJtbUL
	W5uH3JiBvrYtBFZykDTHD+Tt8jKX4GWEdGsUD0D/CNPcV42pZYoskpnfq8yAn2TJ
	JXZqU5JFzIO7YLkjVbnQ29AjMQkbTeMKVfeGXEPu2rpZDRdhAl5uLx6qU0X/Qxg2
	D6gB8QsP3SURJ9+VxKET818hKXYkd3wIoLVBDMXRbjBGDdPQrFH+ZLYwJUC8r3W4
	yLU/HfKASohkj9S3ANaovwgwu8urHvo1FRMMb1sg4Gdb6QvubeYSQ226KPx3hdR+
	CDGjnlupNYD6znJGGMCNc3Nq9nHEt3gedBst9cjCh/7Sdw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbxqfua4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sun, 18 Oct 2026 11:56:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93909014c85so288584185a.0
        for <linux-mediatek@lists.infradead.org>; Sun, 18 Oct 2026 04:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792324592; x=1792929392; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gcEYZe12IS5R8fbm0oKp4F5/idlukA88I/0oldtDxJQ=;
        b=YEIAHuTtlZybITOhiupp4EYMY/4ZeSR+V8b73dojhO2opish9cClAh7TewCkV3arfN
         qCd5qmgRlhOwfndSbTLpijsjt1Rgzuo8nbQWNXGz2iEX97ilg/5egXL9h2so7HQ2Iv9t
         ixUazIusYfmHVFLST0J/K8PZd8fWKureRTSgcGqaG23Hm7MdrxvV1sYs1XktD9g2gR/M
         d7mpwc3b2z/XB6mWxyDsXYDXl4fu6HassEKyy9q44i/AoZYlRc4NdVcC9cBoEGMiGCj1
         ygxTlnkYWgZdE0uH6tAVd8sV8v1WVWTbPc7J9DRszM70igzofsJm4DolbXCLWopvSbli
         H4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792324592; x=1792929392;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gcEYZe12IS5R8fbm0oKp4F5/idlukA88I/0oldtDxJQ=;
        b=K5v7jrEfuXhUPL7omacXdgt57onMr4i1c47Bjq1lwd9O06kyVLsihT0xhGGsmhbISv
         yBS/VJ6CM2SQeRUHSovH/USteytQMv2CcBQTDzS+YwUHBnSvscqdkziM1npTgwnUSG7s
         LCa87pcrFYc303Eag55qRbkV3Fq40Jmny/gDqpf63bd0gqPv/ju+lui8Otb7UXbzoQt+
         U8P3HjzLtXHXmIzdp5oRDaO8MzwRQdjTaqRH6TKrvK6OCZjMDA4KrigCLKEWds/TVMcP
         HWhjEpOUVKHz6M/GGOpp8BXcMmTmUYnlA46MkiLvp5Z0hLHNxNTsJHZiw+F55F4Js2es
         Xj7Q==
X-Forwarded-Encrypted: i=1; AKwUvBygvE7DyYT1S0vLSR0XZ3P5/dvbg/oQPuofQ3uH0Ho0c9AWG+RVrXQQmlgyhQkxqyVjnU8Jl2F3/22ZZVvYOQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYLXLZiblfnelr3dL3b2CagCr4LcumMWtTEVy50jaXIeNNFvr8V9
	lrYkMzY0XiMomA0XWThyK3Yc6hxXPhup3Y0DmaOQv+7vnATSGq/F9fuSehZaaF1WTsGA0O/eSrU
	0VWE4IUCYuYIz3ploYiRsFJojIZBvPWHL1u8j2Ak9qLzgB0pMk392WDImQTSiZfrlhIqB2JcBwC
	k=
X-Gm-Gg: AYBFou1kEFBGbnD/Otm3VnL1Gm6QB6Chc5LGAaEFQQV6iol+cx/oizgohJ7xr6YBIZY
	0+QxomLxLVq/qDER2fQ1YVK+n0UsVu8+6ukpHOiBBSAfq2F/A1JU0Z2QmoTrnjhbNPRJJ1pN4oH
	mqGNgCSGFT9wLZ9s1j/iYlLz+RBGSfRquEOzJZ77wDwAdD3eDM6fcoDiZzRPk42dJM9Mbl1VzCg
	Xwy1KJGOiheXp2HbLDaMjBkrQ1mg2/tZNZfECDBtabkn+MMK4W1CIUQKSEdlC0QG+duPq77k2PC
	niLX/qZddfqiI10q0GxOLmdovVNG3poj8GRISjRoKv3v17BOm7JPhtD5nTvidcX4rB+sji4FQmK
	ObAlzx5eTZVCc7rbOURopp3z183hGIvDYkIz8bAVS/5Gi/C7SGmZFdAOHg7zxQgdwj7niW4pz73
	OMiyOAmZjv6Xev
X-Received: by 2002:a05:620a:2314:10b0:93f:31bb:e3c with SMTP id af79cd13be357-93f31bb153bmr332142585a.68.1792324591834;
        Sun, 18 Oct 2026 04:56:31 -0700 (PDT)
X-Received: by 2002:a05:620a:2314:10b0:93f:31bb:e3c with SMTP id af79cd13be357-93f31bb153bmr332139985a.68.1792324591331;
        Sun, 18 Oct 2026 04:56:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a63cd1esm1370126e87.72.2026.10.18.04.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 04:56:29 -0700 (PDT)
Date: Sun, 18 Oct 2026 14:56:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: Use DP AltMode defines
Message-ID: <46mtzsydckbt6ca66h3stj7sn37ittzarhc6nqbjp3fitaqx3x@i7b7vbpxsui6>
References: <20261017-dp-altmode-dt-defines-v2-0-7ab3d93553dd@collabora.com>
 <20261017-dp-altmode-dt-defines-v2-4-7ab3d93553dd@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261017-dp-altmode-dt-defines-v2-4-7ab3d93553dd@collabora.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDA0NyBTYWx0ZWRfX38aFgnDx3lVp
 kX4mETb3IpzqnZ7ZBPpiQU/CW/gGwVV/RSLaL2CiX390EwZvYVYOVXZj69dj9aFY6qzOnbH0c6e
 4+judQGmfKNDH6ugXwxyWJvxQnHN0zs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDA0NyBTYWx0ZWRfXx32Qnn/Dm8lB
 hodazeIhHuF/TwpRx7/l6MqSPzKD7GmqNdi5J9hPYejMhniwOOh6o06zQh5AB9bRR+EAKvHlo17
 EGIEzK2ja5Enl01JkRpjDce0jtQGzrXVBS7yJvnM0q0yCS8eaEEyS1uvuTI3xJFbPBV1jftvbbI
 fJR7bQzJ6WGUwN9mmPWBe4gRb/H802NqIsm4NQn+LtppGID6M/45wJftPS3RsGloNrTGTSnImXp
 2B2vNEufxTl5VK4E8QcyWLeapC/jq+imre4gEcS886LYl3q4San6rIGDBEqUf1S/lPO52ZpP6hY
 XsjYqY1izvQv7GUznjaoLcZOidI4h2P9ElBYLYrjMZbenUkeB0xZndu/s4ZVH+7wjZWQN7eRrA2
 zKyvKekVLOD0/FzaARovu72a+dHbnlQS6v30owBZuRihilvbIpSUMEHtzrUbyVyCKtq1DTg+IVH
 wUA/j1ZJu6a2+qOGYXg==
X-Proofpoint-ORIG-GUID: 6BXuwHk7qU2ZoZqKHAy8vxpuvnnSXyO5
X-Proofpoint-GUID: 6BXuwHk7qU2ZoZqKHAy8vxpuvnnSXyO5
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ad4b3f0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=imkpALUroobUoGdfvlcA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610180047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_045633_822796_2C1D74C2 
X-CRM114-Status: GOOD (  14.00  )
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

On Sat, Oct 17, 2026 at 09:59:33PM +0200, Sebastian Reichel wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Use the new USB-C DP AltMode defines for the SVID and the capabilities
> VDO to make the DTs more readable.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 8 ++++++--
>  arch/arm64/boot/dts/qcom/sm8150-hdk.dts  | 9 +++++++--
>  2 files changed, 13 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

