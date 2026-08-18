Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16A0C5DF70
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2026 06:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JYviVjsYfQntXFFeGvZpEVL58y1K7JWJvPcF4zznEXU=; b=gZmFwh74YXzjXOP708uYieQaVH
	AkqRLGOxqvzPDPSfTQkx1yeDVafoJOq8QewpoWLAhSFWplWanyew9Bp95I5k8D8eeCBRkWzHr7VqX
	3IrFNlSGcgyZx3aaFL6ue4DKPeqf5XGUVYYU64/ZGVIy1k3nMr1g4vxcPTDgq7PdlNtPqapuLOT7n
	ZPGvJGRswHnFqvzhEIeiUJDlaE1uI+7t6zgXgyYuPMI4T0PeCE5fKRI9CJyHozXgMuTH5qwt0hr2D
	sbfMLqgGbp0MvB4mUGNTBBkMkFg5OgpA6mJe+dDn0TudxLEPSmUQoglNM8q4fvxiqVPn9GZripE/u
	CKko/39A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwDEj-00000007Om9-2LIA;
	Tue, 18 Aug 2026 06:23:49 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwDEg-00000007Ol3-3W7g
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Aug 2026 06:23:48 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6a082b3671fso5838691a12.3
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Aug 2026 23:23:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787034225; cv=none;
        d=google.com; s=arc-20260327;
        b=YXqRyEojf/3XonMneDxx9xjn/jejYBKqC+5VAaV429aFP5l56Zu63Hfk7853DKXwZZ
         NZYqJMssT/a2mVDZpBpq4mEHwcMF2d0KpRhaVfUwBcIUH+asMrMoxTiRRllICowt+xx7
         Q3ZNYmqGjpMXTTstnzyJ7AsqjEb4BD8L6ua/3EIxKVsHGZGCwsmlAFgUcyVHVUXvAgj/
         +js+853gGzAyUA57nX885iRjxGZ7miSn43CZdod9Ck5qf3GffwOomr6dlWcoOPTNx0lF
         Vej+Z8Xsiw3TU2zOIPHx0U2f5WPSYGhbapK6X7tCt1f4zrA+SDxK/n/gH4eRqI9ABJkq
         pk9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JYviVjsYfQntXFFeGvZpEVL58y1K7JWJvPcF4zznEXU=;
        fh=31/660SQjL7f6SB0GIUevhjOsf5UrE6iktotm+UDu/0=;
        b=QQUpJHqaX2+H5McnAlXPcnRR5djUSSWQAutNdUP9C39hsbL5uT1T3BhutJWNZ1vJ7z
         ptuG+j6jKKta2ZkaFGyxFO9k3MdGOAPz4zCh7rzIXWHz9w/jKdsiLtXoqrT9iROaDeN7
         moyFh97hOBV795WV17vHt0HwP1f9ul3vh6pGPpS4z0Jr6UdUm2f+ydoAhnn7DPIA8zoI
         UBoQpfAZ0FNbAosKWo1MPqRQ2CVaAjQO0P72lwS1CLr/WL0cPq0yQgxWaJwm7ucwcWOP
         uTfiSbUDtoo2Oig8aZZLJnf/VtL32/hHC687ZZcbdaR+D6wkuokH0HoSPCsWhJF45BUl
         SCNg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787034225; x=1787639025; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JYviVjsYfQntXFFeGvZpEVL58y1K7JWJvPcF4zznEXU=;
        b=pqp699Hj3heJUX6l4KDdVQUDeg3+A396bU+4AeD7Z3TepVM+6vP7Ct/YBBbo5os7yn
         2tFuyFlcY5yZxRwUwZ+UUlD5feOW3CY8jlWeFePhvf4q/O9tiqxA/tgWPfKIwkEKFQLR
         jlXw7baYRff2qX/NR51SKT4tSqt+nZNuwFiSqc3RRR7mHriSFVLVjQQNdSZlz4GJ1HR8
         KYaEDbSut86zihmoMlN3uIRXYwI/imayD3UKPUU0O2KtyviPlhuhxp/x8qY3LBjtRQYi
         BN0EpGmepbcK/NjLyhgVyyv+zeFbr5T15csc2lBwANbf0FJZa02CER3cKcyAllyOEaYE
         La1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787034225; x=1787639025;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JYviVjsYfQntXFFeGvZpEVL58y1K7JWJvPcF4zznEXU=;
        b=MjhRmKi8RV1QgStQd2iloPw2Be9WUwrgd76QPNA9GYpOPuu9QjlT9Z6iV/IxxoZskt
         84hYMktm7YP5is6FprX1RS5kcTLI9f4WyClOHMLNf9NFk5rujh+sLVMOKNUZ5FdGWiYw
         mZPc1gG8u4JvSGuZXnbYR6KNWjhSPASIjiWAz3FOr3RFNLhlE+srJPUkK7kAwAoRrfQ3
         B400Z3rsDuI4Bp/6OkoUsWdcRI8F848PLCy8Pn6Yaz81BZdZ4PikBJZ1JGUKDHhTTaCL
         L74b4l+8DC9pWwqwVfpmz2uOeWmgFq5ZH1jQ8Yj3QfuLBul2F0Hm3MjlEGb5qOslsSW7
         J3tw==
