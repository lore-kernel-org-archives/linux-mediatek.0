Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C166FC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 10:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=714DMZQoq8sQo2kPzk8ga0qS9FEjfjxSCq1hFQnvWZ0=; b=08Vnu6Mdp8ats6
	IvvjjuWr4FCm+ovhr59ZGuyhD8FL8lBjMCnvkeMj3Gdo1FYqv8CasPbUICzMvdP4PvwXsw3Ms+8Sz
	Nyg0j884SoApKvJFdcmCDRxT27O5emiTciDg1Ebip/eRfnfOodTc//pBhjMs97kZMp3kV1W3ru8LB
	VjBFGvnRKDfnItB1aD3yCC96q9UFSDgHSivmqpJHVHmvg9DeUj85PCiz4hh7fLwLVwuDHirLXab/L
	yOqnpjoRPRGETJvcSLCia5U0CErcMT8dOURWMLjhLv7i8H9L+acmo5Jw/+XStDw+9XgYiMirNOZqV
	GiYh2Z3K9Kjrsre/tKUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nclR8-00GEfq-HG; Fri, 08 Apr 2022 10:01:50 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nclQl-00GETf-FC; Fri, 08 Apr 2022 10:01:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 865581F46D04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649412083;
 bh=y2Z8H4r5yL5fYxfps5SscpYEsfiWgrzqC4K+pnf/lyA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=L5h59CycUo+jq7lWmAiMkXvl3wNFJp5cEoROTefBRkPTCrtlSnVmpK76P+n6W1vl6
 Z+1UHNmCeIVigvB9n7Hc5zbXaWneCBR24v06HTYBAbbvM5n7uHVX8BdBuYRymsM/oA
 YS67LvnFEC0ZPFIr7ApecusZPzqbAAwFwMkShV9mCltWDzg1QGRY+E+HXmmEzkhEpQ
 oLXiEAS2dwCkXaC1HEylmFCpBO/VUBWD+9FLjSOMyj+5ohJ8CPVLLoJGAdJOTm0Tgh
 umwwshvQRybzkyfQwxDtpiQjruxDsxDCeaPhDOIkM5KvnIWEklWaSKJ1w+IuoTSUJt
 LV+8F0VyUmadQ==
Message-ID: <4f9fbf6c-e4b0-c3d8-d340-0e5e018b3c42@collabora.com>
Date: Fri, 8 Apr 2022 12:01:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [v10 1/4] ASoC: dt-bindings: mt8192-mt6359: add new compatible
 and new properties
Content-Language: en-US
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org,
 robh+dt@kernel.org, nfraprado@collabora.com, tzungbi@google.com
Cc: aaronyu@google.com, matthias.bgg@gmail.com, trevor.wu@mediatek.com,
 linmq006@gmail.com, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rob Herring <robh@kernel.org>
References: <20220408060552.26607-1-jiaxin.yu@mediatek.com>
 <20220408060552.26607-2-jiaxin.yu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220408060552.26607-2-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_030127_763926_568EE265 
X-CRM114-Status: UNSURE (   6.35  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SWwgMDgvMDQvMjIgMDg6MDUsIEppYXhpbiBZdSBoYSBzY3JpdHRvOgo+IDEuIEFkZHMgbmV3IGNv
bXBhdGlibGUgc3RyaW5nICJtdDgxOTJfbXQ2MzU5X3J0MTAxNXBfcnQ1NjgycyIgZm9yIG1hY2hp
bmVzCj4gd2l0aCBydDEwMTVwIGFuZCBydDU2ODJzLgo+IDIuIEFkZHMgbmV3IHByb3BlcnR5ICJo
ZWFkc2V0LWNvZGVjIiBmb3IgZ2V0dGluZyBoZWFkc2V0IGNvZGVjLgo+IDMuIEFkZHMgbmV3IHBy
b3BlcnR5ICJzcGVha2VyLWNvZGVjcyIgZm9yIGdldHRpbmcgc3BlYWtlciBjb2RlY3MuCj4gCj4g
U2lnbmVkLW9mZi1ieTogSmlheGluIFl1IDxqaWF4aW4ueXVAbWVkaWF0ZWsuY29tPgo+IFJldmll
d2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+IFJldmlld2VkLWJ5OiBOw61j
b2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+Cj4gVGVzdGVkLWJ5
OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+CgpSZXZp
ZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVs
cmVnbm9AY29sbGFib3JhLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbWVkaWF0ZWsK
