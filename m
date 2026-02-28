Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0FEFEE4F2
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Feb 2026 18:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CzbAnz6T/IhzT60BwbsGo7FPW25EednVTt62Gcqnlt4=; b=cSOWIwFm1xNVgD8LMtaQXg+ejy
	i3ugWu0ie1P57xRipT8GYBOWzZIMD08XmfKbkIW9OrgNeHxHfT4RNuzgYaB5e/omOFI14d1uyYf1K
	h0OwvzIo/zRtHAEi227Ykuad01BvP7g/J5fQCrOHMuegtXNAsVK6wSZ834qLGMcQVEtVcazA3oCkb
	0NEWmRMIWuf3sZ+rL08zmQAeoyF+MOinN2vU9A45Ove02rD/nrx8t+6IXy4rO5rMA0p5XZoXk8qMa
	U182VGTGy2DnRD4tXnmTXZRFb+MVaDfcYqxRCfa6mof7F9BmddF0Do+u6vrCKZf5ogXDKOa+7N4cz
	WHuoEJrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwOcL-0000000A7yB-1Nf9;
	Sat, 28 Feb 2026 18:00:41 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwOcJ-0000000A7xE-2LZP
	for linux-mediatek@lists.infradead.org;
	Sat, 28 Feb 2026 18:00:40 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-503347e8715so39609451cf.2
        for <linux-mediatek@lists.infradead.org>; Sat, 28 Feb 2026 10:00:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772301638; cv=none;
        d=google.com; s=arc-20240605;
        b=i8Bg/lhG7DzUTQi7uG+Yn+XJKqsg8MwDveYCF87LpkEJt8STaNPpdeb2aN2zzvaeBZ
         LZr3y+sc0+xnPnXUxKCVUKK5wTsiN1T47dXiB4nRve7GRUiKEJ1AkXH2Kiw4LM/E7KSB
         DERGoWQ+WRvyxm4ReBm4EfwNi4QsPZfkCsTXCh7a5a10dUfkm2SyyYEWkWALmJLC5BJv
         qVaBB8Dh42W7tcbJlXoJNIzH5NEG01hwIZzDhv1W2dFaEh0UpdUuNR8YvRN4fEIsOYiO
         2Kr9rhqA+9xftD6m6BXJrShPNODU2cOKtqQnMdMbKmOaMPT648HhnSd0jH+sR56YswM+
         uJXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CzbAnz6T/IhzT60BwbsGo7FPW25EednVTt62Gcqnlt4=;
        fh=PyE2nhqkVl3HGobVaT5Yn8fVdR6lWbePbQP7Omq8PSs=;
        b=crXZIysdfnWlQTgC8dRzPz093AzXL6gQIuoeQVwwR53qjnzdsH3TCA4atRBg9KhVq1
         L5XaL3gELgZ0HRmCb6nN81p1jEGIfT0UYnl8ZB7c67gitq5kBBd1VOHuKaQn5raw+n+Y
         z8k3Jk6S3RTVyXjs0wDUGdBCY8LuPZXBMtZV2nhqIKVMOBWskpJwM3COdVa0PhA1Zl+K
         Y6KhK+qvaqY894vnui0gWaiTiabAnAeO8olQi3Vpvs601TilY/Rgn4p7PeVwff9BOGh8
         VKPy3R0I4YMe1F1q5GPgJiAjptaUVTIAGvFRs5dUonRcDrCdKIj/guxBxw3WVcK0I5S5
         yVxA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772301638; x=1772906438; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CzbAnz6T/IhzT60BwbsGo7FPW25EednVTt62Gcqnlt4=;
        b=Q+Ga0A3pHi2wFe4bTMQAkYzSxsqkjakjiQCZKfLsbswTfG6QGatdaYbSt2qYXTFA5d
         7LUsUwRve9QBKrlZJh/F915hH919n5JDGz49EjXSIi2Y2OPslsL+6IOqs52irnZcK6xc
         /OoQoRKadTP12aeNcfHTDSoX6vOqU+NqUC46+UeMw609SOGLacLo2ctQTzO3URonvkyf
         7WiFmSl6lJwSI9K29ilGTSOLLDJXleUt/m3olYVvKXtwfEdZy7qmNJpe/dT5CZZSBywJ
         q1RAc/Nd1srBtUmMS/n9Z+die05k6rgU1fKHtPGIp53gPD70TK1kyQVxp/z07xDHwxf+
         bPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772301638; x=1772906438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CzbAnz6T/IhzT60BwbsGo7FPW25EednVTt62Gcqnlt4=;
        b=QeYgHGK1SByJGW/UEd1r/aIdoQJkGOGnth8bsx/kV4WLEAlvEvjwWUAyxsw6YnBjFv
         5JHDrsQkB0b+1JDk3kMJG0ZDZqR2rYXdbydwRF7ykjXPGBUYh6ozCHCaNTPoKM5dUHIs
         zYysZxVAUA885Tsr33+wGeSa88KFeToY7pqNHbz7KizncZSaJUOmr7g1fErt1bTMs+6X
         MnjfUZrhtqDaRGdn/IBYObFN1KR+xlWXW63feJukZ34uyn1sciUl+8yV8WFud9UpcoLA
         IxJZT7ULbkIUQE6mJK+zRfv9MZPiotfBLzZLss8FUCN3lOLUEmaGh5UmJRAOkArKSDlv
         QUfA==
