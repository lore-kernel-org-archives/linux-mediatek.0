Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6FD4EE57CF
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Dec 2025 01:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/c6SVq3C/6p3QmBlE8qRyzuxT87KjBEE1uJ/bQ91nLs=; b=ZJaR9lLadb8OBITAULkUoT1TxF
	xAJGkEUdiXvvHPl8ntI0oLRCKEEiETsGK/8rXi+N/r11YWiPGXHCsoEga9MPlO0J384sB2U6tJK2K
	izpCuztlq6NKq0VbF2bm7n1+vqkiQ7b0CiIwWo3raDJsQR76BiI7VheDqA7FuTTy5EB0Igxzkb3yb
	ZLzFSgGdWvwch2zgrWjQKp3N1tBM7IOP153zjhRGE4KA6DbUmAQmyHlktuRGolziu7MdihbUloczc
	eYhYfkZ8QHJdPuANlykIgEjdhsoSnUrhIZU0xT9DPifuvZ4ESlsNizc7LMPAHIPsCbNTaK9Nk6lR1
	s/sUKyJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vakzw-00000005WXD-32jF;
	Wed, 31 Dec 2025 01:27:36 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vakzt-00000005WWT-3PWz
	for linux-mediatek@lists.infradead.org;
	Wed, 31 Dec 2025 01:27:34 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b76b5afdf04so1571165166b.1
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Dec 2025 17:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1767144452; x=1767749252; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/c6SVq3C/6p3QmBlE8qRyzuxT87KjBEE1uJ/bQ91nLs=;
        b=YqEhgryVeUb6XBIn9HCuuLUi5GpaN7rVnwerjYICtHwfka4ibnBNSYS1FJtWvYFqCY
         AZ4U+w+cccuYsV3FTMnIuP7gm2UwnMtUGq/BHM3VB6gm+ahao8WTGOpUR1f77M9giiX4
         3F029EcGV25AmlcD2uSd0zmhoyGiTmlr1gMu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767144452; x=1767749252;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/c6SVq3C/6p3QmBlE8qRyzuxT87KjBEE1uJ/bQ91nLs=;
        b=MWTXhMBrvN3toIFE0MFtsEz7HG3+tJeyQ/VO14+vTz2U3juto1D6+vafmrK6a7xeE+
         wFIqzfFVIhL+j0knhiO6PtpRX38ArYSYQnnT+5/wtfZgOx2GlKqFhQA1qg9xL5dye5mk
         FsM/DtKexm5Z+YRIYlU6BaO3HqyJf8CmZm4WR8eqZ5K1kFcwU0/kqna5YOWbhPCXzPc5
         aN6YcN3ARncqL9mOleXz5C63dKZqGxZJf3cvBQzm1wYS8srwSbunUKbwlb1YCT9mOsLP
         vUZEasOupJwyBmVuVoHaXSPRkFBYsOuJsA9c4DZgjVMIEag8PDrXTd2PRjR77RykHFnb
         6aFw==
X-Forwarded-Encrypted: i=1; AJvYcCUBtLDMBQ3lj3dq/qUOb228zZKueg88O47nOZkr7ys0yvTvXX7sy57X2e/2OgSUEyKE/tDsPLTO8vmXivPy4Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyPf6CdbKS1sJLuIrir9HQID9+Uin82lpVeMqaA4ifGXJAsNAxM
	Lu9OkoXo6c12aVxpoAkqRY9sv/NNjinGiJv09lx1bPVVIGstntvfdWFqqBnHwOnkIxp+b5x7lnL
	kIdcsFRM=
X-Gm-Gg: AY/fxX7YQlOEAc4l+P9Mp38w4UpkzEBdyn2blajzcNMrlwW/8HBNqKKSNJCfPyyTdJg
	qUTChCdYH5eqz6JeoGsCOFY+O4BF2VShWTi5GKh53ACOdUCVuDzTDwquxh/ZfnJZ+Q4lHt0yLeO
	NquOTp82FgvifFhFq2l/9TDQceo87LqimOy21DE4CiCPhN15uZ1SiHnJGhpZ+nMlXEDxht391ii
	4ZGSl08e3Ih3Fqqe5YKIOkQqLNlqqp/O0ZETrD3fdVUn5u26vWIRdO1zEyMiQCCtDKfv1vZxrjx
	zrVQQuI+rYHo0g1IEdEZ1Kv0CfaWOrEuPo87IfoxAzAmPTML/nnPtMp0Egrjww5j7b5gGKctjMi
	VXI8MC3pXE/PDuFfTh8ACFvAsd7ZvrIn/56XkldbkZ1A6XZf/6/07gLH9WjzYBPjWwID1Em3mix
	pMkiUOmkIsonIW+UlsUCD8uvc2Y6LU8mvNi4qd6KX9TWLY6yF1d9phfWljyJ6e
