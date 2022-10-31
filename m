Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D843ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 13:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iqWUj6VuhOWZUG7Gwms5nB+e/pKNGjwPJ1N5cZG7kGk=; b=tpzF5MMWSKhOTKotC0ouCsX2D1
	FsD6vEGrV2MAAoMXqyyUfMeeCHYGdxh8hiPJSfYhC0F1xlYnV7cxe9CBGEODlFJIZ3OAoxr6hqY9I
	RDZyublmY4ofs4B4IykHjNwvxSSqt+gjsbswpOTUX8AWnc1QqZxkSWzd91Nh5EqxdE47j6zfDw53z
	LXE6Ap5V0G7U0ohhfuQXpobAJ9kMIK9cg/8cKZMRfhW0SG5lqNW/S1y7j+ybasKWT40U9EAFl+YyM
	+y22a6YprorARce6lw6HQ91aLl7WLO4+1M2zMRT3G5bmm+pWSQyJqaypJn43BL6BX3GKAl5Sm43IZ
	9GcSWozw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opVAc-00C8TR-RY; Mon, 31 Oct 2022 13:49:42 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opVAR-00C8Pn-9O; Mon, 31 Oct 2022 13:49:32 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AC9BB6602253;
	Mon, 31 Oct 2022 13:49:28 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667224169;
	bh=1CjDirYTveyInAKG0RQWqvIdW7a/AeUnGrEqY2Utiws=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nA/Q+Sp2imNv4fxfZ/8CkIieGZNWmDpQT7s7l69lK6HIcn9v18xnHcI8h3ctbuHXv
	 RqZC9bQJGr8LEnitwh1/CoQQL1jrxdPIWUnqaTMwG6UAk5FH2MzWPFu2Z2SmefTKvV
	 Wc578sIxIrI9+D0oUJGo8fM+9CDWgrC8+gx7jy2Ctva1slyeikphBmMjUgrGTTHwGG
	 HGLX/KnM7b2QQn/Y4yRiSw7M2hUUUB6/19hZKzn5Q+18knP0dzdr6yeNKc+ZGfovE+
	 7gGSbGZCK+PcRY9DjYlFCnhvtUkF5AvStKLlp3Vq5u1mn+DaSGN5VXPKUEBuJpIFK7
	 29qzcCexoVc3w==
Message-ID: <e0d37670-cb88-3a20-5230-9f14411edec1@collabora.com>
Date: Mon, 31 Oct 2022 14:49:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 1/2] dt-bingings: gce: add gce header file for mt8188
Content-Language: en-US
To: "Elvis.Wang" <Elvis.Wang@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Houlong Wei <houlong.wei@mediatek.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Bo-Chen Chen <rex-bc.chen@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20221029105017.20734-1-Elvis.Wang@mediatek.com>
 <20221029105017.20734-2-Elvis.Wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221029105017.20734-2-Elvis.Wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_064931_564919_3662CA49 
X-CRM114-Status: GOOD (  11.00  )
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

Il 29/10/22 12:50, Elvis.Wang ha scritto:
> From: Elvis Wang <Elvis.Wang@mediatek.com>
> 
> add gce header file to define the gce thread priority, gce subsys id,
>   event and constant for mt8188.
> v2 - use vendor in filename, use Dual license.
> 
> Signed-off-by: Elvis Wang <Elvis.Wang@mediatek.com>
> Reviewed-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Thanks for the reviews, I have fixed them.

I can't see where/when Krzysztof gave you his R-b tag. Drop it.

Also, please fix the typo in the commit title. s/bingings/bindings/g.

Regards,
Angelo


