Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE6CEA71BC
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Apr 2026 04:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ivIQYtxBKSYYxLWGWSom7fjyGf+pGkpG586CwmF2GsI=; b=jshLi+XUn/NaSiJjtRBGSTFJDk
	4Z9YK7lLYL8ujD3WZJolxIEG8fLHSLApO3qyjv23EXMKyJMxLU1rHFZtYApu2dfxMFsOu07XCOMKs
	Hqt06WV35QTECUO2aQGUoR/HBu65m8VKBww76DWAjMdncV8VDtZPdlGMwewaDLYtHq9RTCK7I2cBr
	9hWyUb1ov6FgD52p4twuzxp6QtbrPQa6V4CGMmjxj36OPm8s/nxZANDvvQAzYFknSbaYMptAXziwH
	FqgmDwZqAWwjSY7hc+mixsHV86bWSmuj9mQ1PAAI6EHj7PLX+Hp7julAgvPs6aZPu60iZyT0WwVj5
	Gw3+XADg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEgY3-00000006Pj7-1mkv;
	Mon, 20 Apr 2026 04:47:51 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEgXy-00000006PiK-1NDI
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Apr 2026 04:47:50 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso2175204eec.0
        for <linux-mediatek@lists.infradead.org>; Sun, 19 Apr 2026 21:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776660465; x=1777265265; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ivIQYtxBKSYYxLWGWSom7fjyGf+pGkpG586CwmF2GsI=;
        b=Fn8IA7M80U1FL2zHMrwbk1sAiQdlCUXRSKht/p3XCgXmvRsEaA77KJaY2ixZTGkQFO
         Yk1dsGPPhMzLPXFOopKV+ep62j/vH+B38XbqfgEWSVmAxHR41n3NALMCSsWx5lPvlbXU
         0C+lWBCP0LkXCOVSkP9ATtk6Sy92ooXCdQvRqhbTFlsew3uu0hdtBK613i213vS15XCk
         D+PqLKftFZhuYQGs4x9zh0HfeQWXpWE17uDe9JePHl9WYSWKxSylnylnbMZXLxdJEE6H
         cA5C68rNyAzWepkHrX7O3P74EQIp2JbGnILqBrQRHNUmpz7n5GOP0ZFk/NmRkUc+hyE/
         kWNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776660465; x=1777265265;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ivIQYtxBKSYYxLWGWSom7fjyGf+pGkpG586CwmF2GsI=;
        b=g7SvRyRCWeSrvrTgKuntYh0NesuSiZx7+7LoKWFjYc7eiadL0L8pYqYO42nqSiZAun
         HrOmnCMYeqBKD6ftNXxdETa63naLEQhKIVYyXpx8CzwMTuqqAc57Zl8SLGGgu0DOz46C
         EpwQcR8JBBojnK9u5LpZaYa8yCPMa1Daw0B2LBnlrZa6ZzVJmy5C0ZYtDM9+K3QTUvP4
         ZMsIyPD3k4dYQlx+Pko8IhU5vpRR2JUT0KmxUx/MWRNYmPmibYiJ7hH+Pu4uYXZ+DBzZ
         AU/OnL5smNmuHr17jPT9dPkX4NCqS03Xy3kxKFpcF2szAbnUEN9WiZ5vZOQdtBkf05uf
         MxHQ==
X-Forwarded-Encrypted: i=1; AFNElJ9+Dg4l1YCQrHZXkdPcs6l4ScMmIc1Yow9XWzD1wqdxqiaQrQiSwv5+mnq9M+ScVLKQCEPpPrpkTLGjIvHi0A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAnjemG2dutb+81rY4k9H6fHFzer8E3wxh6Fz9qqSv8xfYiy/n
	A7coVKOYcqQPxXKvtv0zkoZ5I6ayONRM2Yx/ZgEAYDec7CN5BYkvamj4
