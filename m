Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4BA606A31D
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2026 19:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZkXoTPYh;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wgMiMrfa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lTf6iYLY7vvpBq4kT2Dpb3iFQH2vO84EvM2eYDMRkJ4=; b=ZkXoTPYhSl1LKjFSuoa9HLXKYn
	/qIKQP7/x60zr/dwtQOn9E2mzZcq+FLymYLidwbx3cCk1VHmSeHNC1y/eDLhEous836Dm7vIJRWtU
	AIEQw+sI7TH8wf7TSitlLnj+mmlAP5IBt/A9iam0CL0h6Ajzf9RNE90gL/aLJam/LI+NMXNzGM2OI
	Vso5FvJJMzoHLYKsdZpmPaplmtyFpv/PG+itqSxLpbo9hTdQRSmNC2PPwvI6UmlqEsquXNVk6IiqB
	802YxQN2s1xlf+y1K449uSWLiBaoxibeYapQhf9ozMceitj1naVPIivbs2gPRvUjUatX+CdJ/fwUd
	4j2qpOwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM9U7-00000007s7W-11d3;
	Wed, 28 Oct 2026 19:38:55 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM9U4-00000007s6j-3rwV
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Oct 2026 19:38:54 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-353804b591eso2195463eec.0
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Oct 2026 12:38:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793216331; cv=none;
        d=google.com; s=arc-20260327;
        b=H08M4tzjOYC8AG9gWQxQaIKktTiDy1Z1MzqOuZxeJBIqgKWKPD8onwaGJA1xfC8bpm
         NyBRLfdf8sOtvP/UjpIZszR+kOrQZoLomsq2cYswrax6QGuTG9xTbQSVE1IpUBbKOBFk
         HBCHQdO4bvJs0PoB/9wvGk6CYPWbh3FbkWhNgf4vdkKTjXPfXXgBFfw8a0dN3w80jteV
         kix0YOv8OG2tT1sICo5ueG6tYfEOMYeKw0KYmI6IGLKxSuoFqCtE6c2w4kt/0cpMC8Ap
         YunaiHzJqOk3tk5KCCJnWPj0PegnZnK8UWsiQ8zn91EEeg04my2bL9T+pDBiMHKL+u2w
         P03Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lTf6iYLY7vvpBq4kT2Dpb3iFQH2vO84EvM2eYDMRkJ4=;
        fh=7q9slQwJZ94/e6e481MFJgYPeNForZhGYqL2OGSLeAY=;
        b=HmWPJ87HyNerw+RS6dxRLpW+NF/2UnyPlUdEAOdAEZcGB0Qu1W8+D8bPqN5ISshdsk
         de1xu/67bLpv4isE8sNMUMbHe2wXyRna+91VXBm+RD0z3mXZezU3vUOGPBwUO1S0kcb+
         OckPtjueafQf+dQkUY/XEzTgPug1mulfu/ULe+dWtUkT7FhTAfaRj5fd+eTchCyRbYNE
         WXcEcnFoh6k3RqiXW1fyPmq1cslEY1Y7ocfaJoGg9eYsGiGePOdIjQwDhNYn+cJZmWwU
         xR5rxiBIWF665/Uo8vw+rX9tCUQpqhzHDPBHd+gymraZy6c+pjXZdA125o2veKPr3/Te
         I22w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793216331; x=1793821131; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lTf6iYLY7vvpBq4kT2Dpb3iFQH2vO84EvM2eYDMRkJ4=;
        b=wgMiMrfapeupL2YUtnxbLalP0vA3D3w7/IFHLWl8gZuXl3bBgngEOQwTKDR9wrJnyo
         kkv7NXENVnxwFtgvozDe/AhtQSbFGQAY5WD/FozdNeb5XdQ4fwTNXtoI6hUNc/6M4QP3
         CsrHBJOHQo5fgQh54ZLu41h1jL6H2LbhjPWGopAC+CCeZa3C/G6lDdkQH4wL05jMPbDC
         5XXk9TE5POj2h1n7Jbd4izg72IEGoWyX7y9HeqC5N9h6zMukHj3EhGaneyEWgntZqcMP
         pHNUDI8cZfJdhACsRZjblJvQhI753oznb+bPoF9qP7pR73L3hfmv6e2UrSD3ZHnQrX66
         peSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793216331; x=1793821131;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lTf6iYLY7vvpBq4kT2Dpb3iFQH2vO84EvM2eYDMRkJ4=;
        b=QHsDfYagdw1yQi9NYV8OQnk3Qt+JUuH/MmIYDQI9fTtSoXoD/tBkZHan5GzopsFATs
         LXlSqwZORCmH9J4umVI1ru0p93rAD477ezKuK0PcNQxhvjcdvHOAj2xovtcxHijIP1PR
         m/e6DPU1zXw7+WNs1xCd1XOPnn0s4SsMhE5GOBeaZfHxsSRaIshG2gVm4c9MnPnrEHUu
         mCa8vaO2av+Frehh8dXoFz8jso/fZEyjB/SzwDi3j7ejJkMgct3AtRax8RojEcHG0ub+
         taHtaf3fXsr11tN2mexETqsdSD1vtV1SnfHu9DciPPJw6ceVMM7ccNU7FaRRxmnm8WKY
         gMCQ==
