Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD9DC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 09:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DgRKN+Sb9YlN2mfajgrCBTPDPsAGof4GByQ9253VpXo=; b=nkgYsOFxsI6Mas6jA25C4uZCbD
	w6zQzm99+xxIJ2T6YuirlHtTI74Vs81gcxnaiA59lhQrz/SpnsRMgaui6Z+iq2+wg+7yiKC1dIxWY
	M7WitoW5EZdojQegI1gmHREtSoiSKCEFqxJuKTBJPcRJ1so8taD1nU89zhFUDtOObCGuvOzy3TT/b
	4lRiW6lUXGgtk84I8Rp+fcprIe7uMtYiqqX4I40RXdAn7ICoEvLaqqkf6eZf+12yM6oq0R00hq7gw
	7GXDQE8FkjD2WBKl7rJk3nC4gnjf6Ctk2HlbqQvg/WTHiY11QLxYgF0yWm/0CfVBC6VF9i5oC6Bjd
	gmM995gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAppX-0009YQ-Aa; Mon, 11 Jul 2022 09:35:51 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAppM-0009R5-9e; Mon, 11 Jul 2022 09:35:41 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 80BD9660198A;
	Mon, 11 Jul 2022 10:35:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657532139;
	bh=/pQoU97yz4hZOWkwVcb+ZiFvDCPudO0glpdakIglu9E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XbfSfqC0d0/CMCSy7PwUC1BrVijSWccHQPgI3Y1V8LRbLeDl/OQqQX9CSfEyeFQ7R
	 cBjNSizYFLsaWfhZwHFxuSZvKl8h1AVRnryTXxkgQ5H2DBwnyG6vM0W9L3EQnrspjC
	 SGYnFpmSBVfaQ/Uw30Rwm1A+eibVa0GE5befebxfFpi+QPbyZjpbSY09LtVoFjqYLx
	 MoVdNQc6leAw68bgo1aFgWd5gU3bz2dM4vwaHjyO10XXyFFX4LyUEtTMQ737TC+D0J
	 hVIuzRXAvi8j1HG/wr6k8vhSS5bcR5Xb/IaKa3OVPWtYCoueU8Mu0SgHQ1OgZl/tHo
	 7EQVKKZjJ6myg==
Message-ID: <c0904c83-d264-41a7-3a3e-4253dfc36004@collabora.com>
Date: Mon, 11 Jul 2022 11:35:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] Revert "dt-bindings: usb: mtk-xhci: Make all clocks
 required"
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel@collabora.com, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-usb@vger.kernel.org
References: <20220708192605.43351-1-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220708192605.43351-1-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_023540_484292_62F805BA 
X-CRM114-Status: GOOD (  11.94  )
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

Il 08/07/22 21:26, Nícolas F. R. A. Prado ha scritto:
> This reverts commit ebc4969ae125e65fdb563f66f4bfa7aec95f7eb4. That
> commit was supposed to make the binding better reflect the MediaTek XHCI
> hardware block by requiring all clocks to be present. But doing that
> also causes too much noise in the devicetrees, since it requires
> updating old MediaTek DTs to add clock handles for the fixed clocks, and
> going forward every new clock added to the binding would require even
> more updates.
> 
> The commit also didn't update the example to match the changes, causing
> additional warnings.
> 
> Instead let's keep the clocks optional so that old devicetrees can keep
> omitting the fixed clocks, and we'll just add the clocks as required on
> new DTs.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