X-Forwarded-Encrypted: i=1; AJvYcCUnbcXkYmyvW2polqHp9LOod3oydpXmYoXtJlkHcNcAR22LO8O9FC5x7CwAFufGpdWftYC4BBUXKfk6HKx+9g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3f2Ns28GuILUndU4pA+jnyNE5srTC0KEGF9HjgVimljv0cG92
	ach/crjMOk1FsNIvxfqz4bNSaNcCnUQEjcfh+VWk2bJS5jEl+o3pDd8/o7DBZCTGtzff1Z0jv9u
	RmNCf29noeGX4y27IpXKdDtFjVXP0M1E=
X-Gm-Gg: ATEYQzwqJBdbN+/TrAKBRa/9BHYFOr0UwoLCUsn+zqueBv81g3oPsdsSAkFMLlgkXXr
	L/DRkk/m9xnkU/qc4ZRejpiX6pgRuQQLmpxr9TrumAbKvbX3MWemp1681OA/f5EfLlKm0BaTE9E
	siZnGraLx/RDmSj0aeJyJIItLBLTlehlLekh9ngLzxn6nrbQDfvv7dwL8YcO0eHM+jtv30mAERI
	v23F7ZHyQgCphOAlJdNuKHee51G56GCAkD6SCxSNfZo+Qk/ATE80Lc239Y8g4ma5w+fRC4J1ywm
	XhlvPuMnu+enzAnvYj+wd2Hc
X-Received: by 2002:ac8:5f4c:0:b0:4ff:b211:6aa6 with SMTP id
 d75a77b69052e-50752796176mr90990561cf.27.1772301637636; Sat, 28 Feb 2026
 10:00:37 -0800 (PST)
MIME-Version: 1.0
References: <20260111092833.466263-1-akkun11.open@gmail.com> <6a499e1a-80fe-4fc3-af77-b5d31f689d7f@collabora.com>
In-Reply-To: <6a499e1a-80fe-4fc3-af77-b5d31f689d7f@collabora.com>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Sun, 1 Mar 2026 03:00:26 +0900
X-Gm-Features: AaiRm512V9E6SYs2_Yyac0rJXDDdrcUO_TD7gqKE_u9D1yEofE0XT1GKOLrzGEk
Message-ID: <CAKr_iV40A8=8e4Bqez-mbq6Jt+ZVNH=Vbvk1mQPZq1Z_feu+ng@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: common-v1: introduce per-function
 multibase control
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	"moderated list:PIN CONTROLLER - MEDIATEK" <linux-mediatek@lists.infradead.org>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_100039_600840_2ED5DD48 
X-CRM114-Status: GOOD (  11.82  )
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

On Mon, Jan 12, 2026 at 5:31=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
> Thanks for the patch!
> What you're saying here makes a lot of sense, but there's one big questio=
n for you.
>
> Have you considered migrating those pinctrl drivers to use a PIN_FIELD_BA=
SE()
> like it's being done for all other(/newer) MediaTek SoCs?
>
> Why would this not be applicable for those old ones?

Hi Angelo,

Thanks for your review and sorry for the too late response.

I am developing the pinctrl driver for MT6589 and initially based
it on the MT8135 driver, because those two SoCs are very similar.
However, I realized that the hard-coded multi-base settings in v1
are not compatible with MT6589, which led me to create this patch.

After looking at v2, it seems likely compatible with MT6589 as well,
so I will proceed with my development based on v2.

Also, this patch has two flaws:

- It hard-codes the behavior of mt8365_set_clr_mode, which would
  cause issues if there are other SoCs similar to MT8365.
- spec_ies_smt_set expects the IES and SMT registers to be on the same
  base; if an SoC does not follow this, additional handling will be require=
d.

Please ignore this patch for now.

Best regards,
Akari

