Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36030C05027
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 08:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5XMRlovXSCuGXuMltBsIsFGA5zruLT3DBj1j9VAUF6k=; b=uwNMa9Ey7TVT0VwYb703wktx58
	6HGoMhrQgf11rgTOJb1PhxNLth9479wCj64xfeWLWoOJ3VX+IoDhbwNktklxnXqH+jxohqRvzvQpO
	1kjrdP8NuWxfjdqj5P5yZDvGcRyLWrU0rUGFinen3NrCZEQuS+ZEiXC9tP0KOK8FBVIqh7sQuiXoD
	pSkbglsdm7SeI92NigCdGN/7cO+wK5VOXZJZXWDNWAH9KrxnXS6ZwGRaa/caXPrLZtKkl8GyRgrCy
	9dBHUTQYs2z++rXN2LzToHesj2jsVXCA2igYRHVRJKp3jBIp/h4veKiDEc+CrgLGGayrcHndl6WOb
	udK9y+xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPfdr-00EZAO-To; Wed, 08 Feb 2023 08:17:23 +0000
Received: from sender4-op-o16.zoho.com ([136.143.188.16])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPfdh-00EZ8F-Hq; Wed, 08 Feb 2023 08:17:14 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1675844211; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IA9LHymsf2kSg6I071Hb83DQg01TPZM+LIewdhUMjLWfwU1qqq4a8z8swQdUeCoygFnSJFgeSn2N2UJAI86oaPgI0UW8wGOejBBygKo29lMAYucgTt9Y1qjki47j3GEKDMQvu7pVebUuc537UNbGioej2uoaFv9bJoUBk54g5Mg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1675844211; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=5XMRlovXSCuGXuMltBsIsFGA5zruLT3DBj1j9VAUF6k=; 
	b=CDq9HEJPGgM/Di1ILxpLU3nn8MBghxVo4dN4MaBH2LFY4FC40XIqAaNXPFZGkltZU5q2WokB4csgpGPy5lezzHX216VMuoLe9zJxK5/8IOGvFxaKp8RibPgoAsHLFgW+4WEqzzBf1dixrEUixj6bA1ej3mIEdZ66yYoESiFNYEg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1675844211;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=5XMRlovXSCuGXuMltBsIsFGA5zruLT3DBj1j9VAUF6k=;
	b=Mb3e9o5aU7Tix3zIANaex1qAELYT7iODUNNBDwQsQGbQB/V8osxiTZgSt6icXyFs
	DmFqdp5EO7SJKtMPBUyEJTdr6VD9GZkQNVoeKam4QQpATunZc0uP9kRUGW5h1eei/9Q
	+SJTZvBmlEKBPl4DmtwSCHNvOZkM6FRTeatIgX3g=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1675844209491114.13377348641097; Wed, 8 Feb 2023 00:16:49 -0800 (PST)
Message-ID: <093a3572-8910-5cff-c7d7-624b96eadb39@arinc9.com>
Date: Wed, 8 Feb 2023 11:16:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Aw: Re: [PATCH net v3 4/5] net: ethernet: mtk_eth_soc: drop
 generic vlan rx offload, only use DSA untagging
Content-Language: en-US
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Felix Fietkau <nbd@nbd.name>, netdev@vger.kernel.org,
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 erkin.bozoglu@xeront.com
References: <20221230073145.53386-1-nbd@nbd.name>
 <20221230073145.53386-4-nbd@nbd.name>
 <79506b27-d71a-c341-48fd-0e6d3a973f2e@arinc9.com>
 <trinity-e1125c6e-9b6c-4e34-82fd-d99d34661cb6-1675842373343@3c-app-gmx-bap61>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <trinity-e1125c6e-9b6c-4e34-82fd-d99d34661cb6-1675842373343@3c-app-gmx-bap61>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_001713_659395_39A2E10A 
X-CRM114-Status: UNSURE (   9.68  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 8.02.2023 10:46, Frank Wunderlich wrote:
> Hi,
> 
> just to confirm, my issues were not caused by this series, it was there before and now fixed with [1]
> 
> at least one issue arinc is mention is fixed with [2]

Actually, [2] fixes another issue that I didn't mention here. But all 
the issues I mentioned here is unrelated to this patch series, and I 
already have some patches to submit that will fix them, so this series 
is in the clear.

> 
> so please apply

Agreed.

Arınç

