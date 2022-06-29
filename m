Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B664CC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 08:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eS3NS7goaI0+dEbUBPDhEfWPbhnflf2USDi0RLbu7zA=; b=Xwm2wCtq6pXD6R9MH4Z2eQ4Z47
	S2JRFYHKMgWM++A1NIGCVuqFGp/F3WmMujzWR2MLo5Cz9/sYrkhy/IRpBoZMOEV1Ht0ifH93dw5RE
	e9fUIZmM2RJtrf62UzYW+E9YtTx3YJq6fmo3qdNVuxg20SZuva82mpPUKPgPm3E84JZZIarb6WLS1
	WZYzbfxl5znBGw/BnVGztQ4nwsv1ud/IRgtEka7YdYH0nKi7L8fv5Doo7+jWxGjYOX+g7Yv2v+TLL
	I++JJx6IHOdvnAR0wH2lzvrPjs6vW6bcOExqQl7kkpi3/zFFpWgMrltv/1R7en+5UQiBr3b7/SFKj
	XaJUw+mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Sjq-00AIgX-NA; Wed, 29 Jun 2022 08:07:54 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Sjf-00AIbt-4m; Wed, 29 Jun 2022 08:07:44 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 79B8D66015AE;
	Wed, 29 Jun 2022 09:07:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656490055;
	bh=2x7JJI7Gpw9v/avN+IvIawiJAZWgc780v4UFmC7WN1M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KIpXSyrfyDOlg0nVmlbqYjC3ymVb5Sap7cwjq6Udb6iHNuvrq9iIMOa/2ca4p4V/5
	 P/kJAMUJa/ciPMEkWhzKE30x2Zz9KoSJXwZFAa9Aq6AsRxgQZQpsmgNT2zKWSAObba
	 vJMVJVOh+/82uJjnZ1HBPPjeNIcBIR7X5qXvMCq1GXYCvOOdFgcAYuPRFnxN7oVa0f
	 yVQiDkg+yDZ3JPMRaB3cnTWx47bg8fBBB2zx9aMQijBlEXSK9iiEGRx/Emi09q2BGT
	 BUXkBXOxHvhjq0d4HQoopaqO0/2SXdiKbvCSZ4DcIvUnXlkJLboMNEEKkg4HQYXGWF
	 mvqB6VSuVbclg==
Message-ID: <4329eb0e-eb4b-f0d2-358f-e1d15a9c49de@collabora.com>
Date: Wed, 29 Jun 2022 10:07:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] usb: gadget: f_uac1: add interface association
 descriptor
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pavel Hofman <pavel.hofman@ivitera.com>, Julian Scheel <julian@jusst.de>,
 Ruslan Bilovol <ruslan.bilovol@gmail.com>, Yunhao Tian
 <t123yh.xyz@gmail.com>, xin lin <xin.lin@mediatek.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220629021304.21725-1-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220629021304.21725-1-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_010743_376669_D33C1C27 
X-CRM114-Status: GOOD (  10.50  )
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

Il 29/06/22 04:13, Chunfeng Yun ha scritto:
> From: xin lin <xin.lin@mediatek.com>
> 
> When we want to use a composite device that supports UVC, UAC1 and
> ADB at the same time, encounter that UAC1 can't work when connected
> to windows 10 system.
> from the online documents of microsoft, "overview of enumeration of
> interface collections on usb composite devices", it recommends that
> vendors use IADs (interface association descriptor) to define
> interface collections.
> After addding IAD, we can fix the issue.
> 
> Signed-off-by: xin lin <xin.lin@mediatek.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


