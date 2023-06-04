Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F23C77B73
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Jun 2023 08:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eXArTeMtajRJZgcIvygJEd3UMrFsbSRTNGeqgF3+G08=; b=PDUNToLb9YqnOT
	JorelbrRpfmviCERQqgb5ee40tdXDDg4jSfSDVv0hHuQLqHswI4cp64h98gpB2JCTXqwt34NOHP2Y
	T9db3PIOcxxGi4B9vfAheF/zDCwDof6fLdzUzqflv9oR7uuJKa+GRDQZ44c/bOW06XN/S4qwAE0Jo
	r22SjlJN11j980uWG0nYGsgJBy0yCoSgv8E6KxRrnaXO3q/Aqp6sHh21ejE3NLSi5PwEq1FV1ccWE
	k9ChwyPQ0vWWmYBZdGvdYTPkT/ilkF8c5zXtKDYph4I67MnJrG8rvZ8JqFRGLDc+2iG0s3d4WH0tb
	ODd7+Ryf4zhncYgOGkhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5jC0-00Bdca-3B;
	Sun, 04 Jun 2023 08:34:28 +0000
Received: from sender3-op-o18.zoho.com ([136.143.184.18])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5jBx-00BdbX-0p;
	Sun, 04 Jun 2023 08:34:26 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1685867627; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nKTLRYoNYP4cstW8Dk0eXjFqT7Jx1ch3Kp9VG7YHBd8N0pzN4X5CNAYoM44KTswLyUKUCZRciFus9ZSOdzcXP9IzJPPOsRTmI3Ik3jKdtsEAB63nkKeKpBC94zigYE9QXEaRVZOELr5CUVvPVQWWqjnRGY/hQwnPvYNTRBQ/o8U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1685867627; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=eXArTeMtajRJZgcIvygJEd3UMrFsbSRTNGeqgF3+G08=; 
	b=Ud9Wr0gh1LQ1H8fpG+Pop8dL3O5i77sXchuvDimITRkF7+0mFavfYX+hvjuOIpL9j1tEy62bXZB65PnAotNqUMQDYlV6nPTfpfd3M/JvEpNOeEV6VOb4+z48aSGjwp/y1Dm0I/TJhKk6L31UQ1cpANyMPEYGXOPwi6ah+pqbm2s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1685867627;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=eXArTeMtajRJZgcIvygJEd3UMrFsbSRTNGeqgF3+G08=;
	b=Lkc9JOkNAPSzz1pr6j8GRIyBBA49zNH5D6tfCFG9aUYELYY19nqYvEja20xMqUaG
	MLRnikrd7GoSGd3lq+gUcccxCoIWj5oY0lH7O50tpPtTYy9qAnYg6GRg4eQ0pyAdIbN
	afNLmH0o1DWowFk/dmO8CYy4DwKJaqaFcATYQ+M8=
Received: from [192.168.66.198] (178-147-169-233.haap.dm.cosmote.net [178.147.169.233]) by mx.zohomail.com
	with SMTPS id 1685867627229424.1337302219724; Sun, 4 Jun 2023 01:33:47 -0700 (PDT)
Message-ID: <7d07e930-56a7-3517-c560-c10291dbe92e@arinc9.com>
Date: Sun, 4 Jun 2023 11:33:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH net-next 26/30] net: dsa: mt7530: properly set
 MT7530_CPU_PORT
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-27-arinc.unal@arinc9.com>
 <20230522121532.86610-27-arinc.unal@arinc9.com>
 <20230526165548.d6ewov743orxviz3@skbuf>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230526165548.d6ewov743orxviz3@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_013425_328946_E2820FDE 
X-CRM114-Status: GOOD (  28.16  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 26.05.2023 19:55, Vladimir Oltean wrote:
> On Mon, May 22, 2023 at 03:15:28PM +0300, arinc9.unal@gmail.com wrote:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> The MT7530_CPU_PORT bits represent the CPU port to trap frames to for the
>> MT7530 switch. There are two issues with the current way of setting these
>> bits. ID_MT7530 which is for the standalone MT7530 switch is not included.
> 
> It's best to say in the commit title what the change does, rather than
> the equivalent of "here, this way is proper!". Commit titles should be
> uniquely identifiable, and "properly set MT7530_CPU_PORT" doesn't say a
> lot about how proper it is. It's enough to imagine a future person
> finding something else that's perfectible and writing another "net: dsa:
> mt7530: properly set MT7530_CPU_PORT" commit. Try to be less definitive
> and at the same time more specific.
> 
> If there are 2 issues, there should be 2 changes with individual titles
> which each describes what was wrong and how that was changed.

Got it, this is a bug fix for future devicetrees so I will send a 
2-patch patch series to net. First one sets the MT7530_CPU_PORT bit to 
the active CPU port, the other adds the ID_MT7530 check.

> 
>> When multiple CPU ports are being used, the trapped frames won't be
>> received when the DSA conduit interface, which the frames are supposed to
>> be trapped to, is down because it's not affine to any user port. This
>> requires the DSA conduit interface to be manually set up for the trapped
>> frames to be received.
>>
>> Address these issues by implementing ds->ops->master_state_change() on this
>> subdriver and setting the MT7530_CPU_PORT bits there. Introduce the
>> active_cpu_ports field to store the information of active CPU ports.
>> Correct the macros, MT7530_CPU_PORT is bits 4 through 6 of the register.
>>
>> Any frames set for trapping to CPU port will be trapped to the numerically
>> smallest CPU port which is affine to the DSA conduit interface that is set
>> up. To make the understatement obvious, the frames won't necessarily be
>> trapped to the CPU port the user port, which these frames are received
>> from, is affine to. This operation is only there to make sure the trapped
>> frames always reach the CPU.
>>
>> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> Co-developed-by: Vladimir Oltean <olteanv@gmail.com>
>> Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
> 
> A single Suggested-by: is fine. As a rule of thumb, I would use Co-developed-by
> when I'm working with a patch formally pre-formatted or committed by somebody else,
> that I've changed in a significant manner. Since all I did was to comment with
> a suggestion of how to handle this, and with a code snippet written in the email
> client to a patch of yours, I don't believe that's necessary here.

Will do, thanks.

Arınç

