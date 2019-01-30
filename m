From: Sean Wang <sean.wang@kernel.org>
Subject: Re: [PATCHv4 2/3] net: dsa: mt7530: support the 7530 switch on the
 Mediatek MT7621 SoC
Date: Tue, 29 Jan 2019 19:55:12 -0800
Message-ID: <CAGp9LzqqeJRtqtavMJQ3vokBWnpiJYaPuFWYgPr+BP4h6hTr0g@mail.gmail.com>
References: <20190130012406.28271-1-gerg@kernel.org> <20190130012406.28271-3-gerg@kernel.org>
 <d030fb8f-c707-9aa2-5ebc-e8100188a5c2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <d030fb8f-c707-9aa2-5ebc-e8100188a5c2@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: gerg@kernel.org, =?UTF-8?B?U2VhbiBXYW5nICjnjovlv5fkupgp?= <sean.wang@mediatek.com>, linux-mediatek@lists.infradead.org, bjorn@mork.no, Andrew Lunn <andrew@lunn.ch>, vivien.didelot@savoirfairelinux.com, netdev@vger.kernel.org, neil@brown.name, rene@vdorst.com, John Crispin <john@phrozen.org>
List-Id: linux-mediatek@lists.infradead.org

On Tue, Jan 29, 2019 at 7:39 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
>
>
> On 1/29/19 5:24 PM, gerg@kernel.org wrote:
> > From: Greg Ungerer <gerg@kernel.org>
> >
> > The MediaTek MT7621 SoC device contains a 7530 switch, and the existing
> > linux kernel 7530 DSA switch driver can be used with it.
> >
> > The bulk of the changes required stem from the 7621 having different
> > regulator and pad setup. The existing setup of these in the 7530
> > driver appears to be very specific to its implemtation in the Mediatek
> > 7623 SoC. (Not entirely surprising given the 7623 is a quad core ARM
> > based SoC, and the 7621 is a dual core, dual thread MIPS based SoC).
> >
> > Create a new devicetree type, "mediatek,mt7621", to support the 7530
> > switch in the 7621 SoC. There appears to be no usable ID register to
> > distinguish it from a 7530 in other hardware at runtime. This is used
> > to carry out the appropriate configuration and setup.
> >
> > Signed-off-by: Greg Ungerer <gerg@kernel.org>
> > Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

Acked-by: Sean Wang <sean.wang@kernel.org>

> --
> Florian
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
