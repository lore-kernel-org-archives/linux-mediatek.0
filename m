Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D517CC7619A
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 08:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AwvQa8DZJT6NZOtlpqfH8f/HV9XOyfp0IM5vweT+jzg=; b=bvr2lJvowyNJ80bBHPBH/jz9yb
	2cePuRJ5csblxbt2O4x0PG5Fvyu9rVkEzYBOT1/8ONbOL02aVQwX2sty2vThfHNrxo3ZyMKczoMX+
	36kWGxCVY/XuTryxlL+TGaCz3zbAFpF/yoxEyvslDBE/XcO39WM93ODFI2hD0t/eFfXobi050tG6G
	eihx0hXpMMt0m4ji8g/GOlFuturnbZZSGcBqLMbsuMRf10MimoWJXZW4XfzYUxllA0N2OFKebMEFp
	2bhmhhUOI8dZJ1HhAdsUMrHIC2MFTuBoQaDwBIONF7DJAFBQaQ5LHreOUfmi1h9b5YQ9fIs6qrQpZ
	R7LQosKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9Al-00Gntm-2H;
	Tue, 11 Apr 2023 08:16:15 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9Ai-00Gnsl-18;
	Tue, 11 Apr 2023 08:16:13 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AB01966031E2;
	Tue, 11 Apr 2023 09:16:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681200968;
	bh=lCsKkGauoJc9teddIhnRBvh0ZMZYNZkQNq8rGRsBJP0=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Ewshp85xjRzIvAHzLUgKCbdJ9TVTSPaIS4FF26ECXMDxrp2rSKdZXUjkHsxlVmgIi
	 CI3ZpC1spPRlZU5ZwqHTthwxNy6kdhp8UmL81f1amlbsBBkc0raZubyEmTnFsldp7v
	 Uq87v/fx1Y73sgd3t2H0DIHJ6vFQK6E58GuaVO12uhrpiqeRMH8za/0dmbby/F/ntW
	 S+dkYdXkifIbz4w7QudzJ+I/fMXS2NGSy4QSoAK8CwXF8l6TxQnrG985Vm/VGSWlRW
	 7QvJXqdOuQ/NN01JZBZvKwjIMbhgH0wLy7hTJg+FjKOAR1xL7XBHX2lZxb5dgDCBu/
	 FClBHn1Gl7MGg==
Message-ID: <94d8eafb-1fae-c3c0-7ffa-23ecb0d37716@collabora.com>
Date: Tue, 11 Apr 2023 10:16:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3 2/2] i2c: mediatek: add support for MT7981 SoC
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, linux-i2c@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Qii Wang <qii.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Shih <sam.shih@mediatek.com>
References: <cover.1680857025.git.daniel@makrotopia.org>
 <7b5c6ba8da51ea6145fb71815a2f65a9e1d341c1.1680857025.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <7b5c6ba8da51ea6145fb71815a2f65a9e1d341c1.1680857025.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_011612_538512_68FD12A4 
X-CRM114-Status: UNSURE (   9.24  )
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

Il 10/04/23 18:19, Daniel Golle ha scritto:
> Add support for the I2C units found in the MediaTek MT7981 and MT7988
> SoCs. Just like other recent MediaTek I2C units that also uses v3
> register offsets (which differ from v2 only by OFFSET_SLAVE_ADDR being
> 0x94 instead of 0x4).
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


