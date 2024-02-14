Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69153C48BEB
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Feb 2024 09:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oeFgKpQmukUIaWih2llisrwGBGNK1YRNGjFQ09PzPoY=; b=tW1cz0lt22bNgwdJQGCAOEKNwl
	A09dOm5+B5ZzfpZ2pxBMnp+2TBdrzlaq1eSvZKPzc55LtaNh/WcAUtA1mgFkJhUirWmXHJwvZVIlQ
	lJAMwdVpZ/BmYXPwT/Ms/S1qbbXESVa6BVxefzhWBdsKPUlTt8AiNkxfK7cluBFS4p5OAhcr3QI/K
	lUqUnlUyL7GpqpDKBQ/TR3D6JXB30Bcg/2UgM8PoRolw5MU4zCbiKTisNj4+WMcgx8vBZM5yuFcBD
	clbGOV7aSph24Fr13ZWDnxQKYwn5pBwy+iuj9u9nmcH+t4Sbf/ZLLDuuWG1iRfHX4NwIRqbqYcJqG
	avtKPQBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raBkZ-0000000COTE-052K;
	Wed, 14 Feb 2024 09:40:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raBfa-0000000CKwW-0ajp
	for linux-mediatek@bombadil.infradead.org;
	Wed, 14 Feb 2024 09:35:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=oeFgKpQmukUIaWih2llisrwGBGNK1YRNGjFQ09PzPoY=; b=IndjrrksWm9D/7Hz8/zJJzSx/y
	kJFnubEUah0VAM42okUluRoD9GOwMOGVUir5cNVM9eozy/FUu4xB69sxI+PMDVupx3LVxAQMPA6NP
	fx7o933i4ejXqhMk9+5EVdUBU98tTVxn6n3wi1kxOh2yo0JYdPIcxoYtFRFE/EYDZf6gt/HmVEX9/
	XialvzmbIkAoRF3CqjzcZIz05YbJ73n48J4VbX54oaVls7ZDRHfTmmtFcQ+8uik+OILQf5be2HTt0
	KY7coRg3VxGkHNsOESTZ0uxx5E+RMYg9wCs9NWUhhSSCdSesvYCMAsGwCdlsfdCL6sJRiL4LIF5HH
	B6OXl9EA==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raBfJ-0000000GAcj-37nb
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Feb 2024 09:35:08 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1raBeo-0004N3-Cv; Wed, 14 Feb 2024 10:34:22 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1raBej-000f6R-Uf; Wed, 14 Feb 2024 10:34:17 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1raBej-004XzY-2d;
	Wed, 14 Feb 2024 10:34:17 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-pwm@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Benson Leung <bleung@chromium.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Paul Cercueil <paul@crapouillou.net>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-mips@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v6 001/164] pwm: Provide an inline function to get the parent device of a given chip
Date: Wed, 14 Feb 2024 10:30:48 +0100
Message-ID: <cc30090d2f9762bed9854a55612144bccc910781.1707900770.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=7837; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=VysffgosBaokCEzVr9CapJ6wP73fslCZ+jQWLzJTRHQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlzIhM7NlIMX1uF2GQrQA4FrQMoPchi57Yvz/JC blz73iQwb+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZcyITAAKCRCPgPtYfRL+ TuB0B/9P6zT5YFj/8ggZu30wuJh2FhhmcK5IFWEAn3eCqQlBR1+3r98RrH73NV8ruZe1t4nFx0t c6OsWCmmaXgE6NDq1aepB6xNx+u8uuL4EVlihT9QJVyAeyufdWSSbztRhUXrDwn+FS86xswU0hQ OCGoK2SmNoffSL++99SaLb6zwKJeLP/OE7OHvKNMeD++iM8d5m969WslaGj106z8byRgfAb+gh6 HV3n2oUDQFI0N4yfDlHO1Kbc0wLdEc4o1zQa3Kh4g0DpRCV9Wh8qYU/HDpDq4cIQi3DHD9CNJns wVoX4dBy6zyY+YlCipT3YD5PfL124GflRsA1quEFk0pOzKp4
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_093454_077766_DC92E438 
X-CRM114-Status: GOOD (  23.37  )
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

Currently a pwm_chip stores in its struct device *dev member a pointer
to the parent device. Preparing a change that embeds a full struct
device in struct pwm_chip, this accessor function should be used in all
drivers directly accessing chip->dev now. This way struct pwm_chip and
this new function can be changed without having to touch all drivers in
the same change set.

Make use of this function in the framework's core sources.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/pwm/core.c  | 42 +++++++++++++++++++++---------------------
 drivers/pwm/sysfs.c |  4 ++--
 include/linux/pwm.h |  5 +++++
 3 files changed, 28 insertions(+), 23 deletions(-)

diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index 1b4c3d0caa82..830a697826af 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -71,18 +71,18 @@ static void pwm_apply_debug(struct pwm_device *pwm,
 
 	if (s2.polarity != state->polarity &&
 	    state->duty_cycle < state->period)
-		dev_warn(chip->dev, ".apply ignored .polarity\n");
+		dev_warn(pwmchip_parent(chip), ".apply ignored .polarity\n");
 
 	if (state->enabled &&
 	    last->polarity == state->polarity &&
 	    last->period > s2.period &&
 	    last->period <= state->period)
-		dev_warn(chip->dev,
+		dev_warn(pwmchip_parent(chip),
 			 ".apply didn't pick the best available period (requested: %llu, applied: %llu, possible: %llu)\n",
 			 state->period, s2.period, last->period);
 
 	if (state->enabled && state->period < s2.period)
-		dev_warn(chip->dev,
+		dev_warn(pwmchip_parent(chip),
 			 ".apply is supposed to round down period (requested: %llu, applied: %llu)\n",
 			 state->period, s2.period);
 
@@ -91,20 +91,20 @@ static void pwm_apply_debug(struct pwm_device *pwm,
 	    last->period == s2.period &&
 	    last->duty_cycle > s2.duty_cycle &&
 	    last->duty_cycle <= state->duty_cycle)
-		dev_warn(chip->dev,
+		dev_warn(pwmchip_parent(chip),
 			 ".apply didn't pick the best available duty cycle (requested: %llu/%llu, applied: %llu/%llu, possible: %llu/%llu)\n",
 			 state->duty_cycle, state->period,
 			 s2.duty_cycle, s2.period,
 			 last->duty_cycle, last->period);
 
 	if (state->enabled && state->duty_cycle < s2.duty_cycle)
-		dev_warn(chip->dev,
+		dev_warn(pwmchip_parent(chip),
 			 ".apply is supposed to round down duty_cycle (requested: %llu/%llu, applied: %llu/%llu)\n",
 			 state->duty_cycle, state->period,
 			 s2.duty_cycle, s2.period);
 
 	if (!state->enabled && s2.enabled && s2.duty_cycle > 0)
-		dev_warn(chip->dev,
+		dev_warn(pwmchip_parent(chip),
 			 "requested disabled, but yielded enabled with duty > 0\n");
 
 	/* reapply the state that the driver reported being configured. */
@@ -112,7 +112,7 @@ static void pwm_apply_debug(struct pwm_device *pwm,
 	trace_pwm_apply(pwm, &s1, err);
 	if (err) {
 		*last = s1;
-		dev_err(chip->dev, "failed to reapply current setting\n");
+		dev_err(pwmchip_parent(chip), "failed to reapply current setting\n");
 		return;
 	}
 
@@ -127,7 +127,7 @@ static void pwm_apply_debug(struct pwm_device *pwm,
 	    s1.polarity != last->polarity ||
 	    (s1.enabled && s1.period != last->period) ||
 	    (s1.enabled && s1.duty_cycle != last->duty_cycle)) {
-		dev_err(chip->dev,
+		dev_err(pwmchip_parent(chip),
 			".apply is not idempotent (ena=%d pol=%d %llu/%llu) -> (ena=%d pol=%d %llu/%llu)\n",
 			s1.enabled, s1.polarity, s1.duty_cycle, s1.period,
 			last->enabled, last->polarity, last->duty_cycle,
@@ -318,7 +318,7 @@ static struct pwm_chip *pwmchip_find_by_name(const char *name)
 	mutex_lock(&pwm_lock);
 
 	idr_for_each_entry_ul(&pwm_chips, chip, tmp, id) {
-		const char *chip_name = dev_name(chip->dev);
+		const char *chip_name = dev_name(pwmchip_parent(chip));
 
 		if (chip_name && strcmp(chip_name, name) == 0) {
 			mutex_unlock(&pwm_lock);
@@ -456,19 +456,19 @@ EXPORT_SYMBOL_GPL(of_pwm_single_xlate);
 
 static void of_pwmchip_add(struct pwm_chip *chip)
 {
-	if (!chip->dev || !chip->dev->of_node)
+	if (!pwmchip_parent(chip) || !pwmchip_parent(chip)->of_node)
 		return;
 
 	if (!chip->of_xlate)
 		chip->of_xlate = of_pwm_xlate_with_flags;
 
-	of_node_get(chip->dev->of_node);
+	of_node_get(pwmchip_parent(chip)->of_node);
 }
 
 static void of_pwmchip_remove(struct pwm_chip *chip)
 {
-	if (chip->dev)
-		of_node_put(chip->dev->of_node);
+	if (pwmchip_parent(chip))
+		of_node_put(pwmchip_parent(chip)->of_node);
 }
 
 static bool pwm_ops_check(const struct pwm_chip *chip)
@@ -479,7 +479,7 @@ static bool pwm_ops_check(const struct pwm_chip *chip)
 		return false;
 
 	if (IS_ENABLED(CONFIG_PWM_DEBUG) && !ops->get_state)
-		dev_warn(chip->dev,
+		dev_warn(pwmchip_parent(chip),
 			 "Please implement the .get_state() callback\n");
 
 	return true;
@@ -500,7 +500,7 @@ int __pwmchip_add(struct pwm_chip *chip, struct module *owner)
 	unsigned int i;
 	int ret;
 
-	if (!chip || !chip->dev || !chip->ops || !chip->npwm)
+	if (!chip || !pwmchip_parent(chip) || !chip->ops || !chip->npwm)
 		return -EINVAL;
 
 	if (!pwm_ops_check(chip))
@@ -594,15 +594,15 @@ static struct device_link *pwm_device_link_add(struct device *dev,
 		 * impact the PM sequence ordering: the PWM supplier may get
 		 * suspended before the consumer.
 		 */
-		dev_warn(pwm->chip->dev,
+		dev_warn(pwmchip_parent(pwm->chip),
 			 "No consumer device specified to create a link to\n");
 		return NULL;
 	}
 
-	dl = device_link_add(dev, pwm->chip->dev, DL_FLAG_AUTOREMOVE_CONSUMER);
+	dl = device_link_add(dev, pwmchip_parent(pwm->chip), DL_FLAG_AUTOREMOVE_CONSUMER);
 	if (!dl) {
 		dev_err(dev, "failed to create device link to %s\n",
-			dev_name(pwm->chip->dev));
+			dev_name(pwmchip_parent(pwm->chip)));
 		return ERR_PTR(-EINVAL);
 	}
 
@@ -617,7 +617,7 @@ static struct pwm_chip *fwnode_to_pwmchip(struct fwnode_handle *fwnode)
 	mutex_lock(&pwm_lock);
 
 	idr_for_each_entry_ul(&pwm_chips, chip, tmp, id)
-		if (chip->dev && device_match_fwnode(chip->dev, fwnode)) {
+		if (pwmchip_parent(chip) && device_match_fwnode(pwmchip_parent(chip), fwnode)) {
 			mutex_unlock(&pwm_lock);
 			return chip;
 		}
@@ -1085,8 +1085,8 @@ static int pwm_seq_show(struct seq_file *s, void *v)
 
 	seq_printf(s, "%s%d: %s/%s, %d PWM device%s\n",
 		   (char *)s->private, chip->id,
-		   chip->dev->bus ? chip->dev->bus->name : "no-bus",
-		   dev_name(chip->dev), chip->npwm,
+		   pwmchip_parent(chip)->bus ? pwmchip_parent(chip)->bus->name : "no-bus",
+		   dev_name(pwmchip_parent(chip)), chip->npwm,
 		   (chip->npwm != 1) ? "s" : "");
 
 	pwm_dbg_show(chip, s);
diff --git a/drivers/pwm/sysfs.c b/drivers/pwm/sysfs.c
index 1698609d91c8..3f434a771fb5 100644
--- a/drivers/pwm/sysfs.c
+++ b/drivers/pwm/sysfs.c
@@ -509,10 +509,10 @@ void pwmchip_sysfs_export(struct pwm_chip *chip)
 	 * If device_create() fails the pwm_chip is still usable by
 	 * the kernel it's just not exported.
 	 */
-	parent = device_create(&pwm_class, chip->dev, MKDEV(0, 0), chip,
+	parent = device_create(&pwm_class, pwmchip_parent(chip), MKDEV(0, 0), chip,
 			       "pwmchip%d", chip->id);
 	if (IS_ERR(parent)) {
-		dev_warn(chip->dev,
+		dev_warn(pwmchip_parent(chip),
 			 "device_create failed for pwm_chip sysfs export\n");
 	}
 }
diff --git a/include/linux/pwm.h b/include/linux/pwm.h
index 8ffe9ae7a23a..07af6910bdce 100644
--- a/include/linux/pwm.h
+++ b/include/linux/pwm.h
@@ -289,6 +289,11 @@ struct pwm_chip {
 	struct pwm_device *pwms;
 };
 
+static inline struct device *pwmchip_parent(const struct pwm_chip *chip)
+{
+	return chip->dev;
+}
+
 #if IS_ENABLED(CONFIG_PWM)
 /* PWM user APIs */
 int pwm_apply_might_sleep(struct pwm_device *pwm, const struct pwm_state *state);
-- 
2.43.0


