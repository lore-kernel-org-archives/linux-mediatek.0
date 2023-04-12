Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91040C77B6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 06:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LEPnkj3K1wy0jHie1VObqUDSJC9LSEQ73vz8Z00XgD0=; b=LW7gDU8wdmu2EW
	dog6Sfsi707nxU81uyrzob4mFRM5cXCD6L6VRlyu1ySktL/QZzyvXgoTLVI3y8coNTja1q1FUsvKI
	rCb7YuCWQcUnv6exbgJcRZUF+/5oE8HA0Smwtxg24u4uCeqtbSCE+vBVaEX6v2znTJj5skV4REuh6
	N/adkHj8AoCXIE0lW8N+40R4Dr3rKLVU42C3jMm6a09nYHkpt76eVIhAXwaRbs9Aw1/1CarVDqZuh
	Q5Lhz1yHsISCF4yH9Ewuia1qa7ysDPcBxSOW/9DwidXZ7/yirMmEE8kGojHBQv0JE18FpXSr73tHf
	zxB6NF9o+ugMyMcYPV4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmU5b-001yqn-0p;
	Wed, 12 Apr 2023 06:36:19 +0000
Received: from sender3-op-o17.zoho.com ([136.143.184.17])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmU5X-001yps-1n;
	Wed, 12 Apr 2023 06:36:16 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1681281325; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NzNsS2/s3ggnwdPWs1LT1U+940QyJQEdBkHx0dCsnjPz1KBi7d4NTZAasmT3tLnPa+Am25P2OwTCyCAKqYe+YMlHPqVRLX61kNWdj+61YxabCcwQz1GsRUAYHW8Q4Hzb47Y+JeugfaNS0TgjKa1iLS0qw+I0w6/RcVfJxqyG8dY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1681281325; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=LEPnkj3K1wy0jHie1VObqUDSJC9LSEQ73vz8Z00XgD0=; 
	b=NFPMMlxwi55dTwuno7s0louUyiFElGrer1GCtOs4Z1b0v3l6RfLjXZ3HJx+igRLHwDDcpoqikt/4B8E2Llb7oFwMarCR/xkytcY+bisyF1+JSVwj0cOBkowX0tcaYulepKxcYPY/PlXf46OI9v9DdB2wpPpG51ZJYY1dZe+IWZ4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1681281325;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=LEPnkj3K1wy0jHie1VObqUDSJC9LSEQ73vz8Z00XgD0=;
	b=NNUBrGUY6C7wCC+qOZuWYV6rK5n64CAhWSXych0nyGxMe8E5e8P78jdNgvtPnG2P
	5i5rRZTTVGzyNA3Iu4nLT02MLqYiGwSnGFecbKpRUnIMKCzLflx1FipEtnOjChH9jr4
	pUcT9O+5qiginxdpOjCjKPOcDFRhbXkJZLrRnueM=
Received: from [10.10.10.3] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 1681281322643174.6545830352395; Tue, 11 Apr 2023 23:35:22 -0700 (PDT)
Message-ID: <781d4288-f7c6-f3e6-a132-77bff41880c7@arinc9.com>
Date: Wed, 12 Apr 2023 09:35:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v2 net-next 06/14] net: dsa: mt7530: do not set CPU
 port interfaces to PHY_INTERFACE_MODE_NA
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
References: <20230407134626.47928-1-arinc.unal@arinc9.com>
 <20230407134626.47928-7-arinc.unal@arinc9.com>
 <20230411145416.kovyu3wb3dhtgbl4@skbuf>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230411145416.kovyu3wb3dhtgbl4@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_233615_646877_2A9700EF 
X-CRM114-Status: GOOD (  12.64  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Richard van Schagen <vschagen@cs.com>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, erkin.bozoglu@xeront.com, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 11.04.2023 17:54, Vladimir Oltean wrote:
> On Fri, Apr 07, 2023 at 04:46:18PM +0300, arinc9.unal@gmail.com wrote:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> There is no need to set priv->p5_interface and priv->p6_interface to
>> PHY_INTERFACE_MODE_NA on mt7530_setup() and mt7531_setup().
>>
>> As Vladimir explained, in include/linux/phy.h we have:
>>
>> Therefore, do not put 0 into a variable containing 0.
> 
> The explanation is unnecessarily long. I only provided it to make sure
> you understand.

I don't see a problem with a bit of verbosity on the patch log. It 
should make the reader understand the code path better.

Arınç

