Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C823DC4451C
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2026 03:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FKTf/d7nFmKcsSFUbAB3exdk2dVsrnMxmbCxkgyTBek=; b=heauid6tlMowop
	+2aPJVI8o/gTgYzeFYy2NWzHpaBq3w9qsFc6Te0gy/DuI5R9pDurr+FWSxJzMNI9+eo8O2mzYi8Fc
	jVQlodtDjQlgblUhe+xTAT6Gkp6y8L96KY2DsQKtTrLb5L60kRojseH3X+JIQrb1PTJi51HHN84iI
	Kp+IZ84IPNkKTLo/Jz1ebNELdjXqmWDjhrV1if7gKgsA5yONNytC2BIUXJoUTQ6U4Wzy7P2+2HjIr
	k8QdNym1hZcpWyq9y/f6tQYGqAiMKlclGHqy6PfRmZP+u/oFC5D5fJK6QbeX8+UHE08u/SsmQjkob
	lmRifS7odywmzd0k0zCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmNlq-0000000Apgn-28zf;
	Wed, 22 Jul 2026 03:37:22 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmNlm-0000000Apfo-0fw5
	for linux-mediatek@lists.infradead.org;
	Wed, 22 Jul 2026 03:37:20 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-81eef95653fso44485237b3.2
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 20:37:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784691437; cv=none;
        d=google.com; s=arc-20260327;
        b=hTWqZ2CANGy+JrrU1mv8xngSxQEekumHR+9TzvMTWkPX1iCm9FsZOavHwBxuc+lfDo
         gwxT/f+lclwaCHM4+803f8nva4teRDk2piX7Pygwzv6qolFhfXzvl0XOiy/SWAXZNaI9
         KQQJqsFCuQg2pEAcigQvLpIGGs9SocpGgHNonQXnB0t9TUb+rhsnI8x/LySGU8k7vcxY
         j1q7W3e/3Blbpk4ITK8UNsR71+0TXUXGprexX+u8kqxEbWK44T3ThMMWvH7ISp0G63HO
         tT/h23Vio1mmUdauWt3cYsu6yjKLc0T3BRc0IR9NHwS++rA0SvB3LCX8UdoJlljoPw63
         gUjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FKTf/d7nFmKcsSFUbAB3exdk2dVsrnMxmbCxkgyTBek=;
        fh=oaRYnLvLmUabkfYEMPWlGj4pNyKkEEsdo8212WmSH24=;
        b=Vd67TzjEtCkgxasjrp+vEPPkXFf5Yz2aLK1YFPCdNpsR4kcpGuFhAm4ddsWbtoVj7V
         5cXuE8Q9RCDH3bqdpDX2kk5MaOCdDVKPAvvh6FH7rUsoLPyA07DhRjEpwfF1ISgVqerg
         aYb+NeawsyEy+s667SCHLn+ccEmZKUr5zQ3Etei0t0/vDrPqwiM9Z2whudm024VPKKWA
         NKoBLfWmMKvv4PGTOysOs0AzSb24PzCl/G9fA7f7vUSJJ3lotmRToTFZyE7CnzntkneS
         cbT6a4oL9OVMwkosca3z2rCol3GwLfDpPQw2iiEwyBV5EES3i284JtjFPMg1rPnyJ3Pf
         KJZA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784691437; x=1785296237; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FKTf/d7nFmKcsSFUbAB3exdk2dVsrnMxmbCxkgyTBek=;
        b=fza2AwSYge2VG0WGu5bijCgoOCfJMfGaPiEdJR6uycBjFpHwwcxTvtUqwXjKvj4rI7
         sufk6QaIHsEG4uXoAlitsBGFmKn98N/QZTRLd+l8TryPkMwWv9pkyBg/K5ecUdE2RgBo
         0HNQbelv91xI8sNGiDtieYKt1sc5ws8wJ4eI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784691437; x=1785296237;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FKTf/d7nFmKcsSFUbAB3exdk2dVsrnMxmbCxkgyTBek=;
        b=aVbCj+hDQBXk5fftS8HqWAS4uLkQOG0K4es2luy883BJfAqz5zTIYW9ShhGwv/Ife0
         629ak+tl6YqahUe4XZ6tBFi04RYUCLIn3DdfWkRdyJavV8l9qvwUjEef1E02e2h8Yp0D
         PGsf8DnudWWps3Lcy1gu7AHt5+4D5xKbu8WimpRdlWkI26YIF2FC5RIlIQTwoh5LVcQn
         5K5SjuEo+gEvg62D8BGslO35eC3xxSBDRISUc0zfDHIhg5HZ8BVEsZkThEKBnXT7vUaA
         2fCbLvmpj/aMa2EJDTS/bBvrTdDXrHROwkL5GROrOsyEhGGXniHas7w7YJ9WB+VRauAr
         6DVA==
