Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF4A1ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Sep 2022 07:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qKWZcSVOFRROMAreXQFkT+OBXaFsQDgFUviiGW9SU4U=; b=IYQ/35tgm6aFzgOBFN7oRsQ8IL
	yojxBNQ5OuEN/csI93VJMzBlLbWCjDUwtWZo0Ck/yO3n1xCEcsB2R+EbLctuvlejdSliOP8Ehtk+j
	2/UEV6tsnmIRtIpGI+NyFKr/w6RhmfDrpGZSdjRcmducmpG+PkmIc5LsuDLXFgLhMDlOQjE8kkRMZ
	Gr2SeTDOPCcgtDKAjJUgO7c0z60FtUKEY2esAHTgRkkQ2NUQq9a34KASC6gY6pRzqQIotSOafwQUc
	bf6jR1GBv5R/UCYTW2gI11fukVKIPyzwmfZAP6MZlbwBNpcbgxwp1HgYR8BTXgfOjG6a1MXr8ZsGb
	8U2HXXvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWYo0-00EAFb-VA; Fri, 09 Sep 2022 07:52:04 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWYib-00E6pV-Jh; Fri, 09 Sep 2022 07:46:31 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 479E36601F9B;
	Fri,  9 Sep 2022 08:46:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662709587;
	bh=btuOYk8Yksu/mrbm/ksppF4pLolIdwf7c7FNNubU8tY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ER9D9KgU4DiM/CrXc531i54AIBoZ+wfDxtiZMsWtHmFOLLB9UxakfunXndj3dEMjz
	 f9x5HT7A7lt+2PtIGlOjL7gB/802NDc2XpMUKuhnBLYpMMttOkGycGC4SumkCVwf7r
	 IjzEZlpiy9BAYOaf2Qqi8RNyY3PG43Z707ctgTsDDTSgEPrFdmaybQk/dgDhZ4e6er
	 Y4BjND23ymZ3IXthUfcIUQmrv4x+a8havLKYYPsHz1pycRqpbrmpa+4f4MWmgg7+KF
	 bUQuS4jP9uIldU3LhB7Lu4RdOgbYEFNjgt4ppmxMWl2g3mZO7rtvE+I0kI85Rnjy9m
	 fEQKZKqYdaAfw==
Message-ID: <a8474650-3083-837e-9f0d-590b025978b5@collabora.com>
Date: Fri, 9 Sep 2022 09:46:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 2/3] arm64: dts: mediatek: asurada: Add display backlight
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20220908171153.670762-1-nfraprado@collabora.com>
 <20220908171153.670762-3-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220908171153.670762-3-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_004629_814686_E79A9330 
X-CRM114-Status: UNSURE (   8.60  )
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

Il 08/09/22 19:11, Nícolas F. R. A. Prado ha scritto:
> Add the display backlight for the Asurada platform. It relies on the
> display PWM controller, so also enable and configure this component.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



