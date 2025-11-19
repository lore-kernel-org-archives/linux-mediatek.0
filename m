Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE6ECF3979
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Nov 2025 17:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a9shqnQLik0MBvQvkSLKR825xw1M6Btpip0qF9AlI/E=; b=XgCtuuAmT3/NeE9+Yd7l2/fPXC
	ULaU9l1RgOFgL0VCEyvV3YmsADzGXYwmmLhEDTxEsTrs29Tb3Mm/BDgYNt033qq3zrCokNQloqV9e
	RKp7RFhezm02ipE0WPviM5yfp5k6aTg/uSmGu8cgOUmjq8EV++S9cWwEahVehdUdLcPS/OXqOpVXk
	L18MycXTjQEsDyTyx5OaM/Z9i82o6ge0SC3U91qf2OiXMvlROXzeKi/eZ1oOKRBoYY36WlL890q9E
	JsI0mQlo7xaG0Nnt7vXYR6H3Jkxxm8nfp+QLreWaS88Qq+CpDfqPbneRtrCquee++TmDH9PUOLrMN
	Fsa8H1kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLm1J-000000047J9-2g2S;
	Wed, 19 Nov 2025 17:31:05 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLm1H-000000047HT-1MaQ
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Nov 2025 17:31:04 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b737cd03d46so4888066b.0
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Nov 2025 09:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763573459; x=1764178259; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9shqnQLik0MBvQvkSLKR825xw1M6Btpip0qF9AlI/E=;
        b=e0zMuD5VQ10d4+6QsNpry7SFdtVUqhPSG228doPcjxDDZUT6SjmAMaz+/hMAwXT6K6
         MEeDqP3I3bJXjqTjWwMJBMFKPD0uRBq073WqMrwL0EDCNllw9JGrE8YpFn/0Ce+I9v5t
         86Empah+k/Cfe6/XIG6Et8C0PIhuU2ldRFY1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763573459; x=1764178259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a9shqnQLik0MBvQvkSLKR825xw1M6Btpip0qF9AlI/E=;
        b=JV3p5jEOkyNBMaUQqryhRLp3xSgvmAWdsO+2+C9XpSI3JMetOxGtVA9WBGKKr//hiH
         hjtexaxiIKgm1AeWdpamcpIiejKq3OUovrjwTG6msFVtNZSGmYZqepV2B+jndPXN+J2D
         K6QknB8nnyjy7zd4j/rr3xvqPz0vEew9tlBMNL7xCYr23OMVFLUsZkx8zcHkiDCBlxmS
         yI+l/oxgSL7y9Jyx/luY5Bd1nVSvYdbzM9TRR+X7moehGFps5cjcLsAXsSdgMcwtwT1T
         do4DLYzNUMYM/iLdwhBpt++yFStj9d0lriyCkZFOmK5KZiY/NIjPG5HMV6GtwoheGAS5
         27Vw==
X-Forwarded-Encrypted: i=1; AJvYcCWCz7mLV8fCSP0HyKi3HHfanF+DANCJdW0q98Q0KgEwAWnFH4uaAjQAvwLjNtt9pXh2h492XGbcq5jS5m5XHg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz80v/J30xE07Kt0jQduXYV9HvYhjmL/ZFGPvhYXctLu3KdaSNx
	mIgO9e3rD27efGIk35HjhKYaH6bl67nScuHCNWZbI/lKplMje+cKfTHaYYzZuE6V2N6mLCcPFE2
	kpSV9saZ5
X-Gm-Gg: ASbGncu8FGfdA+PMKK24Koq3v5jqn0+7nxBSOSqSg35npMichIfaGebyuogtix9pUBm
	CuWlDlTC0dDP3UONv4TLXhr1rN3nRYJ5w/043ubhi9iFu8XTG2jlWXMwJp+e5WgK4BGNFJaQlbn
	AmcncTIY+9VhRarb9t3X3aWTp3fR/An6ulUNjTGstxY6dHtSeAM5wSfXLCnpwsuz2TzoWIwIVwh
	g3M7h2bRkTvkt21fJHBZpCq9+S0iMr4EvvL2Qrcv9pEYsCRJ/QCArYns7sRBfBr92twBNPuMSkL
	ossP3MlbQc5z05wEdDd3m7Qe3AMbhiHbqZ8mrgAI1+Jyj9gw+k3z0PTh6GuA/x4PkuAl+BjDD6c
	WaKmq8ip4Ay4TSHp443IxsrUT1Zb21CeNpoVbxfBT+ximkpmUJmONm1evlI2rNQ6fO1obskz+XN
	3naoicUjM8T7vJBNUgLO99DXzG37JHWD/Vwzgiw8kGeCaQD2ZOQC7pOQqu0RoG
