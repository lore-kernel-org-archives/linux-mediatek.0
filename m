Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D83D1AD53
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 12:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EGuL05E5OgX9qJAVFH4riiM8Kfnnqg10KB5wvTH+BpY=; b=bmtoYkr0LRpPJqxSOF7n0RdIdG
	PAqFKG/NqKi62WaixTkzbHxHXcfsaa9hNAJY6Q2q+dObIpgOCyvEHm3ManzJa5zWvdW+5FpQNP/Xl
	+F2T/YY7R2NUni3ckVg91RdgrxxaeNZbJj72KphBRekBeSxe1aHxa5BHrGdFL3mR453J1ZosnicmE
	N6oUtaOQAzhemGw5pvX+mu8hzp5vuDmnfMJzbiwN4J+h1CPFETur2fUQbDo5+r8u9oH31XH0tpLFk
	Pq52xEvuBpBpxcz1DZzJt8U47z6X6V1TaMj7dulndaxc0KKNCL7Mq4mPUw1ouj2CSgWs0lw0YWgm8
	vOqGXlUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t13Ks-0000000BmEJ-3hev;
	Wed, 16 Oct 2024 12:41:06 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t13JQ-0000000Bm6t-409Z;
	Wed, 16 Oct 2024 12:39:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=EGuL05E5OgX9qJAVFH4riiM8Kfnnqg10KB5wvTH+BpY=; b=Ym
	xi+A97BfqvN8zlIWrNL+86QjYbn76zG3KhIbO77aY8t8/ONnjQGG9yL4+aWfXXD03iZIcpG4b2Zyx
	TODWgkg9B+01eqpIfKZBKMrEAaeU0oFcqQn1p+H5cbgSKA45QN6oIE8+m9D5JCHzT6pKvqUnN2/JS
	foHQaqOaheQ5k+Y=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t13JJ-00A9Qc-LY; Wed, 16 Oct 2024 14:39:29 +0200
Date: Wed, 16 Oct 2024 14:39:29 +0200
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
Message-ID: <f7fb240c-064c-4ca9-9126-73937aca4705@lunn.ch>
References: <20241015-genio700-eth-v1-0-16a1c9738cf4@collabora.com>
 <20241015-genio700-eth-v1-2-16a1c9738cf4@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241015-genio700-eth-v1-2-16a1c9738cf4@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_053937_012996_8E33C830 
X-CRM114-Status: UNSURE (   7.38  )
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

On Tue, Oct 15, 2024 at 02:15:02PM -0400, Nícolas F. R. A. Prado wrote:
> Enable ethernet on the Genio 700 EVK board. It has been tested to work
> with speeds up to 1000Gbps.

1000Gbps? NVIDIA needs to watch out.

	Andrew

