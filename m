From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] [MT6660] Mediatek Smart Amplifier Driver
Date: Tue, 3 Sep 2019 17:38:29 +0100
Message-ID: <20190903163829.GB7916@sirena.co.uk>
References: <1567494501-3427-1-git-send-email-richtek.jeff.chang@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1857236209074570421=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1567494501-3427-1-git-send-email-richtek.jeff.chang@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: richtek.jeff.chang@gmail.com
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, perex@perex.cz, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org


--===============1857236209074570421==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UHN/qo2QbUvPLonB"
Content-Disposition: inline


--UHN/qo2QbUvPLonB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 03, 2019 at 03:08:21PM +0800, richtek.jeff.chang@gmail.com wrote:

> --- /dev/null
> +++ b/sound/soc/codecs/mt6660.c
> @@ -0,0 +1,802 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + */

Please make the entire comment block a C++ comment so things look more
consistent.

> +struct reg_size_table {
> +	u32 addr;
> +	u8 size;
> +};

> +static const struct reg_size_table mt6660_reg_size_table[] = {
> +	{ MT6660_REG_HPF1_COEF, 4 },
> +	{ MT6660_REG_HPF2_COEF, 4 },
> +	{ MT6660_REG_TDM_CFG3, 2 },
> +	{ MT6660_REG_RESV17, 2 },
> +	{ MT6660_REG_RESV23, 2 },
> +	{ MT6660_REG_SIGMAX, 2 },
> +	{ MT6660_REG_DEVID, 2},
> +	{ MT6660_REG_TDM_CFG3, 2},
> +	{ MT6660_REG_HCLIP_CTRL, 2},
> +	{ MT6660_REG_DA_GAIN, 2},
> +};

Please talk to your hardware designers about the benefits of consistent
register sizes :/

> +static int32_t mt6660_i2c_update_bits(struct mt6660_chip *chip,
> +	uint32_t addr, uint32_t mask, uint32_t data)
> +{

It would be good to implement a regmap rather than open coding
*everything* - it'd give you things like this without needing to open
code them.  Providing you don't use the cache code it should cope fine
with variable register sizes.

> +
> +static int mt6660_i2c_init_setting(struct mt6660_chip *chip)
> +{
> +	int i, len, ret;
> +	const struct codec_reg_val *init_table;
> +
> +	init_table = e4_reg_inits;
> +	len = ARRAY_SIZE(e4_reg_inits);
> +
> +	for (i = 0; i < len; i++) {
> +		ret = mt6660_i2c_update_bits(chip, init_table[i].addr,
> +				init_table[i].mask, init_table[i].data);
> +		if (ret < 0)
> +			return ret;

Why are we not using the chip defaults here?

> +static int mt6660_chip_power_on(
> +	struct snd_soc_component *component, int on_off)
> +{
> +	struct mt6660_chip *chip = (struct mt6660_chip *)
> +		snd_soc_component_get_drvdata(component);
> +	int ret = 0;
> +	unsigned int val;
> +
> +	dev_dbg(component->dev, "%s: on_off = %d\n", __func__, on_off);
> +	mutex_lock(&chip->var_lock);
> +	if (on_off) {
> +		if (chip->pwr_cnt == 0) {
> +			ret = mt6660_i2c_update_bits(chip,
> +				MT6660_REG_SYSTEM_CTRL, 0x01, 0x00);
> +			val = mt6660_i2c_read(chip, MT6660_REG_IRQ_STATUS1);
> +			dev_info(chip->dev,
> +				"%s reg0x05 = 0x%x\n", __func__, val);
> +		}
> +		chip->pwr_cnt++;

This looks like you're open coding runtime PM stuff?  AFAICT the issue
is that you need to write to this register to do any I/O.  Just
implement this via the standard runtime PM framework, you'll need to do
something about the register I/O in the controls (ideally in the
framework, it'd be a lot easier if you did have a cache) but you could
cut out this bit.

> +static int mt6660_component_set_bias_level(struct snd_soc_component *component,
> +	enum snd_soc_bias_level level)
> +{
> +	struct snd_soc_dapm_context *dapm =
> +		snd_soc_component_get_dapm(component);
> +	int ret;
> +	unsigned int val;
> +	struct mt6660_chip *chip = snd_soc_component_get_drvdata(component);
> +
> +	if (dapm->bias_level == level) {
> +		dev_warn(component->dev, "%s: repeat level change\n", __func__);

This shouldn't be a warning.

> +static const struct snd_kcontrol_new mt6660_component_snd_controls[] = {
> +	SOC_SINGLE_EXT_TLV("Volume_Ctrl", MT6660_REG_VOL_CTRL, 0, 255,
> +			   1, snd_soc_get_volsw, mt6660_component_put_volsw,
> +			   vol_ctl_tlv),
> +	SOC_SINGLE_EXT("WDT_Enable", MT6660_REG_WDT_CTRL, 7, 1, 0,
> +		       snd_soc_get_volsw, mt6660_component_put_volsw),

These control names should all use standard ALSA control names - on/off
switches should end in Switch, volume controls in Volume.

> +	SOC_SINGLE_EXT("I2SLRS", MT6660_REG_DATAO_SEL, 6, 3, 0,
> +		       snd_soc_get_volsw, mt6660_component_put_volsw),
> +	SOC_SINGLE_EXT("I2SDOLS", MT6660_REG_DATAO_SEL, 3, 7, 0,
> +		       snd_soc_get_volsw, mt6660_component_put_volsw),
> +	SOC_SINGLE_EXT("I2SDORS", MT6660_REG_DATAO_SEL, 0, 7, 0,
> +		       snd_soc_get_volsw, mt6660_component_put_volsw),

What do these controls do?

--UHN/qo2QbUvPLonB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1ulwQACgkQJNaLcl1U
h9DsxAf8DiH9juppC2atx8j+pwupdXbxOIeEil91IOqQMEBBSSJ1oa1nPDIz1HkH
yJY7jq4QIijIkqA0b5Op3zEXSHIve3j3ZoUnN/Wrj6ODeyzrDXSvsDm/gB2/G3xJ
AQYMGCGEaL3i0OmnFBf3LKCqG/FceKjOmg7QqcuNMGqLkdHdwiNMguc+5QkuSamM
dvb3ZKnicrimjhMSocpe38qRFfcld4gJp6psfeDIQ8z2A1V8dtiNNrAbza/ArDUB
kfUE1VkdWMTs1kOrjrTZl067ZzOTLBbSiulfxzDtM1UjB3LSteshyCkoVI5K+QBW
qJJLfLqnH76e09UCIYvXbbV1J/oeRw==
=1Pf1
-----END PGP SIGNATURE-----

--UHN/qo2QbUvPLonB--


--===============1857236209074570421==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1857236209074570421==--
