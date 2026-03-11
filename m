Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3361FD88D6
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2026 02:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ZAqF770CjctREhKahUCDqzMAEkw+GXfuiDNjYlwSLk=; b=JPTug052q+rCCGcMHFpPqxy17/
	RC4oO666DawfCYIppsLnEy0/uoVvtJpNhbp4xXUhnUVnxTPn/CzA/e8xEC4E23swlYJf6YoLVi+u4
	r+kVtwro5Zm5ABEPVl2OC7p+D05zrSO8coIZlsxgwJETLB3PdD+qxnQT6QukH+LfvE8GDM63ymLBZ
	NthUZmocdgENtfMawtKhQvl5cRkODKK+xwWaAjY1fd9tHpSiCFL1XU+Fk8Dv9WocN9XeJEAoneCGv
	inxuyuVtBImWdd0N99yidGlu3B7RqAjRME7wyrmyGJeBrQJiwIiUFwhKaDWRfuCiNyKscaeMgK8tW
	QE9A0Ytw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w099Q-0000000AXrM-1Zrj;
	Wed, 11 Mar 2026 02:18:20 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w099N-0000000AXqd-3SqE
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Mar 2026 02:18:19 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2ad9f316d68so60777635ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2026 19:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773195497; x=1773800297; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1ZAqF770CjctREhKahUCDqzMAEkw+GXfuiDNjYlwSLk=;
        b=CpCNtKYBIHFzcFD8Y5h6c8fwQNKe09bIhk56EXR7hKxd7Qvlbaw1ysr9KvnscucpbI
         HRmWgl0nZWKAZvDWTf5StzMDaeDGiFA0NMkK49j0paSCqaNoYbn7DZPKPrUBV7peTRWi
         mIF1+igk1+VbxHBQxigX1PU/JwoV4jTCMl8lBp/ZdOWKFVBloljHxhIMETC0NxD5II8D
         qUFvVbNSadYhm2y1axW3n6U6GuH9DQA3aU2zyn6Zd/33rW42btRfwGnAQvp7T+aDfJPI
         x8bAJrweFa6g/r8GscCpMcbOd9zUN66QmNvhambuyulFvXUvqwm6wCXHr7KlhyY+ZZw9
         7lhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773195497; x=1773800297;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ZAqF770CjctREhKahUCDqzMAEkw+GXfuiDNjYlwSLk=;
        b=eu64o+f0CKU1C9nnhiD3amVHQv5wOATIl+k3dWNViClv+6OaWacbSq6hRPAFJ74AKj
         eiiBpiDuuqNg0TFt5kHwGduV/aA6xievtzm1+B4Sh/lbsSUKo3h419iecHwON/Lb+TNz
         J2+luy5aVYpCPP+bKd+kZPFsy252z06KzHqpx16gfLNYp1JGklfknmN/AaCZbCQ39WeN
         yB/xepCG2uDDGYrMboIBEr5A4+0/X6HXlxhUyE/+4+04fK4pKVEEvF8ZacDcHKrlt5CO
         EVENmHaNkVDD7kn20TzC49EivywuIQqynso41afEieqXdFhPA9HPYjoPzW2+LMAs2oG5
         Fc2g==
X-Forwarded-Encrypted: i=1; AJvYcCVUfHs2C4c/hQDgjTaIJ1/U2tVSB5b/sTWA1dLXlA1rRTgpxwmzeYzdV3r2RtLn9mQGApK/1Rl0bcDQ1FeCUw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7jn+lxaDVNIyaeAHTVOtIUm46jPF7XtdQyiVB/COXVIP5RQkD
	7YggdPerwbB6GGhMJDIvimNHWcH/u5lFpWp5lJnNaDni8fTtWFELdEdW
X-Gm-Gg: ATEYQzwuOFIKYqHCzjTQnOiW6ZaCYGDKXupX89Vumpfm3u5DTf7VCXaVXUtgZkZnlKi
	jVhccJZihlLbcU5oQOHudfVC5yYBg0B9NBcd6kp87uxFBhBOTw0FHuAwznxs1YGoI86dgpkccqp
	oQZlCcqeslc0Sd3HbnFjiVNK7PZ7xREIi3GJpKB9wpgEF+GD7wNk8Zo3Uz0f/hpJzhSos8Mr8Ud
	J7dbm/mG9LBrscSGeEyd99XYa5Nt8bj49kvKU2WnimpYdeJVUky5MlR3VcoFy4lEWOzVB/ipx4E
	XNylNy1iVmmMn/enKhtqjAkZzW19SVIP//ZmlxQ1HJz+1AHFezX2PUd1kyfXaJo43dVD1uCpdvr
	5yqodSJ2qzAX1oj1Ig+l0+OI448gMtSU6p2xTkgZfL3/NHOhEEztpAKP817AC8/luJoWsN0tCYC
	ltq9fevb+Gu+3keiyJ62nKh+adhHo515XD6Eo=
