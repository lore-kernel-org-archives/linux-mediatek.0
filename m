Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF0DC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 11:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sCQq2TJDTtmFbYOb9oUbuMZOuGR/+wOCSZNbKVSEF8Q=; b=KN3ZZ579BS8jLt
	51lf0irgaupvewh+JDcWG5TTt6+DoStetRr/UpTjV6obvh6cCiuKPqVYvN9ODjDHcmxtupl19R0Tg
	W2eB+eoF02iFxHCmMJTlUKanpR56DTFk5BEIKV1BCTmlBZ64z9oWxU9rvpMjGObYTlCcWJ5jtZd7X
	EOvv5vuaZABt7GQUtBmwKVEgw7YK9dD6LY7q56aM4V/V363jtf6tG7tGn8Ej5OjuLJ78I6c2BJVBh
	o25SjmjkwLoU28h0PiY55pzdNfnyg8N5fNvH9kOsPlRC4AoKfiPL+zqfy1eH02TId2HIeg2DxDw6F
	Xq2L5U6Yh8Rljx7/B+2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt624-003bcd-2c; Mon, 23 May 2022 11:15:28 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt57e-003AMT-Ba; Mon, 23 May 2022 10:17:11 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 32CA71F42B75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653301028;
 bh=+CEmnlKnE+pry/LuSR00IJxwk/4DdZxU58h7kQU51Yg=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=Yt25R1SExf+QhJ0+O75tj5O8LBTj+6269bMusl6Bp4rS6HhNlIkwSDQVfB8Si8XS6
 hV1DzV9sFU16BzHZ+O0BMEnJT1Q3kEcE4iBSshgKYMpj2sN28piLmMvhsXPmLiCop9
 +UHRzkfTD4NhSCyUigqTaWX0oSV8PYiggPs7iMcw47Nqw7QGVgPFDdAnTXnYCtmYfB
 eNEs34tvcqa9g2q2VKgrgCqgmbiQeMURXC5oyCR1Wik0/YQdQmjS7Gr60Pe2aIn1uu
 CvTy5kV6VzBMk4FW1OFgBharyBkQ4cSnCctoZ63A1h35QnDGlkVxTuMWNWGOoparZK
 iJ9Q7iYFmap3w==
Message-ID: <d91977d2-ebc6-de6e-5eeb-61c25ba0cc64@collabora.com>
Date: Mon, 23 May 2022 12:17:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] Revert "serial: 8250_mtk: Make sure to select the right
 FEATURE_SEL"
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, matthias.bgg@gmail.com, 
 zhiyong.tao@mediatek.com, colin.king@intel.com,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 wenst@chromium.org
References: <20220510122620.150342-1-angelogioacchino.delregno@collabora.com>
 <YnpeYGbo7JJK0lDk@sirena.org.uk>
 <b13b019f-f766-60df-3764-d375f64ea7d3@collabora.com>
 <YnphFjs4E4EYafT4@sirena.org.uk>
 <63169e65-cbfa-d495-754f-023dc8befa42@collabora.com>
In-Reply-To: <63169e65-cbfa-d495-754f-023dc8befa42@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_031710_600163_E5CB8C5E 
X-CRM114-Status: UNSURE (   8.73  )
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

Il 10/05/22 17:29, AngeloGioacchino Del Regno ha scritto:
> Il 10/05/22 14:56, Mark Brown ha scritto:
>> On Tue, May 10, 2022 at 02:46:28PM +0200, AngeloGioacchino Del Regno wrote:
>>
>>> Sorry for missing this tag, and also I'm sorry for the noise.
>>
>> Hey, if nobody broke anything all this testing stuff wouldn't be worth
>> it!
> 
> 
> Haha! That's true :-)
> 
> Thank you!


Hello Mark, Greg

I've just noticed that v5.18 was released, but without this revert.
Can you schedule this for backport on v5.18?

Thanks,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
