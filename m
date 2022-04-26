Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5F3C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 15:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:
	To:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lS27CejbDuOph/Npvvj71vKG9NtnNIsVDknR2WMf2kI=; b=pjlRyyTjhuBSxB
	euOBND3MI9iB3/1tf1B6JN6pEN4GFS5YchXG14SEnjog+qtiGVk1Hd9fqOCKZ7kSPiyzagjQ2Cl+5
	zmu7U4xeBXq/hKQOzT6oRwHu5Ey925xgzw6kDlYhZT4IHgGLMxD5V+CY2akg/xDLAoL6zmIA90v53
	HH2fqerVRJ7ue1RqY3Uh4/5EripAn0Zm4Qx7WPiRS5X/5I4dD8U1jdVKkDQXdiUET2iQtCPUCaJ1o
	nXEy673JKLUJremLlYNQHvfOF/+E2Yg7TJk3EnDN6hzyC4tAV69tGYQrWoigSdwvLVxCdJ5hIxAJl
	48pJ/8TDiHdrAU1yzLKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njNXK-00FDc9-C0; Tue, 26 Apr 2022 15:55:34 +0000
Received: from mout.gmx.net ([212.227.15.15])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njNXH-00FDbZ-8X; Tue, 26 Apr 2022 15:55:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1650988498;
 bh=+uwTgSk870dLCafhDkzOxCr0gxrFZo8oIiVRNpUgjxw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=WvNzdKY7hs+BgwhN7wXol0XS/z/Ots6c7Jlv0oLfjg4kA9ekHnXX5L7KukI+VEP1Z
 9TGWNi3upmFSAL4ttqyqUKouuE26zLHKkjRcBAcjvAWelzw0IQm9B5sQkL5ksfmpmI
 8Cafg5YH0ijTp5BYmLxx5z4tMU0JIWWjq9W9ZLl8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.245.77.37] ([80.245.77.37]) by web-mail.gmx.net
 (3c-app-gmx-bs69.server.lan [172.19.170.214]) (via HTTP); Tue, 26 Apr 2022
 17:54:58 +0200
MIME-Version: 1.0
Message-ID: <trinity-5fd6da8c-15f6-488d-a332-0ce7625f41e0-1650988498781@3c-app-gmx-bs69>
From: Frank Wunderlich <frank-w@public-files.de>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Heiko Stuebner
 <heiko@sntech.de>, Sean Wang <sean.wang@mediatek.com>, Landen Chao
 <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Andrew Lunn
 <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Vladimir
 Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, Peter Geis <pgwipeout@gmail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Aw: Re: [RFC v1 2/3] net: dsa: mt753x: make CPU-Port dynamic
Date: Tue, 26 Apr 2022 17:54:58 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <046a334b-d972-6ab9-5127-f845cef72751@gmail.com>
References: <20220426134924.30372-1-linux@fw-web.de>
 <20220426134924.30372-3-linux@fw-web.de>
 <046a334b-d972-6ab9-5127-f845cef72751@gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:Fgi7a4fEdw0Rapedaq92rPzpjPENFNV0BfWWGZFUChr+5fCjGueyqjoBBRMNFb0Q5DDLH
 /VsZ4eqkhIUdb5lh7xIwRf/dlmyy4oBNpH8OalTeL0K3PeBlKTGoee0DeEHmVNv/lp4JR+5oNuV+
 6o5Ioqg7KG1m67yiS3cZGCr932lK/gL5C6mOTvTC3QWg1YRaIHYE/tp6osFEeCUh8THPNLoUTlMv
 vZYkxkSvkt2WdqIo1vGOkwahfIPdPPI7WltPZN1IuHEbdol8I043XgQqmnSfT2l7oSJ2xbrh9VWb
 /8=
