Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 410C5C05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Jan 2023 13:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TsmSPcxO7LKQsADIib3EpniOR608r5PsJOiaLyKVUao=; b=mS85CUJQX1DymdWPlStFonmkF0
	M6uj7FDHDDCv4EtqHWSqhLbkBJD90sv2NMTkxalCRvlWzixjeQmIUtqZgfpLVJbAw2g57K11MaGv9
	6HY78QHmc5EEJerfw4Bv6LzY4Qs5h5DdfYqysb+0TG0JcHM3xlw2YPHmCzqhaKkVzt2E2MaWi6Jig
	wiLnpQcUaHNsi8C1lQBJS0uOCEdL5iGKitWCKslmFxBbHSIl77M9txdKhLSVPbcYAh7sIjiSoTJUk
	RF6HY44vQUDV3OvDgfSXjBLMIrtaIAutlN5NzmS/wjHGeAxiCyvjXDF3fuV0+W3jODqyHkiIV1acE
	7j3fl1Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIr6W-00AO6w-0r; Fri, 20 Jan 2023 13:06:48 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIr6J-00AO3U-66; Fri, 20 Jan 2023 13:06:39 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CADAD660230B;
	Fri, 20 Jan 2023 13:06:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674219991;
	bh=Q5x2AtmYaA0fgZ4jp//x0TyHgSicTqhcPO5/1kpTO4w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CmsJPrUv5BhTSOordLZ4nQ1PesnxSdh3BQ4Tu+d2hpQH1h+WV91YkA6dN6CN6eAgf
	 0rvZ9f1X+ipOJxujYxzItFTDlYCNpXgg0T6hZmeJvicxv6PpGtNcd9C9h6usKmc5Gq
	 5CBJfki6cEB7oME4uujjbuFfyB3hPI0RXkP99B+muAlS89oXR44/yKpPfgBBmiViqp
	 lwkYeV451Gxe9rMSgKxUz607+/Cp03e/CXrPVPH2/UwfuVU0Iwu6/6XsEuKjUDoFx/
	 0gb+Ly6vVbLvv1/Irxx5ZRSY7/MpGLi0+H28PxHT9HAVOgZJzs+5Tpn84yqvb4acVQ
	 PvB1JjTj93S5g==
Message-ID: <4d277d1e-f06a-07ad-f2c3-f910880a40d7@collabora.com>
Date: Fri, 20 Jan 2023 14:06:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] usb: mtu3: fix the failure of qmu stop
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Eddie Hung <eddie.hung@mediatek.com>,
 Min Guo <min.guo@mediatek.com>
References: <20230119033322.21426-1-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230119033322.21426-1-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_050635_445088_B2B13A17 
X-CRM114-Status: GOOD (  10.02  )
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

Il 19/01/23 04:33, Chunfeng Yun ha scritto:
> This happens when do stress test of uvc stream on/off which will
> enable/disable endpoints. uvc has four tx requests, and may disable
> endpoint between queue tx requests as following:
>      enable ep --> start qmu
>      queue tx request0
>      queue tx request1
>      queue tx request2 --> resume qmu
>      disable ep --> stop qmu may fail [1]
>      queue tx request3 --> will resume qmu, may cause qmu can't work
>                            when enable ep next time [2]
> 
> [1]: when the tx fifo has some data to transmit, and
>      try to stop qmu (stop ep) meanwhile resume qmu (queue tx request),
>      it may cause stop qmu timeout, then can be fixed by flushing fifo
>      when stop qmu.
> [2]: it resumes qmu again, shall stop qmu again.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Reported-by: Min Guo <min.guo@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