X-Gm-Gg: AeBDiesAW4Sq18K3nHJLL9aqmNBOABHRrSsJsZ8i2aY/r4ZT7m652GIOL7Q8yzzFUt7
	GihI5eknK+6q3XweR/mXi3N51NtGHH4F4haA8vofO1b72eOhVqydMU20pP8VFStBnu1kVWshD/Y
	8IuQ+scdvfRI+kZHYOyoDtd6BA41jIMEw/E7mD1HoCoY9/ZqnCsp5yKy6oTfOCidhx9ggRVnhCu
	GlmJWBCTTtKfCn4hJlJ5hwS0bduvCm7qgTd5cMCeiB8pRrR8Vp4jeumi5gs9tBoRBoQsm6CW+Do
	w94tJ8yH2LlMfqk+iHR+el0OSDN6zSa7aJNXh1c1iwgZZ+Nc+JwPesDm+W3KnCEq6AFmm3dLHpk
	DA2SlFiwPBED3W6tLqBG7S9kGQmaFmYKpk21mXixtxiTvNw7KdJTfVeQ2+zl0QZxk02v9TIyviR
	ZZO1yOr8E6Bc16JyS/bK7DDc2CJ+PIpQ5GfOWm6v+YgPruyO2EOMqIwvo+UTgaB7x40jO2QnQcL
	+Y=
X-Received: by 2002:a05:7300:72d5:b0:2a4:701a:b9ba with SMTP id 5a478bee46e88-2e42e10aeabmr4580207eec.14.1776660464756;
        Sun, 19 Apr 2026 21:47:44 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:1a4e:4965:5dff:cdee])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8018sm15897536eec.8.2026.04.19.21.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 21:47:43 -0700 (PDT)
Date: Sun, 19 Apr 2026 21:47:40 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: robin@protonic.nl, andy@kernel.org, geert@linux-m68k.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	hvilleneuve@dimonoff.com, mkorpershoek@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, lee@kernel.org, alexander.sverdlin@gmail.com, 
	marek.vasut@gmail.com, akurz@blala.de, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 4/4] Input: charlieplex_keypad: add GPIO charlieplex
 keypad
Message-ID: <aeWtDA7snjJmiF9K@google.com>
References: <20260312180304.3865850-1-hugo@hugovil.com>
 <20260312180304.3865850-5-hugo@hugovil.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312180304.3865850-5-hugo@hugovil.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_214746_612839_D0FD9DC8 
X-CRM114-Status: GOOD (  22.42  )
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

Hi Hugo,

