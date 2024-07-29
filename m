Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695B5C3DA61
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jul 2024 07:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z6wrDRnANzSjI0+9YbaqKPIPM3i/vTH8phiWoOt1zqU=; b=Ixm8+5u0eJeTHnthwzjN29D4Ho
	SbOwDZekmdI/Bh2NFnanuVMz+fHh8zS2OWbGr3SjKcFwg85UxfSp1p+q2Nb15OA5v7Yh1doVedWr6
	cujd8pILG/4HTJyOYpahDOC5sC39nZj0hIV3PldiIOk12tRWxPQA+Nu7zzaznlarfG08R2BpiziRC
	HzIjhSx6BZ/6WqUlu1Rl4Qu+300SHdI5gZxNJelR+Pl6aeRUbo1IJ3totPEhorr7RjhdTINDlLRd0
	PdF+OWhBRtZs0lk2qSyDShfthxifBCxOBOHBl9RLtOl7t1cPyKkVMkUr0RUzDPs90VkWPc0/l5Wah
	YPXkmUKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYL7A-0000000APu4-0Pmn;
	Mon, 29 Jul 2024 07:48:16 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYL5q-0000000APX9-0Cny;
	Mon, 29 Jul 2024 07:46:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722239212;
	bh=wefewgg8MA83GDqwLCK368+HHUQtMnN6KGd6v5VYzsQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=F00f5056aU2ltqDAaa41IgpodeL3kXhXjsYSvhz/FHygaJQhxdfRHiI7RtixmH1k7
	 EfSG9lA7CKQrfGymC5JGYoxCHtXUIyeZ2WOS1NlTGE2MG8sE1L/+ZCEhYOz7GSUjkX
	 2jfCZkJcI4XOxQcy4kR9iyKwnsDlmnTtemDJdRXDfNuvPhxreFfGxlriJ4LqzrqSrN
	 e4Sl08bBSB8unFDVi0jugtOObW6FGYGYuMXWyeFgtp6VDSapDgusNvJhSpzxyxO5JP
	 LeQx8KKS78ei5J8KZcY6YYkQ08MSI/APccaK88Hht4eDxiSHJfeYTz3SSZUxj4ydy8
	 uoC30p3iMmIiw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 606A7378215C;
	Mon, 29 Jul 2024 07:46:51 +0000 (UTC)
Message-ID: <a17a8a7d-3c58-4e9a-bdee-b5424e3ddf2b@collabora.com>
Date: Mon, 29 Jul 2024 09:46:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] dt-bindings: pinctrl: mediatek: Add bindings for
 MT6765 pin controller
To: Arseniy Velikanov <me@adomerle.xyz>, mturquette@baylibre.com,
 sboyd@kernel.org, matthias.bgg@gmail.com, sean.wang@kernel.org,
 linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, frank.li@vivo.com, jiasheng@iscas.ac.cn,
 mars.cheng@mediatek.com, owen.chen@mediatek.com, macpaul.lin@mediatek.com,
 zh.chen@mediatek.com, argus.lin@mediatek.com
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <20240729073428.28983-1-me@adomerle.xyz>
 <20240729073428.28983-5-me@adomerle.xyz>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240729073428.28983-5-me@adomerle.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_004654_248205_16FB4A17 
X-CRM114-Status: UNSURE (   5.49  )
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

Il 29/07/24 09:34, Arseniy Velikanov ha scritto:
> Add DT bindings for the MT6765 pin controller, which consist of macros
> to be used as values for the pinmux property. Each macro corresponds
> to a unique possible pin-function combinations.
> 
> Signed-off-by: Arseniy Velikanov <me@adomerle.xyz>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



