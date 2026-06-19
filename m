Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A77CD4F26
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2026 08:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QiRZKCM1EqNiRsnzfvDpC39UOIdXQjIxqxCEPl5e4OU=; b=zO1VNA+AAXS47lYYF/2x64+kxb
	sNVfFjW2VlAszrjniO+57Tb369HMizCEf8yAl3R+jjXjxe1+19+YsH504C0kwbHKba22TdL6QTsle
	yWcmDUprjHHZJvCBvSsw6EbCngnXCPPZsWLXL66n+on75JKvE7Ak7JI3wUDO9FyVS5he0zIxSXgMc
	68xzFpghcfaqZgu5Rym2jbFivsVL+lPLySv1Lj/WUh0jjR27TA8LbqhJmAkw0L3gfCPKHUlz+4ESD
	QvXQ6l+zn1fG7cj0UaIFoI7oNEFMyJBSbUN5ccqbcqI6VdDpLbxFIDUiTUsc1vvyuemonpmqOG1jP
	SETCXFHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waUT5-000000029nN-463D;
	Fri, 19 Jun 2026 08:20:51 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waUT3-000000029mA-3LmZ
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Jun 2026 08:20:50 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-84231305a80so1071646b3a.0
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Jun 2026 01:20:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781857249; cv=none;
        d=google.com; s=arc-20240605;
        b=S3G29CclnF89akz5hxE2MfiQU6cdQ0+Z7YzzOQBaKn+G6b4MexwuG4jzHcuk6ssiWe
         h0CmT1Ld/j5DXjOD7xeoobf5ZsRI8kNm+zaS3h1YgiF2nqh65ieqHg2FvTy9LqD0kaxJ
         N6TN5adQ+TyccE1ZMYKsCUqNrwilqSgMYqdfiLvqpYLujgk3jyu663mWv8vCSiti7spm
         tsshWEwfWO5XR870EteANOsPSSJ8xSO50On5iUfZjvafV9arVy7ZuC0AnX902rHTZt3p
         RXezxEledx6F2XB49raA8+yISLOsfpeOBApzxdQX2GnQVF2E+uO7Typmf/dQrTRoIt9Y
         PAdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QiRZKCM1EqNiRsnzfvDpC39UOIdXQjIxqxCEPl5e4OU=;
        fh=Wo+aRC/VbB6dlbXyOtSU4ucv6ASaoghvI3A9RXdAiBk=;
        b=DQq14ReAASzIct9ryXSOq+ia5fucEi2VN0HYh3KQrTr+eSR9CpT/n4f015uWFsbdWi
         dfoJ/ydTff33herbb2eyFamyTbHfJz9ZcfXZFXC3ZGqf6YVPCFgrd7p92PetJfQIhceS
         7tHbGNTBgjbaxC87dL3TNp1wY23pflq9hmIl2Ql+Jx9PxAHI7X8e4jO9xS3aCS6GtmGO
         DNGpIh8uk+Y3iufie8idnvI7okMCtkQ1RKcmSYRjTZzWdVsYfk94Tl21Ceze5NaVaxkP
         X2l6wWEUhXN973xO/hfAOyuErHJ8RnNk+dQZQ1pQy4zVRPg3IXcGk8QcH19KvxSoNxjz
         ZbXg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781857249; x=1782462049; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QiRZKCM1EqNiRsnzfvDpC39UOIdXQjIxqxCEPl5e4OU=;
        b=bgmsX+6L6BaN3tbpdj6QFj/RONp5URMdTG9qMLYm8ayFT+3/xcjDQVJAtEnuCmKIQV
         7sginPFn70T4WYORw+VcdPBDw7oT4XpYFJxbWU7Sz3I+cneub99naNd/hBLjKjWRJpnm
         7r3katNMCDwBytLI3UGSr061rNqbftVIN3LkHqJ7wMgEPviEcFBcyG9rRY0eHJOqfILz
         i9DYubwALuiSrrrnKNPtiAp0qs6uTKI3olsWUMO6KCrPC0thPHcxhJ4zM95E0+x3j7qn
         MdOzXWERmizH+xN/eG0vpdMI8RRGWfYC1T1SPpx4kmfKb37dtKMD0QFU4rpUCAAgwKBz
         Dmlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781857249; x=1782462049;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiRZKCM1EqNiRsnzfvDpC39UOIdXQjIxqxCEPl5e4OU=;
        b=Z5oFjeL48rhdjb0k+ExCumXHlogy2U1csGtwZL8wg/njQJjA9MeYvGbmSvIaY7MDcv
         7gx79S2UvKxaYY4ryhC8Jo+3NrXKIyw7Bx8xi8rp2CYeipf8Guzta7FmU+jMVLQH+/dP
         96EyJR6lwtAZOCu2//KYA6n5jjvBAKphTHvFpgeRSvVtC+b9+BzIjzUFNfuFXfAfL8gn
         1LVkqxrB2j0DKXf+F/gFFVKrSfOAslmxlQJL800nHI1uNEZqniI8KyEe41pKwu3UYOSm
         WDgSzJshKajychSjMkfdsCTAS7d9VpNgkzYaSA2Gk1AUrdjbAJgPDVw8YhgzJn3qZk3O
         RIIg==
