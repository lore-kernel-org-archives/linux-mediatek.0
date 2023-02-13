Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDD0C6379F
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Feb 2023 13:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Ekv3irQHY3cF7rcNIcy6sRi0xjN5QIEztPZj/u+DOk=; b=cKTmhnCKHXImqoP8pc8cjpsmvH
	FI1uWcdz/lT16tQVl/YSTm0nZjz+oONqEerPZOex7B4AKHrWLwo1poM7tO+oynQ0oFLr44WFgKWdW
	ShwoJqXQ1x8UBDCvdta/xQLEv8e5X4WSsB1b8b+66H5eu2Ym8iasfTQFK8p7sz3t0dT/uR+lR7UHr
	MNXxcJxQuA29H2NpVAq1JuaQ307cXIwsVE36TSvAKQ3MarE3VyJ6HNdq77CGQJz6ARVS5CbnpzruD
	bdQobXP9n5wFO343QkxnQaNIEOHxf9GalxuH6MnoaqgOt7/rVF/jdiuKCbFrT7tv/ir9VmGursBol
	vYFfYfng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRZ36-00EpbI-Nn; Mon, 13 Feb 2023 13:39:16 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRZ2w-00EpYn-R3; Mon, 13 Feb 2023 13:39:08 +0000
Received: by mail-ej1-x62f.google.com with SMTP id sa10so31868652ejc.9;
        Mon, 13 Feb 2023 05:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Ekv3irQHY3cF7rcNIcy6sRi0xjN5QIEztPZj/u+DOk=;
        b=mY8CBFuL2YWSzOj6vbdf0Nb/rBR7REyNAGVJgZA2xfwUAAL57EVBfewISvp2Q6+1yk
         spdIB5bcQenbumDWOws5hVDWKTV6mo+YiVBcA5S3H/uW7HXUyJYXh5j99HxbL6X9bvT3
         Y2/fOPlpzC60HZzs/sCzXWWj+IKbP5AcjjGk4gn6jMDYDeBnMyb0dFLxvbkfgBD+UQfX
         Kt43ByqNUDIkNs9qeV++CWlXBJxswPZCqwvltABF2gXaH7WwOuQuy5nCT4C8KUIDm4sv
         8GKQYOZlau+HBvIiHbQorXVfBIdh32eJw/uN2dHBzNrORheVl6JyFN76QZa9Dcdt/Gid
         XoOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Ekv3irQHY3cF7rcNIcy6sRi0xjN5QIEztPZj/u+DOk=;
        b=moIJqjYXt6pUc5HH928ceox3oc/SMmmstFI0uE7/4JyMYhG5u8MAuzWAScHeOlarYR
         pORf2+z1FtDrAMxaLIzr08MM1JhiGSUFryOUn5KFEP8LAXrpmhgx1h6AvIcdwyIYCE/9
         txP4vmITDFCJcqhPPPjIwPfl9FwZf/jOS2SXMFUwlFmreyydRDLjtxoQFNldc6F19uML
         SBpzNNM2HjjfEDrYWK9REPQ6YarIKqj1yB5fjoKOD0cCmrmMqkIRXT99vzAVACiPihhq
         MG90eGlLtLYEJlTCBc6YJx7SRQKk7dz4Ns3j+0XuVXJBYtCO57Ro6ovdy+Anea35fQwV
         AwKg==
X-Gm-Message-State: AO0yUKWDEthbl0z3pKXve5sfHdtF7owSuUQcoGrceB9YHBnTe+UEI0G9
	eYc8fC5l/5i1TM+05TZZMis=
X-Google-Smtp-Source: AK7set+LyPB5jPI4bx2jxEKNBDU92BBUxt4f5nkM8Ny0afwgXg3RuyGHpohyNlabsuH9qQwKrFmy3Q==
X-Received: by 2002:a17:906:1252:b0:889:7781:f62e with SMTP id u18-20020a170906125200b008897781f62emr25321869eja.22.1676295543952;
        Mon, 13 Feb 2023 05:39:03 -0800 (PST)
Received: from skbuf ([188.26.185.183])
        by smtp.gmail.com with ESMTPSA id i10-20020a1709063c4a00b008af21450420sm6849360ejg.85.2023.02.13.05.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 05:39:03 -0800 (PST)
Date: Mon, 13 Feb 2023 15:39:01 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH] Fix setting up CPU and User ports to be in the correct
 mode during setup and when toggling vlan_filtering on a bridge port.
Message-ID: <20230213133901.lh47a6rlv7dseenj@skbuf>
References: <20230212213949.672443-1-richard@routerhints.com>
 <Y+njic6vxAlGp72l@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+njic6vxAlGp72l@unreal>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_053906_895200_8B9EB476 
X-CRM114-Status: GOOD (  13.50  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, Arinc Unal <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Feb 13, 2023 at 09:15:21AM +0200, Leon Romanovsky wrote:
> On Sun, Feb 12, 2023 at 10:39:49PM +0100, Richard van Schagen wrote:
> > ---
> >  drivers/net/dsa/mt7530.c | 124 ++++++++++++++-------------------------
> >  1 file changed, 43 insertions(+), 81 deletions(-)
> 
> Please read Documentation/process/submitting-patches.rst
> 
> Thanks

Agree. I'm not even looking at this patch until it has a properly
structured commit description detailing what is the reason for the
change, and the change itself.

