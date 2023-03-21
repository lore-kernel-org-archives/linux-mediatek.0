Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81318C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Mar 2023 08:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eNZv/7ubVIgZMXS98h7XDMTdxwDgmwsW9oCI5Fx2wto=; b=H4USEFVq6Zqiiq9PWVy0Hfilw4
	k5LV2CzqQoiXO2cCOGef87UOuXmhqtD2SaCOEnlD/brC7cBblDrnQLYgOw1zjEOy1lGfzauAVp7TG
	XFbz4CGZoAPBYKCZhNnK1ifOfqittVy7bhePXU9QouI0GZxN+IipgxaGfDkNClkbrWlZfBkwtIYai
	VVVtS4jcDnjku4+vI4zzPTDLX7RWT1NpNuL4N7t3k0dY3JAj95ZeUBOTMGJql63hkQSI9Co7UwTKt
	JWJTKy9RjmQbQ8g9v+bCyTDkBXOq3JVwDm41w5dvt5x3NSfwmdYEA4VvoHM9p8E1C5ldRZI3TBp5J
	RNlNlqXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peXmT-00Bnmq-23;
	Tue, 21 Mar 2023 08:55:45 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peXmO-00BnkL-2x;
	Tue, 21 Mar 2023 08:55:42 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 13C3666030D5;
	Tue, 21 Mar 2023 08:55:39 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679388939;
	bh=0ekjo5nMc8NxHpvolEsvhky3PM6gq3HIZIVq67wsqrA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TlSedSI7TwYWON33HGI22cJ3b9NT1kNDMPLt/7jwSvxu1yymyMCtzV0csrbZ9HjBQ
	 lODVQ7mBB4G6NWNFX9IEUcwrv560Je2K/o91drzoXNQMhUrlURIMmaG8PUoXMF/Ryi
	 bxV3zIJCnpOlC0hf3Z/ZzUyHq0HqSUe+f351Lu/yTlH0EiVel0fhyveGkKQw/+jTn4
	 N66Zz6ZaYzusNuYOjfj3FPo6b8vFFbseM0//jucfSOoJBQ3qPPlgcLKl4F/S1jxHRB
	 6q7/L7qMarMwGwOOBibGCSR8Mhbhhq8lYYH4NunGm90ggjHsjw0p9hl7uQ/flC3v0K
	 kLXNxdh0zJ2JA==
Message-ID: <98c0a46d-05da-7863-1a30-51727c20da23@collabora.com>
Date: Tue, 21 Mar 2023 09:55:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] clk: mediatek: Remove unused configs with
 COMMON_CLK_MT6765 prefix
Content-Language: en-US
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Owen Chen <owen.chen@mediatek.com>, Mars Cheng <mars.cheng@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230321042641.21592-1-lukas.bulwahn@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230321042641.21592-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_015541_092034_CE8F890F 
X-CRM114-Status: UNSURE (   8.62  )
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

Il 21/03/23 05:26, Lukas Bulwahn ha scritto:
> Commit 1aca9939bf72 ("clk: mediatek: Add MT6765 clock support") adds
> fourteen configs with COMMON_CLK_MT6765 prefix, but only uses seven of them
> to configure inclusion of drivers.
> 
> Remove the seven unused COMMON_CLK_MT6765 configs.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Please add the required Fixes tag (you even reference the commit to fix already!),
then you'll get my R-b at v2 :-)

Regards,
Angelo



