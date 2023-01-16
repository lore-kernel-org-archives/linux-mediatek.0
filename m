Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0AFC46467
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 17:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UD4ZhaHjRcn1J2dnBAvslht8N8U56Uf/Euv/eC9LvAo=; b=miKvjKUN6bisYb
	2mr1NmqDtQFETvS7NhHOAxU9mph9NHhUoBE7m9WvVuJV5lF1OG8RAsnGQEl0eRvWweNNMsOtyeWbw
	BcMwGcOwe/wk0SxbQNgKW8FLOS0s3UU4D0LFVhYiXGYDGYRHJ0rYVYQoN1TfaxgedQ64DNCxGVky3
	LbuORsFD1RsOE8Qyxzdj3Ww+JANYK4lnTV2UjpzE4Ryf69RxNNHOQaPn5v5+hgiPAmxQ17hneonUR
	3ciaXVqvKZbjJEXmysxtePPxJZZ3Q9wt0zndvSbgrr9BSi0XA/DBvJQfdLy7TvM4PQ3U+evBmFzJY
	Gcbv5OrRaA8oiBcqGA1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHT3L-00BWJq-0d; Mon, 16 Jan 2023 17:13:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHT3J-00BWJ5-Vq; Mon, 16 Jan 2023 17:13:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UD4ZhaHjRcn1J2dnBAvslht8N8U56Uf/Euv/eC9LvAo=; b=Qa9/mUi3KraNYDEUX1VHIktJ02
	k/iLIbJZPkfswduCBRDnpLRi+TlNap6f0gvBgvPJa0I7bnkRlkvXOdchvbXkWwQX2e5pZsay/UgxD
	/jWizIubZygg6yyp9OmjjW8h1Mx80GYKwc+w60hoiUTKZRkoOjnHUA36UClUpDBOcD/kQOk6oxZEt
	3Dw1vXXS6rOW1vKUk57aymaLekq2YLGvdT/kGH6etCC7OqNuW+WP7XXREaLgZ+pAiKSJs5k2HUmH5
	G3l5uizvXjFy9W1FkAyAFrMlcxn+edeaj3MO3LR95VSo9NI76E02sJKAZCalP/t8tUClS92vq4Zr4
	VzT3Ervg==;
Received: from dilbert.mork.no ([2a01:4f9:c010:a439::d])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pHSfY-005ebD-18;
	Mon, 16 Jan 2023 16:49:16 +0000
Received: from canardo.dyn.mork.no ([IPv6:2a01:799:c9a:3200:0:0:0:1])
	(authenticated bits=0)
	by dilbert.mork.no (8.15.2/8.15.2) with ESMTPSA id 30GGmpaU2102783
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Mon, 16 Jan 2023 16:48:52 GMT
Received: from miraculix.mork.no ([IPv6:2a01:799:c9a:3202:549f:9f7a:c9d8:875b])
	(authenticated bits=0)
	by canardo.dyn.mork.no (8.15.2/8.15.2) with ESMTPSA id 30GGmjDj2045637
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Mon, 16 Jan 2023 17:48:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
	t=1673887726; bh=UD4ZhaHjRcn1J2dnBAvslht8N8U56Uf/Euv/eC9LvAo=;
	h=From:To:Cc:Subject:References:Date:Message-ID:From;
	b=PTdLyuia0bJNc5u9zqdnDShXdiE3GeI5ngqK4fbBuVluwBjD87vjwLYx+IzeNJZv/
	 taALeumzB0roYExAe6bLKOftCFkFWWhbdUomsV6d83GY5tsvqNetimULAxzYSvGevl
	 dGFFWwI74DAMZsAEcTMM6rq4JHme9kXjXVMurB0A=
Received: (nullmailer pid 377843 invoked by uid 1000);
	Mon, 16 Jan 2023 16:48:45 -0000
From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Subject: Re: [PATCH v2] net: mtk_sgmii: implement mtk_pcs_ops
Organization: m
References: <trinity-d2f74581-c020-4473-a5f4-0fc591233293-1666622740261@3c-app-gmx-bap55>
	<Y1ansgmD69AcITWx@shell.armlinux.org.uk>
	<trinity-defa4f3d-804e-401e-bea1-b36246cbc11b-1666685003285@3c-app-gmx-bap29>
	<87o7qy39v5.fsf@miraculix.mork.no>
	<Y8VVa0zHk0nCwS1w@shell.armlinux.org.uk>
	<87h6wq35dn.fsf@miraculix.mork.no>
	<Y8VmSrjHTlllaDy2@shell.armlinux.org.uk>
	<87bkmy33ph.fsf@miraculix.mork.no>
	<Y8Vt9vfEa4w8HXHQ@shell.armlinux.org.uk>
	<875yd630cu.fsf@miraculix.mork.no>
	<Y8V+pvWlV6pSuDX/@shell.armlinux.org.uk>
Date: Mon, 16 Jan 2023 17:48:45 +0100
In-Reply-To: <Y8V+pvWlV6pSuDX/@shell.armlinux.org.uk> (Russell King's message
	of "Mon, 16 Jan 2023 16:43:18 +0000")
Message-ID: <87v8l61l3m.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 0.103.7 at canardo
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_164912_774072_65DC8BD0 
X-CRM114-Status: UNSURE (   8.19  )
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
Cc: netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Alexander Couzens <lynxis@fe80.eu>, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Frank Wunderlich <linux@fw-web.de>, Paolo Abeni <pabeni@redhat.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

"Russell King (Oracle)" <linux@armlinux.org.uk> writes:

> I found the document for the PHY at:
>
> https://assets.maxlinear.com/web/documents/617792_gpy212b1vc_gpy212c0vc_d=
s_rev1.3.pdf
>
> It seems as I suspected, the PHY has not completed SGMII AN. Please
> can you read register 8 when operating at 1G speeds as well
> (VSPEC1_SGMII_CTRL)? Thanks.

Both phys at 1G:

root@OpenWrt:/# mdio mdio-bus 5:30 raw 8
0x34da

root@OpenWrt:/# mdio mdio-bus 6:30 raw 8
0x34da


Bj=C3=B8rn

