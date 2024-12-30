Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E21E7718F
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2024 20:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zbDtPVzPX6eiKblHAjusJQ2bBQDBb/Khlrlq648Wi1Y=; b=zgP7b7QC1nsMDRDd7bkuboOXO3
	bygXqPzYT+u58nrfdrySR7HBYKwoJm5uvNCagkKSQa3S/XDzR6YuTADB9l8sSm5L7NrpF0aLVbukT
	yKL5bzex5A+8DUgA/ja3Ip8sH7KHUdxWNIM7j6tF3q2anJgQBWx71/ktRvI/rzUqQLfNo6zube/wa
	rQSLCiR6Jpgo9bjr6FGMqJ5Q/nEVjj2efC7M4FbPG23LPaHDw60+AEO9WaZdJu+zQPOhO3I99yYGl
	AAZ9IC82VIvzKZm8KMwrBb8wJtREnFY92ZDkQm+UvOEfCwtMi3ZRSFgy8n6nq1tYtHWNYMVnydsLp
	7d8pPgEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSMUk-00000005oHn-0Maq;
	Mon, 30 Dec 2024 20:36:10 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSMUg-00000005oHQ-4A5n
	for linux-mediatek@lists.infradead.org;
	Mon, 30 Dec 2024 20:36:08 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2167141dfa1so121696055ad.1
        for <linux-mediatek@lists.infradead.org>; Mon, 30 Dec 2024 12:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1735590965; x=1736195765; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zbDtPVzPX6eiKblHAjusJQ2bBQDBb/Khlrlq648Wi1Y=;
        b=F1R6tMNGrwMGjuK42A2nt6qUeBoQKD0V0FOYBMfVPag8Ep+QX8hV7bs0XHsOA7ADsO
         pMjtKZtLkwZSSL6p+XGE+9CCMPwO6UYAZWy59QeTLfOPKBv8lj9ZJcv4VZ24VQsAEpKv
         VugeErHg01r7Rb8rYiqTf1+FoSeZZW4qNvxO/TW807ox1sF1TgTUMsALthf8vnSvdJh5
         CICISalbia2aBWTnTKkodAe9D8dzHqg6F12dCBKjc7Jaj3n6SX3fUwHv9BqP0ZNypmqy
         lCS7GMJQCALBOJRstnvy3qNTceIrsn5AQ1Uk2ly0CrR++WDZ2xbdHgXmYK4JRKSWcEe+
         hXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735590965; x=1736195765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zbDtPVzPX6eiKblHAjusJQ2bBQDBb/Khlrlq648Wi1Y=;
        b=NQbxrVUsbsOZKtUr20SD3m9/5hTG6kisHSemfDRnIDcFCvRb43cM+/Sxmu7xcU2tii
         spW0QBFTQ5nrVWfZNwLQJ7JGnM4YMvu7rFkjCtHCNPsMwpCYN2eWZ6fq1UCbX0qSLEVo
         67CAU7ZALsstyQ5h6fZDB5rSqMe4MjG6E01FL/xPMRrAzbb5lxQEf5j9j3uA6atTQ4gl
         nnPm6XugXNywAT4T4lGIUUpHjZwDijy98Kqm0wctEcpsRr0UDiCpefOp6cieu1bMhEoW
         AxeOxljreLrbndLzRa7YQhylpHFzGsDQMzAuVXx1ubxoPMvWpAhwh88HYJQfOZKUEqjr
         0Cog==
X-Forwarded-Encrypted: i=1; AJvYcCWOzNm1lGiUmKi4SwbKFHImUOtu3pgQlMSY72Nj8fiR7ld0DTAu1hUR8NdScww6T63ZoGW4+L/L8yYfNvu+2g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxrvW7tZiSmn9G7SPCiWB/tTg0V4b9qMzlAqZbQwFOFex9W6wMn
	kLqwWgvRc6juFvU12Z+Da1mwudNiblXQv6xJxFABnAkkPrCYUkhmL4jQhcvPmY22hVYXYVIxJC0
	//8+XiTjposED0CGHQt7hTmJOxw8=
X-Gm-Gg: ASbGncsm/RE4TEuVs2pGhZeB7zw1uXAz0tWa2ASv1GqeYeDXqYtx17jSt9eO/4GMM/k
	GBHVy9j8NYyhACKM9YRV8jF3e+H6L2yccBouCXzTXaamfXa4kbP9hrpr5vfPS4xvjFFUZ0eg=
X-Google-Smtp-Source: AGHT+IHdzTHppoiX/E0G0stg064WvodVEKEVfkFdQifJmYk87zDsR5nGzmBTi5aLnOfnP8Og00X4YesmXuJRbPLi4Rw=
X-Received: by 2002:a17:902:f54e:b0:215:a808:61cf with SMTP id
 d9443c01a7336-219e6d6ac7fmr469366685ad.25.1735590965055; Mon, 30 Dec 2024
 12:36:05 -0800 (PST)
MIME-Version: 1.0
References: <20241013111920.679188-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20241013111920.679188-1-martin.blumenstingl@googlemail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 30 Dec 2024 21:35:54 +0100
Message-ID: <CAFBinCCgiJAimacWtTS-5JRMKbpKg8XN0Si3tvBjT+tJmCg0xA@mail.gmail.com>
Subject: Re: wifi: mt76: mt7921 Survey is missing noise floor
To: linux-wireless@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_123607_038254_CF0C3E09 
X-CRM114-Status: GOOD (  18.54  )
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

Hello,

On Sun, Oct 13, 2024 at 1:19=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hello,
>
> I'm using an MT7921 PCIe card in AP mode on the 5GHz band.
> It works well when I manually set a channel in hostapd.conf.
>
> Setting channel=3D0 or channel=3Dacs_survey (both have the same meaning)
> should make hostapd check for a suitable channel and pick that
> automatically.
> Unfortunately this does not work as hostapd reports the following (for
> all frequencies/channels):
>     ACS: Survey for freq 5180 is missing noise floor
>     ACS: Survey for freq 5180 is missing noise floor
>     ACS: Survey for freq 5180 is missing noise floor
>     ACS: Survey for freq 5180 is missing noise floor
>     ACS: Survey for freq 5180 is missing noise floor
>     ACS: Channel 36 has insufficient survey data
>
> I suspect that this is due to mt792x_phy_update_channel() (from
> drivers/net/wireless/mediatek/mt76/mt792x_mac.c) which calls
> mt792x_phy_get_nf(). The latter just returns zero - so it seems
> reading the noise floor from the hardware/firmware is not
> supported yet.
>
> What is needed to implement this? I can test patches or - if
> someone describes which registers to program - I can also write
> a patch and submit it upstream.
It's been a while so I'd like to ping the mt76 maintainers.

Also I want to point out again that I can submit a patch if someone
can provide me with the info on how to get the noise floor from the
hardware/firmware.


Best regards,
Martin

