Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19897C83F27
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jul 2025 05:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zUf4AlEkQu4akq53baJqj49MOp0hPw1pbtMFQqaD0kY=; b=sxDl8lB6N8CLAHdgYCqaVHpUuA
	1Leqz9Y67uVgWA6olttztqM8T8WgZkj83M8b3O+lDPYnRERwfPW8N01C5mDQQ3972lONNzxLQQutN
	4JTjyMUnapwOJlCgvMsLaXuF0mP1gB3z7xALO55W4hBEtzRTi8bVoDedbVgTy+y0svdCz+b+zXSp5
	tm//PdISQpvvAB/wMs3RF3YvfVwjJ5U0CvTZE0EZRCF5Zt0LFqDi5w4RcGI6RvAs6+8zWHi0kgrYB
	3aYLztx3W/dElHRxqHVvod+/oCe8X+QsSKYae8YGOCp6j62DGyx8hHq7RpBdkymavkvBU3pewZYvf
	peX9kIuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue5BY-00000001JDC-2YS5;
	Tue, 22 Jul 2025 05:05:04 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue55I-00000001IQr-2Chy
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Jul 2025 04:58:38 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-558f7472d64so5322902e87.0
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Jul 2025 21:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753160314; x=1753765114; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUf4AlEkQu4akq53baJqj49MOp0hPw1pbtMFQqaD0kY=;
        b=GXBXFaHKm6yWVxjEpPRcRIa7uKxr2B0apwmYF/5hgOpjuaXaln+77aiZWVPU+GXV39
         D4B8pxEgVgjbkC9BR6g4Al74MVGYmZ67c5sbeDI1ZkV2sUBHxCpRB2c1d/Wa1TdXB2KX
         ojjX6y7CQ0hkyby/Ck0rIGED9uQmFD2tDbVu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753160314; x=1753765114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zUf4AlEkQu4akq53baJqj49MOp0hPw1pbtMFQqaD0kY=;
        b=pK5xIZqgc1IIQgOSDfnefXYxKiSWROIsw6YHP7nxoPRrIUc7b+BwnZ7abczB25Nvnp
         htj5+24HIpT1j1YHEftE1oqbbPeaLnX/tZlJa+FOjxLPoZK41Kj5UhRqOyqBDNW/lWOx
         A6BghxEhAQU/P3c4li0oAQjh/R2SEgiXCOdvDnjauWzWEtZv8dfokW3YulFWiindLRZ4
         2P7soIFlcT12btq5/+g/tPWRSMKgJusZtwb2fuUarECMuunnV1RHP8DxpSQJl/EAegbD
         eiNlp1VtcyERSbfQWiAsQEhtJXLPnu9R4gVmDMDoopn4943BTt85ES3iIgAHMEvcGn3x
         +NOA==
X-Gm-Message-State: AOJu0Yz4nCNQ0AE+M16NdXehSxHaraglYO8x5hOAnU3CB7RKjJhlLWwg
	6YA3a7TWHQGhIQ6LV+Sx6HradYDQDV1KrcTvwQB+ZqGuOcIT1CfAgSd5y4BQPwZBw7DfyCeK0N2
	kyVY4rYtLhrkih8tAAwXM/Ud9Lu87kmiBqd3YBq72
X-Gm-Gg: ASbGncu6njefRwVIggWDySSfnujEAgBUmJ7xYtliP5SxBjwXKmH75MPwvDhB9dqNhqg
	tx+3pHZZkBIrkKKLj1OLtU9CY5VTR1ezvdwozzlPUlyeuvXGvAulOjObOymBwOREbcuWInw0E5r
	Jqdkq34W66TarNWUEjognsJTL6ZStlJeVZbLMNmizlLuPZkaE1FbLIyUN2O021T1ebYBqbqFpHq
	U4A0IwMj9NepbhiWpSLnaCMZ1a33TPDjBM=
X-Google-Smtp-Source: AGHT+IEyU+tFAsFMORjYCQnykMeU/pbwHrSE3Y7T/aLBjOwuzBCNRlXwUTyFrlR8NysXmCw/f9p80hu9ipZkTsFJIJQ=
X-Received: by 2002:a05:651c:40cc:b0:32b:4521:73d1 with SMTP id
 38308e7fff4ca-330d260dbc5mr3824561fa.20.1753160313915; Mon, 21 Jul 2025
 21:58:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250715140224.206329-1-angelogioacchino.delregno@collabora.com> <20250715140224.206329-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250715140224.206329-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 22 Jul 2025 12:58:22 +0800
X-Gm-Features: Ac12FXwqm1vj4VltrzTTMYOVI1lGXo2qDa8kdMFLAUiRJFcrn2uXXat6X0eoKOM
Message-ID: <CAGXv+5FXr-mGDG4mfqFx0o_dhi=Q3s=Yjpj79UVfEQKf2Wit2w@mail.gmail.com>
Subject: Re: [PATCH v5 1/8] dt-bindings: regulator: Document MediaTek MT6316
 PMIC Regulators
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, lee@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	lgirdwood@gmail.com, broonie@kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_215836_587937_2458AAE1 
X-CRM114-Status: UNSURE (   7.95  )
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

On Tue, Jul 15, 2025 at 10:03=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add bindings for the regulators found in the MediaTek MT6316 PMIC,
> usually found in board designs using the MT6991 Dimensity 9400 and
> on MT8196 Kompanio SoC for Chromebooks.
>
> This chip is fully controlled by SPMI and has multiple variants
> providing different phase configurations.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

The descriptions match the datasheet and design notice I have.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

