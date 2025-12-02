Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9503CFD2F6
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Dec 2025 04:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LlnQ5BAi76HPvHhocPivvWgaZ62tTTuvYoTCH/OutaQ=; b=lJD9c2YaLc/pFTJ2SXfHE28Yyw
	Git5upDs0jx4HPM8MaTsPiTAOVlAM+I3KdL6IJNDrBC2Z//OnyPMoyFOAHHBxrTKoIvJ1BI9n2UsV
	S3X7/d0/uP2Dk7GT7cyhi6duNE6RymowJniUC23SuVGznYzP7Wqp/yD4sskpEO0n7ZmDfYkL5Zwu3
	xP62T1Hv5qsRY+OR5RsNNmzoQDhGBEcWIne+cHBvuuoNIw6+XW7dRmIp5yUX+/J63t6myeisRj95y
	Qb/Z85PaUc/1S/tFXdcF913OU7lzxUCrFF4rbZy5OnxTKj7UI9bARSgpYIR6spTT/fbo8US7KPGHE
	vjg0mVdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQICI-00000004nMs-0LHe;
	Tue, 02 Dec 2025 04:41:06 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQICF-00000004nM9-1xSL
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Dec 2025 04:41:04 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-42e2d5e119fso1231428f8f.2
        for <linux-mediatek@lists.infradead.org>; Mon, 01 Dec 2025 20:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764650461; x=1765255261; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LlnQ5BAi76HPvHhocPivvWgaZ62tTTuvYoTCH/OutaQ=;
        b=UhQycKWF+aWhk8+voe8w3lcxHo6ZzZV3FvEQSbrZUrKf5MQ1SFX36+TikwuAW676bp
         nU4meKcwSAR6P75OKc3y3ZPlUeMKZlBIHWZaGHuXTKtnoPNmMVjfXn+SjR0hun2e1dIC
         ZUt2kzkp+CZzJf+cLDIvTS5NFEUDkTqfaJtODM1EQIGHzczurrL+6AP13DfydHH8tXTg
         7B9jLAzcC0FOwc1Y85zOqkl30r5ZhbsHRerTnh/z0hLp9/opSyvaYPA8Ho6VrWm+Lt1f
         oOtvBN4j9hfo37NyWZZX3zDaICqdI33YY+9PzYqhtvcnpULexZawoM0VY9CbDUbN2wTw
         UNNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764650461; x=1765255261;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LlnQ5BAi76HPvHhocPivvWgaZ62tTTuvYoTCH/OutaQ=;
        b=nEkc5tCNmx6/Xyqg2Qn2YITtO2647tiTZPehcP/Fn0PwS4nOx5H5a4IlZlJnTR5S4j
         2hCan4VBR28BfC1cgLg5P8c/sJkyKmNu6andUaRRjba628tZn3vaT/Yk7t3c00FNPLZm
         wuzpLKifCElcBujwRGrC/g1BBoQdwdpjaYdPY4tkx6Tjr6L7zFSE5m5K0Gxmv0jVZOka
         rL18GBEeN/C+yAS+LZrUMUQBfauRvW5DaxLOUyvnlh6npWR2J0EDtz4+/C67Om44vkfY
         UPASeSOzaAl3xP71QEDygNaGglHOKekeMS7wHnLPMPM+Kryd0Ez9osdDsRebC24c1AtQ
         u2bw==
X-Forwarded-Encrypted: i=1; AJvYcCVjgGD2gJt4OM8l/EJfzR33J4NM4BBCOIa1Vj+JoV/vOxklK673D1hfEaSfG9hlD0HkH/EH2cTRjozOKP1qWg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/7GchPGyVDSmuae0dPjggz7pQD+Yz6HvnRcFJveaAvKjf2QS3
	NRX/yHVdzlRcIA0ud5pHr3nFxOf3srrUxIy6TG7l4ZB3Bswoz/TLwaRi
X-Gm-Gg: ASbGnctKkd5bDoAnsQ0WbWN30HiXGZkYVCNB9rbV4co8h7hcxX8bYl3b3FT94o1jNiM
	xCo2/28ac8xYSGjREYQejo/4xBwkPc9iCDEIoJITDZEyYgMKgmh7wdbSFnYgfWedTzxibrO6mQE
	2mjMDaEpQt6UUO4YmlzfsMB3T7+dN7sxq862WtAKYHRijwLk2WzDDJRr/OZu0L4S6pinmfFLZpa
	GSIxSuwru8uS0mLqJYni+2gdFg8jW+gnBP5qfjBaA5h9/YlTsuJwEDSdmCR1oqBE6HXpCyud7QW
	PmAJ/csBea+8ZKkpCh/u9tnKrWP7qOY7MurScZFtQ4HSxfbT+UjZOkC1+fL9hoyYrn7XpWSFppr
	s2+9nhIeD8hb6sKGzRc2tg2FyrBYouP9MH498ZAp1w5M5+TkqTzd+T56b7CSqu+szeooAPVFnUI
	uRt0+SBSFXWLUKU4CMkXfZ6/MTZ7fkVFnk32XiDpt/km5bUGKXtuEE8deHTCXObzbGnWVjSrZdJ
	NUISVTvMQ==
X-Google-Smtp-Source: AGHT+IGBVfHoicF0puR2bTLakkUtiMzuIbjHAPDFKoGgk5PNnZl7XxNKNFA7iFYAa4+wXIUlMt2vww==
X-Received: by 2002:a05:6000:26c4:b0:42b:2f79:755e with SMTP id ffacd0b85a97d-42cc1ab8874mr41867616f8f.3.1764650461201;
        Mon, 01 Dec 2025 20:41:01 -0800 (PST)
Received: from smtpclient.apple (static.253.36.98.91.clients.your-server.de. [91.98.36.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d607csm30712057f8f.15.2025.12.01.20.40.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Dec 2025 20:41:00 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.3\))
Subject: Re: [PATCH] wifi: mt7601u: check multiple firmware paths
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20251201103529.1874a869@kernel.org>
Date: Tue, 2 Dec 2025 08:40:47 +0400
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Daniel Golle <daniel@makrotopia.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <CD5CBB8A-2829-4436-9DA0-D1A88D594E92@gmail.com>
References: <20251201090336.1157193-1-christianshewitt@gmail.com>
 <20251201103529.1874a869@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_204103_523274_7C0F6FCA 
X-CRM114-Status: GOOD (  11.68  )
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

> On 1 Dec 2025, at 10:35=E2=80=AFpm, Jakub Kicinski <kuba@kernel.org> =
wrote:
>=20
> On Mon,  1 Dec 2025 09:03:36 +0000 Christian Hewitt wrote:
>> The linux-firmware repo moved mt7601u.bin from the root folder to
>> the mediatek sub-folder some time ago, but not all distros create
>> symlinks to the old location the driver checks. Update the driver
>> to check for firmware in both old and new locations.
>=20
> IDK.. 2.5 years ago.. how long is too long to wait for the distros=20
> to update their linux-firmware?


If compatibility with older firmware locations is no longer a concern =
the
previous patch submitted by Daniel is valid. If compatibility is =
desirable
this patch is valid. I=E2=80=99m not fussed which one gets merged, as =
long as
one of them is so the distro I maintain doesn=E2=80=99t need to patch =
the driver
to use the =E2=80=9Cnew=E2=80=9D location (our buildsystem doesn=E2=80=99t=
 process WHENCE
which adds a symlink back to the old location the driver still uses).

Christian=

