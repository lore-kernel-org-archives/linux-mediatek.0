Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC134606A323
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2026 23:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SQZarfy+;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mUjHI7MB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RPX+RWHDa83ciD85+v8NE/MCh3vpHSDKFtDo6LQXVqw=; b=SQZarfy+TuxNyTluy0OrbX8SnY
	+ahYgY7eqa11Kaio+fbTc2+wZhwp+eSRwEtqiI0ybIxETP3vzMxmPWeeWpoycEGtEr/QsFvAobzyS
	oViljHtHprQdiWE8f3ksyELrxpeFaipgNzea4favKkQYES8GVkglECOjR/vcmhrlIo/+yWGEIE22a
	YrYgRWC638Eo78mUbogXg14sns5eiweIUuhES10NxvpVjQwpe5/2b4aYDyTHuMD7dFBXAy7haI+X1
	XdAKeaYcQr5aF7ljo/H+Mqr8xfsUf0J+KbOhiPmq1Yhqjlsm9pA8t//kjuOVO43F31Ls9fiCDadP1
	JTSND+tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLTjU-00000003OXG-1uM1;
	Mon, 26 Oct 2026 23:04:00 +0000
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLTjR-00000003OW3-4ACC
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Oct 2026 23:03:59 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-7cc0892f92cso1153692137.3
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Oct 2026 16:03:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793055836; cv=none;
        d=google.com; s=arc-20260327;
        b=EyFGOg+6MobjUPNS+5BgJpc2SdErZ9N2c+AXrNFXOuRI/XYJTcPcp6TegsU6uue2Dh
         omEY0QF2Hj8KmZsFUCmra5LecC46thKxT5Km7NwPYTOlEQxeC7DkBQbjplThJZ7g8dms
         WpGphMbrs6Xcrm0OkgFyGNzctMRsPFY1uX3aIPRvS8Maa4lDRUNPMJhXBMpew7Qo+ECU
         hnAydrsb5HJGHfZgumFI+fM53PhZco7XVrqJ7vD/WgpovaW5oh/ZUpxnv7QSghLadYBS
         SGQUkki5HkBfI/jDfqzUJIBPnJYzu9S9zgv5wmNAfDVd2Gjkj9+v1TlhXCZM7rRBg8Gn
         RmhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RPX+RWHDa83ciD85+v8NE/MCh3vpHSDKFtDo6LQXVqw=;
        fh=fMr3Zp3H/tj0PNlhqTXrulak82k11a+pcMpvcsaToQs=;
        b=gOClXlk2EkmeKk9KYsiFDo7vOkMORE/gndosEhKowKJ2/T0fUneOKQWMI48UPWXm3t
         qgbBdmbJjy/TpWgOYeBpoXs6Jj2B6cekknUvUydbG8ngqOSsJxTqPK+N3+f9oIyY9hEQ
         XWTXjoL9tnFJlSktJxTQF54B5N50ExbPuV5okHMOQLauekAoR5lVeiyiyMvrJs/UCowa
         gL30iNfZDGiuFi05dCPe21wic8YF5gDJIYsAEbd2Cy4qykHMVvpUfegbSFGU8cAdTHLA
         zQYbd1D1IAR0XxItlVNuMcAIeBSGOk9aBReS3OrpySQTigLY0+4oGyB/spw77iSNGC+p
         LSdA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793055836; x=1793660636; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RPX+RWHDa83ciD85+v8NE/MCh3vpHSDKFtDo6LQXVqw=;
        b=mUjHI7MBvjTkEruNTQfsBfAlbj0bV+P7ioHlgjgGoqVNhAv2uMdjR6BiVoJdzUCd/J
         VWBsqfZoEpD2hf5Aord8wQnp4ku1rghnI+mdJXEfqSvHscV6xbEFpPMkPge16iSVnI7Q
         xJpkuYpuGMLaaJDfHhtJ9Vqt7Fwj+3FngJEx/wC0Vl9EBzPMyEneiS1R9bQ8u7lFhC04
         +/Nz4PyeYfS1rd0hGXmRW91JkIvJwhyyfRvRbAgOjEIJ18im9LdhcJu+WYxa3W9Qn+KI
         M2xyZBzm2SF/uZgWEYijm4Ql3WceVyhJKKjfN82oJ94MD7MQNPJF4EmHyYa5Z16dVO/P
         2hlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793055836; x=1793660636;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RPX+RWHDa83ciD85+v8NE/MCh3vpHSDKFtDo6LQXVqw=;
        b=DLDp/cL0wneCllh8OUY6QK3GnwoQFQgykfykdWSpOu5BN3In+TTMvcQsIBsHY2gBut
         2hWQUF9u2g+piVNicOvz+GqUEepsOrIHJ5u8Ldj55fGWcfxvn5uyec0/cYGarIlZPnHi
         qmmEQHQEZVZpgNxDxmBD1lKNV+UwW+6iKBVVnNUY+RsTL5WOwvuSs8jPoDbtzD1eLyF6
         M/eBqa1tMfs1FoffglAGaCdzIu+iBKEsc6rdId8oPtjiEM32UKoQvxtXd1BRarSD0xCl
         0RvnGOUV574Ep73ghCb0ZG/DF09NvusGJxfVPnVdmL8c3i9gmMtIen5pz+xJy5QM7Ujc
         C4ag==
