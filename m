Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5394FC7619A
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 12:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LzEJi/6tk5pX3rvqtM/K9Qaj9JOxZrENkpR1kkXBZPQ=; b=EcnCeTXBl+ltJxw5aDYyOswQqq
	UhfJi6mELEmj6bODsQlVllMDYSwYOnXIGqPgf6LjMcFiAuJ9kpWdv8qAt9Oi+Z/xHBO4IFg4TRXIi
	64ZUxvcyTikxsJCgX96MDbNtpPYqCtlqM5Q2MKdLbWX7JHuzrDJPbaxLjF0SC5mQIjOlMzVoTyxfc
	IQHHZFU1fYilHMZeaZXsOB0yaeCmFQi+xfNPwtjoUsG6ve9fSxAl8irShDfYnl9AItj8TRedfMFfO
	E1OWoKiR8sxYapbZB6GedZNI9sVpwaTacFal+IZBvgGls6eyUa9qgk20ukV7ZjfQ2mPxlLAUMj4sH
	Gjg4TKSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZXt-003580-1F;
	Wed, 12 Apr 2023 12:25:53 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZXq-00353v-2J
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Apr 2023 12:25:52 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id v7so9970268ybi.0
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Apr 2023 05:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681302347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LzEJi/6tk5pX3rvqtM/K9Qaj9JOxZrENkpR1kkXBZPQ=;
        b=kDnPZlvLJSZYe+hwhFyhgyU32uWIOLpQi4A56nIKAoa1TeQBve/7lDXHLvTG784CeG
         Vum5wVuUUHMtNCC1+3G7ULX+l+U2e1rqxjktNitrhPFLIefGdDKOWeFxPtUJlWhqziSF
         tmmTtW958l3xW8+nIS4PXrh2a6TRG0Sxl3uM0oe31mOXB7XZp1Qr7ZSJLRp7g5YJWv9W
         d3heyP/d2SdvPwRDEK4oC9Mk3ZXw9UP0LYH8UJrYaL5qlatHEbSsCjj4IDeoJmI9QgX3
         XujJ4E/VnJeLq6vts00w8m9WN/kRTEfTMhPpCR77OIOStX3OVqYl7X+bjatx+AILlp80
         n3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681302347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LzEJi/6tk5pX3rvqtM/K9Qaj9JOxZrENkpR1kkXBZPQ=;
        b=vVOnoZYkyAek7yzQElrNxBBGOdZeM7imWiKVPNyPZiopYINOg4GyGm4PqouArKG45x
         GrvwWfpsn0IQ3ciGVGWcB3wujkW4tWAcysI1TnPAgRDjdBPnS+zajXft2o8Sv2DrKu0o
         hst5vUAa1X70Kjzn8MLSdLSeJBPbvZNVGGJ9YvElGeX8cuZ3ZSxYKIRXW02Wxk1tXFlL
         cfzWuBnWvRUaS55KagOHN44If3waGd7VGjIvF1UX44wi2i7Sz+hHh+JtbET8MWFNsfTn
         z5F3rqHKgNRmLvZ8QM740E2ipPIRX7udzm9bq9MPAcTLFQe6F49On5/PmAi35PchQfO1
         QnFg==
X-Gm-Message-State: AAQBX9e+RzwhCCevKo3m94EevCkOIoI/Cx3++9kukkVWtslTy7EFoYkm
	KIEGdaHg/fOeBmxSBM6fxqURybShbYVV6HmCtXMPVg==
X-Google-Smtp-Source: AKy350Z57GqlLPmgNyWi6f+oWxoeGVJGf2h3wEN6OCQUkS1SjB47iWQWadUytlSXX6mM/d+2zS38SfwgnSiHTAw2iZI=
X-Received: by 2002:a25:7347:0:b0:b8f:892:3967 with SMTP id
 o68-20020a257347000000b00b8f08923967mr4301303ybc.4.1681302347611; Wed, 12 Apr
 2023 05:25:47 -0700 (PDT)
MIME-Version: 1.0
References: <CACRpkda8qTuCmF_RDjtp26k_DMpME=0wAPjejh4ODkUr9SxVqg@mail.gmail.com>
 <20230412024406.62187-1-haibo.li@mediatek.com>
In-Reply-To: <20230412024406.62187-1-haibo.li@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Apr 2023 14:25:36 +0200
Message-ID: <CACRpkdaYcdjkXpUZywK=oyFQdp0FWeD2sjz2ZrSYtjrBo6u+sw@mail.gmail.com>
Subject: Re: [PATCH] ARM:unwind:fix unwind abort for uleb128 case
To: Haibo Li <haibo.li@mediatek.com>
Cc: a.anurag@samsung.com, alexander.sverdlin@nokia.com, 
	angelogioacchino.delregno@collabora.com, ardb@kernel.org, 
	catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux@armlinux.org.uk, matthias.bgg@gmail.com, rmk+kernel@armlinux.org.uk, 
	xiaoming.yu@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_052550_769714_7635CA9A 
X-CRM114-Status: UNSURE (   7.15  )
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

On Wed, Apr 12, 2023 at 4:44=E2=80=AFAM Haibo Li <haibo.li@mediatek.com> wr=
ote:

> > Since we're decoding a 32 bit unsigned long maybe break the loop after =
max
> > 5 bytes (35 bits)? Or are we sure this will not happen?

> in case of some corrupted memory containing say 0xff 0xff 0xff ...,the lo=
op breaks after
> max 4 bytes(decode as max 28 bits)

You're obviously right, I must have been too tired to understand the
=3D=3Dsizeof() break;

Thanks!
Linus Walleij

