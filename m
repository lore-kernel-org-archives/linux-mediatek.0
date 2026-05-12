Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 401B9CD4855
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2026 07:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MT81Hd3L84EXgk134AFMdTo3wRN3W9j9EMFVjmJ2DXg=; b=Oken6eSnt1QXu05TRjC+67xWa9
	oBHUbEtA4RPlJJcdNTb8U7regFw4V6yHnSoO8lI+T7hZhhicf5ERpiKvu4/Jmz1EackI5ANydetbS
	gv9ylbUMjF/9qk1ONZBXskwiW+BC+O8KP+VrO5ppNs950ia9c47Mi6kZlNJj/YzY/WCzQ1mad9aEe
	9fWFuRPSbbHo7mTWWNLsTf20Xwm58SdvWXlMCL3Eq6wE2O81hPqVYosnybrOtx9rhhX6+O1xwSesc
	vCrJczfkBTbm2aDRKfGqRjoD5n598G1LctBf+LHxmp9LQ0cXzmircjtZt6C6PfXT37VIdZp/wRJu+
	IWR3skCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhEO-0000000FsF9-0x1T;
	Tue, 12 May 2026 07:08:40 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhEK-0000000FsCd-2lhJ
	for linux-mediatek@lists.infradead.org;
	Tue, 12 May 2026 07:08:38 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-bc64ad08bf9so771973666b.0
        for <linux-mediatek@lists.infradead.org>; Tue, 12 May 2026 00:08:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778569715; cv=none;
        d=google.com; s=arc-20240605;
        b=hze52g5rckzrXSQruM6vC3/VjBqXAHxBBvtswLO/WSiplfpaLVrpG74lpu33NlUtsv
         zgMxB4+waH7iE/EBpg8ZUsM+hZzOGseOC/GcJXRRZij+kRAKI9m/k2uUEw0lcG1unxEh
         /ED75e1n1asCIEeprwLUZBtLQmLO8sFDnxs358mDTcu7QYr4J9PK5majEv8MMUS52arK
         dcKPNYVL44MsOpypJZyDqUsIXo5j1C3UU/xNWmcbeXCvDaAGUN/5mVAI43ZMuG8j1sKA
         1D67sFcyPtDGiyHVDUo41A1TvH+Xvg6GVhcJrbeeVUj8yFWWLNn3JoRyKv9VFU3TG6/Q
         bJpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MT81Hd3L84EXgk134AFMdTo3wRN3W9j9EMFVjmJ2DXg=;
        fh=opVsyw7L26QBqviTZNRRK9eVLJc/igbGR4zFUzzlFUw=;
        b=YI3KIh1QMZNadheplxUiA53TLvAPBvzxiN610BDRah7YsvKRifDKNSVcsYPzsBzZ84
         MvLjHOu5/dWgnlQMkeSgZFUKaMSnyoQtbjxFqMzISKBJJYetj3r6WdFdUbA1SHkDq9HV
         87Mft4aYAaUuAsDaIGzKuQslavvNWPF5tS5Se5u7aAFcT9yvhOPz0q0mYWd2JRCA8U6b
         2rdaPc7Vec+sm/xAwenHRvKejoSyx7YQljJHLsYRzfpfHhyYzcdJA/hUzXTodCzEPJg2
         HGzREy709kSUIQFAD9YKfXH7nBZeBANK12H2XO+amlWHjkAaFWJU+SkBJp2elXjm/QY5
         G+8A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778569715; x=1779174515; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MT81Hd3L84EXgk134AFMdTo3wRN3W9j9EMFVjmJ2DXg=;
        b=UldNyVyQHp6XU6adYINIHF9PQPCD9nyJRDHUgiiuQmraBamRSP6AxVYblVVhT2dRLa
         nC4bmtQBQjRDXOxcNUvWlw/ktm+3bz+k+7K4HxRyOffOC9yjz3hccVbxbLeB3TUdn7s/
         WL+Yml+6STkHSjH4POtn+N1ohILIauQr0e0d1FLa/1//pC1X3ivwzf1Wowxfn+mMN3aH
         h/VOuCG+ld44Y3GMBMBDhF++ow2e+u7sovwlagI++qJ3BwIURQ6LOTdi4kIc0gDhLaLM
         tGknBNxDpBpIAt201uy1PLre2N83i66I+S5tfuekOH/sinV/RfL6wmTUHZgAccxNUJQh
         CVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778569715; x=1779174515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MT81Hd3L84EXgk134AFMdTo3wRN3W9j9EMFVjmJ2DXg=;
        b=OgKhEmDpTM+0ewReCql7s1tQKxD5GcKQtIxUa0Yt99k3E/redHfXmCLZGTDGDJwXti
         f5FDva1blesfstoBw/iHLo1/1xZvglkf7sXxXWTMJAvT/WgrthoKwhrxzx2uu4kLsgQ1
         yUmaR/11c8ynQmtWFqnvpg1yanGEmciuC/bhL1qDMXYu5GiYrERU1mfnG26NOcVW7hBO
         jha6aX9P7dDp6bin078LKqKyQ2Uvlk1UpMZZqLZIt/X6NvYM2lCA2QW4Y2rU7cchmASx
         /clg0YH5XfkITS/cEXk1YJ4KEWmcds+Btb9O2OpbRJC5WPeTgsAPhGhPSyNOVcH5NkY3
         4TUw==
