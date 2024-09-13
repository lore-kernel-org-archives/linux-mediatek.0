Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F6CFA3733
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Sep 2024 08:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sNpuKpt+4sjae9S+sWz7Gy4nUgWHtt3rdxCFuSnCg2s=; b=GzwvysBhHHmWvtMM2vc+xo9URU
	5QTqSJfNvsIl+I09/gUqpzSYd1/UubNnuvBQJcyTWvK9nINEPEvWHc/S/7o4fMHsyBwVuDLV6MT92
	CaS4X24Px+sXmAg2iw2d1ctEQuc2PrvywbRSoqort0XhHYpM8XcS4Tt5+rwFk34P7vt4FgYvQ/rST
	Dc7RtmkVBBkqjlJWGMTfjHq9KLPmMv22sPCvaVuQ60buZV/n9UXUr0LLWW3SbnghjEAdwPw9KD97e
	RdGzU0D0h+te8sl98oqgAqPpLjJuMqoviOscdRkUxRRGdino7Gt3mvFQoWyOM6P6CrQsSkK95H7xw
	rWGl6OmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp22J-0000000FP7v-0N7S;
	Fri, 13 Sep 2024 08:52:15 +0000
Received: from a7-41.smtp-out.eu-west-1.amazonses.com ([54.240.7.41])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp228-0000000FP4X-27Vd
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Sep 2024 08:52:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1726217520;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=g6maka/lKgrwuWshcXJ3wPSbNiIvhMNMu/RgWlAcypo=;
	b=RK3++ilJRkktb3Wr4L+vRqVkPE0i2mP7JMHgexEXVVqPGcipm7/VG3tp+ZBJ9slK
	hASj1+/Hh7DyXBPQuqVrjfZRw+P8uLAoCht9KRozO+q5bvYnJfKRPrxPY2km0UNBe5D
	Gw4EiMotUftRE/f1GZfVP5S4WAXG+XRl34IlHe8nT1olyoFyBLssvJJA/R8hFLw65VU
	JRQNOnYd9CdS9KyHqMggJ9uRRhDCZUvrK/b2ljHlwhqw+SQqXYL7gYh+vQkbWLORBQk
	1d1X+dZuFiwqi6P/RXyexT0GcTijrn6WrMcAFvVADBbY+PTTfOntbB8sEFSd+pKoLNf
	0dY9KaS5Ag==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1726217520;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=g6maka/lKgrwuWshcXJ3wPSbNiIvhMNMu/RgWlAcypo=;
	b=THQXwh+6Z1DNX7+fm/6JLN0tS3OeLvi8mSx02cnP4AT73FZmaK1N5sHvWIDmxcSm
	Jb3bmYPmYG4+JsYsmY0vHuxZKpmej8oQIoxi0EMhii60Ewhimhsuu8cfYohHKrGR+jR
	fOb2OUtNd7rEfmSa3YGqc8Rw5Sj6k0f/s1O13108=
Message-ID: <01020191ea950641-b277d24e-52ee-4699-a074-8604bbd09021-000000@eu-west-1.amazonses.com>
Date: Fri, 13 Sep 2024 08:52:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] arm64: dts: mediatek: Add MT8186 Ponyta
 Chromebooks
To: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>, 
	matthias.bgg@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, knoxchiou@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20240913031505.372868-1-cengjianeng@huaqin.corp-partner.google.com>
 <20240913031505.372868-3-cengjianeng@huaqin.corp-partner.google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240913031505.372868-3-cengjianeng@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.13-54.240.7.41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_015204_746027_51B24A01 
X-CRM114-Status: UNSURE (   4.65  )
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

Il 13/09/24 05:15, Jianeng Ceng ha scritto:
> MT8186 ponyta, known as huaqin custom label, is a

MT8186 Ponyta is a Huaqin board based on the Corsola board design with the
addition of (optional??) LTE connectivity through (usb? pcie? what?) integrated
module.

> MT8186 based laptop. It is based on the "corsola" design.
> It includes LTE, touchpad combinations.
> 
> Signed-off-by: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>

After clarifying the commit description like suggested,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



