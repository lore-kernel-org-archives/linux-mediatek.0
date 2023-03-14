Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01A6C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Mar 2023 21:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dq3Zzhtvt0x5MEoRcRnMrw4bf9BbRLcVhg9nNb0HqcA=; b=oLQrf2GtYs5YjQ
	d9k1UZWJi3eb90EUNlQ/LHjlpHbKdlaK+LrF9ZH7QWEKzKVP7oCy8Tf5Qo5k9Vu9r1/9SREwZDuOe
	bBv2HAtuTqLX+l+3ROG21D07XleVs0xnq1wn8EDul9P5m5sbDp0yImvCo1ot8H76aEzK8rSbqaikw
	2ifsc85oCAfgSYD8X0hrcUtm493XF+hqvBXvSy5J41z7xYXHws36jIcBVVNFLSvBtCEDuQu7yaCCV
	CKINe82RT6sDoWQbgWt+VtPy0B/5QQLK2HrG7ObWXtTSqWF08lJ23GisU/vItCJ8ThxMs4+j1hSlM
	dQWiUssMaIwYGd0NfAog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcBlS-00BXgB-0j;
	Tue, 14 Mar 2023 21:00:58 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcBlK-00BXfH-1j;
	Tue, 14 Mar 2023 21:00:52 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1678827590; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kpDDPDRhSHp/DrdqP6wSfVHIDQTg983v/pQBtxiUN1rM4m5sXuoL+Rc/G6TJsPiKj/M42tTSVSUUWC3INJFe3jpK/+CZgekS9JVjcKhA7h2w9agITvWj2BgxCbujb1CLNl9bZDfxaIizvHYoNMVdPqV/MU5AtK2O+Pjbt7JNNxI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1678827590; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=dq3Zzhtvt0x5MEoRcRnMrw4bf9BbRLcVhg9nNb0HqcA=; 
	b=afjnuVnFARu1wi7qOZ4cR1Scfg5iDnE1ozu5fsaYY/2InCFb9GqNqiNv04r14Q7o7sNBtWws5fWzbW4ffmI+lEjnYtwltRwV/SFEqi0490vSVdRBuqZgw69KpWJ0nQnhIBvhMcqKfoPm8lcGazudCOjKQMDOHCU13PM1LSzOulE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1678827590;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=dq3Zzhtvt0x5MEoRcRnMrw4bf9BbRLcVhg9nNb0HqcA=;
	b=Ylm9ClfyaO1efhNdC4GfE2cZmfEHGuWp+yl3+Yr1aLsHR9DNriUtl/x4oBE0DP8s
	SROo6P8OkwvxpkSmTAcfSrY55zuzKMFUfhJdkyDY8xIc5/nX2kq4NJDRLciXvSgDEvq
	RmIM/v1oTCuudJdZUQseSY+bhvptrWR0eZ372+mg=
Received: from [10.10.10.3] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 1678827588900188.13596216997087; Tue, 14 Mar 2023 13:59:48 -0700 (PDT)
Message-ID: <3e3e6a1e-61ba-a6e8-5503-258fb8e949bb@arinc9.com>
Date: Tue, 14 Mar 2023 23:59:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH net-next v13 11/16] net: dsa: mt7530: use external PCS
 driver
To: Vladimir Oltean <vladimir.oltean@nxp.com>
References: <cover.1678357225.git.daniel@makrotopia.org>
 <2ac2ee40d3b0e705461b50613fda6a7edfdbc4b3.1678357225.git.daniel@makrotopia.org>
 <e99cc7d1-554d-5d4d-e69a-a38ded02bb08@arinc9.com>
 <ZBCyqdfaeF/q8oZr@makrotopia.org>
 <c07651cd-27b4-5ba4-8116-398522327d27@arinc9.com>
 <20230314195322.tsciinumrxtw64o5@skbuf>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230314195322.tsciinumrxtw64o5@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_140050_656145_414BAA6E 
X-CRM114-Status: GOOD (  11.39  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>, Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Couzens <lynxis@fe80.eu>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, =?UTF-8?Q?Bj=c3=b8rn_Mork?= <bjorn@mork.no>, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 14/03/2023 22:53, Vladimir Oltean wrote:
> On Tue, Mar 14, 2023 at 09:21:40PM +0300, Arınç ÜNAL wrote:
>> I was going to send a mail to netdev mailing list to ask for opinions
>> whether we should rename the mt7530 DSA driver to mt753x and rename these
>> functions you mentioned to mt753x so it's crystal clear what code is for
>> what hardware. Now that we glossed over it here, I guess I can ask it here
>> instead.
> 
> My 2 cents - make your first 100 useful commits on this driver, which at
> the very least produce a change in the compiled output, and then go on a
> renaming spree as much as you want.

Look, I don't ask for renaming just for the sake of renaming things. I 
see a benefit which would make things clearer.

If you rather mean to, know the driver very well, by saying do 100 
useful commits on the driver beforehand, that makes sense. But I think 
I'm capable of managing this. I've got the time and energy.

Arınç

