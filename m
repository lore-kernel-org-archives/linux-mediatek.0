Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A75B3C83F33
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Sep 2023 08:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oblUg8ssRNfaylIS0kjlU9RIpm5iSlQMbRvmqS+Tk8A=; b=X5fAl8HQgSpLge
	OWYjYu2kMgE30DbfOEWpxesXJBYCexQLBocZeZusGxD4IYH8t5l8zjzX2cFcTB9lBXmtVeLUPrPiu
	q6pqiuBOme8FXXfYJvXLXgwv8h4Cw0D82//WOSz3J0ivuTBqmsQyRPZ0ByO/uk7XlGZgq6KlkUXvH
	0q9XDzkNrER1dIfnxaEUj4d8pJtYW1gk+MuFSYC4a414oVP5iJGjcaFs7H8AJTA09lq+LPTcehRT1
	W1i9lPRorvirCXK9uRvFALM34pF+BN0jV/xtHgaXCHg+6GnHE2GiX8OhyG6x+uiChb24dA8G4fvE/
	nDWWwHxzPDyuojImrZ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdR1q-005UXB-1u;
	Tue, 05 Sep 2023 08:03:18 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdR1m-005UWQ-37;
	Tue, 05 Sep 2023 08:03:16 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D307B660716C;
	Tue,  5 Sep 2023 09:03:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1693900993;
	bh=ds0zLIqF4zHaiOeC7HqV5SxOUmkM7LOq32FcWWfWQTs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AlDblQi667rjIYA6FJV2mzSgLg+4xrfRl1ZNuOnlnIS4zfpfViTzPyJvRSQwrkcVu
	 zjlXSX5c3Ep80HnoFh0XR2zyq3Fj/bgMrku2VemIW4I1cupd+pIj61I4auP98ZEAIS
	 lt4XRE6EumQd960xed2+Kuupa6ikuZxYJH1XGefi4lmvqjK4C676/r1O+R4INI0FWy
	 ltTrVNQsIFT2tpUnMwMwP4almUZMiJmSdezilqRASQW6xBTxDOfWtibrUU3MCC4eaY
	 qVRhdzz13X/+QMWhGrNENeHsX2l6+KlumYlva5eWuiJM+Sd+DYqLtrQ2wIj+jQ9Zvi
	 8l+GFdMdNs1mA==
Message-ID: <02380e49-7848-c968-ef6a-bc64d87d6228@collabora.com>
Date: Tue, 5 Sep 2023 10:03:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 2/2] drm/mediatek: dpi/dsi: fix possible_crtcs
 calculation
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>
References: <20230901174557.3617839-1-mwalle@kernel.org>
 <20230901174557.3617839-2-mwalle@kernel.org>
 <d7e6917d-7315-12d6-d7d4-dc7ea8c58dc9@collabora.com>
 <cf7d01700f5e5adf2f28b0376451143b@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <cf7d01700f5e5adf2f28b0376451143b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_010315_156201_A00B54AB 
X-CRM114-Status: UNSURE (   9.81  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>, Stu Hsieh <stu.hsieh@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 05/09/23 09:58, Michael Walle ha scritto:
>> At this point, I think that it would be sane to change this function to
>> return a signed type, so that we can return -ENOENT if we couldn't find
>> any DDP path (so, if we couldn't find any possible crtc).
> 
> Fair enough, but should it be part of the fixes commit or a different one?
> 
> -michael

I would say that this should be part of the Fixes commit: after all, you're
fixing a case in which the possible_crtcs calculation *may fail*, so the
error handling for this possible failure is, indeed, one part of the fix :-)

Angelo

