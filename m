Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C587EC3DA7A
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Jan 2023 12:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QmLy+e7MSm6Iq1fvJ3PDv4oBnYUDFJD59K9g1C0GhNc=; b=LulV22OS2MnMfG1K9SuKb01d2j
	vVaYJnNhUJYYZ40/TA+M2ATVrelmAeJgBZfXKWwDdwMHcaRMcZCXqo7fy8uyoTwunsYnJqS/8qYwr
	fHURE0ZGU6hZ0v7us6r7CkDOvq9vouHMr2L6FOzmEwTtLqMmfSL07af4cEATIg6M5WyRV8vCFfsg3
	i1OHt/AipnDIUsHzpxDSYDNJN8d1DBcVFOYD+vQO1fvnPvHjmmwTWr6sJFUlkK9Uf5mqpG4WbUUSH
	HWIfATndewRnodmcVz8sOi5ckLbFEdeDAgeb1Dpvj+Wia4Igi6wvcmUKG2ZqUG4IDLKILRXby5zze
	1fpjlQFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCJjC-00BAuW-Bp; Mon, 02 Jan 2023 12:15:42 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCJdl-00B8Mr-Q8; Mon, 02 Jan 2023 12:10:10 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CA1466600366;
	Mon,  2 Jan 2023 12:09:59 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1672661401;
	bh=lkCFrmVPcGTYnst/KLtb52ilxI3n8W6fyPATphFVFjE=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=iQ3dezdKStkSTY+iDw+xekNjCw3j3xjK3tqs70Oo5qVwqy2dSdMI6oi2ZIrMr+lt6
	 YdX4RLq+QvpLyoZLnDLmPl7eWWdRrEoH6fIK1dw+pUFSN9t8XO9QatAV4MctnpBSJv
	 2NG9bt26Ny0miIfMAKsRdmUIZarphEuG8URGcMp7tE0E/IPd/1fcxWnixOvPFLLKdu
	 vf10Ij/rMjxoXgG2qNCai3WBjrSmMlkgI7Gb2aN9sWrV9qG23xBvgPtZQLR5c9wp1r
	 Kcfj/ejgzmIvgnyFaMdKnjkwZSfioly4z44CxQXtJ72olnVXBDr/vdoQl76n2Vai7O
	 1RTBaQ3vX3UNg==
Message-ID: <54e09399-6ad9-42ca-fc4a-0ff4723f0ab2@collabora.com>
Date: Mon, 2 Jan 2023 13:09:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v7 3/7] dt-bindings: mfd: syscon: Add mt8365-syscfg
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-usb@vger.kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, tglx@linutronix.de,
 maz@kernel.org, lee@kernel.org, linus.walleij@linaro.org,
 matthias.bgg@gmail.com, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, allen-kh.cheng@mediatek.com,
 nfraprado@collabora.com, sean.wang@mediatek.com, zhiyong.tao@mediatek.com
References: <20230101220149.3035048-1-bero@baylibre.com>
 <20230101220149.3035048-4-bero@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230101220149.3035048-4-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_041006_129166_4A3ABE9A 
X-CRM114-Status: UNSURE (   6.41  )
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

Il 01/01/23 23:01, Bernhard Rosenkränzer ha scritto:
> Document Mediatek mt8365-syscfg
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



