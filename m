Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA4EC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 16:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JGA1eVBYRYA82rFwbA+wuQ2+UVMjWs6AhpdYQG+YBbA=; b=XRdkpC6JJlSZes
	ZcDu2Ac5FjTREb0LRYUWKgNMVhaBxb/UDF3m0G+G+1oTxIcgjv16c6lsDN1d2VTCDnmi7BXTyXDD0
	pW5TV4Z6cyesXJtFELyIqNTCvGOlh9bwj/k8LKmtkcch+yqB3SM5r/xpjH3UFUyzH/y08FfMOkiS3
	Wlut+LvMXubSAYerzmvC4534KlGgSlbBwNxsdsDORnwrKO8qfl/fItZBZmjwJ6Lh1ncXhrHdfAMhU
	EL1qEw0mjFrRCa2aEVprYrzaiaJQ/kSwDmWJR56FRCSGILqtwohDZDA5rAT6pKzF6pIpK6mkdvR6m
	SmVM33JGd2DQaxdtsEOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncV0D-00D3y2-0Y; Thu, 07 Apr 2022 16:28:57 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncUPY-00CpJ5-W7; Thu, 07 Apr 2022 15:51:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=MWMYUvxxQQl/e+7TuhjQmN5IAfBuJmlz8AgqJFrsH/c=; b=yds/9JiPwd9ffHz9HM5fkQNGzw
 2hOLVRjwJBMDkFbVnaIQ2EZBWtYRgvuHQmCmu3LQQY0X77m23scuTVKQgEfeQN1BIjXMh+KsVZ5vD
 DYoIjmHbQlZWXMl3sy0ZvMhVNZbvomXzEyXUYF31HCFLQnQNkvvHY/wW0d7K/NmM2Jkc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1ncUPO-00Efak-3f; Thu, 07 Apr 2022 17:50:54 +0200
Date: Thu, 7 Apr 2022 17:50:54 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Felix Fietkau <nbd@nbd.name>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 netdev@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/14] dt-bindings: arm: mediatek: document WED
 binding for MT7622
Message-ID: <Yk8IXno6sjkHVf4g@lunn.ch>
References: <20220405195755.10817-1-nbd@nbd.name>
 <20220405195755.10817-5-nbd@nbd.name>
 <d0bffa9a-0ea6-0f59-06b2-7eef3c746de1@linaro.org>
 <e3ea7381-87e3-99e1-2277-80835ec42f15@nbd.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e3ea7381-87e3-99e1-2277-80835ec42f15@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_085105_091180_EA865239 
X-CRM114-Status: UNSURE (   8.66  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> > Isn't this a network offload engine? If yes, then probably it should be
> > in "net/".
> It's not a network offload engine by itself. It's a SoC component that
> connects to the offload engine and controls a MTK PCIe WLAN device,
> intercepting interrupts and DMA rings in order to be able to inject packets
> coming in from the offload engine.

Hi Felix

Maybe turn the question around. Can it be used for something other
than networking? If not, then somewhere under net seems reasonable.

     Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
