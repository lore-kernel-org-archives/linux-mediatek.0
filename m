Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C4BC83F17
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Jul 2025 09:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hRwq5x4VwHGS6JkevscNB7G4mlDeMcL9xsQzNX6TfQY=; b=1YverLPS6KfPTW
	wAiFe4OLYFv+V1fOo8svsePAS95d+Pc+CDOTEnWnoiCKVmRzqD6ToseLUWOPCK7WG7bVC//ZjhGJg
	751Ad94GgX+8BuvM516FqPGzSlvumQIjRzNynBdiylZC9GQcB+4KB8ECrNas30+wx+wyt3G2p42Pg
	tG8UbcsjgM+VUoNIxDmzUTtOmFSSrxe9leW5sqYcsTil109oJGtfc9cYru2YRMGjSlAXVH8ViSeP/
	vqEACNqEEcVWu/sbVPTkdUin+3kgqiWmrJv5AUoBXma4w/OgXAXk6zg/QnOqts13o8zb5vIFCWGEj
	57iueh7AeOJE6MY7TbHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhPdB-00000003HKI-3efn;
	Thu, 31 Jul 2025 09:31:21 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhPJ5-00000003FJU-3iai
	for linux-mediatek@lists.infradead.org;
	Thu, 31 Jul 2025 09:10:36 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-32f1df5703aso4945331fa.3
        for <linux-mediatek@lists.infradead.org>; Thu, 31 Jul 2025 02:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753953033; x=1754557833; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRwq5x4VwHGS6JkevscNB7G4mlDeMcL9xsQzNX6TfQY=;
        b=eyA1jujh7UT/t6v55I8pUJESiPfix7viQuW/ZHL24ArrTXBuX7wfnfLQq1SPyWEvWN
         al2LFFg9qmV/ok6JRTi+1YQRQeT8DZXotLjQPizWUmXTOEwcGwY0zeP1y85Z0QDGuRuc
         2v9emmfpR5K0ABeR72z4FkwEPPp6XbhxoyQcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753953033; x=1754557833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hRwq5x4VwHGS6JkevscNB7G4mlDeMcL9xsQzNX6TfQY=;
        b=RysVYwSRpybQX82e+ytsECtOTRbDXTJwmaI8fvsyGhC3+2BrvhtfnTJHRameyJdEjf
         s5Z/OmbvRVts6EWJhyhbJ4kpL6v3pSHz9dr3CYdRsamRaPdhfk2SsM1WmztcyOspT5FX
         Kena4PEby3n8VH7BVjV9HBZf6V0r5CTmaFJD8xoCBSM1p8x5OyTnlseeimlhNQYuUpCR
         4apEWJBjOQoAz2H1Fe/sas9+FMBDhlgIsLqYC3HLE/ytGlIhIx28dwdo5zljPOBy2oXJ
         hUZ3W9LCuQvHF64NESZWBwCI6gHSrtWhwBDYrZQwZ5Bg4rC074tGIsVO3EXqWWXv3s5c
         anOA==
X-Forwarded-Encrypted: i=1; AJvYcCXGZcAxgn0PeaB7XaR29mQ/oxjM4JgRgkbn8JxikV1Qja7ZIlZ519NcrteRNJ2qGTu88+TW90588zTQcNSyew==@lists.infradead.org
X-Gm-Message-State: AOJu0YwBc03NaeDXHWEiMYORkJ0q9/hR/Y62seR5XkHg2EeTG/SniVqU
	5q6WG/J1KTgOksX68X+vP3gZg70JBGOMxvz1veHjxpg23Bu9AO2R4F+cc9fBNB6JbXiT3IJplY8
	loHrMOrgth7blQ6T8/0RYMe0pjcz6qnbeo8QbJF+H
X-Gm-Gg: ASbGncu+EkdNMUxqNN4AD7FoHl3uZQAA6YMHEN9JFru0T6RhbBrpHcERG2Y+l/o9NS8
	CWCAKrCtGGae+4RQvhARfisNZyZ/rAAZ75xQXlD4NdZ1IcqWbm7QjHy56D6Mx0S4CCztL7BKV6M
	MJTFovUTMUk46maIaDIxcLWG/qBURoFoA3VnuY3qFBb3z4iFPD2C7N4jfkOD/ar377zlxerp8Kk
	2kdDU+9S8dkn3iqtxJPlqoYLhdg7IEziuc=
X-Google-Smtp-Source: AGHT+IGy0Gr0CeJFqOAF9pederTnU2rsst1o/T1ozFpoxo2U18QbJElG5oX2wY8idW4WJNxX3lI94NTcxLdGpZxd8nA=
X-Received: by 2002:a05:651c:554:b0:332:1720:2ec7 with SMTP id
 38308e7fff4ca-332248beecamr19682921fa.0.1753953033319; Thu, 31 Jul 2025
 02:10:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250730152128.311109-1-laura.nao@collabora.com> <20250730152128.311109-6-laura.nao@collabora.com>
In-Reply-To: <20250730152128.311109-6-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 31 Jul 2025 17:10:21 +0800
X-Gm-Features: Ac12FXwCRD80agK2VpVTgVXGMFnqiS6tk-7RfCAqmaHj7sFRHCdDG6ywSscGSLk
Message-ID: <CAGXv+5En_Yxy1BoWWTsQPSLYCqvd0_r-JCtEByan9xNU0QLmDg@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] thermal/drivers/mediatek/lvts: Add
 lvts_temp_to_raw variant
To: Laura Nao <laura.nao@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_021035_923254_4814D7AE 
X-CRM114-Status: UNSURE (   8.94  )
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
Cc: andrew-ct.chen@mediatek.com, lala.lin@mediatek.com, rafael@kernel.org, kernel@collabora.com, bchihi@baylibre.com, robh@kernel.org, nfraprado@collabora.com, daniel.lezcano@linaro.org, rui.zhang@intel.com, colin.i.king@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org, arnd@arndb.de, linux-pm@vger.kernel.org, u.kleine-koenig@baylibre.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org, srini@kernel.org, linux-mediatek@lists.infradead.org, krzk+dt@kernel.org, lukasz.luba@arm.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jul 30, 2025 at 11:22=E2=80=AFPM Laura Nao <laura.nao@collabora.com=
> wrote:
>
> MT8196/MT6991 require a different version of lvts_temp_to_raw(),
> specifically the multiplicative inverse of the existing implementation.
> Introduce a variant of the function with inverted calculation logic to
> match this requirement.
>
> This ensures accurate raw value generation for temperature
> thresholds, avoiding spurious thermal interrupts or unintended hardware
> resets on MT8196/MT6991.
>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

