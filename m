From: Sean Wang <sean.wang-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 1/5] pinctrl: mediatek: Check gpio pin number and use
 binary search in mtk_hw_pin_field_lookup()
Date: Fri, 27 Sep 2019 10:23:48 -0700
Message-ID: <CAGp9LzpnUK-wq_fStsYnYaqZn8mKMJ+9zJmURpWwEDQHA--EFg@mail.gmail.com>
References: <1569560532-1886-1-git-send-email-light.hsieh@mediatek.com>
 <1569561287.2428.6.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1569561287.2428.6.camel@mtkswgap22>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Light Hsieh <light.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kuohong.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Thu, Sep 26, 2019 at 10:14 PM Light Hsieh <light.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>
> Dear reviewers:
>
> Patch v6 improves v5 by:
>
> 1.in mtk_pinconf_get() and mtk_pinconf_set() @pinctrl-paris.c:
>   * check if pin is in range before using pin as array index of
>      hw->soc->pins[]
> 2.in mtk_pin_field_lookup() @pinctrl-mtk-common-v2.c:
>   * declear start, end, check as signed integer instead of unsigned
>     integer. Otherwise, kernel fault will occur when s_pin field of
>     first entry of a mtk_pin_field_calc[] array is not 0.
>

And for review these patches easily, you should put the changes
history to the cover letter.

> On Fri, 2019-09-27 at 13:02 +0800, Light Hsieh wrote:
> > 1. Check if gpio pin number is in valid range to prevent from get invalid
> >    pointer 'desc' in the following code:
> >       desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
> >
> > 2. Use binary search in mtk_hw_pin_field_lookup()
> >    Modify mtk_hw_pin_field_lookup() to use binary search for accelerating
> >    search.
> >

You almost forgot to add the tags from you and the reviewers' feedback.

> > ---
> >  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 25 +++++++++++++++++++-----
> >  drivers/pinctrl/mediatek/pinctrl-paris.c         | 25 ++++++++++++++++++++++++
> >  2 files changed, 45 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > index 20e1c89..8077855 100644
> > --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > @@ -68,7 +68,8 @@ static int mtk_hw_pin_field_lookup(struct mtk_pinctrl *hw,
> >  {
> >       const struct mtk_pin_field_calc *c, *e;
> >       const struct mtk_pin_reg_calc *rc;
> > -     u32 bits;
> > +     u32 bits, found = 0;

the type of found seems to be a bool

> > +     int start = 0, end, check;
> >
> >       if (hw->soc->reg_cal && hw->soc->reg_cal[field].range) {
> >               rc = &hw->soc->reg_cal[field];
> > @@ -79,21 +80,32 @@ static int mtk_hw_pin_field_lookup(struct mtk_pinctrl *hw,
> >               return -ENOTSUPP;
> >       }
> >
> > +     end = rc->nranges - 1;
> >       c = rc->range;
> >       e = c + rc->nranges;
> >
> > -     while (c < e) {
> > -             if (desc->number >= c->s_pin && desc->number <= c->e_pin)
> > +     while (start <= end) {
> > +             check = (start + end) >> 1;
> > +             if (desc->number >= rc->range[check].s_pin
> > +              && desc->number <= rc->range[check].e_pin) {
> > +                     found = 1;
> >                       break;
> > -             c++;
> > +             } else if (start == end)
> > +                     break;
> > +             else if (desc->number < rc->range[check].s_pin)
> > +                     end = check - 1;
> > +             else
> > +                     start = check + 1;
> >       }
> >

yuh, it is good to do do a binary search here

> > -     if (c >= e) {
> > +     if (!found) {
> >               dev_dbg(hw->dev, "Not support field %d for pin = %d (%s)\n",
> >                       field, desc->number, desc->name);
> >               return -ENOTSUPP;
> >       }
> >
> > +     c = rc->range + check;
> > +
> >       if (c->i_base > hw->nbase - 1) {
> >               dev_err(hw->dev,
> >                       "Invalid base for field %d for pin = %d (%s)\n",
> > @@ -182,6 +194,9 @@ int mtk_hw_set_value(struct mtk_pinctrl *hw, const struct mtk_pin_desc *desc,
> >       if (err)
> >               return err;
> >
> > +     if (value < 0 || value > pf.mask)
> > +             return -EINVAL;
> > +
> >       if (!pf.next)
> >               mtk_rmw(hw, pf.index, pf.offset, pf.mask << pf.bitpos,
> >                       (value & pf.mask) << pf.bitpos);
> > diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> > index 923264d..3e13ae7 100644
> > --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> > +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> > @@ -81,6 +81,8 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
> >       int val, val2, err, reg, ret = 1;
> >       const struct mtk_pin_desc *desc;
> >
> > +     if (pin >= hw->soc->npins)
> > +             return -EINVAL;
> >       desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
> >
> >       switch (param) {
> > @@ -206,6 +208,10 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
> >       int err = 0;
> >       u32 reg;
> >
> > +     if (pin >= hw->soc->npins) {
> > +             err = -EINVAL;
> > +             goto err;
> > +     }
> >       desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
> >
> >       switch ((u32)param) {
> > @@ -693,6 +699,9 @@ static int mtk_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
> >       const struct mtk_pin_desc *desc;
> >       int value, err;
> >
> > +     if (gpio > hw->soc->npins)
> > +             return -EINVAL;
> > +
> >       desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
> >
> >       err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DIR, &value);
> > @@ -708,6 +717,9 @@ static int mtk_gpio_get(struct gpio_chip *chip, unsigned int gpio)
> >       const struct mtk_pin_desc *desc;
> >       int value, err;
> >
> > +     if (gpio > hw->soc->npins)
> > +             return -EINVAL;
> > +
> >       desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
> >
> >       err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DI, &value);
> > @@ -722,6 +734,9 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
> >       struct mtk_pinctrl *hw = gpiochip_get_data(chip);
> >       const struct mtk_pin_desc *desc;
> >
> > +     if (gpio > hw->soc->npins)
> > +             return;
> > +
> >       desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
> >
> >       mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DO, !!value);
> > @@ -729,12 +744,22 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
> >
> >  static int mtk_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
> >  {
> > +     struct mtk_pinctrl *hw = gpiochip_get_data(chip);
> > +
> > +     if (gpio > hw->soc->npins)
> > +             return -EINVAL;
> > +
> >       return pinctrl_gpio_direction_input(chip->base + gpio);
> >  }
> >
> >  static int mtk_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
> >                                    int value)
> >  {
> > +     struct mtk_pinctrl *hw = gpiochip_get_data(chip);
> > +
> > +     if (gpio > hw->soc->npins)
> > +             return -EINVAL;
> > +
> >       mtk_gpio_set(chip, gpio, value);
> >
> >       return pinctrl_gpio_direction_output(chip->base + gpio);
>
>
