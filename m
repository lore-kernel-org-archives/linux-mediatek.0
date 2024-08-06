Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF00C52D6F
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Aug 2024 20:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m7C0xSF3jS1w6upvBOrj0wW2HoCfsEi5eEfNVL4N+8Y=; b=Qzw3nJ9DFhokIBh1HNr/bVhuKp
	yPgjjej9utrrmzyNhh/oZcZMf/wqEg9AC6PST9VzaVQpsBncwGViNWm1yYfwlHjiTsLeucfFC4Ael
	iWttE+s6dXTV9PWjiWs8eyZ7lmQHZoxMsBjdN3ALNxUi/v7PoWPU6VEi8KQKobfuiGdwmyYr8pHY6
	J714fDV0ZhFiTb4XOZyL0Qw1vTAtiA+QWqmJYNYGH2aGYeCqHILLj0ZJOnoFtdvayegaF0q6gFk0Z
	jRyrCbs27qg1SKLehj8zAr9WdeuGiynkXVeQy5KjEQ65UV1rJzASq0Py0/iuNQvRki59rcmwj0y3M
	rEslaMzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbRAX-00000002t15-26aM;
	Tue, 06 Aug 2024 20:52:33 +0000
Received: from 008.lax.mailroute.net ([199.89.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbR9z-00000002sw3-37gU;
	Tue, 06 Aug 2024 20:52:01 +0000
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4Wdlq11Y8Qz6CmLxY;
	Tue,  6 Aug 2024 20:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1722977513; x=1725569514; bh=m7C0xSF3jS1w6upvBOrj0wW2
	HoCfsEi5eEfNVL4N+8Y=; b=V+T3X5uXuLfP9RSSRcaky3DmPV2YDHoNimWHyhwp
	hB2bi7766lEvHmgtwnTsrsvYY3WO+UMfjQfGM51ZLiNZZgU1+vnsT6vQ3/7P/ewz
	JK3acz3Ym1VKWln2IrkgvXGYlJy3SVNh7D8ipZ1NYCuf0zC6hosGJvFffrJLxrVc
	RU8FbK46hKw+vYMI0lcRbF7oERjVJ0krayfxhRCUx1v/GrCt7HLO3sofVsNDjGUn
	Q0BrRkRhlQ4Q5ieWYb2BCxDjCZ2AVJrtB+1hOOnb8IGkDPPA/j22xIButarwcJsd
	a8u09g9NQCzdaSVuykarvC8TPXkUr/S7Sak7+c1xL+Vfrw==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id ytJDuSmLeJFh; Tue,  6 Aug 2024 20:51:53 +0000 (UTC)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4Wdlpt35cVz6CmM6X;
	Tue,  6 Aug 2024 20:51:49 +0000 (UTC)
Message-ID: <126b79d8-6451-4e86-9df5-189f19eb121e@acm.org>
Date: Tue, 6 Aug 2024 13:51:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scsi: fix the return value of scsi_logical_block_count
To: Chaotian Jing <chaotian.jing@mediatek.com>,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com
References: <20240806072714.29756-1-chaotian.jing@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240806072714.29756-1-chaotian.jing@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_135159_839418_0738E2D7 
X-CRM114-Status: GOOD (  16.10  )
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

On 8/6/24 12:26 AM, Chaotian Jing wrote:
> scsi_logical_block_count() should return the block count of scsi device,
> but the original code has a wrong implement.
> 
> Signed-off-by: Chaotian Jing <chaotian.jing@mediatek.com>
> ---
>   include/scsi/scsi_cmnd.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/scsi/scsi_cmnd.h b/include/scsi/scsi_cmnd.h
> index 45c40d200154..f0be0caa295a 100644
> --- a/include/scsi/scsi_cmnd.h
> +++ b/include/scsi/scsi_cmnd.h
> @@ -236,7 +236,7 @@ static inline unsigned int scsi_logical_block_count(struct scsi_cmnd *scmd)
>   {
>   	unsigned int shift = ilog2(scmd->device->sector_size) - SECTOR_SHIFT;
>   
> -	return blk_rq_bytes(scsi_cmd_to_rq(scmd)) >> shift;
> +	return blk_rq_sectors(scsi_cmd_to_rq(scmd)) >> shift;
>   }
>   
>   /*

Please add the following to this patch:

Cc: stable@vger.kernel.org
Fixes: 6a20e21ae1e2 ("scsi: core: Add helper to return number of logical 
blocks in a request")

Anyway:

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

