Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B85C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Oct 2022 08:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dI7RKGCD3u27ZacDPzQBD55ZXETxayWku6sWIZq/DT4=; b=VAYoOiMzNuy2fkuo/HrMyuvnSU
	y1WS8ZkimX+gBeHIQ5xBLHMa1Kdr8MZxPQthJFy6cfaharQTKzGcjknMk+fP6dlPmoPQK+zZQGzdi
	doZSNtVAorIv7+ROBe0YhWoB2KHXHgtxLdqdZXyhWF55coiffZ1oi+M/ZL0ZOHn2mqj7JjhFG8JxU
	duauf65MY42fV7BMwcsN4kc7B81yW2+/jUZEolWRok19vQC/tca3OSHR7PzRXOLsNDpxesf8UtAwx
	jyQ+xvc4cnx4yN2H9fzYg3Izm/FPzxbSV9+XafjKin6W/WKhr0Xer3BwJHRZ9tefifTZ3LXKaQUA7
	20o66ziA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oho8B-00Hb3p-SR; Mon, 10 Oct 2022 08:27:23 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oho7z-00Hb0N-Gm; Mon, 10 Oct 2022 08:27:12 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3CC9F6601F8A;
	Mon, 10 Oct 2022 09:27:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665390429;
	bh=OpW9zxpnT/aUzp6kpBa2GQpFwgyeRu+9vyt8D7ppWto=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=czIE+/7fPUl0iIJHrA1d1Ik5lWsIlrYB+Z00G5fZ5hwd9VwpMK/890shbOoxTxblG
	 eVP9g+2NTn3qDK9kOFeGOWJC4sx2OikhgoZedQfmDwpATrYtzqHdVLXaAMr9/r1PBL
	 vnM2ysOdI1TubPMt+OZmwySKaEsL7j8t1HmwN9mIfQPtqJaA+Xf7iPoYN6nKvr4sIP
	 rDZ1tbscOBnpitv1gxQJESHYpiWmHkoENkMPSNr1XdMgw/w2zDDNZkDfvLD/ofNF7y
	 1FnbmgbVnsD/tvSTHKSk20YXfyceAJOve6ZWxrk8LJVepLt+uA5FKQY5erVycxxC3x
	 qfCUYeAovwkGA==
Message-ID: <a1ebf7ed-22a8-9e14-9708-f165999f1e36@collabora.com>
Date: Mon, 10 Oct 2022 10:27:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 1/2] dt-bindings: i2c: update bindings for mt7986 soc
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-i2c@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Qii Wang <qii.wang@mediatek.com>
References: <20221009101631.82380-1-linux@fw-web.de>
 <20221009101631.82380-2-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221009101631.82380-2-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_012711_714550_8A8DE7B9 
X-CRM114-Status: UNSURE (   7.74  )
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

Il 09/10/22 12:16, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add i2c compatible for MT7986 SOC.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



