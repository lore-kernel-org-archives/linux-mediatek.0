Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97FDC636D3
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 18:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S4x5qKj4mZKoGvyjVYSHB2H2PnDfOerrf3LVzTj3YME=; b=2QuF/IU02njqui
	Howt6ps4u444aTF/sD1OhvzPRGLEZ+k4q66wD49qJDO/uIJc718QUFHT36KPVpt9RCWgoE/dLZLbI
	owBcU7FRv9VWN/C5JigMms3vCBYeP5RiCCbW1fL9Z4hYSY7Js5DVeJjnjrLAKtc79rmmOi8xgs200
	/iS+NNtGE5+EkcCe1EKYw3t9APTW1Cd8IZS4mcXF/vkWJRB5Ip/kFBrdTUNIFfk7kVZFvl2qXvhy5
	5T/t4DfyRzRc/5Ebkm9oiuQQX6lT8ubZSzUP9Vp2flg47DzD/LC6XdDhpESbcEestZDS70iHGSSVf
	E6YaAYHo00ieyHR3Bn3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPSNK-00D0mU-Cq; Tue, 07 Feb 2023 18:07:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPSNH-00D0lZ-LF
	for linux-mediatek@lists.infradead.org; Tue, 07 Feb 2023 18:07:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675793242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S4x5qKj4mZKoGvyjVYSHB2H2PnDfOerrf3LVzTj3YME=;
	b=gaU9Fbf1W4LEBDUhHwza78QdJ8gvH7ilPxliiHoEN9TH51MmcOR/uG8tD8fvkh/xhG5pm3
	6iTdFmjY9m1NKXSR+jin9BCuACPiNs+//EZVr4QvGtn6rJVEChDAPnB2uMg2keDkfszAHQ
	MsvAXLlFs68qnp+qkZKOEw5POLHrFg8=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-263-TfwT9bndPq-cn4PkR8oWgg-1; Tue, 07 Feb 2023 13:07:20 -0500
X-MC-Unique: TfwT9bndPq-cn4PkR8oWgg-1
Received: by mail-qt1-f198.google.com with SMTP id p6-20020a05622a048600b003b9a3ab9153so8957668qtx.8
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Feb 2023 10:07:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S4x5qKj4mZKoGvyjVYSHB2H2PnDfOerrf3LVzTj3YME=;
        b=MZG9Hwf9SB2wfF2te9jdrzCFyNs9/2HwSdmnDzHuiUnYrYRRbizzYDxMvIy3Eq3kiB
         ncK4gSqZxBY7oFWlmzwf2JSejfU7yMaLdyJJAo0alWHwBmXC0cb13UEZanUh1FTDnMfu
         5XFUqRScpc0OMe6AAWke8TnWyYt+xts7TIKykSLCxSlCd7dJ3nNSCQRAMAn59wS+DRfx
         q4+TVXykUURdXal24CndM5GLX9MlJvsufEvJZdSncWcPsYv3Sn9TpSd54phHzUhI+e6t
         B8xANQ54bPDpeiGv+7AkhY3ObwdQIWqK0/qUCiaUNA45W3pVYhBjeopyLhzxk5iCTF4k
         fFCw==
X-Gm-Message-State: AO0yUKUGKPZ+2hVEnRb1m/zXDQ/gAZyoYnOkGdJM/DmFkU9Rg1Pd/OXW
	lZ28hc3ScNcsa/c5HSc8kwL5bNCp5X1O62qi9/C3I8onh8gXMk2SJCKcOz4gplP0KhBZYVVC0iu
	O8N+W4FDlCUI6RT28GJGyEON7X1ZeRJlV
X-Received: by 2002:a05:622a:112:b0:3b8:68df:fc72 with SMTP id u18-20020a05622a011200b003b868dffc72mr7825064qtw.2.1675793240263;
        Tue, 07 Feb 2023 10:07:20 -0800 (PST)
X-Google-Smtp-Source: AK7set8cjC27SSuAC4+6fF6WgMSxS73grqiRMo482W5gZoUazjLcTL2TOyKMixk5mjoE5yE6VOcJ8w==
X-Received: by 2002:a05:622a:112:b0:3b8:68df:fc72 with SMTP id u18-20020a05622a011200b003b868dffc72mr7825024qtw.2.1675793239958;
        Tue, 07 Feb 2023 10:07:19 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-113-28.dyn.eolo.it. [146.241.113.28])
        by smtp.gmail.com with ESMTPSA id cr17-20020a05622a429100b003b63238615fsm9781225qtb.46.2023.02.07.10.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 10:07:19 -0800 (PST)
Message-ID: <056934c443a57293f925d8f18f603b6ec76b91db.camel@redhat.com>
Subject: Re: [PATCH net] net: dsa: mt7530: don't change PVC_EG_TAG when CPU
 port becomes VLAN-aware
From: Paolo Abeni <pabeni@redhat.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Date: Tue, 07 Feb 2023 19:07:14 +0100
In-Reply-To: <20230207123952.r2r7tnama3vcr7vt@skbuf>
References: <20230205140713.1609281-1-vladimir.oltean@nxp.com>
	 <3649b6f9-a028-8eaf-ac89-c4d0fce412da@arinc9.com>
	 <20230205203906.i3jci4pxd6mw74in@skbuf>
	 <b055e42f-ff0f-d05a-d462-961694b035c1@arinc9.com>
	 <20230205235053.g5cttegcdsvh7uk3@skbuf>
	 <116ff532-4ebc-4422-6599-1d5872ff9eb8@arinc9.com>
	 <20230206174627.mv4ljr4gtkpr7w55@skbuf>
	 <c4c90e6576f1bc4ef9d634edda5862c5f003ae3c.camel@redhat.com>
	 <20230207123952.r2r7tnama3vcr7vt@skbuf>
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_100723_790213_F19B389A 
X-CRM114-Status: GOOD (  19.34  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, =?UTF-8?Q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, richard@routerhints.com, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, erkin.bozoglu@xeront.com, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2023-02-07 at 14:39 +0200, Vladimir Oltean wrote:
> On Tue, Feb 07, 2023 at 11:56:13AM +0100, Paolo Abeni wrote:
> > Thank you Vladimir for the quick turn-around!=20
> >=20
> > For future case, please avoid replying with new patches - tag area
> > included - to existing patch/thread, as it confuses tag propagation,
> > thanks!
>=20
> Ah, yes, I see (and thanks for fixing it up).
>=20
> Although I need to ask, since I think I made legitimate use of the tools
> given to me. What should I have done instead? Post an RFC patch (even
> though I didn't know whether it worked or not) in a thread separate to
> the debugging session? I didn't want to diverge from the thread reporting
> the issue. Maybe we should have started a new thread, decoupled from the
> patch?

Here what specifically confused the bot were the additional tags
present in the debug patch. One possible alternative would have been
posting - in the same thread - the code of the tentative patch without
the formal commit message/tag area.

That option is quite convenient toome, as writing the changelog takes
me a measurable amount of time and I could spend that effort only when
the patch is finalize/tested.

Please let me know if the above makes sense to you.

Cheers,

Paolo


