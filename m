Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC73C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 12:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XoXcDKp2do362kkxdDmKZOvSelEMzy/rkl3Areb8+N4=; b=giF3iKyOaG6wwh
	Nvvud7ah+mMxTuU7TtHcM0R/bG5Ow4wzbySP2o44bFWy3+VNkuHE+J+HQiC2ZILhSW8Gr3P+iB6ZW
	8OHn+SGGqntyLZusVTgsiEczV3yxnQHRIP18ZJD0EoGMIPWFlQFg64YwCdGb4e1liBC9TYKmDr+gS
	Vd8Rh1A944JjkdJ2q2VHKVNTC6M8T2VXIwbzoM3JAKROsx79rxWwgctMYzxpg8TA8IkerH99zc3++
	D0A+8J3/+PUPs95gW628JJGn/TEBZ1vio4prBEPOJ4LZX/X78xtY2fcozv49WQTn3Y36o1Wic752l
	3km27xCHU36+PqCLwstw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt7DV-0049vc-GC; Mon, 23 May 2022 12:31:21 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt6wR-0041nt-5l; Mon, 23 May 2022 12:13:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A7AFA1F430BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653308019;
 bh=v3cp80sJ9SzSDK/J2d7gZT2Ia9ALGOeIATvRiWBZxiA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=F67iLJlAISqVNgoEhXyYh06NdBSFoUMKa4R29WyycbIZEFE+cvYcv6SVta3K5c0Q9
 WhWyJHZXC8iUUn5tZQoMA3cucIBgmAZdJKcmnpfPLRkX4vjr3LDAYjrWaZ57QJucPG
 +xV03Uk9wUHk4kdEOhYenY0c3M31u9JTDA/F2C0xeTmJ5hDoNoG1/aOnv3NNrA08cr
 XyuJbF5ISgXNUzG7e7Af7irOEO1oGC74C6/eaDPcpBYBe/LrSiMxqBhFTspAtFUUpb
 p8joRwiLPfF7oIAwOCKG/LyGzfdUuhII8lipnXfs8Su7M4gMDKqOqoHXlfMwHR++IH
 hdtehbD7YE7sw==
Message-ID: <da1e4b31-de71-1fda-eff7-2e70fe1331ac@collabora.com>
Date: Mon, 23 May 2022 14:13:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] Revert "serial: 8250_mtk: Make sure to select the right
 FEATURE_SEL"
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Mark Brown <broonie@kernel.org>, jirislaby@kernel.org,
 matthias.bgg@gmail.com, zhiyong.tao@mediatek.com, colin.king@intel.com,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 wenst@chromium.org
References: <20220510122620.150342-1-angelogioacchino.delregno@collabora.com>
 <YnpeYGbo7JJK0lDk@sirena.org.uk>
 <b13b019f-f766-60df-3764-d375f64ea7d3@collabora.com>
 <YnphFjs4E4EYafT4@sirena.org.uk>
 <63169e65-cbfa-d495-754f-023dc8befa42@collabora.com>
 <d91977d2-ebc6-de6e-5eeb-61c25ba0cc64@collabora.com>
 <Yot5uls/3vLzZu7I@kroah.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <Yot5uls/3vLzZu7I@kroah.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_051343_547061_A9DE70B6 
X-CRM114-Status: GOOD (  11.55  )
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

Il 23/05/22 14:10, Greg KH ha scritto:
> On Mon, May 23, 2022 at 12:17:06PM +0200, AngeloGioacchino Del Regno wrote:
>> Il 10/05/22 17:29, AngeloGioacchino Del Regno ha scritto:
>>> Il 10/05/22 14:56, Mark Brown ha scritto:
>>>> On Tue, May 10, 2022 at 02:46:28PM +0200, AngeloGioacchino Del Regno wrote:
>>>>
>>>>> Sorry for missing this tag, and also I'm sorry for the noise.
>>>>
>>>> Hey, if nobody broke anything all this testing stuff wouldn't be worth
>>>> it!
>>>
>>>
>>> Haha! That's true :-)
>>>
>>> Thank you!
>>
>>
>> Hello Mark, Greg
>>
>> I've just noticed that v5.18 was released, but without this revert.
> 
> What is "this revert"?
> 

"this revert" == "this commit", reverting

6f81fdded0d0 ("serial: 8250_mtk: Make sure to select the right FEATURE_SEL")

>> Can you schedule this for backport on v5.18?
> 
> I need more context here, sorry.
> 

As stated in the commit description, some MediaTek SoCs are incompatible with
this change, hence it's actually breaking late serial for some machines.

> greg k-h



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
