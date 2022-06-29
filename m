Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D83C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 12:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Nlg+/A/2lG7nPrwCN9OcJJY+B+CLo/eWqxjs4IwRvk=; b=IY4Yi4E/jo47PPt92aBgzGcwUd
	6+rJCjC8z0+z6E6X1Akj+T9CJx9LqCeJGv4rlx/N5X8pp102ObPKyJFdm0NLRiMNxrTo1Wp03NveX
	OaMIBjDPzL3sSDyhllngyGylR6YRi3LleOWE0vz51JVCFEzdEA0wPWujd1S2toT5finqr9gKpsZmS
	HQAHHZx5d093E6qxFLFruEkRxJXoSKn7tbqvCQvoVQ6wZZ3WgTiKWASkuislCOiaxN+tGRvRMn6+S
	MjXR8c5gJV6R+QsR63VS631A7sOO6c6yBHjpIJes8skh6suBTAQXCCMf0sauvLth7YYEfVvbL3qi3
	4cUCSGpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6WYa-00BhZr-WF; Wed, 29 Jun 2022 12:12:33 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6WYN-00BhUV-Sq; Wed, 29 Jun 2022 12:12:21 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1656504731; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PGK/k9DeAdxOtwaTL/Ud+3uQ4Q+GGYlfiEYU7tvaIdpH0HgYd18h/U4BPUy2a1X/BTvVX+0Re+6i0KL8M+mptABBTC9TAKqGIEa88fdcxgSVd82I+693RbzLHKmur39aNxfYu5LBNu922V+EkH5cP9FGvnee6CObGNPVMwYPksQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1656504731; h=Content-Type:Content-Transfer-Encoding:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=7Nlg+/A/2lG7nPrwCN9OcJJY+B+CLo/eWqxjs4IwRvk=; 
	b=bLWrd8ZFSymnFvnBMogKwxmaM2t90gywSpTObFBzNgJlHdmUOqSc1srfQkKZA5nEHuHkc/ssjNXcxVuS59QaWr9DXToMvQ565+mPPhApYS1YwHFdAMdpM8ziz9KEY15TrZp6F4FCpK5PQM52jiLYAa+4+Ky18kGSDkOJ2W475no=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1656504731;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=7Nlg+/A/2lG7nPrwCN9OcJJY+B+CLo/eWqxjs4IwRvk=;
	b=SO/kyUlNlVYkl9JJB8ag+o5yHnDYD5i65OTv9i3S/z2DTnU5wCe6nAsOrlXV8Mlq
	J2tHohR+IX4gQWKvIgKjPiXUkUDNVTQg6xAuLaW/Z3XZLRQJuhGl7KHVonRv0L5qHPe
	d6L/blNyZCKH+dL14HyDzVRYooB3QlxJugCC4dMU=
Received: from [10.10.10.122] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1656504730341712.7546788738672; Wed, 29 Jun 2022 05:12:10 -0700 (PDT)
Message-ID: <e20a43f7-ed3e-83ef-a863-43cb11535ec2@arinc9.com>
Date: Wed, 29 Jun 2022 15:12:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/2] MIPS: dts: align gpio-key node names with dtschema
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Cercueil <paul@crapouillou.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20220624170740.66271-1-krzysztof.kozlowski@linaro.org>
 <20220624170740.66271-2-krzysztof.kozlowski@linaro.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20220624170740.66271-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_051219_996560_EC8DB0D4 
X-CRM114-Status: UNSURE (   6.56  )
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

On 24.06.2022 20:07, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects certain pattern
> (e.g. with key/button/switch).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Cheers.
Arınç

