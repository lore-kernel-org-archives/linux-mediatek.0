Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86082C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 19:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gx7Qbwbw1yo7BMDjAtfm3wF0NRj9/Fo9SusIzKAtGl8=; b=Snnvhua6+XkO6f
	Q/WF/s1EOvuN2/4jbkNgSb+b8lAY+ru3IQgUPoaIwciGqABGnlLEHVpujolH24CDibgFNxLW4FK7h
	O0BKADF3SuErZdGj1eavuJ2yMA3oocAqFEfDAoYrET6j2c4rBIQ+qZtlVxnxY8cBHi4h/L5aBrVdL
	99NJzsbnw7FJpInbZTTV+XIVEUPjCn0jKdGlBkw6sY5ztqk4uCIm9/BuHOdl9C9N39i/cslm7GHYN
	NkaxAZUQLlgcWVE6yGrwWIzXPKVOMJBgrTaifiDRwXxBi1OlXL51KK2VQKHG4VZe+BbIvaQr++NY9
	+CjP4k/RSmIMEeoQu9/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns8lW-00EOXZ-3j; Fri, 20 May 2022 19:58:26 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns8lK-00EOUc-7s; Fri, 20 May 2022 19:58:15 +0000
Received: by mail-lf1-x142.google.com with SMTP id u23so16115390lfc.1;
 Fri, 20 May 2022 12:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WOJusE8NHNqjKMNStmuZRo9RH3cwXzoVFMfF94/t6Ck=;
 b=bQ+WBLuzBq3aGizqD1+Kwm5uAKpENycXAljdLzTGsAaeq+eESfeAhCSUpZDT5IDNb+
 P9zTFv7zoTRkmT/uwyhlZyXGFyiERjKOPBEBQWG4V9rlz1NhEyOqJTV5P3IKQAqYnxva
 zVb6UFNRlCa1blmb2JCzrbWtoKSq9JCYY/sYf8dT32VU3RaA+dRV/Nq6TJYgh6kmh5LD
 kSmEw+or1PbtqHPMBqBSOAbmKlV0V+u4GmL78rngDoFH2mA1oDxVQT4Iih9170vjUhFw
 ebTXGxF75uA7HdFslnlPt6emZADNR7A8pIHxil/1PZB17Xr8krOhd2E1J1pblpk+5/Ar
 NAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WOJusE8NHNqjKMNStmuZRo9RH3cwXzoVFMfF94/t6Ck=;
 b=ZjsQLY2Umcr9ar/jSKIxtxg8uOVed3Ez02ozNs0rV/9LyzB7F2YGbME4nTfjUhDylI
 eI5dzb/HyYrM2bXs6/kCFOJNqK8IsPcFOyb/rYcqSzh9sdGcu6/3jaBwIKwJhWU7UKqS
 2AJii/ywmlz5jcdL4LvuL9P7A+VELTPEoDkebovGEQttiddHRKz+AQh2V5QfxqL54f97
 RPB16d+IJXZmizYRH6xUCOzjUo6XGnvHmk7CexYCnisoxFvpccWnUfFJxZ7SZ0RdVKf9
 1MQJIWoq5KliKBrB4zz6I5Sz/pPGvASBG49P2hlCKRzHrM28tVjOmBUbQX1XNVmnFYXz
 Br0Q==
X-Gm-Message-State: AOAM5337cw6hZ4VOgaNq0UE62RUNH9QMELsknjP9cin6mBgGMJaZaSyh
 UyGwfAS7/SODmgPPbhW0nmc=
X-Google-Smtp-Source: ABdhPJzUt2asX4E8YYHlbCTQJA7I8CTGGnYx5OzSOW/hCyHXdcIZDrwis8BM2kQq338jS7Wsy2a/7A==
X-Received: by 2002:a05:6512:5cb:b0:472:f7e:a5f5 with SMTP id
 o11-20020a05651205cb00b004720f7ea5f5mr7867956lfo.358.1653076689178; 
 Fri, 20 May 2022 12:58:09 -0700 (PDT)
