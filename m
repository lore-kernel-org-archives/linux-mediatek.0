Return-Path: <SRS0=h1kY=43=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 508CCC18E5B
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2020 14:03:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2921524649
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2020 14:03:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="otgU3sLu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="u/Co4rTh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2921524649
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qP3XcTZplnBTx2fP9B4LpJFpQtFlSFC1AN185bzSp6w=; b=otgU3sLurEU4bO
	eKfehUsiXNyVZ3ktomdlSWFehWwN1Fy8KGq8a8Qa6NE7s96AEBTvaDqwWYiV8Dan5bcSfSchiR5Gb
	/HJiz0h8VTO2iW3UBpp1fffgflQ69ulWekNFnRkWRXsQgDHPsEQH2NMX/rBLH0U5R9m7uT01exP8F
	JBPYvlrJSZvxIKl9/Q+WvGWPiPn7Gxu7CDlRFyqY/TukKcriU5MMNyDKeh/2KeD+0M8aG1PfK5Ac9
	wKhabmpXL7CefBzLYdQ7T3Uz9GiHFLVsiqvSeTcTkksj0DZ1WpOOqyMNUKeJcs2eJ5z9h0ZWp4kvV
	YYQrNyNaspKeECB5AzCA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBfTw-0002fl-Sn; Tue, 10 Mar 2020 14:03:40 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBfTo-0002YX-Vz; Tue, 10 Mar 2020 14:03:34 +0000
Received: by mail-lj1-x241.google.com with SMTP id d23so3665134ljg.13;
 Tue, 10 Mar 2020 07:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ifhb6WixgJc6nnbKnnyQJ5Lzp6hUyVHScR9nCG2Gpbs=;
 b=u/Co4rThARQN6d7BB1WsDIguEHyOZRCEDSZ0aRzABmG4KiGoaSXNCxJ58kdF8RglmZ
 gUnmXg+cCZPlIcy4f7UEKRTBY7kdnb3tx26a30cChFyc+0UooSQdco73Ea02bzTBSO8O
 in29jyjpDTvoX8UYVBipDQUTb9Y6gMpRm2hD8BbIWsLyHqSXtZ0qUkTSOKIzI6PN7Qyx
 9LgqsrUYKEoiBPLBabe7csVgtNEvCdfHfnowfQn+zzUqDW/3AWI8rdEhkj7Hvwys5CGI
 /OHIfDVPS1k+NrLNmhYuEci+squRepbPr1LlncIJb+KxKdbTn4ecJv8+hqK+J321emRy
 S3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ifhb6WixgJc6nnbKnnyQJ5Lzp6hUyVHScR9nCG2Gpbs=;
 b=ixJyfCHwUIkd7kEcevsZkfRTFtG/O4QAvWbhihgn+6t+3dy6mg2gY+tNEhyQpd1kJM
 ERc5CDR0VUIihaTl+5GWK7YHTvH1/C4rUtcMkNDi8c8/DFkeJs/zRqT2ruEOnqRRRSKp
 Uioe4ceN57k3wMpV8tinvlMMVtbT+ipxbNY8CjtknoDa4RPWSklLUEcqN/2aEVNHqx4H
 jAte1iJFVpSchmMSxsrEaPRLKwxS5XiURCaXbAF1bKFT3cDJh17U5D1DFpOEsgyGalKk
 InQ0WYnm+T+07sMDJOaK0HQMY5G4PgVNPSqXHntawCVYaQNtGFhEt99PTNO6xPHzhg8j
 eenA==
X-Gm-Message-State: ANhLgQ33oN+mh83DLkP1xZY/p/3iiRwI9z38hP6woj5MJ3nXzCO2o8h1
 kMaOAckB3LTYZy9/q/lWaKbjbEFmz+xsRsAjLWk=
