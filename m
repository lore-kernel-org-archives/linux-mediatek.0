Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6789FC7EE23
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 05:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y3xCd5zolOuIrBVxCyYPWzX15i/8hOYxP4izH5myV78=; b=Soh4nMmR7yqVEoU+/uPRzNy+O8
	E8qtK/qniUj8t1fGZfkMC2H2rasqkcAgZ+hFSvWdRhVOP16WmjEnOY1VLXvycP9jxQAMH0vVWNG1V
	9qXdCl5bqfhrjlsHouNgcRsDxxGk61HDoadZPZOyOuntnX8LDA527qyLTHt9hoO0Z8A7K5wuQgksC
	lKBpJNaBhOvlzwOMzBQ4w5qV+fbw3SvogKVvejp0pvB2aeg0hQOHQRcGigoXqB6bLR8h2u3dc6Erl
	UmCOTFDa78x1OG+cDa5meLHZdIr+9wl0WReUsvnMaUm9GGkvTfTfzlgchNriECZA4jFkp+mmswRrJ
	80krkKwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0yQU-005Rlf-0o;
	Mon, 22 May 2023 05:49:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0yQR-005RlA-1U;
	Mon, 22 May 2023 05:49:45 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34M3cgOG019028;
	Mon, 22 May 2023 05:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Y3xCd5zolOuIrBVxCyYPWzX15i/8hOYxP4izH5myV78=;
 b=d6ZjClp/18mXjhlG7DMA1qopXZQM4tLWhGhW0v1pRmS1ngV2J4Zwr9Nts2DI9Q2yRKPi
 xs9H3BBtqYuJJx1E8/IoocxFWKcjPHerIU6HEV3hJp+PH0t2UlIMsEEQqwgYeUcGBx7H
 BEWFPmaFIdwC3N9bH8T/TROOvyCVvVFlUgRI6IzIz6BvC88Hg+hqepjIvP/PB1MWMX88
 5kj8wt/0HAOXwkAVtEWl2o3nZtlst8wnHzAGfqc9/pUbCiQl5dQ2j403rJdLDLs2axbf
 +FdHnA+Y8Y3BamLvfpxqfsRhwUqAWdhHM2fy1ayN/v5nTXNx34ZdRzRZh7TiR9aLTbEE /A== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qpnt62sv4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 May 2023 05:49:30 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34M5nT5x030191
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 May 2023 05:49:29 GMT
Received: from [10.218.35.239] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Sun, 21 May
 2023 22:49:23 -0700
Message-ID: <bf3b5f0a-0a04-2410-9106-1e2957a2ce05@quicinc.com>
Date: Mon, 22 May 2023 11:19:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] usb: gadget: u_serial: Add null pointer check in
 gserial_suspend
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        Alan Stern
	<stern@rowland.harvard.edu>,
        Xiu Jianfeng <xiujianfeng@huawei.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Fabrice Gasnier
	<fabrice.gasnier@st.com>,
        Felipe Balbi <balbi@kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Kewu Chen <Kewu.Chen@mediatek.com>, stable <stable@kernel.org>
References: <20230522022101.32163-1-chunfeng.yun@mediatek.com>
From: Prashanth K <quic_prashk@quicinc.com>
In-Reply-To: <20230522022101.32163-1-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: icNJ-c33o_JZAe3vLJW784uCJvlYWUaO
X-Proofpoint-GUID: icNJ-c33o_JZAe3vLJW784uCJvlYWUaO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-22_03,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 priorityscore=1501 clxscore=1011 mlxlogscore=948 adultscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 mlxscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305220047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230521_224943_639938_74958B74 
X-CRM114-Status: GOOD (  19.79  )
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



On 22-05-23 07:51 am, Chunfeng Yun wrote:
> When gserial_disconnect has already cleared gser->ioport, and the
> suspend triggers afterwards, gserial_suspend gets called, which will
> lead to accessing of gser->ioport and thus causing null pointer
> dereference. Add a null pointer check to prevent it as the bellow
> patch does:
> 5ec63fdbca60 ("usb: gadget: u_serial: Add null pointer check in gserial_resume")
> 
> Fixes: aba3a8d01d62 ("usb: gadget: u_serial: add suspend resume callbacks")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>   drivers/usb/gadget/function/u_serial.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
> index a0ca47fbff0f..40ba220cf6d2 100644
> --- a/drivers/usb/gadget/function/u_serial.c
> +++ b/drivers/usb/gadget/function/u_serial.c
> @@ -1420,10 +1420,18 @@ EXPORT_SYMBOL_GPL(gserial_disconnect);
>   
>   void gserial_suspend(struct gserial *gser)
>   {
> -	struct gs_port	*port = gser->ioport;
> +	struct gs_port	*port;
>   	unsigned long	flags;
>   
> -	spin_lock_irqsave(&port->port_lock, flags);
> +	spin_lock_irqsave(&serial_port_lock, flags);
> +	port = gser->ioport;
> +	if (!port) {
> +		spin_unlock_irqrestore(&serial_port_lock, flags);
> +		return;
> +	}
> +
> +	spin_lock(&port->port_lock);
> +	spin_unlock(&serial_port_lock);
>   	port->suspended = true;
>   	spin_unlock_irqrestore(&port->port_lock, flags);
>   }
Hi Chunfeng,

This looks same as the following patch.
https://lore.kernel.org/linux-usb/1683278317-11774-1-git-send-email-quic_prashk@quicinc.com/ 


Regards

