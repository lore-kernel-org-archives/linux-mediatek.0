Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8892C38A02
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 23:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oAcdrv+7UwLKoOnRvgAYa6GgvecrV3xSM/H+EGAaz8M=; b=kRg7PqcUi8Rt9whB5iZhGdcqgK
	5qtD33LfnKLmT0V/uc/sroBypAZ0hs5lh1MAXrcUHJxtGFJAS7LELvjoWWJNpmGQmd5VNFDeH7iRI
	STsAm4/0q2RfAH4FSuQt/xFBz4a2mVjn2RUO4zGPNGOA88SBl5aieZxziisZj1KoYEvycJV/upfAY
	yYGwaq4jhcCxsmris+fXquumjWzbn2WR1Z9DJ7wh9nflo18IQtDUh0S0Vc/p00jD7vM8410Vc9N9u
	ulp0s13Ce8uAdZuwR/U312J/4RrU4QUqBrUc/q8rWxEpZ2QEBAF+CkUdmzPekTFz9OOIQFFTuSTO1
	dUcxsGfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooZ4C-003ICf-VD; Fri, 28 Oct 2022 23:47:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooZ42-003IAn-Dk; Fri, 28 Oct 2022 23:47:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 33E9962AE5;
	Fri, 28 Oct 2022 23:47:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16871C433D6;
	Fri, 28 Oct 2022 23:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667000819;
	bh=hB5fE6S2HQ2dHPl7HVJSxxHZcSmMmavYRsA3XNFzfwM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c+IMnUh0cw/5I9OwpiVH/87RYGhRzQcEY3LqtjiL4TOTD/mWeymZWRyBuQhoFftq4
	 SjAHCsDgyk0WIlHpVUZ4nvg44DzjbYR7iRq/t+1oNpSyDbD104TZ3O1HLnEJ2fAGC1
	 +Sj3j/EbDe/kJLer2o+/9kfm9BvS9V8yuCScICsdAWBac9MgrfzjHbXqnvuLs9sbVJ
	 OdZhjO0oMDHvnOhqrS+HFTFD+yONBWYSSSkYRRhOHPr/xY0hXLmOAG7kznEuNmWj6k
	 O0jDOMiNfIreJW3/wo7WTSlRliOUEGYknlJvHW5xZx9yezMPuyNoY5jYk0BFCRfn4o
	 w7szPXFkQdumg==
Message-ID: <d5bb33db-5c26-fbfa-0d12-46ca41d80785@kernel.org>
Date: Fri, 28 Oct 2022 19:46:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 10/12] dt-bindings: mediatek: mt8188: add audio afe
 document
Content-Language: en-US
To: =?UTF-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>,
 "robh@kernel.org" <robh@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <20220930145701.18790-1-trevor.wu@mediatek.com>
 <20220930145701.18790-11-trevor.wu@mediatek.com>
 <166457526101.1112313.13428811477972046652.robh@kernel.org>
 <ac5d872ac8dfa40bd5238589f85d78ad6ba6d706.camel@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <ac5d872ac8dfa40bd5238589f85d78ad6ba6d706.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_164702_537893_9BF44955 
X-CRM114-Status: UNSURE (   9.70  )
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

On 04/10/2022 23:57, Trevor Wu (吳文良) wrote:
>> date:
>>
>> pip3 install dtschema --upgrade
>>
>> Please check and re-submit.
>>
> 
> After upgrading dtschema, I can see the problem.
> I will correct it in V2.

Correct also cc list.


Best regards,
Krzysztof