On Thu, Mar 12, 2026 at 02:00:58PM -0400, Hugo Villeneuve wrote:
> +
> +static void charlieplex_keypad_report_key(struct input_dev *input)
> +{
> +	struct charlieplex_keypad *keypad = input_get_drvdata(input);
> +	const unsigned short *keycodes = input->keycode;
> +
> +	if (keypad->current_code > 0) {
> +		input_event(input, EV_MSC, MSC_SCAN, keypad->current_code);
> +		input_report_key(input, keycodes[keypad->current_code], 0);

This needs input_sync() as otherwise userspace is free to only recognize
the last MSC_SCAN event.

> +	}
> +
> +	if (keypad->debounce_code) {
> +		input_event(input, EV_MSC, MSC_SCAN, keypad->debounce_code);
> +		input_report_key(input, keycodes[keypad->debounce_code], 1);
> +	}
> +
> +	input_sync(input);
> +	keypad->current_code = keypad->debounce_code;
> +}
> +
> +static void charlieplex_keypad_check_switch_change(struct input_dev *input,
> +						   int code)
> +{
> +	struct charlieplex_keypad *keypad = input_get_drvdata(input);
> +
> +	if (code != keypad->debounce_code) {
> +		keypad->debounce_count = 0;
> +		keypad->debounce_code = code;
> +	} else if (keypad->debounce_count < keypad->debounce_threshold) {

This does not work if debouncing is disabled (debounce threshold is 0).

> +		keypad->debounce_count++;
> +
> +		if (keypad->debounce_count >= keypad->debounce_threshold &&
> +		    keypad->debounce_code != keypad->current_code)
> +			charlieplex_keypad_report_key(input);
> +	}
> +}
> +
> +static void charlieplex_keypad_poll(struct input_dev *input)
> +{
> +	struct charlieplex_keypad *keypad = input_get_drvdata(input);
> +	int code;
> +
> +	code = 0;
> +	for (unsigned int oline = 0; oline < keypad->nlines; oline++) {
> +		DECLARE_BITMAP(values, MATRIX_MAX_ROWS);
> +		int err;
> +
> +		/* Activate only one line as output at a time. */
> +		gpiod_direction_output(keypad->line_gpios->desc[oline], 1);
> +
> +		if (keypad->settling_time_us)
> +			fsleep(keypad->settling_time_us);
> +
> +		/* Read input on all other lines. */
> +		err = gpiod_get_array_value_cansleep(keypad->line_gpios->ndescs,
> +						     keypad->line_gpios->desc,
> +						     keypad->line_gpios->info, values);
> +		if (err)
> +			return;

We need to deactivate the line on error too.

> +
> +		for (unsigned int iline = 0; iline < keypad->nlines; iline++) {
> +			if (iline == oline)
> +				continue; /* Do not read active output line. */
> +
> +			/* Check if GPIO is asserted. */
> +			if (test_bit(iline, values)) {
> +				code = MATRIX_SCAN_CODE(oline, iline,
> +							get_count_order(keypad->nlines));
> +				/*
> +				 * Exit loop immediately since we cannot detect
> +				 * more than one key press at a time.
> +				 */
> +				break;
> +			}
> +		}
> +
> +		gpiod_direction_input(keypad->line_gpios->desc[oline]);
> +
> +		if (code)
> +			break;
> +	}
> +
> +	charlieplex_keypad_check_switch_change(input, code);
> +}
> +
> +static int charlieplex_keypad_init_gpio(struct platform_device *pdev,
> +					struct charlieplex_keypad *keypad)
> +{
> +	char **pin_names;
> +	char label[32];
> +
> +	snprintf(label, sizeof(label), "%s-pin", pdev->name);
> +
> +	keypad->line_gpios = devm_gpiod_get_array(&pdev->dev, "line", GPIOD_IN);
> +	if (IS_ERR(keypad->line_gpios))
> +		return PTR_ERR(keypad->line_gpios);
> +
> +	keypad->nlines = keypad->line_gpios->ndescs;
> +
> +	if (keypad->nlines > MATRIX_MAX_ROWS)
> +		return -EINVAL;
> +
> +	pin_names = devm_kasprintf_strarray(&pdev->dev, label, keypad->nlines);
> +	if (IS_ERR(pin_names))
> +		return PTR_ERR(pin_names);
> +
> +	for (unsigned int i = 0; i < keypad->line_gpios->ndescs; i++)
> +		gpiod_set_consumer_name(keypad->line_gpios->desc[i], pin_names[i]);
> +
> +	return 0;
> +}
> +
> +static int charlieplex_keypad_probe(struct platform_device *pdev)
> +{
> +	struct charlieplex_keypad *keypad;
> +	unsigned int debounce_interval_ms;
> +	unsigned int poll_interval_ms;
> +	struct input_dev *input_dev;
> +	int err;
> +
> +	keypad = devm_kzalloc(&pdev->dev, sizeof(*keypad), GFP_KERNEL);
> +	if (!keypad)
> +		return -ENOMEM;
> +
> +	input_dev = devm_input_allocate_device(&pdev->dev);
> +	if (!input_dev)
> +		return -ENOMEM;
> +
> +	keypad->input_dev = input_dev;
> +
> +	device_property_read_u32(&pdev->dev, "poll-interval", &poll_interval_ms);
> +	device_property_read_u32(&pdev->dev, "debounce-delay-ms", &debounce_interval_ms);
> +	device_property_read_u32(&pdev->dev, "settling-time-us", &keypad->settling_time_us);

Not all of these are required properties. If they are missing the driver
will operate on garbage values.

> +
> +	keypad->current_code = -1;
> +	keypad->debounce_code = -1;
> +	keypad->debounce_threshold = DIV_ROUND_UP(debounce_interval_ms, poll_interval_ms);

This will bomb if poll interval is 0.

> +
> +	err = charlieplex_keypad_init_gpio(pdev, keypad);
> +	if (err)
> +		return err;
> +
> +	input_dev->name		= pdev->name;
> +	input_dev->id.bustype	= BUS_HOST;
> +
> +	err = matrix_keypad_build_keymap(NULL, NULL, keypad->nlines,
> +					 keypad->nlines, NULL, input_dev);
> +	if (err)
> +		dev_err_probe(&pdev->dev, -ENOMEM, "failed to build keymap\n");

Missing "return".

> +
> +	if (device_property_read_bool(&pdev->dev, "autorepeat"))
> +		__set_bit(EV_REP, input_dev->evbit);
> +
> +	input_set_capability(input_dev, EV_MSC, MSC_SCAN);
> +
> +	err = input_setup_polling(input_dev, charlieplex_keypad_poll);
> +	if (err)
> +		dev_err_probe(&pdev->dev, err, "unable to set up polling\n");

Missing "return".

I fixed it up and applied, please take a look in my 'next' branch and
tell me if I messed up.

Thanks.

-- 
Dmitry

