Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68EBCC25B79
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 15:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ViWFnlRfa6HfsCpt9sNPud6U2bBS5mkJbqnxes4Nv44=; b=MnToU1QC9iTmtvcBJmRgH4Rfmu
	tLuScVY4R8kzdKnNAeO6PoKMyNKWkMeL/Xb/+YhGNXbpyXY+MwguzzLuo4oyiWrEbuGb2c3uy6tnf
	iQKSIQhoH7JC0Uo/BQ0lIjLzC4M3VFdFynX33ZvXzHlf1EnN5Q61MguJyT/AwlMWIAbyrKsd9WZAN
	fJ7RrJpg+TMqxsm29K1yxtbCbXQICZ2w1aUnSynmvGaoFKtOU0H/v70NdTQXICW12Mj/aEvwbzrLr
	iBvdYngTjt6i3qASG8oIjguneXKmjYuEO9FYPjNYmO42yEYn0nr/2BuOsWHk8ifdFWUNarNifC6xl
	wEqgdPPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s94WT-0000000EmRS-1hd2;
	Mon, 20 May 2024 15:01:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s94WO-0000000EmQ8-3SMM;
	Mon, 20 May 2024 15:01:54 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44KCAjP9029799;
	Mon, 20 May 2024 15:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=ViWFnlRfa6HfsCpt9sNPud6U2bBS5mkJbqnxes4Nv44=; b=KH
	zDrnPS1fdfel7KxCI9YWLJcFc0omE4hPzN51YzAyvtF8H5eJjOOx5MAZiWV3kDR6
	nHGCtoJ4w5zdWfkijZpbcYZr/YeHui7gsMfIHDRMEZ6O366kEhiLoTNKLvkLvfC1
	w5pEo/5Bz3A16Df819O08VcmWtQMpFSwy2S//XpEsNJAOVjB9snSFAjsVdA13wTs
	WVUEpNn0F8FDv0nvRWsBQdWEncLfX8BK2FtYGiKKxpkZDx6O/7sDpUXNiJJn+950
	qshmrVa7sRv1cTq8eU4tFzdA2ee9xfy93ozB8Gg06WZ1wMRe9faa3BxnZ4HuNvVz
	/+/KURVGk03kcLvRRpsQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6psauk5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 15:01:44 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44KF1hue032086
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 15:01:43 GMT
Received: from [10.216.60.210] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 20 May
 2024 08:01:39 -0700
Message-ID: <7ab7636c-9da0-8053-a264-6031c416ab6b@quicinc.com>
Date: Mon, 20 May 2024 20:31:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] remoteproc: mediatek: Zero out only remaining bytes of
 IPI buffer
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        <mathieu.poirier@linaro.org>
CC: <andersson@kernel.org>, <matthias.bgg@gmail.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <kernel@collabora.com>
References: <20240520112724.139945-1-angelogioacchino.delregno@collabora.com>
From: Mukesh Ojha <quic_mojha@quicinc.com>
In-Reply-To: <20240520112724.139945-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Bd0pJb3d-7DgY5dqmoJk8-rBGLOCNNDJ
X-Proofpoint-ORIG-GUID: Bd0pJb3d-7DgY5dqmoJk8-rBGLOCNNDJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-20_05,2024-05-17_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 clxscore=1011
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405200120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_080153_035019_38E9D360 
X-CRM114-Status: GOOD (  13.25  )
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



On 5/20/2024 4:57 PM, AngeloGioacchino Del Regno wrote:
> In scp_ipi_handler(), instead of zeroing out the entire shared
> buffer, which may be as large as 600 bytes, overwrite it with the
> received data, then zero out only the remaining bytes.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/remoteproc/mtk_scp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index e5214d43181e..dc70cf7db44d 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -117,8 +117,8 @@ static void scp_ipi_handler(struct mtk_scp *scp)
>   		return;
>   	}
>   
> -	memset(scp->share_buf, 0, scp_sizes->ipi_share_buffer_size);
>   	memcpy_fromio(scp->share_buf, &rcv_obj->share_buf, len);
> +	memset(&scp->share_buf[len], 0, scp_sizes->ipi_share_buffer_size - len);

Although, it does not make any difference apart from a write of len 
bytes, still a good improvement to do ..

Acked-by: Mukesh Ojha <quic_mojha@quicinc.com>

-Mukesh

>   	handler(scp->share_buf, len, ipi_desc[id].priv);
>   	scp_ipi_unlock(scp, id);
>   

