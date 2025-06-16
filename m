Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F608C71135
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jun 2025 10:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H3wLlyw8govUof7jzDiaEVO+xcofIEdKMOe3pzartzs=; b=TErnESRGjEUoEx30IGiWpBAofP
	3R5/LRBBcoWdP6vjdMgsgLX8TYLC1le5tX/mtUKxJku4N1qIkMXLaNT4xD4l4292L0aFEz4zR+qc8
	P73aGhYAJmSzWUpFc2WAtVm7MBKfmfL+MHwwKYHwKjT7D9nGIHumF68h9hNoi/PAE6rIfgd2Rhi1c
	kxBM3yq11iYoF18v6OuHoMR3Zg/VKSNB6LiZ1uCmIEtJHEdjWkLhLM8e86GSkaUwMkV5A1U78MPYG
	8lzHy9m9jKXZEJkn626UUW8TZdbz1BzS4Y2CA6ONEYFn1fAtfmQyfraMvFpZKueQEMjLqX/WkX6OT
	oVKMmT7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR6xf-000000043QQ-3CWX;
	Mon, 16 Jun 2025 10:21:07 +0000
Received: from out-18.smtpout.orange.fr ([193.252.22.18] helo=out.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR6H4-00000003w4w-0FFG;
	Mon, 16 Jun 2025 09:37:08 +0000
Received: from [172.16.82.72] ([124.33.176.97])
	by smtp.orange.fr with ESMTPA
	id R6GpufzEh5CROR6GquoLPE; Mon, 16 Jun 2025 11:37:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1750066622;
	bh=H3wLlyw8govUof7jzDiaEVO+xcofIEdKMOe3pzartzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=OEyRP9xW44ewXUweqboT5llf1e4621CPOiXfomOMnuGe8fCHddB6LBFiu0TwHmzM8
	 UyaZ98d7nUFc0r4kYXFoXtVhIrtlUKhu6bLcLYankmzdni5YPm0/2BFsCac+G63mpC
	 9CuKPxZmibBTRc2xNF8C8DMSTxr2C68HL3zGXVXEIGodQQJ+FnPGx+n6uZk7YGF3s7
	 kppAgo078Os2kmioe2fqN1jPOl75ZwDfY0rx6+n36e6m1K1i0TCDtYQzu4zlSQWysy
	 Nf80YeuBgis4QeSasjiSFXk+oIl7siJqJxsD+T7+yvrm5FxlQEWtFxFF3ARhNlClp3
	 krHPbjPpzjBMA==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Mon, 16 Jun 2025 11:37:02 +0200
X-ME-IP: 124.33.176.97
Message-ID: <1716571a-664b-4b14-b94c-f76303766ec0@wanadoo.fr>
Date: Mon, 16 Jun 2025 18:36:51 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] net: can: mcp251x: use new GPIO line value setter
 callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-can@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>,
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>
References: <20250616-gpiochip-set-rv-net-v2-0-cae0b182a552@linaro.org>
 <20250616-gpiochip-set-rv-net-v2-4-cae0b182a552@linaro.org>
Content-Language: en-US
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Autocrypt: addr=mailhol.vincent@wanadoo.fr; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 LFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI+wrIEExYKAFoC
 GwMFCQp/CJcFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQTtj3AFdOZ/IOV06OKrX+uI
 bbuZwgUCZx41XhgYaGtwczovL2tleXMub3BlbnBncC5vcmcACgkQq1/riG27mcIYiwEAkgKK
 BJ+ANKwhTAAvL1XeApQ+2NNNEwFWzipVAGvTRigA+wUeyB3UQwZrwb7jsQuBXxhk3lL45HF5
 8+y4bQCUCqYGzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrbYZzu0JG5w8gxE6EtQe6LmxKMqP6E
 yR33sA+BR9pLAwEIB8J+BBgWCgAmFiEE7Y9wBXTmfyDldOjiq1/riG27mcIFAmceMvMCGwwF
 CQPCZwAACgkQq1/riG27mcJU7QEA+LmpFhfQ1aij/L8VzsZwr/S44HCzcz5+jkxnVVQ5LZ4B
 ANOCpYEY+CYrld5XZvM8h2EntNnzxHHuhjfDOQ3MAkEK
In-Reply-To: <20250616-gpiochip-set-rv-net-v2-4-cae0b182a552@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_023706_511931_A4D14981 
X-CRM114-Status: UNSURE (   7.29  )
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

On 16/06/2025 at 16:24, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>


Yours sincerely,
Vincent Mailhol