X-UI-Out-Filterresults: notjunk:1;V03:K0:g75iAmkQXKI=:v3mm/49qfDkDQxVAtBGPtp
 zWta+IpTcKMI7MHiHPE+KOJCdKSW4EbFtemmtWyyUTFuuB28OGt/6DjUcvaX/f4Rdm8Pw2K0U
 DbVDdLNsa3UMBn7dJZXv8IoKEESFKihFR+HEf2QAyhhoxqxbqdmPuloc/ITWfKhwJgx1uTnXX
 wm8sqh2XAcbPIuT87gPunskNYN1XYcAyANMgHx4FUcfmsPvS11k3tV4VOLJ9wPXj612Fg7lYw
 0/StL/P/TVQcIc7SwFORctBkfZYXokn46pZN5AOKal3qW0Yc8VRcIvclNqeWwhwbTMoUsoNp3
 nrOZfkBmRLlF9o76CUyfxTxIcRB/IhwtWp2B34dS3ZvwiL2OD000JuwJIDGjD3ha9/kZZ3rLp
 en9spbGPLwFOqKG1p2tpl8cY0VcI/yJRdDdLWf5ZBtIA+EAC0NHnVpry8MX/jdM62nn7ecDqd
 gaooIhL2qet6HkqXfK9eSqSiQKC9mRBIJ11grrag0g/0VV4bQeaZ8mx4NKmCcRte48KgWMIQ+
 uGPW2HSYKZdtVPU06UaM1RK3cNwdABYitAqIANKgnp96qwQt5m3LgPdL8Hu/INZ6rh2t6GGxy
 /z7rNlKj9mUseksFapIvtt6IshoJjtJzO04iEniSg+jW2PT+l9CD5yn56RMwgxWqbP/ZzrdIn
 onZrFZut+OYTWfrhpJYp83VeKSBshZGbK+t8IJSlvxaYmHvI587CJ6VHhU+DpWSEF6Bp2e2sa
 YswctYXgN7vTXO49TYd83xqSqBsb7CyC+b9FNzb2CrZUMoMvqFLBZG1C/PkZvQGxHkl4M2WyS
 RnbiApc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_085531_635481_A325F859 
X-CRM114-Status: GOOD (  18.10  )
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

Hi

thanks for fast review.

> Gesendet: Dienstag, 26. April 2022 um 17:45 Uhr
> Von: "Florian Fainelli" <f.fainelli@gmail.com>
> On 4/26/22 06:49, Frank Wunderlich wrote:
> > From: Frank Wunderlich <frank-w@public-files.de>

> > @@ -1190,8 +1191,8 @@ mt7530_port_bridge_join(struct dsa_switch *ds, int port,
> >   			struct netlink_ext_ack *extack)
> >   {
> >   	struct dsa_port *dp = dsa_to_port(ds, port), *other_dp;
> > -	u32 port_bitmap = BIT(MT7530_CPU_PORT);
> >   	struct mt7530_priv *priv = ds->priv;
> > +	u32 port_bitmap = BIT(priv->cpu_port);
>
> No need to re-order these two lines.

imho it is needed as i now access priv-struct now ;) which is not available at the "old" position

> >
> >   	mutex_lock(&priv->reg_mutex);

> > @@ -1503,6 +1504,7 @@ static int
> >   mt7530_port_vlan_filtering(struct dsa_switch *ds, int port, bool vlan_filtering,
> >   			   struct netlink_ext_ack *extack)
> >   {
> > +	struct mt7530_priv *priv = ds->priv;
>
> Add a space to separate declaration from code.

OK

> > --- a/drivers/net/dsa/mt7530.h
> > +++ b/drivers/net/dsa/mt7530.h
> > @@ -8,7 +8,6 @@
> >
> >   #define MT7530_NUM_PORTS		7
> >   #define MT7530_NUM_PHYS			5
> > -#define MT7530_CPU_PORT			6
>
> We could have kept this define and rename it MT7530_DEFAULT_CPU_PORT or
> something and in m7530_probe() use that newly renamed constant to
> illustrate that we have a default value assigned, just in case.

i do

> >   #define MT7530_NUM_FDB_RECORDS		2048
> >   #define MT7530_ALL_MEMBERS		0xff
> >
> > @@ -823,6 +822,7 @@ struct mt7530_priv {
> >   	u8			mirror_tx;
> >
> >   	struct mt7530_port	ports[MT7530_NUM_PORTS];
> > +	int			cpu_port;
>
> This can be an unsigned integer since you do not assign negative values.
> With that fixes, this looks good to me.

ok, i change to unsigned int

regards Frank


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
