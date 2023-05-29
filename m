Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49EF0C77B7E
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 08:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nCu7CzzkLxhCYNT4PXl/4UQGZF6Ad67LZdP+y4j7/Co=; b=sDJifP85F3jjScSj2EpFgA3nZC
	ztkN3vqjfG+gmTw29GdvVhwN6YWBR4U/3CAb8AKkXOqhqnVIPoLlChRLm/SlsLSoLBq5zAR33viMU
	y6CQc01r9dVjsFicRl56QWM0FQhJ2VuQKj75XgYeI0rdCDq6XGCqoHCJGR7TmZxJjSz5k+QDSBSEn
	sD9/y1ZOeUSr/AgHFn6XwDUplEr9qs4NMeR+6o8q+zdsGgHvzuGRGvZRhXTEIA4DSnhX2XJ7BLVWT
	d5puh6tTkaxzfgQUPGcyFzyz3wevYPCvpopvTp+XTmE+qjN3CIjBiua4GuI3glqOfUqBzCveL+0v0
	K+WPI9kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3YHf-009icW-2x;
	Mon, 29 May 2023 08:31:19 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3YHb-009ib4-37;
	Mon, 29 May 2023 08:31:17 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 01ABC6605961;
	Mon, 29 May 2023 09:31:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685349072;
	bh=SgaXQ43zqDd+lRFXqCMttSv2BWRnEkrhM1NPjt8EZ+0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K1XiEgSw6AMo6WNIulUT0UFwL37XiC77QE1vQeZaukNLzYgcvyD5h8gGi9xSNlaZo
	 1bdajVGwTs45qLcL11net7MloIXbs82Q759SyfRGigi2u28MzanEfKoc2EQuCThng7
	 kQsvH1ZxCd2DCGBqFwJ8DXXeYRUc9q2y7MMOAAFdxAWxObIicJseZRINCXTFtCM+Z/
	 YJ9FLdc5+w09UA7kh4v7Fd1W4qjIdfM56oAkNOA+DuGwO51f6HRlvA4uoq3w+fu84g
	 XB9Jk62h8iCtVL+Xjt3bxlPS5a7m9G4sokuNYzYTCvOF2k8Q7UWi/80XnQ9dYTo+/r
	 f9HzdiYrv1o2w==
Message-ID: <2bae7dea-afc5-96b5-c6d1-f4724bae155c@collabora.com>
Date: Mon, 29 May 2023 10:31:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v6] media: mtk-vpu: Ensure alignment of 8 for DTCM buffer
Content-Language: en-US
To: Pin-yen Lin <treapking@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, linux-media@vger.kernel.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>
References: <20230526063149.1801196-1-treapking@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230526063149.1801196-1-treapking@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_013116_157458_F04F4345 
X-CRM114-Status: GOOD (  15.36  )
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

Il 26/05/23 08:31, Pin-yen Lin ha scritto:
> From: Alexandre Courbot <acourbot@chromium.org>
> 
> When running memcpy_toio:
> memcpy_toio(send_obj->share_buf, buf, len);
> it was found that errors appear if len is not a multiple of 8:
> 
> [58.350841] mtk-mdp 14001000.rdma: processing failed: -22
> 
> This is because in ARM64, memcpy_toio does byte-size access
> when the length is not a multiple of 8 while access to the
> vpu iomem must be 4 aligned.
> 
> This patch ensures the copy of a multiple of 8 size by calling
> round_up(len, 8) when copying.
> 
> Fixes: e6599adfad30 ("media: mtk-vpu: avoid unaligned access to DTCM buffer.")
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> ---
> This is a re-send of v5 because it was marked obsolete, but this patch
> is required for MT8173 platforms.
> 

Hello,
I have solved this issue in a different way and the commit was already picked.

Please check:
ab14c99c035d ("media: platform: mtk-mdp: Fix mdp_ipi_comm structure alignment")

Regards,
Angelo


