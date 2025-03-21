Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C5C8C36000
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Mar 2025 17:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VM1LB5RPRJUoaX/SK0r0zxXUzjTWyAeypB9AEGb5D3Y=; b=ULvNiizEz3z1LqBQz1WqCFsi63
	zt5OEmOSbMyu60c7eAf7RnWEzFao1Zfn6FnkiZ1f7BekI0Z+Vk82mdOrEVxn8GZDX9WYdC844BQ03
	B5sQKilLH0oTzw+aoQyAjccxJ0675zGIWT5OSX21Cd4FoDfmuE3onpD9c4up52PdQ+7RRBEzchrbd
	+FrYtpHoRBOkBYaLbK96laYTTQjstZXWduy9ZBf7q+8VggUiDcByVA9imU1aYciKcybyGbI9S0n5U
	Pn1Y+jgPhHo9VRaU8Yqq6JPwAZr0MeVou3M0owvnpG7ZCaNCyqrJHArEygMtuYDdKCAQWGom9IDD3
	sXVfb+6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvgHR-0000000Fil1-1m6P;
	Fri, 21 Mar 2025 17:35:37 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvgHK-0000000FijU-0klE
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Mar 2025 17:35:31 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43cf257158fso16113995e9.2
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Mar 2025 10:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742578528; x=1743183328; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VM1LB5RPRJUoaX/SK0r0zxXUzjTWyAeypB9AEGb5D3Y=;
        b=BcOQU6kt9tLcBdAKXylSbAsWQ5J/Mi+A/XDpR+HeIxX8wP0rjDX+058vC+Md8fBzmo
         GHI8aO++Jior5o3rt8vv5F7TQ2KLwaE8wM3l7S7U0PK7m1CPsVdnN5ihfPsoI1fV5Saz
         +RkmJ579G0pL7a46TVU34YzAqZMG+h/XQ2pGOOMb98QkAQIgywYxKwPS1Q4yGsC/gA2a
         JgersSQ30UABAoTytHPSp184AVBYg/GwxxTJxBCATdSVVK+V6BPt5/M3zaFj8NJnERCg
         ndfuE8MH8aUILsV0EpA1fljMAa1Ny5sA/kZZqowedK01Si3ObI9jyxjT+kqv1TzwtpY/
         x72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742578528; x=1743183328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VM1LB5RPRJUoaX/SK0r0zxXUzjTWyAeypB9AEGb5D3Y=;
        b=BRYlAthTmRO4J8WsYLYcwTdBXyg0CqrpqBunnqPRA71pwFdX+O0JTsnCaIjWaks+xs
         5wbGEJlzNmX0F0wKfiTdUyfmBacByzaZ6a5boGu542E3qYM5C9BOH91KcOurkWGF1hGP
         ZQ7bA0vN/sccCVNSapleNhTcbeSyqDm68xEySmKN5op/Kya41vRe0oHwiI8DsvhNH/EU
         8kIFBfD8JZeWlmEBJs5MP5KWCauVSUCRhUqw+HBjUEKiHZTJ3eaBhm0aAztkJELLNFHR
         ld9xJIO0JhuK29m4gLHt4RDPRri9jtAg6nOi+3xihGnNriQKshROBimmaXqySN5yLu4j
         SEmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfiOfwo3sYIWPFWDBGxnO9/JL8SP19+TcNqOUl+UWTCsfZV4zKu/K3SFETUH0kpOA+N0EqFQROPimsCr/82w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8+3bVaz+jsraCdrxjqNNVzIAsAqXpBErgPNGGGwBjG+9bwMIJ
	XTz3xQtLlwXexBv1BUYn3JZqkyFxuvgywGsImEWLQRX8xyHQZ2cDLNjzw0Ampj8=
X-Gm-Gg: ASbGnctidCt8lZWmh/xN5xNF+ptOhASJ01myuncZJba6Cy9u02sfpVNhBuUkeM2bE+y
	X8Lszi7DuUgZn1XV9cFrSTrdssU/cIKyrtXI7rM/cV3PNyCOYtedtN9nYzAAVzyD8QbO2Ze+Koh
	CRzQTTdC0g3fPyOtnZUZMRBz9Ia6RQi8t/IZO6LCmVq6tBA/mIia/jHuZ4gRwZKo007ofS+Q88E
	iFVrF/pVH+EFtN397zOh3vFCpaaY2h5wZk1r0UlOXlm8gBqVc1/fjs8NgMlbreN9i9DewZGqMYu
	yRCGKeuZ2apCshJ7rh8icnOI/yRwkxnoNmUJfakXZE5uIICjIw==
X-Google-Smtp-Source: AGHT+IGjauLF3FiaekujjWRPdiwnm31O9jhDz+mK3nAqpBJ67EtcwutfqHgUb3S2fV6TNS6UHTigjQ==
X-Received: by 2002:a05:600c:1c19:b0:43b:cd0d:9466 with SMTP id 5b1f17b1804b1-43d509efa30mr35210415e9.9.1742578528065;
        Fri, 21 Mar 2025 10:35:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d4fd181b6sm32529655e9.9.2025.03.21.10.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 10:35:27 -0700 (PDT)
Date: Fri, 21 Mar 2025 20:35:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Qasim Ijaz <qasdev00@gmail.com>, nbd@nbd.name, ryder.lee@mediatek.com,
	shayne.chen@mediatek.com, sean.wang@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	chui-hao.chiu@mediatek.com, Bo.Jiao@mediatek.com,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] wifi: mt76: mt7996: prevent uninit return in
 mt7996_mac_sta_add_links
Message-ID: <356de8c6-b3a2-4f7c-9737-011a91c4bdfd@stanley.mountain>
References: <20250320201914.48159-1-qasdev00@gmail.com>
 <46a714fb-8a14-4d24-a0a6-a22cc9d45768@stanley.mountain>
 <Z92eiVIFIUOFKXj_@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z92eiVIFIUOFKXj_@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_103530_219644_C9E0DFB0 
X-CRM114-Status: GOOD (  17.90  )
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

On Fri, Mar 21, 2025 at 06:14:49PM +0100, Lorenzo Bianconi wrote:
> > On Thu, Mar 20, 2025 at 08:19:14PM +0000, Qasim Ijaz wrote:
> > > If link_conf_dereference_protected() or mt7996_vif_link() 
> > > or link_sta_dereference_protected() fail the code jumps to
> > > the error_unlink label and returns ret which is uninitialised.
> > > 
> > > Fix this by setting err before jumping to error_unlink.
> > > 
> > > Fixes: c7e4fc362443 ("wifi: mt76: mt7996: Update mt7996_mcu_add_sta to MLO support")
> > > Fixes: dd82a9e02c05 ("wifi: mt76: mt7996: Rely on mt7996_sta_link in sta_add/sta_remove callbacks")
> > > Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> > > ---
> > >  drivers/net/wireless/mediatek/mt76/mt7996/main.c | 12 +++++++++---
> > >  1 file changed, 9 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
> > > index 91c64e3a0860..78f7f1fc867e 100644
> > > --- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
> > > +++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
> > > @@ -998,16 +998,22 @@ mt7996_mac_sta_add_links(struct mt7996_dev *dev, struct ieee80211_vif *vif,
> > >  			continue;
> > 
> > What about if the list is empty or we hit this continue on every link?
> 
> we will return 0 and I guess that's fine, agree?
> 

Fine by me?

regards,
dan carpenter


