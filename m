Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 830DACA6019
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2026 11:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SWFAa3FlRVlkGRW/o5QZDawPsX279VU1DGq1SPr0IVA=; b=qZb9traRrX+5GKYM4SLTJQIVrp
	krouLLKq3j9YN4rN5tZ+x8N8a/ix7wiVcvHXTbJRREd8jC5A5RGKVaTmuULK5SmIsjrwOcChe5+ku
	oeUlHM1jvnQekLMLDiv6Qp0w8YR5+2otPch0B8KyU+oMJUEsNzaiSu5RkGoEDBqjYaCTH5Q9tb3RK
	P4PYkFhCpagBQ9Q3IufAcYM4uzlH1Tuk/9uFIT5AGFnYgd/OCw1iJfM7Uri+KChPXwd2+M/WZy7NN
	5Ag070sG41lZDK788DANW0Nyle4L+FINqKh2V59I+EeGfhPlNNAxyZDWJjfbynWkmGacIAF/WipC5
	yCVc1YWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF8o6-00000006B7y-4Aie;
	Fri, 09 Oct 2026 11:30:34 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF8o0-00000006B68-1OV4
	for linux-mediatek@lists.infradead.org;
	Fri, 09 Oct 2026 11:30:30 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-677af43eed4so4006461d50.0
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Oct 2026 04:30:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791545426; cv=none;
        d=google.com; s=arc-20260327;
        b=bKW2vBS8c84yO9sFQvA9YHzyU9+QnTFEgCLm/PSapW/LqEX9TVFmtWjblvuR+P0z9b
         EF1SnxHway88NYrtSY081oRjmcGICoj0BDS4BK8RZOJs8ewBNmm+3NcMbiTz7ZBrcBja
         S3PPFzANC8K2IWfuLXPFHWGsghh+ndB2gADsjgxQGUu3P4J2iLihW3tFXCGdVJi2t+7Z
         HP1G+x9PQzCPFF6pBB79KQn3UBxdiThcgwGhscmg1yRsNqu7DLea8TEIyQOflFGDZDgk
         TNYTartJYF7pp0v820IApXLItSkSg9MvyYnXOB8rNbnW1Dg3AyWcBz53riyhCA7OJRv7
         9QYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SWFAa3FlRVlkGRW/o5QZDawPsX279VU1DGq1SPr0IVA=;
        fh=n7cq6roCrVf5W4Tkv5bq8PS4vML7etCz/TIsk8amu18=;
        b=brQlXUWXG3hoRyU6N5uCaOt9uhALi9/ma/Y5sj3xhIiLa+PN2pbXS2NClUgRfISMlR
         gsoCOwk2vTe6Bu19y2Fs+QPxoQW+IGOrGqiEOMCGg0QtEkESosey5T5t9gJ5w5cP+fRJ
         +FJuqTGz1pIYrE5MAbntG0A0McdqGjgJU8YoQSYZG+Wa2CP7FoalVYM3oFfJYH6aJtXa
         8/gBB/4+9BI40V69kqAbZIY1iNCYcNrbJwNe1Djhmma5/+CA59DaGIs9YR7Smlk+QzvI
         00JVDNgdj8hcz/hV+Yoqo7AH367N/gcC3MfDcDdsV22XbLglza/AjhzxkYjhLp1CMRy1
         iXOg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791545426; x=1792150226; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SWFAa3FlRVlkGRW/o5QZDawPsX279VU1DGq1SPr0IVA=;
        b=a26VKFcDATqpCF46Kl1aLNCcYGfW0MTxihU8Kzfq4gG4JihxIA0/dU7B4bJyeOAfz+
         1qsSlCfgAidZ4e0snL+DkrXb6VErjNinP8o+9F87fIqlQEgFAYKDqoq78DIUsuj2xGsB
         Q0lM4B8ixsk8SaSV4iztKafNm/FK9hW92mdtBrHXzwzhLugHQAYpzBlE6nttS5Ntovl9
         OtLPyTw3nBkyezgIqS2P+PGJXvRpt02LTVAKkWwtBz+piHGO7s/IvwGQYbZN2+lwpGT5
         LNWBFQnlYuShCWd3YJVvUD6xtFyOPNYeb4cbaFLwbknzyjyck3s0Txd41XN/DYi1O7MT
         QP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791545426; x=1792150226;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SWFAa3FlRVlkGRW/o5QZDawPsX279VU1DGq1SPr0IVA=;
        b=QQAKQiBevLK2PWz+rlHmvJZ7XdWeVr2zYwlR8pFEwVyLwS7Mt3ud9QRv8R/+p/aW20
         n3yYOjEqabQUzIjyBmkm/aLUg+ua1EaZ89StLQTYs91v0VvHx05oAlk5hewXaQ35kseA
         6r2lN9FzlRfV6uH7NDmXZve8U87UEjFuc7zfBVrN1uWvYmKFIbIfSJOgEujy9ZPBVDBg
         TolvBRAS7VFBmh0+4lsArXq+S322/fei3UJI3FzzVHw9j3xJw3hFBM/27cSth8erCtMe
         Ew215ZYvXsTeHEMT2k18RRdZqfLn+n0o3l8Gnmfnfs3OVQ/3rERHXkQNge69zxb38NgS
         BZxg==
