Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EED2C77B6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Apr 2023 07:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EPgTIbc3EmpS1tMla467skczJbzj4giN96ys9JA7Z/0=; b=n753IvVm9r4xZrdPzok+UV4XCw
	b0VCy0tPKiasEwmadK48//jvXeW8VrIFqlbEkOFajDWF5f9/mbR/jDNiu6WkVY4wJorMTV3jqbYIB
	fhQ7qdGTdZ7bmKpX39InZ1qy5ibDl6PM60DFHV3bgcP7Sxpv4PBLLloLKXByplyGeONxVPqYkv4Y5
	hxUW5HaHE/f81VFwHdOwi1C/gMLrP6T4MmgVhV1N/KgcM0sCspZX9Lk8xwfCJNVTS7jje0iuKt8wt
	RRJIiJYZnrNIJS2cZf4xSn+zcSuug8+RsSYFmkFwOhk6P+uaNmqi0YOPAlIzGAlcR0M0YY9BBNjcp
	KDZ39MzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnDil-008WvU-2t;
	Fri, 14 Apr 2023 07:19:47 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnDij-008WuM-2g
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Apr 2023 07:19:47 +0000
Received: by mail-yb1-xb32.google.com with SMTP id y16so2840144ybb.2
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Apr 2023 00:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681456784; x=1684048784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EPgTIbc3EmpS1tMla467skczJbzj4giN96ys9JA7Z/0=;
        b=cpzjVOhBclo5s7FOOCTsY9OXyCmdSzWInAqJyhp5jNfDqdTp2N2ndOvxaEirmRdSf6
         zjaJBiCEDcSvMGPu1p1UOKpttTZ/o1lXjrjpYKd+lubBYRMFfvK653NH0n95uAsnzuuH
         zQJowLAx7ESro4J0VCC1EyOUFhLUePYJIcxYT5el3eqOsRQtcf5Js6koa3/Ohb0EafTP
         XrAss8mrfMvjUKBN/eqzobuLLn+Sdh2d9cz1Ax/JvZjSF+KDm3GN7Z2y3Bkk3kZTlEGR
         QG0ogOVqT3BCmwv6whN5FGfNsrQcIs6oDLXTmSn0SdMVKQRJmamkS0Jo05FzQKUjt0yK
         /hug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681456784; x=1684048784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EPgTIbc3EmpS1tMla467skczJbzj4giN96ys9JA7Z/0=;
        b=bWUQhDg8Cx74w9k5ltvT6hFwNyumrnvMi1fD4XYjPq0AquBlN5J+nJbEKEkjd3EPqb
         RIhLeSA64UTcZC0/C4KLbDZtLPdp2n1KYvkkJlI4xq1YMZAXJjBJYE/qa/78d+lrCJc0
         LppMlII1steJlbF8vv58uAQDV7qBAbkIv9S1hmhGDcoLvjOg7wNbQBWVHx2SL6OtKe6I
         FDu1Qaz/fjN/WTwk8JzAHLDHblT1bfGUqlzgssr4wFopnQ1nI+LaH4onscVlQS2yN7xX
         Lbq3+ubknrtxKOOFJLKR44Ss6v47yKtzjzhrzWUrNbraqrLs7vVBg9cMDOSXK+6fj616
         BHXw==
X-Gm-Message-State: AAQBX9eCh9tw6/mqlX5akT6ivPtS4m8HYHMrwuQq84o1ywbS/n5KU24D
	T1WTM7PsWvgh8EHPQSU0chwPvJ35eOFk24iDp5fB1A==
X-Google-Smtp-Source: AKy350YKBDdF1IQraLtOT04N0F8XhTSVbdBO27R039XWq6ktIy204ErJfr84QLAyzDRtp3dBfvTyD07G8R9iSV9ap+s=
X-Received: by 2002:a25:d44a:0:b0:b8e:fbcb:d6ef with SMTP id
 m71-20020a25d44a000000b00b8efbcbd6efmr3297133ybf.4.1681456784107; Fri, 14 Apr
 2023 00:19:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230414061031.141430-1-haibo.li@mediatek.com>
In-Reply-To: <20230414061031.141430-1-haibo.li@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Apr 2023 09:19:32 +0200
Message-ID: <CACRpkdZf0vQL9bJtGaKfn0wBPTQTZWsg0G7UTB1dmXhfi_2KmA@mail.gmail.com>
Subject: Re: [PATCH v3] ARM:unwind:fix unwind abort for uleb128 case
To: Haibo Li <haibo.li@mediatek.com>
Cc: Russell King <linux@armlinux.org.uk>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, amergnat@baylibre.com, 
	linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
	xiaoming.yu@mediatek.com, Russell King <rmk+kernel@armlinux.org.uk>, 
	Alex Sverdlin <alexander.sverdlin@nokia.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, ardb@kernel.org, catalin.marinas@arm.com, 
	a.anurag@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_001945_909552_AE03C4F9 
X-CRM114-Status: GOOD (  11.82  )
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

On Fri, Apr 14, 2023 at 8:10=E2=80=AFAM Haibo Li <haibo.li@mediatek.com> wr=
ote:

> When unwind instruction is 0xb2,the subsequent instructions
> are uleb128 bytes.
> For now,it uses only the first uleb128 byte in code.
>
> For vsp increments of 0x204~0x400,use one uleb128 byte like below:
> 0xc06a00e4 <unwind_test_work>: 0x80b27fac
>   Compact model index: 0
>   0xb2 0x7f vsp =3D vsp + 1024
>   0xac      pop {r4, r5, r6, r7, r8, r14}
>
> For vsp increments larger than 0x400,use two uleb128 bytes like below:
> 0xc06a00e4 <unwind_test_work>: @0xc0cc9e0c
>   Compact model index: 1
>   0xb2 0x81 0x01 vsp =3D vsp + 1032
>   0xac      pop {r4, r5, r6, r7, r8, r14}
> The unwind works well since the decoded uleb128 byte is also 0x81.
>
> For vsp increments larger than 0x600,use two uleb128 bytes like below:
> 0xc06a00e4 <unwind_test_work>: @0xc0cc9e0c
>   Compact model index: 1
>   0xb2 0x81 0x02 vsp =3D vsp + 1544
>   0xac      pop {r4, r5, r6, r7, r8, r14}
> In this case,the decoded uleb128 result is 0x101(vsp=3D0x204+(0x101<<2)).
> While the uleb128 used in code is 0x81(vsp=3D0x204+(0x81<<2)).
> The unwind aborts at this frame since it gets incorrect vsp.
>
> To fix this,add uleb128 decode to cover all the above case.
>
> Signed-off-by: Haibo Li <haibo.li@mediatek.com>

Way to go, remember to collect all the Reviewed-by tags before
you put the patch into Russell's patch tracker.

Yours,
Linus Walleij

