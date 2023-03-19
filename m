Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D572EC6FD1F
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Mar 2023 15:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:
	Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FaY0Xl4jfnqhSvRMHOlCX3MBxMkltd1/bLTF73k4weg=; b=iFGN0+x2GnIpf9VgWRgIuMifWp
	UKCVxHg7lGs1inHSU6js20hCuDPWiahyUiN2kZVcJNKpPRIlm0CrZRAH0thZDvXdQPZMehg4ntkW6
	B9zZ2dYHNNI0gdfwefbQO5hCwmPaE8ytzEHqzLHPeHIWb159zpxs2gzzOuc8CxfU/WMxNo0h0aStv
	ecyHWzdqIbY9VDN/D32ELOanOdh+xVsSTAOt6RmFuITb8JAs4vli64GfU71aF6fz1Pjc2/f6mWb6Q
	hRIFY1qim695SI4GXwMZqZoQ1oPIgpLpVUodfZXwURgNwNwEIB87YvvcP71Jpee2HzRnqOBTpykRp
	PyAcSuyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pduW6-006tJe-2b;
	Sun, 19 Mar 2023 15:00:15 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pduVy-006tGL-05;
	Sun, 19 Mar 2023 15:00:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1679237974; i=frank-w@public-files.de;
	bh=FaY0Xl4jfnqhSvRMHOlCX3MBxMkltd1/bLTF73k4weg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=m+78KDG7Mmcwc7gj18tQBa5KlnttrpkmTbH5ILg4BO57oA/iIFDrmKTGogVyvT0At
	 3NXfJtLhYF08QYSW58FIVQilQLC6uEN860tc7QQ0HNONXFVUF/SU5ZnxudwUmctBlA
	 1dzbg+GY1aUSTqPNFbWzy4nCgEu59+hILd8JJ0XcAdK/4jOyV7G9TweEKRFrFLXxk8
	 L/0samKM+ZUHOs2piwAUOUFUlBDYV4xQjH9ZfmnZZFivYPEaukRvU5FKw8M+JUe0Qv
	 gVafW+DOXWiz/Rx5SGvuCVKjBDBNqfIMfvXaWEz7URPR6lSwOg+M0zbRHvnSYMNyXG
	 tV03zE+CicDgw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.158.68] ([217.61.158.68]) by web-mail.gmx.net
 (3c-app-gmx-bs27.server.lan [172.19.170.79]) (via HTTP); Sun, 19 Mar 2023
 15:59:34 +0100
MIME-Version: 1.0
Message-ID: <trinity-0a0531c9-44c0-4171-9d5b-3607df6175d4-1679237974351@3c-app-gmx-bs27>
From: Frank Wunderlich <frank-w@public-files.de>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Russell
 King <linux@armlinux.org.uk>, Heiner Kallweit <hkallweit1@gmail.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, DENG Qingfang
 <dqfext@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang
 <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, "David S. Miller"
 <davem@davemloft.net>, Vladimir Oltean <olteanv@gmail.com>, Florian
 Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vladimir
 Oltean <vladimir.oltean@nxp.com>, =?UTF-8?Q?Bj=C3=B8rn_Mork?=
 <bjorn@mork.no>, Alexander Couzens <lynxis@fe80.eu>
Subject: Aw: [PATCH net-next v14 8/9] net: ethernet: mtk_eth_soc: switch to
 external PCS driver
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Mar 2023 15:59:34 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <3979b99300067c595a4406dbb0dec3ca9ba14952.1679230025.git.daniel@makrotopia.org>
References: <cover.1679230025.git.daniel@makrotopia.org>
 <3979b99300067c595a4406dbb0dec3ca9ba14952.1679230025.git.daniel@makrotopia.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:sU97e+lgcCfTk1IjrHuZB3vZAMLNfgAeGL8Gt84Pf1cml7G8cpK40yiE5ipilxbyng1/N
 Mgsp56itmfUxpBaGUbCJhbnTtPcUEpk9qwGxhGvYfEwKlxip/NqrxQc8qNpqhFpQlvdIrehVd0Wl
 J+2YTMELPeGRjBw6j/y+/EuD1GnG3BdM7DIgqFDcQLytk38JmOVNp/TTM5wc7CsbCUyBE9IsI168
 TV0FSDv4Go74vG9Q/w6oZg9uiy568Sjd/3G2B/qvfBFS7xCBVsIXZu0Hvz9rvNrg+H1Ah1oN+jro
 sc=
UI-OutboundReport: notjunk:1;M01:P0:F+KgMaH38GA=;QHG/JQQ7xTXbN5KWA50Q7bm/nls
 UmA8y9ZKTD+xKs3Zgq8yKQgg1V7m7dYVxUulOqVHyfaJ6OUWHjMo8EEt4XsmwOTHW5Vf5EuJH
 0wDqQrruFU+U8m7q+RvWeS8uZy9kQc+gNIGaRGyrIG4VY7CyA+Juc6NKZ7vy3N2TKBlLcvG7k
 PDNUr1mPa0/MxCQ6GNtVeRzrmfnXf+ACOhgUaL789SROQlrGcnWtoBHY0iJ6JWxj9MlbGZlGX
 gccYchrjZSSzDCbyTjcmPX5IQ5Hj2tQEd+EO887fFh85jcsKzjQAcRCmVcZjKGS+xVrIXdgPA
 jc+bYaI+Hnpxz1LxAfp0JGQYIE9glaqWfZ/W0b5QY7+TNRACjEZ075+dbBQdw+clC5fQNanOC
 m1z8W6mRIVvYCPQSE7c0CxCsplJ6QcQi6pJCMevdZOXWvXW3Oo7tLqNUiRAZjQyw1edCFw5Yk
 BKXf4msGfffE1horaTG+mXrKgaijbtcGvg2g2vCpCPLeuyqpQoPSGsBUSYW1m55yReUTlksCe
 pjppl/Ww/EctJFjBwTlgwN0FEfG/FFhwvSCo0O5mu/NQHcU0+ahO9HyZVWqLQ+W/ahRpF+YDr
 BxJK3fCN9Fe9BIC66iJ8PQ8l9YQ9CMQSWuIkulftmgjaZFo0+8L48ITdC1zzTrH9COPsh/DFG
 SXnMlVHemBigLD1E1ROzpfMqlBc8m4Oq3S0QDF3fW0UMXMOgdL64Zvgn+3FaZ+VsP62WHB+/y
 HIcl4cVM7og24z9TuYNcLsQb0cIBg814K7nssCSl8+JlkzBbeQyYFj6uGm25/TrV3oFxK/Fnh
 V8VqpqRHPqFA4SpyPda4wFBA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_080006_457438_A0EB6DD0 
X-CRM114-Status: UNSURE (   6.51  )
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

as Patches are the same as v13

Tested-By: Frank Wunderlich <frank-w@public-files.de>

regards Frank

