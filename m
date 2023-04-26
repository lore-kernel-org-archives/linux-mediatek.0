Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B76C77B78
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Apr 2023 17:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RT/owfhTxJeu2QuP6rH9YfYIno23f9H7utc/KQpP2W4=; b=Y3ZRKB18MteC0J
	8bgi12+XbN8VTJCmlP/TifBh6eFUE6bjpSf0qJzzao6JOfst1P+RkxjMntHEKCUqYU17ELVm8Pzce
	E1PFdmD04KCzAo6/kFXA1Kd2cgMCrZKAlJPr6Qgm82GhvM03t7ALAMMLFCRY1LWOd6kfLVE1EomUN
	0ny3ZC+62+N/39uzVJaCr4KrzHmy/iP9OwxpfTQGeMz68T6auuR9eC7/JtpfGWH/G0MuL9Rfe8wJX
	1AoCOV7RZsCwsypZ9jQH/zGLRJW5jpi9ILt87FjSkYQfMBymc5cavZ+UYr6KHFZ1HTyoC31OW0Ye7
	inxo0/fFZOj26mMqF/Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1priua-004WYO-2t;
	Wed, 26 Apr 2023 17:26:36 +0000
Received: from sender3-op-o19.zoho.com ([136.143.184.19])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1priuX-004WXc-2p;
	Wed, 26 Apr 2023 17:26:35 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1682529964; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kaxaqzuagDTmsGBF7wJshv8q1kJ8czNH1mwRTjieorUoa+YQQ2NiMBzZ8binM9p4cipWt36bZfg2FP8qPTYIhDSih5ztveZJTvQXwyHSoth9R+vxMto+e/4iBp76k8N+nNlaz89BHulZwOPlpKQbvlugki1kMIBsTSTW0jBXkqI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1682529964; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=RT/owfhTxJeu2QuP6rH9YfYIno23f9H7utc/KQpP2W4=; 
	b=CqLik37rZc5tAltgBP7aBXSLtCk5LDYyb3QtukTCLcOyvFYPZEx9L8Tg+uqQCV1RpJAjDB5cVXUqHsWu8YjKS/SvlcQND9eCbu/64JVMCQ2NdLRO5tdPTwb/SSrsdgyq548ZwijLF4Qw30j2oxDE1rgaCw89CfdPthAl3QZYVYA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1682529964;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=RT/owfhTxJeu2QuP6rH9YfYIno23f9H7utc/KQpP2W4=;
	b=Fo0RE1Cci2Ywwtk/6uu30TkSUE3fZnQFb47MADPf+iIr2YYNV8J3GsyDDhCwfvYU
	bK1BvGatid0y/QCgjXexl8UvWMeu5pEp52dLACqzoVAoT8vsTIgPdJhOoc1ikInsyjZ
	79E9JdPSWNiQxDRAgnRMG1eA1HDEsEGzd1LioZjY=
Received: from [10.10.10.3] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 1682529963036952.8466533209543; Wed, 26 Apr 2023 10:26:03 -0700 (PDT)
Message-ID: <61ea49b7-8a04-214d-ef02-3ef6181619e9@arinc9.com>
Date: Wed, 26 Apr 2023 20:25:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [net v2] net: ethernet: mtk_eth_soc: drop generic vlan rx
 offload, only use DSA untagging
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20230426172153.8352-1-linux@fw-web.de>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230426172153.8352-1-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_102633_970251_5A711D61 
X-CRM114-Status: GOOD (  14.99  )
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
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>, stable@vger.kernel.org, Mark Lee <Mark-MC.Lee@mediatek.com>, Eric Dumazet <edumazet@google.com>, linux-arm-kernel@lists.infradead.org, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 26/04/2023 20:21, Frank Wunderlich wrote:
> From: Felix Fietkau <nbd@nbd.name>
> 
> Through testing I found out that hardware vlan rx offload support seems to
> have some hardware issues. At least when using multiple MACs and when
> receiving tagged packets on the secondary MAC, the hardware can sometimes
> start to emit wrong tags on the first MAC as well.
> 
> In order to avoid such issues, drop the feature configuration and use
> the offload feature only for DSA hardware untagging on MT7621/MT7622
> devices where this feature works properly.
> 
> Fixes: 08666cbb7dd5 ("net: ethernet: mtk_eth_soc: add support for configuring vlan rx offload")
> Tested-by: Frank Wunderlich <frank-w@public-files.de>
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
> v2:
> - changed commit message to drop "only one MAC used" phrase based on
>    Arincs comments
> - fixed too long line in commit description and add empty line after
>    declaration
> - add fixes tag
> 
> used felix Patch as base and ported up to 6.3-rc6
> 
> it basicly reverts changes from vladimirs patch
> 
> 1a3245fe0cf8 net: ethernet: mtk_eth_soc: fix DSA TX tag hwaccel for switch port 0
> 
> tested this on bananapi-r3 on non-dsa gmac1 and dsa eth0 (wan).
> on both vlan is working, but maybe it breaks HW-vlan-untagging

I'm confused by this. What is HW-vlan-untagging, and which SoCs do you 
think this patch would break this feature? How can I utilise this 
feature on Linux so I can confirm whether it works or not?

Arınç