Received: from pc ([104.28.198.246]) by smtp.gmail.com with ESMTPSA id
 u5-20020a2e8545000000b0024f3d1dae7csm422051ljj.4.2022.05.20.12.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 12:58:08 -0700 (PDT)
Date: Fri, 20 May 2022 22:58:03 +0300
From: Boris Lysov <arz65xx@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Miles Chen <miles.chen@mediatek.com>,
 bgolaszewski@baylibre.com, chun-jie.chen@mediatek.com, ck.hu@mediatek.com,
 devicetree@vger.kernel.org, fparent@baylibre.com, ikjn@chromium.org,
 jason-jh.lin@mediatek.com, kernel@collabora.com,
 konrad.dybcio@somainline.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 marijn.suijten@somainline.org, martin.botka@somainline.org,
 matthias.bgg@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de,
 paul.bouchara@somainline.org, phone-devel@vger.kernel.org,
 rex-bc.chen@mediatek.com, robh+dt@kernel.org, sam.shih@mediatek.com,
 sboyd@kernel.org, tinghan.shen@mediatek.com, weiyi.lu@mediatek.com,
 y.oudjana@protonmail.com, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 7/7] clk: mediatek: Add MediaTek Helio X10 MT6795
 clock drivers
Message-ID: <20220520225803.193bcda9@pc>
In-Reply-To: <a253f338-c162-17b8-f412-95cd63195151@collabora.com>
References: <20220518111652.223727-8-angelogioacchino.delregno@collabora.com>
 <20220519045340.11198-1-miles.chen@mediatek.com>
 <11bf21cd-85c4-f64c-2af7-7695e71aee07@collabora.com>
 <CAGXv+5H4gF5GXzfk8mjkG4Kry8uCs1CQbKoViBuc9LC+XdHH=A@mail.gmail.com>
 <a253f338-c162-17b8-f412-95cd63195151@collabora.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_125814_328970_6CB57154 
X-CRM114-Status: GOOD (  22.26  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello, I'd like to chime in with some feedback.

> >> Hence, the usecases for this kind of splitting are:
> >> 1. Somewhat rare (corner) cases: someone may not want to compile in any of
> >> the mm/venc/vdec/mfg clock drivers because they don't need the
> >> functionality at all (probably, including the other related drivers), or;
> >> 2. It would be possible to compile as built-in only the "main" drivers
> >> (apmixed, infra, peri, topck) to achieve a boot (ex.: you need eMMC to
> >> boot, at least) and then compile the mm/venc/vdec/mfg as modules to be
> >> loaded after mounting a rootfs (where you probably also have mediatek-drm,
> >> vcodec, etc as modules).
> > 
> > I assume you mean split them into two groups:
> > 
> >    - essential for booting to a state capable of loading modules from
> > storage So apmixedsys + topckgen + infra_ao + peri_ao + imp_iic_wrap
> > (maybe?)
> >    - everything else
> { snip }
> > IMO having two Kconfig symbols for one chip is still much better than
> > having ten though.
This sounds good.

I think it would've been even better if selecting a Kconfig option like
MACH_MT6795 would automatically select the base clock driver for booting to a
state capable of loading modules from storage. But a quick check showed me that
arm64 doesn't use such an approach unlike arm.

> For MT8195... and 92, 83, 73... and others from the same era, being them for
> chromebooks, iot, smartphones and whatever else... yeah you're totally right.
> 
> The issue starts raising when looking at older SoCs featuring an older
> bootloader that does have a kernel size limitation; for example, to make the
> loader happy on MT6795, I had to strip the defconfig a lot and keep the
> Android-style boot.img smaller than 10MB (that's Image.gz-dtb + ramdisk).
This issue gets even more relevant if/when we consider older ARM32 SoCs such as
mt65xx series. As far as I know, most of them (with a notable exception of
mt6580) have bootloaders that restrict max boot.img size to 6144 kB.

However, I think too much granularity in Kconfig might cause unnecessary
confusion. The "essential clock infra" + "everything else" split sounds better
to me.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
