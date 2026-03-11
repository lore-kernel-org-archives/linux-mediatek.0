Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04203FCC9B0
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2026 05:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HsZ0aj30QzrWxLy9ik/IeJVQ3KkElzxj0uQiMmN5kNQ=; b=I/a+PfSLsmLKndTGTM/K6pu4RF
	zk7BOWxByHGeqaSWf7jmUvGOIi7pF/tqDq+4Gcn8YAKYb62yPbK2IifIL9MsjOxGPLZVMSj+Cvt3h
	djhCTM8NBQLBw9OZ26FlSBD8KcRnfN7cajtS94VYyzgyYh8OOLL/FbeliyxBdI2j2qVr9uh+l4ui9
	OYekwfGYAJ66ogdrNZ4ZZSv9d/Qj9k1FBHfNK6Cw1pCV/zlpkYq1y2GK9sKYTUWgWbDb9nSSNhjKe
	gkjDQRRMmdtv14f5g62qlkOeObzfVEEYacnsgNOd3jlPxsRrzs5zmaPuiWT1UuHXwSmkg64jL6Zvp
	jXZCaWpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0CLY-0000000Ap97-0CFV;
	Wed, 11 Mar 2026 05:43:04 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0CLV-0000000Ap7f-2T5U
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Mar 2026 05:43:03 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c73c990a96dso415682a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2026 22:43:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773207780; cv=none;
        d=google.com; s=arc-20240605;
        b=EJ2UiLUEgVbu7VziSwtRlFwOTY4nM/j3S00KwBjElt6ITmpnsLcNs7u4hogQJfEgCh
         FH++7++JFfDexXW9v/ooaAPUaRyHTcp9HT0KVH/z6BcQCUavm3fkSPp9qPNYh9x8e76/
         Of0ALfotxkcWey6kQM5RLgRWuNdiSc5vI7nThSItgT3bK5IxJu+zQMGy5zFphg68OPK9
         YFjiTOrBr3GqXj3nZwA98PpNjmaSRAngqaGXW+EvlaQfH8yIorBGQQZ3mPvNB4mxbg+t
         X2wu63sN9gDeMRJYUQtdfd5FnMPRAZA72OEjIwtMP5cA/0MDzqEZlZg7FHBeOmuqvJiW
         Wuow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HsZ0aj30QzrWxLy9ik/IeJVQ3KkElzxj0uQiMmN5kNQ=;
        fh=cnPTH8imgjPm1BTXIKbyTidLVOedg2rQAeBZxpaieGY=;
        b=G9iFTbsPAYZ4hdpZnmSXpxXJO7fFXpCJ9dIEvmQgt8UlyecrHlRAWgiKWV+fCHxoy8
         LQhWtqz1p/NjF15ncm1ztFnAmTDEuuiHAjJSO9ju9+zuZV0c6udAqR0IHVkedQJSVv43
         Sfatfz/9aKej5Z1xT/6QC//KS3lCVHGzW6yuMnRbG2rCHEf3KZO3eBXA1zE37sBiTYo9
         vLDO5lllhkuWTfEi3naOnhRnsUQwRcEZa+elJNzV6DEcuPUWyY99x3CN/Cb8hlwxZH8y
         9AmEb48Taje47a5FEr4nSUbPKLY7Wbxj0AzmSDGsoPhBUoEP5ljum8IpXq8BcNYiVlhx
         vfMA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773207780; x=1773812580; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HsZ0aj30QzrWxLy9ik/IeJVQ3KkElzxj0uQiMmN5kNQ=;
        b=USjyqUgGQEu6t8WKvZnDywclQzwVYhxvNsPyTbjyI9qHRVsn6HWmxhTqW2liZThqet
         u9di9n5rLFWT26zhdjyqi9cJQJCKiwpD+tP8O49uuJ+EqnW16QwKDin31oB4BQGugoy8
         ZCr8sXBROkAt8RRmVm6JmV34te4Sv0iHgYlbokuOHGfjOEJ1mPl/Nq3m2TCvGYnGl1Bf
         BebekAhemQtxcGOtZSadVRaGLnM7RnyTI2x7DrCiuWfHVXsOju1qC/N5nRUUf7mBwiWy
         Mxg36D9i/DWJRu1mmDK1UdoUaNFb2cQxH9kfyW45rHBgoS8dyFyniatD8tl7WSzZHSiG
         ql7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773207780; x=1773812580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HsZ0aj30QzrWxLy9ik/IeJVQ3KkElzxj0uQiMmN5kNQ=;
        b=fF9ZSAca+ioCSc2ezczwANcu/CIHr9kh3jS0KEDbQD1RldrkeJJ3azMCzXrmt74yuM
         NKvQXBAxY+ccpnmCRp6iJ3+OgyD0I755DLzvb1tZX47E3IV/xOFadznP0FWH9dJlIkoW
         xsE6/TWKDwddx0fAY1sTEJRMesqV4SlPSIZ4CwgMxnoS5skecpCw3uwSpL6GcDVuF63n
         uohXUoxHv+CPGt7v8vmQVnTzKJVEIeS8nYRO08YdDL2PYzLZQYupuvl6xq2UvEWoS+wm
         TYKW0NinkUnL2CMIlfAqyfuw9A2r0y4QWnpB7L/Xo7jOvR1HsM3i1Cgp+vwzwEdHaKbZ
         zYXA==
X-Forwarded-Encrypted: i=1; AJvYcCV5uKPyCbX8yuxX33u1ps0unNCKy4fkQLDzMNlEIfRwkJkpk53yaByrSQ7v8JkVEe7uC1/BsyvUFy0vRItl/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwTcMnlFsbBblWOEi8okRbHOiPKqQICHH5fOPu4wHpWQvgfn6ik
	vFpRXWHG6bAJUjgViix+R1L0qU1qgXMPGoATA0KFGgq+dcnstd74QxVbE6p7ZGHrDVsw0s6olvV
	DyBWuiePUGRuYvBqndn8Ou55RbGO4vw==
