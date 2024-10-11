Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABC1D0EE31
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Oct 2024 20:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b3t/6WlSF/m01dr3JqwvO6A1PNlbPysSRIdrRHqnmAY=; b=cz66zECF8PaZV+XE3OM2tkv5ov
	EZYXNEO28BpYMu7gdHIcNA1AKWfeiwcMuz9YRaUjzf4HgHpqK5GbxPAhZs2YhspqzOsW982/LY44k
	ENzcxrfWAmSJ6lKiFPRhVRgLFCLkR0fW0ADwlkJgNN6kJnLcSe6b1qrN7CGd+lRf6VkqyWBeCHgwz
	dfma6Lbc1dbKAqdNc0xHBQLsSOuYTyfRa848Ub2TueIYqEDk8Em8GP1g3XQLcjFNj9dtaynUD5fY9
	r1MQsbnj4Ux7BMzRI390lBFH28HhGyZPpD0QGD1fGz57AbO6K+TSypGEYddh7ZyZMZKGtukLWfVcb
	wJ6VNVYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szLoy-0000000HUj0-1fMT;
	Fri, 11 Oct 2024 20:01:08 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szLnZ-0000000HURE-2ZFb
	for linux-mediatek@lists.infradead.org;
	Fri, 11 Oct 2024 19:59:43 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-6e2e4237da4so22519407b3.1
        for <linux-mediatek@lists.infradead.org>; Fri, 11 Oct 2024 12:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728676780; x=1729281580; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b3t/6WlSF/m01dr3JqwvO6A1PNlbPysSRIdrRHqnmAY=;
        b=L1fyctANTfBPVHP/HSOhHBsfsA5CuTa/TBBPm3okYOAonwq0t3yOCyZSKsvSITY75X
         7xb5j0fHJul84zNYF6W+OhQYdnZQbrRDJSb8IbRuusUD3uaIYKOnyVJigZv/U3G91jet
         EI5FMEMlzsi5dOJ0tykIi+V9gMOGFUmr49BGcPlFKodVFNedLdFZx5K9Irx24PLG8TM8
         I10LvP6RWjfzivgWj7m2JEUpPJ7lfn9mF8+hYdtXAxzuwEXIA2NDgW+sSxamXmAV76B3
         EGh8NZQ06BKcevr/ch7vSeqwNSBcwXg2z72sX8Us5kofWVtY72AUdIgdloV2S4cSaoIs
         acRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728676780; x=1729281580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b3t/6WlSF/m01dr3JqwvO6A1PNlbPysSRIdrRHqnmAY=;
        b=CJTAVKpr3cFAnGuLkVmy/rNvrJXYrLFOxu0mgqYevbf+Jqod6JKDBYGnxUP2n96B4j
         VjnEVR3/zD5WWWEBtHQpX6Pzch8qXpFxc2Y70L/xlLUxmh/m+hl7zNVjZMeMyM11J5K5
         BfcNrPIglMZ8s8xm1kTl3DUViKmaihyCXp4MYSO6GRW7HfRcujFDvIoZZ7pPLZSf00eX
         6PSu3kYFShXIdZDfcbmC/2cuDVmOLV5PvtcsZ7FioKieoXhDrTX2yHj+WoQko3mLPt8W
         l1IyEaqmeScdZD2JFH8/TmvjeHBoSlhheSTZASqbp9VJDX6sB956y2pBVUXWmEHYxkYY
         9okg==
X-Forwarded-Encrypted: i=1; AJvYcCXe9JfZwOHIcuqKccLJjGRAxnUeG8OD+l8fcB+rsMwdkz07vhCOQtqnsc8OJKIpQ3ImNrBwCCTUkMIfojBR+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf7Jg0xQzk5uU0k2ZCoLAd+csjkFy+5AMwI66BB+hBWTdVNjCz
	wRUv5X66EXNII7AEB+2Uflxj9VNj4C6IKe5Otm93Fxvf/aGZbSUv/pjvuMl/iqAZ5coyXDf/Mee
	KGktxbHyIkxNmavku0GlU8daUwo2i92Oc+aH0hA==
X-Google-Smtp-Source: AGHT+IHjM2GvHz3Aq3fHGIQKpV063T+kfFhYOorOlX0bt74yIAWxcubkag8mG5yY3qwwQRASFB0kIRqgK4TTo+XYaUs=
X-Received: by 2002:a05:690c:5608:b0:6e2:ada7:ab89 with SMTP id
 00721157ae682-6e3479e1d7cmr37079067b3.26.1728676779984; Fri, 11 Oct 2024
 12:59:39 -0700 (PDT)
MIME-Version: 1.0
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
In-Reply-To: <20241011120520.140318-1-y.oudjana@protonmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Oct 2024 21:59:27 +0200
Message-ID: <CACRpkdaWZ6R4wtTs_YqzbhSrUyfOCqd9tGWFP7dZTqp6v7ijzA@mail.gmail.com>
Subject: Re: [PATCH v6 0/8] MediaTek pinctrl DT binding cleanup and MT6735
 pinctrl support
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, Andy Teng <andy.teng@mediatek.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_125941_705965_40FC6CC1 
X-CRM114-Status: GOOD (  15.29  )
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

On Fri, Oct 11, 2024 at 2:05=E2=80=AFPM Yassine Oudjana
<yassine.oudjana@gmail.com> wrote:

> From: Yassine Oudjana <y.oudjana@protonmail.com>
>
> These patches are part of a larger effort to support the MT6735 SoC famil=
y in
> mainline Linux. More patches (unsent or sent and pending review or revisi=
on) can
> be found here[1].
>
> This series adds a driver for the pin controller found on the MediaTek MT=
6735
> and MT6735M SoCs. The two differ in the last 6 physical pins, which are u=
sed
> for MSDC2 on MT6735 but don't exist on MT6735M (since MSDC2 doesn't exist=
 on it
> to begin with). In preparation to document DT bindings for this pin contr=
oller,
> the existing documents for MT67xx SoCs are combined into one in order to
> eliminate duplicate property definitions and standardize pin configuratio=
n node
> names. Necessary cleanup is done along the way.

Once Rob is happy with all binding patches, my plan is to merge all
except the DTS[I] changes to an immutable branch in the pin control
tree and then you can offer that as a base for the SoC tree if it's
needed for the DTS[I] files.

Yours,
Linus Walleij