X-Gm-Message-State: AFq9FYLt6uBS1mrvjy7LK5bFSIDz7UZrzkkx1+iG9g1BUOifl1AcuVTf
	9gOaaJDk4tU6KxGeY8D0+JSt8nxbcuJoW2PG1Etxam+zrPLYBdNGhSYsSyWxz/uMLC0UmJMSCy1
	Y72WB8hMhunSy349mfkyMokhgwiXiAaHAj03s
X-Gm-Gg: AYBFou0HThNTFNfJORx9FcgrHnBvqRzOYFVHKkpj+q7ZItAj+1UCjhWI9Rig6NmLBUS
	xSb8tskKXeh1UhhvgzJg4qKRQMrVKulywGC9mpa94C0mcBO5qk99oe+p8C0fs8cchouvHG2uSKq
	p59XIb0TvKMJMpBga+Og0qS8q+8+s+CTXVSW0w9n/33p7fmQqsKRynUnQpLLplLpwk+UOx6++8T
	OudCEIMVX1ZsDRek2d1k7F7D2vUEwiWrh1s/l6fbEbqmawy9csyzM88I2bSWyruGpecPmIsv4Pr
	4ETh4pjYNLNi59lE/cCEpzjZ77DsVh+YRGKkw46Ys8mHQXZ6hOn3V5npXeTnS9xLF/oCVjcUwiZ
	RTQh9SZ0LZLiTtpGqhf+3l3cCY2pP+3A+LMkp/SzEBatDLqz/9Y6LLIoJKzDFOyNRrRX86w==
X-Received: by 2002:a05:7301:dd92:b0:36a:fc6:b4f8 with SMTP id
 5a478bee46e88-36a2027e9fbmr4331055eec.2.1793216331264; Wed, 28 Oct 2026
 12:38:51 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260523140242.586031-12-maz@kernel.org> <20261028081716.75598-1-timpambor@gmail.com>
 <86pkwuxm4p.wl-maz@kernel.org>
In-Reply-To: <86pkwuxm4p.wl-maz@kernel.org>
From: Tim Pambor <timpambor@gmail.com>
Date: Wed, 28 Oct 2026 20:38:39 +0100
X-Gm-Features: AclHuK-CTu5OJM5ETICigZlSd4-EC0-hTDGn3i0OSl2ezQ_bIQ3xKMLD70-Js7Q
Message-ID: <CAOX+r59k35CMroDZEtNVbiBMfgBKVQ+Q8F_+J4vpSwN_J+Ui3A@mail.gmail.com>
Subject: Re: [PATCH v3 11/17] arm64: dts: mediatek: Add EL2 virtual timer interrupt
To: linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_123852_959430_4EE799DD 
X-CRM114-Status: GOOD (  17.23  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

+cc linux-mediatek

On Wed, Oct 28, 2026 at 9:30=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrote=
:
>
> On Wed, 28 Oct 2026 08:17:16 +0000,
> Tim Pambor <timpambor@gmail.com> wrote:
> >
> > On Sat, 23 May 2026 15:02:36 +0100, Marc Zyngier wrote:
> > > The ARMv8.1+ based CPUs used in a number of Mediatek SoCs are missing
> > > the EL2 virtual timer interrupt. Add it.
> >
> > This patch doesn't seem to have been applied along with the rest of
> > the series.
>
> That's the SoC maintainers' responsibility. I only look after the
> driver code, and rely on people spotting the warning! ;-) The fact
> that this has been there for two kernel releases show you how deeply
> these maintainers care.
>
> > After updating to v7.2.11 on an MT8195 board I see:
> >
> >   arch_timer: [Firmware Bug]: VHE-capable CPU without EL2 virtual timer=
 interrupt
> >
> > With this patch applied, the warning is gone and the EL2 virtual timer
> > is used as expected:
> >
> >   arch_timer: cp15 timer running at 13.00MHz (hyp-virt).
> >
> > Reviewed-by: Tim Pambor <timpambor@gmail.com>
> > Tested-by: Tim Pambor <timpambor@gmail.com>
>
> Thanks!
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

