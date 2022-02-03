Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70E4C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Feb 2022 09:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aVJW4ARHzhOSVYsbC2Xbvxk+Qjfnb3f8OhDA6vkAbJg=; b=xkl98sNQsyxzI7
	1Mczy6Zo3VZLbwVjkKjCLkkxCgXdZSFtBvzf55kEnwrL9jhknfTTZkJtpmgnjlSv6p3AE/qKwkHhC
	/RkaO3tiQ1snqxSyokTzxRN+Lq+Nn0byXa/6fAQDYpEUUSRNPh8tnwnd//jfL4aPLiQa4W7ASakae
	YJGsmG6fBRZIBCZ1B7LlKTodiTq7CsQsF2vTqA2BG4OIDIQ5RvOS6f6Mr1sLNqbS1+MH8kH1rZRHo
	euijKi9KMwnXvMyYUNVbUYNDoBIDJwgfaDh6CCiHkHcaCaYdtSUO3tA5WT0n0+fyC5CIR7Bv1UEbS
	UmhJkupkTrF1DmmC8ucg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFYtN-000e6L-GC; Thu, 03 Feb 2022 09:59:05 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFYlI-000aA0-MX; Thu, 03 Feb 2022 09:50:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 1285E1F45313
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643881843;
 bh=ipkRReMbtwAu7xVakE/HQLluSawAEt4oVRymv8x74FU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LqzW7FjWzqe6QSgeaUlTZ4b9i0aa+yHVY30RH0JLBHzM7yQOpUdy3pEAiTscNHqdL
 po/03WDoy8jkq3f1W1y/z78nUavZPZN2urdpwQvaKRS4rMyBhCBuduRF6YNbLUtyE3
 f7TKw3rhI89QNKBgNZalAtAe+d50opRRylps1SpqO/ZyfHHdrf9lLtTXMS2Aj68TNv
 pUwfozQLqvOMm7ISQd3TkT/Yd8pl2ACujCgd6ZD0B2ziNrXW3DqPX7tyi5ViVGP+TZ
 ILrc/6zAtBJiQBoLGtd7KTVSXtQwq7X1aAQYx12iWBGCjb+FkqcO/MwW/ChCt7Vgmd
 GR1Tk5He8YrcQ==
Message-ID: <653343bc-701e-bc31-9e19-857c2881eaf2@collabora.com>
Date: Thu, 3 Feb 2022 10:50:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 11/31] clk: mediatek: mux: Clean up included headers
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220202134834.690675-1-wenst@chromium.org>
 <20220202134834.690675-12-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220202134834.690675-12-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_015044_893637_4DC50F98 
X-CRM114-Status: UNSURE (   9.53  )
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
> Some included headers aren't actually used anywhere, while other headers
> with the declaration of functions and structures aren't directly
> included.
> 
> Get rid of the unused ones, and add the ones that should be included
> directly.
> 
> On the header side, replace headers that are included purely for data
> structure definitions with forward declarations. This decreases the
> amount of preprocessing and compilation effort required for each
> inclusion.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