X-Gm-Gg: ATEYQzyzz8ee1kx+bBFiydmqt/+MI6c3kXj6NCJmKrDBitMAxsRGT2M8f9EVLahNJmR
	xIj1Fn+ecIJ8LXyukaALTnv5K2SKBmif5xO/U1vI1rn7Cfv1D79zFK9NND4lTvFaY1/INxQlLFj
	+OPtccspNV+sLH4kywvVNfHOQ+koTJunug+HfOkzs1z+L4qRZNn80neT1e6cvdX/aVgGRRixxM5
	3q8Y9YR8hKfJLRVAnakawppouQEeOcroK7MQgsPHipEv60t3d8mBLia5Eff8RvkYsnSJuxaCp65
	6QA2Uq6TU+q56chcXhhtFRPFrN4yLTv57H4hD0wWhv3d9v77CcFDm4Nio3NGLmN8rLRR
X-Received: by 2002:a05:6a21:458f:b0:398:791a:9caa with SMTP id
 adf61e73a8af0-398c5ec806amr1236794637.18.1773207780121; Tue, 10 Mar 2026
 22:43:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
In-Reply-To: <20260310200513.2162018-1-sanjayembedded@gmail.com>
From: Luka Gejak <lukagejak5@gmail.com>
Date: Wed, 11 Mar 2026 06:42:48 +0100
X-Gm-Features: AaiRm53yOPVigtTBWqUrHQSRYbaimfIQ_tKWwOGhPWuEPWqnKrEs0Ob5KWiVmFM
Message-ID: <CADRnA90=F5rRtWWJtSg7mA_QLzQa5Fzh3s2RzXDJtOOTiitzrQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] drivers: Simplify cleanup paths using __free
To: Sanjay Chitroda <sanjayembeddedse@gmail.com>
Cc: jic23@kernel.org, m.tretter@pengutronix.de, mchehab@kernel.org, 
	p.zabel@pengutronix.de, tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com, 
	yunfei.dong@mediatek.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, johan@kernel.org, elder@kernel.org, 
	gregkh@linuxfoundation.org, pure.logic@nexus-software.ie, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	kernel@pengutronix.de, kees@kernel.org, nabijaczleweli@nabijaczleweli.xyz, 
	marcelo.schmitt1@gmail.com, maudspierings@gocontroll.com, 
	hverkuil+cisco@kernel.org, ribalda@chromium.org, straube.linux@gmail.com, 
	dan.carpenter@linaro.org, ethantidmore06@gmail.com, 
	samasth.norway.ananda@oracle.com, karanja99erick@gmail.com, 
	s9430939@naver.com, tglx@kernel.org, mingo@kernel.org, 
	sun.jian.kdev@gmail.com, weibu@redadmin.org, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_224301_637591_E8192A67 
X-CRM114-Status: GOOD (  14.94  )
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

Dear Sanjay,
Would you mind explaining why you put so many people into TO and CC
fields when sending patch series. You should stick to maintainers and
reviewers from maintainers file as others can still see it on the
mailing list(that's why you CC kernel mailing.list related emails).
Sincerely Luka Gejak
P.S. If you are including me in further discussions or patch series
please use luka.gejak@linux.dev instead of lukagejak5@gmail.com.
Thanks in advance.

On Tue, Mar 10, 2026 at 9:05=E2=80=AFPM Sanjay Chitroda
<sanjayembeddedse@gmail.com> wrote:
>
> From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
>
> Hi all,
>
> This patch series replaces manual cleanup and explicit kfree() calls with
> the __free attribute from <linux/cleanup.h>. This modernizes the memory
> management style and simplifies common error paths without altering any
> functional behavior.
>
> The __free attribute provides automatic scope-based cleanup, making
> resource management clearer and reducing the chances of missing cleanup
> on early returns.
>
> No functional changes are intended in this series.
>
> Testing:
>   - Compiled with W=3D1
>   - Build-tested on i86_64
>
> Based on:
>   <linux-v7.0-rc2>
>
> Feel free to share your valuable input in context of the cleanup API.
>
> Thanks,
> Sanjay Chitroda
>
> Sanjay Chitroda (7):
>   staging: greybus: simplify cleanup using __free
>   iio: ssp_sensors: simplify cleanup using __free
>   iio: st_sensors: simplify cleanup using __free
>   media: mediatek: vcodec: simplify cleanup using __free
>   media: chips-media: coda: simplify cleanup using __free
>   media: allegro: simplify cleanup using __free
>   staging: rtl8723bs: simplify cleanup using __free
>
>  drivers/iio/common/ssp_sensors/ssp_spi.c      |  9 +-
>  .../iio/common/st_sensors/st_sensors_core.c   |  7 +-
>  .../media/platform/allegro-dvt/allegro-core.c | 95 +++++--------------
>  .../platform/chips-media/coda/coda-bit.c      |  4 +-
>  .../platform/chips-media/coda/coda-jpeg.c     | 39 ++++----
>  .../mediatek/vcodec/common/mtk_vcodec_dbgfs.c |  3 +-
>  drivers/staging/greybus/camera.c              | 27 ++----
>  drivers/staging/greybus/loopback.c            | 35 +++-----
>  drivers/staging/greybus/raw.c                 |  6 +-
>  .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 13 +--
>  drivers/staging/rtl8723bs/hal/sdio_ops.c      | 37 ++------
>  11 files changed, 78 insertions(+), 197 deletions(-)
>
> --
> 2.34.1
>