X-Forwarded-Encrypted: i=1; AHgh+Rqc3paCslOLzSDw8ne0kqZ7Yhz9WPGibYSohHU3Hdi2myJCjLOtNo4zvI+l19GowtVT8IS5lI4i0WOVb59K1w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+Yaj5A0Cx1Mj8G8Xk44+MlJ3GX+wZgrERvoQpBRmZK11Ku6fW
	tLMnG1bzw3UBBPFvBoZMkkJI6S4rHBnn+szn0HewMEeO2SlmMGXPFcg2spDt/Lk9Vd9PYqy0WGw
	mxpP/7h+k14xIkBWjgyirBuBJDJrFGCtd/gMo6v0=
X-Gm-Gg: AR+sD13PX0wfaRW2sRiCdLYuFey/CHuFPV1nX90C9N23vknys2AbumpPfjmPO4uUzji
	CIWHJTJkLJRStKDMqtdl4L/OjpfQsLlxLfnl5MFdgE5Bh8lV63GQLT6ir3br9sqk6V+EOJbevUH
	KQVjYIo0nFjlnLkM8wY8ZOtXyD7Qwbda6GqTKRL//MUxUwqrBGQLMdG6ew1GE09/mOxArWtiP21
	KZj74vPwo9bjKtvTCimCNK0VAronWq/cNVzG474OredCGuk6gz7l9wZBaslYVs8cKH6xMNkjvZ6
	Q3cXStE5xNh9rpDKo6D9CuOkF19IROpA5EaUULiLZbqfAnrbzM4mtXDorpqiPym/1Jjw3AG+sOA
	sRvMySZcfh+lMapPX1ZgJo3ZNQtovc4m7DlhGgV5x
X-Received: by 2002:a05:6402:5d1:b0:6a1:f95b:8cff with SMTP id
 4fb4d7f45d1cf-6a3e0fcc3aamr3228499a12.1.1787034224858; Mon, 17 Aug 2026
 23:23:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260817090601.1256389-1-pawlik.dan@gmail.com> <20260817161756.5fd2185a@kernel.org>
In-Reply-To: <20260817161756.5fd2185a@kernel.org>
From: Daniel Pawlik <pawlik.dan@gmail.com>
Date: Tue, 18 Aug 2026 08:23:33 +0200
X-Gm-Features: AcwNN1VY43fpVsyllKSRAZ5AdHgJn9CS_GzFXYhOAY4pGHpCjZSi42ezqsoQDyw
Message-ID: <CALC2Apj7rQv=6uUqaqBjfJ9yO+VCddQqHB=yDhXH7+QUCh2JyA@mail.gmail.com>
Subject: Re: [PATCH v8] net: airoha: npu: use cacheline-sized buffers for
 mailbox DMA
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, lorenzo@kernel.org, win847@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_232346_900290_91F51830 
X-CRM114-Status: GOOD (  16.22  )
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

Hi Kuba,

You may be right that the underlying issue is the SWIOTLB/bounce path on
EN7581 rather than DMA_BIDIRECTIONAL being wrong in general. W1700K does
show SWIOTLB enabled at boot.

v8 does not switch to coherent DMA; it only rounds up mailbox payload
allocations (dma_get_cache_alignment() in v9) and maps the same rounded
length with DMA_BIDIRECTIONAL, while the mailbox length register still
uses the original payload size. On this board, mapping only the payload
size regresses probe back to 0.0 even with the larger allocation, so the
rounded map length seems required here.

I have not bisected whether that avoids SWIOTLB entirely or just makes
the bounce/sync path behave. I agree a platform fix would be better if
the bounce implementation is broken. For now this restores NPU probe on
W1700K after 6f884eb.

I'm happy to gather more data (dma mapping debug, swiotlb usage, etc.) if
that helps track the root cause.

Thanks,
Daniel

wt., 18 sie 2026 o 01:17 Jakub Kicinski <kuba@kernel.org> napisa=C5=82(a):
>
> On Mon, 17 Aug 2026 11:06:01 +0200 Daniel Pawlik wrote:
> > On EN7581 + MT7996 (Gemtek W1700K), mapping small caller buffers with
> > DMA_BIDIRECTIONAL regresses NPU version probe: the mailbox completes
> > successfully but WLAN_FUNC_GET_WAIT_NPU_VERSION reads as 0.0 instead of
> > 0.1111.
> >
> > Allocate at least SMP_CACHE_BYTES for each mailbox payload and map
> > ALIGN(len, SMP_CACHE_BYTES) with DMA_BIDIRECTIONAL while programming
> > the original payload length into the mailbox length register.
> >
> > Tested on Quantum Fiber / Gemtek W1700K (EN7581 + MT7996), kernel
> > 6.18.44, including two cold reboots and sustained WiFi use.
>
> To me the fact that this patch helps only proves that the swiotlb
> implementation on this platform is wonky, no?
> IOW AFAIU we are avoiding the bounce buffer so things work, but
> the bounce buffer is still broken?



--=20
Z powa=C5=BCaniem,
Daniel Pawlik

