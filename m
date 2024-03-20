Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B497C54E58
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Mar 2024 09:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QfeqtRUaTUQDUl/n7puoMKkBrvUNk2tUZ4PXR1t8rLk=; b=2b86GbSoLqp2MfkvxMUa3QDFd5
	CLlfOOYm3PvOCusnr6yQkfFgBZlEM5426wr6L2NpH77WoOus1AjW7lgWbCbwEFaZzwaq3htS40u33
	1hSxGdgH6pC1J6I7E956a2yxTHIyZf06P0XPJmE2mhezG/gyatMqIZv27QazluonXN5k006Z7T9DK
	UAtA4OjoFiIUvuQlGRZW9mzF6c3lsf4xdsVfBtUeHGrajtukHV+OzmJEwP9oCeCDgZGp4GshKXBjP
	iP0ERQ9nV1dM89cnUC7fNXAUJxq4ASNPjvk46kuXZtvqxB5WTM5oVBMfg3ullHsGvBvVrRgdO4Stx
	/yas8Vzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rms19-0000000GQNS-31Ci;
	Wed, 20 Mar 2024 09:13:51 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rms13-0000000GQLo-2f6B;
	Wed, 20 Mar 2024 09:13:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710926024;
	bh=f5TBxsXEtnxxjUawzCCMKUWjeP88hHOAUk3qAGQHobE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rPLC2rbmMfSDL7SfVIjwIYPwavzcX5JR0Ow7R6VJm+E3lHQtX+X1awhmPtEvl/gjQ
	 tI5V9EyYtORf10G8dNND9QJQMNlFh3xkLQoEmJzzBLbXNNIawEU4BV3aYDtc/mp8SN
	 kcroNKFQ9/PdG2osZ8/MckyJKyPWnJsbfVqQdB34WN+wE3Kp1fPSpKOIB47wqraDJE
	 cBwBKbwoL/frmwfWy/+2lBZG//ldG2EN4Wv1waiId/wUYvRYReS+Rn/fEmO1swaoVI
	 z6o+uIxIfzI7w9dPDpNE1nmo/SzvxqLIx23Js0o/fBk1Z/l7U53kyKbL2yneYr17t+
	 XbT7BCp6+zETw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2D02137813C4;
	Wed, 20 Mar 2024 09:13:43 +0000 (UTC)
Message-ID: <c09b063f-a11a-4bc0-8b12-3d66f692c48c@collabora.com>
Date: Wed, 20 Mar 2024 10:13:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: mediatek: vcodec: Handle invalid decoder vsi
Content-Language: en-US
To: Irui Wang <irui.wang@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, nicolas.dufresne@collabora.com,
 sebastian.fricke@collabora.com
Cc: Longfei Wang <longfei.wang@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240320061336.2615-1-irui.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240320061336.2615-1-irui.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_021347_786486_39DACA74 
X-CRM114-Status: GOOD (  13.63  )
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

Il 20/03/24 07:13, Irui Wang ha scritto:
> Handle invalid decoder vsi in vpu_dec_init to ensure the decoder vsi is
> valid for future use.
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>

This commit needs a Fixes tag, can you please add the relevant one and resend?

Thanks,
Angelo

> ---
>   .../media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c    | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> index 82e57ae983d5..17770993fe5a 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> @@ -231,6 +231,12 @@ int vpu_dec_init(struct vdec_vpu_inst *vpu)
>   	mtk_vdec_debug(vpu->ctx, "vdec_inst=%p", vpu);
>   
>   	err = vcodec_vpu_send_msg(vpu, (void *)&msg, sizeof(msg));
> +
> +	if (IS_ERR_OR_NULL(vpu->vsi)) {
> +		mtk_vdec_err(vpu->ctx, "invalid vdec vsi, status=%d", err);
> +		return -EINVAL;
> +	}
> +
>   	mtk_vdec_debug(vpu->ctx, "- ret=%d", err);
>   	return err;
>   }


