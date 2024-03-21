Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EEF8C54E68
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Mar 2024 11:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yeLG59GiMIC7TpDQreGN4Aqa0n5VIMq4qD3CPUv15rQ=; b=RpkK7bTe3Y4no6
	kViMctYaBZc9e4XECIbAekZOWGnVxO/4EpwyFZ7euoCoKBV81UI+zH12hrwDS+lW/c94bJe9rx4jD
	/MuL3iIg9HLA+wCC4j1Ex3j5C8RKD3nqSaj0c/IGsO8+wPGFMu+uDXmis+MWgo7lNanQiltEcJzB5
	D8qc/1D6cZ7czjPITOI73fX4SZgTadj3zl9bHUszW1oUgY6Vg33La5MqNvSNJ0YsqZ0yPReyuMlfK
	Jjx4roYpfbVg4ZSjKNKqkNdebKUILlRxoZ8VjXmr02FUytp+zr44eCR5a0ld9STtLqcth+izJA4ho
	ABtg1Yc+GnoTMTaxIcpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnGcL-00000002p2n-3nET;
	Thu, 21 Mar 2024 11:29:53 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnGcH-00000002p07-0ncq;
	Thu, 21 Mar 2024 11:29:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4CA11C0005;
	Thu, 21 Mar 2024 11:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1711020585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yeLG59GiMIC7TpDQreGN4Aqa0n5VIMq4qD3CPUv15rQ=;
	b=c3AQ44u9VSNtVM9V18+m1ULhvTv/RSHzhf10eB/a8aBI7AJ54a9jcW7KiHA1INt545vWu9
	mFu9f1WZImT+SmLgniWC6K9MSNK7xKSiFVG85tmKts/qFnOpc6hQ89w7bz6eVg6hr7w1io
	i8jTOtYtZAgidSmML778xymJ15qWecwmqTc46ZMcOuzjsFHl56FoDXuqNUrf7geO60LRLQ
	XttjEBy95jFqiVwpSzUtTvjhTRnPRhK79DgOIgFpvkCg1fx5tJKjmvR/ttswS1tfoRmilP
	ApljAwD+kcDtte5h244c0O+3UqLM8kvIjZqr/vWhgD3Me/D6y/CGFY+LEXjJzw==
Message-ID: <7a7e6c46-03a4-48eb-9f46-84a05259cf26@arinc9.com>
Date: Thu, 21 Mar 2024 14:29:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 0/2] MT7530 DSA subdriver fix VLAN egress and
 handling of all link-local frames
To: Paolo Abeni <pabeni@redhat.com>, Daniel Golle <daniel@makrotopia.org>,
 DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20240314-b4-for-net-mt7530-fix-link-local-vlan-v2-0-7dbcf6429ba0@arinc9.com>
 <f6f064b8-efb2-4ab0-94f1-468d5d273d6e@arinc9.com>
 <49d23df1340f342822702de0439674ddbc5bff6f.camel@redhat.com>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <49d23df1340f342822702de0439674ddbc5bff6f.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_042949_390816_ABAF5E95 
X-CRM114-Status: UNSURE (   8.45  )
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
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, erkin.bozoglu@xeront.com, mithat.guner@xeront.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 21.03.2024 14:18, Paolo Abeni wrote:
> On Wed, 2024-03-20 at 19:41 +0300, Arınç ÜNAL wrote:
>> On 14.03.2024 12:33, Arınç ÜNAL via B4 Relay wrote:
>>> Hi.
>>>
>>> This patch series fixes the VLAN tag egress procedure for link-local
>>> frames, and fixes handling of all link-local frames.
>>>
>>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> For future memory: I think the SoB in the cover letter is not required,
> and is, at least to me, a bit confusing.
> 
> No action needed here, I'll keep this unmodified, but I suggest to omit
> it in future submission.

b4 puts it on the cover letter so it's not my doing.

Arınç

