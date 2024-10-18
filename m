Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 096E2D3DEA4
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 18:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rBbNs22uQervbwsUW0laACDJM6LC5rVXIqgu0VnFg1I=; b=KXJgHOC17ptIy0IfgLzP53c39K
	hozKrVd7nFu7pcoLf4LIkRPpadZHHoWbqs3H48f4J+Qze1v0wrbGZKj7YOCZmoYyCGQ+c7cO2QTe8
	khs/aGESsNpn99ExRxJetXUm83erbPzYEuk6xaXXJiLdkttsXxfWNoUOn0BiuiQwV/tgLQk7qB7VK
	g2IVdmniCdNMtyZRhCWmgceS7E4OauOq55rPIPQkSm7wnXHUnlSFZbU8g5vkbdQ78ZPjUaNqU1NGK
	MEljmXrPkwSDOeaNCCcTssZvrsFPIlzKO5/3lxJmX+X7DH0FYSA+gqpJ2x1enmzOakDmgWycnqNVY
	UvmSDfcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1rUI-00000001bme-1Sv6;
	Fri, 18 Oct 2024 18:14:10 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1rSp-00000001bci-1nuG;
	Fri, 18 Oct 2024 18:12:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=rBbNs22uQervbwsUW0laACDJM6LC5rVXIqgu0VnFg1I=; b=4XpRXC1NF2Ox4BEDGsO6IEWoAq
	grScfco3CXGZ7Wk7NoSiytQxlILPdf8dzlHeVEi2Uh64VmrgtxTsLaWowoHNS0bZ345QqJtxCiyX5
	Q5xE5vRs05AB3KvgEvAKj3hxKqArajqJRfHfX9M6Ve7caqiVT3mrKz8YInLiXYlpRY5s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t1rSY-00AYYG-95; Fri, 18 Oct 2024 20:12:22 +0200
Date: Fri, 18 Oct 2024 20:12:22 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: wojackbb@gmail.com
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org,
	chandrashekar.devegowda@intel.com,
	chiranjeevi.rapolu@linux.intel.com, haijun.liu@mediatek.com,
	m.chetan.kumar@linux.intel.com, ricardo.martinez@linux.intel.com,
	loic.poulain@linaro.org, ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
	johan@kernel.org
Subject: Re: [PATCH 1/2] [net,v3] net: wwan: t7xx: add
 PM_AUTOSUSPEND_MS_BY_DW5933E for Dell DW5933e
Message-ID: <118ae5ef-6c6c-4e9f-80f6-9ccbced4a397@lunn.ch>
References: <20241018074841.23546-1-wojackbb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018074841.23546-1-wojackbb@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_111239_493458_D8F5FC1E 
X-CRM114-Status: GOOD (  10.09  )
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

On Fri, Oct 18, 2024 at 03:48:41PM +0800, wojackbb@gmail.com wrote:
> From: Jack Wu <wojackbb@gmail.com>
> 
> Because optimizing the power consumption of Dell DW5933e,
> Add a new auto suspend time for Dell DW5933e.
> 
> The Tests uses a small script to loop through the power_state
> of Dell DW5933e.
> (for example: /sys/bus/pci/devices/0000\:72\:00.0/power_state)
> 
> * If Auto suspend is 20 seconds,
>   test script show power_state have 5% of the time was in D3 state
>   when host don't have data packet transmission.
> 
> * Changed auto suspend time to 5 seconds,
>   test script show power_state have 50% of the time was in D3 state
>   when host don't have data packet transmission.

Only patch [1/2] made it to the list.

And you still have not explained why it is special.

    Andrew

---
pw-bot: cr

