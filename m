Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85AD9C54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 11:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aa86F3RsZzaIkBDZNOJitzS9yBMCdSGYomvTqaakYqo=; b=LerXCW44tx9gY6su7XXdJcbA+5
	sZ7y8XGj6zxilq8VgUI2L/M5dYXcLaRLtxzpb/tgYulQ2WLMemQQGXT1h57i4Z+U0xIYLm+UhNTG8
	yZDRzQNpxvrtdHsweZDNkzXYoIo6rtSsO3KLz4nRof/Do8sN2eZoPWMbFuk0Adh8RgkYPCVwQACLc
	XHn105DTxwRSaxo4/tdpk7eMC2Wl7QE2ktvkWCFjOxRMZrVVaXoPr86g2bCbguaimw1mZ6E7PzOYp
	zKJ8t/8fr+72X9zjju7a4iJlfJ3iFkD5t3rG9aK34fe3xn26xBjsYNqUlScX0Aa1XODatFBx941EN
	ROfDo4QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oab2p-0039m3-4o; Tue, 20 Sep 2022 11:04:03 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oab2a-0039iY-3B; Tue, 20 Sep 2022 11:03:49 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1663671804; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=F3nCYnYOvh89RVFuiW6azZBK9xdjihOmZMYUFmlPW83qpBJzj3w6Rcr7RO7kqtdqN2aFNY7m2b0QOLkil+t+toSIplEJCN17PjOhaVxmEsZ4T52WNiK5pC1gJadR95Jlf/gSVFa/Q8VdkYd3twjtBF6AAOOpsGAoNf2WDMZCpNM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1663671804; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=aa86F3RsZzaIkBDZNOJitzS9yBMCdSGYomvTqaakYqo=; 
	b=FYhdODlZ98Z/RipItQxWc2sj/NSr+d+DoLDe/uHxn3e2PlGp7cpXmuWyqtQfpnxpN6d9ddCHa3k2Q/yB2TQxe0HnQPx35B2u6g9oxXNuNTMnlMaKaySbgN7XlxxIE2NaGEkVZ4siQvlK2p5XBpSekALVuBRDRrAizIDYlUBrIhM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1663671804;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=aa86F3RsZzaIkBDZNOJitzS9yBMCdSGYomvTqaakYqo=;
	b=MqM2BHFSLG1YnI5v/H1cPdR/9PPYtTYVsnhA8duT6nHnsUymbxRKGHsial+bqXcL
	US6ZHGhoMfd2RfASRUsNF5wL+S38B2w9owQVUJKOxzIT3CO9pW158zlpouUPF7okLGn
	buQRC16FXhe8hlrEMNW/2sQM5X6JsFOtXtjd7sY0=
Received: from [10.172.69.65] (93-42-111-99.ip86.fastwebnet.it [93.42.111.99]) by mx.zohomail.com
	with SMTPS id 1663671802790737.960471735429; Tue, 20 Sep 2022 04:03:22 -0700 (PDT)
Message-ID: <efce7270-13c1-79b0-12d3-66d4952e31fb@arinc9.com>
Date: Tue, 20 Sep 2022 14:03:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 net-next 00/10] dt-bindings and mt7621 devicetree
 changes
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>, erkin.bozoglu@xeront.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20220918134118.554813-1-arinc.unal@arinc9.com>
 <d0630c9e-22c6-48a8-35ed-024949782cbd@linaro.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <d0630c9e-22c6-48a8-35ed-024949782cbd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_040348_229600_CFFD0EC2 
X-CRM114-Status: GOOD (  11.23  )
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

On 19.09.2022 09:50, Krzysztof Kozlowski wrote:
> On 18/09/2022 15:41, Arınç ÜNAL wrote:
>> Hello there!
>>
>> This patch series removes old MediaTek bindings, improves mediatek,mt7530
>> and mt7621 memory controller bindings and improves mt7621 DTs.
>>
>> v3:
>> - Explain the mt7621 memory controller binding change in more details.
>> - Remove explaining the remaining DTC warnings from the patch log as there
>> are new schemas submitted for them.
> 
> Please always describe dependencies. Otherwise I am free to take memory
> controllers patch and I expect it will not hurt bisectability.

I believe it won't hurt bisectability. I only fix the warnings that I 
describe on the patch log, the warnings do not depend on any other patches.

Arınç

