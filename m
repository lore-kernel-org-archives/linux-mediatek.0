Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69642C25B78
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 May 2024 14:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qf2B6uaVwOzsoHSnptOmqBPxKS/mvVhhFLc7hn4ujoo=; b=G+17NOf0W4kS4UFilCsJA84O0J
	vfDKOmO0wONNGjkcIJP5/fqS4QbUTGH8stH9bTb3VJ+znVfc33B+MjH4OnX6iqmruDsfwCnrA9rLL
	cmf0DlW5Y7d1t2GPIv5OPJaJ9mId97UrIv0arjSeLiIugEOvHfCPg+5CylGjXpQzoNYr78Ph3fVKV
	WiE4mxxkiNELaMmvtl1tvATx7B4f24aMn3Pdv5r48YpPGPaPjlNha2KqTw/ggusxQOnxTMNdSzlli
	rlEMq8G3T1egK2daeGswSjM2irLxHdK1P3x3f7yQ+Kjw2K9xaqqC8kpyPlcSVBH9nKJNM0ayaVS13
	B6Gcjoog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBxQH-00000000vDl-3crv;
	Tue, 28 May 2024 14:03:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBxQE-00000000vCa-07V3;
	Tue, 28 May 2024 14:03:27 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44SBk8vv022220;
	Tue, 28 May 2024 14:03:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qf2B6uaVwOzsoHSnptOmqBPxKS/mvVhhFLc7hn4ujoo=; b=lpd2Bp9vr4QSBIlh
	DaKx7lGbc3rAM6mHbYohIazHhC5cGS34GLOmLeS/d93fwBKAI1XEg/KAlKyF4yXt
	Eg525t0jjTM+yaVF2oB5DQVQna09y2EWLTSuAuDQ3DsqRvnAvr/yYKCA+uBvCTT+
	Aze/MrNNzVVFx7e9W/orwCZMMjq0DaYAMH+tYRudg9/JiTs+tln9pZ4ZQWuNBx7N
	lgQB6ArMKrZ1prSHP9CDarIBbfqQQ/yxLZ89ZfywLNX3/MwMycv+lGmvwdHpwYFk
	8H5qayWedmBDpl9Iz+3VpsTlZtT2lJrB0my8qxQ1F+qqxWIEYPdkrh2RaYdpngTc
	7Hj+lg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yb9yj68tr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 14:03:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44SE3DHl010926
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 14:03:13 GMT
Received: from [10.110.122.222] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 28 May
 2024 07:03:12 -0700
Message-ID: <38842d90-f64d-410d-8ef5-6e1d09ff01a0@quicinc.com>
Date: Tue, 28 May 2024 07:03:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: mediatek: Add a module description where missing
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        <sboyd@kernel.org>
CC: <mturquette@baylibre.com>, <matthias.bgg@gmail.com>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <kernel@collabora.com>
References: <20240528121320.160685-1-angelogioacchino.delregno@collabora.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240528121320.160685-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8ONwqeoyukzF1gfyG5FMT2wykvTPWjZW
X-Proofpoint-ORIG-GUID: 8ONwqeoyukzF1gfyG5FMT2wykvTPWjZW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_09,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxscore=0 phishscore=0 mlxlogscore=711 spamscore=0
 clxscore=1011 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405280104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_070326_236853_54B19800 
X-CRM114-Status: UNSURE (   7.87  )
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

On 5/28/2024 5:13 AM, AngeloGioacchino Del Regno wrote:
> Add a MODULE_DESCRIPTION() on all drivers that miss it to avoid
> modpost warnings.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

All drivers/clk/mediatek MODULE_DESCRIPTION warnings resolved :)

Tested-by: Jeff Johnson <quic_jjohnson@quicinc.com>


