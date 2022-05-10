Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E58C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 16:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CvIw481+/dYlRcmzBAxM/86QUUWC7p5WyfqStmUFcIk=; b=XKx+Fv7RMmUuEa
	8oKghpD1PIEHQdf4KcVvjA3G5PG72GAPESJQwtYI+H9WecpXsCzWTs4KWgqg1n+6m9AywQb0ZpkiP
	E8OpoiXLBfOwKDAMU3oenZPl+OvXP/jIfTjYrWaszs2tz97F2FaQ4YQW5XxfueQJhECArx/G/6a4h
	7UpIakAdzeIw6MblaOYIw6yZlUgTDwz0v5M7El9zM/qw17zbd/Hgvm1bBEQFtlWN7HuJU1F0C3mja
	J+2D+YfivX06iaMtQ70Nt6q/N3TsyK0KMWOPpDlTvg8rmWICleJUG/5XG33tCLwUJj+ASxOpEofV3
	jkDBySxKxh4GLGsGVMGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noT6v-003ESd-6w; Tue, 10 May 2022 16:53:21 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noT6H-003E6X-5e; Tue, 10 May 2022 16:52:43 +0000
Received: by mail-ej1-x631.google.com with SMTP id ks9so27750490ejb.2;
 Tue, 10 May 2022 09:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9xQwPtQrBfYT0IuemJx5F5so+crXxKK0HLvlBxjKC0s=;
 b=Okxteym8CaF/RHkBfO6Cp/WIgRcGbMBTJWIdNmMU19vXsWaAS8Z9L5ircpFp6VDy1S
 u10DkF0PLDeKl0gv5ijUtxkdcF6bG192cWFecvN8MBUJG7Gf6mTiy5C5HhKL4yKu+y7C
 fuY6AdEp9N1XEYZGCa4lJVnIb7TNode2Iu5C1xlRmg0nS7mbu3qxTeimBa81215XyjFo
 QElNUXkGIvL4YkC8lKNY8VCKfeTD0cAqUcjHZxtS/9ZzoiyeCWdvf6MDRaohKXFJocJ4
 hgsSm0nftb8Eh1JEkwsZlH1sB4qIgwF0i7eJAzKg0c4C7PNz0ybEYElL1dvCdzxHrOvq
 D4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9xQwPtQrBfYT0IuemJx5F5so+crXxKK0HLvlBxjKC0s=;
 b=zS2y2QUhaHoNVP0Uw+lJxVauEy+FRpUiFvA0fkRkwo7u6/pWvNPZOV5+7XhVrYs78K
 D0zNjfeq16HyiGl6ud1gEWWyzp/anZd4OPhJVo1StIYGTXSdsJHZaMj5nHha04EKQKyX
 niZlkk8JV3GYZgRjNGZ52kbJdlc+Rzu/5cy1My8qkkDv6ZBq7KTBJD3PK6+u0x/qf0JA
 9JXS8+LEsK3TLxSlHF00CAk06Mrx82vCcGtf3SNEk9L6ixJ/Rgo09OsvQTnMLpp4STDI
 F2aOi89JUppLq4Q5qXEXkzUOab/ma7gnCs/A3xm5apusDK1dz4jQrzYLif5tjaIMqI48
 cOrA==
X-Gm-Message-State: AOAM533bkRPzD99450k9xbqBJ2E5a2SNrv3ioVxWJDRLrb907qx8C5Ea
 Rer0AZ/3uqqF884mW4X5LJI=
X-Google-Smtp-Source: ABdhPJxZw7qCY5xAugBz1OmSZd7IfwPIm4rayHyJ2D2Dl9oe0PTmAbGz9w3tCVGoNe698i+vy9lkAw==
X-Received: by 2002:a17:907:d88:b0:6f5:1321:37ed with SMTP id
 go8-20020a1709070d8800b006f5132137edmr20817558ejc.67.1652201556379; 
 Tue, 10 May 2022 09:52:36 -0700 (PDT)
Received: from skbuf ([188.25.160.86]) by smtp.gmail.com with ESMTPSA id
 a21-20020a170906685500b006f3ef214dffsm6221861ejs.101.2022.05.10.09.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 09:52:35 -0700 (PDT)
Date: Tue, 10 May 2022 19:52:33 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Felix Fietkau <nbd@nbd.name>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] net: dsa: tag_mtk: add padding for tx packets
Message-ID: <20220510165233.yahsznxxb5yq6rai@skbuf>
References: <20220510094014.68440-1-nbd@nbd.name>
 <20220510123724.i2xqepc56z4eouh2@skbuf>
 <5959946d-1d34-49b9-1abe-9f9299cc194e@nbd.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5959946d-1d34-49b9-1abe-9f9299cc194e@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_095241_264579_27FB0804 
X-CRM114-Status: GOOD (  15.79  )
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

On Tue, May 10, 2022 at 04:52:16PM +0200, Felix Fietkau wrote:
> 
> On 10.05.22 14:37, Vladimir Oltean wrote:
> > On Tue, May 10, 2022 at 11:40:13AM +0200, Felix Fietkau wrote:
> > > Padding for transmitted packets needs to account for the special tag.
> > > With not enough padding, garbage bytes are inserted by the switch at the
> > > end of small packets.
> > 
> > I don't think padding bytes are guaranteed to be zeroes. Aren't they
> > discarded? What is the issue?
> With the broken padding, ARP requests are silently discarded on the receiver
> side in my test. Adding the padding explicitly fixes the issue.
> 
> - Felix

Ok, I'm not going to complain too much about the patch, but I'm still
curious where are the so-called "broken" packets discarded.
I think the receiving MAC should be passing up to software a buffer
without the extra padding beyond the L2 payload length (at least that's
the behavior I'm familiar with).

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
