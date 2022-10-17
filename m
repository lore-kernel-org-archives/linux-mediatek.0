Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9E5C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Oct 2022 09:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y4wZN9Z/h1cjKtNazLm3kZpqIvQepIjT1KHoB8SNd7k=; b=x+ZnIta7SfQN2jwaMkKnM+61ZA
	yys9v/CnHkr1HRrnGbQQvFrQRnqThfKOsUodgJp9BLSc03FWfTzQkqtyu0ZK/QRQKyy9YuObD2HWt
	qiMDgHBMQbtU2JsGzmX2pjpGH/nJOIUhtsu2vDE/zEiCHTwGSbFEXCiQxt1WKh39XhysDhTVycPED
	H30uK0BSCsWKyde0SEJmXrotPSBFOzGw5PBxUk/tgE6mmf0v4afqd30uH2xsN3YFkuyLGywBU4kfF
	Wqc8ft4yPBNWprEIRSyCfcHJeIY4+ClJwYGsvN86oFakFivOA2zT7GRAPgb5059EdhGPU7UPOnEcC
	RuvfHpRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okMq7-00A2ZU-8h; Mon, 17 Oct 2022 09:55:19 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okMq4-00A2HJ-Pf
	for linux-mediatek@lists.infradead.org; Mon, 17 Oct 2022 09:55:18 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F3C73660232A;
	Mon, 17 Oct 2022 10:55:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666000512;
	bh=5276KptNcMaTO+XivxGWRNCBQZByr5Wpl2SJT6iIkIA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gs1FgmAodKfMPby8Y47pjXjruXfOWtnxBebuhH5bFn/I+EfugwfsgEXZms38wicrc
	 FVUQ/moHaCH+XYw2Rg15hBfKL40iPa2gJuqmP0/WA67XKbdkw++Q6spxMHkeLCNEE2
	 zEVFQAYV6Rn/fmSU7IoS++Ub6UCg/lrzmthHKHgvhxxY5aVsZQzGYWXlQNb/QC/wfY
	 bminZ03ogSfCcMN0CYA9nZk0KIZ3hP8gu/xLN3eCEr3ENAaaOLt6bNZrpKaYX69Iju
	 UsKZcoO+GLaW76MoIL3Ct8ZdEjl4818ImmCZjrFfPooUKftMC7EF4tyyGOdCRGEGPD
	 LLKhdjUSnUvHg==
Message-ID: <0160f9cf-c408-9bf1-65e7-c7a833993bed@collabora.com>
Date: Mon, 17 Oct 2022 11:55:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH net 2/3] net: ethernet: mtk_eth_wed: add missing
 put_device() in mtk_wed_add_hw()
To: Yang Yingliang <yangyingliang@huawei.com>,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Cc: nbd@nbd.name, davem@davemloft.net
References: <20221017035156.2497448-1-yangyingliang@huawei.com>
 <20221017035156.2497448-3-yangyingliang@huawei.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221017035156.2497448-3-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_025516_990526_56FCC9DD 
X-CRM114-Status: UNSURE (   6.11  )
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

Il 17/10/22 05:51, Yang Yingliang ha scritto:
> After calling get_device() in mtk_wed_add_hw(), in error path, put_device()
> needs be called.
> 
> Fixes: 804775dfc288 ("net: ethernet: mtk_eth_soc: add support for Wireless Ethernet Dispatch (WED)")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



