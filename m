Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 804B1C5DF94
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2026 07:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/xJK88pfs277nwbYNBwPuRxCY6IirnLC5W4+cq/H6A=; b=GE4OfULtjrf0bIVHTFS57IX6qX
	i2GBepGYO37wuwY1l1b/YbEIDFibZSyUvXRBNhdbI4icZwXtxkApR14GMH4lf/u5T0TDacUzwNNzB
	ghquKFHCFqbAwMs6Owd76eQPE8F2QrqX4crQIZpiMIErI7bhYdEoJNj0kk7l+UuwjwDIh2uHRcR/i
	76U+6Sl+pMUqw/F9QbkKYS7uqg/yegcePnh6QAxEmxYRbAH9dPk3SUOvJe9/HsjCD8Yivw7jV+S38
	obxduka72pWA0WPcJ8fSKSmk8S8KKnwmZ4RH9G8N+DzyI/4sLlm7EsT6GriMTtmPbEcPuPfzj3EZF
	7B6KqJeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wylpm-00000000JVe-0G1T;
	Tue, 25 Aug 2026 07:44:38 +0000
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wylph-00000000JUL-0wsP
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Aug 2026 07:44:36 +0000
Received: by mail-yx1-xb134.google.com with SMTP id 956f58d0204a3-66c711b7f2aso6452939d50.3
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Aug 2026 00:44:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787643872; cv=none;
        d=google.com; s=arc-20260327;
        b=HM360cMV1IOjKuYaaoQ8ixVSqS5YLCXskni2yrmJyAgMNhi2u+5axS9TT3RNMRs+EU
         RlhKp3d5VTPqkX95hudue4/RLi8RWdWcIlVbxAbgTwmahbXw6VbVYgddTOIu/imy7ahX
         680jsNr3PRPBs/OHlLc9SE6EeZjPkO8iy3kjN+NOdhpcUUWd3LnwsojNyTGg8gWoiozf
         UUPxOJC4sv+iSivZHbJ8VvbFykwuXF4BGhCDoEs3vNEQVTb57yOhKBwiqPavpBkr1Qa0
         CUVacP/QxqlHedqgjNWwHVL+PoiuECr86m3pzA91NQxgXS9j9aat/COK1ZJrBCunBiCe
         t9aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V/xJK88pfs277nwbYNBwPuRxCY6IirnLC5W4+cq/H6A=;
        fh=XfkEL/Zh2uHk2yEwlovQ2xzB7jd5MKYfZkImCVuxi94=;
        b=rFWW1AMD43b69dw7OSxLgI/uZCLFcUocQEDOy0v882tF+TpGD/J2GymCLJrYiu9H8z
         ziHuCC+U4BxrOqNuSn5WQECUoGIuThGMfv7LSnerdItwChEqWLTDxOyl6vP125wz+8i2
         d0AwWJW0znfxNsjuDLc5GwhzMF64nJ5q5+UdHnc2aQTk74uJAXxRsmP9qL9XfDNK4Z9J
         eBoDQqlBohal5WoKfUUZslnrwIBBDBx/Z4Ci32iGxny/FM7TBVRZ3N57Ap04H8d85HI/
         Brh6MgHnM9rg4g0KYGkaCzefOq8wQ7qSXtTuOBS0C/HDtmtgU3z/4yAhaFJXvF47mhjW
         s9uA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787643872; x=1788248672; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V/xJK88pfs277nwbYNBwPuRxCY6IirnLC5W4+cq/H6A=;
        b=TPJIs2+dzBjJv7VPX4Ug643td/FkJ1S9QdyvmbmioPttPS+ZAkjK95vi5hg5njFU5b
         B2xA1sEvPWERUxQ2JNgtfEvRFvNP1MrTTZd649vveAvonPlkD/OEDHMbmMof97JbeFek
         hZUACxdZuO/NIL44kx/zLVqWcHqy4+f8/kFFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787643872; x=1788248672;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V/xJK88pfs277nwbYNBwPuRxCY6IirnLC5W4+cq/H6A=;
        b=jmyM/RFqdSmIQIKNWzLY6uE3xU2JM/8wApVu15VHNxa63iPl/IiRphHDzmRoE3Zd17
         LlE6FqeP/yL5m2L/LuydrbPaxT+17fgN7drZNTs0J1aPMa/tqDiI3CR1m7vbuwSE/XW9
         ukTsLc4m1wIPG0cbb+OMplAqUH6XO5vgrHandamcWMEGcUjmydzDINs53ykCi2AEf4Kc
         IyxaCLeJsGNxagcpm3cZmDGXE+7gybTpyf41svVx3fPsXTkJapuG1cMqmqjjdEBKyJFT
         mUYeSf+9jFncYo7Qytiw2k3jfCRzffsK41j0e7Nd0Fs6Ku48fUiMbh6ur7SZHHpBguLd
         l64g==