X-Google-Smtp-Source: ADFU+vsNLzcIjQvDxrS1HICTwW6HgMn3cbq+aL6cnnKZeK97nAmGn2kplnEXtqTHoWwA5L+xcBE8jylw4kWIQlYByr4=
X-Received: by 2002:a2e:86d0:: with SMTP id n16mr12557218ljj.117.1583849010466; 
 Tue, 10 Mar 2020 07:03:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200310134603.30260-1-robert.foss@linaro.org>
 <20200310134603.30260-3-robert.foss@linaro.org>
In-Reply-To: <20200310134603.30260-3-robert.foss@linaro.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 10 Mar 2020 11:03:21 -0300
Message-ID: <CAOMZO5D7N6FfPMiycGun-eui-G-tbp15stwRWBWs4L98JHFfGA@mail.gmail.com>
Subject: Re: [v1 2/3] media: ov8856: Add devicetree support
To: Robert Foss <robert.foss@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_070333_054076_BCA319A6 
X-CRM114-Status: GOOD (  10.09  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 ben.kao@intel.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Dongchun Zhu <dongchun.zhu@mediatek.com>,
 Jonathan.Cameron@huawei.com, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Mar 10, 2020 at 10:47 AM Robert Foss <robert.foss@linaro.org> wrote:

> +static int __ov8856_power_on(struct ov8856 *ov8856)
> +{
> +       struct i2c_client *client = v4l2_get_subdevdata(&ov8856->sd);
> +       int ret;
> +
> +       ret = clk_prepare_enable(ov8856->xvclk);
> +       if (ret < 0) {
> +               dev_err(&client->dev, "failed to enable xvclk\n");
> +               return ret;
> +       }
> +
> +       gpiod_set_value_cansleep(ov8856->n_shutdn_gpio, GPIOD_OUT_LOW);
> +
> +       ret = regulator_bulk_enable(OV8856_NUM_SUPPLIES, ov8856->supplies);
> +       if (ret < 0) {
> +               dev_err(&client->dev, "failed to enable regulators\n");
> +               goto disable_clk;
> +       }
> +
> +       gpiod_set_value_cansleep(ov8856->n_shutdn_gpio, GPIOD_OUT_HIGH);

To power it up you probably only need:

gpiod_set_value_cansleep(ov8856->n_shutdn_gpio, 0);

And use reset-gpios as active low in your device tree. Assuming the
reset-gpios is active low like other OmniVision sensors.

> +
> +       usleep_range(1500, 1800);
> +
> +       return 0;
> +
> +disable_clk:
> +       clk_disable_unprepare(ov8856->xvclk);
> +
> +       return ret;
> +}
> +
> +static void __ov8856_power_off(struct ov8856 *ov8856)
> +{
> +       gpiod_set_value_cansleep(ov8856->n_shutdn_gpio, GPIOD_OUT_LOW);
> +       regulator_bulk_disable(OV8856_NUM_SUPPLIES, ov8856->supplies);
> +       clk_disable_unprepare(ov8856->xvclk);
> +}
> +
> +

Unneede extra blank line.

>         v4l2_i2c_subdev_init(&ov8856->sd, client, &ov8856_subdev_ops);
> +       ov8856->xvclk = devm_clk_get(&client->dev, "xvclk");
> +       if (IS_ERR(ov8856->xvclk)) {
> +               dev_err(&client->dev, "failed to get xvclk\n");
> +               return -EINVAL;

You should better return the real error insteald
PTR_ERR(ov8856->xvclk). This way defer probe could work.

> +       }
> +
> +       ret = clk_set_rate(ov8856->xvclk, OV8856_XVCLK_24);
> +       if (ret < 0) {
> +               dev_err(&client->dev, "failed to set xvclk rate (24MHz)\n");
> +               return ret;
> +       }
> +
> +       ov8856->n_shutdn_gpio = devm_gpiod_get(&client->dev, "reset",
> +                                              GPIOD_OUT_LOW);
> +       if (IS_ERR(ov8856->n_shutdn_gpio)) {
> +               dev_err(&client->dev, "failed to get reset-gpios\n");
> +               return -EINVAL;

Please return the real error.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
