Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2F1C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 09:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XWqbXxBqlhk93ilN+I71XhhXKPNr1s2PF3ZOU0ymDxo=; b=tHNt8v3C7m4sMp
	5MZ5IkvcXdIxFsyWQN2bRxhbJ0JYRis0hgVOFmrpVX/wrtnRH+bg7VoYru3icJvu2CTjU6S043lMk
	bChONtIyZJHGxmhEjqsOs0xTXUYTn8pvxFPGWuUPZ5F/L7UlV2CG65gECzdzxdb7hGcDhQ1ufq+iM
	Wx3bd2+xjcEnoaD8t7wHAvAqRCdaFOjYoynvFgsAXJi5QwQn3ilAa69MsQpyl88eLX+eWWHLjeZQj
	QqYh6sJSpYcAgFIgMHIuAM5+UAjFl6iTdFhfhQ1z1IMOaaeZlN1PAX9Bm9r4sWBxA2tzJzZKfhrey
	Cs2CiXrOEI9T0v/MNnBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA6y0-004Sn4-Tq; Wed, 19 Jan 2022 09:09:20 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA6xo-004SlR-SC; Wed, 19 Jan 2022 09:09:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2BE7EB8189A;
 Wed, 19 Jan 2022 09:09:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB108C340E7;
 Wed, 19 Jan 2022 09:09:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="GmDnD7qK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1642583343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=28KnNoVV1Kbl+7o1ojcz/PfZRpiIvLKDsWmtd4coQEU=;
 b=GmDnD7qKe49YACCFbopCGc5ngi0WzKrXjuC5UT1Klfqho6xXR4ydzgLY6nPyZnlRMUkLdq
 nXzZ/sfhNSonNQ37z41vcVLjwM1cAekWm0mhCGr9cMEn1nwaWMaTgMC+6QZYNX/WxDr5gP
 UCeMOfuDJT8kZL3dY6BhFMpVVjoqzrM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a0e9604b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 19 Jan 2022 09:09:03 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id g14so5366203ybs.8;
 Wed, 19 Jan 2022 01:09:02 -0800 (PST)
X-Gm-Message-State: AOAM531tNx1NqYjhEKAkJ76YUtU0dTq1sez24Z3Lc9gQaX3FfM4y8Rbz
 kWYJVXemPzvSdWFPxnep2I2K9q7zq22JfwsBOT8=
X-Google-Smtp-Source: ABdhPJzG6z2HP2Fpbnw/+p79pIz+HgBq3C/StXJgsTbO8ywBjYLt7mHo6tRFQLsHVGYNE2zEqTwfSOaO+0Qoz6xVLCs=
X-Received: by 2002:a25:e7c7:: with SMTP id
 e190mr12455559ybh.457.1642583340917; 
 Wed, 19 Jan 2022 01:09:00 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7110:209:b0:11c:1b85:d007 with HTTP; Wed, 19 Jan 2022
 01:09:00 -0800 (PST)
In-Reply-To: <CAHmME9pv4WWATjdqZgwrtHDmq3sX4ABfB9PoNT9Z4tSEduR2Lw@mail.gmail.com>
References: <20220119082447.1675-1-miles.chen@mediatek.com>
 <CAHmME9pv4WWATjdqZgwrtHDmq3sX4ABfB9PoNT9Z4tSEduR2Lw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 19 Jan 2022 10:09:00 +0100
X-Gmail-Original-Message-ID: <CAHmME9rWs_w_dMfDLFuD-tr79cnVyuny4fLn9Wh0+bs76Nt0MA@mail.gmail.com>
Message-ID: <CAHmME9rWs_w_dMfDLFuD-tr79cnVyuny4fLn9Wh0+bs76Nt0MA@mail.gmail.com>
Subject: Re: [PATCH] lib/crypto: blake2s: fix a CFI failure
To: miles.chen@mediatek.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Ard Biesheuvel <ardb@kernel.org>, linux-crypto@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_010909_081272_66547BF3 
X-CRM114-Status: GOOD (  11.40  )
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

Hey again,

Actually... It looks like the issue is that in this file:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/crypto/internal/blake2s.h

this line

typedef void (*blake2s_compress_t)(struct blake2s_state *state,
				   const u8 *block, size_t nblocks, u32 inc);

should become

typedef void (*blake2s_compress_t)(struct blake2s_state *state,
				   const u8 *block, size_t nblocks, const u32 inc);

Does making that change fix things for you?

Thanks,
Jason

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