X-Forwarded-Encrypted: i=1; AHgh+Ro3Z93GkLBkEA7sY8LugZWS9MzZXVuFTMViZwxNEo3KjyPglUzAIxbxM4XAdlM803HtTKpNx/IyLvpVEvDtLA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywzni2mpwfa9YjuHPW9sxmkUbPW0tplCjbdT1HPHgtJcG8DN6vF
	xat+fCPJQ8fYVu5aK0mSVQhWoi2zvMf7t97VN8l0+kNcQxARHl4mVmxRrReYT6vjuBfdP1Gxn0L
	cTWVWxk9os9Kx/6m2kUqwP7Oj5pGTq7iMz9R7tjf6
X-Gm-Gg: AR+sD11alyvIcqobA5ZfUSj8pESUvaqbku70LLs5NOA0Mu5zrYr0zv49pcNnTdECbX+
	rMCYjh4XeLtVCPCg11bfCPf2dBNrlM6aNnd3b7THkAXDnNv4/xnadZGk2W+cFBg1A9ZCxJBwL8Q
	h+dIvGwZxMZeqSPu45UMVEanLbqUuPn2MkPMMuogPaX7XOd8MEGQlWDISpH97AXoo87X3Jluvhn
	iQ2qQGoYi5VoGeDxSdHEhdtgD2j6xay609HqvGwcMrmCCMdjZ2ERssXK+e+hZzqDKdOwLioWWMb
	j7eBfPHxZJbGfzk=
X-Received: by 2002:a05:690c:6c0d:b0:812:996f:176f with SMTP id
 00721157ae682-81ef22d3ea4mr70445607b3.11.1784691436993; Tue, 21 Jul 2026
 20:37:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260721105230.101906-1-angelogioacchino.delregno@collabora.com> <20260721105230.101906-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260721105230.101906-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Jul 2026 11:37:05 +0800
X-Gm-Features: AUfX_my3u1BuHiEh3Upx2wok8eAOOGJ_r8yDp0XbplwggDqqh2JVTYtoDhYXOKI
Message-ID: <CAGXv+5GrPZCZ=jNRi1AtduyZoB8DF_FUZev2CXhu4WzGri6U3A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] thermal/drivers/mediatek/lvts_thermal: Make reset
 optional for MT8196
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_203719_022571_01A5287A 
X-CRM114-Status: GOOD (  13.21  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, rafael@kernel.org, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, jiapeng.chong@linux.alibaba.com, laura.nao@collabora.com, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, p.zabel@pengutronix.de, daniel.lezcano@kernel.org, matthias.bgg@gmail.com, rui.zhang@intel.com, kernel@collabora.com, krzk+dt@kernel.org, lukasz.luba@arm.com, bchihi@baylibre.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jul 21, 2026 at 6:52=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Depending on the SoC+Firmware combination, the LVTS hardware may be
> may be actively used by one or even multiple concurrent MCUs!
> In this case, resetting it may produce either a severe slowdown of
> the entire system, or even a thermal protection AP reset, as some
> MCU(s) may be reading a very high or very low temperature while the
> LVTS is being reset.
>
> On those, don't fail if no reset is found as that may be omitted on
> purpose, but still check if there's one, because some board(s) may
> be running on a different bootchain with reduced firmwares or using
> firmwares with reduced functionality.
>
> So, use devm_reset_control_get_optional_exclusive() instead, as the
> LVTS controller always had only one reset and retrieving that by
> index, specifically, always made little sense anyway.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