X-Google-Smtp-Source: AGHT+IHFR68Kl+OCOHoJPNNxqP2d0Aids8Gsg9cgLbKoLgmXnYbTlhw04s+zJvstxTT7RUF9m0TrDg==
X-Received: by 2002:a17:907:7e9d:b0:b71:88eb:e60c with SMTP id a640c23a62f3a-b7367bc4017mr1967422766b.44.1763573459398;
        Wed, 19 Nov 2025 09:30:59 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fd809absm1676280266b.44.2025.11.19.09.30.58
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 09:30:58 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so223985e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Nov 2025 09:30:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWONOIaEdS0r46T4/4agNfSTaeiaOGXmAZuILNkxgSYQmX1Ewl2wolO0pBYcFf/rNFYRkFEfyQkrva6PKaGCw==@lists.infradead.org
X-Received: by 2002:a05:600c:4694:b0:477:952d:fc11 with SMTP id
 5b1f17b1804b1-477b8a8eb4bmr414775e9.16.1763573457648; Wed, 19 Nov 2025
 09:30:57 -0800 (PST)
MIME-Version: 1.0
References: <20251119085354.1.I1ae7aebc967e52c7c4be7aa65fbd81736649568a@changeid>
In-Reply-To: <20251119085354.1.I1ae7aebc967e52c7c4be7aa65fbd81736649568a@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 19 Nov 2025 09:30:45 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X+mjEYu4WU-0nbHMtW-HAzm6EUeBnZj46g27O3iobKBQ@mail.gmail.com>
X-Gm-Features: AWmQ_bn88skAW9xgPWrFrlEJQJC-r-nYEqb-FQnzB2AAJsIY30EVaWKYqaJSmTs
Message-ID: <CAD=FV=X+mjEYu4WU-0nbHMtW-HAzm6EUeBnZj46g27O3iobKBQ@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btusb: mediatek: Avoid btusb_mtk_claim_iso_intf()
 NULL deref
To: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, incogcyberpunk@proton.me, 
	johan.hedberg@gmail.com, regressions@lists.linux.dev, sean.wang@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_093103_377422_833923EE 
X-CRM114-Status: GOOD (  20.01  )
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

Hi,

On Wed, Nov 19, 2025 at 8:54=E2=80=AFAM Douglas Anderson <dianders@chromium=
.org> wrote:
>
> In btusb_mtk_setup(), we set `btmtk_data->isopkt_intf` to:
>   usb_ifnum_to_if(data->udev, MTK_ISO_IFNUM)
>
> That function can return NULL in some cases. Even when it returns
> NULL, though, we still go on to call btusb_mtk_claim_iso_intf().
>
> As of commit e9087e828827 ("Bluetooth: btusb: mediatek: Add locks for
> usb_driver_claim_interface()"), calling btusb_mtk_claim_iso_intf()
> when `btmtk_data->isopkt_intf` is NULL will cause a crash because
> we'll end up passing a bad pointer to device_lock(). Prior to that
> commit we'd pass the NULL pointer directly to
> usb_driver_claim_interface() which would detect it and return an
> error, which was handled.
>
> Resolve the crash in btusb_mtk_claim_iso_intf() by adding a NULL check
> at the start of the function. This makes the code handle a NULL
> `btmtk_data->isopkt_intf` the same way it did before the problematic
> commit (just with a slight change to the error message printed).
>
> Reported-by: IncogCyberpunk <incogcyberpunk@proton.me>
> Closes: http://lore.kernel.org/r/a380d061-479e-4713-bddd-1d6571ca7e86@lee=
mhuis.info
> Fixes: e9087e828827 ("Bluetooth: btusb: mediatek: Add locks for usb_drive=
r_claim_interface()")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> I have no way to test this commit myself other than to compile it. It
> looks fairly straightforward, though, so I'm hopeful it will fix the
> problem.
>
>  drivers/bluetooth/btusb.c | 5 +++++
>  1 file changed, 5 insertions(+)

Ugh, the bluetooth bot properly told me that my patch doesn't apply to
bt-next. I'll send a v2 right away. Sorry for the noise.

-Doug