X-Forwarded-Encrypted: i=1; AFNElJ9z2cehM12lbRwpKGQHtSkHgMvZTb3jf81H89XCv6AqyFKw0zKJ0v7fUxjN02Szb06gBK55YHxv2DjSRGt8RA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yww77bSR3wGtXhoySiTDT5yPQOGOadCad4TQq/4Ig+4BzyiYxRW
	hVTvLfW29u0MV2MH7Zv9Or5EZNLzZoaVX39tYsZOPbTG5Uej/XwYe3GRsAN6Q6Q9wfRrVjVyhif
	4h2+n/AMChiZbPRC726tzzA1+l3dqizs=
X-Gm-Gg: Acq92OFhnDM3JeoVgQnGWay8J1YEuCj9VA6hfV0Av/P1ZHl2vvhabfY0PkazHoaY0Up
	C9LSuXJ5SN6fJspBBjwsTZwNxOBtelme48zqT90AkzojPyzvktIKAOeEh9+7I/Nlkn37quxN2SL
	8kdYCVBlwAQljH2QTygmfHVg5TK73V18POF6OyUE8yrq+pppdhOJm/vHbmrt+UYKzLxaRUq3Vwa
	nrvRuw9Z1M4uOU+PtNHwYOwAZtbCZgAY4uGY23ClwTZAQFCMl+HOG09w/y7uim4z2uVrdkjnDrn
	oE5Ph9/cn4KGdK5J4URmzvHgjvYKD9FEUBjw4/laAqfauyxyFCR/VpxIyvPqIdoT4/jz0Cajnk7
	Rc/DFV+Y=
X-Received: by 2002:a17:907:9412:b0:b97:1d24:c004 with SMTP id
 a640c23a62f3a-bc56de100damr1755416366b.21.1778569714611; Tue, 12 May 2026
 00:08:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com> <20260512-mt6323-v2-10-3efcba579e88@protonmail.com>
In-Reply-To: <20260512-mt6323-v2-10-3efcba579e88@protonmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 12 May 2026 10:07:57 +0300
X-Gm-Features: AVHnY4Jipzfnw1owf-ZULaa0oh4jwzOau62Z8kgQLDNNHax4pisYq4PVzs9Mr6s
Message-ID: <CAHp75Vfi8VwJvBLAAnRO4ZdoFYCCXcC62UOPC5hCcYpTpf-+og@mail.gmail.com>
Subject: Re: [PATCH v2 10/16] mfd: mt6397-core: add mt6323 thermal support
To: rva333@protonmail.com
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-pm@vger.kernel.org, Ben Grisdale <bengris32@protonmail.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_000837_169356_5482842F 
X-CRM114-Status: GOOD (  10.11  )
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

On Tue, May 12, 2026 at 8:21=E2=80=AFAM Roman Vivchar via B4 Relay
<devnull+rva333.protonmail.com@kernel.org> wrote:
>
> The mt6323 PMIC temperature can be measured using AUXADC channel.
> Register the thermal in the mt6323 devices array to allow the
> corresponding driver to probe using compatible string.

Wouldn't it be better to interleave these MFD patches to enable each
driver just immediately after the driver provided? However, in
previous review somebody ( IIRC it was Krzysztof) asked how dependent
are they and it has something to do with the device tree bindings.
Take into account that one as well.

--=20
With Best Regards,
Andy Shevchenko

