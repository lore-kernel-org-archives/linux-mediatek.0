Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B55C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Dec 2023 15:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oZzlMKqeaQDgaUycRwSe7fFFE/6tq3edh0ES7fNxHN8=; b=10Bjnh79Rz4Iv7JCgrUeh/PT4N
	UHBebbca6buKOMpmO8hn1UpRmK4D/vJP1I6xgHWJDvKJJSKjS5V+fnBsYSoUKLyqOTh1adfYsT466
	fBMEvM4/jwKE4n0ujdT/DaIDq0vAT6fFEeaODDzI2JtsgW3l+EYb9CtEFbLDA28vGIEs4c0VuIKGU
	n2z5byGbmJUEjnWkEzodmzMssxyWaNm8TsH7v7EjHrzto/DO8+gR+fIrOo25usBV06Tw33Gpv9lnp
	FXInKa8E6p1x/owezCtU4GoU+hQTct15FwXwOj3CHx1zvdYE5zlg05++tYoPZ7Ion3quAOXGitBki
	e/dsaONA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDRDE-00FFbl-0D;
	Wed, 13 Dec 2023 15:31:52 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDRDA-00FFaO-1w;
	Wed, 13 Dec 2023 15:31:50 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-5c1f8b0c149so3795654a12.3;
        Wed, 13 Dec 2023 07:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702481507; x=1703086307; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZzlMKqeaQDgaUycRwSe7fFFE/6tq3edh0ES7fNxHN8=;
        b=H+BdDVQUN00zaWGk6wEz6+Ih2MmMI8hkuraItvnTdWMCfd6jx4rgO3aJKupoEZR+8l
         lyTG9DiVZqj+J6CCU9EZuGNwTnrnvFAqTDk77PxiOSxMBLrAnzL1lg3I8nBM3pdA5Qi4
         eIwy4mJvXFpnKdUjjP9/HgY/rvT6L1v9eaeVF6xrM1H9kpobyWh+Z4iI3AC9JuubfE7Z
         +IcY5CB+8e4iqT64JEyZbrghrnRA5xE4v8qBr/xN6L6750r5Zzv+PoQhx65+RllhH4EM
         A0fp/VlSLaF9HQUPj2LeT+Eynaw3RrSWZ9T/K9NWGvni21iiDHTT/HjFfLOkhfq92IEB
         mpqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702481507; x=1703086307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZzlMKqeaQDgaUycRwSe7fFFE/6tq3edh0ES7fNxHN8=;
        b=JHzWgNrNvL+0PlOT5B7nXzGBFZlx/eIn8fnpHgo5xi8K12AqbO2Peaxk9f5qDMrWXG
         cIwGzP7yyAKsVtP+64F8Ot6mxe4vudOMtOWki59G4n18PxMAFaVnP7eVcMbjLvSzp1qD
         Ysc12jBvyBAFag7go/owp1mcNULcI8M3H0OxUO+QE5oLQxLg3r4PwAEnp4Zf0yAlYScV
         kH+zk0yIXXKYVM8SnC6We29EwAbyFdvTyuuxv5pyjdr1AaGZTrkBjyvegEGAqLVEQVER
         jL9elO2Nsxxi5V+/fuhPA6+7S+S2lRiJT6R0Fv/XX15VIVsWFx18t/lcUpcFJNgmuIMF
         wDXA==
X-Gm-Message-State: AOJu0Yy6NWlq67/3Agi8BzI4XDFy5MnI8rAgLNQYfflIsGTcudepW6Al
	WlqkqtEvvPW+09SokdzfJeuPKDQStaApCunojNH2CZE7
X-Google-Smtp-Source: AGHT+IG5iZTcVImc/59btC+BAiAzwRNe1KCNitVlOmR6VYh3v0mNwJx54lXiUMbKt/6067AbRjmM4byKkaFp8rZSNN4=
X-Received: by 2002:a17:90a:cf85:b0:28a:b3bf:3c56 with SMTP id
 i5-20020a17090acf8500b0028ab3bf3c56mr1926683pju.20.1702481506962; Wed, 13 Dec
 2023 07:31:46 -0800 (PST)
MIME-Version: 1.0
References: <20231128075532.110251-1-haibo.li@mediatek.com>
 <20231128172238.f80ed8dd74ab2a13eba33091@linux-foundation.org>
 <CA+fCnZcLwXn6crGF1E1cY3TknMaUN=H8-_hp0-cC+s8-wj95PQ@mail.gmail.com> <ecf38b22-ee64-41e5-b9b5-c32fc1cb57bc@moroto.mountain>
In-Reply-To: <ecf38b22-ee64-41e5-b9b5-c32fc1cb57bc@moroto.mountain>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Wed, 13 Dec 2023 16:31:35 +0100
Message-ID: <CA+fCnZc73qNqNiCMcKFKRuoBki=Bmhdw-mOY9chV=CjAtm0R+g@mail.gmail.com>
Subject: Re: [PATCH] fix comparison of unsigned expression < 0
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: "Liu, Yujie" <yujie.liu@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	kernel test robot <lkp@intel.com>, Haibo Li <haibo.li@mediatek.com>, linux-kernel@vger.kernel.org, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, xiaoming.yu@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_073148_636512_4EEBAE0E 
X-CRM114-Status: GOOD (  20.27  )
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

On Mon, Dec 4, 2023 at 5:12=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> > But I actually don't think we need to fix anything here.
> >
> > This issue looks quite close to a similar comparison with 0 issue
> > Linus shared his opinion on here:
> >
> > https://lore.kernel.org/all/Pine.LNX.4.58.0411230958260.20993@ppc970.os=
dl.org/
> >
> > I don't know if the common consensus with the regard to issues like
> > that changed since then. But if not, perhaps we can treat this kernel
> > test robot report as a false positive.
>
> I would say that the consensus has changed somewhere around 2015 or
> so.  Unsigned comparisons to zero used to be one of the most common
> types of bugs in new code but now almost all subsystems have turned on
> the GCC warning for this.
>
> However, this is a Smatch warning and I agree with Linus on this.  For
> example, Smatch doesn't complain about the example code the Linus
> mentioned.
>
>         if (a < 0 || a > X)
>
> And in this case, it's a one liner fix for me to add KASAN_SHADOW_OFFSET
> as an allowed macro and silence the warning.

Hi Dan,

If this sounds like a good idea to you, please add an exception.

From the KASAN side, I think adding an exception for this case makes sense.

Thank you!

