Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E6FC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 08:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eSn1XjQLTySlFI1JpNHG2mj/LdM92faiVpX2ddFTkjc=; b=kpc2+68hVumsriTL1ZD5kXhv+5
	j8UzpbzSHLGv1+xml/Q4oUyXtxD/W+3sf1JWNNGmlCfA68GtNn9FUjGtpdCBghBZk0y0Cdr40XKJA
	J0Z0lo6PpM3oo/ISxgxZsHLkx8GfXBSsucvjHRIaWF6EWZSII3dqIlmXJ0QUYGSpUVPpHJVSaTGsN
	xUbd+lKELcKdfjQ9TG/j/wM9uvH+XqiOq8siYP7kGeLps3pWoWEsm+eBT1XbGCXtzBdeePw+5dxiP
	DnEcjussFYcKaEZyamfrlZl2iCqXQUerPnNgBQ7H1NbfV+JezRF2TjK5v0vRC9TOZVOndn3IozQRt
	EemQYxtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6T5g-00APab-8e; Wed, 29 Jun 2022 08:30:28 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6T5S-00APS8-D1; Wed, 29 Jun 2022 08:30:15 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 43B8D66018F1;
	Wed, 29 Jun 2022 09:30:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656491412;
	bh=k/GBrayqjumhXVKWOQr+XlgpEvOogSVYRcWj6cKD5Lk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UdlLwzKbbnVcC1GW8Bt2LO9bsJDdYIzHProVcOO4H3U2xFEbc7yph3W0WzowFvvGb
	 7puOjny1P5Ih7ctJ/qoRX8G3GuogiDAJcKNCsLhdXR7coBqJ3nWZZM0cvAVRG6KhMF
	 cyuAzw6gtvbt0H7uL1j9cCrukhclvND4IFtlM2uG6vKQX0z+1MD0lIbKEQKQ0V1dZZ
	 UMkrMwokI2tIIQNpaMn5/jdUpItehgb1kBQw/IEwg3kbQB6N32A8jeOI30k3wV9Ic2
	 Za/b5tKvv2K54ABmmCdb7csiCB/3CgOoBSKQoaU8wAVkXX0BPez1GHKzGNzx2/dLhU
	 aT1VMU7AujulA==
Message-ID: <a94b6b57-3dcb-aac8-7920-351ec729bc4d@collabora.com>
Date: Wed, 29 Jun 2022 10:30:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v11 1/3] usb: typec: tcpci: move tcpci.h to
 include/linux/usb/
Content-Language: en-US
To: Xin Ji <xji@analogixsemi.com>, Guenter Roeck <linux@roeck-us.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: bliang@analogixsemi.com, qwen@analogixsemi.com, jli@analogixsemi.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220627044331.2180641-1-xji@analogixsemi.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220627044331.2180641-1-xji@analogixsemi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_013014_651017_6C5BB506 
X-CRM114-Status: UNSURE (   9.26  )
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

Il 27/06/22 06:43, Xin Ji ha scritto:
> USB PD controllers which consisting of a microcontroller (acting as the TCPM)
> and a port controller (TCPC) - may require that the driver for the PD
> controller accesses directly also the on-chip port controller in some cases.
> 
> Move tcpci.h to include/linux/usb/ is convenience access TCPC registers.
> 
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


