Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78FEAEB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 14:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ow7m3jr75URZ7/he9bZZDJXevWwjWsi1e2wS+QOs+tU=; b=itFA6vXE7o5GlUnoOLPUySHUE7
	i6QTgLK2lIipWCWQFBfjERRNNfZw+EyfN3Q6wsA46sDDI46azZP+s6sAQMTE8GIown3esEI4lvU51
	YaZVmhxpF+8+5UI8xpKZmF3cRokYIxboKFFrvJ91do1AYkfw0BffV+AtT08LogmzDtjKqk9vFjHKp
	aRjQA7pmgFeYmuL6VLSfh5fskKadai2K3pD6DHxhkBXheC2KF6i6YZxXyqektXiw8/ZtbqUeX1Dcy
	hpO86o9bF9dYOA5+M4aETFgm0bO3Hx6TY0yLNke4DnP9l6+6U4KgOuvtOebetUkdsffRqbogMN/Ug
	wEof/yjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM7kz-007exD-0Q;
	Wed, 19 Jul 2023 14:02:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM7kv-007ew3-0e;
	Wed, 19 Jul 2023 14:02:18 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36JDhtKs007417;
	Wed, 19 Jul 2023 14:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Ow7m3jr75URZ7/he9bZZDJXevWwjWsi1e2wS+QOs+tU=;
 b=oAJrr0NbpKZfKlvIh+41mpTLblMhSq/1YHr4nGKTD6Y9NxTj1Z+dk/57l8PmvUUfQkFF
 Kx9KsQFK0g0mwNO21IsbaQcd5/L+V5WE0gMDXzyRFuQpb6t6Jv6PLeBiYkaBb2r3nI5l
 RhqpuKiHzJg5l3wKxdWdASX6SZQ7ZB2vdVz44436qUVd6BfMxpVpJZB2BXOdFke3ad9q
 3OCPfheENKDccGyvETHbW6TtrA9dyCEH/XQK8ksvjuap0tXJ32CnJVG0CWX0+mBElIb7
 JpptWIidltBUgMa122fnq0WH81s0E06JKykdAedWpIEDaZPZuQdxy7xyorN3+pouRX4I VA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rwps5bed5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jul 2023 14:01:48 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36JE1lm1002273
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jul 2023 14:01:47 GMT
Received: from [10.48.241.243] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 19 Jul
 2023 07:01:46 -0700
Message-ID: <7738463c-c592-5d59-61ec-d39f9544b18f@quicinc.com>
Date: Wed, 19 Jul 2023 07:01:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH net-next] page_pool: split types and declarations from
 page_pool.h
Content-Language: en-US
To: Yunsheng Lin <linyunsheng@huawei.com>, <davem@davemloft.net>,
        <kuba@kernel.org>, <pabeni@redhat.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Alexander
 Lobakin <aleksander.lobakin@intel.com>,
        Eric Dumazet <edumazet@google.com>, Wei Fang <wei.fang@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Clark Wang
	<xiaoning.wang@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sunil Goutham
	<sgoutham@marvell.com>,
        Geetha sowjanya <gakula@marvell.com>,
        Subbaraya
 Sundeep <sbhatta@marvell.com>,
        hariprasad <hkelam@marvell.com>, Saeed
 Mahameed <saeedm@nvidia.com>,
        Leon Romanovsky <leon@kernel.org>,
        Alexei
 Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper
 Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
        Ryder
 Lee <ryder.lee@mediatek.com>,
        Shayne Chen <shayne.chen@mediatek.com>,
        Sean
 Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
        Matthias
 Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        Ilias Apalodimas
	<ilias.apalodimas@linaro.org>,
        <linux-rdma@vger.kernel.org>, <bpf@vger.kernel.org>,
        <linux-wireless@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
References: <20230719121339.63331-1-linyunsheng@huawei.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230719121339.63331-1-linyunsheng@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _L3h4Q3N71Ht3lEC8JxD5IKpRtE2fNnX
X-Proofpoint-ORIG-GUID: _L3h4Q3N71Ht3lEC8JxD5IKpRtE2fNnX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-19_09,2023-07-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=821
 malwarescore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2307190125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_070217_384318_B7FD3C3F 
X-CRM114-Status: GOOD (  10.12  )
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

On 7/19/2023 5:13 AM, Yunsheng Lin wrote:
> Split types and pure function declarations from page_pool.h
> and add them in page_page_types.h, so that C sources can

nit: s/page_page_types/page_pool_types/

> include page_pool.h and headers should generally only include
> page_pool_types.h as suggested by jakub.


