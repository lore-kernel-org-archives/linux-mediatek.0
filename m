Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8011B606A32A
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 17:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X7Paz2i1;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aBn8ehp2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kaDKA5hattAHds8mPaKS6kzZBkSpzp9jS+jIHno12Zk=; b=X7Paz2i1jhpxuh
	JdeXgfjl+b45FlHeLHgowfeglGkXKPZy2ChzRVZ+00ZmfVJgTPHFhirvEz66EZ6Vzd0oh2UoiPO8P
	4K0RwGJSFyuTo9cz18yWRSKWYXki9mGT6mR8LZp6mRoPGTQMYfFlhFcqFEjEn5U8mTWxqUzPMArNS
	q0uAUtXY8c+Z9hl5izzFJV/hELVbZrP2TqdLYqubt9eOAptTdCX8nSm6oQgyqaApyfqvrHprotedT
	ggvXo3snCaGSxrAyh+wiwfUrRXB6jXtPT28a/E8XzU9C70endPTpGAQRmTYAU2RBmxM028xdFSUg3
	l8WMAe/Jr7OdwDEEKyuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTN6W-00000006bib-0Htu;
	Tue, 17 Nov 2026 17:36:24 +0000
Received: from mail-oo2-x0a.google.com ([2607:f8b0:4864:31::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTN5X-00000006avF-2sV0
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Nov 2026 17:35:24 +0000
Received: by mail-oo2-x0a.google.com with SMTP id 46e09a7af769-862aa241d77so6282a34.0
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Nov 2026 09:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936922; x=1795541722; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kaDKA5hattAHds8mPaKS6kzZBkSpzp9jS+jIHno12Zk=;
        b=aBn8ehp2kHUsJzoWluX+5dS3yj4gAqlXV6aTNSEiGgDOmxDFG+06Ljmc/HL69vI5AH
         SihLBpMajImOVhKaiTbcmKMRgytZMSgHeWPWgKkEU5HYrQNDo5KystLEAmLpt6hstCSp
         6j4GDSZzLJzvCeiBkcc6gWc+E2H4UEIboRe/RzrZ0uCcEUjlNlc+azV3xGewiyXsaO2g
         ogp8E3yOH9CKZ3DkLBE4M0LhoUS7cSvNgnYpwn04y1UYUBJJtw/WGM5svGBCGG3YL/YN
         tvmtryDGIyDHgypfI4RLTQ1gBSgYZgxbGoCGH9Axp5dKIMKKqS6YBb5u9Wc5FVa5mzlz
         fPQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936922; x=1795541722;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kaDKA5hattAHds8mPaKS6kzZBkSpzp9jS+jIHno12Zk=;
        b=XAy17Fxy5Asm7NX/FE5r9/6SezgPFChRRMKL0y0ksL9PFJwhOwfi7VmxW8sAIWD9KB
         5JJosbYewWjWjv0jCixet7NRtwKJC1RSfvzzTnbpWppK8dIoQQTPQDZCHJvQeSSOmRrn
         6sHWQAPS2JdiVyPl1bM04R87dRSK1raTSpQim9UjnlIsCZh3IuAg/7olzx2x8kmcAaD+
         7qDYfh5NNya2fsYQvDoY6E8gwhwfv773F6yG0DdO/PJUTDCUDTgvQzkxEc5ZR5eqqDyF
         GhVI2FyncPS/vlkw4948Kl5UOHxT5rDyA34/1CKVuUlmB/N56l6lILKnLuJnj1s+xH2w
         vEVA==
X-Forwarded-Encrypted: i=1; AL+hErHWiPio+CKIuRIR7Nkc5oSdhIxKIyY33rSx0klBzUGOhBweqn8M+cGCb5gOlG8YOWGKseLnZzjlqxqmqqkwJg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/oNSva4+oGxA2WHX/3SUr+vsqBnl/U3xRj9QazxSM6VXRPhonL
	JsCOSX/bltej1rUO1oJxOBOK39gxpd+9dBSujku6EW92SpnVJNwIQ1Ki
X-Gm-Gg: AYBFou1r/1BYrYDXh9XeEXht4tmYp2YOPX/P3dWbtX9/cxIn8jAivlYxdf4Udvj9hL/
	DKW+GhgGN7lYN1FnbqhoNRjTwtQcDWy7tCmvpewRmW2I8fdaHFAIZ6H1WHbp8iZv+Qen6S4f9by
	zB289ZeFMMoPXBS/AvYF1omR66/H8AiwB3FH5JWhVvhmWL+R9YuiVLgbBg5ZMszDht0Z4Ne4XHp
	6TYqENd/6vbDd9EIQjY+1455aq6LtKqPRE/qeRPexbrCz2rq+blE1VqORuMnSgh2rloMx4dTJjE
	7qgxQ6p38qwxvKtvd+nSHbjAbPV98Bk0RzuO4Vsjh+mC8+J+c6vs6FWq0AMtz8ROKxmWwcwlWw1
	ERaRYm4n4/gGDtyEVpq1Xf9moMwdv1ut+xL4WUCBnhMt/MXrEI2W96HF/0zwyukx2nCk8WuR6v9
	n3SH599vtZrdyGgM+m9fQGiyozl9sLYXWqeOoNR+BKIGw3H2uxSi4CNHfhZ7Fo4nVe+Vkd5u+lf
	DYgYfGAzzrp8ve/4AsX0/MsEnRuQFgNVhwlaAcnzeFrs1wwwlYNq3lbc7ebSpom1zMDVUjhYcko
	Ap1W0/g6MdbwKkvlP+tLkLM4ZdGi5cF2m6dmDWbGYCzNxg==
X-Received: by 2002:a05:6808:1925:b0:55c:888:30ff with SMTP id 5614622812f47-5774240c0a2mr429178b6e.45.1794936922568;
        Tue, 17 Nov 2026 09:35:22 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::d500? ([2600:8804:5716:d800::d500])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b70bfeddffsm190834fac.4.2026.11.17.09.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 09:35:21 -0800 (PST)
Message-ID: <4c64aa52-2b75-427e-8f26-c2ef7fc5b822@gmail.com>
Date: Tue, 17 Nov 2026 11:35:20 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] iio: adc: add mt6397 PMIC AUXADC support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Roman Vivchar <rva333@protonmail.com>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20261025-rbrue-suez-upstreaming-mt6397-auxadc-v5-0-5c3c7a5a1851@gmail.com>
 <89c8cadb-0ccb-4aac-9b95-89f355beb24a@collabora.com>
 <60eeaaf9-57db-4ca7-b4f5-bdec111dcdbb@collabora.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <60eeaaf9-57db-4ca7-b4f5-bdec111dcdbb@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_093523_738100_EE99C141 
X-CRM114-Status: GOOD (  13.14  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Angelo,

On 11/17/26 5:02 AM, AngeloGioacchino Del Regno wrote:
> I reiterate - I couldn't pick the series because, of course, that one 
> depends
> on the binding being merged, otherwise the header won't be there and 
> the build
> fails.
>
> So I can't pick the DTS until the next cycle (granted that this series 
> lands).
>
> Cheers,
> Angelo 

Thanks for the reviews, and for picking the binding and keypad patches.

The AUXADC series has already landed. Jonathan applied it to iio togreg 
on 11-02 (the binding with the header is 8f809aa84698), and it's in 
next-20261116, so it will be in 7.5-rc1 along with your tree.

The board only uses the header once, for MT6397_AUXADC_BAT_TEMP (1). If 
it helps, I can send a v3 of the board patch that uses the plain channel 
number and drops the include - it builds on your v7.4-next/dts64, with 
only the binding warnings you mentioned until the trees meet. I would 
then switch it to the macro after 7.5-rc1.

Just let me know if that sounds reasonable :)

Best Regards,
Ryan Brue