X-Forwarded-Encrypted: i=1; AKwUvByKmCaBGrYBQMgOwt+MRhXOD3be8/PzC41xhPBLhvmHo75Denmre4fDqU7bnjdVgY5AshJMuJYwAK/jzXIqpg==@lists.infradead.org
X-Gm-Message-State: AFq9FYI8b7SBVtzZM/Rs+ziXrkiABtC0Bi2EE+QOUNtGG2VS6oUcTUOH
	eJuvGxP92dubXIBGw4z+/ce3cfq3WhrmLKxxsnBbeSkM+FpvAdxwq+byg5v08bJDGPGbWMeiZ2p
	cp7LqNv7NDLS1+DTS8WuNORJ2MyulDyE=
X-Gm-Gg: AYBFou0Lp9fS7QiURIVdPvg/9KrUFuVosVBnc0p8x5zz9bTcoydIlnec/Ob4iUs+fNj
	8F3IE26yXfz3jWqjlKr0+g4MrAnmzRzSSDTUb1/0sTQjwP5OJOuyUcUfE8wea62hLZhhu4LyFqO
	jvBqmF9SiDlDxE8HSeBRklqAeQS/F9OzgCiTDl7mMDxB0gje6LYux24mwtOUEzx4WdSTjGNGa7c
	efSiDDPrl/866kOf4USmyyWN1zm9C87UeNExJDPppP2Mhw5KVDoaV+SDCHiequpvnHg8FKsrRQR
	a8p5zkN/8B/mH/TM9JtrWoQ+asxjfFbS9v98LHbYi+p67QqkqrNvXiFS1z89twO7ATn4/zPNzE9
	vWwyTmaLHbHwHTDMpd9Evjzk=
X-Received: by 2002:a05:690e:b49:b0:675:6da9:1473 with SMTP id
 956f58d0204a3-67936984122mr569837d50.19.1791545426481; Fri, 09 Oct 2026
 04:30:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260908090448.3332-1-ansuelsmth@gmail.com> <6c610758-5f34-4408-a6e5-f3718218ba94@intel.com>
In-Reply-To: <6c610758-5f34-4408-a6e5-f3718218ba94@intel.com>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Fri, 9 Oct 2026 13:30:12 +0200
X-Gm-Features: AclHuK8eqfw6Ev6f1SKA8eu2eg8tRj5EFkf2BXzzFiX-0ipAFbVTyYej92ofmYs
Message-ID: <CA+_ehUwrzx2gLS88438mqQC=ms71kaJpoU9ib8=zAdpsrXcGeA@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] ASoC: Add support for Airoha AN7581
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Darren Ye <darren.ye@mediatek.com>, Rosen Penev <rosenp@gmail.com>, 
	Daniel Golle <daniel@makrotopia.org>, bui duc phuc <phucduc.bui@gmail.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_043028_401118_AE134718 
X-CRM114-Status: GOOD (  20.20  )
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

Il giorno ven 9 ott 2026 alle ore 13:25 Cezary Rojewski
<cezary.rojewski@intel.com> ha scritto:
>
> On 9/8/2026 11:04 AM, Christian Marangi wrote:
> > Add all the patch and documentation to support Airoha AN7581
> > sound driver.
> >
> > The card follows similar implementation with Mediatek with
> > the codec present on i2c but with a simplified implementation
> > register wise and additional frequency supported.
> >
> > Changes v6:
> > - Fix PCM probe allocation logic
> > - Split driver patch to dedicated PCM/ETDM patch and machine driver
> > Changes v5:
> > - Address comments from bot
> > - Better handle concurrent irq status bit
> > - Protect enable etdm
> > - Add Review tag for documentation patch
> > - Address formal comments from Cezary
>
> You've not included all the reviewers in the Cc list despite addressing
> some of the comments. I hope that wasn't done in bad faith to avoid
> further review.
>

Absolutely not. I usually use get_maintainers script to get
the emails so it's totally possible I make mistake and I forget
to include reviewers.

If you have a better process, please suggest it!

Anyway, what did I miss? I can totally send a followup patch
to address them! More than welcome to fix anything.

> > Changes v4:
> > - Improve Documentation YAML
> > - Move IRQ regmap to mtk_base_afe_irq
> > - Use mutex for user tracking in ETDM
> > - Register IRQ after memif allocation
> > - Address suggestion from bot
> > Changes v3:
> > - Major fix to the ETDM code
> > - Add duplex support
> > - Improve Kconfig setup
> > - Rework and improve YAML schema
> > Changes v2:
> > - Fix wrong edit in MAINTAINERS file
>
>

