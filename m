Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839E2C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jun 2022 07:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IzuBmTU5lBUUf1flwcYEanGRhMfEjICrHZl5C4mHcXc=; b=VNFA+4AU7PKwV2TP8hOR/K9eE+
	T8lv+gKlxRup2JqN3x2xzZRD1qowHOsktOAbqUJq8Jeb84q6mQWXzB+m7boFlFP1AvHYWiK0O6gRH
	VIGpaoM9kJ54hvUmYBDhISko7Bc9pQ8CZBUKePbOj/gYoeIHzLkhVSPc0mlJ/fJ0vErV3pXgL1fpg
	Lq+DbLemxLMsHRd5AK+4awYHzoT4KvV+7NkSFKCP1HYmnC2DUU17UoIXv56pl9mvKAFuulNMTQjqN
	8es375Y2XD9gRqTciVaG/Abov+Sb44HlqCg0IPu1LlimSOAYfai5XNIPFk84KEx6Qo+Zfgaf95cvI
	fYCL7rkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3CIi-00Gnxr-SW; Mon, 20 Jun 2022 07:58:24 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3CIS-00Gnr9-L4; Mon, 20 Jun 2022 07:58:10 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DF5CB660166E;
	Mon, 20 Jun 2022 08:58:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655711884;
	bh=B+xTwEj2LWopnY2Mek8C1LH6BBhcx/zrcxMtLnoeiVA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Bx3CK9FAayRadGaBkxRj+jDh8Ivqjyz8uLq8JVnqfkvTTAcl7dsjQlbZ3H6jE5FoC
	 vqcJ7Rgji2FSDrJFY+TW96nMRslPkAGFK0FkBemRiCkNwa2XEz4iSqGW+GmxYKaAaL
	 oU6vnJi9MfLd4v1+cdzHl4XP14h5yhVrctSjyd+eRKIzJ08+38kW7WAhTrzzwdlQIj
	 KRxr0LSjZv4u6Y+qAo36FuMDq1XHtz2hdy+cYVS2U1aOLxxbIJYcbxst/+CMmikcrj
	 nLxkkoZPPPAI8JRcs+O52gs2Nork5+RJqR9rKhhq3G7vj9IhLi8+5BMI9XHjyYBVr4
	 mpHugrqh4gHHQ==
Message-ID: <8956bb3e-60d7-a882-3672-f2a2f0bf858d@collabora.com>
Date: Mon, 20 Jun 2022 09:58:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] media: mediatek: vcodec: Drop
 platform_get_resource(IORESOURCE_IRQ)
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: kernel@collabora.com, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Marc Zyngier <maz@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220617203906.2422868-1-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220617203906.2422868-1-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_005808_956627_F3478AD4 
X-CRM114-Status: GOOD (  14.45  )
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

Il 17/06/22 22:39, Nícolas F. R. A. Prado ha scritto:
> Commit a1a2b7125e10 ("of/platform: Drop static setup of IRQ resource
> from DT core") removed support for calling platform_get_resource(...,
> IORESOURCE_IRQ, ...) on DT-based drivers, but the probe() function of
> mtk-vcodec's encoder was still making use of it. This caused the encoder
> driver to fail probe.
> 
> Since the platform_get_resource() call was only being used to check for
> the presence of the interrupt (its returned resource wasn't even used)
> and platform_get_irq() was already being used to get the IRQ, simply
> drop the use of platform_get_resource(IORESOURCE_IRQ) and handle the
> failure of platform_get_irq(), to get the driver probing again.
> 
> Fixes: a1a2b7125e10 ("of/platform: Drop static setup of IRQ resource from DT core")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> ---
> Tested on mt8192-asurada-spherion.

Yep, that's totally necessary... Except the Fixes tag should be wrong here,
as you're not fixing that commit, but the mtk-vcodec driver in relation to
what's happening due to said commit.

I get that you're trying to tell everyone "this is an urgent fix", though,
and I agree that this *has to* get in v5.19 to avoid breaking this driver.

Finally, for the code:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

...but I think that you have to send a v2 that drops that Fixes tag.

Cheers,
Angelo

