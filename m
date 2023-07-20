Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE3EEB64DA
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 07:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vNNrU4BsJciwt5e49zB74nJsHYN3uqX95qmBM+H2GsE=; b=WiulDxLkkp1pr7vuqQap8l6KN9
	DtNcT/l3Sj1azzbmnRLsjY8VPMPfvLP5lQA7bdH56drK8nQ2TxP4TyXxeVEzuBinJRZ4ebSdM3i8w
	97c9fCQX6p/Ypsz24vIk0L1gASjYfJsIHG87j/M9VSfQhlHYSMxyaJzYqxMyMIpn207yGfesazFue
	aw39k5C75F4vx56a2iaFKnib+ROZV3nLpYflLFhdwZV/mkeynZvRjxn8OmzuEKBcxy/ax6Fpi5E+g
	/9yOd47VRBHdE0uSn0rb76bY2v8bzXNzJRIUQzhCootrmOoZABFDnxNY6833WlvXvEav5iU41M/0N
	MyRhIGcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMOLa-00AAAL-05;
	Thu, 20 Jul 2023 07:45:14 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMOLW-00AA8Y-2j;
	Thu, 20 Jul 2023 07:45:12 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DD3F2660707E;
	Thu, 20 Jul 2023 08:45:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689839107;
	bh=rgSn9DWoFWUAm/Y0pTg4nWPsIDpMJSJrwWH1cSs9tnk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gcAqBmgd+oAnAri/JPEFpV2Yyrt9NdM06QT3VWpsjqfzIBmhFoeUSpDVOdLeGbLNy
	 QGBh/cah2lyrLpxEP2bKq/WpLjFeMAyUt+Hki6f2m9MtX45P+YHdoG3G+5dG0OSnnw
	 VV/eseh1JZ2Ci5TBLMWHiSLuBKy049eXLCjzDM/VZrwtgymPPI+AMpXJ9xnufX7nVz
	 cypd0/SDfA9pSpuyzpUqhlAcuN4u6X+kCwDMnebdG60ktZ5DHkUD5mQyKnp0Oi3rx/
	 azPOPbxtlSsBoyRr+bzt8OroYDabKfpWhTDpBkRticKl1RjqRloXeDtbtAUAYKroaY
	 GrzmdnQxLuJ5A==
Message-ID: <03449762-33b9-3e86-c65f-4bb9e0e917c6@collabora.com>
Date: Thu, 20 Jul 2023 09:45:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RESEND PATCH v2] media: mtk-jpeg: Fix use after free bug due to
 uncanceled work
Content-Language: en-US
To: Zheng Wang <zyytlz.wz@163.com>, Kyrie.Wu@mediatek.com
Cc: bin.liu@mediatek.com, mchehab@kernel.org, matthias.bgg@gmail.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Irui.Wang@mediatek.com, security@kernel.org, hackerzheng666@gmail.com,
 1395428693sheep@gmail.com, alex000young@gmail.com
References: <20230707092414.866760-1-zyytlz.wz@163.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230707092414.866760-1-zyytlz.wz@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_004511_009518_1479A3EE 
X-CRM114-Status: GOOD (  11.43  )
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

Il 07/07/23 11:24, Zheng Wang ha scritto:
> In mtk_jpeg_probe, &jpeg->job_timeout_work is bound with
> mtk_jpeg_job_timeout_work. Then mtk_jpeg_dec_device_run
> and mtk_jpeg_enc_device_run may be called to start the
> work.
> If we remove the module which will call mtk_jpeg_remove
> to make cleanup, there may be a unfinished work. The
> possible sequence is as follows, which will cause a
> typical UAF bug.
> 
> Fix it by canceling the work before cleanup in the mtk_jpeg_remove
> 
> CPU0                  CPU1
> 
>                      |mtk_jpeg_job_timeout_work
> mtk_jpeg_remove     |
>    v4l2_m2m_release  |
>      kfree(m2m_dev); |
>                      |
>                      | v4l2_m2m_get_curr_priv
>                      |   m2m_dev->curr_ctx //use
> Fixes: b2f0d2724ba4 ("[media] vcodec: mediatek: Add Mediatek JPEG Decoder Driver")
> Signed-off-by: Zheng Wang <zyytlz.wz@163.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



