Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2587C88E77
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2026 10:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zfPKfvo/AM7Ulb6yBYpei2bDUWjlSzZjeWLopxBStpw=; b=c5r5/BRkWbM77hrn2WqrOao4r8
	fryvIMgjfbGKlTjs/u0N9ruYN3xMTc4atsCsrFD3Bd6T/ncG8A21+mm84YtfRBtiNvcXXT7DI5cdd
	Iy+6pUmPeo2fOFx4GhP+Giaucpk9ZyXuznFY+EmUNfRL60XxkpzclFJePEKdaKDNtNUE3hRjynPIw
	CWjxO8eHqftu4R1Lx//M3D3SNmwIt1PkjCW+DPJqpoMDS8ZeZxPRxzXTFtHde2dlYBBKQOwzTTodX
	8wwOYnHfoJocPDUhtn9D8v32fv4SzqHhA8TQX2Yt+f9hUhOq638inP0n/sljUMUPO3NeC6m96EWGu
	QoAv2QxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Qe4-00000005y2q-31DR;
	Tue, 15 Sep 2026 10:44:12 +0000
Received: from mail-pz2-x0e.google.com ([2607:f8b0:4864:3b::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Qdx-00000005xwS-1lQo
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Sep 2026 10:44:06 +0000
Received: by mail-pz2-x0e.google.com with SMTP id d2e1a72fcca58-86efece610cso98103b3a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 03:44:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789469044; cv=none;
        d=google.com; s=arc-20260327;
        b=jxc7S+zY5iOMQC85nTveT3t3L8vxED36K/xgydkX2mnjkzGH8ctputF6McKSGjNd4z
         q4TQKuGM5chQrbrZwIQpYNdSgpyfrqKxpPHGZEixfJjFZmM8hbDWZbXJaJ4ViGomuFbt
         RHZ668BnyAmWpoZZovD8c8bWRxypwXh1GMPzouF+pPp+g40DRKzRv58Q12iNseFcqvs5
         RlnewMuHKUTnjMl5mH/kOnNTssnzId5/nLLwHPbE+sme2tejuNFZr8uZwNxMlxcaJsxe
         +7ZJUH955OjdjskKzcI93dRsDi2vpOfbJGldau0La3+LxQ7JJaz+n/YXivCMD4yUwAWB
         xhxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zfPKfvo/AM7Ulb6yBYpei2bDUWjlSzZjeWLopxBStpw=;
        fh=1U6WgX/rOfaVf6gK2fDmqBVQDDVE9VH8r/sjY5hYWtk=;
        b=ZOkKQTOxi1+VuNjhfxGOSbSwkmdulg5WvJwP13+fdUDxUppZyQSmENH7WrqDX2nM8/
         eiItK1UVbMT1jRXcxIFNGl7493CeNUsmOqssQDgYoO1OkCVffk5+z2gRBl+NqGeo6RPk
         JrxsY4oueCggANS4KX2+3P+pQbiTpaZ3hzSWHpnI33/wlarUneoRQwd0tf9eC9Rd2lyo
         IBufEuyvq2rnwAJD6GMdDkum8nLyoVUdhCIF57nFCjgLsyExRG01qn7FyGGazaFkBcDH
         nYBkmBCDmFGXgHSOutymAoXf4eRqTv3Pz/UU+wsCMZKkYoV553BTzyaeb+brtUps0R07
         qi8A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789469044; x=1790073844; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zfPKfvo/AM7Ulb6yBYpei2bDUWjlSzZjeWLopxBStpw=;
        b=o+paCriTFEcJaYp+Ay9jBdu9SUQdsc34uHz59/wzo6oqWLj93ZuiFZR/nspYbQpGM5
         3lT/crdQM9GAmChhYR5wa4IkPSyZnHPmPTjwoAyaqJOSXyNpLaRhAqKLmikz7TIWBO1g
         cbNtgIm5vMY3qI4mBVu/42XIblI/HuH5TCn2Q8flfD6JJnLOpDwvCHBsLxCkG9d5bTfi
         WdOmggy9iYr8GijkJ7kiycSrixciicuzeehc7zppD42dnNlampuOnGmk5VAkXRXgCMUk
         /1SnDtiF5ImM04C5hNZjrYoKEwe3olgUCyHyBp73f2dEB0G/CuJ5keAtsKzkczY1mSGZ
         lVrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789469044; x=1790073844;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zfPKfvo/AM7Ulb6yBYpei2bDUWjlSzZjeWLopxBStpw=;
        b=HG2m66Z4LnNdlVS72Tzep5uN+8RYjIIpFh5AJps2FVxMhI9DQ8vRHyaUMzaXaTmk6+
         osG05joFh+PvnFOg/Ge0u3kGohtWCPwMygT0NIMlRTMZFXZpoMOATBr7Z8/WEoSsZzQc
         jFg+YozdNdG8TDWXuAn0PqId9hMWMkOr5owhHYxzmeXGQLVOE5oiBiAYbMd/AJlOhW7k
         PjRyVV2Axq7VA1UG+hgF8wIKEu6q6+Mwr9pTJciiMTce3P4SP1vrtfmJWm0Yv5B6IH2v
         f3w/IBEhTh/y2pjQ1BF37xaD5T9IRP4jXKpUYN/dxQbVHoz6cXfhxwjXqs12r+EyycFb
         t2Dw==
X-Forwarded-Encrypted: i=1; AKwUvByDd4cQbMh0aqtN/VfYy8HieiVFdRprC1DeqNExCn1kKjYBpUDbEUiCt4LFu6FyaY+9ohvb1Xu/huBz9QDC0w==@lists.infradead.org
X-Gm-Message-State: AFuF++n9TYmpbS2PSDv8pzKUG023j8T0KQxAtBxKxn+ilbnknn5zyTj7
	tRacot27URt4fUXrpuVUNeiSMdmYvVjt6Rp1LvW66JA85z8zLo5mAJpXnoclVEgsEhNbEnGTn2p
	OMWrSaVvRdvSxhGiQXnv5MmhEE7Qk/y0=
X-Gm-Gg: AYBFou0jzyhItjbhoju5GVpn7ACdVWIBE4zUN1zhfrVbV/PAkh7Sb7qA5O5OrT2g8r4
	mvohfPBfHOFHtSGBpD0UPKXL86A9CFot02raXt1bls0Ht2VCUFRtaFBV+W5cOD1192Y8SNNd3hx
	Y15XSll2XWLtnKf18NyC7wr1Oqjgzoh1tEL4Jv97Y85zt4Eg2TmbPFjfk94ZHm6q+m6a2oI7iub
	wxKTn8mnZjbqsCbKFZQBrCSw+N2rC8iiXy6DMZHPt6OO5s7VZqYEY3jjDyyRbFBh16076NhNcjQ
	/kgzmAltl9kG/235giAUPnNdoXppgWZiu9nwaXGC++WgV+fjiRCtbpFlL6r7OBVbFuS9zCrOlPw
	cGe1gTSa/6ZV5ImXYgQ7biZrRXOLJ2MJrXb1IyJ8dB/s7AGXTRdTqRUsl65K8gz3lud0=
X-Received: by 2002:a05:6a00:4b0f:b0:853:59ed:5539 with SMTP id
 d2e1a72fcca58-871802d02a3mr595616b3a.16.1789469044380; Tue, 15 Sep 2026
 03:44:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260914072842.24420-1-phucduc.bui@gmail.com> <20260914072842.24420-8-phucduc.bui@gmail.com>
 <693fea96-1905-49c9-b1c5-3fa1ceb4874a@collabora.com> <CAABR9nH5e=kKRsHQYx7u3HtWgA3C897d9dH4h+wQTpZNGaTRHQ@mail.gmail.com>
 <CAABR9nGVYghGE-kshpeJQJrvuUFJmDATW_mBCoJfVwDNVnSErw@mail.gmail.com> <bcf23df0-30bf-4dd6-b5ad-7ad23f74efa2@collabora.com>
In-Reply-To: <bcf23df0-30bf-4dd6-b5ad-7ad23f74efa2@collabora.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 15 Sep 2026 17:43:53 +0700
X-Gm-Features: AcwNN1VdN0Kart2_fiEKCb_9XCui4hioEfW5Bf-MzLe9rBW1HbK36VRqiUYolUg
Message-ID: <CAABR9nFHDNw=9WYiQM1C-dyA_GDr+b22w_SCmedzLJNgFOn5=A@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] ASoC: mediatek: mt8189: Propagate runtime resume errors
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Dan Carpenter <error27@gmail.com>, 
	cassiogabrielcontato@gmail.com, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_034405_794909_4A914BD1 
X-CRM114-Status: GOOD (  12.67  )
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

> > So if we remove this part:
> > ---------------------
> > if (!afe->regmap) {
> >          dev_warn(afe->dev, "skip regmap\n");
> >          return 0;
> >      }
> > -----------------------
> > from mt8189_afe_runtime_resume(), that could actually trigger the bug
> > we were just discussing.
> >
> Well, then...
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>
> ...still, please check the other cases.


Thank you. I'll keep this part of the code as-is:

--------------------------------------------------------
if (!afe->regmap) {
        dev_warn(afe->dev, "skip regmap\n");
        return 0;
}
--------------------------------------------------------

Best regards,
Phuc

