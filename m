From: Henry Chen <HenryC.Chen@mediatek.com>
Subject: Re: [PATCH v2 2/2] regulator: mt6311: Add support for mt6311
 regulator
Date: Wed, 22 Jul 2015 22:42:54 +0800
Message-ID: <1437576174.30329.84.camel@mtksdaap41>
References: <1437566453-13117-1-git-send-email-henryc.chen@mediatek.com>
	 <1437566453-13117-3-git-send-email-henryc.chen@mediatek.com>
	 <CABxcv=ncxfeqo1vfz6XzJWYUOGeFGAbDmz2M_PzM+8PBQvXjgw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CABxcv=ncxfeqo1vfz6XzJWYUOGeFGAbDmz2M_PzM+8PBQvXjgw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Linux Kernel <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, eddie.huang@mediatek.com, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

On Wed, 2015-07-22 at 14:50 +0200, Javier Martinez Canillas wrote:

> > +
> > +struct mt6311 {
> > +       struct device *dev;
> > +       struct regmap *regmap;
> > +       struct regulator_dev *rdev[MT6311_MAX_REGULATORS];
> > +       int num_regulator;
> > +       int chip_cid;
> > +};
> 
> It seems this struct can be removed, the rdev, num_regulator and
> chip_cid fields are set but not used and dev and regmap are only used
> to set the struct regulator_config fields in mt6311_regulator_init().
> But that won't be necessary if you just remove the
> mt6311_regulator_init() function and move the regulator registration
> logic to mt6311_i2c_probe().

Yes, it should be removed, thanks for the advise.

Henry 

> 
> Best regards,
> Javier