X-Forwarded-Encrypted: i=1; AKwUvByAjLbDaBRLyevcx5AQCfQzn5nBz/4+O+e9RfYOmjmPNtSgOt9JVvsFHxebPlGUs15SkxYknRWbTmK8MN4lKQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYIakeZZTfxm0IVK9HWoEGOXxLSbp0JxPMfuyWCtaIq7y/BR/2bN
	KuWy7iswDyWh8e2ZgTSSnvvtZTPC2MCwyacGdHlQaVQRcLZgnks42WNCKeQjANtszR/3Ws8xqyc
	1Aa3Ggs8dMhKhwzyOQkA1U7yCObW45Nk=
X-Gm-Gg: AYBFou0A8P7oGWWBZq2PKPZYcvdzkUzFEXG8ugXCSfY8HXlolhoRvk7+C/TArjYJBwM
	Vbz0Iios174Qb1djxmmI+MphLsaIDfifqNiPC2rPj73OWwNVEEBRjJeabrJFJTdCbHxToZPdR4n
	KgPw5/NxMM4LyxlQIbHSp1RpiEWOPNpXfkufsAZeVgpsOBPL8URP/aRcH1yFBDNQbFrv8rQvTDv
	/EWjWBx0dKxk1IakJv1bT18Gx8Sfw0Qk/uH8Caab+I8DY91umbcCXyvkRneS2z7iIx+8zlTE4/n
	Bv20tg1tL4FIb+4Jchr4QB+2IwzCQ0ON/vngeNky92XWqaaRUzoWOQw02YTMyaSyL0dVxfcr/0c
	pVbcXT9aYJLEIDxRT8kfFCfInGP/bc/1DrioOKuMBw+/AlJ2BURq1tWC5vLEfmMOoPw0=
X-Received: by 2002:a05:6102:5049:b0:7c8:fb4e:a3b0 with SMTP id
 ada2fe7eead31-7ce5ccddc2fmr2242244137.12.1793055836538; Mon, 26 Oct 2026
 16:03:56 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261022193853.670625-1-ansuelsmth@gmail.com> <at_arsis_PFKDFxb@zenone.zhora.eu>
In-Reply-To: <at_arsis_PFKDFxb@zenone.zhora.eu>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Tue, 27 Oct 2026 00:03:43 +0100
X-Gm-Features: AclHuK9hoAjXwtHctYpz4oUv0zbqoQn_yeGbBI3iJDzHErUSMIyJMIBdwhVkFh8
Message-ID: <CA+_ehUwY2Z-qvrX5+sdZdrtpF-QtAozi7fHbV7Zz2cM-5UzPHA@mail.gmail.com>
Subject: Re: [PATCH RESEND] i2c: mt7621: fix copying uninitialized kernel
 stack with reduced page_len
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Stefan Roese <sr@denx.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_160358_041627_1DCDD406 
X-CRM114-Status: GOOD (  14.86  )
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

Il giorno lun 26 ott 2026 alle ore 23:59 Andi Shyti
<andi.shyti@kernel.org> ha scritto:
>
> On Thu, Oct 22, 2026 at 09:38:51PM +0200, Christian Marangi wrote:
> > When a page_len is less than 5 bytes in mtk_i2c_xfer, uninitialized kernel
> > stack data is copied and written to REG_SM0D1_REG. Equally on the read
> > part, an unnecessary read is done.
> >
> > Guard these extra copy/write and read for the page_len to fix leaking
> > uninitialized stack memory.
> >
> > Fixes: d04913ec5f89 ("i2c: mt7621: Add MediaTek MT7621/7628/7688 I2C driver")
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
>
> BTW, this is not a RESEND, this is a V2 because the patch is
> completely different from the supposed first send.
>
> Next time, please version it properly and add the changelog.
>

I used the RESEND tag for this as the first submission was
completely wrong and didn't reflect the actual changes.

(file got mixed on saving and committing)

Had to be more clear and maybe just say ignore the previous patch?
(a v2 implied that i made changes to that patch but there weren't)

Anyway corner case... sorry won't happen again :(

