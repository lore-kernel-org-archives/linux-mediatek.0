Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B4CCCFA13
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Nov 2025 03:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BrpjAWiwCyBIR4NqBN1fG3lVzpUvOEKnEsnydrbcid8=; b=SMK7MrV0ZCpXJIQub2XPfVB50r
	MczL2uTD6R8rXdaQVHg/IvtxlclSAHReCdsMSUe+KEwaP67gyTjaP2lZIy5aOlihWI8ShYy9E0PQp
	p4goFtSlBvosCwoO/qolgFl2RsaHRzeLYraLos0jX/M/8JRK/kFXq6jL08GLFH5EoYdQt3hSo5/6C
	F+tJYtwdZr31iNtaZheFfWDa+S/UEdrrOT6nHUD4ya8DQ0vqk8taGQ12cKyEjLskY3nhrX3k1h3ax
	0ptnu3IOSFBqdsJ6RPta3+mFLaDY80nK7FrNDJVHhTHyNw3ZzKOV2GKnkNBENrbbpzCoR/U6af6a/
	GRJ7wyRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHD0o-0000000GcEY-0l8u;
	Fri, 07 Nov 2025 03:19:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHD0l-0000000GcDY-2MSu
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Nov 2025 03:19:40 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A718Crr1709785
	for <linux-mediatek@lists.infradead.org>; Fri, 7 Nov 2025 03:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BrpjAWiwCyBIR4NqBN1fG3lV
	zpUvOEKnEsnydrbcid8=; b=jBHaAfNABCQzblEMPABGZ6Ayu8XrzJog5gBepCx+
	d6vBKxEi9ASrvsstFwGiM5jziNcsyNixWVSXOvvfTqT2ssIzJ1xMbg4B4uJU1J2l
	3rJlsUgyLpK7kqRPTn5mg3/au8PUDOZukxF49NQd8vt4crfiltFLpyghFZ5m+n+V
	bqAjxvVeLlzX3R9hah2xXNkbxy6+D9AMOOKf7J54dQABmhEYA9XOeTuCmzzh2Dx3
	d+iCR96epD5azDtJaj04sY+ClRIH5GN07VxSJ4AKVJYx2+7UOEX9y2nhXHxjyra9
	IkhtI9n40Lm6Gicu8VxJXaAdE2+gprK5qZZp+m/mZ/DFvQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a96ue0b7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 07 Nov 2025 03:19:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e88947a773so13107501cf.2
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Nov 2025 19:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762485577; x=1763090377; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BrpjAWiwCyBIR4NqBN1fG3lVzpUvOEKnEsnydrbcid8=;
        b=NuIk26SSk8nkIdtL14PMX2lPz/E13kBFbkSutCVJY5epjm8v3KQoLIEX2bwQFg7Qbe
         83CzNOFimehWZ01No0MyevMUMNdOOCY7OBhrqK3sPh1HpuZeAiPLgKOAwfLUNNe+UUNQ
         rfYZJ9HOx89JRuV6PS6o3FgNWKswT2B30Cv04D3Az2ocUHUOAGt8+JN9ZNc8Uxzti0fz
         wCLhG2F12w7Y4dbGNDZme6fN/jzsURdkzps0mikXW6JUjAeS7Ua1l9hv0iiomC/UzVX9
         iYLSGDPqsYJDpco+rOY1i84Agc34EFaIGtjo2afNcZzj2i2YTiQOIyCHiPt9/H4RtVtF
         o+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762485577; x=1763090377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BrpjAWiwCyBIR4NqBN1fG3lVzpUvOEKnEsnydrbcid8=;
        b=QuKgGGJirV4/NQlQK5YKleDLH2h4T8a220yLBx3ndQTLQm0djKRsEUHBLl5KtnOexU
         VYYAdf5RJtSJ/ARFgdd8/PprfY7fsRRGk49IcnzXUTCVpy72Uz9bBYYG/EnaqXLFWaui
         IogDiFe/OqWFVM+GROjyqmHtdaNK1xiIoKROZf6nMyi1o2LQ3U6EnbDonnSMphNtLaXK
         IClEWGr+n7M19kj8Gmaf7KVVCtJcM8+3S+5U1ohfZWlhzmjZuQOuH/bZh6Ie83GBUW6z
         pcQnOjilSCjPfS/0r4e+Ex00Nkp1lWGdOb+Eqlg2RK6iirA1IotiEZUfoJwnkvehJKTL
         ui6g==
X-Forwarded-Encrypted: i=1; AJvYcCWGOua9YTVsn/ZlgIlmG4bHyDlG4RkcfXMJrr5hs1I9IQd4lsiLCc02f9yc+7W6gKq6OFu+ScPp6TSCIW5tKA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzas82R89PCVuX138vRVShp8C3MFmUhAC9MJGceBiZ4Ht/YVftv
	lY0m2TOUMDqNsIdQ0mQ2+UC7+x8BW6WHU1E8CSgU4+ylZax6TF7c1PPoNMVWH/crMnpF7IV9Zow
	18mB8f1xZhkyOU9MXvM+cNUR6MJJ34Te6SFhzIpDW760Co1IERLFX4JZzpP5GMrORcyRfZpjuCb
	c=
