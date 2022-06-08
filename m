Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4F7CCA47B
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jun 2022 17:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:
	To:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Q/kE6VQ6y8HdysIbXJkwwQscLE+7DB7AU/pTWtrt6w=; b=RK4hnZT0AOQ+sw
	JlMGT/X8XkvulBg15kxPGHyOtBVXCXQ0pGZEPDH0mv4sW7hQgKIjToS+2NUbRgPc4KRGTXTsBpON6
	az4NcezdIhIkWRtbmyPgB8MGP1jQnDtcEvakYcKfFeGa7ThKVoHx+BhzksbAY57yIJ3pum/cIJtpR
	bwGvKiPyEOrQde9bkUHX3cOWfQaeFI7SKBhFEAdH2eKwQw++VyvD3Ch6n/mcSDteMsBnSytsUNjlc
	zCHvSKgKCddtgAN5a/1KDpcQ6hFb72SVtmPR1xEbGvIVK7qpA9wq84EuU3xFQ+JRejIWO/6RlIVSt
	OKFQJjZTYvnqg81ShtXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyzeV-00EW8d-73; Wed, 08 Jun 2022 17:39:31 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyzeR-00EW55-Td; Wed, 08 Jun 2022 17:39:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1654709911;
	bh=SR1VTuMOXDTjsNlYicSw844o8AeTNjX000JV8bAUIic=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=L4P+F8gecA14ZeUYBilj1mn805fMy+4IuO5W8qlxvEmZVnea+1VpSkzBR3ZoIc+KK
	 pTFseQic+GP2azKNjmb9LlWvRHItqIufW1cAHKCvblQpLjHElsk+/UuObfSDqMyMie
	 TktnoD92HpwjJKlFp1l3D+vaqB2F6uIwkcdiK9t8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.245.76.43] ([80.245.76.43]) by web-mail.gmx.net
 (3c-app-gmx-bap09.server.lan [172.19.172.79]) (via HTTP); Wed, 8 Jun 2022
 19:38:30 +0200
MIME-Version: 1.0
Message-ID: <trinity-c7b8fdfa-11b4-4e5c-90d6-6dd96da1e2d2-1654709910860@3c-app-gmx-bap09>
From: Frank Wunderlich <frank-w@public-files.de>
To: linux-mediatek@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>, Vivien
 Didelot <vivien.didelot@gmail.com>, Florian Fainelli
 <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "David S.
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Sean Wang
 <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, DENG
 Qingfang <dqfext@gmail.com>, Peter Geis <pgwipeout@gmail.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Greg
 Ungerer <gerg@kernel.org>, =?UTF-8?Q?Ren=C3=A9_van_Dorst?=
 <opensource@vdorst.com>, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>, Frank Wunderlich <linux@fw-web.de>
Subject: Aw: [PATCH v3 0/6] Support mt7531 on BPI-R2 Pro
Date: Wed, 8 Jun 2022 19:38:30 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20220507170440.64005-1-linux@fw-web.de>
References: <20220507170440.64005-1-linux@fw-web.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:b5vLgY6x8wk0IfFlmacN0mlyvljNM3lzBAp6gZ3YYSyGfOwKIWWsICLx3aTIAj3wYk/H5
 KVQ8p8tAQrEv3DQDo7PQzbkzWkokqRFf5VURxU6LUhBvPkAKZ9FZw3ZaXGypApq2yw2Ceb05qSGM
 XRJy/ooHfrCvcRmLD9Ke0/z1BvxnrEIlnadqGaoJ1UULJfp1IYpnx6rhukiqQ9/97t7RF/EBk44L
 sFcuSdyJtzl3S2x3tomYxVO9hsvM/5ek/0SO3qkAI58RWVUfRNVJl44Bu1VF36NtG8GHcyq7WKwL
 vI=
X-UI-Out-Filterresults: notjunk:1;V03:K0:Tsy9Ri02RQw=:VA5cKMITPNkPq9WTs/tyI5
 IjrtX4u3TO8GPfPqH+1pF6qOd/RzV5bHzcfPzolKqrEJegNSwOR9dRj11z4LI38lhFvcnmGR0
 XB8FVZM2QG8b3Q8t4QhZnkjw6viiWfwYAxQ98ij+WD4+LgI3nw6PI4brmkiOWww4oEO0inDGG
 9YloHncR2sFyBA5eBBGlLHzk6MzUjs/0m8ylNlLehz6Er50By1lF7JMVO4bAF0+upZfPzf7zX
 kJxoCLq3xjhdP21hWx7QWTVCKQOObDnxm7dHAUlXvxzHurGAmEhMdpeB3I59kImogpVtEqCyJ
 AYHEv1jo6He+6AI1JgA0Xm3k9bn4UTeSuINvJDLZ2QXNHXRtJzWNQFbS6AG3y82lZKFRNXast
 FTjc1TifJ8RpkrrkLVTvRginX7LjqJBJdsv2sLun6kZjRCf6ZFmNw4MTCmwdEIoyW4soi74nH
 PAzPg0Sfi/DgFp6WpztZpmLTIiZUD7ISQTNOM+tPfYMxR8lBwle894MCVvcge7kOfrokpcKyf
 zS5h3DyIvETKIvLWdE44K027QtM+lvqdGIz3l/VHAR8DIWPm2DTNJAm4AZr7Pxr5FS/JJTcAe
 gi8SSBK0BZjlNzJ7JKhe3F31W8RHOqLYKMRCd3hV7ccjCy+8adYSwSkmMn+RiyyTpAmgYOlCz
 8KfkD6OOFkcVrUeoyoNIPyCD5rFo1DJQf2BcOTB/bQumkAhPlHa+V6dyvOcipGdjZ2kMX8uty
 y2zow8tcV+TjBJDzaggVBQm1ein3QpSVMiDHkQSWJ7S3aay+x6lWp4lYTnz7JPTIy+lmJv/Jl
 YwcpfGn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_103928_540970_6C4DFF94 
X-CRM114-Status: UNSURE (   5.89  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

just a gentle ping, is anything missing/wrong?

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
