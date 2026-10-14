Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540C4CC6B2A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2026 23:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8jeQjHDKcOHCXmCoyag9tPF5EdS/R/OQDxIBgOt2FOY=; b=ukFbkcHdtPDGPB6NcXK5ha3uJ1
	zcARMvIiCFQ7CTROqCXkFdabDpyJENeoMdY377dVGv7lXzgVhy30k+A7x+VkLEaEVLGeHySdaZCh1
	o5ltqeeN4lnVt6+JMZT7HivEh7vQqoa2AUoeJz9VFSUeNtdMnDxx9L7Hn6wIBfu/vDZhz2TIEMKVm
	xrkbPHTzB4OBIS3yZ5RJ6vWW9VlJdl+jXULRhN6Ti7IL+l2YrC37e1G8i54OtlvZjiYAx17fDqI4L
	K0FvHPz6dNL/I7Jh/LLijEgEkXFTyRuNajC47ByMArIVfPGo/CgpfAuGJVTJGvib1fv9Gzy/Eisr5
	vy3w2Giw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH8hM-0000000GTI0-1Xci;
	Wed, 14 Oct 2026 23:47:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH8hI-0000000GTFd-0Rtq
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Oct 2026 23:47:50 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ELvROb905432
	for <linux-mediatek@lists.infradead.org>; Wed, 14 Oct 2026 23:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8jeQjHDKcOHCXmCoyag9tPF5
	EdS/R/OQDxIBgOt2FOY=; b=LSCWDxQwT4suNSOnBFbCQ7rfN+pgjj16sC1Fqza/
	LD7YzSGPrkPPTmsXIJnfzfyoENc2oNnRMAfD2+GN1A7pyUlReFCB1DLIaYIWm93u
	59gdvlM/1NP8rSjQthbco/PWpU0ehjYRrZFtcsND5TMvdeZH8Xt+eHwH8RmCP5ON
	TwR5G0E/6kMI+/uYKiR221325vASNsyMQ60zxtkwdM9ToWu04Ief4EEnPS/O+8R9
	jMuJ3LsjMd+SbarNRQyNVPZuB+YKiaIAiIXZNdzi6KN003SX+XuH+KNmJQjpdwWD
	wHBNJ9rrAfbXwN8Dwp2iyaQ7A5W9Q/8LyXOY/aBwNosVqQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha42p40nc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 14 Oct 2026 23:47:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939c30aa9a0so107334885a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Oct 2026 16:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792021666; x=1792626466; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8jeQjHDKcOHCXmCoyag9tPF5EdS/R/OQDxIBgOt2FOY=;
        b=Z5yLRz4T9Flvg1ju8eF9h+/kBXrx74qYbBPFLD/F6ra0ANgSH52OXBbECuynrjBVcD
         x3RGOJmYKPs7VIVitsOcXO68nLayMnAt35YH5EShbhYgvE5+8V/HMKgnVjAMS+oB7lav
         ediFO+VIoZQMWbsqzpwRhEdnc5O3hm1mN+jnNep0cFzO6ebaeFvBeJRa+XjyWJk4H+uA
         BuT+gdp1KRA02Oe7dtn5Ycd3DnuZHQIcW7mS5PrhmoSsTChvSWt9rhCnYrBT3SnkOchv
         +CJ/8lHjjkYTATfZvULP8u0dcPOuGqNs9pVgzAopuutDvzT48dvh7YP/l38LManZId1w
         xm3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792021666; x=1792626466;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8jeQjHDKcOHCXmCoyag9tPF5EdS/R/OQDxIBgOt2FOY=;
        b=ilkDdQfX7SNq2G9nf5IXteTBdvcGSpO/RajAaLahGVl321kZ3Dq0L0nDeQBOwMOsmH
         sgHcMsfZUixJgeY4FpfJhlDZtdwPIvQhKHU7shi5uNHk9WcQirdEUmYe4gsQk7oQCUAk
         pseRaNC2F94bZ2d40BKdrRmhafNtEBNLiJdNbSwSPmviNhMg2dlzvrTtzSqdjpmBHn4n
         7OKAlRAYaQEnG2rescVavdU5DT/ryTbTooDAfCuLigKzMX2dYW86qQ2XrdIfaErj8g7U
         bHB4IAhFH3UhEcx7jJGovAosUBEI1Jr7+m+RzJRLXElIHVhMNj+7XMzO8wNmrBKsAKTu
         8pTA==
