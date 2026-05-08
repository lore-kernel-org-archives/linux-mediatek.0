Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF10CD342F
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 May 2026 06:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/4FF3lpn4U3kdZFpJQMnuM4WQSWu0axEirWM0lgLe8=; b=p9KPJlcKTdXFFZq5NGX0NGxt43
	ssczokn8oOKISLPC9GkaUllVpyEZ8w9sSjTi8ZUUA1iBYrtie53n/tKHT11XAdhhtjuRAEGZuWQhr
	MndBEipebUThO9HpVnngU9foj8cKbt1avYA3/EztQJXSsPv5L4SnRuRekdkne1+qxEPz7mhYim1Yh
	LiTqu2TSJS+y6Hxb88cXmybGCrLgi8qyWrPlG9l4ojy2MLFp4qF3PdGmabRKKl3Ywblw1GeOD7x1r
	JPmv4ysJvgbGSxi5oqu/RuPYetAcADyVdifytGOeVpHDJXOZTCMi8cr1Z1eNlSLrGVE2LeShYojiE
	KhfWmLjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLEoO-00000005kj2-2I4L;
	Fri, 08 May 2026 06:35:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLEoL-00000005kia-29Qq
	for linux-mediatek@bombadil.infradead.org;
	Fri, 08 May 2026 06:35:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=j/4FF3lpn4U3kdZFpJQMnuM4WQSWu0axEirWM0lgLe8=; b=qx3RISY7hHjRnVjgGGmdShu+wd
	aYuwANavVH2rmNN7Yeqcq8LgCk2w9NLD8iZqC54zyey6+fncJHSGBIy1f9i7a54SOtOldHMSJQmXB
	w7uUdA5ufZ1893PPZNVl8BYwi8FUHMZfd1a27egy6uVEsG+4uopCteWzeVq2Q6eRytHpPR+tZdk03
	DjUq8Egcfq+kgOHPSq1fG6X2+L/SSCte+jLMtuTBuKHhJYsRuPGWwvmFsgAFdKsUZK83sy2ug06bv
	Xf/+ZHQJXm2h67Cf5T6tc7E9EUfzLbNhFUqW6FjXgyYSdY4I909nRqORDiH5pq5Tmz6dE2Lo7HVRi
	NBEzi3Iw==;
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLEoG-00000005Tl6-2ILd
	for linux-mediatek@lists.infradead.org;
	Fri, 08 May 2026 06:35:44 +0000
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-130c653cce4so4748416c88.1
        for <linux-mediatek@lists.infradead.org>; Thu, 07 May 2026 23:35:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778222138; cv=none;
        d=google.com; s=arc-20240605;
        b=GvaCrsY7tetELErz+1ralBm+ah00bpErPuvdRvE1rV9LYvsbOskfuzoNSp84hMznWu
         75KB9SIn8OFi8HZ3WKhO3m59zNbn2h3Iy0LmyZkV6oJR5bc+bbSJY3+QZmgDOmQdrVGk
         G0yN+9JTLdF2BweLWmoMjmk7TEkcxlRIgYcrmP6+rpDhVBzF1thxXOqT7c8On3OTuZod
         ACmAnrJdNf0mDgRdPU2JH6Cpht9bonRcQk32KTLUIXQgb7w8nAjwcQ/LDD3Y9yfOqJPS
         PjZmb49+4rNILgy/+3zq+GegObzGzVi9LTc8TU8Mle6Wnky0rDy8kepIMooW0kQUpQsV
         gqYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j/4FF3lpn4U3kdZFpJQMnuM4WQSWu0axEirWM0lgLe8=;
        fh=U3Ktisi+xInrRirBPtP+r2etzia0ISTjjf92jSYKWMY=;
        b=clo3NycOk3LkxMTrVA3f7Hd3o6zVdV4W+EYTGfRiMiv5iso6Yve3egGoEPmpLT5/7p
         JF8+LfYy41b+SoubzFQ4kcV+gkG9BDGTk5mYZRQSrnZiDGyee273mlMz9Q3fgv5OSuMH
         EMKc1s1qhDj4juCSOowFqy1TBGdKx2uH6NzTo8siUc3g+gng4tsnm4J0hgM4z75EE9MS
         IcS8r8nEl3/vgW+lQPfl4+3wDicQC6Ad7feA+Uc7PLZBdsG2fgFncrKbth6+rPaH8j+4
         Gpjf97/L4MUHvQBjaCuYyjBOAx+9STrXPfbPhKV+OPYfkZWVJyd4Jsk8gCsrmlhmgkS8
         CYyg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778222138; x=1778826938; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j/4FF3lpn4U3kdZFpJQMnuM4WQSWu0axEirWM0lgLe8=;
        b=diOxccO6W9RvHxSdqCiPqL6CxrcM5Wx1mHWiZPa4dly8zAJoDPc6XSuvbyyHxCLQrv
         WZB9mX/zO2xrnq0ZRGUuJY5K0Vyh16Cfdl4wMjkUMme7jHwhNJdYL09xuvpTPdzehukG
         fM7/HTYGurXZq2YyMxwlT/bj9e3O8hxGjNp1qMhEqRMsVQUAjQSZTl/Wzv5gXk5XEhNh
         jHGPSFSCa2TzAYDRrwSZQYhkQyfKa0SEOxiFpN7UsfPxclaCjrG4ZJwMsJow2STh/2/+
         Q8o9M1NNNQeEdi+J4zZ5NjCdoD7Am9/ipiBNUc51zRD4VWiV80hmyhVtbvO70QJ+3Ah0
         d9LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778222138; x=1778826938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j/4FF3lpn4U3kdZFpJQMnuM4WQSWu0axEirWM0lgLe8=;
        b=SODiRFO+detMSAWPXFJR1TBSsDVSEVtCpHePE5wGveelKNC9fnuwt1d2ZDC0TP8vMw
         7RejpRlCTFlQAc+cHFvocE3LPYlEltZEMX0UDTdgr2iqBWAV3kzLNVsaxSpce8UwW/HB
         ZS5ZRDp4kDwSYpB+qjiMV+5mcWYfr38TYKbaIdCScjJuccrRtxu6yPzZ8YbYK8MUFAkM
         fmclv+o+E/2DWHkppu/WGsxBNvAayNSizQZvoSGZrz3EHwzk+vNJfuZOmZ1rNMqfnGd4
         MqYH6YJstdT0iCcgro0U99TwryP0LBpN768RuMqzuKzo57LGtPkuwIkWvVPdXNVLqlBy
         c8eg==
