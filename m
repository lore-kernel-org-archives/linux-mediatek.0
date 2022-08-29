Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904C5ECAAD2
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 09:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mvDFZnFYuslCXBG3CHOQdUo6QecNXprpcW0x045OsAI=; b=NY8P9SX70HlWSG6rdmRh6PvTnC
	JHotsWXhbu0Ch302r6VxyjXklfh9ZyHevMrXKf33EGNxZ0jeB2XC+jPRxdTfGHmK1PwRqWhCiIzsf
	W3vPKc7l+94Hx1+9u+7HG2z1BPrv910YahyvbilQx3ou1OpRgvNoqS604liFXFCxcGPqKW4boVqIU
	qGzZscP8Pso7D2V49wPnrGNvDa4FGiBrOc3wNMjjE52ztAOLZ1WTRg9TZRxseZow1qLiJOSSr6KGD
	BrWnM65Ny7M9LUv7ZlYBzoyJcXmPHeN2wdRqueW5a0jgEWPNpzkS97Gd99vw2gbMigLIauvyltCUu
	+W3y+qkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSbDI-006onf-1T; Mon, 29 Aug 2022 09:37:48 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSbCS-006oCr-KW; Mon, 29 Aug 2022 09:36:58 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D26E06601DB2;
	Mon, 29 Aug 2022 10:36:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1661765815;
	bh=G158CjfQdiI7n5kAiwB1ffU/Ky0VT1XFLd5k77luxWA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aUCjw1mHanhtQiZIpUwNswac5D30YX4kqATo6tlBrvrnN/VykansD2j1scYFIifWT
	 FgKqoBRMqB6jCUk8HuL3+G/2MIakt05+pY/S2b2Bbl+ShoAq+t6f9OPCg0EGYGiX7O
	 sA+QVuiOukSkYgKABLGHKnoTAaO013DUi2VJghsUsOllIQYlsQJmg3nTJkrSB9sDhm
	 ddo/mhaJh9JVlJb4TyxHVPJJ3b40ecfxhW6Adlv5tliZsTSHjPNVkyqS4RvcehzmjP
	 cjKB9i7IhEVNtYzNlRe/P6K76XCPaVkuc5+gs1yOPccSe9tu1wKCE5X7A/Uy460r98
	 qIax8O3etmI0Q==
Message-ID: <37cdcc41-8cfc-443a-a6d7-94b992a0b6f5@collabora.com>
Date: Mon, 29 Aug 2022 11:36:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 6/6] soc: mediatek: mtk-svs: Use bitfield access macros
 where possible
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: roger.lu@mediatek.com, khilman@baylibre.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20220726141653.177948-1-angelogioacchino.delregno@collabora.com>
 <20220726141653.177948-7-angelogioacchino.delregno@collabora.com>
 <fa5f9bc8-f087-02c6-dd31-efa33244bf1b@gmail.com>
 <20220825185059.xbh3gigksveg4h4u@notapiano>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220825185059.xbh3gigksveg4h4u@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_023656_948463_645A859F 
X-CRM114-Status: GOOD (  12.26  )
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

Il 25/08/22 20:50, Nícolas F. R. A. Prado ha scritto:
> On Thu, Aug 25, 2022 at 03:29:33PM +0200, Matthias Brugger wrote:
>>
>>
>> On 26/07/2022 16:16, AngeloGioacchino Del Regno wrote:
>>> In order to enhance readability and safety during registers setup
>>> and value retrieval, redefine a few register related macros and
>>> convert all open-coded instances of bitfield setting/retrieval
>>> to use the FIELD_PREP() and FIELD_GET() macros.
>>> While at it, some macros were renamed to further enhance readability.
>>>
>>> This commit brings no functional changes.
>>>
>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>
>> Does not apply, would you mind to resend together with 1/6? Thanks!
> 
> Hi Matthias,
> 
> Patches 1 and 6 rebased and sent [1].
> 
> Thanks,
> Nícolas
> 
> [1] https://lore.kernel.org/all/20220825184616.2118870-1-nfraprado@collabora.com


Uh, sorry for the previous noise - didn't notice this email.
Many thanks for timely rebasing the patches!

Cheers!

