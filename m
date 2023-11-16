Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B01E3C5AD4C
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 08:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xtrVreS+IOgfkT9VTHL6McoZ7mNCoPERLOmhA+H0be0=; b=C/7qTQp9Y9SiFY8ylg94C+I6Xn
	PumHHao12R5H+iaYUY/qsfk1jtMqDxEYzpaRGHkQli/CpSaCQXjGr95ynQbH3L+qKGQbdswzVoGwp
	S2QX3dyU1nOMAWvEe6hG9X9lFKBqzg7icGLh96FIemSI6X4pk69Tg4eb2x9E21bMSAyocUygZ6vI7
	Jed7Gb4Oywy0qqldseJfdt5G9Dyed2xINa/8LD0ZobbdqgpyduP6QEHQdoCDaI9pFy/n2rkjcPWhb
	jzmb5n2TDQrlL+XX47hW7PymOmgOlSIb96yFjLITbcLcNLoPPB9FurOeUeHqS6LpSkWHhtVLHdXdw
	9Fhr3HGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Y5v-002uFc-1v;
	Thu, 16 Nov 2023 08:51:27 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Y5r-002uDo-0r;
	Thu, 16 Nov 2023 08:51:24 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 136366607341;
	Thu, 16 Nov 2023 08:51:20 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700124680;
	bh=mF6TawZlfHBSvwjAG3Ig1Ejgx6UGLHzZWDq+f9s6OLc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q1JrFp9m9TBfAexVKvLaL/35tQ02PFB83QlH3OiRqIlRSV9SSYiyEy3AVCIVvG16H
	 8Uvf6P0JwP5OeGGtBdPU3UxTikPHy3Fo9lOcqxO/dGDKvrHG4XMwaqvpGiHydEQOnw
	 LtVmJPjF2+sL2h1XUHipmVDoY0wOd3YWDF+DkLEtHVN7lIskXHqqSUbKVOXNKdcx/w
	 v+SABWatc5kguKg5xB7tOpvw0ceyPy+g2ql47tXgIo0mZHMMcwDbdIcbu/wDxrGKas
	 ux3U3uKuoZM03rmpap6gfji1TVpwTebZlpebzsty33Tg1D62hNKeNISoh6OyfZ31N4
	 D29OMDp5qqB/g==
Message-ID: <648c792f-f29a-46c9-a39d-ddf1dd856bbd@collabora.com>
Date: Thu, 16 Nov 2023 09:51:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: mediatek: Remove compatible
 for MT8188 VPPSYS
Content-Language: en-US
To: "yu-chang.lee" <yu-chang.lee@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Garmin Chang <garmin.chang@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20231116080129.20617-1-yu-chang.lee@mediatek.com>
 <20231116080129.20617-3-yu-chang.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231116080129.20617-3-yu-chang.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_005123_463728_C7E33A95 
X-CRM114-Status: UNSURE (   6.02  )
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

Il 16/11/23 09:01, yu-chang.lee ha scritto:
> MT8188 VPPSYS 0/1 should be probed from mtk-mmsys driver to
> populate device by platform_device_register_data then start
> its own clock driver.
> 
> Signed-off-by: yu-chang.lee <yu-chang.lee@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