X-Received: by 2002:a17:903:1666:b0:2a9:47ff:101c with SMTP id d9443c01a7336-2aeae8eb7dcmr9366255ad.46.1773195496591;
        Tue, 10 Mar 2026 19:18:16 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2401:4900:aab1:729a::4bc6:faff])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae34e009sm5679355ad.46.2026.03.10.19.18.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 19:18:16 -0700 (PDT)
Date: Wed, 11 Mar 2026 07:27:18 +0530
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
To: David Lechner <dlechner@baylibre.com>, jic23@kernel.org,
 m.tretter@pengutronix.de, mchehab@kernel.org, p.zabel@pengutronix.de,
 tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
 yunfei.dong@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org, pure.logic@nexus-software.ie
CC: nuno.sa@analog.com, andy@kernel.org, kernel@pengutronix.de, kees@kernel.org,
 nabijaczleweli@nabijaczleweli.xyz, marcelo.schmitt1@gmail.com,
 maudspierings@gocontroll.com, hverkuil+cisco@kernel.org,
 ribalda@chromium.org, straube.linux@gmail.com, dan.carpenter@linaro.org,
 lukagejak5@gmail.com, ethantidmore06@gmail.com,
 samasth.norway.ananda@oracle.com, karanja99erick@gmail.com,
 s9430939@naver.com, tglx@kernel.org, mingo@kernel.org,
 sun.jian.kdev@gmail.com, weibu@redadmin.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 skhan@linuxfoundation.org
Subject: Re: [PATCH 0/7] drivers: Simplify cleanup paths using __free
User-Agent: Thunderbird for Android
In-Reply-To: <79bfac24-dcb4-4fb9-90d8-3ef2393f51e3@baylibre.com>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com> <79bfac24-dcb4-4fb9-90d8-3ef2393f51e3@baylibre.com>
Message-ID: <7F16ED38-6BC1-4D31-B5B6-6C1E45D24C25@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_191817_869247_E73840F1 
X-CRM114-Status: UNSURE (   9.05  )
X-CRM114-Notice: Please train this message.
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



On 11 March 2026 3:22:28=E2=80=AFam IST, David Lechner <dlechner@baylibre=
=2Ecom> wrote:
>On 3/10/26 3:05 PM, Sanjay Chitroda wrote:
>> From: Sanjay Chitroda <sanjayembeddedse@gmail=2Ecom>
>>=20
>> Hi all,
>>=20
>> This patch series replaces manual cleanup and explicit kfree() calls wi=
th
>> the __free attribute from <linux/cleanup=2Eh>=2E This modernizes the me=
mory
>> management style and simplifies common error paths without altering any
>> functional behavior=2E
>>=20
>> The __free attribute provides automatic scope-based cleanup, making
>> resource management clearer and reducing the chances of missing cleanup
>> on early returns=2E
>>=20
>> No functional changes are intended in this series=2E
>>=20
>> Testing:
>>   - Compiled with W=3D1
>>   - Build-tested on i86_64
>>=20
>> Based on:
>>   <linux-v7=2E0-rc2>
>>=20
>> Feel free to share your valuable input in context of the cleanup API=2E
>>=20
>> Thanks,
>> Sanjay Chitroda
>>=20
>> Sanjay Chitroda (7):
>>   staging: greybus: simplify cleanup using __free
>>   iio: ssp_sensors: simplify cleanup using __free
>>   iio: st_sensors: simplify cleanup using __free
>>   media: mediatek: vcodec: simplify cleanup using __free
>>   media: chips-media: coda: simplify cleanup using __free
>>   media: allegro: simplify cleanup using __free
>>   staging: rtl8723bs: simplify cleanup using __free
>
>There is no reason to put patches from different subsystems
>in the same series when there is no dependency between them=2E
>It just make for more noise for everyone=2E
>

Thanks for the feedback=2E I will split unrelated patches into
separate series per subsystem or individual in future submissions=2E

