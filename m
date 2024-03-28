Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A81C54E64
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Mar 2024 14:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JYWVfKrJL6hIDcIva1S4oog1NNIiLD3QDC7pM2Qb8is=; b=qIyo7oe73ofr+c6q/OUfcH4LWe
	uYuWXGbEpBQk6WED5ZFjlEYBhkws8aLrdCI+yJrf+Zd6i/3K0NJ9IBQqAoyexZDnut3Lbhv333RO8
	jzasD3y+Bz3HjxlrizufJj5t+/rf3fGCHEknV2dRF1L+4NyyW12ULdQREyKpYcSARoNTmt+NfL3o/
	nYxZZKDrQmR6X5nCjByrcqkgkyPg1M7HjC7NaVtQXatOUUGwkSex/2DIpECu5LYqQhQ5cvkifBP4J
	arRvvyGuHNfSt2CoA2ztghftU0WNlJsggKXwUjTXIMRa0QaSCh5wnkIJ5QsIVuHcKgDEzbkVNhqT0
	Jg96WedQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpqnI-0000000EKW0-46OU;
	Thu, 28 Mar 2024 14:31:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpqnG-0000000EKV5-1Abt;
	Thu, 28 Mar 2024 14:31:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JYWVfKrJL6hIDcIva1S4oog1NNIiLD3QDC7pM2Qb8is=; b=NlbakUfQ3mFHIxlRMx98xHRLb1
	hGpd+BrMgrjQ0hIqZVLAfZboSEz88vkrEV22aBdsudMpjRvxjARCnG23BG5kdjYHgJZlmVNMgL42p
	/AGi7Y2pmYq5D1dfLV4A6gHUbafAyFq1zEpj7u0yWpYPz99YJqWlmUuPLAMH0MC5dn0ayFwXe51Uj
	NvgUkXRR2QvPO8PA0Q2U7wUwRosf66N8AkBxWDdK3gxGw06qK2t8Wx1rd2iY055SbAdehcNWYUkB3
	8zAWkVPesyqZlPENnU6L29f7u9DsSzSe7iRtJSdBwVQNOioCaELZfZNvd94zEQgExp8lOm9TsdGfL
	Ep4fpHkA==;
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpqn4-000000010e0-1Yfi;
	Thu, 28 Mar 2024 14:31:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 929AA1BF209;
	Thu, 28 Mar 2024 14:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1711636293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JYWVfKrJL6hIDcIva1S4oog1NNIiLD3QDC7pM2Qb8is=;
	b=Pk5BsZ+oC8umyAEWskhtsC4o3UVgPuxV33dBHjdmkV48Q1leAPEte5DlbDEamFNxydrzOp
	K/1vy4rpS7l0pgYrad767/QoneFn/6VKcDt09e4u8NXx07dYykjYAeVKxOOPeIH0cwsR2B
	grH2IpBhu+p9gfsGU/FzPRHcCVVTh20+jzya7zbWH5VTjbJEGAP355OliVszhi5bZW+U+6
	1JaagfzZQ9mxtzhUK6NzGdrsGkPVjFKzBdfZGsPN6Zkbt9SWH41wXTQLw18YpvlMjGFq0d
	tZ9vufrtLF2AoKDLLZB9WNnsoikdl9RJvRJQZn5NnTFyaRC+tSZGAstjlrIkyw==
Message-ID: <7695599e-3f74-4901-a9a4-adbbc79e1eff@arinc9.com>
Date: Thu, 28 Mar 2024 17:31:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 2/2] net: dsa: mt7530: fix disabling EEE on failure
 on MT7531 and MT7988
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Paolo Abeni <pabeni@redhat.com>, Daniel Golle <daniel@makrotopia.org>,
 DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Bartel Eerdekens <bartel.eerdekens@constell8.be>, mithat.guner@xeront.com,
 erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240321-for-net-mt7530-fix-eee-for-mt7531-mt7988-v2-0-9af9d5041bfe@arinc9.com>
 <20240321-for-net-mt7530-fix-eee-for-mt7531-mt7988-v2-2-9af9d5041bfe@arinc9.com>
 <799572b672ea8b4756236b14068aef7c8fa726a6.camel@redhat.com>
 <d65f4c45-e616-4157-a769-c285cbad575c@arinc9.com>
 <ZgRAQFfKWR1skCMo@shell.armlinux.org.uk>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <ZgRAQFfKWR1skCMo@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_143141_790251_33B958DD 
X-CRM114-Status: GOOD (  25.27  )
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

On 27.03.2024 18:50, Russell King (Oracle) wrote:
> On Tue, Mar 26, 2024 at 12:19:40PM +0300, Arınç ÜNAL wrote:
>> Whether a problem would happen in practice depends on when phy_init_eee()
>> fails, meaning it returns a negative non-zero code. I requested Russell to
>> review this patch to shed light on when phy_init_eee() would return a
>> negative non-zero code so we have an idea whether this patch actually fixes
>> a problem.
> 
> Urgh, so I need to read the code and report back?
> 
> Well, looking at phy_init_eee(), it could return a negative vallue when:
> 
> 1. phydev->drv is NULL
> 2. if genphy_c45_eee_is_active() returns negative
> 3. if genphy_c45_eee_is_active() returns zero, it returns
>     -EPROTONOSUPPORT
> 4. if phy_set_bits_mmd() fails (e.g. communication error with the PHY)
> 
> If we then look at genphy_c45_eee_is_active(), then:
> 
> genphy_c45_read_eee_adv() and genphy_c45_read_eee_lpa() propagate their
> non-zero return values, otherwise this function returns zero or positive
> integer.
> 
> If we then look at genphy_c45_read_eee_adv(), then a failure of
> phy_read_mmd() would cause a negative value to be returned.
> 
> Looking at genphy_c45_read_eee_lpa(), the same is true.
> 
> So, it can be summarised as:
> 
> - phydev->drv is NULL
> - there is a communication error accessing the PHY
> - EEE is not active
> 
> otherwise, it returns zero on success.
> 
> If one wishes to determine whether an error occurred vs EEE not being
> supported through negotiation for the negotiated speed, if it returns
> -EPROTONOSUPPORT in the latter case. Other error codes mean either the
> driver has been unloaded or communication error.
> 
> This has been expertly determined by reading the code, which only a
> phylib maintainer has the capability of doing. Thank you for using this
> service.

Thanks for explaining it. I believe determining enabling/disabling EEE on
the switch MAC by polling the PHY, when one of the last two conditions in
your summary is true, wouldn't result in having EEE enabled. And it seems
to me that if phydev->drv is NULL, there would be bigger problems with the
device. So I think it'll be more fitting to submit this patch to net-next.

Arınç

