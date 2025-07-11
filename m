Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F61FC8303C
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jul 2025 08:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DjZmzBZxgBCHpW0n04eDpJSI9hdDIhjeo2KxxLvZM+0=; b=BjwkDCZa+KouNGvrDjwUbF9nj/
	6dNwaj7qPBsqlKD5D4bYZZI5iqnmvOVPdZhcWEzzfFeAx34irkwWJVgbu35OHvvLYJvr4uXP6vJIO
	2H64GCFASK23S29sELQdQectiOqXpa2QUUGnJLb3kywuEBukUTSnJ8l2vEOFeQXmIZuOfJOOwBrP1
	xEK1o9tzdrjh88VGlCr7bTCA0KQzCPICTltSY5GYPX1eH9sNRVLdY/V7PmWLov2qohg4TzYHRVItk
	1+esllsylnOTxNbv61cGK1w/UpQr76lSRZfje0WuERNkDoWqouxZhUSuFunpVWOj1p7m08G00rz4T
	UbvgIjww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua9Eq-0000000EAXs-41OF;
	Fri, 11 Jul 2025 08:36:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8V2-0000000E1uL-3zlN;
	Fri, 11 Jul 2025 07:48:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 537AD6115D;
	Fri, 11 Jul 2025 07:48:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B0C8C4CEED;
	Fri, 11 Jul 2025 07:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752220132;
	bh=S80RCc8AU+x0HOq9skXnJp/RPQxNXic9/cfuMq1Im68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jD68Ts6Mc+lxinHx4tEPAuFhkN/k9whUNRSfIBCRyk+l7tKFZGC/EwaNlBgN1Xgzi
	 qTod2g8rkqpjAEw5DwSoeoFxvyhzAkUt+EfGMiXDSWYTwy4AICs9gd7elyf4EZOFzS
	 KBVbf2fofMljwswaQtpVVpJTgzNyord956SC8l2G79CNoxdtT0xgdvm1I+DZ5inef6
	 zQmgwvgwtsntLj+BK6SaF0M2T4KQVWwukkFIF6OSt5DDL/NELFpYbCQv48vwpz/1g4
	 b+vg7hZrZmn0lZXpavB4XKn2We8S8raoTN0kNbIbAM3mfvFqUz+RWGykgYPEK0ICgg
	 10ivlZG1LQoBw==
Date: Fri, 11 Jul 2025 09:48:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org, 
	Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stanislaw Gruszka <stf_xl@wp.pl>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:MIPS" <linux-mips@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCHv3 wireless-next 7/7] dt-bindings: net: wireless: rt2800:
 add
Message-ID: <20250711-invisible-dainty-jackrabbit-acbf8f@krzk-bin>
References: <20250710200820.262295-1-rosenp@gmail.com>
 <20250710200820.262295-8-rosenp@gmail.com>
 <d8b0abb2-1a12-42bf-aafd-4cd1e21babd6@kernel.org>
 <CAKxU2N-c2tHBYWBM+FJGqdSaqzw9u0O8e0G7AVqk6b0QdRnPTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAKxU2N-c2tHBYWBM+FJGqdSaqzw9u0O8e0G7AVqk6b0QdRnPTw@mail.gmail.com>
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

On Thu, Jul 10, 2025 at 03:40:30PM -0700, Rosen Penev wrote:
> On Thu, Jul 10, 2025 at 2:40=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
> >
> > On 10/07/2025 22:08, Rosen Penev wrote:
> > > Add device-tree bindings for the RT2800 SOC wifi device found in older
> > > Ralink/Mediatek devices.
> > >
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > ---
> > >  .../bindings/net/wireless/ralink,rt2800.yaml  | 47 +++++++++++++++++=
++
> > >  1 file changed, 47 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/net/wireless/ra=
link,rt2800.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/net/wireless/ralink,rt=
2800.yaml b/Documentation/devicetree/bindings/net/wireless/ralink,rt2800.ya=
ml
> > > new file mode 100644
> > > index 000000000000..8c13b25bd8b4
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/net/wireless/ralink,rt2800.ya=
ml
> >
> > Filename should match compatible. You were already changing something
> > here...
> hrm? that makes no sense. Various drivers have multiple compatible lines.

Luckily we do not speak about drivers here. Anyway, follow standard
review practices, you don't get special rules.

Best regards,
Krzysztof