X-Forwarded-Encrypted: i=1; AFNElJ/7QwDeW9jMISpVdzA+3JjtTL312pchh90Q1elOLuT2ADzqq9p7DLff59BMGJq/uuONP3+82Y1LQWCsJmyLow==@lists.infradead.org
X-Gm-Message-State: AOJu0YyPVNlfVVL4FjYRNaurpuHZe0vMCdi/jBB8uAqF/oed1QptL2ZF
	WDjI3WgJRa5WZOzDTABMb8Z1wEOCJjWIprhpPBuPwxMADfRsxES2DPatq23kpjguQwnA7u2HSPq
	l+tVo6HSjJR+xDh5d1jPW8/lPjumH6Xs=
X-Gm-Gg: AeBDietKfSCJUbIy+S0MZX7CTBxfvtuvOZV9tdaQF5+kwJWeY1CLtQzugsFiRl0wAde
	v2exGH1HptVxuohTJmZY5U+WFoRQfcpSsjdV003FgHIDQpCz3GRzG+hUBqbki+MYMRfCHU+N2lX
	FJlnulStpN3FJ0/5bhnxoL3H1SYiP+mth/TkXpNkPyUWcCxC8lCanGzQeQO8epTZW1/VYC7Hdly
	8slytNBC2cXSAePdKxA+F9uK0/ndnFw3hqM0QsmQMSRiNaOyG3tJkVJblF07hnwljFUXZFIElRE
	BpHg
X-Received: by 2002:a05:7022:458c:b0:130:68a1:a235 with SMTP id
 a92af1059eb24-1319cd28b14mr5907466c88.27.1778222138006; Thu, 07 May 2026
 23:35:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260508042724.1719688-1-rosenp@gmail.com>
In-Reply-To: <20260508042724.1719688-1-rosenp@gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 8 May 2026 08:35:25 +0200
X-Gm-Features: AVHnY4I2qz6ZfLEbNWMvqoeN4VgOUktVtsN6fAD2YG5vKdnwfzStpYrnkcS9vyI
Message-ID: <CAMhs-H-mqXXjnj68gHU5uZheCq0u89awLY7gYK8t=c5KzPtzUg@mail.gmail.com>
Subject: Re: [PATCH] mips: ralink: mt7621: add missing __iomem
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-mips@vger.kernel.org, John Crispin <john@phrozen.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chuanhong Guo <gch981213@gmail.com>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_073542_077076_A101F208 
X-CRM114-Status: UNSURE (   9.32  )
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

On Fri, May 8, 2026 at 6:27=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrote=
:
>
> raw_readl and writel calls expect pointers annotated with __iomem.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild/202211060456.cnV6IK6G-lkp@intel=
.com/
> Fixes: cc19db8b312a ("MIPS: ralink: mt7621: do memory detection on KSEG1"=
)
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  arch/mips/ralink/mt7621.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