X-Forwarded-Encrypted: i=1; AHgh+RqpHYmHYJcPJbUWqNCqmsG/MI1eTjkH7G49d53wgr5jg+h0W+sYl2Wr5Q1YBA+j9XpInvn6Gpd+uS8B3nhjDQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lS643ugqey7UlJ6Nwxmzmhx0buF8SnpxbkC8BzzE4tF5fLQn12
	u+KecMLozwWsAaXGCLKtxsi3kvW8ztk22aI2lwmJ4zPwGRTJt6r/JMyXuCpEMSl0RozLPkJcVjf
	unInStSDhUyJDU4juDkPTSdNCf3JQ/OHoHs6WLzqo
X-Gm-Gg: AR+sD10ZKZ/kR3CIS4Ab83MN7J/zIdEB5BJuIRDo8hFSEMK4v+o16yPIBjNyMXKP+gk
	fYP8Snn1LpTxfAvmJr+ueFtYnQGE/XRrUcZRmYMvGovr0PAkzD5Xddh7+9blaopeA6NlabjMWUi
	uhVeZEuQenIv3YmHwt29Zrh61tKhWaPGTLDctWIN2aVRfjfJv/O+2IWY5xubIzZLb/zXlId0jGS
	Fs9DEWyB/IszyHWbS1H9dNRq9K/hEkuINJM8oaimQnEVlWkud95cMTdAZMCOr/oKbtynzdky+MS
	wLLDF0x0d+X3ZvEO4byZNQuciK5sRAEMUg+VU4VYwd5r3Da7oRCoCfJrsxA6ATjj4yk7SoW4
X-Received: by 2002:a05:690e:1449:b0:66d:1131:b81d with SMTP id
 956f58d0204a3-66d1131bc41mr2549091d50.29.1787643871703; Tue, 25 Aug 2026
 00:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260825041628.988369-1-wenst@chromium.org> <20260825041628.988369-2-wenst@chromium.org>
In-Reply-To: <20260825041628.988369-2-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 25 Aug 2026 15:44:21 +0800
X-Gm-Features: AcwNN1VHbO3y1ftfkF_7R2W7KDk8RFMySudnf-TTSiUhjGplV2Fwnh0fieb32LM
Message-ID: <CAGXv+5Het3zp_OTp=_ktg+_d5Q55zkE0SwQnM7TVyJDmOdBtyA@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] regulator: core: Add "enable and wait" functions
To: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-input@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_004433_296899_F5274D8F 
X-CRM114-Status: GOOD (  21.27  )
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

On Tue, Aug 25, 2026 at 12:33=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> In device power sequencing and initialization use cases, it is common
> for the driver to enable the regulator and then wait for a certain
> period of time to pass before continuing.
>
> In cases where the regulator supply is always on, or has been turned on
> or left on by another consumer, the driver could shorten the delay or
> skip it altogether, provided that enough time has already passed since
> the regulator was _actually_ turned on.
>
> Tracking this requires support from the regulator core. Introduce a
> "last turned on" timestamp field to the regulator device, and "enable
> and wait" functions to the single and bulk regulator consumer APIs.
> The existing "enable without wait" functions are then converted to
> macros that expand to the new functions.
>
> The timestamp is updated each time the regulator is actually turned on.
> For regulators left on by hardware default or by firmware, the core will
> set the timestamp if it detects it was left on and its supply (and their
> supply, and so on) is on as well. This is unfortunately best effort
> only. The core can only assume a dangling regulator (one without a
> supply) has power. This also applies to the dummy regulator.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v4:
> - Try to update last_on timestamp for regulators that were left on

Sashiko flaged a few issues with the changes:

- _regulator_is_enabled() called and subsequent timestamp update
  without lock
- bulk consumer wait_us incorrectly assigned
- _regulator_is_enabled() could return an error

Will fix and send a new version. I probably should get a local AI review
working first.


ChenYu

