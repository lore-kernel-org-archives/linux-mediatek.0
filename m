Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D32FC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 09:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ehQ/Lzfp8IZLfQftdHi/v/fZtolI2jl+a8nDV8sEG2Y=; b=ISugu+Gpb1+xvdGCpTA7WGsCXa
	hAqiQgOleowzearXge3EgTjtwhT3HHZeEkjXHPRrbQjI0CO4bTqqr9MNnzVnl18jEJlBpqyBHCMQN
	4zs5SWbiwTomFeLGbkn9tsKJ4UplYVSC/nANmGUUdPFoc3bVlXxweQIHvtozKa3U69THvdAnfcz2x
	FIHrlFXtNQCWSs+quXi3FbZU3WIcIFElXOxhNb1z45JQtatArWUggyhkX4T5IyIBNiGE+wTxsST2z
	D+QDnftz7QJ0NPK73wjq+D3wV/naStYyi4XVaveKSzV8em050qdoRFYNgmLnCH1ii326PQcs/o3kC
	aVS0IQRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox2ki-00Bddf-8L; Mon, 21 Nov 2022 09:06:08 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox2kW-00BdHv-7I; Mon, 21 Nov 2022 09:05:57 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1B61C660159C;
	Mon, 21 Nov 2022 09:05:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669021554;
	bh=oYdPeMNEX2Rrmz5Dlvw9fvA18GDij/SA6IU1bFcqUtE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dYYG43t7UPlFu0jI1EavN7PAIlw1d3ek7C9ujtFX7sj15AkrTpI4x2+EoYu914LYz
	 W8lG6SfTDkKRceeYARgJQbreqeVZQIKtf0++BF6wQcI1rTKoCCpQiQfiXTNEya1Utl
	 pw9tu6/uqHIrAFftb/BJZk204SPPzL7mEbJxHNtRGoumCs+iVWNQ3jH24jqjuSe7HK
	 WdfekXjBDsLhXTvmN3fm1NN2cPay3318W8cdOeu9lbj/knezkhqI0WQHN0KaK2aTiE
	 sjHY19OCL4aXP6RSsEJsuYmm0uuYm04iQ5SIVQQ5taje83jXXa1k7Ipk4fpM6+FyDr
	 AZZjyQOYqjHnA==
Message-ID: <2545400a-e821-ce05-5c59-67b9838f4644@collabora.com>
Date: Mon, 21 Nov 2022 10:05:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] usb: host: xhci-mtk: omit shared hcd if either root hub
 has no ports
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Eddie Hung <eddie.hung@mediatek.com>
References: <20221118110116.20165-1-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221118110116.20165-1-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_010556_425344_60387D55 
X-CRM114-Status: UNSURE (   8.53  )
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

Il 18/11/22 12:01, Chunfeng Yun ha scritto:
> There is error log when add a usb3 root hub without ports:
> "hub 4-0:1.0: config failed, hub doesn't have any ports! (err -19)"
> 
> so omit the shared hcd if either of the root hubs has no ports, but
> usually there is no usb3 port.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