X-Forwarded-Encrypted: i=1; AKwUvBwDSCndZI3vcHZtxpb28NuZEAoDEdjyiiKkeGEZ/WD6sZPqbrJbZxbEP4DFYcwAo4ieujWRVqz9tSjcZ/TIIw==@lists.infradead.org
X-Gm-Message-State: AFq9FYLbjDYGQBAnsyuyauheSa6aRizCicnqRgBEUGwy3tzys9HuAreq
	Xt9BW0NXjVmJ1CjBSO6mURR4AdmoO71zMzZbjLlsFu/QCP/y1sUZR+Q5wXEdJ6fqFSfMO2cw+MG
	YesXPHOY51x8dp374SGSJgYf3Pz0dEziu2ibzjkK/9H3GeE4FWA5HIcqf6LumTDpTLxUfCSQycn
	0=
X-Gm-Gg: AYBFou1CuHb6CBvdxgCDORaxMVYNRM57p7lUXlLdiSMeTL7UU3ncqKngAoM7j9BxRr/
	XvHxvfMCJ0A3foZlXNg/rXjT+986mGuVkEUGfGlrsDDyfFPn08rwx3Qpkgjx4LbmmnqjcW7pXij
	M+e11+2EnkYLbJHGkm/BbQEb50QLsv/1WB0sFinAuriqBQYa57xOzzunwWw756o0hh/S4lJPqIJ
	Pw2+i76FWaAnJ6iQXW+O5PwfrTTRLa3hBOe47f5F1xhZradaaKQvoSysjmlhgYV0iOiyaQdUR/Z
	gpRsQoh6Pr+/DADaBKC2VZkBfabVX+ESu74nQWmbHQa3kvLJZYJ8xJ3QB96PpKU640HDJYWYG84
	8RmsId8NlvQKifT2bxZ/qKK9LwVgQu4wsTAj7GHYKnGhIG4ssQqoekgdgdrzAPHbMsNJu2oZix0
	tC6OGctm4u7Q9y
X-Received: by 2002:a05:620a:84c3:b0:939:ed29:8ad with SMTP id af79cd13be357-93ebd0bf49emr2568370985a.3.1792021666276;
        Wed, 14 Oct 2026 16:47:46 -0700 (PDT)
X-Received: by 2002:a05:620a:84c3:b0:939:ed29:8ad with SMTP id af79cd13be357-93ebd0bf49emr2568368585a.3.1792021665765;
        Wed, 14 Oct 2026 16:47:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3aafdeaa3afsm2113211fa.14.2026.10.14.16.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 16:47:42 -0700 (PDT)
Date: Thu, 15 Oct 2026 02:47:39 +0300
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
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH 3/4] arm64: dts: mediatek: Use DP AltMode defines
Message-ID: <mtiuiy5rfqsozygax7fuifbotn2vno2irdtkc6bew2xxasd2mq@uypohil5zz2g>
References: <20261014-dp-altmode-dt-defines-v1-0-b657c9b6e4c3@collabora.com>
 <20261014-dp-altmode-dt-defines-v1-3-b657c9b6e4c3@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-dp-altmode-dt-defines-v1-3-b657c9b6e4c3@collabora.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA5NCBTYWx0ZWRfXzgk7ExAXZzAJ
 V/WdrkVaRcaZt7uj865f9/zU2JVYkofTTot99aOeMhx0O6YtVxD9qpW1M9QFpnmxu0n3OWcex6L
 J7lLbUpzw8XO+K5hTYY7t07QVIfzZcY=
