Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82521C3A59D
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Apr 2024 01:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+8aeLRDcutyaciqRgLP8Mis5NQ1ZL5M9w2DhTLXBu50=; b=oJOe3dfKB/XPPcpK7ApQbq8TZ+
	T70mK04SJ9yvACGT1ESWc949h9tb3TppImn53+5+gFaXmKlCmPfRUvV/xfq1gsCijHwTiBLevqd51
	zQadG98ZCqB6IR5crqej+fgcds7DrXeTlbrxGy0SKv69vjeUT/2TidpRH+rYDncp/VHkSXfaaL14D
	LaWToPeQZpZat+FHlrI2kwYbOBq0DPGVRnug5uBs7QwVXznpnbroscE1GRlEWskRc26bPnQ5VBrzg
	Ogvh3sqIuFoj77AHuSaTOcUsoK06rA6GI2Bpoe9atX4q4Pbe3pSkg58B2aDlFHFi7UZpnnPuP9y7T
	zoq76+9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsurn-00000009Rbj-0kIP;
	Sat, 06 Apr 2024 01:29:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsurk-00000009RbH-2P33;
	Sat, 06 Apr 2024 01:29:10 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4361JHSf026939;
	Sat, 6 Apr 2024 01:29:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=+8aeLRDcutyaciqRgLP8Mis5NQ1ZL5M9w2DhTLXBu50=; b=l4
	YvvlLbkadFf93AokeGI7wjtk6EfDoExTXwzb8XTxreuhrT7ASMVimkodPP4zrc86
	kMtdVeG3bpc262GMB1kzzSwFy0GqooYPEUZVxK6STLVWMHAHpU1O+MLfKQeojwM9
	OeCHdsbkaqNIrIgf85RDkmQ6Sl+YEwetolx0lOJpMWvF+I4dlxZiJ6/bij/jJC0Y
	U7yjc4QExWJkm0A/z9P2FD7lFV6iQKHedneY+s5R6tvxNKydi6kPmnn5rcu3Nqa6
	VOzWzM/So5OYLabIK29QzIiLP+iGL1zbKAcYlkbO+pzFkbrXt+AQnSHuHZTTxrHb
	k0bUFwV7IiBglA+rUECw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xa7m5jjp9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Apr 2024 01:29:00 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4361Sx1M026496
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 6 Apr 2024 01:28:59 GMT
Received: from [10.47.206.1] (10.49.16.6) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 5 Apr 2024
 18:28:58 -0700
Message-ID: <0c7b34c6-b205-49cc-bedb-82cad6725660@quicinc.com>
Date: Fri, 5 Apr 2024 18:28:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/7] dt-bindings: spmi: Add X1E80100 SPMI PMIC ARB
 schema
Content-Language: en-US
To: Abel Vesa <abel.vesa@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Johan Hovold
	<johan@kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
        <devicetree@vger.kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20240402-spmi-multi-master-support-v8-0-ce6f2d14a058@linaro.org>
 <20240402-spmi-multi-master-support-v8-1-ce6f2d14a058@linaro.org>
From: David Collins <quic_collinsd@quicinc.com>
In-Reply-To: <20240402-spmi-multi-master-support-v8-1-ce6f2d14a058@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: IEnKgIA8KzALzZcL1_1I3cf6QHZt8slm
X-Proofpoint-GUID: IEnKgIA8KzALzZcL1_1I3cf6QHZt8slm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-05_31,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 bulkscore=0 phishscore=0 adultscore=0
 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1011
 mlxlogscore=832 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404060009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_182908_865304_4CD6A730 
X-CRM114-Status: UNSURE (   6.37  )
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

On 4/2/24 05:07, Abel Vesa wrote:
> +  reg:
> +    items:
> +      - description: core registers
> +      - description: tx-channel per virtual slave regosters

Minor: s/regosters/registers/

Thanks,
David Collins