X-Gm-Gg: ASbGncsyu5Y2vHTsr5Oj/TJp1Q4uuo+OOUs3Qghehe5knlC36xQidSc2xKWOEzMOo7Y
	YXc0wt0DWGU9ohp3LiME2h9nVtvFaJCy3KfBKeS17LWCJGh0rxZgs2eSFXd6lmZbBIP8lk4hNLu
	703p/q0E6wrDEePoz7zTZfpXcfWwLo57BmPcTYqunX0gMJ6HlN7q1aIGhS/KQCvU+DWWnY2X0Kw
	sbp3xw3nmdOF6fEgPY3pdZykBhXMHPOoaFd8pXNR6BbckIEWfgSw3Wxa48TDqzfc2RF16EdBcph
	WGY2QtBuFfubTqVVwvI4okecAj8qPbidqikdgEaC8kjzmsiDl+eVDeDPj7DIzjuBW+s0iKxt8Fm
	hkDdaYtVMjZuCsG9i5l3qQ8FIVltV5B6IV22cwpy+GfgKiKYU2n/nkcwCaJ2H8dUtOTgUD8IX9j
	N+hkWpQ2+6ugKv
X-Received: by 2002:a05:622a:11c7:b0:4ed:6746:5c3d with SMTP id d75a77b69052e-4ed949432cemr23756881cf.16.1762485576962;
        Thu, 06 Nov 2025 19:19:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/3FjNRKucfvNXkDZbeGXLag2dCvNMAIUYAMoAD/S9Y8MWbIoOna+co2re+tgJ+a1VvKEhZA==
X-Received: by 2002:a05:622a:11c7:b0:4ed:6746:5c3d with SMTP id d75a77b69052e-4ed949432cemr23756521cf.16.1762485576496;
        Thu, 06 Nov 2025 19:19:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a019f09sm1147166e87.31.2025.11.06.19.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 19:19:35 -0800 (PST)
Date: Fri, 7 Nov 2025 05:19:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 11/13] soc: qcom: Simplify with
 of_machine_get_match_data()
Message-ID: <odmsib3dsxzzggq4gcx7gmh6vq3crlv25fz4z2l2ntezvx6gbi@uelqojwjjait>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
 <20251106-b4-of-match-matchine-data-v1-11-d780ea1780c2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-11-d780ea1780c2@linaro.org>
X-Authority-Analysis: v=2.4 cv=fYKgCkQF c=1 sm=1 tr=0 ts=690d6549 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=e-unOtBAnIuy2i46bukA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: rxgvus1Y_rOKjAR4dBOI0cmqL7rwxmhz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDAyNCBTYWx0ZWRfX4eeB0iojtQNF
 Vizia4ayDtId8bm0o0sDsbBI373f9jccthSIGaW9UJEhm2D7NFixq26dS7nm62j+4PurfKzlyDB
 VaIITYDK71OJfN5FfWNZfyQ83d2lk2cmpfEJPgUa3yA5Iw3A/Fi+IDgubSIYwMj5sZ97U2zbQum
 tBc2W85uNyUJUFTPh69Y6juO8izYtM9dUSyzNie4uWVM0xuUbgPvYp4+HwtLftP3h4afOO2+e16
 dUeUVokWSOv6LAH8RWTv4W+OzDBOYk8rlUk9FkGMVokEVq5kdfiYppDxOFI9kZmvUmuAOtQEaoX
 Xa9pgPh2f4HFE+4ULQrtBcJozJlT/Bnf1HNqEr/EPwhdmfJvI4kCrb1bbdGO540kcJsOy739y2j
 aRoRdGucZGQR+Gt8WOT9nX9p8h/hdw==
X-Proofpoint-GUID: rxgvus1Y_rOKjAR4dBOI0cmqL7rwxmhz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_191939_714954_4E7F81B7 
X-CRM114-Status: GOOD (  23.70  )
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

On Thu, Nov 06, 2025 at 08:07:18PM +0100, Krzysztof Kozlowski wrote:
> Replace open-coded getting root OF node, matching against it and getting
> the match data with new of_machine_get_match_data() helper.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Depends on the first OF patch.
> ---
>  drivers/soc/qcom/qcom_pd_mapper.c | 17 ++---------------
>  1 file changed, 2 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
> index 1bcbe69688d2..07198d44b559 100644
> --- a/drivers/soc/qcom/qcom_pd_mapper.c
> +++ b/drivers/soc/qcom/qcom_pd_mapper.c
> @@ -613,25 +613,12 @@ static void qcom_pdm_stop(struct qcom_pdm_data *data)
>  static struct qcom_pdm_data *qcom_pdm_start(void)
>  {
>  	const struct qcom_pdm_domain_data * const *domains;
> -	const struct of_device_id *match;
>  	struct qcom_pdm_data *data;
> -	struct device_node *root;
>  	int ret, i;
>  
> -	root = of_find_node_by_path("/");
> -	if (!root)
> -		return ERR_PTR(-ENODEV);
> -
> -	match = of_match_node(qcom_pdm_domains, root);
> -	of_node_put(root);
> -	if (!match) {
> -		pr_notice("PDM: no support for the platform, userspace daemon might be required.\n");
> -		return ERR_PTR(-ENODEV);
> -	}
> -
> -	domains = match->data;
> +	domains = of_machine_get_match_data(qcom_pdm_domains);
>  	if (!domains) {
> -		pr_debug("PDM: no domains\n");
> +		pr_notice("PDM: no support for the platform or no domains, userspace daemon might be required.\n");
>  		return ERR_PTR(-ENODEV);
>  	}

Here you are mixing two cases:
- There is not match in the table (in which case the driver should print
  a notice)

- There is a match in the table, but the data is NULL (the platform
  doesn't have PDM domains). In this case there should be no notice.

-- 
With best wishes
Dmitry

