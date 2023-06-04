Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDF6C77B73
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Jun 2023 07:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qjRmj6H2wGtXEr4zcHqv6N4BE15oNkHWiHsODHkVZ8U=; b=IBz0TJKYr+TVx3
	lpBmTn9Wp2EXyyRBe0XRLqsOsqPh382hJVdZ+LMm2ESSVCRobFQg40SSn03GJqI5D1kdnmsFYH5fy
	F3nq/CAst1GZhbXyyQhw2Mpw1hJt+rat8uHn/K3r8SU94QsXSojetTWV9XJLOSczVSkqkimX+RYn2
	8HiULQQWJUSseOVpR3vStCdXxGEwRrPSDMzObntlzWjvf17deE7xDOjSdak0YpWtcs1e2JVzP6L/0
	tkF23idxjdbucAuNx9WerwNUzon2f/7AqRgRtFNEFAJPSxUPmOPSHnn6RR1PDW+l+mEj1A+xvLjdU
	9S3AriZg/qmZQ4a6iMaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5hpA-00BW8A-0h;
	Sun, 04 Jun 2023 07:06:48 +0000
Received: from sender3-op-o19.zoho.com ([136.143.184.19])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5hp6-00BW7L-39;
	Sun, 04 Jun 2023 07:06:46 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1685862356; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MaeXxhj1EARya0kutlg6dIJYkGvmpgCYqa/kPfl4vcm0yNcbRqKEh6OijB7VfrTJx7K+j2+FQ/HCEpmGiOXYkWEmpTFY0Ib4hgSo79qt3ktGFDNjvnxzE5CXglSUD5Pvl0jT4SwkQcYd0TpBtOobpBwzgFIvT/ar2iOBTgcWUjo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1685862356; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=qjRmj6H2wGtXEr4zcHqv6N4BE15oNkHWiHsODHkVZ8U=; 
	b=maz+dZLgS0frMtmfzlLluHX6/IdSypC3Qw3fZu1UMJY6kMTynmEcf/KQZtOhrOxn4DY3dzVQB9qAtoFebfATQ6gSZx6jZnyaLYH2qmeW2xkI5phiEgUCzojAVeTn6oRf/C19XHTX/CG09t1Hwza7/rB0qvLMhh30DQuGBu6oAPg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1685862356;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=qjRmj6H2wGtXEr4zcHqv6N4BE15oNkHWiHsODHkVZ8U=;
	b=H+h1UxFcgBzwpFYKxhEbsuRxeEoR4mVInvzkmTnWHr4px0n60ohxbeqlIlo01z0a
	uqWwNgRF1zkTNJLbgOQI2OpEEJIzDibqsycjV+SZHv7/Q9JU4GgA8tWtxSKXUv4a3w/
	MEz1n85pEZOfr6KufyG5ujVEjMl5mDreBFQeDTNs=
Received: from [192.168.83.218] (62.74.60.162 [62.74.60.162]) by mx.zohomail.com
	with SMTPS id 1685862354320242.65733119193078; Sun, 4 Jun 2023 00:05:54 -0700 (PDT)
Message-ID: <08e9c220-cf15-4c61-f7f4-ad8073a3bcf7@arinc9.com>
Date: Sun, 4 Jun 2023 10:05:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH net-next 16/30] net: dsa: mt7530: move lowering port 5
 RGMII driving to mt7530_setup()
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-17-arinc.unal@arinc9.com>
 <20230522121532.86610-17-arinc.unal@arinc9.com>
 <20230526131739.5mso5y2d3ieelasf@skbuf>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230526131739.5mso5y2d3ieelasf@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_000645_071979_93BD3B6C 
X-CRM114-Status: GOOD (  13.56  )
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

On 26.05.2023 16:17, Vladimir Oltean wrote:
> On Mon, May 22, 2023 at 03:15:18PM +0300, arinc9.unal@gmail.com wrote:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> Move lowering Tx driving of rgmii on port 5 to right before lowering of Tx
>> driving of trgmii on port 6 on mt7530_setup().
>>
>> This way, the switch should consume less power regardless of port 5 being
>> used.
>>
>> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> ---
> 
> This patch assumes that the MAC has its TXC ticking even when PMCR_TX_EN
> is unset. Why would it do that?

It wouldn't. I'll drop this patch, thanks. For reference, PMCR_TX_EN 
(bit 14) for port 5 is also set in the case of PHY muxing with this code 
on mt7530_setup_port5() which doesn't use phylink.

		/* Setup the MAC by default for the cpu port */
		mt7530_write(priv, MT7530_PMCR_P(5), 0x56300);

0x56300 = 0101 0110 0011 0000 0000

Maybe I should make a patch to use the definitions on mt7530.h for this?

Arınç

