From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 0/3] Mark clocks as critical for MT6797
Date: Tue, 26 Feb 2019 09:53:09 -0800
Message-ID: <155120358914.260864.17734674975447226263@swboyd.mtv.corp.google.com>
References: <20190214163026.26073-1-matthias.bgg@kernel.org> <f7ed0750-665a-76bc-df1a-95af39fef8ec@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f7ed0750-665a-76bc-df1a-95af39fef8ec@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, kevin-cw.chen@mediatek.com, mars.cheng@mediatek.com, matthias.bgg@kernel.org, mturquette@baylibre.com
Cc: sean.wang@mediatek.com, jasu@njomotys.info, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Matthias Brugger <mbrugger@suse.com>
List-Id: linux-mediatek@lists.infradead.org

Quoting Matthias Brugger (2019-02-26 04:59:44)
>=20
>=20
> On 14/02/2019 17:30, matthias.bgg@kernel.org wrote:
> > From: Matthias Brugger <mbrugger@suse.com>
> >=20
> > Jasper send this series some month ago. As there was no reaction from
> > his side, I'll do a friendly take-over.
> > I tested the patches on my Helios X20 boards and they fix the issue.
> > I didn't add a Tested-by tag as I added my Signed-off-by.
> >=20
> > Changes since v3:
> > - add comments explaining why the clock muxer and gates are marked
> >   as critical
> >=20
> > Changes since v2 (https://patchwork.kernel.org/patch/10686759/):
> > - axi_sel is not needed, drop CLK_IS_CRITICAL for it.
> > - update commit message
> > - add Acked-by from Mars
> >=20
> > Changes since v1:
> > - add a fixes tag.
> >=20
>=20
> Steven, Mike any comments on this?
>=20

I got patch #1 and #2 in my queue and they're not threaded properly as
replies to each other. I'll have to go dig out the last patch somehow,
but probably I can apply them now.
