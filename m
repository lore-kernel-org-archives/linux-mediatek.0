Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F377CA1016
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Sep 2025 08:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RuBL8uqFp6SRqtjWGK32//PnPpBAxLJ8lgwayga7/Cw=; b=r8zB68/szufPAlhpHqsJT+XXIe
	ehA/jtf7H/WVpFRfDn7KwcPnJKRbp3t44HfY4OG9AGxhCymtrgvzg7qNa/ICLzGPVFlO069mQyjk3
	iqYwhEGDoN2Qkf6gTQpQRP8AmQxS5fwr2dTFs21GwlgCzoFtmD1TDV6DMt60X3Jbo+LAMv/WsgQpf
	NqJsJKHVvdcwWbnTyxVCiVPeyOovO39QwkZ9dPA0NGNsW4AkYmf3CxqICLbR7l2FAcJjG0fyecDrs
	CjykUGKEAXPILxURz15igPRQ/W/pziXq8y6VohQ0DnQ38Gf40si1InoAKlTkKYc754cjo9XJCWhyx
	8nF9XFNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcuo-00000001tRm-44Mg;
	Thu, 11 Sep 2025 08:44:26 +0000
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcum-00000001tQd-1Fur
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Sep 2025 08:44:25 +0000
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-8902ee514deso330471241.1
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Sep 2025 01:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757580263; x=1758185063; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RuBL8uqFp6SRqtjWGK32//PnPpBAxLJ8lgwayga7/Cw=;
        b=NLDTesvhtPNEkVMia/h+x6Oha1rr7TdrFWesV0BdVUEg/0SU0nfN68C2Epss8/faYC
         UMspWwjnMqvKBWEs1JNDdpYR5VvqM0Y1UZ906nwM2Fl5sUeOg9k+Mz0v8W8D1iE62C2O
         XFVAFbQq2+/pId0n6C6fbQ0trf1WhX0LNYot4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757580263; x=1758185063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RuBL8uqFp6SRqtjWGK32//PnPpBAxLJ8lgwayga7/Cw=;
        b=enDvlza+jHHmgG1dWaMoyqtDmFekKUB39SmlM078DyKDON0giqhchlufXHwm0lBD6+
         39c2Va/1xf7hceq9mYfw9G8ANk7IvqKAE30w4o4PQDDqHCLeZDCrNfmLojqKobo6Narh
         fhB/HZQ0cqDsavhTZoqMWsHzZ3EoY3tTeZunwd+0L+rSIAGPdYKRbwW0b0QF7N9iVqdv
         4Ut/1/bUKQW8jrEy7mgJKUUiWCVwVMeqkLVrVJdX6E886JCMs0Q/KTpla9qfUkwYNLab
         aiR9a/g5Z7c1c16G3ArHjJMRf0Pic58M7x7oehc7MfX200pKC8wFoeUm1R+5t+I/E78j
         6Adw==
X-Forwarded-Encrypted: i=1; AJvYcCXV1K5nLV1zemGn4zoxL1jaQAv8w+RO1O5ZFegU42d89288yxZYMlqm47Ocq7FHJiO9KUiz6LXeP+K4bIU4NQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxmhhmM/oOy8V4ueqVaQtw1pohrdt/3lwgdMGsN7cMfBXD/+pqs
	QwUFa1lSzEGBLP8pY6ORWrGT/1yUYXTIOM4vnjuzG7FPU2+VP/RpuKFm/Q1Pseoa79hQ4obQq6+
	Pl/o=
X-Gm-Gg: ASbGncvEMkjFnDC70VZFBN9vbh5iY4H2XavaX2T9hvPf6Ov7ubbuBaein8kplA25rFQ
	8cbmCDPVi8IHWRkKIT/hanmT3Pk64Eu3eSeiYr2llMQeDy0l05uA0st17J1sZotTpQU1GB1DMGo
	/xc9wjZa7mtuzb2B9W+VLV3iyvIseRqVSGaJjywFKoRD/QVnb1XzBp9K1NGysaYRVxQP6w12VhM
	6gBBz+//5P8cFMbWrsHM9WCIauRoynmBq+7OmWvHfiImjLoZo+G3mpASS97+tprYNrkJHdp2u4f
	1puCn8vgIS/Idhy9jL8bL/JlmgUZf7jLT2TIMfTny2X974RQ5iMfs9qThBorfzZlsIrTo7tZMhd
	ngPtRI7W9tzBf+hDGh6Qv6zsWvLLsnWjwguHaea3qdkavwJcGfXtW0NgbCQ==
X-Google-Smtp-Source: AGHT+IHm10D8dUAwbPLicr3RCvE1iUk7BibaJDXovt3/nzvYAH8zkWY3CFegb1v/og06LGuLG0GvhA==
X-Received: by 2002:a05:6102:4451:b0:535:2921:ff3c with SMTP id ada2fe7eead31-5520e392631mr617096137.17.1757580262764;
        Thu, 11 Sep 2025 01:44:22 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54a0d424df1sm154655e0c.27.2025.09.11.01.44.21
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 01:44:21 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-8960a3fb405so1222094241.1
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Sep 2025 01:44:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUz9VktofPgdsh80NKTC/jVXqWuy1MP8oaW6CwjAlLhrHBzEsG+CEUJLeaUIiDIrXq2WwQ9zXlzw9YP8DvdVg==@lists.infradead.org
X-Received: by 2002:a05:6102:5086:b0:4e2:a235:24d1 with SMTP id
 ada2fe7eead31-552065728bcmr950644137.4.1757580261120; Thu, 11 Sep 2025
 01:44:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250908044348.2402981-1-fshao@chromium.org> <20250910115508.0000785e@huawei.com>
In-Reply-To: <20250910115508.0000785e@huawei.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 11 Sep 2025 16:43:45 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhDRQFVBDydTq=fmC=jz8e941aPwzg+cY1ZQDqWppx+fQ@mail.gmail.com>
X-Gm-Features: AS18NWDats_rTOk_H5DcYgtjHSlZm8cS5lY_RPdvAh5_wYx68w1LGLEaew8wQCg
Message-ID: <CAC=S1nhDRQFVBDydTq=fmC=jz8e941aPwzg+cY1ZQDqWppx+fQ@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: mediatek: Use for_each_available_child_of_node_scoped()
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_014424_338062_E2258E1D 
X-CRM114-Status: GOOD (  13.85  )
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

On Wed, Sep 10, 2025 at 6:55=E2=80=AFPM Jonathan Cameron
<jonathan.cameron@huawei.com> wrote:
>
> On Mon,  8 Sep 2025 12:43:25 +0800
> Fei Shao <fshao@chromium.org> wrote:
>
> > Use scoped for_each_available_child_of_node_scoped() to remove manual
> > of_node_put() calls from early returns.
>
> There aren't any early returns here.
>
> This runs into some of the stuff that cleanup.h docs suggest we shouldn't
> do which is combining gotos and __free() magic.
> I think this case is actually fine despite that but in general worth
> thinking about the code structure and whether that can be avoided.
>
> One option would be to factor out the loop into another function then use
> and error return from that to call the stuff under the init_free label.

Fair point, I can send a v2 with that.

Thanks,
Fei

>
> Jonathan
>

