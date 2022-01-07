Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31304C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jan 2022 09:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qzAc3qaw1mBxdP9giMMvBolHottmL36R+YE1z8oHpPY=; b=mJxO5RF4sQo5ml
	9Y0WqUB9MzgzebC5HAksIDSpQzGVvFM7XYZekYA9V3GXV2uF8MHdp3/Jp63l38059FZGhZSIjUx4p
	DpYeO3KpXyHBfLOPCoJ0rJnT0LcRTkDfBU8EzivIO00qyE2VbGRt0D5jyOSQr0CM6d6CsdsD01OWL
	iwaZJK8h2uxvd8J9HOOexWNQgsERpFwOmX7ILWaGYPnDv56pjN70e9PKmCUMWp+jfRbUoU0GpMZmf
	CrVLJeOYo6ZhdDSm46zvubDPnSZ7Qeyn+82dMqBkA63AF9ySiTd6FEmO5/3qWFgV0kCkfhE0Ky1Rh
	fZZXoAjrR/2h6hDUnShw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5lOY-0032N1-AR; Fri, 07 Jan 2022 09:18:46 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5lOW-0032Lt-74
 for linux-mediatek@lists.infradead.org; Fri, 07 Jan 2022 09:18:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=oK6uBavdA5Gnt8mEB1fkktbayvYWRTqUAEziGOUdNos=; 
 t=1641547120; x=1642756720; b=NDEnjazBJ6vhvSOeVatHD8g5MHX4BbnoBBDxOyODGYUr9WQ
 QR8rU4DNZaSKorKyArjLzyDofd7fLMKinaJXrrQwM72mOC+01qrDQUZxzclwtoA16xSmPBqHCPk7M
 4ayGXU/fWKKSzUHhqUnq4uKPD9Yjn0wsAOhPTG5ej1esRmiGfC3z2gDxTeQCeGNUINFQSjFb1P+VR
 OV8J7dkYsIoR/TNr4SOPaCx6TYiXv4LAg5Q2GH0NlfqekBe4g4pHXxK6Ln3GdL0Q6vUvZMQgtQ2K5
 ZPP52NZ831bPOtJf3ixzJ9R8n/5AmjNwg7OuXDNYcYFjsWUzzV7Z9ejBWEqhmM6w==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95) (envelope-from <johannes@sipsolutions.net>)
 id 1n5lOF-002qrE-GQ; Fri, 07 Jan 2022 10:18:27 +0100
Message-ID: <f61c6a25c7ad1ed452b4facf38c7e451d47c5dc0.camel@sipsolutions.net>
Subject: Re: [PATCH] mt76: mt7915: fix a couple information leaks
From: Johannes Berg <johannes@sipsolutions.net>
To: Dan Carpenter <dan.carpenter@oracle.com>, Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Ryder Lee
 <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Sean Wang
 <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, MeiChia Chiu <meichia.chiu@mediatek.com>, Money
 Wang <Money.Wang@mediatek.com>, linux-wireless@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Date: Fri, 07 Jan 2022 10:18:25 +0100
In-Reply-To: <20220107073609.GH22086@kili>
References: <20220107073609.GH22086@kili>
User-Agent: Evolution 3.42.2 (3.42.2-1.fc35) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_011844_291021_1AFAF455 
X-CRM114-Status: GOOD (  11.55  )
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

On Fri, 2022-01-07 at 10:36 +0300, Dan Carpenter wrote:
> Unfortunately this code has stumbled into some deep C standards
> nonsense.  These two structs have a 3 byte struct hole at the end.  If
> you partially initialize a struct then the C standard specifies that
> all the struct holes are zeroed out.  But when you initialize all the
> members of the struct, as this code does, then struct holes may be left
> with uninitialized stack data.  This is from C11 section 6.7.9 and how
> it is implemented in GCC.

Wow, nice find ...

> +	memset(&data, 0, sizeof(data));
> +	data.cmd = cpu_to_le32(MURU_SET_TXC_TX_STATS_EN);
> +	data.enable = enabled;
> 

Maybe add a comment? This is not going to be obvious in the future.

>  	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(MURU_CTRL),
> &data,
>  				sizeof(data), false);

Or maybe instead just mark the thing __packed (and/or explicitly add the
padding if needed), it seems weird that we'd send something to the
*firmware* that has a struct layout subject to compiler/arch padding
rules.

johannes

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
