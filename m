Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0364C46CD2
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jan 2024 17:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wXHLNCaoB8c2KX+O06HEmNoziRnttpcnlBxXvtkvLog=; b=VsJdRhZsabdipuV3LnTA/hQcbJ
	9QZZdazCTWML4/5bau+zW7v6sWVpPXz1Anpf6Bduf0umlmJWkOHgF0B4y6Y48bD7gJNEeUoxrjIw6
	Mydd73Q4k+LE1yGRYAWMAOSjC7KZWxVs0UNfMZcnCGZqc4fnbUC+Qc39WsY7rOKEIKvwX3TsJqKKe
	S7efispVdFLIH3VuIZk9VFchoS0Aau3dVEj3KRl2XyQdTTGnZEm931iLfVYt73iIZZsgJrbexELIw
	nNAIzVzSJ2UjecKUBT9l2UI4UlrAMaZ5duBWD1cEmSsVZyGQr23aZleaQMPG/Ud4RzTjuLyM1PJN6
	Bqpc4DdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSgdl-004L3w-0X;
	Wed, 24 Jan 2024 17:02:17 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSgdh-004L2B-2c;
	Wed, 24 Jan 2024 17:02:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1706115719; x=1706720519; i=frank-w@public-files.de;
	bh=wXHLNCaoB8c2KX+O06HEmNoziRnttpcnlBxXvtkvLog=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=IwakDZfmY7L6gQILVBuuBiQUXfanBrOXZqA0areXs4eLjTRI0dCF/O8jfs3tHQpU
	 onDsvepLbjl09x1JVyKvCr4reXMuieL9UbdewkohAaV1h4naxzHhWQ5AzxX7hfzne
	 bAXF37wwVzOGhAY3goG8RtTZaTtazmHP8BqAOtu+e9pCbxeIiq8yxQpVxoIxAife6
	 HEnpZNP8ZJdtDHFFuQhfp3wnfsfS2pW6vOVs1MhEUeBy/4J8qsLNNOzyDa6wV4KAc
	 6tLzfW+AR8c688FQ5hx/11Yt308mJhL8rRNlZMAXn1LETqo4+3GuCSSiRIYpNKQ6c
	 1FJV8IdHcC7ltQP+Vg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [80.245.72.177] ([80.245.72.177]) by web-mail.gmx.net
 (3c-app-gmx-bap04.server.lan [172.19.172.74]) (via HTTP); Wed, 24 Jan 2024
 18:01:59 +0100
MIME-Version: 1.0
Message-ID: <trinity-08c06a61-9397-4097-9a54-9f078ac22af7-1706115719411@3c-app-gmx-bap04>
From: Frank Wunderlich <frank-w@public-files.de>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <linux@fw-web.de>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Sam Shih <sam.shih@mediatek.com>, Daniel Golle
 <daniel@makrotopia.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Aw: Re: [PATCH v2 1/2] dt-bindings: reset: mediatek: add MT7988
 LVTS reset ID
Content-Type: text/plain; charset=UTF-8
Date: Wed, 24 Jan 2024 18:01:59 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <0d3c2713-6da5-4e7c-8568-180df6e424d7@gmail.com>
References: <20240105162056.43266-1-linux@fw-web.de>
 <20240105162056.43266-2-linux@fw-web.de>
 <0d3c2713-6da5-4e7c-8568-180df6e424d7@gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:ulx5dIeWJcW3Za2njFFqNJJv6ciEdTUHHrCwpcD+GKtnJOHRljDlEEQe6nsrRW8zL7mfz
 BKTmCNEvNAt61YH5vlDMBmy6sMsLWiB/Wn4JYcasmQ7aYjLhtgPyNjmm5b7tslQW2ipa0Pr6KZEN
 efLPRXlqDDmqskDxqBe1J8ZY3sAhRpDe/VNNlx3LZPfotPyxTpa+R2rDb5F1mOCLl6rwRBpoJNS6
 SgVY5AofTYqcYt/lCE1x0swMDP5E4yO+HCF4TdBs27kvAuyDnPstCHt22rx5FqitmhNQrgQapFXn
 Ro=
UI-OutboundReport: notjunk:1;M01:P0:hKFerlztyOE=;6u6ywOCU1fTGycRtlCIUyUtsGmE
 sRTAUXyl8Ro0jbY88oE1+r7+w0JokzfAu26O55bueT1Qo+aDKpLzVNQKmZh5afFmy0SjUPa/3
 WLZNB2hhpV8IGSDoeJ4nnQMpfbt7V+tx389WM1soB0wgLTo3atB5QyghOGtvC48JJvFUkaEri
 0GAFhAE/K+mSg6bGv5caLsZScVDZNOvKAtSmlW9HMHfqjVuM+ldqMr73JR0L3SGcU6+4Wedu2
 Y02ccqsDRNLQB+WfQTiN5UnbI/oc8nfmLx2EC8jmUPZ97ea0kcvlfgr9blPXrXa3BQvoaJbU2
 IMVjJSJpzJVFvgX6NYExMTw2X7KU7KTLEErfg+D5ZM21IeN4TndBq/FqSBgWngYMWRdQiyy05
 RHE2II+sHZp/XBhZSN/R7gK5pYrwqyl78s8CMSQlu1LGf+2QL+Ck7mr1TdRgV3wuvpB1dgFhG
 Lp0jg4H+NWTON9Y+F+XDI0STjp/4H85gvZA3HexzBnW9wxaZhYJjMgc3yd89TWzadD3fhuV6B
 mQ0iQkTvYYl/JANDLDr7nzv+0sLSMjIbdnTXfbGWHA+r4+nf4nq+5FBhgDokvj+IGLJZrIF3l
 G62GKoDECzTtmwfSti3jg/2e8puqkBdDR9VGzp+qInPDjozW7MB816u6cfgiA0JskEkZFBvMV
 1CSX3D6/lpyJB+vveXFK848nR+LzSahkBUKq63C5cSpLnRAaZkKH7E6InHLyOYtedP0aAUadK
 0h1P12oCpUWNWIiDHDz80zVY4xjleMrEaXuqq53aDAevXlUApv1sE+ApWQeIjJBtmBXoxG4ar
 CDv3F36VdP8r+roDldHt2/wQ==
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_090214_230317_A997EA13 
X-CRM114-Status: UNSURE (   9.98  )
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

> Gesendet: Montag, 22. Januar 2024 um 09:57 Uhr
> Von: "Matthias Brugger" <matthias.bgg@gmail.com>
> On 05/01/2024 17:20, Frank Wunderlich wrote:
> > From: Frank Wunderlich <frank-w@public-files.de>
> >
> > Add reset constant for using as index in driver and dts.
> >
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

Hi

good to hear again from you Matthias. unfortunately there is already a v3 =
out,
where i added multiple reset offsets/ids. Can you please review this one?

https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D817619

and i also wait for 2 other patches to be reviewed before bpi-r4 dts patch=
es can go in:

https://patchwork.kernel.org/project/linux-mediatek/patch/20231025170832.7=
8727-5-linux@fw-web.de/

regards Frank