X-Google-Smtp-Source: AGHT+IH+ibvrZNx/djfv50/k4ptrwCLMQYpppz4nqMBWYbYw+rQp0XVX8F2/AHQgbFIMNwouq7DFCA==
X-Received: by 2002:a17:907:9811:b0:b79:f4e4:b55d with SMTP id a640c23a62f3a-b80371da8d4mr3952422466b.51.1767144451664;
        Tue, 30 Dec 2025 17:27:31 -0800 (PST)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f511fesm3853871066b.65.2025.12.30.17.27.30
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 17:27:31 -0800 (PST)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-64b4f730a02so17395818a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Dec 2025 17:27:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXymWHs913fXlJ/lLjfgukaJ80vBZZu2BJ/7qmUJa+geydeUvKaNYKSgrhWCv8eouOM4KS/Ym4s0AJwaINRag==@lists.infradead.org
X-Received: by 2002:a17:906:c108:b0:b6d:6d66:e8e9 with SMTP id
 a640c23a62f3a-b80371f98e6mr3867217966b.61.1767144449430; Tue, 30 Dec 2025
 17:27:29 -0800 (PST)
MIME-Version: 1.0
References: <d7f3b00d-beec-41f0-b157-7cfb871f9a46@linuxfoundation.org>
 <756e3f65-b2f2-4da3-985a-17754a7a872d@t-8ch.de> <CAHk-=wjO-7uR5HBi-MFnkxAxjhpgfbAQ+HCMKPiXFVwM+AJ7tA@mail.gmail.com>
 <6fc04df5-b753-4b2d-b978-0e59a7f48ff7@linux.dev> <c1304430-dd7d-437b-8744-70af9ca85c0d@linuxfoundation.org>
In-Reply-To: <c1304430-dd7d-437b-8744-70af9ca85c0d@linuxfoundation.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 30 Dec 2025 17:27:13 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh6WP0Wq=rbC2Md6vsFrV-+nvDjxgfx9NpMzUmVFNkJ9A@mail.gmail.com>
X-Gm-Features: AQt7F2r8OZntlpbgM6EMdT1QVs39OIAPruiONmqMbrsqySDpE_sREcU70uzNBZw
Message-ID: <CAHk-=wh6WP0Wq=rbC2Md6vsFrV-+nvDjxgfx9NpMzUmVFNkJ9A@mail.gmail.com>
Subject: Re: Linux 6.19-rc1 mediatek mt7921e broke badly
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Matthew Schwartz <matthew.schwartz@linux.dev>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Eric Biggers <ebiggers@kernel.org>, Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, 
	Mario Limonciello <superm1@kernel.org>, Johannes Berg <johannes@sipsolutions.net>, quan.zhou@mediatek.com, 
	Felix Fietkau <nbd@nbd.name>, lorenzo@kernel.org, ryder.lee@mediatek.com, 
	linux-wireless@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, 
	shuah <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_172733_861745_2C7D8275 
X-CRM114-Status: GOOD (  10.62  )
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

On Tue, 30 Dec 2025 at 15:57, Shuah Khan <skhan@linuxfoundation.org> wrote:
>
> I would recommend reverting f804a5895eba instead of trying
> fix it. Then find a better way to eliminate extra newline that
> shows up in dmesg when firmware build date happens to have
> a newline.

Yeah. Let's revert it.

And the way to fix the extra newline is trivial: just remove it from
the "dev_info()" format string.

Our kernel printing logic will add a newline for the next line anyway
if it is missing (unless somebody explicitly uses PR_CONT).

Can whoever saw the problem confirm that just a revert and a "remove
\n from that dev_info()" fixes the output for them?

              Linus

