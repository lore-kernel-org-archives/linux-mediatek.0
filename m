Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9E2D1AD39
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 09:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C1qJL0QekOn7e+SB5ZOk56gVI6TzTc4Hsg+M866DUS0=; b=mBVS0hjiWic4MOTCWkEJ+AXqcV
	iH9akS9FzXL6JmiQd30+qDNO8s+ul0DooDJr3HvwiyAJvMTSD8svjBxRIS3sE5vT1CYS7gMo6PldL
	9p7hktFNkKMi+bt9CdJObh+BCS0AWk5otUIZ/rpravZsRvD/ycDxPUSyKYC4tp2MVbavv4q+m9aNQ
	QU/v85W7tWn5ZEmulqhbLSTPT3flWU2coFwd7Zyent57sVojW9eEf+kBHIeQxozsHzzDp8DO1ztUe
	7gKjrwe4lzrJXqWb050I8TMfZp0CPC+ljT6DK2G6hWzuVrs4mnR+CH/w4T2WzzpZvfJiYP4rM6/1o
	+e5ANZeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t10ov-0000000BL10-1xK0;
	Wed, 16 Oct 2024 09:59:57 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t10mJ-0000000BKKf-3mzI;
	Wed, 16 Oct 2024 09:57:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729072634;
	bh=uu+U0uRS375aOOnTfp2lQZkaCO+LNb9NDegcLXMQKmI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PS0AuZKYJrVCCKK3XrKXDQ2QvAaUaIhz6w/fnaVnD56CR3D7SwRzySU1u504gbkTM
	 DftKNAs0B+AjaTuQ8nBWKarGOSOG28HEjev+LaTX/vTpunXEsGVGk6JvgbTq7wSCqu
	 BNsrhQ670FUq+THX3CAVAoVAkQ60PXjjdo6TYdFRbk7ukUprFgiRpsTo8W/w4Y+hgu
	 KlEeKnHWRbL8tJKFxOJN0DhTfYfaq1XmhcFFzLZtcQZBWmmi3GmUgRc7c6zhKam96T
	 la2mItUZHVjK3JCjuUKUySZZ/RY91VyeOP+0wuP7tik/gcQJIUMOzqko4LKG0G+0gf
	 T+jqqL4Cb0LXQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3EF4517E124E;
	Wed, 16 Oct 2024 11:57:13 +0200 (CEST)
Message-ID: <ad000fdb-4474-49c4-9357-f23491231b07@collabora.com>
Date: Wed, 16 Oct 2024 11:57:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] clk: mediatek: Add drivers for MediaTek MT6735
 main clock and reset drivers
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Sam Shih <sam.shih@mediatek.com>,
 Daniel Golle <daniel@makrotopia.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Yassine Oudjana <y.oudjana@protonmail.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20241010132659.81606-1-y.oudjana@protonmail.com>
 <20241010132659.81606-3-y.oudjana@protonmail.com>
 <vn466kmo2uqrf6ap54oat2bipj4lsfri7asnsrptrlthva6j5m@dop6xit2pzjk>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <vn466kmo2uqrf6ap54oat2bipj4lsfri7asnsrptrlthva6j5m@dop6xit2pzjk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_025716_133312_EC9D89F1 
X-CRM114-Status: GOOD (  11.27  )
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

Il 16/10/24 11:28, Uwe Kleine-König ha scritto:
> Hello,
> 
> On Thu, Oct 10, 2024 at 04:26:57PM +0300, Yassine Oudjana wrote:
>> +static struct platform_driver clk_mt6735_apmixedsys = {
>> +	.probe = clk_mt6735_apmixed_probe,
>> +	.remove_new = clk_mt6735_apmixed_remove,
>> +	.driver = {
>> +		.name = "clk-mt6735-apmixedsys",
>> +		.of_match_table = of_match_mt6735_apmixedsys,
>> +	},
>> +};
> 
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers. Please just drop "_new".
> 

Oh wow, I didn't notice that during my review. Sorry about that.

Cheers,
Angelo

