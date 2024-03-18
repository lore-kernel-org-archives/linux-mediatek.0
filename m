Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B03CC54E5D
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 10:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZUpHZTUUgUjB75T0vabPnF5k8n99pMnNI8fISkn12Io=; b=nAM72/eEN69+noopqKuMFC4+am
	A4QE4bMlMa4q6pj7GoFTdCajCJU7huXP3TnZBqfdToaVhYSFGQsCQLrZEbOyJu3W/g8Te9Lk0JqNN
	U8WLpGbD5l2rKHZEekh6HGse5gKmw9wa78Rvh7fCFx5jimsnwnupV0BnwEehLv3oAoM1sdO/NY7vf
	ob0ZnBmckLSFqLas+6JAP4wIbxZtXXWICXnW5htJS/uDzAfSs7yV5xWVVcGaUIkVCPLuE+cNj1HtC
	46fAbQJ+UQ2BYp+QWVBfFF6W8Q2F3AqS4htBdOvKNYgBd4sTWLLK6xZ0jVyPlIY+0n4EpXhqwwHj0
	iEoFhiPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmA2T-000000086yd-1DwC;
	Mon, 18 Mar 2024 10:16:17 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmA2K-000000086sv-1B2x;
	Mon, 18 Mar 2024 10:16:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710756966;
	bh=wdXdeRL5x3UOBKa21ru0LJKOTtloww8Fsce2L+TBuw4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=F6cjIG4L2XY8BPDTZdzVLWFg4FUME3aGH2vdFWDlZlRpzmPdHhWx3iypezSs1oCgU
	 as7Q+/lbn01t611RG/+UNFL7P6ryKxX90SxVRrBOo8NLMvN3ULR+UBgLSLT1uVBO3s
	 PbTQPh/QhDLNxKj+y9UotgF1YpnVBM3BBqDo6RZB2JZafeOQZF0mTTU5Z3WNEukIcI
	 HQN03+0Tri4OpkavDA/UoH7pQJJpZZk50q/r94CGPBAI8uB5iTMvlSNlnW2pr3q1TD
	 r7duVIF9h4WeO0PDZznD4hZI4gDOp9zChN5XrJPd1Gu8aICumFoCTA4e3o82wRyX88
	 79x1a3IIiK6eg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 15D6C3781FCD;
	Mon, 18 Mar 2024 10:16:06 +0000 (UTC)
Message-ID: <ff184df8-1917-456b-97c8-bc270987bd55@collabora.com>
Date: Mon, 18 Mar 2024 11:16:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] spi: mt7621: allow GPIO chip select lines
Content-Language: en-US
To: Justin Swartz <justin.swartz@risingedge.co.za>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <71533474-eb08-438c-b7ec-5f3277c195fc@sirena.org.uk>
 <20240316010302.20776-1-justin.swartz@risingedge.co.za>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240316010302.20776-1-justin.swartz@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_031609_022876_3FD5FDBD 
X-CRM114-Status: GOOD (  18.61  )
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

Il 16/03/24 02:03, Justin Swartz ha scritto:
> Extract a magic number, from mt7621_spi_probe(), used to
> declare the number of chip select lines (which co-incides
> with the native chip select count of 2) to a macro.
> 
> Use the newly defined MT7621_NATIVE_CS_COUNT macro to
> instead populate both the spi_controller's max_native_cs
> and num_chipselect members.
> 
> Declare that the spi_controller should use_gpio_descriptors
> if present in the device properties (such as those declared
> in the cs-gpio property of a "ralink,mt7621-spi" compatible
> device-tree node) so that the SPI core will recalculcate
> num_chipselect to account for the GPIO descriptors that
> it should have populated in the cs_gpiod array member.
> 
> Remove the assignment of mt7621_spi_transfer_one_message()
> to the spi_controller's transfer_one_message hook.
> 
> Refactor the mt7621_spi_transfer_one_message() logic into
> mt7621_spi_prepare_message() and mt7621_spi_transfer_one()
> and assign both to the spi_controller's prepare_message
> and transfer_one hooks respectively.
> 
> Migrate the call mt7621_spi_transfer_one_message() made to
> mt7621_spi_flush() just before chip select deactivation,
> to the end of mt7621_spi_write_half_duplex() to ensure
> that any pending data is shifted out of MOSI before the SPI
> core deactivates the chip select line.
> 
> As chip select activation is now taken care of by the SPI
> core, due to the use of the transfer_one hook instead of
> transfer_one_message, the calls to mt7621_spi_set_cs()
> from mt7621_spi_transfer_one_message() have fallen away.
> 
> And although the SPI core will handle activation for GPIO
> chip select lines behind the scenes, it requires a callback
> to allow the driver to perform controller-specific
> operations to control its native chip select lines.
> 
> Rename mt7621_spi_set_cs() to mt7621_spi_set_native_cs()
> and make sure that it takes into account the activation
> polarity of the chip select line it's acting upon, as the
> passed enable parameter represents the desired line level
> and not the desired activation state, and then assign
> mt7621_set_cs() to the spi_controller's set_cs hook.
> 
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



