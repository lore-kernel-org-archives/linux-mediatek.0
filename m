Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740F9C61D85
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 04:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T7qPw5ycerKBMB3jFyF+3AvRZw5Lq7E7FvIBMNy6g4I=; b=GHJsxO2iGgD813XNa66/WWXR+R
	AcjDL47CXNP3ysauQjRT763no6J20kE+q9aNKSa7cilwrNk3lFOWrbdNvVP9GqbPNXdjp+4SRJpwH
	DIywwSx7AjWq7n5LO8vjgq30atKADRq6aYDYhETGWoPddMrrr+bJPyB0TH9mQoxRU67mtD+npEjfs
	HH5dlKer1qnqNZn/jwIyRY2TB5ms6r/6NNwTgrxHNspj9NHdKa5I9shHpFh1D/SAYCUk9Bx7ZorKe
	SQOylsZiVKRgp7QlNOWxg/7m0VcOQ2ol1Z3iYZaURnrFDO1cQ9rhQjBroba1CKxYjiY67fJqVClM+
	eQu5i+Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r612d-003hiz-1N;
	Thu, 23 Nov 2023 04:10:15 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r612b-003hiR-0D
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Nov 2023 04:10:14 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-77bcbc14899so26309385a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Nov 2023 20:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700712610; x=1701317410; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7qPw5ycerKBMB3jFyF+3AvRZw5Lq7E7FvIBMNy6g4I=;
        b=Zz5Tu3mUrTzRCzLmdm1vjV8aPWg/USu45b+w/4CKpnWpFfvSbkarFkYrSVZf27cgJ5
         iSICqlw80/n6lxAlVhwvn1xJcCK3hx0KtCiRGVqfhhg3uf43Qah/uTTyM6wS5zMpoPSK
         BpCtur34/ULGExqmEyc43zcuomvdif0ntaDwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700712610; x=1701317410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T7qPw5ycerKBMB3jFyF+3AvRZw5Lq7E7FvIBMNy6g4I=;
        b=KkR29/vD51C6XGXkmiDjTI22I8HoLDd+69p72KXLwLGSfy/6GRDBGcaUAULgqshSUk
         vkVy6UOFDzbMFmaB+DYxijiNM0vyzgn4gmaFW4sQYg63CLcmJ3Ri5nQexW/eBX9B7HI3
         pzX6kLpLdW7fV26DlYtmi3AzIl+ngAIcRKczkzeA0hqdD48D5YY3H7SRf3rc9IOIQgKM
         +wjxo6M3QNZTeiEObqGhLbrRGl+xSk5JVM4NgpTOseW2Uc6sebraV5AkuuACqDnv3UfT
         whQfKguHW5AaA+SSmtTRZ+JoNfOpoqddwwcoyWFMVkUN8bgv67jIgbXomXgWDIKLhTyM
         3f2w==
X-Gm-Message-State: AOJu0YyIxbD0NtQxD9qlcalzVIPztl/xAUq2zQdPrSyx/78+g3OmFl8Y
	jp+xZBCC1a5vt99Zi1JOwKTcevZOr0E+bFlahAKo8Q==
X-Google-Smtp-Source: AGHT+IFQVs0wtdMQgrkydMf6CokBEnu6gp1cNk1RPjIHnQJgViKswpdCDnwTYfXriGmuxnDrb7tfOg==
X-Received: by 2002:a05:6214:250c:b0:671:3f49:c8b4 with SMTP id gf12-20020a056214250c00b006713f49c8b4mr5678922qvb.3.1700712610549;
        Wed, 22 Nov 2023 20:10:10 -0800 (PST)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com. [209.85.222.181])
        by smtp.gmail.com with ESMTPSA id q9-20020a0ce209000000b0064f43efc844sm171064qvl.32.2023.11.22.20.10.10
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 20:10:10 -0800 (PST)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-777745f1541so26937885a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Nov 2023 20:10:10 -0800 (PST)
X-Received: by 2002:a67:c088:0:b0:45f:8b65:28f0 with SMTP id
 x8-20020a67c088000000b0045f8b6528f0mr4023922vsi.12.1700712233600; Wed, 22 Nov
 2023 20:03:53 -0800 (PST)
MIME-Version: 1.0
References: <20231103102533.69280-1-angelogioacchino.delregno@collabora.com> <20231103102533.69280-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231103102533.69280-2-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 23 Nov 2023 12:03:16 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhS_OckB3ap9Sq1U9D5b7605N=w4WyPjJoRJCSRxW5_5g@mail.gmail.com>
Message-ID: <CAC=S1nhS_OckB3ap9Sq1U9D5b7605N=w4WyPjJoRJCSRxW5_5g@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] clk: mediatek: clk-mux: Support custom parent
 indices for muxes
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sboyd@kernel.org, mturquette@baylibre.com, matthias.bgg@gmail.com, 
	wenst@chromium.org, msp@baylibre.com, amergnat@baylibre.com, 
	yangyingliang@huawei.com, u.kleine-koenig@pengutronix.de, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_201013_129573_5B6F72FC 
X-CRM114-Status: GOOD (  14.18  )
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

On Fri, Nov 3, 2023 at 6:25=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add support for customized parent indices for MediaTek muxes: this is
> necessary for the case in which we want to exclude some clocks from
> a mux's parent clocks list, where the exclusions are not from the
> very bottom of the list but either in the middle or the beginning.
>
> Example:
> - MUX1 (all parents)
>   - parent1; idx=3D0
>   - parent2; idx=3D1
>   - parent3; idx=3D2
>
> - MUX1 (wanted parents)
>   - parent1; idx=3D0
>   - parent3; idx=3D2
>
> To achieve that add a `parent_index` array pointer to struct mtk_mux,
> then in .set_parent(), .get_parent() callbacks check if this array
> was populated and eventually get the index from that.
>
> Also, to avoid updating all clock drivers for all SoCs, rename the
> "main" macro to __GATE_CLR_SET_UPD_FLAGS (so, `__` was added) and
> add the new member to it; furthermore, GATE_CLK_SET_UPD_FLAGS has
> been reintroduced as being fully compatible with the older version.
>
> The new parent_index can be specified with the new `_INDEXED`
> variants of the MUX_GATE_CLR_SET_UPD_xxxx macros.
>
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Tested on MT8188 with a Type-C -> DP adapter to an extended display
Gigabyte M32U.
The DP output reacts smoothly to resolution switch and refresh rate
change, and the internal eDP output also never freezes.

Reviewed-by: Fei Shao <fshao@chromium.org>
Tested-by: Fei Shao <fshao@chromium.org>

