Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D54FC54E58
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Mar 2024 23:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FiJ+R0V8x+iDU6ytEfCje6FfFVIFSI4Ytd3TAwhjQD4=; b=avjevlfjdOmXaHcTX2UHrFd6A6
	n77yEXqXjjhgAAQEgSZXu2ZXqb05Hd76+sQtxIhECu6hy+sQWuMLoqLeWE5kL4RsnJi0THcIq/xXp
	rBaoYK17x+Q6GyhHOPOZu0G3K+PoiaFsVkh+gsaOKbQbKfh+bL+rf3l/Q9bm41aBNd7n/AFcbCSul
	/3FdAI0mOmkR6IguH8zAYh1QCjqsv/K8ey6tY2F3FRqAkJeyZz8NKPz6oKQ4mXcCch/qMYPvLrqDt
	2tDT/VluVwZV/IcnXJb5awbxoilJvpkdBvJUX1bOVCRnHEw+lbJKKSdZ/1kjcixXS26ft3JYq+w6U
	9s72gzYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roAbE-0000000BNXr-2Vgq;
	Sat, 23 Mar 2024 23:16:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkQxK-0000000AgJw-0czY;
	Wed, 13 Mar 2024 15:55:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A68BC614A6;
	Wed, 13 Mar 2024 15:55:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72F10C433F1;
	Wed, 13 Mar 2024 15:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710345348;
	bh=FiJ+R0V8x+iDU6ytEfCje6FfFVIFSI4Ytd3TAwhjQD4=;
	h=Date:From:To:Cc:Subject:From;
	b=kzSum1ScGGvWkqjI0i2EWiz26fP3/TQ7CGCK3CH2Lgm6UgqWH1VdPAgdlbnSQJAMY
	 /Bor3LPUvjkJrYhe+Rv2FWImgdPxm8IaLpymjvNsOmn8BZYvMppIf6Ml5CXST6M+8F
	 hIilklsxSvv3tsEEajUbjuNyVHVlzzXp3rLV4dWt4dfsqzyrkrnu60JhL5A2/ijGof
	 f1h4uLz0yA8XMlIEVn89Cl2mAE7fd24vg6dyXIn3QiG1CVD12xnERPsnUXtlFBVN8o
	 qae8WKPkIIN6VhweNx/uS4zNvkRhDHLmkp9VLCU++ADewu3E2D+dKwFmzZdjzvO2Zw
	 3TkrK8qjUz1yw==
Date: Wed, 13 Mar 2024 08:55:46 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= via B4 Relay
 <devnull+arinc.unal.arinc9.com@kernel.org>
Cc: <arinc.unal@arinc9.com>, Daniel Golle <daniel@makrotopia.org>, DENG
 Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Andrew
 Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Vladimir
 Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Landen Chao <Landen.Chao@mediatek.com>, Bartel
 Eerdekens <bartel.eerdekens@constell8.be>, mithat.guner@xeront.com,
 erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Justin Swartz
 <justin.swartz@risingedge.co.za>
Subject: Re: [PATCH net] net: dsa: mt7530: prevent possible incorrect XTAL
 frequency selection
Message-ID: <20240313085546.710679b0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_085550_250882_3F4395DF 
X-CRM114-Status: UNSURE (   3.74  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Sat, 23 Mar 2024 16:16:27 -0700
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

On Wed, 13 Mar 2024 14:25:07 +0300 Ar=C4=B1n=C3=A7 =C3=9CNAL via B4 Relay w=
rote:
> Reported-by: Justin Swartz <justin.swartz@risingedge.co.za>

That's way insufficient for the amount of diligence and work Justin did.
Co-developed-by, at least, please.

