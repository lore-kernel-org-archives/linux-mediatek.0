Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01961C531C7
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2026 09:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QV/e0D4Cq+kXxk7foQFF5xP6EyKiu45j2ziUGVbkQko=; b=nQW53WNHhOBxjzg4NG+Ek4ON7+
	jfwuCKdCDaVAXUuUR24B68kiboDpBwZ5uS7+EYFeR8ci7yYuPNfgW3uZgXrgQmCtxocEOAhF5gcqK
	v3ThDYxit3d0OBmn2/ujP6Y5neXd2IZyczcR7fIBGP5qZJn1sc3CxF4kDQMMtqNzapztXqml41V6E
	4RFtTBKbL040vO7EyO833vVRzGhPuT09Uxe81IRqYWdK8cR/84rwi8Wz+qEHKiaUZtjlDgIh21vzF
	zRJ4evsZS0SRpKGjP3s8fqD8QzMfgTV4/er2BxLS84rK59gUkO3s7T+qjeL50PvWL5GbztQ4PGjF4
	J7RMaK3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmppm-0000000DrUR-09tb;
	Thu, 23 Jul 2026 09:35:18 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmppj-0000000DrTX-3dQF
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Jul 2026 09:35:17 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-930f618435cso42999585a.3
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Jul 2026 02:35:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784799314; cv=none;
        d=google.com; s=arc-20260327;
        b=SlPrQP/J/Mva3QMXzkcYjqWudxWPoy0dPp/TFl1+WWymtozBs6g39jJOdvq1tFV/Ag
         v2w9ki/POpTLIokYRf0kma5OKVpN7dFLxkFR3ER8zMmIq0jfdb41VwfCj6dcUHZMZrGv
         81R+Fmic7CuUEv7Dhk/zhdGcORO2f8LYAAOxay17H8NvIZbUOzY8ik6i5lByZvkf6lZc
         rtRlOkAzNUdh4p6zTu9PknTal8g0ngS3AeJFnXi9dltM4ei6S6OEkbnuz2nrHOdos5C4
         XsGPAa1bjU4LFWUKLxEwL8iM/oZIzngFVfDkA/2+i6Fh6wDLLu9LBaL9u5OgnLE9RsS8
         W48g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QV/e0D4Cq+kXxk7foQFF5xP6EyKiu45j2ziUGVbkQko=;
        fh=LxMU/n10uHM7jMaC3om6lCr7phO5IALuBI+qHinrVgU=;
        b=BPkbMo0tv2HhxYw3GYEnHDO8+b8ObWNEUcjflmfjejL2/hXolPef9l//cwStykTp36
         z1KaKAfORCq495xVrtZGkR6Ju9dgui2mnenVDF7R/GoBMggAZYa8S5k/hr7Bofn79z1d
         MmkEoRXcNmQWlB72zwuZxSm0hAANo5S7dTCcGGlVm45oQz8nMOnq+hzJfNN0vkQ3Zqdg
         dJAUAm+aLlWZNYi+l9FjNCLgMXOg1cQFtoEG8M/8szRHes5HBfqTf004hVqU3xJLcAN7
         rRkCRkc+bIA0NLPkC5nO0ZdVJ1wgLnBBH3h8vKIqo8TsicahQira9b+bub0usa1As5Vr
         tSfA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784799314; x=1785404114; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QV/e0D4Cq+kXxk7foQFF5xP6EyKiu45j2ziUGVbkQko=;
        b=aFQVe/nuRs2awH9f4SJGYOQGEP4o6H63ZpzuzJ74OFrkcOrOgtIjOoPpuxDZESxKSW
         dB0DZGlD2xLRAPsVcI+QhFiwY8s/3iYkgmAAiOycm6EKxikfuiDQnRWhto4149MOLROa
         zVbWs48/FB2h608/BP9tcsnD/aWWyv9fdhCS9D7q576cOs2yxirzRjbhVbt9XDvVA8r3
         46zJonrrRdVwwlRO1lVC7CyuJorG/VY80verAY5GhAi4VtOE5HkbMKUoa9CMtsMahvGe
         VfY02VBCJ6XGU8WynohcF5c3fr41bN/wS2jyN2LcexY8KE/1IyDrbSuZjd44aJOOu3Sl
         mbVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784799314; x=1785404114;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QV/e0D4Cq+kXxk7foQFF5xP6EyKiu45j2ziUGVbkQko=;
        b=KR4DUQAzZ3jXX6PMT19OOw0V5bk0fdGnWk5Ngmgi18qfL95lGL7mfk1OSnU00A5F9E
         JfiZRDhqwt+Gzw7HYcqh+LKUfX2GJnF5ppM1cFZvTNp6nhFTqpLbvlKt1vFmTP2FM31t
         hyDGQTkpmaXVM7ObwTckblGWVcdyznScsOARWPxlWVdTNciAed+p1e9n3rGQjvaZhB6/
         BSLxgP68cT1MngA8Q5VIQwVfjDFZhQXR+dLdauORuzgeobbPYrLrMjnGuBKvpntpNes0
         RZZyU7Mp3EV+jw32izmf5XZ3eJC4mQNZhOXnYkby4nUwRzGGQX9enGbNrZM1f400GNZM
         GD6g==
