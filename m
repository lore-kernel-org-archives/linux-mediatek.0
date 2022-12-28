Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0D4C3DA7D
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Dec 2022 16:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0qQmy/gCOzVgrAIXj5lLmb04lCKfUXufmvRoQe4l68=; b=ckwl2IS+iRdduzxDFWHruJG09x
	1HcantF/E+DcQlZeB6/vDXyMqW71l7ZK2/ETYhzIE2VZHFfCqxy3FTopOIJ/gCiK/lr5A4iyLKg01
	h8CuUtoLKAqVVOpaYg4yxzoZKFlYv0lqm766syLtu80ucRLTDwz5UXzbTVNm8Xg4Va2DM+fqzMl9O
	0SQIse8FgzF7mRSbH49hkxWcPVIIK9uMr8LIA9/WPWysAsk7VV8j0D3B2Ow9pqiFfkeKmudF3Rodh
	RazFkU2BBTYGohN2I+breBx/yhUj3KK7ROY2xTckGhuzt15i25rrbbZeYwoMseFfiQtvFvLoOUxpG
	LWJUNQmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAYrU-0069nO-MI; Wed, 28 Dec 2022 16:01:00 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAYrK-0069iE-Eu; Wed, 28 Dec 2022 16:00:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=e0qQmy/gCOzVgrAIXj5lLmb04lCKfUXufmvRoQe4l68=; b=JO++3ij9GFOyL2IZLVabE8UyCp
	biNevp+OBzIOtbu8YZHmJMZnT6FE/DjevIOCOMAgQRRdu4eh/N/M3hv2duY119JSNfNuWi0n82bjc
	NJWjkGRjt6HS6NcvmjztRPboKLFCGTBgNaMxKX+qtOA/3mNwNmhLzMuG4h+A78hIMKuw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pAYqy-000dv4-PF; Wed, 28 Dec 2022 17:00:28 +0100
Date: Wed, 28 Dec 2022 17:00:28 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Biao Huang =?utf-8?B?KOm7hOW9qik=?= <Biao.Huang@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"joabreu@synopsys.com" <joabreu@synopsys.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"edumazet@google.com" <edumazet@google.com>,
	"alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
	"mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"richardcochran@gmail.com" <richardcochran@gmail.com>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	Macpaul Lin =?utf-8?B?KOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v5 1/2] stmmac: dwmac-mediatek: enable 2ns delay only for
 special cases
Message-ID: <Y6xoHH6ETfbufX/a@lunn.ch>
References: <20221223015029.24978-1-biao.huang@mediatek.com>
 <20221223015029.24978-2-biao.huang@mediatek.com>
 <Y6W4vwJHG+6PI8fd@lunn.ch>
 <4a82aa5437e496e2b65b77ef08d7897a4b23f7e5.camel@mediatek.com>
 <Y6m7eNdWVL3IKFj2@lunn.ch>
 <5baa7c88716042421b0dd1d579c6aa70d253a546.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5baa7c88716042421b0dd1d579c6aa70d253a546.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_080054_697311_DE244CE4 
X-CRM114-Status: UNSURE (   9.01  )
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

> ************* MEDIATEK Confidentiality Notice ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including its
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or believe
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!

Please remove this. You are knowingly posting to a public mailing
list, which is publicly archived, etc.

      Andrew



