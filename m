From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 1/6] clk: make strings in parent name arrays const
Date: Thu, 19 Mar 2015 09:48:41 +0100
Message-ID: <20150319084841.GT10068@pengutronix.de>
References: <1426754530-3137-1-git-send-email-s.hauer@pengutronix.de>
 <1426754530-3137-2-git-send-email-s.hauer@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1426754530-3137-2-git-send-email-s.hauer@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, YH Chen <yh.chen@mediatek.com>, linux-kernel@vger.kernel.org, Henry Chen <henryc.chen@mediatek.com>, linux-mediatek@lists.infradead.org, kernel@pengutronix.de, Matthias Brugger <matthias.bgg@gmail.com>, Yingjoe Chen <Yingjoe.Chen@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Hello,

On Thu, Mar 19, 2015 at 09:42:05AM +0100, Sascha Hauer wrote:
> The clk functions and structs declare the parent_name arrays as
> 'const char **parent_names' which means the parent name strings
> are const, but the array itself is not. Use
> 'const char * const * parent_names' instead which also makes
> the array const. This allows us to put the parent_name arrays into
> the __initconst section.
>=20
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
looks sensible:

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

It would be nice to have this for more clock types (which of course
shouldn't delay this patch).

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
