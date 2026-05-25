Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F15CD5BCF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 May 2026 08:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S3ZSu6l2zidNkM2TZ4OfaBlRHM01wPWQ4M//D1d9z68=; b=uIOZTlWWmGKE32SCCmGt9Z0zo2
	ppp7gyDo+BtsupZf9b1iM5jVMIANUVaSeUe58qjSnZDn020hnRs/GPNTMjS2NPR4Ds3lheew+7txR
	j6zE4PuddgbgsFimsYAFl2URpu294RzdLVxLDhDsYMa8tzVPGxTsvz3ybi0//P4QTMfl2jlVPNVHJ
	nKwwQVWXzC0dEareOQ5VZxIugKYbC/Tz/bD80USBZg5agh1tEfU8KL3Q/D5chT1En7CMLuWR+JUms
	L1M013UfZgNYalu0fm5iVMrHO1HFMIVR9xdcVsxuZB691BuzhcbkresATYh2ECLEhF6cr4R4zpkOJ
	6kmaGlJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRQuf-0000000Ggj9-1Jra;
	Mon, 25 May 2026 08:43:53 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRQuc-0000000Gghi-3MIC;
	Mon, 25 May 2026 08:43:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779698626;
	bh=+vFgdumFv6/nxAboBbbU8jY8FPS562TdhfuUlJYfhWs=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=pteKG9RGa6j7Jk0dGEg5MhAvkOhE2ubpLjxeaSvnBYZ9mj/ULKDjGWLxgGfV4sJ0j
	 NHbGPXwqWmCWEY/PeBMo3vJdQwS9lwYeMbBGZBhNMAgyG9FZqkNJWwxMAk8ivVZoTp
	 0wAqF3AIY3tNUIUlG6h38hiaihcR6BxD+4YHuJWDLinCZEZ+IcceJmPb/YnAOr6lrV
	 tBhEZrEg8ltEYnh0MyP/ya6w6QOEh3/Y783aq/VUF4PXt6NZp7lxdUIDosYufoSnue
	 zPX0drtYnOhwRoNXqp0E8U6K0oYlNsMvifREW1GOHWyD9gE5y58LD8QfNVMGVaHsNH
	 X2iXXK74OiwUg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4670B17E0979;
	Mon, 25 May 2026 10:43:46 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Aleksander Jan Bajkowski <olek2@wp.pl>
In-Reply-To: <20260523101904.293215-1-olek2@wp.pl>
References: <20260523101904.293215-1-olek2@wp.pl>
Subject: Re: [PATCH RESEND] arm64: dts: mediatek: add LED and key support
 on Xiaomi AX3000T
Message-Id: <177969862621.3767670.3588325630835903644.b4-ty@b4>
Date: Mon, 25 May 2026 10:43:46 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_014350_989593_BCD216E3 
X-CRM114-Status: UNSURE (   5.94  )
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

On Sat, 23 May 2026 12:18:55 +0200, Aleksander Jan Bajkowski wrote:
> This patch adds support for keys and LEDs on the Xiaomi AX3000T.

Applied to v7.1-next/dts64, thanks!

[1/1] arm64: dts: mediatek: add LED and key support on Xiaomi AX3000T
      commit: 9897c586b09f79ebcf2e67a888743c046b20d254

Cheers,
Angelo



