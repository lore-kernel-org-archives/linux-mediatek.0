Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 117D8C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Feb 2022 09:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M9iRCxXAPxN8Axn1new4di+D6xHQ7cFB/0hmCAlRF0Q=; b=3dj8zu9P2Jz2nQ
	BboXGB+vM/j1GkzxddTgtNTish36QFwUA3LaTQ1mgwPamRIKB+yQ8qiCzGWeJXbhaQ/EDxQnLH7bf
	Mbzb8G+48zPEqOmDDhWOOi8HyieHNd6+3kOqfz8Rh4RNGSa3TR14KP2/tFmiNqYiBI6l3WzUSgV3V
	HAj7OBwN8cVTE6mO/YJvNmTvJUJUJlKV6eAqCccRxOlqF4nlvDN7OYC7Mpp2kMa5KGzlfUu1X5lrj
	BOaZu8u4TsFkTRwKcWpuAziH7TogAMPCFw30aj8iQcOc8JvjvmSnvI7pp9k4jNKXx3PqY0RUb0sDw
	SHX+APPfH9qZoQ3bLwSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFYjE-000Ymp-KE; Thu, 03 Feb 2022 09:48:36 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFYiG-000YFL-8u; Thu, 03 Feb 2022 09:47:38 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 3DF101F45307
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643881655;
 bh=f4XDyewCMqOA7NpYOnT++25Q2hO+IFLmu3VrNw76j4E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RUYjadw20ftwwUwDWiD800D2aVD+eBRX6qm8I3ufUyl0t4C4xQl9l3PlNm1JQkrKU
 88KjjmRMvDWg7rBMHsqcyquM7Qawjzn2aNhOY3xMy26iNBTpdIVR83/S/7p7MY6RAk
 oi0upBch7AFc64XA6eadvNcUbZh458/n5eenfR0jjhXIRwwGnqXaEdGVbGrP/NPhY8
 AwxKF3UyOAyv26hjdcYqUpkO6t9EsgHLwWbr+p+v5RBsEzQPObaxHdcEWaMf1C0rB7
 ONthJZfMOBJf55OTTAUPEjUwupq+++fDatzBaq6SpBzLuWUWMFye8W9aFHepq0phJ9
 e3fcCM16ix5ag==
Message-ID: <737f3fdd-9349-ce8e-be14-41f1378e163b@collabora.com>
Date: Thu, 3 Feb 2022 10:47:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 26/31] clk: mediatek: mtk: Implement error handling in
 register APIs
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220202134834.690675-1-wenst@chromium.org>
 <20220202134834.690675-27-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220202134834.690675-27-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_014736_478471_9396938B 
X-CRM114-Status: GOOD (  11.34  )
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
> The remaining clk registration functions do not stop or return errors
> if any clk failed to be registered, nor do they implement error
> handling paths. This may result in a partially working device if any
> step fails.
> 
> Make the register functions return proper error codes, and bail out if
> errors occur. Proper cleanup, i.e. unregister any clks that were
> successfully registered, is done in the new error path.
> 
> This also makes the |struct clk_data *| argument mandatory, as it is
> used to track the list of clks registered.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
