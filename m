Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F53D20682
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 23:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mUFuUDjPLb+T13crf9T6WeNqvmmZOjE+1O9AdsG9ipM=; b=KQHjQpxfQz4awt20tU91iH7iPC
	aNY0CxukrQ0U9pUHQIjBvfpQJ6BI0CImL0/8r7O5iFEY0cnnpAQhCLM9z1Sa3KIlW1xgNWnxHfU7N
	Naqe5/WgoPIEOOBbPxuZkv3zZT7RI2Mn6yap1h08G6IuQMIwUcY6+7/xIudon43xkPSCKmBZktug9
	zX6Wizw+8Dw5tFrb2RweUam3YnRDGdati9U9bdGy5r4e9HuagneemoYCbfQ+5LHHWlf0URhNPvr3r
	1lVaBcQSlw4NSicUcpOtzeSyDRUXXsygUF02b7zWbTlAE2Q1Wv8x+W1hbQNK9U4u3kF44f4AzsUWL
	Gj8cLGDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0qZb-00000009sEj-1hay;
	Tue, 15 Oct 2024 23:03:27 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0qYA-00000009ryq-0bOb;
	Tue, 15 Oct 2024 23:01:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=mUFuUDjPLb+T13crf9T6WeNqvmmZOjE+1O9AdsG9ipM=; b=qd2vWfI3e7rgHEMZNX9dxj2kbz
	Ic4V1IerIJC807KDM9PXjN29Gle5kMyhV1ByvlEoDQekg4sZHMG/+XoUuhCIPojHxa59pIrvZVqPb
	8NxmDPdTHh2tyJcY4FmarWCIDbaJ7HoMKpoZz5026Jxbz27r45lXKV5YjiXzMkNVcQ9s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t0qY1-00A5JG-Cn; Wed, 16 Oct 2024 01:01:49 +0200
Date: Wed, 16 Oct 2024 01:01:49 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Richard Cochran <richardcochran@gmail.com>, kernel@collabora.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Jianguo Zhang <jianguo.zhang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Hsuan-Yu Lin <shane.lin@canonical.com>,
	Pablo Sun <pablo.sun@mediatek.com>,
	fanyi zhang <fanyi.zhang@mediatek.com>
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8390-genio-700-evk: Enable
 ethernet
Message-ID: <0e72a636-19e1-4f2d-8ea2-f1666c525400@lunn.ch>
References: <20241015-genio700-eth-v1-0-16a1c9738cf4@collabora.com>
 <20241015-genio700-eth-v1-2-16a1c9738cf4@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015-genio700-eth-v1-2-16a1c9738cf4@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_160158_208565_BAAA266A 
X-CRM114-Status: UNSURE (   6.23  )
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

> +&eth {
> +	phy-mode ="rgmii-rxid";
> +	phy-handle = <&ethernet_phy0>;
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&eth_default_pins>;
> +	pinctrl-1 = <&eth_sleep_pins>;
> +	snps,reset-gpio = <&pio 147 GPIO_ACTIVE_HIGH>;
> +	snps,reset-delays-us = <0 10000 10000>;
> +	mediatek,tx-delay-ps = <2030>;

Can you set phy-mode to rgmii-id, and remove the tx-delay-ps property?

    Andrew

