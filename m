Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06345C2BD09
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 12:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ryvr8s3n24BsAODCzxgbGJ2w9hKSHLd//YXsMR2ZNo=; b=Nt0ushZJCQmiHTmfY8Gblskijl
	YdL7MTB/hq/d07dnSnc91IGVjm+n3CzuIfL4/rjV9xPJh7WAotgqV5tzTRSQe848RSti0gceLpQfp
	7cagPU2OClz3NCbm9JvyUUlUZYTrr9/UwK5mzgilZvDWshiZskjBgA9PrQ51H75sr9woLykNPug6Z
	AE5OOg97CU1rJS+Eq4igBBEiQOEMdY/W9S8tTaHLfY0/RakRiwIPk1NK/uXA50rzuS4IKqRarDXUN
	4qZ38JI0GzOiD6+Uufb4GZ2sotQuTNFAUAf7fTxg7ZaPzNm277W/bIdFnjScMIg1kVFwiyqoLHGXZ
	+iu0n4Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMocJ-0000000ANhJ-2Wdx;
	Thu, 27 Jun 2024 12:52:47 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMobq-0000000ANYB-2jSe
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Jun 2024 12:52:37 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6f9398390fcso2647207a34.3
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Jun 2024 05:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719492736; x=1720097536; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ryvr8s3n24BsAODCzxgbGJ2w9hKSHLd//YXsMR2ZNo=;
        b=yc1UHVrCg49YyXhMW+vsdW2sxhrmayLmCenldiRs27wbHlf+I8rEW2nASbIUOQ9htg
         dVLBx316ywHOm0WGUwk9Jhd4NsAvbzm/1m1RlN+TdMecBIMBBU87jx/+8w4j7Vj1CRJD
         0biChG2FMZQd60bYVSs0HmnhRU4g0FSLtB3euVQeozzkiQRFjW/AgI1syzn8w9G3wApR
         bg2gtUJwuNnbyf0CuqrTWzp5IJrOcrF+gK13D6kD/Qv+nHC9gPpIdmth9k1S9m3aq00p
         r70ol+FjbnA/NUgyRTKpdRtO7wknlymggmGtrK0pqcbDXOpdVHqrQdOoXCxZe2zOg7sN
         GfBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719492736; x=1720097536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ryvr8s3n24BsAODCzxgbGJ2w9hKSHLd//YXsMR2ZNo=;
        b=T01JKcrrWwU7fi+AjP4V/tktz58ACf5nDtZoRPA9WXYuvpJOk1P30FFGxe4/n7LGTe
         weFMr4HF3x0h55QPF5eq69QYkMVds/6O8tLwYVilsMWXKBOxehg/Xok2CEZWjHXw+h6f
         x5K/TpDXRgjpJjWAsdVNMk67gsqjCEtksEaRWY84yFPxza/f0O6bR4gbSR1TsUlIwdSB
         5H8gFoRsx6VSSVw0D/nk8DpyKXbLMEfVQFUum2Kz6ReyzMDjavALwxGVpypcKZOTvnsa
         74xAJyZqonSR+qLd+rpHA0b2dNedWnGvaVWikA0rARXIXsbsYXSojCB5LCfZvWBvTamq
         hqXg==
X-Forwarded-Encrypted: i=1; AJvYcCUpYnYsYEfxLTZB4NlEaNbAZi499StoJyQcWRMelvbesfw3BsDNFj1TaiNfZjrbWDLKf/wEud0Meaxp0zb0zjcJFh3eMaP4rGCAFDHYy94a1MPq
X-Gm-Message-State: AOJu0YzUxSaCXqSQo44ymoyjdlTU0P/fe0rnsHIL01/Qn86iWMIKrbIW
	AsePpTBACuJFV0CXf9TY2AVGZQlbCnL0r+dPC37uWp9iDcUMIWwVbzaHuSDD2127O8dYj5fGBR4
	G2SBrjYm49gutXE5JjX+rP/gUOEcuEsQFIamDgA==
X-Google-Smtp-Source: AGHT+IElPGgAHLr98QdJ64fPCzoCXcPRTlPI4/hq2ibEtctDV0vse/UXE4eyXhOsEJFVtJIcPQHhEMKweS4CMOEnALI=
X-Received: by 2002:a9d:6499:0:b0:6f8:fb33:baac with SMTP id
 46e09a7af769-700b11b2c34mr14344557a34.13.1719492736273; Thu, 27 Jun 2024
 05:52:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240627065911.4157-1-mark-pk.tsai@mediatek.com>
In-Reply-To: <20240627065911.4157-1-mark-pk.tsai@mediatek.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 27 Jun 2024 14:52:03 +0200
Message-ID: <CAHUa44GuctLUKPgGxLd3BU7GA1wTf2ir_BwJuWHbcQD_TOU5=w@mail.gmail.com>
Subject: Re: [PATCH v2] tee: optee: ffa: Fix missing-field-initializers warning
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: Sumit Garg <sumit.garg@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, yj.chiang@mediatek.com, 
	"ming-jen . chang" <ming-jen.chang@mediatek.com>, op-tee@lists.trustedfirmware.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_055218_869168_B1710DDA 
X-CRM114-Status: GOOD (  10.53  )
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

On Thu, Jun 27, 2024 at 8:59=E2=80=AFAM Mark-PK Tsai <mark-pk.tsai@mediatek=
.com> wrote:
>
> The 'missing-field-initializers' warning was reported
> when building with W=3D2.
> This patch use designated initializers for
> 'struct ffa_send_direct_data' to suppress the warning
> and clarify the initialization intent.
>
> Signed-off-by: ming-jen.chang <ming-jen.chang@mediatek.com>
> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> ---
>  drivers/tee/optee/ffa_abi.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)

I'm picking up this.

Thanks,
Jens

