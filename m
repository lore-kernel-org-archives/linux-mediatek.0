Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9F8C48260
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Feb 2024 17:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RimLjOdN8rzQMpG0ae9IdH673ga5rpJ5Vs6DdQd0/gQ=; b=fImb0BnqtsugCRKbDQngXlFx0i
	lgpdn/U0JD3KA42TmLsyBsQLSRGnTuiQA13I2hn15OqmXKMOw3NAj4YRT13vDQSFxrI+HIYYBEjiU
	Xx8leyI1dbfJiuObZtNEzJtXs+JR/f45Vrm9Yk5kdOqanJjFIGaQR0W2zTHL0r5x5ywdhr5YLDN9F
	8s+ga8h9KCV35SHNxl7lOMESCyATX/NKxvB2agNjZyYgT2qX68uIyJr6W5JcsV2EKI+PB5z2ALGzV
	Ket22idpQ9T0LWOt+COnXVGF7ucMyygiZuJHu0wP+kucxk2IzuaIDEHSuKHTEqZN9h9uM+PbkjMk0
	fsVQMv1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb1vj-00000003BXV-3cZ0;
	Fri, 16 Feb 2024 17:23:19 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb1ve-00000003BVL-0Tok;
	Fri, 16 Feb 2024 17:23:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1304B2000E;
	Fri, 16 Feb 2024 17:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1708104189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RimLjOdN8rzQMpG0ae9IdH673ga5rpJ5Vs6DdQd0/gQ=;
	b=BzmQcEEMGCl+P5qGARHIVL1y4ADNuv8bQFuLLYUM4/lqqGfcpNFu8HWyOQ2A2GzE8/tujf
	UdWhRocg/l4UUe5et5gtQBAgVrF+9ZwquMbxcE3A9fXfYokgnN2lO5n7jn9cmkJkNt5Bfj
	Z3XEQF/p7R0XqIXTdm/O19LvG6YZkAXU8wtvI50pIW6S6P4He/7ayaQRFdsujG4PnqNC1w
	9yDN2fWfqEQMQ/6KvImzgcEwtU9GeYgWcau+2qsYZVfxPvi2xhBRpBoHq+PWUgOF++yFwO
	Mnt+zGFq4nDdn50+Gz6cOWfWNFE4Uj3bgAALObqxxiPVojQVFESnzXTA+GzbSg==
Message-ID: <c8393e61-7c44-4aca-acce-10b5f6b34fdd@arinc9.com>
Date: Fri, 16 Feb 2024 20:23:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH netnext 8/8] net: dsa: mt7530: simplify link operations
 and force link down on all ports
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
 Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240208-for-netnext-mt7530-improvements-3-v1-0-d7c1cfd502ca@arinc9.com>
 <20240208-for-netnext-mt7530-improvements-3-v1-8-d7c1cfd502ca@arinc9.com>
 <Zc+ConfebmQdpCOF@shell.armlinux.org.uk>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <Zc+ConfebmQdpCOF@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_092314_485393_D658227D 
X-CRM114-Status: GOOD (  16.01  )
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

On 16.02.2024 18:43, Russell King (Oracle) wrote:
> On Thu, Feb 08, 2024 at 08:51:36AM +0300, Arınç ÜNAL via B4 Relay wrote:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> Currently, the link operations for switch MACs are scattered across
>> port_enable, port_disable, phylink_mac_config, phylink_mac_link_up, and
>> phylink_mac_link_down.
>>
>> port_enable and port_disable clears the link settings. Move that to
>> mt7530_setup() and mt7531_setup_common() which set up the switches. This
>> way, the link settings are cleared on all ports at setup, and then only
>> once with phylink_mac_link_down() when a link goes down.
>>
>> Enable force mode at setup to apply the force part of the link settings.
>> This ensures that only active ports will have their link up.
> 
> I think we may have a different interpretation of what phylink's
> mac_link_down() and mac_link_up() are supposed to be doing here.
> Of course, you have read the documentation of these methods so are
> fully aware of what they're supposed to do. So you are aware that
> when inband mode is being used, forcing the link down may be
> counter-productive depending on how the hardware works.

No, I haven't read the documentation [1] until your response here. My patch
here doesn't touch mt753x_phylink_mac_link_down(), it is already the case
with the driver that falls short of not forcing link down when inband mode
is being used.

That said, what I explain on the patch log does not properly describe the
driver behaviour. This should explain it correctly:

Enable force mode at setup to apply the force part of the link settings.
This ensures that the ports that were never active will have their link
down.

I could, in the future, study this thoroughly to make the driver fully
conform to the documentation.

[1] https://docs.kernel.org/networking/kapi.html#phylink

Arınç

