Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C883CE7B11
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Sep 2023 09:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g4aX9V7sXRthXpUwGuNyx1r28bFRK2TcM27YzWf7txk=; b=buW241S17VbusZ1A7tFKqFtGgJ
	qAQEwA9UoGHQ4I4I/XZfrAMyaJtFWYrVE7arx0IsbNj56VjCr+OCfw0GjZ71yzOWxOkYlJu+G2E9K
	CqjjUYboDsFqcqnZqdM7wbxYdIFn3QivzE3ewEsKOyQSzYbWUldZ0KCIGALeeUNxHShKQkFNMkwUc
	4FBTP/JXhEvTjrFGBbY1K6djQmrKCeFBBoiA7qHFPIS69pzjQAn5Ddss0u76rO/I99SBeREDNDl7t
	FrYXtlopgeYT3x3yIo+YhLGWZ5/KDnEZXI/MEtXEgY/AVUCM65rwXLGRZOClFTtHnbdqVZGyfZROo
	QiwCCruQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlnGF-002imE-09;
	Thu, 28 Sep 2023 09:24:43 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlnGB-002ikY-0v;
	Thu, 28 Sep 2023 09:24:40 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6193B6607336;
	Thu, 28 Sep 2023 10:24:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695893078;
	bh=90qF0JONfyTIpjPjha6pxFcSPf8q+bYBcasiV6AC/Lg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NvnPBOkADSUaW55IC8fDbA6G7I72J9az9eTx7GvhpdjNJDb1jvku8R8LRt4s6TbC8
	 GkeMuciCmReU1Kq5qm8S1b3WwXL886siidlEZ8cjVvF9Pj/h2np7bGkleM0I+3NNPN
	 uNGnpUIDz717uwbwMwbjJCckfdPReiG0XoqsKtBh4BwGj56soFBDAQMwjBHHlqAy/y
	 t8CJeM60tq/sUuM9b/g++gojCw9OUjvsES2Qnjs/Qo6A9yhGjUh825f68K7ROrk8Tq
	 /ahrpJp+wh+30R37uLVt3q0WTKQeRdpyQa0TCBHKc4SF4S9EOMLoXhP+4QzxF2wHpG
	 rDaSYmK2/0Kcw==
Message-ID: <bde3f76a-6cc8-e92c-0b35-d6edbe87c014@collabora.com>
Date: Thu, 28 Sep 2023 11:24:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v10 4/9] drm/mediatek: Add encoder_index interface for
 mtk_ddp_comp_funcs
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230927153833.23583-1-jason-jh.lin@mediatek.com>
 <20230927153833.23583-5-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230927153833.23583-5-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_022439_455605_73A6CE02 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
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

Il 27/09/23 17:38, Jason-JH.Lin ha scritto:
> To support dynamic connector selection function, each ddp_comp need to
> get their encoder_index to identify which connector should be selected.
> 
> Add encoder_index interface for mtk_ddp_comp_funcs to get the encoder
> identifier by drm_encoder_index().
> Then drm driver will call mtk_ddp_comp_encoder_index_set() to store the
> encoder_index to each ddp_comp in connector routes.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