X-Forwarded-Encrypted: i=1; AFNElJ+ljrBXODk2o3WcwzCnAc9UFN0a1JvjX2lqdmUx/o9xGMVuOL4YnksDIP/jS+4CSUCr/0jg8JBxKDmXtzn+MQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxpBMoYCMgYPali1Wl2jw9NrbGQopotVrZ7rVSs6BGtFWuM9VrB
	3cncqPorgTro84tXfcfaoB16ipqwhN9MZ0yUKdZUzN2AZ6H6NuwvnDblE9F+hR3yerwXO0QIRgG
	MWpYpQZWiFxBJtjkw8g0in9CWvIXpBbc=
X-Gm-Gg: AfdE7cmlqYpo56Z+Cfj37lSkf89FbJ/yLNc6dCkJpzeDss6Ny1M+6aXfpFXskzWgTM1
	NysJu4WdP4+qy5xhZovSjWuZr+QjYVUPIXikoFvff88yAD3SHYqdjiyjY/1HkqoziNZ1C+duStV
	Kqvo2pP9W41FG+2KDsEG7qj7PNZllfJDnThBxokBnv68mTXP+iR76eSi7UnyxFHPwiF4bXftekp
	qdVW1Oi2IATDj32F0UK7eE2uszgpBivav2Ii6Auf1bkPC3gsdIAnxTu4qn47F3z6Jp7CxuyMJse
	dE7RPiQQhndJVofLwlYJZQUZEviUTAraYaHujg==
X-Received: by 2002:a05:6a00:3cc7:b0:842:6a97:52fb with SMTP id
 d2e1a72fcca58-845507cb50emr2639722b3a.18.1781857248942; Fri, 19 Jun 2026
 01:20:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260617103235.449609-16-phucduc.bui@gmail.com> <ajJ9rbHTspXHo6Ou@opensource.cirrus.com>
 <20260617140209.3f89706c@pumpkin>
In-Reply-To: <20260617140209.3f89706c@pumpkin>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 19 Jun 2026 15:20:37 +0700
X-Gm-Features: AVVi8Ce6D0PT5nT0JZlv3l3sVJ8JLAPJbKAWX5-seLq2FMr-NiEk00n-taoSGeE
Message-ID: <CAABR9nG+6gOj4KnWmTyykgGN93xy6jKQh+-_f8Xxn=Jkv28vBA@mail.gmail.com>
Subject: Re: [PATCH 15/78] ASoC: codecs: cs42l43: Use guard() for mutex locks
To: David Laight <david.laight.linux@gmail.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cheng-Yi Chiang <cychiang@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	povik+lin@cutebit.org, Support Opensource <support.opensource@diasemi.com>, 
	Nick Li <nick.li@foursemi.com>, Herve Codina <herve.codina@bootlin.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, nuno.sa@analog.com, 
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>, patches@opensource.cirrus.com, 
	chrome-platform@lists.linux.dev, asahi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_012049_838341_1A081803 
X-CRM114-Status: GOOD (  16.23  )
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

Hi Charles, David,

Thanks for the review.

> >
> > I believe you have to use scoped_guard here, as there is a return
> > from the function above, if memory serves it attempts to release
> > the mutex on that path despite it being above the guard.
>
> Indeed.
> I believe clang will complain.
> That makes these mechanical conversions of existing code dangerous churn.
>
> While using guard() (etc) can make it easier to ensure the lock is released
> when functions have multiple error exits, I'm not convinced it makes the
> code any easier to read (other people may disagree).
>

I built the code with both GCC and Clang and didn't see any warnings.

My understanding was that the early return exits the function before
the guard is instantiated, so it should not affect the guard's cleanup
handling.

Could you explain what issue you are referring to? I may be missing
something.

Best regards,
Phuc

