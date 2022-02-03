Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5889C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Feb 2022 09:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0qJKf4goAYxOKNrkaP/Qni1NLxtHMo8S+mFyX0Xlrk0=; b=sUtzzk1CfxNHIS
	KB5Z83iFTxMNPm2OBrH0Z54Ecb/XJXvQEAws0tKaiPcqFg4DSbgbMNqNB1JHV4CNyMqWNdJ0ykrcE
	DwSwVbjO3qsQBhDG8jhS8n9wsKSU/v2qNqRLft4YRU9/W4SV3sueBwLS9qsOJp73YYkm4ZairMjXI
	sep9+0WJVGmqBTlSUcxFXARiES+kvzoyKCqTFOtDLUim61yd8nwcBuqCo8pYGj3e699iguWcfisU2
	hNnLmr7p47iRTQK+I7feQPohDXm+SYkytcz1b7zHIerIL/ww/lRmT7tNJv20xNhQHwa+X1PDZ1Xoy
	YkdCPYMJd1PA3v7ez79A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFYot-000c6P-MI; Thu, 03 Feb 2022 09:54:27 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFYkn-000Zrr-9Q; Thu, 03 Feb 2022 09:50:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B24511F4530C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643881808;
 bh=1f8Tnb8qEXcDfjjPM9iKXR27s8APvpCQ3rN4h6SQTs4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MeS0RR5EmsyI4qsjP6h7Q1ZqdZRYY5iVRVYzEDyPFFxT4FnzBdf5SHMkNmzGWpt+L
 O9HUs/qtP3AFMm1aRlPdLdhlwgrfhzxhdVQVb24Awy0eAyj8b5cOWNYbE/wFLQ1VfL
 RbqM5IC7rsntt6yPNNTDpAFwiFmmoGN1worKtMnT6j4Y73Xw2uKPL0F4VXfrllE6+p
 nDYdcuL/x9z5pzIF8c6wOlc/8s7t4JIbQpYjH78PyAi1zK14kUd3eKhnwfmfUC/pLW
 mT2RIKkNzjuudPzIjIsdJPb5ZGJrFZYoltFZrOCDRurADWj8vpMcxzs8lc1IeIltDL
 HRzIqqET84wnA==
Message-ID: <a10a380c-25db-8203-1d52-f807fa517b7e@collabora.com>
Date: Thu, 3 Feb 2022 10:47:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 17/31] clk: mediatek: Implement
 mtk_clk_unregister_divider_clks() API
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220202134834.690675-1-wenst@chromium.org>
 <20220202134834.690675-18-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220202134834.690675-18-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_015013_523061_9F67739D 
X-CRM114-Status: UNSURE (   9.96  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 02/02/22 14:48, Chen-Yu Tsai ha scritto:
> mtk_clk_register_divider_clks(), as the name suggests, is used to register
> a given list of divider clks. However it is lacking a counterpart
> unregister API.
> 
> Implement said unregister API so that the various clock platform drivers
> can utilize it to do proper unregistration, cleanup and removal.
> 
> In the header file, the register function's declaration is also
> reformatted to fit code style guidelines.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
