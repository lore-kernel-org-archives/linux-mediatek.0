Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54278CFA746
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Oct 2024 03:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kjYW+QziEcVJXhaCqljSKWk/0TU8L4We7FSabEho0l8=; b=3hhW4hHBo9m5xvPNqS8RP/z/PT
	enjJDiKIR4jqL5Wx8plgwLkPERKkjQTzDm4AVoCQ9ZfgG5SEs2LGSe2qvM6qiJcfGxaK2SBWqA0vr
	TkeJxmea1+/Y7K2TIZGPOY0Gpj7pusn0oKLpKzfqrOt+9zu80wtJvNppG28DaeevlZ43svqiZeNQu
	CY4l7W76PVW8S2cEublmAdjDi0842WZuBH/Emi6nrnKiRbYskFZoisFYBPi/uvCfN3U1zR30r36dP
	d/a+G6M+H5yJqFPTBapeJzDAPLI2lWRCUZgHtP82D+3n6ZZL3kd9CVaVzWQv9HUskwFnm4LWnczYD
	SSeqAuYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swZSC-0000000AyBx-27WM;
	Fri, 04 Oct 2024 03:58:08 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swZS9-0000000AyBR-3l4G
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Oct 2024 03:58:07 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5398d171fa2so2025245e87.0
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Oct 2024 20:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728014283; x=1728619083; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjYW+QziEcVJXhaCqljSKWk/0TU8L4We7FSabEho0l8=;
        b=nmBkz95KtRt5WwScBLtzvV64uoPXZ3mnNifGOhls0m7FGSDocgakclYbkFHSyhdO0q
         G2UksSJTd1NZ0wLJNFWH+n3eCbfJVT71BHFSG5N+CaRe0q7EiVs18H+n8rffzhqlgwyP
         ANyPVXYVzaPYC11of4N4xcIiVM5n7NCm/j84Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728014283; x=1728619083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kjYW+QziEcVJXhaCqljSKWk/0TU8L4We7FSabEho0l8=;
        b=Bc992FMNUyxrJc0vYVe8bIpFXWNasgkJ/sqCe0o3ITLkupCKbVg8132TEUA0K5lgZ/
         pBoacOHRr3rW//VHWfUkhNHBrfFPawEoc1SoTpSmpDlG9bxeG735FAoNlWhEf2/gMmID
         4kNYyWlFOcl7oFmNF79rbdP3EF5Hnp+f7Jdf3/0YZhXzfIJ+sDcA7DW09gi80qZUS762
         66SnJrnMBOB+lIfYq/wg3x6+lrUAwC6edMWB3JuSvxwmkPiYgoAMm89mvOI/i+MDAnsn
         TbIJRMW9+c2ywXt/QirxVJnuawurN3kgp1PGfJWqZ0adfYBbgtp2rz0Bw3qMjbd9p7q4
         X+3w==
X-Forwarded-Encrypted: i=1; AJvYcCUnqcWPwxer71ZWs6ylv9/SgN1VtD0Xn9QgKLd4/iHFI+DLDNQAk44p8hBCy9n45mdOkzrAyJSq0wKcBDgZPw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwBuPNJMLIWWoT5/1e40ZcALpm4WJPepVQ/+pFkQOMZmi4XQgRT
	tnAAF03MLCGv7FUwSOYI4DUODZxSafmhTaV6ET/p9n+z6+YftykLxiVtQokku1Wj5v+/4JRKkHx
	ZI865og289OiuigOqXN1ZHAJqRt8KPo3Rv2hPrJ+xNZfnjXk=
X-Google-Smtp-Source: AGHT+IGCSauXsJLec2oJrPfkYs9NEcva9UvjTHFkP+w1oM/AcTWaw9QXjbewWHBIo/wx6d90jb2ssOchDoJfghPpNZY=
X-Received: by 2002:a05:6512:282b:b0:539:8b1d:80b2 with SMTP id
 2adb3069b0e04-539ab88c3e8mr685562e87.33.1728014283144; Thu, 03 Oct 2024
 20:58:03 -0700 (PDT)
MIME-Version: 1.0
References: <20241001093815.2481899-1-wenst@chromium.org> <ZvvHdlD6E5bzsWwV@google.com>
 <ZvvX5KcKaVBLedD1@finisterre.sirena.org.uk> <ZvvyEux8f2ylRQOn@google.com>
 <7db1299f-f925-4689-806f-f1ea4191fd4c@sirena.org.uk> <Zvv1FuXBZpjDefb8@google.com>
 <6626b1f3-7c3a-4531-b006-9e29155025f0@sirena.org.uk>
In-Reply-To: <6626b1f3-7c3a-4531-b006-9e29155025f0@sirena.org.uk>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 4 Oct 2024 11:57:51 +0800
Message-ID: <CAGXv+5HYv3v3MMknjPvOf_hKEHM_UEmz7R3ATmpindebcK_FKQ@mail.gmail.com>
Subject: Re: [PATCH] Input: elan_i2c - Wait for initialization after enabling
 regulator supply
To: Mark Brown <broonie@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_205806_286702_51EFDAEC 
X-CRM114-Status: GOOD (  14.52  )
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

On Tue, Oct 1, 2024 at 9:13=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Tue, Oct 01, 2024 at 06:11:50AM -0700, Dmitry Torokhov wrote:
> > On Tue, Oct 01, 2024 at 02:06:19PM +0100, Mark Brown wrote:
>
> > > Yeah, but that's got to get washed through the individual system
> > > firmwares to get deployed and my confidence in vendors is not high.
>
> > I think native Elan is only used in Chromebooks where firmware is
> > decent, the rest are I2C-HID.
>
> Ah, OK - in that case I agree there should be no problems with ACPI.

FWIW all the users on ARM (at least in kernel) are also Chromebooks,
and all their supplies are either missing or marked as always on.

So I suppose to avoid affecting the power sequencing time, we should delay
this until there is proper support to handle wait times with the regulator
API.

I might find time to work on that but I make no promises at the moment.


ChenYu

