From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 35/35 linux-next] pinctrl: constify of_device_id array
Date: Fri, 27 Mar 2015 10:00:31 +0100
Message-ID: <CACRpkdZbvHxtupVsXJwK8-XZ-dOScgpWFJWPExQ5U44FRXZymw@mail.gmail.com>
References: <1426533469-25458-1-git-send-email-fabf@skynet.be>
	<1426535949-26107-1-git-send-email-fabf@skynet.be>
	<1426535949-26107-4-git-send-email-fabf@skynet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1426535949-26107-4-git-send-email-fabf@skynet.be>
Sender: linux-gpio-owner@vger.kernel.org
To: Fabian Frederick <fabf@skynet.be>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Matthias Brugger <matthias.bgg@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-rpi-kernel@lists.infradead.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, kernel@stlinux.com, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Mon, Mar 16, 2015 at 8:59 PM, Fabian Frederick <fabf@skynet.be> wrote:

> of_device_id is always used as const.
> (See driver.of_match_table and open firmware functions)
>
> Signed-off-by: Fabian Frederick <fabf@skynet.be>

Patch applied with the ACKs. Had to do some fixup on some
MTK controllers, no big deal.

Yours,
Linus Walleij
