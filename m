Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C4AC636CC
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 09:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZJuMxXpHixdO8zfvUT6NGXePa2iqqK64wcVDRY2JEJk=; b=KelWiOQhoM6FnYP03VeGjcVWrR
	7CbYRTBCk7hgvHji0bLQDQaSOmlqQlv/bd8h9aaCxKCWWLfA5TOcGjUS/0FbJSGUOH6FCyoPRWX8L
	bHBFozLtC5b1Du6ueGT304NlDW6/RBkYpJNc6AkQjeJaN5Acux9PeulOO6+o4JqsZLZ9IasateTXf
	QbwQT4ahcSUggI6TsPh1NIAi+uUTu4zlAlpfIX24SCw8XEsBxYJvbEIkViFS8F8z57hDFhuoUZgD5
	bBMM/cdmOySJA2L1+27WKL4gWCQNxWO1U1y49oJDlkx6t5bvO1QX+8aGWastwJhoytkPMJwKOM235
	wsqYT6TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPJqd-00BM5X-9b; Tue, 07 Feb 2023 09:01:07 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPJqR-00BM1S-3M; Tue, 07 Feb 2023 09:00:56 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 742F06602069;
	Tue,  7 Feb 2023 09:00:52 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675760453;
	bh=WvgWU1RplRANWwDHuHVFhaXm5JMdBnOhCCSkJUkA7/0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Y9wFeMsRf0Uijdt13gEKrRdIsogpwyOr7GxRd1TMTzUnNFGIvEQ2DadeCBVJOzviR
	 H3fSD/qK8Bw8nSqrV8k3cVV6q/y5JtKpjAtBq9JoIFpkHzmywsKbU8WZ5g27Gl/7b6
	 xomKQC25TrsN5Fh8XXj+Z4b8M24+fZIsV6UzxUeoSmhod4QRArXXa2C4DpujqLYHq8
	 pV+2Zrtjyxte4m1ZD99wxOCHqQv511ENv93evVuo5UmeZgJr4jSPgaE2+di6ONH5PY
	 H95RO1gcKBLOMyViSkVCqSlQL4tZXTVov5vNcRWHN4dZRmDZULNvFVy4bdl8saafB7
	 ZalAlPRQoJrmw==
Message-ID: <35a6bd38-58ed-d960-6f64-eb7f87986256@collabora.com>
Date: Tue, 7 Feb 2023 10:00:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 07/45] clk: mediatek: mt2712: Add error handling to
 clk_mt2712_apmixed_probe()
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
 johnson.wang@mediatek.com, miles.chen@mediatek.com,
 chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com,
 msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com,
 zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com,
 yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com,
 sean.wang@mediatek.com, chen.zhong@mediatek.com,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com>
 <20230206152928.918562-8-angelogioacchino.delregno@collabora.com>
 <CAGXv+5HVNSFyBncAepAhghHsjRdY=XyzsRY0Htm1KcRE7U9dfg@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5HVNSFyBncAepAhghHsjRdY=XyzsRY0Htm1KcRE7U9dfg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_010055_303791_C412386F 
X-CRM114-Status: GOOD (  10.99  )
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

Il 07/02/23 07:16, Chen-Yu Tsai ha scritto:
> On Mon, Feb 6, 2023 at 11:29 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> This function was completely missing error handling: add it.
>>
> 
> Fixes tag?

Noted for v2, thanks!

> 
> Code looks OK. So once the tag is added,
> 
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> 
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/clk/mediatek/clk-mt2712.c | 18 ++++++++++++++----
>>   1 file changed, 14 insertions(+), 4 deletions(-)
>>


