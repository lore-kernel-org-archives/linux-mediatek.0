Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50292CD98D9
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Oct 2023 01:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JPiec/sCUcZurkwmie2nYwKp09sLIt0E6Hpr773cJDg=; b=hgE2swWQfGECAQmLNMO8uIoPTa
	UVz0fnoM5Po/ubCw3zeXWpuwhFk+c/ofzPp3lpzpdBYKRUINHCYIGVX5m0DH1HkoU+1EMQa5Gwuen
	Mm0CAkiTxiQeSLU8E+XpX4m1XeN7ow1IhZc71Wzneqt32b4aSyIAn/RaXphN62ZFCX15IM6HObMuU
	oJI8uG/KbS7CxH4bXhlxiSoar1+fpwHiAoc06E1wP3cM2qArodvLJub/dUzvns8YLU5hT4Vx1e3g8
	CDkLT63WtbfbhQZ4mdO5x0F9Y6J19Vo13sEMbvd74IVvkQT6m7DDbVGn4aBzXyf8hdlnZrB4YM2/a
	FPhc3gyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqNjl-00EUUj-36;
	Wed, 11 Oct 2023 01:10:09 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqNjh-00EUTf-1z;
	Wed, 11 Oct 2023 01:10:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=JPiec/sCUcZurkwmie2nYwKp09sLIt0E6Hpr773cJDg=; b=nFfJb4mJ5K9YVo0uqSKDpTjUrz
	boYCeR91Gw/HrNAj9kJXXhIf8EDyoSamrLURlN5nrshZXtVdCjxresFUw7WEMYMLsYgxZnGzUXQVY
	I+dIMBJAkxeTS7tlxIkvrTMeDZzluO31ScWU14TqRvL5I0lUsOBXz5dUNCPstacfqQ0I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qqNjR-001PVB-Dw; Wed, 11 Oct 2023 03:09:49 +0200
Date: Wed, 11 Oct 2023 03:09:49 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: netdev@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	"open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH net-next 1/2] net: dsa: Use conduit and user terms
Message-ID: <63f3e1f4-428b-42d2-a5ac-c6445af195f0@lunn.ch>
References: <20231010213942.3633407-1-florian.fainelli@broadcom.com>
 <20231010213942.3633407-2-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010213942.3633407-2-florian.fainelli@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_181005_678828_B880977E 
X-CRM114-Status: UNSURE (   6.95  )
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

> -Master network devices
> +conduit network devices
>  ----------------------

Hi Florian

It would be nice if you could do a case preserving search/replace.

I think you also need to fix markup like this, or there might be
warnings from Sphinx.

Conduit and user are good replacements, BTW.

	Andrew

