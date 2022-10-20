Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94EBDC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 17:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OfS3PAbgU5fdM3mlH/Doym0ZOyotvOhqPPNXIfWXxXU=; b=VVLGC9Mp5ajObEztoepAx8nFoC
	72swXI9bmjnkd8Tpp4cCOUfMfWVND7eh9Iuu57k2QrwnjOzjY/rxS/ZUCGhtbk8nsUD4F0XJ8CpKy
	0b4Bv7QfsU+EYN0K3r1UTnmKcDBCGytHSRurUuHaPDN7zTKfbfTqZzaS73pYUOhP/alwv8GiQCcjn
	lJwUbvitWIRVhDnf9E/9opp2wJcQaX2rtTXKjv7PS2ysgs8fU3O1Kr1SV4fPmisI0j9e0P0cw5SJ0
	7dG3rn0UoxRriMzxAwpmPVNkQgrNssE3n2YseZR6vFpj5qnYmwTZN8GmlF7CprDN9rT4l7r+pDBu6
	r3gZc7JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olZAf-000nv0-32; Thu, 20 Oct 2022 17:17:29 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olZAT-000nq2-OG; Thu, 20 Oct 2022 17:17:18 +0000
Received: by mail-qt1-x834.google.com with SMTP id l28so25874qtv.4;
        Thu, 20 Oct 2022 10:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OfS3PAbgU5fdM3mlH/Doym0ZOyotvOhqPPNXIfWXxXU=;
        b=fvQf7cxLfylCVvbDZ+x8m5934hC7/FjZTwkxfhh3MiC6/bogZ5zzLWAZmnQ/U/RXr8
         aTokiieV2OWXALr13T7iuZxD0GUieMX70xMSKxgP3ZdNp9KqoqfZs49i0g7hHNcIZPCy
         noaz6+u2fWcFmfmZfT8dZ49Y31BW5mTLP9SpWDtUhPUNIPXO14sfY4stxlTTGX1hXMzi
         rrvv+SThHT9aCh8hoLSFm+MS8BZKqf8YzglB8CIh5HEqB2GQojYxdSYF68hV/982nNO1
         cILj3V/9UgNtWfPTl/P5qPMm1gcHG7LGlHdjZOndXsH+E4xx158NwCgw/yLE34tgKzZ1
         Jmnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OfS3PAbgU5fdM3mlH/Doym0ZOyotvOhqPPNXIfWXxXU=;
        b=4iMHQlQ3P13dpGTurFgSdnrfSXN68E5iVxbiq2XswXzv6DwAL+hdgTnadZdwhpw9vu
         uqOWrbf8XnnCcb1bircfdiZGtmKi9kGNZUQituC3VfKL9eom4drMsO3Ji0/ev6ZY0az5
         fYFDepWVmFWwp6QyR1ioQpWBiTMCNj2lKAlEhElBxlOEBGfa0rbBl9R/eo6R83gU0a/H
         6b4BU954UfPyp8rQ43KCdsJPmCnLcIKHrr/VpkWe2F5FhqencblWE5CL1oLaXqgrkMMs
         YB0p+AEdZHAjvPXMxnp1Rzqy3YgtokFFMiyTMm/QqQiDOX8Pbipt3h/3e2mpPhVZit2c
         U03g==
X-Gm-Message-State: ACrzQf3RbIWy7I0pz1qG4qG9M3yF1JRGiGxBhcHvkT8S20wwlQgipNci
	ZnY5DEDwYwsr1wLdPsJ8C550nSlSrzZp487zdrE=
X-Google-Smtp-Source: AMsMyM5kZtjjaVCQaySLvbFxD66drooBMyE2rJEbxk5ad+kV8Pq/WTP4J7aNmMAWfqB2HNK0Cwfoa2OQWAwZ0ngtzVU=
X-Received: by 2002:ac8:7c46:0:b0:39c:fa92:a27a with SMTP id
 o6-20020ac87c46000000b0039cfa92a27amr9724358qtv.61.1666286233828; Thu, 20 Oct
 2022 10:17:13 -0700 (PDT)
MIME-Version: 1.0
References: <1666283513-17005-1-git-send-email-u0084500@gmail.com>
In-Reply-To: <1666283513-17005-1-git-send-email-u0084500@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 20 Oct 2022 20:16:37 +0300
Message-ID: <CAHp75VfWawPZyqVQ5TJVPQiW+QANWvnougdiDfvthuNhfrzTbA@mail.gmail.com>
Subject: Re: [PATCH] mfd: mt6370: Add the overbound check to prevent the null pointer
To: cy_huang <u0084500@gmail.com>
Cc: lee@kernel.org, matthias.bgg@gmail.com, chiaen_wu@richtek.com, 
	cy_huang@richtek.com, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_101717_809191_27C10739 
X-CRM114-Status: UNSURE (   8.42  )
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

On Thu, Oct 20, 2022 at 7:31 PM cy_huang <u0084500@gmail.com> wrote:
>
> From: ChiYuan Huang <cy_huang@richtek.com>
>
> This potential risk could happen at regmap_raw_read or
> regmap_raw_write when accessing the over-bound register address.

Functions are referred to as func().

> Below's the issue reproduced log to access over-bound register with
> regmap_raw_read function.

Ditto.

> [   41.301385] Hardware name: Raspberry Pi 4 Model B Rev 1.2 (DT)
> [   41.307296] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)

Please, read Submitting Patches, and trim your commit message accordingly.

-- 
With Best Regards,
Andy Shevchenko

