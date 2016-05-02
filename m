From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 2/2] nvmem: mxs-ocotp: remove nvmem regmap dependency
Date: Mon, 2 May 2016 13:17:18 -0300
Message-ID: <CAOMZO5A5JbJV00AsxfqkAsPPR=gB81gobhU4t-+HSX07Q=bCZA@mail.gmail.com>
References: <1462202578-15433-1-git-send-email-srinivas.kandagatla@linaro.org>
	<1462202578-15433-3-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462202578-15433-3-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stefan Wahren <stefan.wahren@i2se.com>, linux-kernel <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org, Maxime Ripard <maxime.ripard@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

On Mon, May 2, 2016 at 12:22 PM, Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:

>  static const struct of_device_id mxs_ocotp_match[] = {
> -       { .compatible = "fsl,imx23-ocotp", .data = &imx23_access },
> -       { .compatible = "fsl,imx28-ocotp", .data = &imx28_access },
> +       { .compatible = "fsl,imx23-ocotp", .data = &imx23_data },
> +       { .compatible = "fsl,imx28-ocotp", .data = &imx23_data },

This should &imx28_data.
