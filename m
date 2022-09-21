Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD04ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 15:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C4RzQqA/HRGvFOgdv5t44witcXEdQq/ZDQHfjhXfWGA=; b=G0eMvWjbc5sT2JJl6eC8G5MKyT
	N0ong9rB2gmC0tE/HEfTTbXKWMxb243vvOOjXawJm3fPYE1jQ/IVj7rwOW3WFT9lKuGrnaFYzJeUl
	YTNNYd9TX5bEjgAXkkDdFOtEF6z7gdEK/RlPonajaIyBgYD5ISDiItH52OjApbVXmZQAUCGSn0IsC
	CACVk/kVnP0gBoiXYjyR1VLFLzF3J/L+eYXdxbObnJ8soP+1TXCI7cWvdvc/DqlP27i9Gvf59YwIm
	7b+ojWnGifXfCKPt9XaNvemQXlxRuUXFLH/2snlFwEmVEy6/Oz/hgbsyclaSJZOGgbDNn1jknGd50
	sYYMxNtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob1Kf-00Bhvu-LY; Wed, 21 Sep 2022 15:08:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob1Kd-00Bhtt-6a; Wed, 21 Sep 2022 15:08:12 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28LEYhNq003482;
	Wed, 21 Sep 2022 15:07:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=C4RzQqA/HRGvFOgdv5t44witcXEdQq/ZDQHfjhXfWGA=;
 b=dVSpcLl9PGV0MkOeqo9to2wsOvZBIFwRsLvqyrI4sNTgUoRfhK3XcSbcW2qhXUS2BZ6N
 MW/UJsGlvaLZBEDk9Kl9o3HsvI60r29mss/ztvYz+MMX0hT4cJXKst3fYj+/1lnl2rpI
 luYk5RBM6nwwg7xSrS7SNBXN8AWX7St/W/Cx44vlQyrSzrHDgWnwOQJ6UCEa3Bj4tOco
 /iWL7avnrGDsc+p6bD7B/be16n5PJa7gj99YNhuOr27Ftkih+q6PvR93SUXAMGtgskIv
 xOhxOHbtm41Haq4cgpAwCeH64KxWY4ljCsosiR3E5y2PCQTSV+pQS0+SLt/GlQlxezKz pQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jr4ge02kh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 15:07:55 +0000
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 28LF7QgR028117;
	Wed, 21 Sep 2022 15:07:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 3jnqr7x6hc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 15:07:54 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28LF4QUZ024758;
	Wed, 21 Sep 2022 15:07:53 GMT
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 28LF7rY4028732
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 15:07:53 +0000
Received: from [10.110.44.78] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 21 Sep
 2022 08:07:51 -0700
Message-ID: <73a16853-d6fc-8a14-8050-d78c8fcd0e3a@quicinc.com>
Date: Wed, 21 Sep 2022 08:07:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 2/5] mt76: Remove unused inline function
 mt76_wcid_mask_test()
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>, Gaosheng Cui <cuigaosheng1@huawei.com>
CC: <idosch@nvidia.com>, <petrm@nvidia.com>, <davem@davemloft.net>,
        <edumazet@google.com>, <pabeni@redhat.com>, <nbd@nbd.name>,
        <lorenzo@kernel.org>, <ryder.lee@mediatek.com>,
        <shayne.chen@mediatek.com>, <sean.wang@mediatek.com>,
        <kvalo@kernel.org>, <matthias.bgg@gmail.com>, <amcohen@nvidia.com>,
        <stephen@networkplumber.org>, <netdev@vger.kernel.org>,
        <linux-wireless@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
References: <20220921090455.752011-1-cuigaosheng1@huawei.com>
 <20220921090455.752011-3-cuigaosheng1@huawei.com>
 <20220921061111.6d960cc3@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20220921061111.6d960cc3@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: r70nx2ycLn7VRL4wpk2BqUvT91ezUXo8
X-Proofpoint-ORIG-GUID: r70nx2ycLn7VRL4wpk2BqUvT91ezUXo8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_08,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=720 adultscore=0 suspectscore=0
 clxscore=1011 mlxscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209210103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_080811_276797_6A85D706 
X-CRM114-Status: GOOD (  12.65  )
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

On 9/21/2022 6:11 AM, Jakub Kicinski wrote:
> On Wed, 21 Sep 2022 17:04:52 +0800 Gaosheng Cui wrote:
>> All uses of mt76_wcid_mask_test() have
>> been removed since commit 8950a62f19c9 ("mt76: get rid of
>> mt76_wcid_hw routine"), so remove it.
> 
> This should go via the wireless tree, please take it out of this series
> and send it to linux-wireless separately.

And when you do that add wifi: prefix to the subject

