Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9412C001B0
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 09:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tykg+JgKMerAJph3hDB8YBZCvrzptsWpwQU4Seju5nk=; b=2potSCIrwkKp7ytq5iAq8Wk+bt
	vk7BXTHhFtx0A2cZaSHkTy/v+V4qocGmjvAGg/vF76v2v/Zu8WyjswLIEpVmkFXChzI8avfdsM1Ir
	jNuHqXGTW92ZAEH2P3TV374v5gumF4Nzs9Qxgwgavcykw15MzTFcXsSliB7wWzoFOjK6AxXQZjT6v
	et3d1bJQfo828WbMvfksGPYIG8w4Ax2XiJBKr9vG4xxCoXz3tMb/GIySbjnw2H2dEIGCYh35720tW
	FDr6i81vLNZpX5QEDPxXYPHNZBop34zJUFUusWpPgtUuZETAGTyGcagsKggppFV6Kaft/cx1c9dU2
	FvTkUSfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU1ir-006wqF-2R;
	Thu, 10 Aug 2023 09:12:49 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU1in-006wnS-2m;
	Thu, 10 Aug 2023 09:12:47 +0000
Received: from [192.168.0.125] (unknown [82.76.24.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 969606607217;
	Thu, 10 Aug 2023 10:12:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1691658762;
	bh=0Iq8D34Lbklgdl/9jdr8DFLgHMB7aekBr8AJu2XlV50=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VerEY/cM1db+oPVxME0Q0OW16JQXahZtGoZtorW3gNTu7iVDPYgMe+ssBYklK6br6
	 mZrCxKjoGOJIYy4q2nMMt4lfeDiNRDl1/BW3+AdbGVRdh8KuXTWbUlnuxKvQ55GsSo
	 IXB5sCWsF10W1YYMs3vIZACJNA28yPd8aHMuFkltth0QFS6x/vctNvATIQXF/J42pB
	 eBodvnmQe8zkxCathdhkxEY5st4ZrdO80hB6utUhP5lFfiAjs95Hizbctlr8dKFPiD
	 UtNdSvHYFIJjHHE2nBdb9uPPkrrT1s81NYo0cjrnjOto7HOTgiW6WarIUqdGYlBb5/
	 72J4fNOYiiU9Q==
Message-ID: <45d0f538-9769-f4eb-7479-cf676337ff55@collabora.com>
Date: Thu, 10 Aug 2023 12:12:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] media: vcodec: Fix potential array out-of-bounds in
 encoder queue_setup
Content-Language: en-US
To: Wei Chen <harperchen1110@gmail.com>, tiffany.lin@mediatek.com
Cc: andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com,
 mchehab@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, stable@vger.kernel.org
References: <20230810082333.972165-1-harperchen1110@gmail.com>
From: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <20230810082333.972165-1-harperchen1110@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_021246_106336_F2A7AF64 
X-CRM114-Status: GOOD (  19.21  )
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

Hi Wei,

On 8/10/23 11:23, Wei Chen wrote:
> variable *nplanes is provided by user via system call argument. The
> possible value of q_data->fmt->num_planes is 1-3, while the value
> of *nplanes can be 1-8. The array access by index i can cause array
> out-of-bounds.
> 
> Fix this bug by checking *nplanes against the array size.
> 
> Fixes: 4e855a6efa54 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Encoder Driver")
> Signed-off-by: Wei Chen <harperchen1110@gmail.com>
> Cc: stable@vger.kernel.org
> ---
> Changes in v2:
> - Add Fixes tag and CC stable email address
I guess stable needs to be added by the maintainer, not by the submitter

> - Change the title to be more expressive

Subject message should include mediatek I believe, as `media: vcodec:` 
does not reference the mediatek vcodec.

> 
>   drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
> index 9ff439a50f53..9e8817863cb8 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
> @@ -821,6 +821,8 @@ static int vb2ops_venc_queue_setup(struct vb2_queue *vq,
>   		return -EINVAL;
>   
>   	if (*nplanes) {
> +		if (*nplanes != q_data->fmt->num_planes)
> +			return -EINVAL;

Have you run v4l2-compliance on the device to make sure nothing is broken ?

>   		for (i = 0; i < *nplanes; i++)
>   			if (sizes[i] < q_data->sizeimage[i])
>   				return -EINVAL;


Greetings,

