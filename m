Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D1F5C38A02
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 13:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YBApksLTn7y+gqO3vNjJgwg8KdCjEPbw9x496MPqxv8=; b=cdJtrB6pXc0mWZP63k8p7mYMz3
	gVDoGkWtPYjteRSYT+ht/MXjJuriLdqPBv/jL10esfqXxo9dyhZ3sqShQVx3btIbWbnvI49Un23v1
	A8TzWeii7Xo7+NOEIH0IptSCV5bJLxFjsAbL3TfPKmVLoU1USLNABZYiXPzVmxXPB9cb+JMfNih03
	QkIzf5U3C1gwoyobfuJKQhm5+wkKEcyGCTlghBpQ3i8rLILnuhE8KuARiKGY4o0tZyiUGuKrDbicd
	n3hjpeaDoXT3AmgOcYTYFCd3jLaS7fw4u48NM1XEVG7hkGmpVT8An8+V0dAEEuPwVhj+Yh5sYQ1XG
	ugAIG2lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooPSv-00HLsV-VS; Fri, 28 Oct 2022 13:32:05 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooPSZ-00HLga-Bi; Fri, 28 Oct 2022 13:31:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1666963903; x=1698499903;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YBApksLTn7y+gqO3vNjJgwg8KdCjEPbw9x496MPqxv8=;
  b=G8fv9u+fjgguyoAo2Hcaxx2BtKZjlTqJvyi6DuBNtAPlTc/p0BK0xMhe
   R+wlGpc+POUemeOEOTW1EKgNqRC08Craj83sbVgBcBiEVDCM6rhiiUx0L
   4e5+hPtWmXk36Cb15Z4DC4IQxh36Vq9b6Dpt6KHNA3oAWT+1AWppvGdGy
   I=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 28 Oct 2022 06:31:39 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.45.79.139])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2022 06:31:39 -0700
Received: from [10.216.13.23] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Fri, 28 Oct
 2022 06:31:34 -0700
Message-ID: <7cdabb64-f165-03be-4121-876736174a34@quicinc.com>
Date: Fri, 28 Oct 2022 19:01:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v3] dma-buf: cma_heap: Remove duplicated 'by' in comment
Content-Language: en-US
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>, Sumit Semwal
	<sumit.semwal@linaro.org>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Liam Mark <lmark@codeaurora.org>, Laura
 Abbott <labbott@redhat.com>, Brian Starkey <Brian.Starkey@arm.com>, John
 Stultz <jstultz@google.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
	<christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <yj.chiang@mediatek.com>, <linux-media@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
References: <20221028065533.23856-1-mark-pk.tsai@mediatek.com>
From: Mukesh Ojha <quic_mojha@quicinc.com>
In-Reply-To: <20221028065533.23856-1-mark-pk.tsai@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_063143_510511_31F743C0 
X-CRM114-Status: GOOD (  12.82  )
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

Hi,

On 10/28/2022 12:25 PM, Mark-PK Tsai wrote:
> Remove duplicated 'by' from comment in cma_heap_allocate().
> 
> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> ---
>   drivers/dma-buf/heaps/cma_heap.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
> index 28fb04eccdd0..cd386ce639f3 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -316,7 +316,7 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
>   			kunmap_atomic(vaddr);
>   			/*
>   			 * Avoid wasting time zeroing memory if the process
> -			 * has been killed by by SIGKILL
> +			 * has been killed by SIGKILL
>   			 */
>   			if (fatal_signal_pending(current))
>   				goto free_cma;


LGTM.

Reviewed-By: Mukesh Ojha <quic_mojha@quicinc.com>

-Mukesh