X-Forwarded-Encrypted: i=1; AHgh+Ro2Flr47tzIZfNNHFpFvYXoLGOGD3Fp0uBV15XFCzk0l4zDeQm4iVd3jNSXXwpW+1zLZ8DKjfwjpQIXr915Mg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTtVSgw9UVPluBGZ7Vyo8b8qS+jgp1CIr8M0cMrggYeMcIdfIx
	Nu38uu9v8+uHXspoMotf1Ai4VfN7wVsUs2mSuq2rD8PVpVL4KbQZ7OsmsT6xq4DkiaqN3gLuFSr
	u5OJ5T6RGbkJc+5BnBBaAbXNtmJOw63w=
X-Gm-Gg: AR+sD11u/Kieym18V6ScM37M/F3pxzadarp09DZtERgr8bI0LgTqs++2qwFUJk6+RZJ
	4NBTsL79HjBFQWhN598/DfmMlDDTgqj4Ujg3cZe6Q8F3bApz5FlAlmAoBgcTQlB/uBEmKk8l5IW
	kz7QNj8TYeV9tnO5RgoKXyR4gt6nmr1qQm6AVi3K1u1m+jHjPq3KamQMHyH5NcmDdSil54if62j
	NUVWmWONO9+6itXe5sNadF1k2B88pyHdipyBsiluhnKmmfQNPKs58njgaFq7tdPU0leoo/Zrnwm
	j2o=
X-Received: by 2002:a05:620a:7002:b0:92b:c6cd:7f6c with SMTP id
 af79cd13be357-931038a842cmr237751885a.34.1784799314332; Thu, 23 Jul 2026
 02:35:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260629122246.148696-1-akkun11.open@gmail.com>
In-Reply-To: <20260629122246.148696-1-akkun11.open@gmail.com>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Thu, 23 Jul 2026 18:35:01 +0900
X-Gm-Features: AUfX_myChBNOL8FDaggU_KSOgeBeezCWC3VAKALkyLtMuEBpjgaCigCdcfIYHDY
Message-ID: <CAKr_iV4nwatQ-8NTEkJOaP6fzrmg_-_AZ+1eWBKpRcJq=1SMXA@mail.gmail.com>
Subject: Re: [PATCH] arm: dts: mediatek: mt6589: Fix timer interrupt trigger type
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_023515_911097_58B7E9BB 
X-CRM114-Status: GOOD (  11.87  )
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

Dear maintainers,

On Mon, Jun 29, 2026 at 9:23=E2=80=AFPM Akari Tsuyukusa <akkun11.open@gmail=
.com> wrote:
>
> MT6589 uses IRQ_TYPE_LEVEL_LOW for arch timer, but I sent a patch using
> IRQ_TYPE_LEVEL_HIGH.
> The timer worked correctly regardless of whether IRQ_TYPE_LEVEL_LOW or
> IRQ_TYPE_LEVEL_HIGH was used in the Device Tree, therefore, there is no
> actual impact. However, this is not a correct description of the hardware
> so correct it.
>
> Fixes: 2a5d54507c68 ("arm: dts: mediatek: mt6589: Add Arm Generic Timer n=
ode")
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>

Could you please apply this patch?

Best Regards,
Akari

