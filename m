From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH v4 2/2] regulator: mt6311: Add support for mt6311 regulator
Date: Fri, 24 Jul 2015 10:35:39 +0200
Message-ID: <CABxcv=ku5whwBzZLUP3VZ7o5ASK=YYkMTouD=CRc+LjbAXz7BQ@mail.gmail.com>
References: <1437715481-31528-1-git-send-email-henryc.chen@mediatek.com>
	<1437715481-31528-3-git-send-email-henryc.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1437715481-31528-3-git-send-email-henryc.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Henry Chen <henryc.chen@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Linux Kernel <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, eddie.huang@mediatek.com, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

Hello Henry,

On Fri, Jul 24, 2015 at 7:24 AM, Henry Chen <henryc.chen@mediatek.com> wrote:
> Add regulator support for mt6311.
> It has 2 regulaotrs - Buck and LDO, provide the related buck/ldo voltage
> data to the driver, and creates the regulator_desc table. Supported
> operations for Buck are enabled/disabled and voltage change, only
> enabled/disabled for LDO.
>
> Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> ---

Looks good to me now.

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
Javier
