Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F04BC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 20:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JO6TDZk1gNuJY9zhmyYqZtSQKRJFrNsjLtQ8d66Q7jI=; b=eT35cGNTE9y4bY
	MmkpJplj7ArmQex267HqLFckiRMTkwPMEdRcnrv8QzNnDYmpKusi0S7LU5iMw/u5uVbYr7FxC3gQi
	RtqfL/sq4cZbMmWEKv/GFsz12fC6fV7aZY38ngLXlPlMCal8ZHOqKk/eXhbmYqv9lIFR3CXeCZYeW
	Zx6s1VJW47ZVGtA80VCHmiJaythZhUZb75QvCotxqFjTTvQjAkGIfz5z2aeQ6bDI6c3XW2Xj1fgYa
	GzBCV1/iElbfRZCbCbqOMRikmon1kuicsOUxo84+flS05MCCS9mf66gKqUwvkZHt1INU2pqFhNURl
	4WhCE0mNB631r11W3APA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdGvh-003KsW-31;
	Fri, 17 Mar 2023 20:44:01 +0000
Received: from sender3-op-o18.zoho.com ([136.143.184.18])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdGve-003Ks0-37;
	Fri, 17 Mar 2023 20:44:00 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1679085824; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Y582FsUn/rvAl46zKQ+vg4iZzkvmjmgeLYIeb6p6N+RCtmnykIySNbxgvrY3+keXPRSCUvjQUT9gnZu36OP3HktHEexvoRisyL318F1H6GZbOF/Pr+6Cr+r6WBMwl6FPkuU2QPQTXppwxx74rO1530KPDA52+5ZQklU5zH0gO1o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1679085824; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=JO6TDZk1gNuJY9zhmyYqZtSQKRJFrNsjLtQ8d66Q7jI=; 
	b=astSoG+O232junYv52KbuDV3+OERfLYkkFL3VzhfERG4UhxYbBhgG/gBVNXhyKEsZ/i6RpRh1pAfSr7auQ9y9y0JJkucK+boniqrR1cfuUSoHficKFaagGLXBIxic20Aw1n+qZO/s0iHDVe0ts/zBsETtk57BOl0apylvZCD16E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1679085824;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=JO6TDZk1gNuJY9zhmyYqZtSQKRJFrNsjLtQ8d66Q7jI=;
	b=DkOoJ1RNcWXF0uQERlD1A2iMK2YQxgwdrzUfevcgasCEU6QgVAXqk29bIC6dT94v
	p6woSXG3i/DgvBxuEQADeby3gGhRk2PtPwWw9RXN3JDD+euf+I9Tydgz82LHI9dL6Ya
	Uagm474kthEqGGrrCh8hUtXYHwi5h9yx7kkeLWOk=
Received: from [10.10.10.3] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 1679085823481812.3752234065518; Fri, 17 Mar 2023 13:43:43 -0700 (PDT)
Message-ID: <d7cc6264-48e1-4aab-ef6a-a106ffaee87e@arinc9.com>
Date: Fri, 17 Mar 2023 23:43:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 09/21] dt-bindings: pinctrl: ralink: {mt7620,mt7621}:
 rename to mediatek
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20230313205921.35342-1-arinc.unal@arinc9.com>
 <20230313205921.35342-10-arinc.unal@arinc9.com>
 <20230317185810.GA2619692-robh@kernel.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230317185810.GA2619692-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_134359_061609_15EF9BFF 
X-CRM114-Status: GOOD (  11.86  )
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
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Daniel Santos <daniel.santos@pobox.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, erkin.bozoglu@xeront.com, =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Andy Teng <andy.teng@mediatek.com>, Hui Liu <hui.liu@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Del Regno <angelogioacchino.delregno@collabora.com>, linux-gpio@vger.kernel.org, Zhiyong Tao <zhiyong.tao@mediatek.com>, Sean Wang <sean.wang@kernel.org>, Daniel Golle <daniel@makrotopia.org>, William Dean <williamsukatube@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 17.03.2023 21:58, Rob Herring wrote:
> On Mon, Mar 13, 2023 at 11:59:09PM +0300, arinc9.unal@gmail.com wrote:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> Rename schemas of pin controllers for MediaTek MT7620 and MT7621 SoCs to be
>> on par with other pin controllers for MediaTek SoCs.
>>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> ---
>>
>> I'm not changing the compatible string. I asked if it's accepted to do this
>> whilst keeping the compatible string but haven't received a response.
> 
> It's fine with me though I'd somewhat rather keep the filename matching
> the compatible. Either way:
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

I prefer to do this so I'm going to keep it as is. Thanks for being OK 
with either way.

Arınç