X-Proofpoint-ORIG-GUID: XHmlT5DsVdVnP5PEheUfbFZXYh1DY08p
X-Authority-Analysis: v=2.4 cv=aeb0Dhot c=1 sm=1 tr=0 ts=6ad014a3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=QX4gbG5DAAAA:8
 a=Gdl50fq9-iV3HN9amUMA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA5NCBTYWx0ZWRfX+fWeTHayxXFI
 j4ECBNh6HmHgEBLGgwt0skba4L4NC9mxKedo6TouGRF/JjVAaXjJDO5t3+6W0aN8z9Ae2yvlXYG
 4S+4xc9dtKA1FtTVVxDohvWaSu0ZpBphxh2gr9W9Y+TItFLR+z1zdtOTpFgFBnCDraCAhK6iJ+h
 3/AVV+d5HXE903K94CUtOYi9IHcydvNsr6yGx8QOmRYsDSSZmghHqeoBEy2LgCZQUV0zrEGPEvb
 AZiXbl4Qmi5j92KdVIzrxDnUyldb0q10MHzqeoyRD8QoEjARXDR2d04A/hnBszYKpiKV7nCTWkZ
 3OvJaaNpXm97VPl+cKQAWH7Dzxs9qaHOTq3LYaKAgCzhThNfKy6N01oGugwpe80AXrbqF3FliTW
 7UAEbAAoZ+EA/SgZqRdAZVUS2Azar04OyBvjWOloOlMFYlg3QXq0YFZrt+aGdtkZ39wrAcp/5wG
 qs+d3UMUq9lkIL7PlLA==
X-Proofpoint-GUID: XHmlT5DsVdVnP5PEheUfbFZXYh1DY08p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_164748_286624_69F945C6 
X-CRM114-Status: GOOD (  20.75  )
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

On Wed, Oct 14, 2026 at 11:31:51PM +0200, Sebastian Reichel wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Use the new USB-C DP AltMode defines for the SVID and the capabilities
> VDO to make the DTs more readable. This also fixes up mt8390 Genio
> platform incorrectly announcing UFP_D (upwards facing) support. This
> feature is unfortunately not supported by the SoC.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi |  8 ++++++--
>  arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi | 10 ++++++++--
>  2 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> index 669eaec662f3..02f8b33d64ac 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> @@ -527,8 +527,12 @@ PDO_FIXED_DUAL_ROLE |
>  
>  			altmodes {
>  				displayport {
> -					svid = /bits/ 16 <0xff01>;
> -					vdo = <0x001c1c47>;
> +					svid = /bits/ 16 <USB_DISPLAYPORT_SVID>;

USB_SVID_DP_ALTMODE

> +					vdo = <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
> +						      DP_CAP_UHBR_13_5_UNSUPPORTED,
> +						      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
> +						      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
> +						      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
>  				};
>  			};
>  
> diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
> index aef908df530e..3f7d57dfcf93 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
> @@ -597,8 +597,14 @@ PDO_FIXED_DUAL_ROLE |
>  
>  				altmodes {
>  					displayport {
> -						svid = /bits/ 16 <0xff01>;
> -						vdo = <0x00001c46>;
> +						svid = /bits/ 16 <USB_DISPLAYPORT_SVID>;

USB_SVID_DP_ALTMODE

> +						vdo = <VDO_DP(DP_CAP_DPAM_V2_0,
> +							      DP_CAP_CABLE_TYPE_PASSIVE,
> +							      DP_CAP_UHBR_13_5_UNSUPPORTED,
> +							      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
> +							      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
> +							      DP_CAP_SIGNALLING_HBR3,
> +							      DP_CAP_DFP_D)>;
>  					};
>  				};
>  
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

